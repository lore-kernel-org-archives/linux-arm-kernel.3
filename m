Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E14CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2AQSZEX+eXALclv59Flt7B8UlIfVr3bUwBLqwdl+IY=; b=ntMiPdfyq+D8mS7n9hgxt5Rmcv
	VFzYgE0kG4XR7b7jzkyr5IBJnqiFrfGTplCH2SkZmf92mQFDhBc7gnfrJyqCiEPlvbwfwED7cLQu4
	eLeGBXkiZqC+k6g2Z4HH9gjrQirbIAyi3nUMasPYIDRuWegJlKoP+3wkuhMg9a0aqUI8H/jJCLb2H
	xfmGBHTojEySGKnGWAlJ+GHV+vCXn8NnyqVCFRnKHX2nUnOKrJWh56HjFWn6ZPOj9s/hahS6748Ol
	1280FaCRGG5uJvsKU23p5ju5NcarQypsQCPma277I1c40rEJDrc/w71tB2WOPoelJCK6OcDxkfwj1
	ztw5ilMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLme-0000000A8Fk-1SVH;
	Fri, 24 Oct 2025 17:41:00 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLmb-0000000A8FP-3hHN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:40:59 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ctVWv55tQz6L57H;
	Sat, 25 Oct 2025 01:39:23 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 26BBA1402FB;
	Sat, 25 Oct 2025 01:40:55 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 24 Oct
 2025 18:40:53 +0100
Date: Fri, 24 Oct 2025 18:40:52 +0100
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
	Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v3 11/29] arm_mpam: Probe hardware to find the supported
 partid/pmg values
Message-ID: <20251024184052.00004c24@huawei.com>
In-Reply-To: <20251017185645.26604-12-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
	<20251017185645.26604-12-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_104058_211895_1AF47D6E 
X-CRM114-Status: GOOD (  18.68  )
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

On Fri, 17 Oct 2025 18:56:27 +0000
James Morse <james.morse@arm.com> wrote:

> CPUs can generate traffic with a range of PARTID and PMG values,
> but each MSC may also have its own maximum size for these fields.
> Before MPAM can be used, the driver needs to probe each RIS on
> each MSC, to find the system-wide smallest value that can be used.
> The limits from requestors (e.g. CPUs) also need taking into account.
> 
> While doing this, RIS entries that firmware didn't describe are created
> under MPAM_CLASS_UNKNOWN.
> 
> While we're here, implement the mpam_register_requestor() call
> for the arch code to register the CPU limits. Future callers of this
> will tell us about the SMMU and ITS.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Trivial stuff inline. I'd definitely not trust this reviewer who
is horribly inconsistent ;)

> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>

>  static struct mpam_vmsc *
>  mpam_vmsc_alloc(struct mpam_component *comp, struct mpam_msc *msc)
>  {
> @@ -427,6 +500,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>  	cpumask_or(&comp->affinity, &comp->affinity, &ris->affinity);
>  	cpumask_or(&class->affinity, &class->affinity, &ris->affinity);
>  	list_add_rcu(&ris->vmsc_list, &vmsc->ris);
> +	list_add_rcu(&ris->msc_list, &msc->ris);

This looks like it might the add I was missing earlier?  If so and it can
only be done now, move the del into this patch as well.

>  
>  	return 0;
>  }
> @@ -446,9 +520,36 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>  	return err;
>  }
>  
> +static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
> +						   u8 ris_idx)
> +{
> +	int err;
> +	struct mpam_msc_ris *ris;
> +
> +	lockdep_assert_held(&mpam_list_lock);
> +
> +	if (!test_bit(ris_idx, &msc->ris_idxs)) {
> +		err = mpam_ris_create_locked(msc, ris_idx, MPAM_CLASS_UNKNOWN,
> +					     0, 0);
> +		if (err)
> +			return ERR_PTR(err);
> +	}
> +
> +	list_for_each_entry(ris, &msc->ris, msc_list) {
> +		if (ris->ris_idx == ris_idx) {
> +			return ris;

I'm not seeing this change in later patches in this series, so brackets
seem unnecessary and against kernel style.

> +		}
> +	}
> +
> +	return ERR_PTR(-ENOENT);
> +}
>

