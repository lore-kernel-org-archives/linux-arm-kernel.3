Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25E9CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vM/wOHbGgB/+niDKSnNnlcAAPUzV0FZzOUIFNQXZ5cc=; b=nT5P7JQHaRF2CpAW3resoIIsYP
	MTjRjcqMo0RJXZxUMb6EHQ/Vl+pXCC5WThMkziLkjXp8H0Da5VuyG2BkYd6XQ1v0cBz/OVL6OXzQi
	qSnszJJFfeL1htRxxsxfMxxHjyKXdr0CAtIUq3WE5/+Hue/LIi8Kl4wJCHFAYnTB1a116wtrL5w2i
	DmOdB/BYQVSNy8i04XgvX826w+hv1jy6AwEnvUMK/zGwSvoVUclPj+zv23S8FQCg0YwqpzD61jigS
	V72DBfxkyT89DDw9FHvIN0WjfLvkr4M82nkGc7qYSSbDGaVNH+Diu9kEiRzxmDsyMHE0YIdKO+SCm
	MtRhVaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxOSP-0000000EUzN-4Brn;
	Sat, 13 Sep 2025 11:30:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxOSN-0000000EUxt-1RnT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 11:30:16 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b0aaa7ea90fso33007466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 04:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757763013; x=1758367813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM/wOHbGgB/+niDKSnNnlcAAPUzV0FZzOUIFNQXZ5cc=;
        b=S/EAzu5g3VuchJHFudyn84j1jvDGeqvb56NlG4xtyyi98H14FOr84cfZIdxVpriqy8
         qds9Y1sc9r/O57kHnpK67mSTFFReCeYA1uh4QnU3P92gZrqVKL/uubW3iyoa6K7+5yK8
         rYEUJiV65ID/weecgoNwcnizyVJ8lGthxK/5agsU1KcWQRQLTxp6We0XI285laF2tGX/
         PhPAzoUI7uk8+lZBd+O0Y37nCHBkTFcB//pkI7ZVZ+7DfUWb9Uv/MjGZ/q5j7eh2s9BK
         UHg+8QiOyq7bsLdwtCZzQXZmcF6coC9Rg8l6QyegffxWPyuV+6mo8Vw24P6awgJyBSTH
         iA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757763013; x=1758367813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vM/wOHbGgB/+niDKSnNnlcAAPUzV0FZzOUIFNQXZ5cc=;
        b=QG2kA4G9Fs8TZ2T6m45NMKs0E3qa2wDavoxdIypiGs2LOV7C68CdW49bGk7fNqy7W5
         xGXdX/MOllc3ba9wDOG4XnM16hM6IqNSFDPzhxnbtMOMH19Yy15Xp9D9XvDtzdRpmGYP
         y79RpfohCB6GbReJ8JjuqM1oB5yYXkMGQe2JawUxYvGzjz99L08sGlaDXkAc7bPpfMRE
         fJLCwmoW5RsDPWpWwX266TWqsw4kC6wiRd8pudAIUaKKmZl2eUkVwHAM6GrdlVZqJymp
         nw6puzCNQpp1gVHjk2l/BZlINNDiIVjKODyssWpQtRTmZU9kMDE2o2l4/FxVPel1yz1k
         gTbw==
X-Forwarded-Encrypted: i=1; AJvYcCWrL2lFQGZMUWXH9p+O6yXvsQ1LxmG31lwMqstjv4ggfqnryEN6yKUW0S7+ECSn+zTmfTUAPV0fTc4S5KTiLF7F@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2AMACaumWR8CRin9WdwU94a5GfjSS73tuTnLCJFVbnyajZJUz
	3wAfBwu69HYFnGYuRtRLRmoF5k7GjVBG3LoIdd8fW1rvxXa9tXKVQIPY
X-Gm-Gg: ASbGncu5OGamixN41XTAgzHCzxowO+qB2y1HRUzyIahxLTPr5EmqUIiW4ngHKFsgDUO
	gxYNDBrW3yiIibjPEG9whtwnFDFHvS5w9QSoZGqyPaMEtGAPVRa8Mgg+wQI5nE2uwuboomzdTLn
	8HgI5BORTg7ifpNm2bNRFHZbviyLiB0EkPHZVLr/tQVPiouhgQ2epJqc1tvuv82F2/sbUWYQdwA
	DkK+bNKCSllsKeg9TZVXuGd2EHSOcuYFSWQ+i99XIYAZ+DLJlS4eywDsEqvmEpCzsRnZcCMdDwZ
	vBOpQxc5ynFcWCjX28C9qsRK8WEClpnhquM+DuyfCzs9CXIAq07BhaTBUswBhTW1lGq+w8EncSP
	+yv8pFWo6zDfyg2T5YWPZdnBCIDJxbfAu7Rj1dutjmKqG/kRMoZz0wIg=
X-Google-Smtp-Source: AGHT+IHGrkQn7+NmuVgBdc10MUVOT+vd1j8NXgn0gL8ncYy9IeCu/BFaE0KTAPOvNiL0g93r6GOAgw==
X-Received: by 2002:a17:907:3f16:b0:b04:5a74:b674 with SMTP id a640c23a62f3a-b07c3a88730mr640143666b.58.1757763013249;
        Sat, 13 Sep 2025 04:30:13 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e720sm551560166b.104.2025.09.13.04.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:30:12 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: allwinner: a527: cubie-a5e: Drop external 32.768
 KHz crystal
Date: Sat, 13 Sep 2025 13:30:10 +0200
Message-ID: <6190895.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20250913102450.3935943-1-wens@kernel.org>
References: <20250913102450.3935943-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_043015_402552_6F5EF1D5 
X-CRM114-Status: GOOD (  14.86  )
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

Dne sobota, 13. september 2025 ob 12:24:48 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The Radxa Cubie A5E has empty pads for a 32.768 KHz crystal, but it is
> left unpopulated, as per the schematics and seen on board images. A dead
> give away is the RTC's LOSC auto switch register showing the external
> OSC to be abnormal.
>=20
> Drop the external crystal from the device tree. It was not referenced
> anyway.
>=20
> Fixes: c2520cd032ae ("arm64: dts: allwinner: a523: add Radxa A5E support")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index 71074b072184..e333bbaf01d3 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -24,13 +24,6 @@ chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> =20
> -	ext_osc32k: ext-osc32k-clk {
> -		#clock-cells =3D <0>;
> -		compatible =3D "fixed-clock";
> -		clock-frequency =3D <32768>;
> -		clock-output-names =3D "ext_osc32k";
> -	};
> -
>  	leds {
>  		compatible =3D "gpio-leds";
> =20
>=20





