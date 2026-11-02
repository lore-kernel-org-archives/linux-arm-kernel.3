Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7C6606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 01:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RxUSz+kg;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CRggC1mK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9uLkggi5jeL9sGYQHyTyByYxkgZ/xZRTq5JwmLkTNLA=; b=RxUSz+kgI/FVo63/5I2BvO5z74
	bnNnySgoVtoFBmuvQCnj92fIzX/nqUnOEkGTUSNfNRPEpGRq8KiUD4zb2y7vTqNnt3L/tNDDxPepP
	sgZZty1PjHqkzSWZS0DOdy0Z3EK49jeo0/p0zIKZKZ+Ka2y/iR7dJ5oFdiX+/yU3kWMDdS+/oiHtl
	jXcqeWSStGKXtTdJmpsqb46HhpnEr1VkTv0u/dYSqXePaZbgY8EjfTMHunnn9abXzepGKp/BDf+T7
	dRy0kj228WS5C/zW4JJyCOPINmBc0yFL2uCRSotKxQSkmQQMF5eQvl7SCa3WZG0nS1SSL//Z4coCw
	pXPgU46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNh7P-0000000FMpi-3c2K;
	Mon, 02 Nov 2026 01:45:51 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNh7K-0000000FMpN-0rWs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 01:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793583938; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=9uLkggi5jeL9sGYQHyTyByYxkgZ/xZRTq5JwmLkTNLA=;
	b=CRggC1mKI3N/yLDnJQssAlkLaGzOBYcNXxkFOVWxQUwTZQhKilcFns2xyB7Oo85zrYIZb3MsDDpIXvFAY8V9yY0pMDI0S96YNUditCm8Tj8V34CR7c3BjNqEGE3ZUcVLgLzledZQsihRjHP+qStlFuTcUD9xRzNGY3FbYjFBw74=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R741e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XDrYjc._1793583936;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0XDrYjc._1793583936 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 02 Nov 2026 09:45:36 +0800
Date: Mon, 2 Nov 2026 09:45:36 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Arnd Bergmann <arnd@arndb.de>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] KVM: arm64: Add ACCDATA_EL1 to the sysreg array
Message-ID: <7s5ptzeolghvb6aplrf4cy3kwxeh6hvca5clneexutbvz3u3rr@g5ejdynebrnk>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-3-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025075138.2919734-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_174546_907428_2B3111B8 
X-CRM114-Status: GOOD (  20.57  )
X-Spam-Score: -15.6 (---------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 07:51:35AM +0800, Fuad Tabba wrote:
> From: Marc Zyngier <maz@kernel.org>
>
> Make ACCDATA_EL1 a first-class citizen, and add it to the sysreg
> array. Visibility is conditioned on the feature being enabled.
>

Hi Tabba,

LGTM.
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20240815125959.2097734-4-maz@kernel.org
> [Fuad: rebased]
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/include/asm/kvm_host.h |  3 +++
>  arch/arm64/kvm/sys_regs.c         | 12 +++++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 27fe0cd5b2d7a..5b1cd1f502b7d 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -498,6 +498,9 @@ enum vcpu_sysreg {
>  	GCR_EL1,	/* Tag Control Register */
>  	TFSRE0_EL1,	/* Tag Fault Status Register (EL0) */
>
> +	/* Random stuff */
> +	ACCDATA_EL1,	/* Accelerator Data */
> +
>  	POR_EL0,	/* Permission Overlay Register 0 (EL0) */
>
>  	/* FP/SIMD/SVE */
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 44aae52c473d7..40f8be41da3a4 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2914,6 +2914,15 @@ static unsigned int sve_el2_visibility(const struct kvm_vcpu *vcpu,
>  	return __el2_visibility(vcpu, rd, sve_visibility);
>  }
>
> +static unsigned int accdata_visibility(const struct kvm_vcpu *vcpu,
> +				       const struct sys_reg_desc *rd)
> +{
> +	if (kvm_has_feat(vcpu->kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
> +		return 0;
> +
> +	return REG_HIDDEN;
> +}
> +
>  static unsigned int vncr_el2_visibility(const struct kvm_vcpu *vcpu,
>  					const struct sys_reg_desc *rd)
>  {
> @@ -3601,7 +3610,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_CONTEXTIDR_EL1), access_vm_reg, reset_val, CONTEXTIDR_EL1, 0 },
>  	{ SYS_DESC(SYS_TPIDR_EL1), NULL, reset_unknown, TPIDR_EL1 },
>
> -	{ SYS_DESC(SYS_ACCDATA_EL1), undef_access },
> +	{ SYS_DESC(SYS_ACCDATA_EL1), undef_access, reset_val, ACCDATA_EL1, 0,
> +	  .visibility = accdata_visibility},
>
>  	{ SYS_DESC(SYS_SCXTNUM_EL1), undef_access },
>
> --
> 2.47.3
>

