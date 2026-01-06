Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF03CEFD03
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 20:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InpRCJH4Ts9JhFLpum27mQzhd0pB52v3DryP5nM70Ok=; b=A6aPOG3dmwt6E9s+B/GTo+nv9p
	4oxvpPAL8PoOmvQac+BFtQ7gJTlg+C0rYDwZf96Ad3YGngYj52Y/rEZ95uhqK2f/2qG4yaPr/c7qw
	REOlF1knZu6+wnoe25qij5ywhncMm9cGJBKRTTlpV+3s3LSw5WJwzhsVxrxvWOTIs3uRawp95lU6v
	c8YNcyYVIKKB5ebF9ztcd1YT6+6umsBxNyklKBjZeOpXs0m7aioyby/wECiTYtYImyhKpGPyL1Rth
	8DgGly7L7QQhotpv7/TPSyxz55O+gn5VupiJcFK9fWE0n6buE7L2RM/fFNIwVnFJB7olIgKeQAAHX
	gpeL14mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDcf-0000000DoYW-0upd;
	Tue, 06 Jan 2026 20:25:45 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDcb-0000000DoY9-0G4Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 20:25:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-430f57cd471so681079f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 12:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767731139; x=1768335939; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=InpRCJH4Ts9JhFLpum27mQzhd0pB52v3DryP5nM70Ok=;
        b=aLIH1IMiiru2YmfDl0X6qrKsbYJoK2mVLXGuZJtScwLlCzejdxgmGzY2WyJY0z7CE9
         3INqG1HzgQvEDWPr861n2kuQTzYqKhqvR90jbTM2yVr959w4tJ+uEBCeX1oK1DWS1has
         AkxjBbVmL2QwZr6cTWzT1mADkhLuLRw8SzZ3Xs8610Ekj3eg+mEjTbfZwhTCU94TmeyZ
         niDdoYvjCrWgiMWuicqPkcfiFw4S6LZ6wvPp7P0mKVz3gcj6ghZc2uVfcMNf/3BUxKWV
         XgkHpRA1j+7iXtCXBQrYI3TiD51uCzm3CE7Kc8IZC/AQr5RPDAVKYyPucQdfkh47uSRU
         H3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767731139; x=1768335939;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InpRCJH4Ts9JhFLpum27mQzhd0pB52v3DryP5nM70Ok=;
        b=BZwReToXnZpGp/fijFDslUC6O4X2vy3URh3KWAfkYiH9zOzC5aouAhxbMXRpLd8kAB
         ctZ8Tl9i3wgzMDm5n1HdmkQGsr/b26pdVKjNIsvUkXsJQEXVzUIiQvTSE5KYfmgJ7KZM
         +l8l7wBLcYEpCVIFfdwd6BRlDQv1csw8Q+nT5bJYhahwerF64BHhTllLOboEPrdkCypS
         zLcutXmNwteZtSIx9lrugnilmDllB1WjCVGBVqRHHVamWbpaGK2w1/QBam3QNiTM5p8O
         XWMFRopWJETGwcP8pCsI6gNjz3RSjA604KcRWnjlEy4xeKmM1kHkxhYZ3Vxr5DLhlWNL
         fb6g==
X-Forwarded-Encrypted: i=1; AJvYcCX5tAjRCEXnTLbNZigxfsZvsbJsE506Sg4svnMO8tNpRhELwoed5Sup12gZPVGXGj2uPTT6AZUIH53vbg4IXlc3@lists.infradead.org
X-Gm-Message-State: AOJu0YxxFZr2Q2A05l8DzeAW+9seGT/7BlYWV9ZT/InzeUa/REbOzPXT
	pLlgV6Y+2t953wJlZDlUo4P08XbA61KzofYDpXD2zdq7rtbDE625jZmXKHbkrtVyzhc=
X-Gm-Gg: AY/fxX4puwSOFfY0do5g+4VDhyMw9bEGMUB8QlV5vaS5cL8Z/D6Gn6VpGv9mv2NbFnJ
	CzGSW1o/NsG+x9W0bZBjxBar+E0Sj9/ryL4iIOJTHREGPD+QelSeb3QtUf0vAiPdyKeWTklMfoN
	f+vDwSjvmHdbajg+xJdH8616gyj6Jtj3xrpj6ROpxOHMrRhqtnMwGXPn4/PrCCSzEIqu+5EnEnL
	pAFOU7A5Sm3r1nEdGNBz1Kr1uue7s9JVDRXRiZ7ljRlMibGLVWEpSWHjPWJ1bIpAXfUjwsLlQPN
	K7+u+IrZ8VFL/WFUK0gLDl1hDBKNS95Hyr9qbox3eAgDrtdP16Xl9hz27eGV80RpV/xgTVVcJ1p
	iqolV7bmcw9iR47ia/cHs6ipiIl/W/YKgdYa1jjlWcMtl6YFoGNvwI5BHElETrsZ3EFJm9qh5sm
	mt9h4U
X-Google-Smtp-Source: AGHT+IF2eFD4qqiNSfi8TwKianKXVDZdxvtrCaDoHkxKfUBqtaeXICo1xMsMfKjQgmu0rURXgO0oVw==
X-Received: by 2002:a05:6000:2512:b0:431:a50:6e97 with SMTP id ffacd0b85a97d-432c374ff11mr435166f8f.34.1767731139002;
        Tue, 06 Jan 2026 12:25:39 -0800 (PST)
Received: from localhost ([195.52.160.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm6200416f8f.42.2026.01.06.12.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 12:25:37 -0800 (PST)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5148a380f6f7e57f68a4497ee98a33d6cccc4f9c818445a72768aefddb6f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 06 Jan 2026 21:25:29 +0100
Message-Id: <DFHSDXTVL4AU.2OQ9VB9TEJ75G@baylibre.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Alexander Sverdlin" <alexander.sverdlin@gmail.com>, "Markus
 Schneider-Pargmann (TI.com)" <msp@baylibre.com>, "Nishanth Menon"
 <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com> <979eb1054dbe116c2c8bb9920e94e3a93db5346c.camel@gmail.com>
In-Reply-To: <979eb1054dbe116c2c8bb9920e94e3a93db5346c.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_122541_305962_E40F90D2 
X-CRM114-Status: GOOD (  33.78  )
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

--5148a380f6f7e57f68a4497ee98a33d6cccc4f9c818445a72768aefddb6f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Alexander,

On Tue Jan 6, 2026 at 6:25 PM CET, Alexander Sverdlin wrote:
> Hi Markus,
>
> I'm sorry my patch has caused regression for your use-case!
>
> I think we would need to discuss this with TI via our FAE, because the ch=
ange
> in question has both been discussed with former FAE and the technical tea=
m
> behind, and adopted in TI SDK.
>
> Or have you already discused this with corresponding TI HW team?
>
> Which hardware is affected, is it the official SK-AM62A-LP?
> Is MMC2 the SD-card?

I only tested my am62a board on u-boot v2026.01. It is a SK-AM62A-LP.
MMC2 is the SD-card and mmc1 in the devicetree.

I am using u-boot's am62ax_evm_r5_defconfig and am62ax_evm_a53_defconfig
as defconfigs.

>
> On Tue, 2026-01-06 at 17:22 +0100, Markus Schneider-Pargmann (TI.com) wro=
te:
>> Remove Schmitt Trigger from mmc pins. With Schmitt Trigger enabled
>> u-boot SPL is not able to read u-boot from mmc:
>>=20
>> =C2=A0=C2=A0=C2=A0 Trying to boot from MMC2
>> =C2=A0=C2=A0=C2=A0 Error reading cluster
>> =C2=A0=C2=A0=C2=A0 spl_load_image_fat: error reading image u-boot.img, e=
rr - -22
>> =C2=A0=C2=A0=C2=A0 Error: -22
>> =C2=A0=C2=A0=C2=A0 SPL: Unsupported Boot Device!
>> =C2=A0=C2=A0=C2=A0 SPL: failed to boot from all boot devices
>> =C2=A0=C2=A0=C2=A0 ### ERROR ### Please RESET the board ###
>>=20
>> I bisected this issue between u-boot v2025.10 and v2026.01 and found the
>> devicetree merge to be the problem. At a closer look I found the
>> k3-pinctrl.h changes. Disabling the Schmitt Trigger fixes the u-boot SPL
>> failure to read from mmc.
>>=20
>> Fixes: 5b272127884b ("arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger=
 by default")
>> Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
>> ---
>> =C2=A0arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 36 ++++++++++++++++-----=
------------
>> =C2=A01 file changed, 18 insertions(+), 18 deletions(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/d=
ts/ti/k3-am62a7-sk.dts
>> index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..9129045c8bbd3a83dba6ff6f=
2148a3624b91b546 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -315,30 +315,30 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) =
GPMC0_CSn3.I2C2_SDA */
>> =C2=A0
>> =C2=A0	main_mmc0_pins_default: main-mmc0-default-pins {
>> =C2=A0		pinctrl-single,pins =3D <
>> -			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
>> -			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLKLB */
>> -			AM62AX_IOPAD(0x21c, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
>
> according to datasheet, MMC0_CLK should have address 0x218 and it's the b=
all AB7.
> MMC0_CLKLB is not present in the datasheet and AB1 is actually VSS. 0x21C=
 address
> is not documented.
>
> Something is not right here...
>
> OK, grepping TRM for CLKLB, one can conclude that 0x21c is actually MMC0_=
CLKLB.
>
> Could you please try to modify 0x21c address only? Does it solve the boot=
 problem?
>
>> -			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
>> -			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
>> -			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
>> -			AM62AX_IOPAD(0x208, PIN_INPUT_PULLUP, 0) /* (Y4) MMC0_DAT3 */
>> -			AM62AX_IOPAD(0x204, PIN_INPUT_PULLUP, 0) /* (AB2) MMC0_DAT4 */
>> -			AM62AX_IOPAD(0x200, PIN_INPUT_PULLUP, 0) /* (AC1) MMC0_DAT5 */
>> -			AM62AX_IOPAD(0x1fc, PIN_INPUT_PULLUP, 0) /* (AD2) MMC0_DAT6 */
>> -			AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
>
> All the rest actually have ST enabled on PoR according to TRM and I suppo=
se BootROM
> would have had hard times booting from the affected MMC device if it woul=
d not be
> the correct setting?
>
>> +			AM62AX_IOPAD(0x220, PIN_INPUT_NOST, 0) /* (Y3) MMC0_CMD */
>> +			AM62AX_IOPAD(0x218, PIN_INPUT_NOST, 0) /* (AB1) MMC0_CLKLB */
>> +			AM62AX_IOPAD(0x21c, PIN_INPUT_NOST, 0) /* (AB1) MMC0_CLK */
>> +			AM62AX_IOPAD(0x214, PIN_INPUT_NOST, 0) /* (AA2) MMC0_DAT0 */
>> +			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP_NOST, 0) /* (AA1) MMC0_DAT1 */
>> +			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP_NOST, 0) /* (AA3) MMC0_DAT2 */
>> +			AM62AX_IOPAD(0x208, PIN_INPUT_PULLUP_NOST, 0) /* (Y4) MMC0_DAT3 */
>> +			AM62AX_IOPAD(0x204, PIN_INPUT_PULLUP_NOST, 0) /* (AB2) MMC0_DAT4 */
>> +			AM62AX_IOPAD(0x200, PIN_INPUT_PULLUP_NOST, 0) /* (AC1) MMC0_DAT5 */
>> +			AM62AX_IOPAD(0x1fc, PIN_INPUT_PULLUP_NOST, 0) /* (AD2) MMC0_DAT6 */
>> +			AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP_NOST, 0) /* (AC2) MMC0_DAT7 */
>> =C2=A0		>;
>> =C2=A0		bootph-all;
>> =C2=A0	};
>> =C2=A0
>> =C2=A0	main_mmc1_pins_default: main-mmc1-default-pins {
>> =C2=A0		pinctrl-single,pins =3D <
>> -			AM62AX_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
>> -			AM62AX_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
>> -			AM62AX_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
>> -			AM62AX_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
>> -			AM62AX_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
>> -			AM62AX_IOPAD(0x224, PIN_INPUT, 0) /* (D22) MMC1_DAT3 */
>> -			AM62AX_IOPAD(0x240, PIN_INPUT, 0) /* (D17) MMC1_SDCD */
>
> All of these have ST enabled on PoR, according to TRM.
>
>> +			AM62AX_IOPAD(0x23c, PIN_INPUT_NOST, 0) /* (A21) MMC1_CMD */
>> +			AM62AX_IOPAD(0x234, PIN_INPUT_NOST, 0) /* (B22) MMC1_CLK */
>> +			AM62AX_IOPAD(0x230, PIN_INPUT_NOST, 0) /* (A22) MMC1_DAT0 */
>> +			AM62AX_IOPAD(0x22c, PIN_INPUT_NOST, 0) /* (B21) MMC1_DAT1 */
>> +			AM62AX_IOPAD(0x228, PIN_INPUT_NOST, 0) /* (C21) MMC1_DAT2 */
>> +			AM62AX_IOPAD(0x224, PIN_INPUT_NOST, 0) /* (D22) MMC1_DAT3 */
>> +			AM62AX_IOPAD(0x240, PIN_INPUT_NOST, 0) /* (D17) MMC1_SDCD */

My board is setup to boot from SD card for easier u-boot testing. So
only the mmc1 is relevant for my setup. I just tested which pins need
NOST here for the boot to work, all DAT pins need the NOST variants,
otherwise it does not boot here. Not sure if this is just my board or it
fails on other boards as well.

Best
Markus


--5148a380f6f7e57f68a4497ee98a33d6cccc4f9c818445a72768aefddb6f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaV1vuRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNB
7QEA+fNdxGsI7MEgje1RhFzgNhDzAEC+9JsbotuUWDJyF44BAKqWmNM7DgUAdP6H
2khSJFPWlKuRNiBljEo4WVwfei4C
=32OF
-----END PGP SIGNATURE-----

--5148a380f6f7e57f68a4497ee98a33d6cccc4f9c818445a72768aefddb6f--

