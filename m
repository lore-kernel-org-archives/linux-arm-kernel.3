Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48EECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7wnrj/5Ya3UG5S8UmR43gR4DJE6HUQXaIgIGKPZ8yU=; b=s5yxOI1YQ6fhCk7I0x+twqN3jC
	gUEViHFTQ5+FSDmT7JXS9ls3FkpB/baBP+ij7wvDkUUT5Ypf/q8SPWJA4XX0Tl3fpb3N8PSOEAHaW
	yAlcyQvEXsBRntTJpqFRNCTXFqMs1XdnH1YvQJrr3lK6571jFl+uFWgZHly5kI8Xg8tjLHlrEWQqc
	P8+6mnYHsoE3vLLS6TS0xyY7EdoCB1fnSat+0STuR1VQDh4J1TDaJzbUmNTGAwCqG55FuGkFEQg1/
	wPB9sAflEof3QBWZhbbmgyqun5GsSVyeUfN+TX3YJuW51a3XNvIE6Dq6Px7BJeFVVYjXenJvc9iSI
	eRKFzW6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3tq-00000009aJR-2UqY;
	Fri, 12 Sep 2025 13:33:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3tn-00000009aGE-43h6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:33:13 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cNZzz1n8zz6M53H;
	Fri, 12 Sep 2025 21:30:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A7F4A1404FE;
	Fri, 12 Sep 2025 21:33:04 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Sep
 2025 15:33:03 +0200
Date: Fri, 12 Sep 2025 14:33:02 +0100
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
Subject: Re: [PATCH v2 27/29] arm_mpam: Add helper to reset saved mbwu state
Message-ID: <20250912143302.00004d0e@huawei.com>
In-Reply-To: <20250910204309.20751-28-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-28-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_063312_299184_13AF644A 
X-CRM114-Status: GOOD (  21.38  )
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

On Wed, 10 Sep 2025 20:43:07 +0000
James Morse <james.morse@arm.com> wrote:

> resctrl expects to reset the bandwidth counters when the filesystem
> is mounted.
> 
> To allow this, add a helper that clears the saved mbwu state. Instead
> of cross calling to each CPU that can access the component MSC to
> write to the counter, set a flag that causes it to be zero'd on the
> the next read. This is easily done by forcing a configuration update.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
Minor comments inline.

Jonathan

> @@ -1245,6 +1257,37 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
>  	return err;
>  }
>  
> +void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx)
> +{
> +	int idx;
> +	struct mpam_msc *msc;
> +	struct mpam_vmsc *vmsc;
> +	struct mpam_msc_ris *ris;
> +
> +	if (!mpam_is_enabled())
> +		return;
> +
> +	idx = srcu_read_lock(&mpam_srcu);

Maybe guard() though it doesn't add that much here.

> +	list_for_each_entry_rcu(vmsc, &comp->vmsc, comp_list) {

Reason not to use _srcu variants?

> +		if (!mpam_has_feature(mpam_feat_msmon_mbwu, &vmsc->props))
> +			continue;
> +
> +		msc = vmsc->msc;
> +		list_for_each_entry_rcu(ris, &vmsc->ris, vmsc_list) {
> +			if (!mpam_has_feature(mpam_feat_msmon_mbwu, &ris->props))
> +				continue;
> +
> +			if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> +				continue;
> +
> +			ris->mbwu_state[ctx->mon].correction = 0;
> +			ris->mbwu_state[ctx->mon].reset_on_next_read = true;
> +			mpam_mon_sel_unlock(msc);
> +		}
> +	}
> +	srcu_read_unlock(&mpam_srcu, idx);
> +}
> +
>  static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>  {
>  	u32 num_words, msb;
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index c190826dfbda..7cbcafe8294a 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -223,10 +223,12 @@ struct mon_cfg {
>  
>  /*
>   * Changes to enabled and cfg are protected by the msc->lock.
> - * Changes to prev_val and correction are protected by the msc's mon_sel_lock.
> + * Changes to reset_on_next_read, prev_val and correction are protected by the
> + * msc's mon_sel_lock.
Getting close to the point where a list of one per line would reduce churn.
If you anticipate adding more to this in future I'd definitely consider it.
e.g.
 * msc's mon_sel_lcok protects:
 * - reset_on_next_read
 * - prev_val
 * - correction
 */
>   */
>  struct msmon_mbwu_state {
>  	bool		enabled;
> +	bool		reset_on_next_read;
>  	struct mon_cfg	cfg;
>  
>  	/* The value last read from the hardware. Used to detect overflow. */
> @@ -393,6 +395,7 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
>  
>  int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
>  		    enum mpam_device_features, u64 *val);
> +void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
>  
>  int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
>  				   cpumask_t *affinity);


