Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17803C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOf8LHzCJGb9DLLbIqkHEB8RegxFEU+aj+xMEqBxFFI=; b=jY3iS5PlTZA5dNt3hYAXAb8eWc
	cr/6r2srsBE9b/NiUD8GZFWvMBHlOXR1F9GqlVQi9i9DtWBHTtebIAFJf3C4jxyGHCIWBftLV5ngH
	xpjIYn1WNCMHP/5S7pgn5oakKdfUtfTvf4JoTIcO4ceu4eYxSsI1LEnM4SfV1FVmtthofwLniQwAN
	zaOBtCCuhhg2fXboI06/dGJ+xnsNQRPdVrzNQmU5rjdKXOWnXytUdFqJly1pESgc4BlIFXk8JMtDz
	wn+g79PJOsgLCfgCHcJ30uO6c8nfAeFSn1kPgaZpCe5ejI3NjRSglRljPhn7nFH7SUkH/Bf48Y62y
	bGPmKnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tHM-00000004Gmc-1f4R;
	Tue, 22 Sep 2026 05:42:56 +0000
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tHE-00000004GiH-3Q9y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:42:50 +0000
Received: by mail-yx2-x0e.google.com with SMTP id 00721157ae682-895fd505824so31308697b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790055765; x=1790660565; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xOf8LHzCJGb9DLLbIqkHEB8RegxFEU+aj+xMEqBxFFI=;
        b=UmdpuKq43PDY/DRLrx3qwiHu0crNFI+KUAiVbsg238Yzdwrx78C3AGZ0LpsHq+9xF1
         bJgECO3OxoGnI6aSznXkZAPas7g7wP8x2TrrEoMU35vrZazqhWs92Z/sGTr68o0rLhFr
         hUqIxztrxRAWra2XvHwjStsLPR6w+C+XlYFWBEJuVg1py+29hbqWnrLl9u9W3UW4B6bV
         3X8c4zNlYRYle3Cmryxxy0UMmJfIELPKhEjbOe/Pjm7dhzIJUjPpZ9a4y76mpOBGGCZH
         LYMSs5Xy7PpeFJuOrtDkktBX0FW4tNQz104R/ICnjkfthMfx6A4LMVVBt93kpO7Lu7ch
         43og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055765; x=1790660565;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOf8LHzCJGb9DLLbIqkHEB8RegxFEU+aj+xMEqBxFFI=;
        b=qoXFlY2Al2mvPoZQFWeOtlu4DhRiwj5sOvH1ZG2ClgofxS/PotmKEVzvLbXAPwskIR
         76JeELD1AsombOE5+F31Gulr2T9CorG6T2UOHWOVA551QmqKQHtjku8W19NgzDvnU/X0
         xdf7P0i70mot4pg7IkAHXx4QGM/YT9H3rCESN9XghgpNAEPEB4Be5Ys30bDCKyyRjoRF
         MK5vhuSY1B6g2FfdavamKxdg7NQL7MOcXqdj/F51SrtRFWAwZlRXdTxF2PWYe7nirplR
         dYYjms6JNB6QhKUmycD2xhot7nXvzxkONnwPEf6GGX5CRuXMCAl9OsYj+MEPV5Ykp97r
         H9mQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKlnl9vPHPMpcZLo+7dTw1uPe6Q5CvWgxrRjFrSYxkV/OoMbHpLi2kcC92d3uH2PDNOcqRjZ0+SU8EmyVAE1sz@lists.infradead.org
X-Gm-Message-State: AFuF++nplip+UO3YWFcLvg6OGFIeBpuGptHPU50inGndAtDKMTBhhu1y
	BKL6unIBbc/WkbaDttjNmnL7CcFjZCmN/2AdqUxll2B9GQPrOuVTVIXx
X-Gm-Gg: AYBFou1m2k0LxZcezRAzJonvpdPRrozzBP5d172/SGkh+IWq9P3Rgln4gGDfxAkNzmW
	A1LwMzempfbe5IrctM5lY4JSJmLovILespOHPbl8cfT4ci6iDgEBDFJZh3P7GFgnWDKT/diwrFv
	weC78tQQT9W4fPkOxDJUJISfjr3bWH6djb/pMWw/WVHBPssRk1H4C6ykWAtHe6QTVApI0tXSx6V
	W3zNX4rmyhH8ZDtgdoZU9I8Bq6lPDyou9hqOH2pI0QoKFWul5SANDJwWDv/InZFRcJZth83mvY/
	fkUiRxrjXG4Nvubj1wzuh5RQy80g+chKGkbbn2rEb+H8a7Le+ssmu3J9yxfsdRosxO17V6LUTJ5
	b+tXzVOq3Ix4AWEX1hqnE5UYh7bwHt4U/4wbYvkYSDg++NDEN/emBIOjinZbsxmSoNsVh/CR7PZ
	q3+D1mEGvN9P+5O8mD9FgyVOZ9SnKTMU/F2sJdHmEw6Fr6hq3+HvvGfCU3X0lAwe4Q33XLdZwJh
	NTHcYxuvatAnA==
X-Received: by 2002:a05:690c:a756:b0:882:1d1e:d73a with SMTP id 00721157ae682-8973090270amr29013187b3.4.1790055765385;
        Mon, 21 Sep 2026 22:42:45 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2c24c4fa4sm2402157b3.21.2026.09.21.22.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:42:43 -0700 (PDT)
Message-ID: <71cba843-1643-4f5e-9830-9e60b5f1c334@gmail.com>
Date: Tue, 22 Sep 2026 01:42:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Eneas U de Queiroz <cotequeiroz@gmail.com>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, brgl@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
 <20260921-qce-fix-self-tests-v8-10-107537869a72@oss.qualcomm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260921-qce-fix-self-tests-v8-10-107537869a72@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hZGDlRLrKnd03jrOhfI7ouRT"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_224249_796827_A5238562 
X-CRM114-Status: GOOD (  25.09  )
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
--------------hZGDlRLrKnd03jrOhfI7ouRT
Content-Type: multipart/mixed; boundary="------------hcBi0xuRtuG0C0y5h9SjgbL0";
 protected-headers="v1"; hp="clear"
Message-ID: <71cba843-1643-4f5e-9830-9e60b5f1c334@gmail.com>
Date: Tue, 22 Sep 2026 01:42:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Eneas U de Queiroz <cotequeiroz@gmail.com>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, brgl@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
 <20260921-qce-fix-self-tests-v8-10-107537869a72@oss.qualcomm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260921-qce-fix-self-tests-v8-10-107537869a72@oss.qualcomm.com>

--------------hcBi0xuRtuG0C0y5h9SjgbL0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9/21/26 08:58, Bartosz Golaszewski wrote:
> The self-tests for this driver have been fixed. The crypto algorithms
> are only registered if the user explicitly requests it with the provide=
d
> module parameter defaulting to false. There's no reason to further keep=

> it unbuildable with the BROKEN label.
>=20
> While at it: update the Kconfig description by saying this is an
> "offloader" and not an "accelerator".
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> ---
>  arch/arm/configs/multi_v7_defconfig |  1 +
>  arch/arm64/configs/defconfig        |  1 +
>  drivers/crypto/Kconfig              | 16 ++++++++--------
>  3 files changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/mul=
ti_v7_defconfig
> index f9b8dbf9318c9d4947e56ef0159311634bf0c1ee..2d6292f8cab39596b540084=
fbd8b30f4c25cd4ff 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -1323,6 +1323,7 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=3Dm
>  CONFIG_CRYPTO_DEV_ATMEL_TDES=3Dm
>  CONFIG_CRYPTO_DEV_ATMEL_SHA=3Dm
>  CONFIG_CRYPTO_DEV_MARVELL_CESA=3Dm
> +CONFIG_CRYPTO_DEV_QCE=3Dm
>  CONFIG_CRYPTO_DEV_ROCKCHIP=3Dm
>  CONFIG_CRYPTO_DEV_STM32_HASH=3Dm
>  CONFIG_CRYPTO_DEV_STM32_CRYP=3Dm
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfi=
g
> index 982ea1758eb667a1949721140961764b3e9be1f6..55a2e8c3ae3522630df8c31=
cb2b7c7663e973aed 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1957,6 +1957,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=3Dy
>  CONFIG_CRYPTO_DEV_SUN8I_CE=3Dm
>  CONFIG_CRYPTO_DEV_FSL_CAAM=3Dm
>  CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=3Dm
> +CONFIG_CRYPTO_DEV_QCE=3Dm
>  CONFIG_CRYPTO_DEV_TEGRA=3Dm
>  CONFIG_CRYPTO_DEV_ZYNQMP_AES=3Dm
>  CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=3Dm
> diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
> index 0189dfdcbbe11098ead0ea194293422a31d8fe65..baf6c4a4c8aed663e89ae24=
68a7e9ed9dcb66f34 100644
> --- a/drivers/crypto/Kconfig
> +++ b/drivers/crypto/Kconfig
> @@ -527,17 +527,17 @@ source "drivers/crypto/marvell/Kconfig"
>  source "drivers/crypto/intel/Kconfig"
> =20
>  config CRYPTO_DEV_QCE
> -	tristate "Qualcomm crypto engine accelerator"
> -	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
> +	tristate "Qualcomm crypto engine offloader"
> +	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on HAS_IOMEM
>  	help
> -	  This driver supports Qualcomm crypto engine accelerator
> -	  hardware. To compile this driver as a module, choose M here. The
> -	  module will be called qcrypto.
> +	  This driver supports Qualcomm crypto engine offloader hardware. To
> +	  compile this driver as a module, choose M here. The module will be
> +	  called qcrypto.
> =20
> -	  This driver does not have exclusive access to the
> -	  hardware, causing races with the secure world.  It
> -	  is also slower than the CPU.
> +	  NOTE: This driver does not have exclusive access to the hardware,
> +	  causing races with the secure world. It is also *slower* than the
> +	  CPU for the same algorithms. Use at your own risk!

Would it make sense to clarify that this is only an issue if you pass
do_register_algos=3D1?  With do_register_algos=3D0 (the default), the
driver is perfectly safe (unless you made a mistake elsewhere) and
saves power, so most people want it on.

Also, if I understand your previous messages correctly, Linux currently
doesn't use any of the features that would cause the races with the
secure world.

>  config CRYPTO_DEV_QCE_SKCIPHER
>  	bool
>=20
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------hcBi0xuRtuG0C0y5h9SjgbL0--

--------------hZGDlRLrKnd03jrOhfI7ouRT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmqyFU4ACgkQszaHOrMp
8lNAXQ//aGdnZkkwqbte0yMCxsNvRT8fzkRkN+G6RbFCXrZTBTldeYeBFF9EVKHq
BvXdeWWcgRF7ucW/m3up3k94kMaG2mPBhOqRQUeOWcxg2lFCACnwI2JIU9v+Q20l
KQzbvfYAk3wGNqGmw3U8Be1ZycMZFtiiHqLlomXXzW0jyJVmlTyRJWUTH6MImFv5
GUkzvLUI6rFNzl6D+RO5MjEEHQh1jnyDjuS5ANk6bs6aEixLDath60rcUqaxmppC
KPSkylFQOQv1mLU/saPYw71WeomPTQivWvBBxaQJFC+acYmMpNp/SSzqMeH2HsIU
cBtofkhBYEKtlwNB57ZGvwlJ24phrLrgR0G3ywdVROO22stuxtxe3H7roaLwEkNg
GJkCWK7z6NePSivu/KDSAvprmirjZc6Ryb3uSpacaHQnFq67S6+IG03SZdKaDd+6
9VQVY7yifSt2Gg97rb84BkqajHTa3qDKLbONIrH0x4tiYOZ3InKWGotNgwrr0T4/
3fUb0WlNrJc5CEFcMS9OXNiI1rvNLKY0xRzcZjai+Kc+Xap1fSTstr4hIq8zAqBv
yU5ktQvwFVBZrfrcKkHA1nTOr98978F65rP4QfLSvcGvATBWO3WBJuL/LZ5x5yxr
F5oQzVPVA4m2qziCiS14ODLspfAFxb8d8u8mY7B0CYlPrqfGoj4=
=rE7a
-----END PGP SIGNATURE-----

--------------hZGDlRLrKnd03jrOhfI7ouRT--

