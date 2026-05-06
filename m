Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FB3CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IJBhseJN4AMQCxKEWX1XNX+9nBbaimun8zImzXxaBM=; b=K1FjaQdbZwGsspoPwiW/pqsKwh
	ytjpn6cpe0V4zroEYINN4i6mX5gwZDWgbLFo/qAZ2V4Kf0o1jyo40sZrsE8Fngt5Mc2SEcjAbqrX+
	kVvXBlvxA1cIN6kwsv7I9RPWxHjocNPRbcbPI/l7p032Hlyu5BvwNJXhTdidfQ5G7OhY1ccyX9ET6
	tixL4z/5080e/PqAdeKQGtG7SgKzHoPtX11Pz8bCXstjDwRinMBLSebC/r8wyGRzaW6kyEloY9Sj4
	suu3SJ1VHxCwYzoInmtc71jCz4XnzmLH5yhns3uhdnoQ0V49GarHKibSnpIhTrIrn9Ca2w4kHK51j
	zb3O+Qvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKX1H-000000004fT-3SQl;
	Wed, 06 May 2026 07:50:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKX1G-000000004el-3og8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 07:50:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6A7E60252;
	Wed,  6 May 2026 07:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D6EC2BCB8;
	Wed,  6 May 2026 07:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778053809;
	bh=FaaXScUXPb4sIbB5rQFiyH9iXewmrp5Aw7s3e5Jdplc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BmiFgJDcmg4CFoejvO8C4n0h0pBRtvpbW6SbUDtVBlt4iL5637qI0NCzi0kkfnCjE
	 9gNNmNLicDpjIxyC6mfUBnabIACOGJZvremJt+8XdDWJ/6U8DIvWoMA/V9D4akqysa
	 zP7gNn5sD7lAoaJMYUr2qKZernYXvuf2eBHpp97tpVIEcItJ5HXXlWXCtNiG426gPt
	 aBsW2kk7x3xSmlQWxO9qiM1oLB+K8DAdATVHBbnxhK9TyjCpE6vctvt0nXGc7wGiIs
	 IZltuRhARE/qRNcq+mqaOCwfY4IlLpN5lr0TPizRXpGRAHsbpaHMXw50XAsGUfmjOH
	 bx4AYlC42FPbw==
Date: Wed, 6 May 2026 08:50:03 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jarkko@kernel.org, zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 1/3] arm64: KVM: defer kvm_init() to finalise_pkvm()
 when pKVM is enabled
Message-ID: <20260506-spirited-impartial-sparrow-66efae@sudeepholla>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
 <20260505095409.1948371-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505095409.1948371-2-yeoreum.yun@arm.com>
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

On Tue, May 05, 2026 at 10:54:07AM +0100, Yeoreum Yun wrote:
> This patch is a preparatory change to address dependency issues
> between the FF-A driver and pKVM.
> 
> kvm_init() should be invoked from finalise_pkvm(),
> as this is the point where pKVM initialisation is finalised and
> the system transitions into the protected mode.
> 
> Deferring kvm_init() ensures that KVM is initialised only after pKVM has
> fully established its protected environment.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/kvm/arm.c  |  8 +++++---
>  arch/arm64/kvm/pkvm.c | 15 ++++++++++++++-
>  2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8bb2c7422cc8..663b1d447a9b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -3025,9 +3025,11 @@ static __init int kvm_arm_init(void)
>  	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
>  	 * hypervisor protection is finalized.
>  	 */
> -	err = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> -	if (err)
> -		goto out_subs;
> +	if (!is_protected_kvm_enabled()) {
> +		err = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> +		if (err)
> +			goto out_subs;
> +	}
>  
>  	/*
>  	 * This should be called after initialization is done and failure isn't
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 053e4f733e4b..48b06d384570 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -17,6 +17,7 @@
>  #include "hyp_constants.h"
>  
>  DEFINE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
> +EXPORT_SYMBOL_GPL(kvm_protected_mode_initialized);
>

I am not sure if this is needed when FF-A is built as module. If others
are OK with it, I am fine. But I am thinking if we need to use this in
FF-A driver which can be built-in or a module, we can add
IS_BUILTIN(CONFIG_ARM_FFA_*)

-- 
Regards,
Sudeep

