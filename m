Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEF2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAP3Za1G3N+V9WR0IOq09uf9Nbk0mPoSKbrKBMX0uJA=; b=I4UzZZn9n3CgNxc9V+p9DmSVR9
	wZiM3bCDnEU16dwzhsvxKr6rrjb2WXeCTWSVQ3A9cVUzDulZV/LmiUTMrycMLXKvyXgRJAmJ5RDf7
	xPr8+dsb+9G1d/CoxLbfavGTrUg02mh9o+hcJBjaa+1xKInbRF8q5U8rhAGtRbmhN3Bt6oH9+rMhi
	eMNaeLKl5uhZONZkVGuyjPm/UeCSyz9wZHqRGaslKPvBSOYl329VOVze5u3e+9DDWUajbEA0KZzRA
	u7WFwvH/Rtrh5nFY2MqQVgi3HbfnM1jOK/9QEuVC0j7joQovy7Jz5RlLw5HdkiMY5IwDi2QnNpeE0
	woe03TMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmzu-00000001BWS-3RAx;
	Thu, 12 Dec 2024 17:29:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlui-00000000wjE-2sSg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:19:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D4F71762;
	Thu, 12 Dec 2024 08:20:12 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19C013F720;
	Thu, 12 Dec 2024 08:19:42 -0800 (PST)
Date: Thu, 12 Dec 2024 16:19:40 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: james.morse@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com,
	xiexiuqi@huawei.com
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 5/5] arm_mpam:
 Adapting the closid/rmid matching determination functions
Message-ID: <Z1sNHFhpYlPvVANC@e133380.arm.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
 <20241207092136.2488426-6-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207092136.2488426-6-zengheng4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_081944_816628_558337B9 
X-CRM114-Status: GOOD (  26.16  )
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

Hi,

On Sat, Dec 07, 2024 at 05:21:36PM +0800, Zeng Heng wrote:
> According to the previous patches, add the inverse functions for the
> closid/rmid conversion functions to serve as the conversion functions for
> reqpartid/pmg. And adapt the matching determination functions
> resctrl_arch_match_closid() and resctrl_arch_match_rmid() by the inverse
> functions.
> 
> For the same reason, when updating the (req)PARTID/PMG pair for a task,
> the new conversion functions also are used for adaptation.
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  arch/arm64/include/asm/mpam.h              |  6 ++-
>  drivers/platform/arm64/mpam/mpam_resctrl.c | 63 +++++++++++++++-------
>  2 files changed, 47 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
> index e5f385767174..9fc095530671 100644
> --- a/arch/arm64/include/asm/mpam.h
> +++ b/arch/arm64/include/asm/mpam.h
> @@ -93,6 +93,8 @@ static inline u64 mpam_get_regval(struct task_struct *tsk)
>  #endif
>  }
>  
> +u32 rmid2pmg(u32 rmid);
> +
>  static inline void resctrl_arch_set_rmid(struct task_struct *tsk, u32 rmid)
>  {
>  #ifdef CONFIG_ARM64_MPAM
> @@ -100,8 +102,8 @@ static inline void resctrl_arch_set_rmid(struct task_struct *tsk, u32 rmid)
>  
>  	regval &= ~MPAM1_EL1_PMG_D;
>  	regval &= ~MPAM1_EL1_PMG_I;
> -	regval |= FIELD_PREP(MPAM1_EL1_PMG_D, rmid);
> -	regval |= FIELD_PREP(MPAM1_EL1_PMG_I, rmid);
> +	regval |= FIELD_PREP(MPAM1_EL1_PMG_D, rmid2pmg(rmid));
> +	regval |= FIELD_PREP(MPAM1_EL1_PMG_I, rmid2pmg(rmid));

Note, this function does not seem to be used; I added a patch in my
series [1] to get rid of it instead of converting it.

>  
>  	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
>  #endif
> diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c

[...]

>  void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid)
>  {
> -	BUG_ON(closid > U16_MAX);
> -	BUG_ON(rmid > U8_MAX);
> +	u32 reqpartid = closid_rmid2reqpartid(closid, rmid);
> +	u32 pmg = rmid2pmg(rmid);
> +	u32 partid_d, partid_i;
> +
> +	BUG_ON(reqpartid > U16_MAX);
> +	BUG_ON(pmg > U8_MAX);
>  
>  	if (!cdp_enabled) {
> -		mpam_set_cpu_defaults(cpu, closid, closid, rmid, rmid);
> +		mpam_set_cpu_defaults(cpu, reqpartid, reqpartid, pmg, pmg);
>  	} else {
>  		/*
>  		 * When CDP is enabled, resctrl halves the closid range and we
>  		 * use odd/even partid for one closid.
>  		 */
> -		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
> -		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
> +		partid_d = resctrl_get_config_index(reqpartid, CDP_DATA);
> +		partid_i = resctrl_get_config_index(reqpartid, CDP_CODE);
>  
> -		mpam_set_cpu_defaults(cpu, partid_d, partid_i, rmid, rmid);
> +		mpam_set_cpu_defaults(cpu, partid_d, partid_i, pmg, pmg);

Prior to this patch, will the PARTID and/or PMG programmed for a
control group be different from the PARTID and/or PMG used to program
the MSCs?

If so, those changes probably need to be in the same patch.

[...]

> @@ -289,41 +307,46 @@ void resctrl_arch_sync_cpu_closid_rmid(void *info)

[...]

>  /* The task's pmg is not unique, the partid must be considered too */
>  bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
>  {
>  	u64 regval = mpam_get_regval(tsk);
> -	u32 tsk_closid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
> -	u32 tsk_rmid = FIELD_GET(MPAM1_EL1_PMG_D, regval);
> +	u32 tsk_pmg = FIELD_GET(MPAM1_EL1_PMG_D, regval);
> +	u32 tsk_partid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
>  
>  	if (cdp_enabled)
> -		tsk_closid >>= 1;
> +		tsk_partid >>= 1;
>  
> -	return (tsk_closid == closid) && (tsk_rmid == rmid);
> +	return (reqpartid2closid(tsk_partid) == closid) &&
> +	       (reqpartid_pmg2rmid(tsk_partid, tsk_pmg) == rmid);

Do we actually need the reverse mappings here?

It doesn't really matter which ID namespace is used for the
comparison, so in my version of this I converted the passed-in closid
and rmid to PARTID / PMG form and then compared those with tsk's
values.

(But if I've missed some subtlety here, please let me know!)

[...]

Cheers
---Dave


[1] [RFC PATCH 3/6] arm_mpam: Delete unused function resctrl_arch_set_rmid()
https://lore.kernel.org/lkml/20241212154000.330467-4-Dave.Martin@arm.com/

