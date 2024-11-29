Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247C2D6EC00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xjr4t6+jaVnD1Nnpoc97h5Ga1ERmjaQD302gTdpjnNU=; b=w7jjkStpD1CpMysH+B4P8862fb
	B4O8keyRDIDpxRibi/J7Q5mL8fGFCKaS48ewVJUW1w4GXPQ1vgeDilqq4xFSO44jClKD6ahBE4rlJ
	tCbXk8GIQjY2F2caWfBjoo2uIqzYKp//6HmNh+UKZjb4M4mUT4Mjv19laxlbeqn5oe48i3jfBkjhg
	m67P2ATnn4NXE7+uP7jTWb88Fd0ai+iY/81PbSdreAYrPydv8cXNClmSHaVh885zDXVBwiZWr6Iyi
	G6hvyvnqkYQ5qgGevVYVf3UmputyB7MAtPSoxywjGtZ/MDNIB0jKxBUQNJyF95K9qor7ikNIn0QsG
	vhXC6/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGz7y-0000000HXhM-1Yl8;
	Fri, 29 Nov 2024 11:25:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGz6z-0000000HXaL-0onV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 11:24:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43497839b80so10954625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 03:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732879475; x=1733484275; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xjr4t6+jaVnD1Nnpoc97h5Ga1ERmjaQD302gTdpjnNU=;
        b=qmwyXUsU9U0DWRBMl4Tylcu57v03RCY8cpLns5prO+djIxYNQeegj2N8OEzf9uUZWY
         eBzmnhkk+pTsNCIaETlvtZqOOQ79E5OnfXE1PojVpF4g55jF0K9SVGY9/1bw6FJkDiTJ
         +WL1bKKAGtZNzE6bP8YBPVEfeHjwhEKC8ld9+0neLHam/AWe+kBpcvd4vUpu2FZyC3Bz
         tj9r59uqu+Y8sS8WXmnRbCIDMB1aswQVYe4ATbygeOsx/WtnqgYHvz0mhzQnpXTGN9cG
         Y+5KN8R/x75Z+NJvp15dnAlirWNWAs7KbywrDOvcvUTNR07hpHgYc94Arj/Ps2QL8QU2
         OxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732879475; x=1733484275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xjr4t6+jaVnD1Nnpoc97h5Ga1ERmjaQD302gTdpjnNU=;
        b=HdQYl6KvPGt3EziuukUoNykSp/1wQdlw3lPO8bgIo0YTAxAdDLb0AzgwzPzENgloqN
         r+6TglDvZUyPIvV4IWRLCU0O3IPQ4fwE3FoIXhIluo9Obf1K3APUj1+OFWMWqMETI7Lv
         1yu48EpOpuU7GIHc1JqvoeepE6910wFhmL0lb2Pz/m9kdsCG/SV9PbGyMa5bThDZqO8C
         jrpWlCriQr+uAV0QcXVRngtsJdtCDA+EkF/LQ+ZXEdZ3lEBkMjcIlqEtNRDrEJpQzoLU
         rDTHhf0RrhWays4EWA9SX7jvZmKDsKEEu2WeRrqQfivrwT7TLHuIzx5O7NYdWH7IWGTB
         d+2g==
X-Forwarded-Encrypted: i=1; AJvYcCVeIZ3rvXfboj9KwPp6xdYOmTERMQShH507tqcEZPXunXtMcoagX2QvP8a7lE9QhuEsnMPtrjkHA+Pa8NML8Mff@lists.infradead.org
X-Gm-Message-State: AOJu0YzwsxD+mG2QRTRmvq5+kZBQFDrd3tkzrx3cRJGl/dbT6WDIQ6k/
	gwIoB8nW/L/JZGZhR/3v4AG77SiTo7p9iNc8rMLXYjTyh+he7gRsNjVz4lUoyJg=
X-Gm-Gg: ASbGncuSmqxr0Uj/orXHSrj7I4Gt4YRk6cXnvEnnuiCTfkN9Chwd04eYZ/e+wYfUF0J
	vdDPEA3a99IFLRdXKA6a3xUgd8PX91A04Uz0Q6t3ZrrjI/vh8cFSDzCiVt2YgmUxD1lsSS6P4yZ
	P7sxvh8f39TFnJEpE12StEGkat2XKqYUiyoGcYElH+cemyvOXRWz1Gp3+AwGoVTMd2Vc1Ceq89d
	bllgHJjC+Kx6/V3MpNHkktz+mJg179Hg5qev2pXC9WMaNEkR/hJ6TY=
X-Google-Smtp-Source: AGHT+IGJf7wL63WoRbY7Qyhb5Is/61MFEjb8kJtv26dX8E7BzS9uZFKdz8Zkaho5ks18oSvth2ZAng==
X-Received: by 2002:a05:600c:3546:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-434a9de78d0mr93513265e9.22.1732879474788;
        Fri, 29 Nov 2024 03:24:34 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa74f05asm80752145e9.1.2024.11.29.03.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 03:24:34 -0800 (PST)
Message-ID: <f14714b4bb667d339e6402c6cae37cee47406770.camel@linaro.org>
Subject: Re: [PATCH 4/6] arm64: dts: exynos: gs101: enable
 snps,dis_rxdet_inp3_quirk for DWC3
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-samsung-soc@vger.kernel.org
Date: Fri, 29 Nov 2024 11:24:32 +0000
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-4-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-dts-v1-4-5222d8508b71@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_032437_249797_07BDA0F7 
X-CRM114-Status: GOOD (  11.74  )
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

On Wed, 2024-11-27 at 11:01 +0000, Andr=C3=A9 Draszik wrote:
> This is required for the DWC3 core to reliably detect the connected
> phy's Vbus state.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index 18d4e7852a1a..ab016fe9b99a 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1302,6 +1302,7 @@ usbdrd31_dwc3: usb@0 {
> =C2=A0				interrupts =3D <GIC_SPI 463
> IRQ_TYPE_LEVEL_HIGH 0>;
> =C2=A0				phys =3D <&usbdrd31_phy 0>, <&usbdrd31_phy
> 1>;
> =C2=A0				phy-names =3D "usb2-phy", "usb3-phy";
> +				snps,dis_rxdet_inp3_quirk;

Seems this alone isn't enough in all cases, I'll send an update in a while.

Cheers,
Andre'


