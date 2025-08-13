Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F415CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHmzj/owjBnWQXccQqjtqoeZzUsvFVlqZRdyc+4n9B0=; b=YmzcP0i4q+b317JO3QACFiIpSW
	/tpzYPMWpYzin5L/wjLGvJXYLDM/JIeKqd9r2jtzR7Ljtx92eFuAQhyLEZaSUqkbbU46VeRZj8th+
	66J2cZGHnWaGSPf5J2E28V3fotgE+tKVjtkRsfdbW/cbs6stgRrEToXG4tvA0SI//6N0bMX9qiYtI
	dQTLR/xpXpOi6aDWqUwxHv3ttqZbY9kXJ96xl38XvCOS4mSZ0EvzcxDE2CrM85/5oA3JnoWaFrftp
	WESuCu9/zMIgdhsIT/Yru3BlJU4MSaQiK55F0B8LGKmX3vSEA0uUtmFexemitEJKwPDDdQpClZBJ+
	QcVC1ZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE67-0000000EKqD-0AvP;
	Wed, 13 Aug 2025 16:13:07 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDMp-0000000EBJo-3NmC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:26:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b78315ff04so5687567f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098778; x=1755703578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHmzj/owjBnWQXccQqjtqoeZzUsvFVlqZRdyc+4n9B0=;
        b=dedr8CXXIoHvK9T4WQ/QS0F2Nt32ZeP/77btXjPspBighRUkMBqEeTMeZ+pwfPOik+
         7xnh9vgNpBBfpiCNvrfSntpAKJv/Q3yl+FVqKWaYVPFolxcU2m5Rr6AQ/WF/IDnReWF7
         4Ztc9bcgDmPo/kxQD4SNJOel3xf6c9ynvKhtRcGC60pGb4e8pAUt703j+ssxZWiTkfp1
         EKubcUFDrlmbzxnrGhIiBCI8XQ/OKooTu1jJOco3vl0XXtTdNqYupWiPGvJIfRuK7BZy
         XAUNVOHcH5Tn8fASzwYxMy97egZa8a7PBeoECWpUxuJ6vamq+RyxoMdSlz00PmaGiEia
         FX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098778; x=1755703578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHmzj/owjBnWQXccQqjtqoeZzUsvFVlqZRdyc+4n9B0=;
        b=uV+zP/5Qdgt0aBoerCSoEh9SWJFjRiryqftzHkINItZJAdg5BqUwYnf3z+/NPgPX0G
         IBOFhGU3GTW+U7X0kHeHarS3YIzFQwY9NK7H/dtTHaHpwKyroen5yJf/8FToqKSr8W60
         6IykVZyDO0BgStbruGmm6uMRPzexh4OfzaIpHbCuVWvqDXFaNGEEMHPR6/dE6kE2VkzH
         dO27p/ibVNw9R36canek7Mo6z0xzTZMSrLBVJMRr8cTSBHCH/Z3dbp9ibE9CZMtkclQ0
         1emQvxy9zru23SUTWxfQbk2/v+wI+vnKoYrlyp2sW64WOubcBxhB+pXihVCqEwpoQBZQ
         dVww==
X-Forwarded-Encrypted: i=1; AJvYcCVqlQKjKCf118pTpG2mOLw7deWFNoTNd69KcywggbIiiTtTH8bOWsrWudf9mobFaFNdV0sJqCdq4OJ/emTVPFzF@lists.infradead.org
X-Gm-Message-State: AOJu0YxeE6tuBHdponnBGeo3/7WsQPwcLnjFH3o8Mot5EimUHDf8KDFi
	QqpCHZ/waKSTJpKnVuG+xJt1JKFpQppIAom6D0XN71nH4+pAF1B5w6Ep
X-Gm-Gg: ASbGncszH3pL2kbqk8W1TZFSDekWERewVMHNYuX16TX8S33Nv3VXtqBAVLPD2zC9Stl
	E2aelyk26i62cGtTcTv1wIw5Bes4pzGm77mwu/IHKMxHnHJoiojThrE6NKVdDAP0QWAdI0bxP5k
	7+xccQePfHJo85mj+HfOAgyvjr/bS/mt1DbHgi3GR1VBXA6zthnVizWepqVpMvvpThKUqHyFN0M
	SgFFbQpISer2bkwx0W4LjWxy0QRhlQYQ7Dg/rXVHkYTIH4YtcTZQv0yh2UpTuMI2SutsJgiAuR9
	75rLW2CoKAYSE+ufIkyA/N0KC3ikk3R5qT+bSfdMJn17ai3JRN/4LC2PKKOJOil6z5G31jSIwwM
	dEfEgxx5QOkIcTih8ciWimxux0topg52lzS50pGxCQflaakzMZeS8FlUtb3ELn+hsElkZ3vyTuS
	USNUNIZbgH
X-Google-Smtp-Source: AGHT+IHUC2ftwzSvSylSdT06ajBela8u5SU+ijYkDLGHo9/q750n74l021ps+CiYV2OdEDDglYn8Pw==
X-Received: by 2002:a05:600c:19cf:b0:458:bfe1:4a91 with SMTP id 5b1f17b1804b1-45a166350a2mr28993085e9.20.1755098778076;
        Wed, 13 Aug 2025 08:26:18 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a50b99bsm6611325e9.5.2025.08.13.08.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:26:17 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 05/10] arm64: dts: allwinner: a523: Add GMAC200
 ethernet controller
Date: Wed, 13 Aug 2025 17:26:15 +0200
Message-ID: <5030505.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250813145540.2577789-6-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-6-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_082619_844442_2756363A 
X-CRM114-Status: GOOD (  16.08  )
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

Dne sreda, 13. avgust 2025 ob 16:55:35 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523 SoC family has a second ethernet controller, called the
> GMAC200. It is not exposed on all the SoCs in the family.
>=20
> Add a device node for it. All the hardware specific settings are from
> the vendor BSP.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>=20
> Changes since v1:
> - Fixed typo in tx-queues-config
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 6b6f2296bdff..449bcafbddcd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -180,6 +180,16 @@ rgmii0_pins: rgmii0-pins {
>  				bias-disable;
>  			};
> =20
> +			rgmii1_pins: rgmii1-pins {
> +				pins =3D "PJ0", "PJ1", "PJ2", "PJ3", "PJ4",
> +				       "PJ5", "PJ6", "PJ7", "PJ8", "PJ9",
> +				       "PJ11", "PJ12", "PJ13", "PJ14", "PJ15";
> +				allwinner,pinmux =3D <5>;
> +				function =3D "gmac1";
> +				drive-strength =3D <40>;
> +				bias-disable;
> +			};
> +
>  			uart0_pb_pins: uart0-pb-pins {
>  				pins =3D "PB9", "PB10";
>  				allwinner,pinmux =3D <2>;
> @@ -601,6 +611,51 @@ mdio0: mdio {
>  			};
>  		};
> =20
> +		gmac1: ethernet@4510000 {
> +			compatible =3D "allwinner,sun55i-a523-gmac200",
> +				     "snps,dwmac-4.20a";
> +			reg =3D <0x04510000 0x10000>;
> +			clocks =3D <&ccu CLK_BUS_EMAC1>, <&ccu CLK_MBUS_EMAC1>;
> +			clock-names =3D "stmmaceth", "mbus";
> +			resets =3D <&ccu RST_BUS_EMAC1>;
> +			reset-names =3D "stmmaceth";
> +			interrupts =3D <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "macirq";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&rgmii1_pins>;
> +			power-domains =3D <&pck600 PD_VO1>;
> +			syscon =3D <&syscon>;
> +			snps,fixed-burst;
> +			snps,axi-config =3D <&gmac1_stmmac_axi_setup>;
> +			snps,mtl-rx-config =3D <&gmac1_mtl_rx_setup>;
> +			snps,mtl-tx-config =3D <&gmac1_mtl_tx_setup>;
> +			status =3D "disabled";
> +
> +			mdio1: mdio {
> +				compatible =3D "snps,dwmac-mdio";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			gmac1_mtl_rx_setup: rx-queues-config {
> +				snps,rx-queues-to-use =3D <1>;
> +
> +				queue0 {};
> +			};
> +
> +			gmac1_stmmac_axi_setup: stmmac-axi-config {
> +				snps,wr_osr_lmt =3D <0xf>;
> +				snps,rd_osr_lmt =3D <0xf>;
> +				snps,blen =3D <256 128 64 32 16 8 4>;
> +			};
> +
> +			gmac1_mtl_tx_setup: tx-queues-config {
> +				snps,tx-queues-to-use =3D <1>;
> +
> +				queue0 {};
> +			};
> +		};
> +
>  		ppu: power-controller@7001400 {
>  			compatible =3D "allwinner,sun55i-a523-ppu";
>  			reg =3D <0x07001400 0x400>;
>=20





