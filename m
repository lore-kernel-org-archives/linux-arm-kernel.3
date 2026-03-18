Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6783810775F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQdLCt5FMqqc7j/iK3e/RDgM6f66fS5pFPJ0ZomU24s=; b=CGubIlz3RyeSfBwr0rF3VnKHDO
	W+VSYfNbvMMwO/tBJ3aGLx7wBHh1n5EOIOt7rStf3zJJMVCuKxyZVH1+jnRRjl77mJxCzoXmiORCm
	REhiJ4MyI/W5JqOjjBXphNUwuczLgUkGr/pvye8lItyTfd3jGG2TY/e2/45n+3g72o7U3d4+UW9HK
	SUwhn4glRzSLH7qOoENNhpgb7smeu7NcGlmUZMur5ILxftd4V74wYQa5N/SYyxGi53DRQJx1CaPmx
	C1Nc6Pd7p9PEh2d4HCBqGhOTuNyjE9jpDLszG+/KLJRG4p8lhhiEBA9SF/hFsotaCwg4IH93In/GU
	ScS/8Ijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uiv-000000094pP-0B7M;
	Wed, 18 Mar 2026 17:30:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uir-000000094o0-1OTZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2F3860132;
	Wed, 18 Mar 2026 17:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E44C19421;
	Wed, 18 Mar 2026 17:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855020;
	bh=tH6Xpo5vJv6+B5LeABImygawpoxYpTo3oFFwWdJdbG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewp/L6vZJk/jgds3H9pQSa7aOWcU+7xVH93TfvwnIFEY9FqTu9yCCOGTJ8am12C5P
	 yytH4QCbccaGd1AzliYx0ddiODu5VSsMf1W+TiyEYltv2I0SRHm80Chz4ldkDMFTWQ
	 IzNCNzuxE/an2aJ2VBSZMF/845rErytnCrG5tvuSOOjO1fUmZQV8VYvbWvsUYFj6EW
	 OuTNfphk54u92dVzA+saqfmqmXlaBW/GDOMIH5clmeEayLhqQqWSTMPe0X/nJn/Msz
	 9UXjHhJPBwkiU1EmU1mELq/Jq9AoFUfA7NJoHcHQ2l/sTZiNipld8wlK5XOeOQM95i
	 /om8t+uW9bxaQ==
Date: Wed, 18 Mar 2026 17:30:32 +0000
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
Subject: Re: [PATCH v10 05/30] KVM: arm64: Pay attention to FFR parameter in
 SVE save and load
Message-ID: <20260318173032.GC2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-5-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-5-43f7683a0fb7@kernel.org>
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

On Fri, Mar 06, 2026 at 05:00:57PM +0000, Mark Brown wrote:
> The hypervisor copies of the SVE save and load functions are prototyped
> with third arguments specifying FFR should be accessed but the assembly
> functions overwrite whatever is supplied to unconditionally access FFR.
> Remove this and use the supplied parameter.
> 
> This has no effect currently since FFR is always present for SVE but will
> be important for SME.
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Jean-Philippe Brucker <jpb@kernel.org>

> ---
>  arch/arm64/kvm/hyp/fpsimd.S | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
> index e950875e31ce..6e16cbfc5df2 100644
> --- a/arch/arm64/kvm/hyp/fpsimd.S
> +++ b/arch/arm64/kvm/hyp/fpsimd.S
> @@ -21,13 +21,11 @@ SYM_FUNC_START(__fpsimd_restore_state)
>  SYM_FUNC_END(__fpsimd_restore_state)
>  
>  SYM_FUNC_START(__sve_restore_state)
> -	mov	x2, #1
>  	sve_load 0, x1, x2, 3
>  	ret
>  SYM_FUNC_END(__sve_restore_state)
>  
>  SYM_FUNC_START(__sve_save_state)
> -	mov	x2, #1
>  	sve_save 0, x1, x2, 3
>  	ret
>  SYM_FUNC_END(__sve_save_state)
> 
> -- 
> 2.47.3
> 
> 

