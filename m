Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C165CEFCE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xb4A0lF/nE9BbVopKVIphYtrXelnEWlhg1lys9zj5g=; b=AMlWSoNtJzB3b9M4rLU9m+bPDg
	5e+jTxUVE+jKWbPO+0biENxJ21H69eolcj3hOh0ESIaa3eBxqEto/ha+ZVhCUjC8qgkUlEF5J1B3W
	+bBcKdUek46ilmfR8sQaAF+uGwg0x+TyI2v0EKgOrCtCkHUlM3rcGaChlmDOcc5ZoGix7Q08Ip0kp
	dc0c8EydXVFIDldFPsJEGePdm7yxo1BaLj/nnPZA4wVVfZCiyQGwZth2D1u8IHaBxVJFSbsmW1sZL
	cDhTHeY1KyT3grWTkn9WZ73PU8jHf/oFT81r4o5PJQn5zJngYN7ujyVJLXWAh0pvOgZPMpE1QxL0/
	AY9uvvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAo5-0000000DZNI-3AHD;
	Tue, 06 Jan 2026 17:25:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAo2-0000000DZMw-32kl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:25:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso8980555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 09:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767720316; x=1768325116; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8xb4A0lF/nE9BbVopKVIphYtrXelnEWlhg1lys9zj5g=;
        b=Bi8NsN8km2scIVRdkhvFTnbSmJLWUvG1FXlJK5kZt10182hzDqG6HY2npXBJ/WWJ45
         xUqzhdg8rVY4aPDckX8Qe3sT64Ew5DjwoJRq5+UdO//AXSPQSVx3Z/flbHl8gUlgB7hF
         TnNygC7FF3hS9NlDHlXrNMkoESZB3FwyT5/8vTxZpH6YYQkEeQ031ktci2aVGWDRFYX9
         SKgzdOTKpKpfkXxqA+5sZfserJTSythEhCiSYx7AZKVM5bcyITJxmidLPah0IKb8SzVD
         els570jsapOkhojBzFZbo+LPacHvju2Zkd6uEVC4AmNowI/AVDp33V7FbYfpcJwiv0dP
         mZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720316; x=1768325116;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xb4A0lF/nE9BbVopKVIphYtrXelnEWlhg1lys9zj5g=;
        b=jABYRGQBtsExwFADbCqoz+rLANF2mJlwnZfH3bmhnH9eLAYSK5k3WpIa2kXL7VVwTX
         TlsrVa26RSc0KbL/1Q8ynjdQguLzMeIQzDaZRNMqtEIWs8ZuUVoMlQd0888O37xAkTGu
         PshAIOf30YUr15O4f5GqnxDmEl4h7JOrm4n1lVM+a53KXbqaJ662L9+FuCplIYHPKm7a
         KOLrqLxHjzLuBFk+WF73h/V5RDFMzxAz0e0vai3cN58pHXUFw1A9mqeOZyfToTfjKooZ
         cmOj6ZZfGxGeEe2MgpvSJ9d0NnylkuV1n8KogySXwJCgJjm7rkOqP7jqI1edhyZWG6Hc
         BjLw==
X-Forwarded-Encrypted: i=1; AJvYcCVsoDOgyEnVxWh+kSMOfC08JWMSCBhwcXAj5n2kOZU5NUiTrYOw9X2N6vQFrPhD1HTUBkZ75YKqccbJaWJ6e5NX@lists.infradead.org
X-Gm-Message-State: AOJu0YzwOX37E1nXLj2spmTt88wsDfFTOaDs1b5HHXQKRKTvc7H8JH9e
	zh3XR/n7tbDhyJCdrqDH2gunPLeQ5MMGMagjpNfIZKUFp5mCI7TWqMLA
X-Gm-Gg: AY/fxX79vTAqDfhV0TxnKZcGiloLuod6ZyE/npaFPh8lMgokXZKNsp+C6HrzZYyk5Dz
	tWaXa+Y5OGE7B8mobpn8enPY38PNiYgRPuPvqJpO4H8tA+j3jeLeigklsceD+ER41Vy9uwHrrpN
	lHm7CVc3suxkc1RhFQzK19tVzowKojbFCfa1CbQRUQV2XZI1kBaQD5zMlbSDKrv6Kb9bYVRYc00
	puESO38Vehz3KVPVh8BA4uXOPpwB5UZQ6uDq8FoC7cj/oWS3brBBpc1aa6NpNpbyynk6GEUCjS1
	eaTiybI5nxi13GP5Hk/SMTRioRjkjuyRGGT1DK0ZxKTHqbv+8AC17ozvhSLVOW4l1QzQfcRKvdJ
	SrerHBAq1QvJmwyLMsN9HmDtsxz9UxXE982ZQA65HXNWQW92p3cfxb8fCoCWEFySmXg8Axl0hhA
	yUQ13NzHUAI1ulO3i6/puv2CXl9Uiq1jjC2e8pvHt7JdsNhZFycoaMuKXQXNof6ueXCbM=
X-Google-Smtp-Source: AGHT+IEvK8nZQ8Bc8MX50o5ptPX6sBLi3/yAGjyPkCLCTY4+WRgF1rxL2hZZbDdIz4icxskuPIqEFQ==
X-Received: by 2002:a05:600c:1d24:b0:479:2a09:9262 with SMTP id 5b1f17b1804b1-47d7f077676mr42759535e9.9.1767720316324;
        Tue, 06 Jan 2026 09:25:16 -0800 (PST)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f9d8576sm24429935e9.1.2026.01.06.09.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:25:15 -0800 (PST)
Message-ID: <979eb1054dbe116c2c8bb9920e94e3a93db5346c.camel@gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>, Nishanth Menon
	 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	 <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, Kendall
 Willis <k-willis@ti.com>,  Akashdeep Kaur	 <a-kaur@ti.com>,
 linux-arm-kernel@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 06 Jan 2026 18:25:15 +0100
In-Reply-To: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_092518_828558_EF85F279 
X-CRM114-Status: GOOD (  21.91  )
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

Hi Markus,

I'm sorry my patch has caused regression for your use-case!

I think we would need to discuss this with TI via our FAE, because the chan=
ge
in question has both been discussed with former FAE and the technical team
behind, and adopted in TI SDK.

Or have you already discused this with corresponding TI HW team?

Which hardware is affected, is it the official SK-AM62A-LP?
Is MMC2 the SD-card?

On Tue, 2026-01-06 at 17:22 +0100, Markus Schneider-Pargmann (TI.com) wrote=
:
> Remove Schmitt Trigger from mmc pins. With Schmitt Trigger enabled
> u-boot SPL is not able to read u-boot from mmc:
>=20
> =C2=A0=C2=A0=C2=A0 Trying to boot from MMC2
> =C2=A0=C2=A0=C2=A0 Error reading cluster
> =C2=A0=C2=A0=C2=A0 spl_load_image_fat: error reading image u-boot.img, er=
r - -22
> =C2=A0=C2=A0=C2=A0 Error: -22
> =C2=A0=C2=A0=C2=A0 SPL: Unsupported Boot Device!
> =C2=A0=C2=A0=C2=A0 SPL: failed to boot from all boot devices
> =C2=A0=C2=A0=C2=A0 ### ERROR ### Please RESET the board ###
>=20
> I bisected this issue between u-boot v2025.10 and v2026.01 and found the
> devicetree merge to be the problem. At a closer look I found the
> k3-pinctrl.h changes. Disabling the Schmitt Trigger fixes the u-boot SPL
> failure to read from mmc.
>=20
> Fixes: 5b272127884b ("arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger =
by default")
> Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
> ---
> =C2=A0arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 36 ++++++++++++++++------=
-----------
> =C2=A01 file changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dt=
s/ti/k3-am62a7-sk.dts
> index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..9129045c8bbd3a83dba6ff6f2=
148a3624b91b546 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -315,30 +315,30 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) G=
PMC0_CSn3.I2C2_SDA */
> =C2=A0
> =C2=A0	main_mmc0_pins_default: main-mmc0-default-pins {
> =C2=A0		pinctrl-single,pins =3D <
> -			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
> -			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLKLB */
> -			AM62AX_IOPAD(0x21c, PIN_INPUT, 0) /* (AB1) MMC0_CLK */

according to datasheet, MMC0_CLK should have address 0x218 and it's the bal=
l AB7.
MMC0_CLKLB is not present in the datasheet and AB1 is actually VSS. 0x21C a=
ddress
is not documented.

Something is not right here...

OK, grepping TRM for CLKLB, one can conclude that 0x21c is actually MMC0_CL=
KLB.

Could you please try to modify 0x21c address only? Does it solve the boot p=
roblem?

> -			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
> -			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
> -			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
> -			AM62AX_IOPAD(0x208, PIN_INPUT_PULLUP, 0) /* (Y4) MMC0_DAT3 */
> -			AM62AX_IOPAD(0x204, PIN_INPUT_PULLUP, 0) /* (AB2) MMC0_DAT4 */
> -			AM62AX_IOPAD(0x200, PIN_INPUT_PULLUP, 0) /* (AC1) MMC0_DAT5 */
> -			AM62AX_IOPAD(0x1fc, PIN_INPUT_PULLUP, 0) /* (AD2) MMC0_DAT6 */
> -			AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */

All the rest actually have ST enabled on PoR according to TRM and I suppose=
 BootROM
would have had hard times booting from the affected MMC device if it would =
not be
the correct setting?

> +			AM62AX_IOPAD(0x220, PIN_INPUT_NOST, 0) /* (Y3) MMC0_CMD */
> +			AM62AX_IOPAD(0x218, PIN_INPUT_NOST, 0) /* (AB1) MMC0_CLKLB */
> +			AM62AX_IOPAD(0x21c, PIN_INPUT_NOST, 0) /* (AB1) MMC0_CLK */
> +			AM62AX_IOPAD(0x214, PIN_INPUT_NOST, 0) /* (AA2) MMC0_DAT0 */
> +			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP_NOST, 0) /* (AA1) MMC0_DAT1 */
> +			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP_NOST, 0) /* (AA3) MMC0_DAT2 */
> +			AM62AX_IOPAD(0x208, PIN_INPUT_PULLUP_NOST, 0) /* (Y4) MMC0_DAT3 */
> +			AM62AX_IOPAD(0x204, PIN_INPUT_PULLUP_NOST, 0) /* (AB2) MMC0_DAT4 */
> +			AM62AX_IOPAD(0x200, PIN_INPUT_PULLUP_NOST, 0) /* (AC1) MMC0_DAT5 */
> +			AM62AX_IOPAD(0x1fc, PIN_INPUT_PULLUP_NOST, 0) /* (AD2) MMC0_DAT6 */
> +			AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP_NOST, 0) /* (AC2) MMC0_DAT7 */
> =C2=A0		>;
> =C2=A0		bootph-all;
> =C2=A0	};
> =C2=A0
> =C2=A0	main_mmc1_pins_default: main-mmc1-default-pins {
> =C2=A0		pinctrl-single,pins =3D <
> -			AM62AX_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
> -			AM62AX_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
> -			AM62AX_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
> -			AM62AX_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
> -			AM62AX_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
> -			AM62AX_IOPAD(0x224, PIN_INPUT, 0) /* (D22) MMC1_DAT3 */
> -			AM62AX_IOPAD(0x240, PIN_INPUT, 0) /* (D17) MMC1_SDCD */

All of these have ST enabled on PoR, according to TRM.

> +			AM62AX_IOPAD(0x23c, PIN_INPUT_NOST, 0) /* (A21) MMC1_CMD */
> +			AM62AX_IOPAD(0x234, PIN_INPUT_NOST, 0) /* (B22) MMC1_CLK */
> +			AM62AX_IOPAD(0x230, PIN_INPUT_NOST, 0) /* (A22) MMC1_DAT0 */
> +			AM62AX_IOPAD(0x22c, PIN_INPUT_NOST, 0) /* (B21) MMC1_DAT1 */
> +			AM62AX_IOPAD(0x228, PIN_INPUT_NOST, 0) /* (C21) MMC1_DAT2 */
> +			AM62AX_IOPAD(0x224, PIN_INPUT_NOST, 0) /* (D22) MMC1_DAT3 */
> +			AM62AX_IOPAD(0x240, PIN_INPUT_NOST, 0) /* (D17) MMC1_SDCD */
> =C2=A0		>;
> =C2=A0		bootph-all;
> =C2=A0	};
>=20
> ---
> base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
> change-id: 20260106-topic-am62a-mmc-pinctrl-v6-19-next-2f3e5563fbb5
>=20
> Best regards,

--=20
Alexander Sverdlin.

