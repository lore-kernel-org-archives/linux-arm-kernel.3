Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2638CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 10:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYAPdYV4D3yX5RzlvX7A+6gcHuPHfoEYTyIdk9OJfZs=; b=FfW8ogrPj2iY6r/tZ1Q0fw8W1v
	Vfh++nWREOeFnpVKVM9vagw7RbAjcUCsrqMVhqcIZ08ClFVGcOlPPyiIYQnIVFcpdfLsf4dZDkJLB
	DxWci2iPEDOBaFsEYVggl87ohK5epc4b2MxID5HOLwSYi8egxzHvwd2ZrYbLczW8uibzkPmoEqklY
	YWYHrRCRWJZOiz5N3NfSHXPD71HpqNgIHuCcWqNsPWkWz26TlGVPG3eGrdTkxHzqmtNu+z1IRcrq3
	zebXbY6srWuM4bi0lMq87deqcEg4uKVY8Z4CcZX95aOuGG1AvCPLo+QzBcNnXj5Ik/6IRj5e6JHx/
	7EW6oKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7WvN-0000000A2Wd-2seQ;
	Sat, 11 Oct 2025 10:34:05 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7WvK-0000000A2Vh-1VZQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 10:34:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b3d5088259eso407991666b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 03:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760178840; x=1760783640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYAPdYV4D3yX5RzlvX7A+6gcHuPHfoEYTyIdk9OJfZs=;
        b=N+BCSg2ZnzgoSGhdXx+QyaLNNWrITMdFEDXyj04m1+s5hFnAXVt11RNqlYbbaYr59N
         V2ABPIZbTQN5JvYEFbVndL52bvzY1V9gpg5Ks9meAu0KDXPIDaWlK5J39ZlN/lD7k/kb
         1MXDwz58ngUxZ1xRbtn/1v1e9mhe9aQ2NrU7/B53FhwzzKPWO+ugjHKZ7A4Tl2/xWQ07
         wkcXGujtQK5h5Q4GAQKkTl8xsKm40ZvI5GnsvDHfF55NEfN8LitQHDh5BeoqyU5y/TI0
         jln6mQlBSfyv+ABuEtzpULJmcX2Eb+b6yf9pSKWkr8bNNWt8Fhql+x3XVhXPmAUpnHd1
         1Y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760178840; x=1760783640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYAPdYV4D3yX5RzlvX7A+6gcHuPHfoEYTyIdk9OJfZs=;
        b=Pz5ngP6r80h8g2rs4XFOi1Ki8CrsxtHzeupMldr08QYKCwBCcyplKheiPbn2m2FbxY
         1zFfH5ykBbYLWVdw+8OHv1bIk8iyNs5H0EcyuWmyDya0Y7NCEgB97+PjFQQBav4xtDna
         H3NtOMHaGYEqMP/9YA657r2xgUhIQKY7ZxE+We9hVBX9PQp9jv3DyirWLvtDA8oZmhF0
         B9sLEMO7jN1SylqGO8hMz0cjCNb8ytbbNlhhe1vL+c/a9IzCOO6rJQfz3wVFU4SN9p3s
         HcMkbbm1997KBvSceiN2l2sdqsT/4NJ9QRPw74ShXLMeBZhVy2Ow/pXurZkHSxzQrlaA
         gThA==
X-Forwarded-Encrypted: i=1; AJvYcCU9iFKTJ065ui7Sqosy8+0O2FGeTXgBZmCuIJScJDbHfPxeQ+QFc8MC1P/VSUyN9kO2sVDanARGAWI40ic+BW9G@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv7kN2p5HeKPUhv7bWkU073tUFnB3hXVWoZGpGJeBqlvZWzAiT
	Sm7VBTCj94d1gg2+Y4v7szQhRpiPwzGo4GfbkzZhYlcdAmFI/87szHjJ
X-Gm-Gg: ASbGnct5ohPf2KKPc6H0gCyeWfoagNxsYAFfTtob79IaOTnfrZLQ0SR2FETqKU3ndTP
	haGq2rEx2Yf3SZebDCwD9sqDXCp39+qVPPayHkukR7/Rs5t50+/7/BTKGcBWcFf5hjOps6zhFHv
	O86YKlfzZDHCrAGmbf6vXkKgKEkSym37diUOHl/IbNJDdSSjJqFHpEat+bIMWlgRaZsRvkqlWKf
	zaAc4XpVw2wmJ9bkwLZ4war+bPuU9isf5W6dfODnKy8QKwUxw3PHLslebvBcIWzPk50F126/I9g
	Oj4aNeEJpGbwcNTmCCKMD9oAnPp0WJkN0qGzUr0IF0rpUqfY5MzJGZ8LscfB2P+8sPRzu6cXwLG
	oNPUCtwKNmQAyBlmgJvN7pI5rSbA+GqpsZz8FwLMfvZEDKGDYeUZqtW0tTPKzmXdkZvpuJhjndw
	==
X-Google-Smtp-Source: AGHT+IFFycSQY4Q0kx0MQ3fB8e1/4xrhlffbTRZSX2gxi2804bwlqcuj20iB5WX1bDTyi44c3l+bjA==
X-Received: by 2002:a17:907:6d07:b0:b41:79ff:250c with SMTP id a640c23a62f3a-b50aaa96ba5mr1457625766b.23.1760178840185;
        Sat, 11 Oct 2025 03:34:00 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c124a8sm454690166b.51.2025.10.11.03.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:33:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 03/15] arm64: dts: allwinner: h616: add NAND controller
Date: Sat, 11 Oct 2025 12:33:58 +0200
Message-ID: <4682810.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20251010084042.341224-4-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-4-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_033402_439318_C61D4E2A 
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

Dne petek, 10. oktober 2025 ob 10:40:30 Srednjeevropski poletni =C4=8Das je=
 Richard Genoud napisal(a):
> The H616 has a NAND controller quite similar to the A10/A23 ones, but
> with some register differences, more clocks (for ECC and MBUS), more ECC
> strengths, so this requires a new compatible string.
>=20
> This patch adds the NAND controller node and pins in the device tree.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index ceedae9e399b..60626eba7f7c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -278,6 +278,37 @@ ir_rx_pin: ir-rx-pin {
>  				function =3D "ir_rx";
>  			};
> =20
> +			nand_pins: nand-pins {
> +				pins =3D "PC0", "PC1", "PC2", "PC5", "PC8", "PC9",
> +				       "PC10", "PC11", "PC12", "PC13", "PC14",
> +				       "PC15", "PC16";
> +				function =3D "nand0";
> +			};
> +
> +			nand_cs0_pin: nand-cs0-pin {
> +				pins =3D "PC4";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			nand_cs1_pin: nand-cs1-pin {
> +				pins =3D "PC3";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			nand_rb0_pin: nand-rb0-pin {
> +				pins =3D "PC6";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			nand_rb1_pin: nand-rb1-pin {
> +				pins =3D "PC7";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
>  			mmc0_pins: mmc0-pins {
>  				pins =3D "PF0", "PF1", "PF2", "PF3",
>  				       "PF4", "PF5";
> @@ -440,6 +471,25 @@ mmc2: mmc@4022000 {
>  			#size-cells =3D <0>;
>  		};
> =20
> +		nfc: nand-controller@4011000 {

Nodes are sorted by memory address. So this one should be moved before
mmc2 and possibly others.

> +			compatible =3D "allwinner,sun50i-h616-nand-controller";
> +			reg =3D <0x04011000 0x1000>;
> +			interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_NAND>, <&ccu CLK_NAND0>,
> +				<&ccu CLK_NAND1>, <&ccu CLK_MBUS_NAND>;
> +			clock-names =3D "ahb", "mod", "ecc", "mbus";
> +			resets =3D <&ccu RST_BUS_NAND>;
> +			reset-names =3D "ahb";
> +			dmas =3D <&dma 10>;
> +			dma-names =3D "rxtx";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&nand_pins>, <&nand_cs0_pin>,
> +				<&nand_cs1_pin>, <&nand_rb0_pin>,
> +				<&nand_rb1_pin>;

Are you sure that each nand device will use exactly this pin configuration?
IIUC, not all chips will have two CS and two RB pins. If so, pinctrl nodes
should be moved to device DT and pins subnodes should be marked with
/omit-if-no-ref/.

Best regards,
Jernej

> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
>  		uart0: serial@5000000 {
>  			compatible =3D "snps,dw-apb-uart";
>  			reg =3D <0x05000000 0x400>;
>=20





