Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5037BCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UW/NOfKa9RFqrpSy7rSdIS7Uk0N5dPhIbH1nTQbHg1w=; b=4DsZq3q6+J2b/sLVyymgDK+nMh
	+KIr3Gimpr4IyNVofelIwTAv+g5ZnkW0djf31wHGdIW6PCICj3ZU2eUaIhB41tLLEXCvSe0cqmOxb
	Y1Oh4XAh4UuDt6CMZv59STdLxsX7L/h841XUIcNJfRCSF3FjpE4qXspnVYOJQXp+9NtOVWFCxiJFl
	g19hGgzw22xVBbuxcoaWqJFYKm9lT2EhRV7UjSaiVVwpoMSSbdM9qm2yz9k8v1kdaaE0WVlyzIgxc
	VFRcbcWOv/vO5tv5tMsZiToGR49wPgC0/LP1aiAoyVP09t24xbOct3BZYVimS3bN4QCrAYUR8V2bi
	RzWToEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3iH-00000009WVB-2NEz;
	Fri, 12 Sep 2025 13:21:17 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3iE-00000009WSl-1r8i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:21:16 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cNZhL2Zsjz6L5Gb;
	Fri, 12 Sep 2025 21:16:50 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 4654B14038F;
	Fri, 12 Sep 2025 21:21:07 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Sep
 2025 15:21:06 +0200
Date: Fri, 12 Sep 2025 14:21:04 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 23/29] arm_mpam: Add mpam_msmon_read() to read
 monitor value
Message-ID: <20250912142104.00006569@huawei.com>
In-Reply-To: <20250910204309.20751-24-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-24-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_062114_771031_0A493082 
X-CRM114-Status: GOOD (  19.83  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 10 Sep 2025 20:43:03 +0000
James Morse <james.morse@arm.com> wrote:

> Reading a monitor involves configuring what you want to monitor, and
> reading the value. Components made up of multiple MSC may need values
> from each MSC. MSCs may take time to configure, returning 'not ready'.
> The maximum 'not ready' time should have been provided by firmware.
> 
> Add mpam_msmon_read() to hide all this. If (one of) the MSC returns
> not ready, then wait the full timeout value before trying again.
> 
> CC: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
Hi James,

A couple of minor comments inline,

Jonathan

> +static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
> +				     u32 flt_val)
> +{
> +	struct mpam_msc *msc = m->ris->vmsc->msc;
> +
> +	/*
> +	 * Write the ctl_val with the enable bit cleared, reset the counter,
> +	 * then enable counter.
> +	 */
> +	switch (m->type) {
> +	case mpam_feat_msmon_csu:
> +		mpam_write_monsel_reg(msc, CFG_CSU_FLT, flt_val);
> +		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
> +		mpam_write_monsel_reg(msc, CSU, 0);
> +		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
> +		break;
> +	case mpam_feat_msmon_mbwu:
> +		mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
> +		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
> +		mpam_write_monsel_reg(msc, MBWU, 0);
> +		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
> +		break;

Given nothing to do later, I'd just return at end of each case.
Entirely up to you though as this is just a personal style preference.

> +	default:
> +		return;
> +	}
> +}

> +
> +static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
> +{
> +	int err, idx;
> +	struct mpam_msc *msc;
> +	struct mpam_vmsc *vmsc;
> +	struct mpam_msc_ris *ris;
> +
> +	idx = srcu_read_lock(&mpam_srcu);

	guard(srcu)(&mpam_srcu);

Then you can do direct returns on errors which looks like it will simplify
things somewhat by letting you just return on err.


> +	list_for_each_entry_rcu(vmsc, &comp->vmsc, comp_list) {
> +		msc = vmsc->msc;
I'd bring the declaration down here as well.
		struct mpam_msc *msc = vmsc->msc;
Could bring ris down here as well.

> +
> +		list_for_each_entry_rcu(ris, &vmsc->ris, vmsc_list) {
> +			arg->ris = ris;
> +
> +			err = smp_call_function_any(&msc->accessibility,
> +						    __ris_msmon_read, arg,
> +						    true);
> +			if (!err && arg->err)
> +				err = arg->err;
> +			if (err)
> +				break;
> +		}
> +		if (err)
> +			break;

This won't be needed if you returned on error above.

> +	}
> +	srcu_read_unlock(&mpam_srcu, idx);
> +
> +	return err;
And you only reach here with above changes if err == 0 so return 0; appropriate.
> +}
> +
> +int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
> +		    enum mpam_device_features type, u64 *val)
> +{
> +	int err;
> +	struct mon_read arg;
> +	u64 wait_jiffies = 0;
> +	struct mpam_props *cprops = &comp->class->props;
> +
> +	might_sleep();
> +
> +	if (!mpam_is_enabled())
> +		return -EIO;
> +
> +	if (!mpam_has_feature(type, cprops))
> +		return -EOPNOTSUPP;
> +
> +	memset(&arg, 0, sizeof(arg));
Either use = { }; at declaration or maybe
	arg = (struct mon_read) {
		.ctx = ctx,
		.type = type,
		.val = val,
	};

rather than bothering with separate memset.

> +	arg.ctx = ctx;
> +	arg.type = type;
> +	arg.val = val;
> +	*val = 0;
> +
> +	err = _msmon_read(comp, &arg);
> +	if (err == -EBUSY && comp->class->nrdy_usec)
> +		wait_jiffies = usecs_to_jiffies(comp->class->nrdy_usec);
> +
> +	while (wait_jiffies)
> +		wait_jiffies = schedule_timeout_uninterruptible(wait_jiffies);
> +
> +	if (err == -EBUSY) {
> +		memset(&arg, 0, sizeof(arg));
Same as above. 
> +		arg.ctx = ctx;
> +		arg.type = type;
> +		arg.val = val;
> +		*val = 0;
> +
> +		err = _msmon_read(comp, &arg);
> +	}
> +
> +	return err;
> +}


