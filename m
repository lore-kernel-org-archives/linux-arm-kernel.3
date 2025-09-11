Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7E8CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3Kk5PCcvdUwK+/fsu2vdafHJIiHRXspA2ECOuACp4w=; b=F1TCLKWvuIl4UkVWKu4gZOpxC6
	QIcymW8wtAELLrQLJI/+6LAndFkXoBZ2e6yM2PzletCmWrsE/I8hgYv5i02apGt6FD+Zhg/tiZ9WZ
	QldWfAbyoVUvPiSdhZMDRzVNotJQ8zWl9duSE70PewLQ9H70WqthcDbqOSYpmcLzo8wWG4cBpJ7cV
	M6491EdvIJGbnd+AdOIaPBzlgrtNipgk9kZdWVBp3XH/3/YUGKR5lrlzx87gRgQEHVBg1pK4+PCCS
	NjeRFFmeSDyoZIcrGzxHrUCWqB9sBb7COSFvCWymyQiaBRvqtW0Aikch4pPC/thomN+iyScBwxQvY
	isKeZU0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmJk-00000004p7c-2ESJ;
	Thu, 11 Sep 2025 18:46:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmJh-00000004p4c-2J57
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:46:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so9324115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616404; x=1758221204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3Kk5PCcvdUwK+/fsu2vdafHJIiHRXspA2ECOuACp4w=;
        b=IzoMCILXEznr5owPdm22Kipm3Q0rwZZ78Ohhbr11bnhaasiTTjCte38YE21pH9V6Or
         hF/wJ2O++sOMER6pojHd7YHo3nffeQ0A6G0/aadac/NRLNTx3VqprTVFDE1bJpsLW1J/
         MIY2BM+eddJY6ZzVZBB/1eWBfeiHcxCcjlmRgZ5Wxxva9Mym9C9sq1S+0TODSdvaAIKN
         BSShnfEm2obBv1hjTtxbQQHqwScNEZCSotMnbRH3KqwOmbWjYHazF69OABJRWs/nLIMZ
         NQ6MmWOuQwJ2i+LIaks0/qhSQJWbxexmRFns2J+NmCkXk3xLgG51zyC0gtzxwMyr4z3R
         hMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616404; x=1758221204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3Kk5PCcvdUwK+/fsu2vdafHJIiHRXspA2ECOuACp4w=;
        b=ZDhJfD04kTEH4p4dzCezDjpkM8VHXchwvx/zwxHJQt+RRNVPAKpbIzirJYTs8EviOn
         IjLY5AaozGA9mXf8xM8eE0zcwHM8ZmznsHXsVO29Ksxf/tCxVZQgPwdAMHNMFHFKekfc
         js/lg0MhxQDsrCU1+753x0deBgyuFQErS9QZNvj95L6n4hWy89pGOpWL63CW25Klbed0
         YH2JlTMQPjJq6t/XK9Gjo4aj1Z2LLy25vqOXkYwFFdKlQMukiTyRH4aCsroO8rOHK1AR
         Q/V4UMFoBXWOHR1DMGIEVzTYcNNiSN2bnZ2QGfKX+YuLjWImoGBrcKaPm43WQin0ztUz
         HxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWEm6blkyXPrOcQpgEI+9zry6tcVqWniEIdPEciIGUMtI+z8v7EQ68VS+HTjTtfJINgEvh5SUDYzs9gQYowICV@lists.infradead.org
X-Gm-Message-State: AOJu0YzENuKs+v9CrTMB9/3jOnBSAOmPsN0WOqIVCXpw618czP5BJ6VE
	6rdT+dS5/erGCy8TX5FyuoljyVRQV/OGZojzsfO8iJRzs4dNC5eeSD9A
X-Gm-Gg: ASbGnct2sfOpS/VS0y3RNfF0tyQuKNLl3ZlnM0Lm/I+g50ttCZDxSZ5HefYCcozerQj
	F6TYMwZeFtnAH//25/ZSd9IQaOTVgXs1JIIvU6usV523WGWXQxokum4UdSIC2inIgfnPHr4kZtI
	DuYvdP1bsQ0wlcsIzXuboAmiuM1ecKJt3fiv0Eq7JpcQmhyAUrr2rfLVXEopi1wAwXS2jp2VuLe
	FbsO5LgJ/S9n4XqP/RGKjsaAGGgjexjjinfyHbX+9kydXbe9WAcGWZk0rhz3HZgPB1xU+ds+5HE
	bhibZUTyLGLueyK895cLOhi5Vns192/U+doOXK2PCTS83D6H1Xsq87V9Ky39LHGDSUk7mkpEfYX
	fFF6DuS66qZhY3Tooic9f8mTk4JnHiqsDtkTX9DYyrNw2y0bsmvD9lvMrN5nm+tKXO+SdlfyFX4
	OC7vw+VAN/+0piRkNZcLY=
X-Google-Smtp-Source: AGHT+IGPPdj04vc6Z8WnuiT1sf/ZoXQr56xVPN5ocFP5ISIHChh24Q+/p9n0LHx8H0kAPJH/zR+ueg==
X-Received: by 2002:a05:600c:1d03:b0:45b:86bb:af5f with SMTP id 5b1f17b1804b1-45dfd5b59c2mr43153985e9.6.1757616403529;
        Thu, 11 Sep 2025 11:46:43 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157619fsm36045945e9.7.2025.09.11.11.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:46:43 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a523: Add NPU device node
Date: Thu, 11 Sep 2025 20:46:42 +0200
Message-ID: <1930957.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20250911174710.3149589-8-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-8-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_114645_643386_D112C23E 
X-CRM114-Status: GOOD (  17.14  )
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

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:10 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The Allwinner T527 SoC has an NPU built in. Based on identifiers found
> in the BSP, it is a Vivante IP block. After enabling it, the etnaviv
> driver reports it as a GC9000 revision 9003.
>=20
> The standard bindings are used as everything matches directly. There is
> no option for DVFS at the moment. That might require some more work,
> perhaps on the efuse side to map speed bins.
>=20
> It is unclear whether the NPU block is fused out at the hardware level
> or the BSP limits use of the NPU through software, as the author only
> has boards with the T527.
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>


Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index f93376372aba..9676caf9bd4e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -852,6 +852,18 @@ mcu_ccu: clock-controller@7102000 {
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  		};
> +
> +		npu: npu@7122000 {
> +			compatible =3D "vivante,gc";
> +			reg =3D <0x07122000 0x1000>;
> +			interrupts =3D <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&mcu_ccu CLK_BUS_MCU_NPU_ACLK>,
> +				 <&ccu CLK_NPU>,
> +				 <&mcu_ccu CLK_BUS_MCU_NPU_HCLK>;
> +			clock-names =3D "bus", "core", "reg";
> +			resets =3D <&mcu_ccu RST_BUS_MCU_NPU>;
> +			power-domains =3D <&ppu PD_NPU>;
> +		};
>  	};
> =20
>  	thermal-zones {
>=20





