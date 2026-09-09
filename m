Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6D9C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzrULavoTQ/WrRZCjul3h8BodEA1weXd5o8Qt80OpqA=; b=pSjakb/eZ/JUqOHueeg/Dpj6QJ
	ZtkPwhvjiDDGJHLzixxoKN0vukDqDJfGc8nTvXSYMR9dETiuhM1OEq77OADJTKiCvpeq+TgcJuzkJ
	WHdo5r56kbovYAOpXp/Xo7eg6motOrHgt2WhBZ2PTwifvQaXs7PDewW5x32goNU/FhBFXnI9JU7+t
	iYW3lOAX61yOdeMXdEDM8xlcDxGUlxZcCSs2xBWH5CX17eiKJLLXLF8OOPWJD6Jsg+J5eQPQEAlSz
	gRit0UPo4xA9aIuy/WjbZx4vsXymxvKX3AKWr5YkS9YAvV46QfbVueHNHW9zixe4oAPwlJ6e54mYt
	0yoccyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HuZ-0000000BieD-0SRc;
	Wed, 09 Sep 2026 13:00:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HuW-0000000Bic7-2cg5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:00:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52BEA1691;
	Wed,  9 Sep 2026 06:00:11 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 545113F7B4;
	Wed,  9 Sep 2026 06:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788958815; bh=COoomdSG2FlqAOqhScp/Ic2bx4OeDuloT0b59UMRbdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s58mQgbnP66N0tSsR0ISNWZsvL2/PwI5BHGINryKYJdKCuLFiMKLHOvStA5xDsP4h
	 HqJj8VAURT88yoH+vmDsR5Yo4Ea99qNf7dbdm+V55Qia3YuxFhOXOL8gqZ/CPX+7VP
	 LVy3xukrI30eMDBzoMp9lI45Uq4J0Wnq6ZUaoJPQ=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 07/14] KVM: arm64: Forward GCS exceptions to nested guests
Date: Wed,  9 Sep 2026 14:00:06 +0100
Message-ID: <aqFYVnIgvXGXzHk7@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-arm64-gcs-v20-7-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-7-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_060020_745177_E75FE2BF 
X-CRM114-Status: GOOD (  21.15  )
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

On Tue, Sep 01, 2026 at 10:47:05PM +0100, Mark Brown wrote:
> For nested guests where HFGITR_EL2.nGCSSTR_EL1 is clear or when there are
> L2 GCS data check exceptions we need to forward the exception to the guest.
> Add handling to do so.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kvm/handle_exit.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index db37678dcb05..a8198e96fcb4 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -304,12 +304,24 @@ static int handle_svc(struct kvm_vcpu *vcpu)
>  	return 1;
>  }
>  
> +/*
> + * We might get GCS exceptions that need to be forwarded to the
> + * hypervisor when a nested guest has HFGITR_EL2.nGCSSTR_EL1 clear, or
> + * for a GCS data check exception for a L2 guest.
> + */
>  static int kvm_handle_gcs(struct kvm_vcpu *vcpu)
>  {
> -	/* We don't expect GCS, so treat it with contempt */
> -	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
> -		WARN_ON_ONCE(1);
> +	if (!kvm_has_gcs(vcpu->kvm)) {
> +		kvm_inject_undefined(vcpu);
> +		return 1;
> +	}
>  
> +	if (vcpu_has_nv(vcpu)) {
> +		kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
> +		return 1;
> +	}
> +
> +	WARN_ON_ONCE(1);
>  	kvm_inject_undefined(vcpu);
>  	return 1;
>  }

Oh handle_gcs, if kvm_has_gcs() && kvm_has_nv() -> Inject synchronous 
exception. Makes sense.

(it kept bothering me that the !gcs and the gcs case do the same thing, 
except for a warn_once. So I thougt on suggesting:

+	if (!kvm_has_gcs(vcpu->kvm))
+		goto inject_undef;
[...]
+	WARN_ON_ONCE(1);
+inject_undef:
>       kvm_inject_undefined(vcpu);
>       return 1;

But after it was done it did not look better.)


So, FWIW:
Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Thanks!
Leo

