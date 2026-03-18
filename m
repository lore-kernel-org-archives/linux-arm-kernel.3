Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491C010775FD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lEDcaAHvbU+nel+16gcGTDp2QK4epOso8XKjMzmLW8=; b=rrK2GnV/7eGLWPdDWhc6r0cmAR
	kOHkRrtrVtne08y+fYathC34LAV48r9meATcFh/NK1tFkN2K/kSGh0daDFSTglOonmrw+lDg/n1kI
	fLgoUXUWOZ82GWgIC6b7jgSCo+JE23x+GFDWYUX504bZ5I8YpowuJo+H6+LnMe36ADX8IoxQwnwkF
	Io7wk9WPiTEZYw1/iNvnGHtb2UpzJo/Onp/XF6629zpcUAfy0h9ki+ZNORaxxR1cZ9muQMOcDs2bS
	5SlMKE5IkTcP+YtwWpgon8VSAb1qGZyeMiTu0Pi6u2PoTBGPN7dEc6PyA5oACRfagTj0f6xjHI3sy
	Nfve4M+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v0i-000000097Bz-0pKg;
	Wed, 18 Mar 2026 17:48:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v0g-000000097BY-1RMI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:48:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC8C844090;
	Wed, 18 Mar 2026 17:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAB6C19421;
	Wed, 18 Mar 2026 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773856125;
	bh=n0MnqJl2TOeHEpAg4OVfr0lxtUkQnytUwf9VSMN6vPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOgv1+2mwpavGPO2QlnbCxclonKXFB+AxWUsJ01xE2+V1JtCkdsmGshS45GkRQh9u
	 2onntOOl8y4ZGEgr8OWwunDZjjHOQCYviLUb8rxV+ku/0xxTlsZKwIlxeyJ7px12Mu
	 86Xx/KDpcj4jMK0Ad+eAad6UyNB+GGaJyzn2FDDJxMd6jVUgIlYZTtM270S7PSSGYi
	 kWXd4e5jqIWXmza/mPZOj5lKKU7KimXD2JFJVD/NXdWvgbpko28vf/s+QdyuTnkIiR
	 G+gN0Zi9dVfhR/megVQkY4HRAtwPvz4Zw3IGRBL1tEeiAb0yOC/YQZj021qQ4eYBbF
	 N4HApQJcXAZ2g==
Date: Wed, 18 Mar 2026 17:48:57 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 11/30] KVM: arm64: Store vector lengths in an array
Message-ID: <20260318174857.GI2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-11-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-11-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_104846_401267_6C89B7E2 
X-CRM114-Status: GOOD (  15.04  )
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

On Fri, Mar 06, 2026 at 05:01:03PM +0000, Mark Brown wrote:
> SME adds a second vector length configured in a very similar way to the
> SVE vector length, in order to facilitate future code sharing for SME
> refactor our storage of vector lengths to use an array like the host does.
> We do not yet take much advantage of this so the intermediate code is not
> as clean as might be.
> 
> No functional change.
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h       | 17 +++++++++++------
>  arch/arm64/include/asm/kvm_hyp.h        |  2 +-
>  arch/arm64/include/asm/kvm_pkvm.h       |  2 +-
>  arch/arm64/kvm/fpsimd.c                 |  2 +-
>  arch/arm64/kvm/guest.c                  |  6 +++---
>  arch/arm64/kvm/hyp/include/hyp/switch.h |  6 +++---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  6 +++---
>  arch/arm64/kvm/hyp/nvhe/pkvm.c          |  7 ++++---
>  arch/arm64/kvm/reset.c                  | 22 +++++++++++-----------
>  9 files changed, 38 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 906dbefc5b33..3c30c1a70429 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -77,8 +77,10 @@ enum kvm_mode kvm_get_mode(void);
>  static inline enum kvm_mode kvm_get_mode(void) { return KVM_MODE_NONE; };
>  #endif
>  
> -extern unsigned int __ro_after_init kvm_sve_max_vl;
> -extern unsigned int __ro_after_init kvm_host_sve_max_vl;
> +extern unsigned int __ro_after_init kvm_max_vl[ARM64_VEC_MAX];
> +extern unsigned int __ro_after_init kvm_host_max_vl[ARM64_VEC_MAX];
> +DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);

A rebase issue here, rest looks good

Thanks,
Jean


