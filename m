Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358DBC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 05:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeBALyhsov2NLs00r6InPbscizzSCCVjkUFaijF0MxY=; b=PaQbAP9tXvmTU+i8pqbc695F98
	2bNEOXdTrKR/XjVcTw1nZhH0KrTuQ3cPgLp6XmhLvBMbaz0lWC8GVS6ViKV04WLfdYAXlHCj1qThN
	eV9jmPH517GD5+zY0AlgaLZKEUfCMSXavHIorTeevVHrpSfStad/4V1g18mkAXevjIJJ/YWc2hoTy
	Gb72CyrWsDQIR0mmT2aj+VjL1TsWB1iQ9zMKfuTw3jzAB/ASwxSFF/cjJdZxqaQlRp6ufOsKRp4Em
	VA4ogQbCFeg8rL5xE4h6MNrMfNL/d7UztbsXIbUsoOKQnHJ+oMoUFgMpLQsKfFWAThesTlyzNyDSv
	P36nINFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpfrH-0000000BnkV-40MO;
	Fri, 31 Jul 2026 05:32:35 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpfrE-0000000Bnjr-1K1r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 05:32:33 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-80e2cfe6918so6632237b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 22:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785475951; x=1786080751; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OeBALyhsov2NLs00r6InPbscizzSCCVjkUFaijF0MxY=;
        b=aAPt/D0QvBhlcS2/fG8DAOqupDh++47AV0zySCFHHY1IZUbdmtVfM+F+ss+VQIwG3r
         hoAkI/LU4bg2FAKw3CqWHy+0nrtJT0+bYoe6Wy0joCUKYub4d3vCI8PUnxjIwJ1U0CE2
         LEw4vCFwOlPMmagzpQf2DE8Jr+Ozv6cWL0rSQcIFZfWNskBt8O1b5CVrr+f0MCu2X/p2
         AUf/VCXbALthmdS0rlpKh1sVSIhY/agBw4J+Oh16DzPHecWdz4vwiijFg6mSoDRZVuSU
         6Fkq2MW+6hzdHCerVu1Wt8I/QBW1PSP2oinpViwdsMfu8QG2vBE+zpp0+rOUmG3GXtaU
         JTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785475951; x=1786080751;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OeBALyhsov2NLs00r6InPbscizzSCCVjkUFaijF0MxY=;
        b=ZtbWQsKv6zNAVrKA3yAKwAEAfP8pNaRCU8jtt4gD3dinFTvwms8q9sKlLI00iZX/QF
         nQtrW5POw8jyqPVq2tnzCAOP7+CC/0IEMYXqncMSEi3iTtu1D6/DrNqMXEfSDbUM3hFX
         BkAIk3HlLqGeqwR2TkcasPH0XV2ECwwC34GmaXz2P3IAYn+VVWwy8nU6wezQla6IktM0
         dUO/LwFxLi0pUPGtqq66W4Qv5aPe/yy0wuMhfnUd0KSCRzAQ4nSbKtKhpcdsDNoM3Pii
         lqNHrKqMRDIlhdkGHWE1orvbxSsAW0E0nX8wa4nj3LmgqZFH9T7nzSs7t5GP23tBmLYE
         P17w==
X-Forwarded-Encrypted: i=1; AHgh+RoQBGKKWkT0XMw2Fv4R0aw7vMROF+W8WbBkVwU4E2tTpLsCxQ1IqIX4ZRRJzjh4GasZc9CqysedGie+gGVXPdgP@lists.infradead.org
X-Gm-Message-State: AOJu0YyNr4rLE+VxSgkweqsHWhGeBaDjnTdY+2BciM8qgpZbUYp1XO68
	/d0+dGenTNGxLtWpu6R2WmN4uCXAu0oncRl2YuhBlnB2kg4nAGGAJpiu
X-Gm-Gg: AR+sD12pic+mU1iReVn3R1hjWjnzoHh4j06njk7ofAIZ7/m6Xc4IagbeRgVY/NFYuZs
	j7vL6rjqDQGlEMolEorTFdK7n3ejv3SfjrWeePtRyYyBwde19gj2u7bgbPa5Z784K4NRn0eoSTX
	b02zCcA/mkOLdXhOoPdAT5KRX3xN2wfc0dhUkYjld5wDang9+uYfnX+k/NnPjQpDbIRQQ8lo9dv
	871/Lwg3CS7LImGLwbWvt1lMWTOjv14SHgwpIVPlE4SSXzLHDNDGKkpZWif9+zuIGSE+jJ89zYO
	PqUOYHiC1+7e109mWgnVmdK//mQntuT6/dyu03werCfgYpUKvQMb2XKsfLYfIFtjagmWByXm21J
	jY/U5e+XWJuUV1HTfpVGNElBm7KKAswwPCACQYnn8xahXwL4Mn9k+aTmaboeuhHkqE/kXcSgQ13
	DlGqolbaUPf/1aVH1Z8le+sFgYouHQVAkP+M7CU5DiVDFuwtkuD6IEl6+zzjnzwT8=
X-Received: by 2002:a05:690c:310:b0:81e:a425:fe88 with SMTP id 00721157ae682-81fcbac3e90mr3433897b3.33.1785475951029;
        Thu, 30 Jul 2026 22:32:31 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0fd97dsm1266127b3.34.2026.07.30.22.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:32:30 -0700 (PDT)
Message-ID: <c1594714-5cc5-4370-bba3-9af886a9c8d7@gmail.com>
Date: Fri, 31 Jul 2026 01:32:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260731050838.158825-1-ebiggers@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260731050838.158825-1-ebiggers@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8Y1ZwW6gByfOgAxE8eSRugEz"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_223232_385946_90E13C49 
X-CRM114-Status: GOOD (  26.21  )
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8Y1ZwW6gByfOgAxE8eSRugEz
Content-Type: multipart/mixed; boundary="------------92vHKN2OdgGoaT10ogyC5U4F";
 protected-headers="v1"; hp="clear"
Message-ID: <c1594714-5cc5-4370-bba3-9af886a9c8d7@gmail.com>
Date: Fri, 31 Jul 2026 01:32:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260731050838.158825-1-ebiggers@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260731050838.158825-1-ebiggers@kernel.org>

--------------92vHKN2OdgGoaT10ogyC5U4F
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/31/26 01:08, Eric Biggers wrote:
> None of the algorithms the QCE driver registers with the crypto API are=

> even close to being useful.  They're massively outperformed by the
> CPU-based crypto (even actually using far more CPU cycles than the
> CPU-based crypto, due to the massive driver overhead), don't provide an=
y
> security benefits over the CPU-based crypto, and have various other
> issues.  They're also unrelated to the Inline Crypto Engine which works=

> far better and is what is actually being used these days.
>=20
> Due to the major performance problems people experienced when
> accidentally using this driver, the algorithms were already demoted to
> below the priority of ARMv8 CE in the crypto API several years ago.
> Regardless of priority, these algorithms also aren't compatible with th=
e
> most common uses of in-kernel crypto; for example, they don't support
> dm-crypt because they allocate memory, and they don't support IPsec
> since they take a mutex which isn't compatible with softirq context.
>=20
> It's time to move on and just drop this obsolete functionality entirely=
=2E
>=20
> However, the driver does serve one purpose which is to bind to the
> devicetree node and allow the interconnects to scale down (though even
> that part is broken, as it holds static interconnect bandwidth votes).
>=20
> Thus, clear out the crypto functionality, leaving just a stub driver
> that drops the interconnection bandwidth votes to zero.
>=20
> Tested on the SM8650 HDK.
>=20
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Some thoughts:

1. Should this be put under a different subdirectory?  This
   is now a power management driver, not a crypto driver.
   IMO it should just fall under ARCH_QCOM, without a separate
   Kconfig entry (or at least a "default y" one).

2. Should it be re-added to the defconfigs?  Most distros
   will want to turn it on, as it saves power and is minuscule.

3. Will this the smallest driver in the whole kernel?
> ---
>  drivers/crypto/Kconfig        | 117 +----
>  drivers/crypto/qce/Makefile   |   7 -
>  drivers/crypto/qce/aead.c     | 787 ----------------------------------=

>  drivers/crypto/qce/aead.h     |  56 ---
>  drivers/crypto/qce/cipher.h   |  56 ---
>  drivers/crypto/qce/common.c   | 564 ------------------------
>  drivers/crypto/qce/common.h   |  94 ----
>  drivers/crypto/qce/core.c     | 271 ------------
>  drivers/crypto/qce/core.h     |  64 ---
>  drivers/crypto/qce/dma.c      | 135 ------
>  drivers/crypto/qce/dma.h      |  47 --
>  drivers/crypto/qce/qcrypto.c  |  43 ++
>  drivers/crypto/qce/regs-v5.h  | 322 --------------
>  drivers/crypto/qce/sha.c      | 498 ---------------------
>  drivers/crypto/qce/sha.h      |  71 ---
>  drivers/crypto/qce/skcipher.c | 434 -------------------
>  16 files changed, 50 insertions(+), 3516 deletions(-)
>  delete mode 100644 drivers/crypto/qce/aead.c
>  delete mode 100644 drivers/crypto/qce/aead.h
>  delete mode 100644 drivers/crypto/qce/cipher.h
>  delete mode 100644 drivers/crypto/qce/common.c
>  delete mode 100644 drivers/crypto/qce/common.h
>  delete mode 100644 drivers/crypto/qce/core.c
>  delete mode 100644 drivers/crypto/qce/core.h
>  delete mode 100644 drivers/crypto/qce/dma.c
>  delete mode 100644 drivers/crypto/qce/dma.h
>  create mode 100644 drivers/crypto/qce/qcrypto.c
>  delete mode 100644 drivers/crypto/qce/regs-v5.h
>  delete mode 100644 drivers/crypto/qce/sha.c
>  delete mode 100644 drivers/crypto/qce/sha.h
>  delete mode 100644 drivers/crypto/qce/skcipher.c
>=20
> diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
> index 0189dfdcbbe1..03113ad3467c 100644
> --- a/drivers/crypto/Kconfig
> +++ b/drivers/crypto/Kconfig
> @@ -527,119 +527,16 @@ source "drivers/crypto/marvell/Kconfig"
>  source "drivers/crypto/intel/Kconfig"
> =20
>  config CRYPTO_DEV_QCE
> -	tristate "Qualcomm crypto engine accelerator"
> -	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
> +	tristate "Qualcomm crypto engine"
> +	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on HAS_IOMEM
>  	help
> -	  This driver supports Qualcomm crypto engine accelerator
> -	  hardware. To compile this driver as a module, choose M here. The
> -	  module will be called qcrypto.
> -
> -	  This driver does not have exclusive access to the
> -	  hardware, causing races with the secure world.  It
> -	  is also slower than the CPU.
> +	  This driver provides a stub for the Qualcomm crypto engine. It exis=
ts
> +	  only to bind to the devicetree node and allow interconnects to scal=
e
> +	  down, saving power. It doesn't expose any cryptographic functionali=
ty.

Should this mention why the cryptographic functionality
available in the hardware has been proven unsuitable for use?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------92vHKN2OdgGoaT10ogyC5U4F--

--------------8Y1ZwW6gByfOgAxE8eSRugEz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmpsM2gACgkQszaHOrMp
8lMpZQ//XmVsj3tB3HhWXcYdo+MuFGqo0LEB/WLs84lQS9j/8jPpEEXLR2LBjNff
pd8Oip7/yDaN6I5K7bSUKBHFjVZYZ1EuAP89pgQGk3zkUdTz6q7gpop65PbU1+nO
55YRhqbDOeD3PDue2JswDg2gVljwqCjbifxHiQBTl0UsTWv2aMJ4u30Ca9ml9DCy
0UCr2C8bjjLcY3m8NTpJSglU3biU7JOOBlw4ie/mQcmKk+LlvLjNWam/hQpDfU4Z
xNOva6EVAQ6q5fwy/AeZ3BP0ItDaoxcjjb0pfO2VNe9Cj/JO2pXp5LzlujaD7EAi
eBFjCFlzNKkrOvwTuaeDUf0hXS/fpr44VxURHjz5RWl5ygSjIktmCFMvA8GK1+SM
39xoAE1VsTCG+jCRM/fou4MbtBZPLgqNGE8g6KPoItKYJqb2cMRWZOVxHge/6ex1
FBKyITbYiuYmazv0obKDSwuJO9h+D+a2gg8hBLyliTap+/d846gQMxQ9fhDWOGhQ
kspyE+OnneI2zQzURHpd5rxvqIMPhmwi0PLCzQYCHhwjF13wVnxsJg2qOarpzT41
qOE+XazlsoxTJjsARymKMd3SfReNKmJYMpqSDi+5gX4LDe1CK3Dqb3JuA1lvsWzf
e3AQeZuL/67+fbt5rYZ2hoUpnFRMXqijqH8gR4ThSVpQ2Fnjypc=
=5vyR
-----END PGP SIGNATURE-----

--------------8Y1ZwW6gByfOgAxE8eSRugEz--

