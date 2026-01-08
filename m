Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9C7CF6A81
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6v8yJzivCkGRPQD2RD9WlokTdTcLOTAtGeFegCEmXw=; b=3JyOqqAw29IzgIgGLn9gEz+1Xa
	+EFZ5o9B4oJzLk4+JHftWeL0yvOVXhZRQqlTQ1C/Xc/P3GRIY4MkSahCY3BP2lNdiyZF1upM3a0QV
	I87ZK99J6TEYctcQO1wQWTqwQO0uQxzLUFcfkueKgkH2uExzfjzh9T6yEaKD/FeHZWu/apCCbK5sk
	3FRAM7jDH5BZ5vcSdSn0DNIb5SmuOQfTuPHrr85lTj1mnbuPMWExaWTS7x1zK2iCyQPbhGWTMqbpB
	e/7U9o2p+q9fC5Sz0O0qRQw7YNftqyhMb7KhnzOuoetNvuWfKq6+bNDeg+0dSFtqmq1yin7dVNzNk
	amTU4TUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqiT-0000000HHEs-2xn7;
	Thu, 08 Jan 2026 14:10:21 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqiR-0000000HHE2-36bJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:10:20 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4ee147baf7bso973141cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:10:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767881418; cv=none;
        d=google.com; s=arc-20240605;
        b=KpMcksMmBCqG2FCyYmfCWkACM9NPOUSGX60hVAklcuK6+h4LpPFFg4C9+fdkqHKU+e
         NA1TDUSuCLUYSSM04PTcsc5D1ql+rcFyTRv4vmBHS0ng3aF5PwkYFjz0bWa2Q6Iyz52y
         17+40ywkxvK1zXbkXpweCeoipTY4Atp0pX/XMjFAwJbjeEXMCX5FQ6aONhqq2Mldsk7e
         +URWqkIB9M4WHtba8HQFJ570ZaXPqXJvmUpzQye1N3AqAdQxTH6o8XmBbJBGeLKgGEco
         Scc1VIk1U4HQ6DnlFGzDMcjaya9VCiH8hEl+FjAhAuF/eL54f+6OMKcKaND1bKc+Zad9
         1iHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M6v8yJzivCkGRPQD2RD9WlokTdTcLOTAtGeFegCEmXw=;
        fh=g483vWYkM/iWurncdDIG+7A5nIq2yl2kRs2tjWw7cDc=;
        b=U5eRFQXeERtYO/cnK5wwHVp/qGcJUEX0Kf+gqhDaIiN8pPDMpmjDilG6FK/qriZIY8
         YNjQn/nO8FJVzUXMJEsyY28tBDcnQVoehsfFpfkWvkp7IMl3p+Zy9EAX4CC6UG1GirH4
         hEhUCikwhqeM50Q+Bqzqf2rs3UWYZN9B5YxtCihVMDfITLidXA9fK+fu0uNS4f+7UYmN
         LnGkwilCyEbkrbdtM1ud1xwHiVsxMvuFsi8UEOArxsi82fr8FbOIakElyNAj4yIVuAJt
         La7Fl/bOKGsjuJbKZxU3F3HHnNCBVlwEOMec6DBdy7ix9A8KoPQTO3yfGAKEVKvvX6/d
         Fhfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767881418; x=1768486218; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M6v8yJzivCkGRPQD2RD9WlokTdTcLOTAtGeFegCEmXw=;
        b=ZCiXltiECyXgzQD4sA1xfns6PC6ddeX4LR7zaR7BKY3TKuVcrUvWPzVoHuLVdPFZKf
         YOOmdI+51QVamZhstB5FMOqKGeZ6HsUwCYx/BgxZmd3VwMzUlTfdHtlTZhQcjzY7Qg/u
         fPvkr6aeeZ19+CY0BNqJqEU4q7DpGRaPTh0w9Mau2eFqgMszfrsEroz/SmGkoIVPUltz
         q5vjXEj1hlgHXxt3tFOrDYrEu9rySerlN51Hko9/J03SE914bs1PTp939s/eYYYYj4Vm
         WPPTnBBEWQj9Zuirawz1x3RLNo9qAJVS+iPPHagZVw5CVuQ1TieKl+e0QBjoV0QMuflb
         4Sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881418; x=1768486218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6v8yJzivCkGRPQD2RD9WlokTdTcLOTAtGeFegCEmXw=;
        b=h/xkcpMR4CLvTYuZxBEvKmC+yEj9kKw79pkcdjhL99ee/PCBNJTzI8xv7s7MbqVR6b
         dqVuUV6zmxNRVL6uXBp4lVupC6ONJc3N+jIEDhumRnzJclB3h1BE/sCEX1AvNoluiZyT
         NQ+GhUOm/rrJhxCQg8gSiDNtrdJY3nM56jmBFe/XIAK5vCRN9UXjqyhfwGabdiZ5xeV7
         598jSgon0wQ4CCye2dsW6xnsSgnzO0voWpC9iylR8HBRGaZZ4ztB4oYxAl8o8SubaFGk
         bmbfOUrxUujBtSLXY+nR0sevhVnGitzK8qvdzbBo7B6JNivkdHiKtwCmIsaHthikEbWc
         R9/w==
X-Forwarded-Encrypted: i=1; AJvYcCVf2wq4LFcjycy+CpwXe+0k8axyptt9wayIPc5kiiuhclcKrI8pGTnkcDjCNJsWP4VxXFYTZm12i7Sm8aiBr096@lists.infradead.org
X-Gm-Message-State: AOJu0YwARnIyghjrg0PN7z07XVqK9+BZl/3/OWzwTdfr0O9KjMUWdrE+
	G3p6cAJTw5Z4rgwDFtMi6BfgLfdro8UCpn3bjgqhVEUrv49N4J8BbcpxkLpWNZQ8lUaIhLW7kMN
	tQA8iT6sHMZuhgdA8XyutWteXbs+LeRoSgys8M01y
X-Gm-Gg: AY/fxX4VUjnyLZmzrdwbcmWa1HYVpj6a0QBXsdPXyCyCTZ7i+D+afIZmy2mZ/j6YYAr
	qcrS8oyHpl/7cXd1HuuXdIcBZp58WNt7f0LFmeLWwesteHTSD6YzNmVquNgSdnF+AhJKleG8PEu
	AsyDz9881oiLdKXEKDeyYzbqsdDz77gNkVkvToQ0F5FimrUchFUpk9yBcO0pAgOC2Qsb1ikdUdc
	lYi8ePamieMqjiVX7qM2zu14TAdeR1yTX1Z+tSXSiXwGHpQzak649O6MV02s/ax2qaaUd+8
X-Received: by 2002:a05:622a:1191:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-4ffc0897ee3mr8604171cf.1.1767881418089; Thu, 08 Jan 2026
 06:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-6-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-6-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 14:09:41 +0000
X-Gm-Features: AQt7F2rcFTpAi-WrxH-BJGuce-rrvqsGKbxHYZVaorpjl6SSauHiDAfYA3cghe4
Message-ID: <CA+EHjTznG=6+bYW+mmmBs_QqZ2rXkKTzNxA5KSh3S67H_BBaHg@mail.gmail.com>
Subject: Re: [PATCH v9 06/30] KVM: arm64: Pay attention to FFR parameter in
 SVE save and load
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_061019_809155_4F68E1BC 
X-CRM114-Status: GOOD (  17.04  )
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

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> The hypervisor copies of the SVE save and load functions are prototyped
> with third arguments specifying FFR should be accessed but the assembly
> functions overwrite whatever is supplied to unconditionally access FFR.
> Remove this and use the supplied parameter.
>
> This has no effect currently since FFR is always present for SVE but will
> be important for SME.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


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
> -       mov     x2, #1
>         sve_load 0, x1, x2, 3
>         ret
>  SYM_FUNC_END(__sve_restore_state)
>
>  SYM_FUNC_START(__sve_save_state)
> -       mov     x2, #1
>         sve_save 0, x1, x2, 3
>         ret
>  SYM_FUNC_END(__sve_save_state)
>
> --
> 2.47.3
>

