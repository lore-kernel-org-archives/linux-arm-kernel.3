Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55B1CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQTJ1slkb5YCGrjUYhK8x2oShUex9H1qJLfaSPhm2/I=; b=gyYeqBZvo8zKQV7Uv6PPe9P6Aj
	lRmegCgJP6iRcoONA5E/7tScHyQsl8ggL57D8nwZSKmIqzUbJb9IMer2AKPJyss+DxT6o2BHJGEdy
	N05FjBHJI3olTi7tL67qHwX82uqmVsSrTaa1VXFb/Jmv3R8EDpVGituLWaKMJsRshn/znMmHF8+nC
	gyBjRlsVGt4jSfb10PDmuhLCuVvMZ4R3SQ88Ufp6lA2pQvJMsDtXjnfp0NEpw2ivT7vd8OsiOxFWI
	BuxUuCghwEkp1V3AFpGPV3OzCKcaYV1K+vueD8Gp54HUZ7/xo9o55SJ6uQynkdmXFEmiqAnXuMV76
	sgTJUVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoDV-00000007BmN-3maI;
	Fri, 01 May 2026 13:47:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoDS-00000007Bm0-2d8I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 13:47:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CD2C176A;
	Fri,  1 May 2026 06:47:30 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FB5E3F62B;
	Fri,  1 May 2026 06:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777643255; bh=rwgXGr1STx/LEHE1ouffCIS69kHVohj7ROm+8Hh7vEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b6X4zW3yp5qT6RabLlXDQVO/FeL7tPN2xjUmAxUqOuHLBhfKm042NUohm2aji/+WR
	 JXlvItA0VhST3veBOd24n4TpwRBypzfIiq0UjILPpKh+oQ7G2jDOi9Th/SzhmBj2wi
	 Mp8ScD8Qpzo9B9QD9wBvCHhHiQzQuAJaeSRIIU/4=
Message-ID: <a7e2ac96-b710-40e5-a159-b49555bcf518@arm.com>
Date: Fri, 1 May 2026 14:47:27 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v2 1/6] KVM: arm64: Make EL2 exception entry and exit
 context-synchronization events
To: Fuad Tabba <tabba@google.com>, maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 qperret@google.com, vdonnefort@google.com, catalin.marinas@arm.com,
 will@kernel.org, yaoyuan@linux.alibaba.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260501112149.2824881-1-tabba@google.com>
 <20260501112149.2824881-2-tabba@google.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260501112149.2824881-2-tabba@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_064738_790598_F9005B54 
X-CRM114-Status: GOOD (  23.71  )
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

Hi Fuad,

On 5/1/26 12:21, Fuad Tabba wrote:
> SCTLR_EL2.EIS and SCTLR_EL2.EOS control whether exception entry and
> exit at EL2 are Context Synchronisation Events (CSEs). Per ARM DDI
> 0487 M.b D24.2.175 (p. D24-9754):
> 
>   - !FEAT_ExS: the bit is RES1, so the entry/exit is unconditionally
>     a CSE.
>   - FEAT_ExS: the reset value is architecturally UNKNOWN; software
>     must set the bit to make the entry/exit a CSE.
> 
> INIT_SCTLR_EL2_MMU_ON in arch/arm64/include/asm/sysreg.h sets neither
> bit. KVM/arm64 hot paths rely on ERET from EL2 being a CSE, and on
> synchronous EL1->EL2 entry being a CSE, to elide explicit ISBs after
> MSRs to context-switching system registers (HCR_EL2, ZCR_EL2,
> ptrauth keys, etc.). On FEAT_ExS hardware those reliances are not
> architecturally backed unless EOS=1 (and, for entry, EIS=1).
> 
> Until commit 0a35bd285f43 ("arm64: Convert SCTLR_EL2 to sysreg
> infrastructure"), SCTLR_EL2_RES1 was a hand-rolled mask that
> included BIT(11) (EOS) and BIT(22) (EIS), so INIT_SCTLR_EL2_MMU_ON
> was setting both unconditionally. The conversion made
> SCTLR_EL2_RES1 auto-generated; because the sysreg tooling only
> models unconditionally-RES1 fields and EIS/EOS are RES1 only when
> FEAT_ExS is absent, the auto-generated mask is UL(0). The seven
> other bits dropped from the old mask (positions 4, 5, 16, 18, 23,
> 28, 29) are unconditionally RES1 in the E2H=0 SCTLR_EL2 layout per
> DDI 0487 M.b D24.2.175, so dropping them is harmless. EIS and EOS
> are the only bits whose semantics changed for FEAT_ExS hardware
> and where the kernel relies on the value being 1.
> 
> Make the guarantee explicit: include SCTLR_ELx_EIS | SCTLR_ELx_EOS in
> INIT_SCTLR_EL2_MMU_ON so that EL2 exception entry and exit are
> unconditionally CSEs regardless of whether FEAT_ExS is implemented.
> This matches the pairing in arch/arm64/kvm/config.c which treats EIS
> and EOS together as RES1 under !FEAT_ExS.

In v1 you also had this sentence:

"INIT_SCTLR_EL2_MMU_OFF is left unchanged: that path is used during
very early EL2 init and the EL2 MMU-off transition, neither of which
relies on these bits in the same way."

To me, it seems useful to keep that sentence as it makes it clear that INIT_SCTLR_EL2_MMU_OFF is purposely not changed.
Or is there a reason why you dropped it? Perhaps it's just obvious to people more familiar with this code.

Thanks,

Ben

> 
> Fixes: 0a35bd285f43 ("arm64: Convert SCTLR_EL2 to sysreg infrastructure")
> Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
> Assisted-by: Gemini:gemini-3.1-pro review-prompts
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/include/asm/sysreg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 736561480f36..7aa08d59d494 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -844,7 +844,7 @@
>  #define INIT_SCTLR_EL2_MMU_ON						\
>  	(SCTLR_ELx_M  | SCTLR_ELx_C | SCTLR_ELx_SA | SCTLR_ELx_I |	\
>  	 SCTLR_ELx_IESB | SCTLR_ELx_WXN | ENDIAN_SET_EL2 |		\
> -	 SCTLR_ELx_ITFSB | SCTLR_EL2_RES1)
> +	 SCTLR_ELx_ITFSB | SCTLR_ELx_EIS | SCTLR_ELx_EOS | SCTLR_EL2_RES1)
>  
>  #define INIT_SCTLR_EL2_MMU_OFF \
>  	(SCTLR_EL2_RES1 | ENDIAN_SET_EL2)


