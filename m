Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D5DCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 08:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDCfgIsCd0Q4hB2aGkv+tHe8owWljtqt1jPIzUxxB/s=; b=U5MfDed5pzBLTp162dW0M7XLNd
	vdrLrB9BC/NblFk9cwZd/HQb+Cakxf9tdKZi8mcWMWoNjtYFSon6Gkdk47vYKfrYfSYd7tDOdcp4f
	ZB1V1ysSj+V8n8GWV51Q8rge6GXvRRDlEhlKG9h7NY9kagMi8ICNhqdfUdRZkzV/EcBtHuhEDEY3f
	DjuuN6M+2L9eSc/E/HpYkNZx6nSePEz6apL+TRuoplm9sj1UUEeMiqFXjX1YmUEDIfRtW0igyaqTi
	3N5scOsk+DzC3K9oaY5lTlsgFcDOqB23hTPkyHIhgzXpM2h3GhZdUjdCn80Eg8Jo51j4Gi8pXqOlh
	cZfXPsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJdU-0000000C5Hk-0kiI;
	Sat, 13 Jun 2026 08:22:36 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJdR-0000000C5HK-1Z1D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 08:22:34 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45ef82204c6so1016904f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 01:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338951; x=1781943751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDCfgIsCd0Q4hB2aGkv+tHe8owWljtqt1jPIzUxxB/s=;
        b=A0roAa8ywHxIF3er9JjKfiAyJCDEey02/ygOrIy5q4ta+Tddwo8Bnn7JWsYA6nlT0Q
         UsU1jBReWQoLduDPh0hZXKvKSl4c8Qp4LvR5MTarWa1TRzO2ZVQPlme8HJO+T+MJ8cdg
         XuKxf3Yst2yXlZauNOyGD1csBUyyOyRmQidkzn4+h3DI5KcG153CWpbCKxOoDXGPh+Ay
         FZO5WRD5A2AiXOEfNQM3aqFhLLuV4QAO5Rp3DquPjbt2ZQ7dRM7bIv7tIcxfpvbfxMux
         4GmEvj2G9S26UgKQH3JqY3Vo+7+fHvrhrdhj4igvQbu0hg1eNO23qLAC3i0O6qiuZ90J
         P2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338951; x=1781943751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDCfgIsCd0Q4hB2aGkv+tHe8owWljtqt1jPIzUxxB/s=;
        b=Mkg0+pcS63qabkJ/6H3Wl7MVomjsuWhddAD5+2xzIH0OhUgHGdcL4p6QgqSV54VeEI
         uzejDXCjOV4c16h1xtvMxim9a5tkb68/rjzCTGXIZuzweqqyXFMUqVw8KN5kyNsPJ74T
         jsheUh1rHUH4nFDbBuIWNuo/VAZx0+jn1qVt5OjOS+jxw1ix2PySqaSyyN8hn7D/uqHH
         qbAVHPVSifY2VYgZ7hJQSsJt5hU39flQaSz63auJMwoS3Nphy3JeWGvSPE8P2SCmKd07
         RaTOJgdGuPdFwzoIx23vLGPO+erDV4B4MH1dxQO12rybtmJWP/lvdZSDyTU33g5UCZZA
         FPwQ==
X-Gm-Message-State: AOJu0YyI7c40g95WiVKZDZdMZYEqt792legxvxFFTxJ/x0z+CqBv1Hnw
	LVzbDNQxiXswlUOa/MgkLDpBS6anw+KQm8R4ERUmH26I9t0469F2/QRsF/V9bqvW
X-Gm-Gg: Acq92OEfy0Gk0ztoPb3qKbQimTL/XHE/gBg7b05OhtaIZ5KyZJDvwJG7G4cisKzSGAw
	HL78uhLtTFlmURyPOv10l4rJCqVhnAQB6IimLOa2bCLIAvaZoItS3Bvxy9UrblD8MlFhIFTwd4P
	HxhQuX0+TiUG0AlZGNbgVkItbZ02XH/TJMrSRaVPD+0FAdnAelFroWdlVWUznUWMOiqvTFF5dXR
	3uvBwnfG7yBmoNcKdRFE4GN6VnxgH3A0YPiG1aKDsw8t6XzqaSHjT8EEZIADB3o20XmPIF9HDBE
	UaDiN2tP3AJnI8uumfIeFIjQYLuaKRYrZDgsYzGmCvibixVuuelzek5N5iFl5dycuULHRP0lLDZ
	DRMc++9ykCd/LGY4uL26AMxGrTlhjuj5ug2DhIOO36JF/B3aksgi2FvXeU5yzPE+Lxf6YCdNh2q
	tPO2qd6d9New/XhbN9WkqwyKcJUXrCo9gZQNKUIp2WhDR/kvL8mEngHuI=
X-Received: by 2002:a05:6000:608:b0:460:70ae:f196 with SMTP id ffacd0b85a97d-46070aef211mr8420172f8f.7.1781338951277;
        Sat, 13 Jun 2026 01:22:31 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3dcsm12723144f8f.13.2026.06.13.01.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:22:30 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 6/7] arm64: dts: allwinner: a100: reserve RAM for ATF
Date: Sat, 13 Jun 2026 10:22:29 +0200
Message-ID: <_6NEZ78hR8a_3V2bhBAGoQ@gmail.com>
In-Reply-To: <20260605070923.3045073-7-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <20260605070923.3045073-7-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_012233_426675_70C04081 
X-CRM114-Status: GOOD (  16.33  )
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

Dne petek, 5. junij 2026 ob 09:09:20 Srednjeevropski poletni =C4=8Das je Al=
exander Sverdlin napisal(a):
> Add reserved-memory node carving out Trusted Firmware-A region spanning
> fixed 256K from physical address 0x40000000. Even though Allwinner ATF
> itself passes the address range in the fdt to U-Boot, U-Boot currently
> only reserves this memory internally, but doesn't carve out the region
> in the fdt passed to Linux.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

NAK. It is job of boot procedure to properly inject TF-A reserved node.
Any issue should be fixed there.

Best regards,
Jernej Skrabec

> ---
> Changelog:
> v4:
> - new patch
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-a100.dtsi
> index 7cb06b19b5a5..d8391663fd1d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -87,6 +87,22 @@ osc32k: osc32k-clk {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		/*
> +		 * 256 KiB reserved for Trusted Firmware-A (BL31).
> +		 * This is added by BL31 itself, but some bootloaders fail
> +		 * to propagate this into the DTB handed to kernels.
> +		 */
> +		secmon@40000000 {
> +			reg =3D <0x0 0x40000000 0x0 0x40000>;
> +			no-map;
> +		};
> +	};
> +
>  	timer {
>  		compatible =3D "arm,armv8-timer";
>  		interrupts =3D <GIC_PPI 13
>=20





