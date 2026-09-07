Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F61C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVAV4q5RsC1I3cS9H3YvLbhVTR17aU6evNpkAhl7Z5I=; b=NUju2QbR80WR3ILh7EhK/ZpzKo
	IldWQJe7iw//RbabhuCDYsXZamm6SnjEZHpxk+99yPpQ4bzUPA8XT8END5gH3XHeCoUJM4hQbgaBa
	+IGmTR9S82hWgbYHXbUdEkoB5gKohuuwGYTa/xl54BnFD7kxvOcLtHv3+Aqu27321YAnyFJlAKKu5
	87Jum1h5LzCy7z1xJbFJxnnTxrKMEnXzLJs35r3NqVQZPXpvCN6fOYSkQMY8AIFUYndwT7NWvbe0H
	S5gq+4CaUlsLn75ohRV071SLZI0gtUbOIcVlYRmELt8XAGp6V9ujW0OFKhdQwug50F9YdfxXs44rx
	AqU6XD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3hZ0-00000007nrw-03wT;
	Mon, 07 Sep 2026 22:11:42 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3hYx-00000007nrL-0sRx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 22:11:40 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cff3b3b92so59995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 15:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788819096; x=1789423896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vVAV4q5RsC1I3cS9H3YvLbhVTR17aU6evNpkAhl7Z5I=;
        b=bDeAOPTyeIpxOvYgLGZj5kZyH2srWElVOXk3/sZDJ+prQWhbWM1IoZFG/rXFsFKrAc
         i3i8x3ZFXfgoN0SNK5Qy7WueDsGnx3u2HMzwymKRMS/vs+likfc13pTK8Zi8E8befgEz
         5aRRftW7YhOCqB+SvS7PHPRfQXImGM6PcCv2K52LF8QV6FZ/zO9MGLJksFT2cp4BBK0a
         6nHAQjiVrY+CeUdtdy57pirz2ZWtkaQD5oeqEBeT4wR7LXCdtiZ+x+32rAfgokYQ8pi8
         YekWosTW7oZlskrFVLxZPMHM/uNe54LK9teF3mjXcZgh837Vm1V9WCPx2pSMiSzGffMR
         +r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788819096; x=1789423896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVAV4q5RsC1I3cS9H3YvLbhVTR17aU6evNpkAhl7Z5I=;
        b=CZkDO3nGZXtOvmr7TUOZYuXHpx0cYDYc3sS8uM05m688GbeMlQfC/KoMhl6gZ+k0RZ
         BsZtqEIN7Z/t/47rozLBX2Z2YdbVi+PTHfYRagf67oggSsnio2UDBoC/oGR2UwJ7mM//
         TPkxUQkP9lwGsFPvctw3IWAgqBjP4gSdQ33ytb5J5BnK9qJFUe32TJvuhpiIkrqtoq9C
         C/HuY6pBYINgFro8lk7tEJ+noUuw88wYPl8cCGJQYAgLRm6iZ2s/Fvipf4XPUPQltcdZ
         rknTWNHGWDM/MBMa4559PKaLmjmSbs6SOfgy81EUy56xG5WD+1JQUnmyDJpXK0qsf1Bk
         +soQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwo0t6Mw57GyzOiveso91+JeUiiXX9tKrv3xqG4ixXBwhv6kN4yKQut8nvxQ8rZ/lfhmipckKi164FUWLpgI3k@lists.infradead.org
X-Gm-Message-State: AFuF++kWqOSzkEFUA3/urw8fU0OaC76Rv+vmrUTfxs5Ad50v06vo/Xrt
	BLxkPEEtpGr5V9sTKpG5YpS9AKLNG2FMKvFnsJSFP+KmoI0/JGw6d5OqZM6Kzm0tzA==
X-Gm-Gg: AYBFou146otElelDYePwqObvYhTgd6QPnM2Cays+XkvF0cGNucddZkw8Mnz8UZReEi1
	r+qFNHy3XM8uNbso87EtzTaU122+WUU5wkdR+r04IKCIQHka+4fuCudyELp856WWO8FSIM6jeEM
	gRzlgqlIrPVTgRfeRZLQ1oF4/KAlF4x1eFKpOD15yrR1pmfFH+oF6wM0fEtYDw2Rf5MZbSYpqGH
	A+ZTwRoSaKrAOWhEfQpM+dxIimJGqiPi5Cjgw2pwmKjeWetSVhLsUAL4BQSs240AfOEM1ZZzqlI
	raQ9W0TA1pJtaWqc1bPy2COOixHcgApcw5gKmqTdpOaLmnObLS3RdyBo5HeLNFoTMlLCQMhznoP
	2T94F1uSM+gTT2qenTogmijSX50NlmY1/SdsW4zL+h50jKiUxuF4T/sDMRCJYuC7PmH2865vf68
	1f62875qmBO0V6ZP15MYNPXfdjUktli2JE1Lmnw4KlF70z+68pbuNOT7ynIUyLK2zDwt2n0BBln
	rMLz+8ZvY+5OpiocEEFBoeoNhLDJy7s
X-Received: by 2002:a05:600c:5904:b0:499:c5f8:6773 with SMTP id 5b1f17b1804b1-49d01dcd992mr1613115e9.1.1788819095720;
        Mon, 07 Sep 2026 15:11:35 -0700 (PDT)
Received: from google.com (63.235.189.35.bc.googleusercontent.com. [35.189.235.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm240747305e9.0.2026.09.07.15.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:11:35 -0700 (PDT)
Date: Mon, 7 Sep 2026 22:11:31 +0000
From: Sebastian Ene <sebastianene@google.com>
To: mankyum.kim@samsung.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Andrew Walbran <qwandor@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Honour the SPMC FF-A RX/TX buffer size
 limits
Message-ID: <ap82k7OUGiwaHJCJ@google.com>
References: <20260825-master-v2-1-f8af766d1f34@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-master-v2-1-f8af766d1f34@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_151139_298231_E94857E8 
X-CRM114-Status: GOOD (  47.41  )
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

On Tue, Aug 25, 2026 at 02:10:17PM +0900, Kim Mankyum via B4 Relay wrote:

Hello Kim,

> From: Kim Mankyum <mankyum.kim@samsung.com>
> 
> pKVM currently sizes its FF-A RX/TX buffers according to PAGE_SIZE:
> do_ffa_rxtx_map() rejects any FFA_RXTX_MAP request from the host whose
> page count does not match the hyp buffers' full PAGE_SIZE capacity,
> and FFA_FEATURES for FFA_RXTX_MAP never tells the host otherwise.
> hyp_ffa_post_init() already queries the SPMC's minimum RX/TX buffer
> size, but only for a feasibility check.
> 
> This breaks when PAGE_SIZE is larger than the RX/TX buffer size the
> SPMC actually supports. For example, an FF-A 1.2 SPMC advertising both
> a minimum and a maximum RX/TX buffer size of 4K rejects the 16K
> FFA_RXTX_MAP request that pKVM consequently forwards to the SPMC on a
> 16K kernel.
> 
> Compute the RX/TX buffer size pKVM and the SPMC both support in
> hyp_ffa_post_init(), from the SPMC's advertised minimum and (FF-A 1.2
> onwards) maximum sizes, capped at the hyp buffers' capacity; below
> FF-A 1.2 the maximum field is undefined, so fall back to the minimum.
> Store it in hyp_ffa_rxtx_sz, report it to the host via
> FFA_FEATURES(FFA_RXTX_MAP), and require the host's FFA_RXTX_MAP
> request to match it exactly, as before. The other buffer-size bound
> checks in this file are updated to use hyp_ffa_rxtx_sz too, since that
> is the amount of the hyp buffers actually visible to the SPMC once it
> is smaller than PAGE_SIZE.
> 
> Host page ownership remains PAGE_SIZE-granular: do_ffa_rxtx_map()
> still shares and pins the entire host page backing each RX/TX buffer.
> Such pages leave the plain PKVM_PAGE_OWNED state, so any subsequent
> host FF-A share/lend on any part of them is rejected by
> __pkvm_host_share_ffa(). The part of a page not visible to the SPMC
> therefore stays pinned but is never exposed to it.
> 
> Fixes: 9d0c6a9af9e3 ("KVM: arm64: Handle FFA_RXTX_MAP and FFA_RXTX_UNMAP calls from the host")
> Suggested-by: Sebastian Ene <sebastianene@google.com>
> Signed-off-by: Kim Mankyum <mankyum.kim@samsung.com>
> ---
> Changes in v2:
> - Rework the fix to negotiate the RX/TX buffer size with the SPMC
>   instead of relaxing the FFA_RXTX_MAP page-count validation.
> - Account for the maximum RX/TX buffer size advertised since FF-A 1.2.
> - Handle FFA_FEATURES(FFA_RXTX_MAP) in pKVM so the host discovers the
>   negotiated size.
> - Use the negotiated size for the SPMC-facing buffer bounds.
> - Keep host page sharing and pinning PAGE_SIZE-granular, addressing the
>   partial-page sharing concern raised in v1.
> 
> Link to v1: https://patch.msgid.link/20260820-master-v1-1-ea602b6d3860@samsung.com
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 62 ++++++++++++++++++++++++++++++++++++++-----
>  include/linux/arm_ffa.h       |  7 +++++
>  2 files changed, 62 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index a327c2bbb6b6..c3379d1e8fd7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -71,6 +71,15 @@ static u32 hyp_ffa_version;
>  static bool has_version_negotiated;
>  static hyp_spinlock_t version_lock;
>  
> +/*
> + * Size, in bytes, of the RX/TX buffers used by the pKVM FF-A proxy: the
> + * portion of the (fixed, KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) hyp buffers
> + * that is actually mapped into the SPMC. Negotiated with the SPMC in
> + * hyp_ffa_post_init() and, since it is what the host must in turn provide,
> + * also reported to the host via FFA_FEATURES.
> + */
> +static size_t hyp_ffa_rxtx_sz;
> +
>  static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
>  {
>  	*res = (struct arm_smccc_1_2_regs) {
> @@ -239,7 +248,7 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
>  	int ret = 0;
>  	void *rx_virt, *tx_virt;
>  
> -	if (npages != (KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) / FFA_PAGE_SIZE) {
> +	if (npages != hyp_ffa_rxtx_sz / FFA_PAGE_SIZE) {
>  		ret = FFA_RET_INVALID_PARAMETERS;
>  		goto out;

This change is not enough by itself, because now you have multipple
pages that can assemble the mailbox buffer which have to be shared with
the hypervisor but you only share one page atm.

>  	}
> @@ -421,7 +430,7 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
>  	int ret = FFA_RET_INVALID_PARAMETERS;
>  	u32 nr_ranges;
>  
> -	if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)
> +	if (fraglen > hyp_ffa_rxtx_sz)
>  		goto out;
>  
>  	if (fraglen % sizeof(*buf))
> @@ -484,7 +493,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  	size_t mem_region_len = FFA_MEM_REGION_SZ(hyp_ffa_version);
>  
>  	if (addr_mbz || npages_mbz || fraglen > len ||
> -	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> +	    fraglen > hyp_ffa_rxtx_sz) {
>  		ret = FFA_RET_INVALID_PARAMETERS;
>  		goto out;
>  	}
> @@ -619,7 +628,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  	 * bogus.
>  	 */
>  	if (offset + CONSTITUENTS_OFFSET(0) > len ||
> -	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> +	    fraglen > hyp_ffa_rxtx_sz) {
>  		ret = FFA_RET_ABORTED;
>  		ffa_rx_release(res);
>  		goto out_unlock;
> @@ -723,6 +732,26 @@ static bool do_ffa_features(struct arm_smccc_1_2_regs *res,
>  	}
>  
>  	switch (id) {
> +	case FFA_RXTX_MAP:
> +	case FFA_FN64_RXTX_MAP:
> +		switch (hyp_ffa_rxtx_sz) {
> +		case SZ_4K:
> +			prop = FFA_FEAT_RXTX_MIN_SZ_4K;
> +			break;
> +		case SZ_16K:
> +			prop = FFA_FEAT_RXTX_MIN_SZ_16K;
> +			break;
> +		case SZ_64K:
> +			prop = FFA_FEAT_RXTX_MIN_SZ_64K;
> +			break;
> +		default:
> +			ret = FFA_RET_NOT_SUPPORTED;
> +		}
> +
> +		if (!ret && hyp_ffa_version >= FFA_VERSION_1_2)
> +			prop |= FIELD_PREP(FFA_FEAT_RXTX_MAX_SZ_MASK,
> +					    hyp_ffa_rxtx_sz / FFA_PAGE_SIZE);
> +		goto out_handled;
>  	case FFA_MEM_SHARE:
>  	case FFA_FN64_MEM_SHARE:
>  	case FFA_MEM_LEND:
> @@ -741,7 +770,8 @@ static bool do_ffa_features(struct arm_smccc_1_2_regs *res,
>  
>  static int hyp_ffa_post_init(void)
>  {
> -	size_t min_rxtx_sz;
> +	size_t min_rxtx_sz, max_rxtx_sz = 0;
> +	size_t capacity = KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE;

Small nit, should we keep capacity in a macro ?

>  	struct arm_smccc_1_2_regs res;
>  
>  	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs){
> @@ -774,9 +804,27 @@ static int hyp_ffa_post_init(void)
>  		return -EINVAL;
>  	}
>  
> -	if (min_rxtx_sz > PAGE_SIZE)
> +	if (min_rxtx_sz > capacity)
>  		return -EOPNOTSUPP;
>  
> +	/*
> +	 * The maximum RX/TX buffer size was only added to FFA_FEATURES in
> +	 * FF-A 1.2; the field is undefined on earlier versions, so treat it
> +	 * as unavailable there and settle for the (guaranteed supported)
> +	 * minimum size instead of guessing.
> +	 */
> +	if (hyp_ffa_version < FFA_VERSION_1_2) {
> +		hyp_ffa_rxtx_sz = min_rxtx_sz;
> +		return 0;
> +	}
> +
> +	max_rxtx_sz = FIELD_GET(FFA_FEAT_RXTX_MAX_SZ_MASK, res.a2) * FFA_PAGE_SIZE;
> +	if (max_rxtx_sz && max_rxtx_sz < min_rxtx_sz)
> +		max_rxtx_sz = min_rxtx_sz;

This is not defined in the spec, it should either be MBZ or a max
value. If it's non zero and smaller than the min value then TZ is broken.
In this case we should return an error.

If max is zero then hyp_ffa_rxtx_sz would become 'capacity'.

> +
> +	/* A maximum of 0 means the SPMC does not enforce an upper bound. */
> +	hyp_ffa_rxtx_sz = min(max_rxtx_sz ?: capacity, capacity);
> +
>  	return 0;
>  }
>  
> @@ -868,7 +916,7 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	}
>  
>  	copy_sz = partition_sz * count;
> -	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> +	if (copy_sz > hyp_ffa_rxtx_sz) {
>  		ffa_to_smccc_res(res, FFA_RET_ABORTED);
>  		goto out_unlock;
>  	}
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index e71d83ee0aef..a70d087174af 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -130,6 +130,13 @@
>  #define FFA_FEAT_RXTX_MIN_SZ_16K	2
>  #define FFA_FEAT_RXTX_MIN_SZ_MASK	GENMASK(1, 0)
>  
> +/*
> + * Maximum buffer size supported by the callee, expressed in units of
> + * FFA_PAGE_SIZE, as returned by an FFA_FEATURES query for FFA_RXTX_MAP.
> + * A value of 0 means no maximum size is enforced.
> + */
> +#define FFA_FEAT_RXTX_MAX_SZ_MASK	GENMASK(31, 16)
> +
>  /* FFA Bus/Device/Driver related */
>  struct ffa_device {
>  	u32 id;
> 
> ---
> base-commit: cb8a75eec0877810b50aa1c5a833f929525cd2ee
> change-id: 20260820-master-572418a358ab
> 
> Best regards,
> --  
> Kim Mankyum <mankyum.kim@samsung.com>
> 
>

Thanks,
Sebastian

