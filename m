Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC51D6B09D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twFvpc0i3TryasBkxK98iJJPXOi65K0zMxpJo29cyB0=; b=xlpZxwED6p6CvY7zH6kBMwYcV7
	LvM8fqAe7ZFQA5AxzfS3yQKk5mfw4Ns8OXA3T31j64tX9hukvQFCJnwGUGQigT0szXRBqk9QVsZLH
	tZa+0K7qIe10YBDnv10XOl5RwmKU8qC84wAh/+P3Bc6232L+VYRkQkQXE8hX2+Fk91ZDg84AwzT7T
	2MMj4DyTkxY3Vzg7wSOmFDqWKSBrLMxABZdzbs1RL4KEj3JEJ6ABu7GoKRLh6/yNBT4mitLta01LR
	HIwRevL4jMCrd9ae7neUeb3dgJKuP0pw4nbKXdLVsplT1zdfEWE2ajb3gOXeUPw4JPf7H8+3I5m0S
	Qv9ageWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlV3Z-00000000ME5-0oho;
	Thu, 29 Jan 2026 16:39:45 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlV3V-00000000MDd-3d3G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:39:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42fed090e5fso1021955f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 08:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769704775; x=1770309575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twFvpc0i3TryasBkxK98iJJPXOi65K0zMxpJo29cyB0=;
        b=tmliVEYXCE37Ma0FU7SdBPPPsWOpkLlo9Kae4JjgJk8cLB3DsoZl4Lb09PvTH5wntU
         RkJe/TkaIM/HwtccKJBEsXNdCqtyVF0KhtwNhJPbOBudQib5De8aWO8LS6vum9dv78n2
         oasTWumZf1NrBPaHZ5OTBJA65FY5uX1lnzbNUZqJLWPZ3TqqgWuHV/iujCmjeL4ftPXc
         UAeX+KJ3P64tODN/2NXutvKbsNxwd2oWYpaL6Y5bULfzqDyGx5WK/BXiLpwcCqDKLMBV
         nK3/jSUfkMGeXqbjel9V1/y4pLZt7RT7HYKj/obGkRgJN1+hkJBIEWQao25HfvXXbBpy
         Wo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769704775; x=1770309575;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twFvpc0i3TryasBkxK98iJJPXOi65K0zMxpJo29cyB0=;
        b=mygfsy4D5xI6T9J27dOyitJu4vW9gVys27YIQ87Bgdg4FAZzGz649sSVbIShDPzAS9
         Ev+5cD9e9PihpZF02nleH7rKA4c/nw3Iyv+MNpNOWBkMrrthDbF8vk73+e42hMTKejEV
         6uVm70qnA7u58Xc9k+kVjtCPOsd2pea4V/N5K4lN5mmEGLt3MBfUTbxMoZkfiGVEl46o
         Za+0nTpb/TYP0R35U/3S/TuORVhKGdV7nd67udGsb8sqqRe58jMpPztBok9dW6aoA7bm
         TYF+HmBFHgucWyW7NNGyb6DpRRSQ5Q8A9hXPoTP4scT8a4sRIGm1B6av1NGtvW7b7/DB
         s9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCW5/rz7kMpb2/28ZhNPMRWBbpF9MtZTDZ6opPe+eqEbKwWghKgkpnN5rV8Ny3Qi/khznBnzQIFukDwGobtDQIy3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0koggYKR4yXarONkj0SXv2yx73qnufAKYhqGSO+E8w9uAueOX
	aItr1vPf7BWiW/MJF69FjSsRUkkxby8DdkWP7U6IBBdh9D1wxqT13O84sm1QN9Vzpcg=
X-Gm-Gg: AZuq6aIRl7EBPK+8Ia/UPyhG/NV7bAQl5rvv5WsIB8GJIMlK7G5jL+JLRW0wbuadVn7
	33q8Yopn7m+Axs7MQADIUR5EFGBqe42glmODdZLUcAaxHtBPMtETW6d1NnAOa/ecoFB+eE0Pp34
	MPTNKPZKBShxCfv2DjA2F53YfONye28iSHCcoGRatpTCvQB/5gHydxzUn4NqJBevYk7GzMK0ImB
	AbFKESFYk6lo+cADftRKVfCclaF1InsNfMX4SjvFmwd1xgSgNH+wgs6b6C4uAc+qr2xTEWHUiTr
	iee2xYLGB8pZryb/V6oc0r+mapqyb2truy+KcpG3EqmRy+qBeW7c/tnc093M/1pTRDzrtWcPjaA
	GKoTG0c+in0JTWlvxPkTaVFGRPYa4OxNUR44/SPyhGTZhxVKDp9Y2OT2geEEJpIL8A5/6VUKvQ0
	sc0cgcVoK6Goc=
X-Received: by 2002:a05:6000:184e:b0:432:5b81:48b with SMTP id ffacd0b85a97d-435f3ad5c6dmr249217f8f.61.1769704775134;
        Thu, 29 Jan 2026 08:39:35 -0800 (PST)
Received: from draig.lan ([185.124.0.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfd4sm14914838f8f.25.2026.01.29.08.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:39:34 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A5D885F878;
	Thu, 29 Jan 2026 16:39:33 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,  Joey Gouly <joey.gouly@arm.com>,
  Catalin Marinas <catalin.marinas@arm.com>,  Suzuki K Poulose
 <suzuki.poulose@arm.com>,  Will Deacon <will@kernel.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <shuah@kernel.org>,  Oliver Upton <oupton@kernel.org>,  Dave Martin
 <Dave.Martin@arm.com>,  Fuad Tabba <tabba@google.com>,  Mark Rutland
 <mark.rutland@arm.com>,  Ben Horgan <ben.horgan@arm.com>,
  linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
  linux-kernel@vger.kernel.org,  kvm@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 04/30] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
In-Reply-To: <20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org> (Mark
	Brown's message of "Tue, 23 Dec 2025 01:20:58 +0000")
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
	<20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org>
Date: Thu, 29 Jan 2026 16:39:33 +0000
Message-ID: <87343o8jay.fsf@draig.linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_083941_935061_65783503 
X-CRM114-Status: GOOD (  19.10  )
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

Mark Brown <broonie@kernel.org> writes:

> Currently when deciding if we need to save FFR when in streaming mode pri=
or
> to EFI calls we check if FA64 is supported by the system. Since KVM guest
> support will mean that FA64 might be enabled and disabled at runtime swit=
ch
> to checking if traps for FA64 are enabled in SMCR_EL1 instead.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/fpsimd.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index 887fce177c92..f4e8cee00198 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1948,6 +1948,11 @@ static bool efi_sm_state;
>   * either doing something wrong or you need to propose some refactoring.
>   */
>=20=20
> +static bool fa64_enabled(void)
> +{
> +	return read_sysreg_s(SYS_SMCR_EL1) & SMCR_ELx_FA64;
> +}
> +
>  /*
>   * __efi_fpsimd_begin(): prepare FPSIMD for making an EFI runtime servic=
es call
>   */
> @@ -1980,7 +1985,7 @@ void __efi_fpsimd_begin(void)
>  				 * Unless we have FA64 FFR does not
>  				 * exist in streaming mode.
>  				 */
> -				if (!system_supports_fa64())
> +				if (!fa64_enabled())
>  					ffr =3D !(svcr & SVCR_SM_MASK);
>  			}
>=20=20
> @@ -2028,7 +2033,7 @@ void __efi_fpsimd_end(void)
>  					 * Unless we have FA64 FFR does not
>  					 * exist in streaming mode.
>  					 */
> -					if (!system_supports_fa64())
> +					if (!fa64_enabled())
>  						ffr =3D false;
>  				}
>  			}

This is conflicting with the now merged 63de2b3859ba1 (arm64/efi: Remove
unneeded SVE/SME fallback preserve/store handling) so I think this patch
can now be dropped?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

