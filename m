Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FF6CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UM4snv3HyBXCnT4o3yFHC4lEa74fiilyetDqdq6lntg=; b=1+GdLOxsEQeKhmU8l09e4/tnw4
	EKPvQuXQjBTmhkfEzJE4yGc3vNNmRL3cUL7FNxo8n1MD4lJ4hXn664fk8oZlObpvMSbBXsmGFy7t1
	qtwBnl4hCNKMNilnhs7XeX0fqPIe7FW7gbm0zmn4B16CnktlQoxyXxjAXN9SRdyjbGeo9fCbXbG0Z
	delntY3D1LrAV2Yq0biwJalyxOSmSgulHwRzJuEgyklXWIll/ds16dwrKKPglFByWcDYWVntAL7Dz
	eiXvdtf/1Bkf8yQHe9VMKvKCTWcMNYsfuM1K5JSIHVMTUb95CM0fDOi3i+33zOZ9/f141Yao/Bxir
	Bkv2IoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvIO-0000000F20J-2dFz;
	Wed, 14 Oct 2026 09:29:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvIK-0000000F1zt-2cex
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UM4snv3HyBXCnT4o3yFHC4lEa74fiilyetDqdq6lntg=; b=qddGjjnKxIeQbTIx2fNhAJv5pA
	HwNjLubZ+h1Vgu7RPxwNGuo14QLCnJahLChc8I0uFSdJlL/J6ZobO5bDDN4ptbDho2kg0Us8z56uy
	ZbySZ/fCocCgG5If9Wj9E4IhBkwXglrIBEcGHxAYSO5wabKoQcMuEG4Fs9vBM7swDlmILeONPR3cf
	5aogsdMyKc8O/8u9yQBlgG8FmBVg98hK0UGVLyjrTy7Lv25W82Spg+LOuv0cmDVyM692TY8NTivjH
	Y8xV3p9rZ344VbS0yMQbJUxtlF9GG5nxhcj5g1sCtz5MnAk3M6/HPqmMiyI43XNdizEJsKUr2XlCI
	+/xsSDtw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvIH-0000000GYqF-1sXk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:29:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2408515f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970143; cv=none;
        d=google.com; s=arc-20260327;
        b=I3x4fZzly66LnPbncgygWy4soANhEBpUnet9jBSZZVMS5Jb6H2/DkLYZ85RwEfBxIL
         wRMMF7ltI2UuqOucXDYznH+cSf51FF0dMzyA9r2FTQy1F2KG0yb1RVdk8yCqjcFLaEF2
         mcjAuMMyEvnYEG6gs2d6j+/hq5SWs/rTnhpPmFQ7EdS86xe1pT7YyER6uTHEd9iM0HFs
         hBdmrjqOoxfaagJIXo3Q/BrLsKEpKbfZ+X9gduqlffU+PwHpiu8/YpWpYg+sjmdjWAUq
         AlcvMy/UIfpFAU4JnmRKYF2UBcqzbYI0eqbx+iMrBdJgpABoGX/JTTGisR1kZ97/eNhU
         scrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UM4snv3HyBXCnT4o3yFHC4lEa74fiilyetDqdq6lntg=;
        fh=oyGXYjjWWIIG26WAoMT+F3TdBdagJNAlUL2g/vL+L3I=;
        b=fJbC5pW8uqoB6ycLuEADf/6pXgFYNoOY2W1DbftFQYY+fnZrIMS7hH/Xg3yy6apU/r
         xNShP6NRbYXHz7mtIGbeqGWNwgXAOidSkTEVehY9DFPqaGa1rNqFSX1G6qRw7tbJONnd
         njPQWIoaeQhluEgBfwum1HPYmK4LQtLA4pZ0skxvfEE6c7lOxdnYXFQN+q2r1atjP3bV
         GEGF3XHBPVmmmXaxwDZPfCv1R4Ht4d0yuLeFCvNzPIlGiRgUgc2yh1FAhNU+wZ6bHfWi
         Fm41wsEOJNEzClLtf2aq7GJtOlZE+b4Oswd5edIWIUIYBnWplCmeTYG9eOE7dS0u1LOU
         PSdw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970143; x=1792574943; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UM4snv3HyBXCnT4o3yFHC4lEa74fiilyetDqdq6lntg=;
        b=bQpESnHeNs/AMbIHw5543VWGyIf6sgwaDWPmFarHCnWufoRQWiGjDxUK8M4VwvYtsM
         mHqVmjwhyW5PnZyqJallDH1gDwyWzhud0umq6VNLwN+sZf0t9wAyDb8ksan2pNHKUVZg
         ps8FQJ0sm/F92lLZI4VNMnoVTQ8A2NIEzGnsDzghuS9onKInee82DOI+Xtpk6x9gpqqf
         +TgO2r1G3QIV/zOj2sBMHQtrQXYtgpwXoi6/GL+rjvbiqljb1VlAXXs//4/cYq1/wsch
         9RHMIf1dBcktQJ8Fd3MSD6cWsQsao77fB7zpwlRJrlmZQWE8JHrjOle/wvbSnbtiRiYQ
         ut7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970143; x=1792574943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM4snv3HyBXCnT4o3yFHC4lEa74fiilyetDqdq6lntg=;
        b=hAV9d7yD51rn8C2XOPqhZ3WjEVu+aUdZTHXTErVpjMUka9vASMD5AvxhnYa8FRaBRg
         ZdB4437/rTYC82RGOUCy+axU6jDV9gwqaetQvyrulKxvNVNZdNjdX2zwatPnITeqliru
         wf3fRYBLSBObU96oWAd4TTVFGpYop3UtcezVJV6z6PnDlkcw9+b9nBAziGBCZq3C10Nc
         uDEX6lR6u9umyr+YI+k5SI1ScteYT3TumPd/yTNsiNfnS0WGzDWorYjjJNjiyxZH45ik
         u4VMhew2Cj6Q0MO5jmgprOlbhEZb+d0ARMg6fBu2KvrlU/C7Hz3oQB7vECACaywY08Wk
         ai7A==
X-Forwarded-Encrypted: i=1; AKwUvBzZ74Fqz5eHmhDYhKauemBUhf6n22tiZhqn3YN9+NulmrkvPfw4L4ya5I+NSuhVLZh15G+0eU6amTdiV94cw0N+@lists.infradead.org
X-Gm-Message-State: AFq9FYIgKNjZ1R96uvuL3skR8rwLNNGqLI7vgpp/QFzZ7zyhd/piKdfM
	c85mowAYFu9mxy0iuP3vIo1RANcJRxqmdalqN6AD8rzqdxduHbPwRvxo0Q3+46XOoPaIJPtDBw6
	NFUUFnlnlinuy+seMdXPgppqnV8o6QCM=
X-Gm-Gg: AYBFou0nG3LS6KdReueTwL6hNzRZgEwN44prFzFLBeO0uHWpk1iKChxVJR3Owkw7KyK
	v6LhYJT8fLbbzljCrV1iFEQSqhvfhoBQFCxwZnj2SFx/1L44Qa82tENLL8yQSG/SYjGK6tJJCdo
	Mw8Ez1xODeayPvzE1oEF/IV7mH25HazcSEXM29g8qQY5ZjlCNhXf+wNZC99MlDrt0e0blLluiEt
	Gxam1iYk9QaOJyBh+lAJ1cubldjry3WAB2PNPhA6XPV8RfGNV7uKEYUim1x+Km+4gK+R129biOU
	rx2lm7GtjlcAyUxYut4Yh4R2jQ/tPWVCUSdYasm7hSt5dOsc9o8elAK6EoaDOFkgG3S4Ixi974N
	8cDFrAt9NeoXwMdlU+aqdRr8QhZDFPBbj5B58pe14mp8=
X-Received: by 2002:a05:6000:41db:b0:487:1c89:f158 with SMTP id
 ffacd0b85a97d-48dca3433dfmr21443506f8f.14.1791970143295; Wed, 14 Oct 2026
 02:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
In-Reply-To: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 10:28:36 +0100
X-Gm-Features: AclHuK_hpJt3R0zDHjAZL75ikzTNtzzFWfnolY7PI7Bi35zqbWZzmjfcVJRiUWc
Message-ID: <CA+V-a8tpVEqJTKr4JS2aEcgr6yXzmh8j==x=+54o-rAyBwLrRQ@mail.gmail.com>
Subject: Re: [PATCH] perf/renesas: Remove remaining RISCV_ALTERNATIVE references
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_102905_713765_BE87400E 
X-CRM114-Status: GOOD (  22.13  )
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

On Tue, Oct 13, 2026 at 9:40=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> As riscv always selects RISCV_ALTERNATIVE, the option was removed.
> However, a few references were left, making it impossible to enable
> RZ/Five support (ARCH_R9A07G043).
>
> Fix this by removing all remaining references.
>
> Fixes: b924210f542e13c7 ("riscv: remove RISCV_ALTERNATIVE Kconfig option"=
)
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be applied to riscv/for-next, or folded into the original commit.
> ---
>  drivers/perf/Kconfig        | 2 +-
>  drivers/soc/renesas/Kconfig | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 245e7bb763b9947a..8cef4bdef76aecab 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -117,7 +117,7 @@ config STARFIVE_STARLINK_PMU
>
>  config ANDES_CUSTOM_PMU
>         bool "Andes custom PMU support"
> -       depends on ARCH_RENESAS && RISCV_ALTERNATIVE && RISCV_PMU_SBI
> +       depends on ARCH_RENESAS && RISCV_PMU_SBI
>         default y
>         help
>           The Andes cores implement the PMU overflow extension very
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index a63df28df3b5e7c7..0b6876ef6dca228b 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -461,7 +461,6 @@ config ARCH_R9A07G043
>         bool "RISC-V Platform support for R9A07G043F (RZ/Five)"
>         depends on NONPORTABLE
>         depends on !DMA_DIRECT_REMAP
> -       depends on RISCV_ALTERNATIVE
>         depends on !RISCV_ISA_ZICBOM
>         depends on RISCV_SBI
>         select ARCH_RZG2L
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

