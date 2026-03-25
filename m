Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0A0109C057
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vWMfDOSQfWlw8ZoOH44pVZOnW6Fijg7msvIoLlglLw=; b=FGBoBy3kSZRhIXMQYn7jSrezHI
	8T2xuIbqjcfDq8KGdN6hysO1dyu8FR0XQoAQ6NgO9UGUkcn2rSPG87UjijFhmoTGVq/1mGDCcQzVO
	sWIKxEkNin9OVTqHyhfhlkl0TD9TfUJWB6HlPkdrB/j0os5V/EDlH27OD+4vT44v6myvBmgHekbv3
	11DMvIKuFk6LltrKLDfFK+NBENQ4vQKVigVnNQvZdPTZB38zyUE1tUy8TY05IxBGJ7RYsqsR8WyrY
	HXSeEHTaRzYiSxsFxFHT7pmuSP/91NRm5j3e4O4ijtTznkSXxWFVdhgBWYrHCwGgLRYYTuMXGiLL3
	Gwbl0H5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Suo-000000044eD-20mk;
	Wed, 25 Mar 2026 18:25:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Sul-000000044dN-2l6b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 18:25:13 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-66970715adbso232873a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 11:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774463109; cv=none;
        d=google.com; s=arc-20240605;
        b=ieI+eEOSfcpDVH1uQ/D57o12DrXj5a2PSXLVbaHrJuVNew7OP7kCG9VnUQ1/XE35zN
         B/tMywYTfFTclgCTgSc92aqC3h3IZ36PMIf2RyfBHSuzB4Vaaw1ljoU65OO7xOI5A8MI
         8FcAAZg5/qsJr5MnhBBWoob+b+QCM1nFMb178GWXM5q3lWERzSGrP44tp/DRGenUAb+D
         50eVgXUYnvDyYmTUTbR9qgqhVJ1hx5gaZULgEcUk2jkHzUkyFKxpv14oBTb7BWW+fMvS
         g8bH7sd5mmNygRW4hPhfqMFZpKxL04ytudn0lWwRs1FKjDfsmfsSwAX+lpJ/eUMMGAQ3
         jMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+vWMfDOSQfWlw8ZoOH44pVZOnW6Fijg7msvIoLlglLw=;
        fh=LKvYC+SAoVxTJIbwhLXpkv0EZAURn3oDBxE/xuNjFCU=;
        b=lNNLt1D5O57xS+1qydogCo2EiWfqIpQpNgfuEVgJSBlb1mlsTFcRmfegqqjSwYCDqm
         xGMGnMFSs8+R+q7FKCwcNi8GNCDabhKEcXiRZjqzl8vpDCOyPpXywqsTDr3866Ymtunn
         tAKNvje+BiHGBDfugl51QODK7y/RdT8JrjlLRx3fRo3wnjipksWQzrhPwJqag+nE3tUY
         ZkgoAvQHzPSHe7bl6sIepGyWk13PzdMAX3rOo3dptaC9X4AbQiQL4V6CWRKlFK01Hnts
         s4zR9cLeFN7kWcrsRJST7BhBN7mxGY4ANAv69AYD0JgKw3U0G0TBpWOhmhxUaevxaFIN
         S4VQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774463109; x=1775067909; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vWMfDOSQfWlw8ZoOH44pVZOnW6Fijg7msvIoLlglLw=;
        b=UL7Oqdp5y8Efsm3Il6FBINmkOkoWrLceIzsgwzfpJCtB7fV0oUvWTn7k17CK7GjyYY
         shfYRam9ltdvu84uY1GmMR/S/8aAI/FgVm5pKUWmAHwOwRuDpaDN0q/dtp3zlI+ajckM
         nwYS1+cmTYJSd2E4Kk8B+1PaSQdfwvcvVG1JiSjyzSIxwDGPK9eypfXRijteYzFLJoeG
         wDmiVpGzA5pCmCmU3LyeiYflY3zfF/O6iKxWKdn/6LrLcLZgA+GI0GI7AcosIzlZyKAD
         ESODE/cSEewBEcrLIby4rnya3Icxwj2bO9FcjZ3E5yUkiTD0kR3BL4noevDBW+1+HhbB
         6DVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774463109; x=1775067909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+vWMfDOSQfWlw8ZoOH44pVZOnW6Fijg7msvIoLlglLw=;
        b=Ffrs8grvPhMYe6nRY9paHAABRjaCOMoUfqlWfTQ16epgGOL2FdXMlbCq2tnhSH5LqF
         Pv+d4sht5tOZ9em5g9xRc6o18YKAgI+N5QIjoI2vH3zM0RpXRsXEdeIMH9Rg9dzU+xc/
         VlVrX4UBlJeessXtfbds3TW6uZvU/80kumQ5oZywiXztDLvjiY+udW5Uf2N049WIPDDS
         0aOblFhgApOWozevVUZDSf5qn2jSOabTjaoC9oponK86wmi6BINyPQXVEreG/zG1eALN
         uen41ugskBPwFkpRL3bps7Ryrv4lVh2Anb3npWxVE7aIQ0ymMRw1q39DDsy42d413ORD
         EmeA==
X-Forwarded-Encrypted: i=1; AJvYcCX5xuOB9PrtZwjWwmOGe90zoW7neQoCHWlxvDaiuHlYTpWGVKBP34nmQZ6ltJ9PkRNEPtloB09rGY8px9aD5uDl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxad/BnQ5OxzDwdQtQ+VoTfR/IyK9AxBBulKdnRx7LsqfU67Nxz
	Reyqq1Bc4SMWhRVR013TOwbdxMElSv2a4saOMpJnSl3S8EOk8eRstn4U7aSpCJRcPBMYzrba3gY
	v+BXlpodcDkFD2RmUtUwNha/ew6jj1+kDpSli
X-Gm-Gg: ATEYQzzRZUyGgvGrkF4BbDXwIDYBVNrInZ0t4FUKhXJZYezxWgZ90OHC5dHJial/sWH
	CPP79blF780kARGU3gpPWUjomseGGexuoE0X6KcYN+xD9d8pvFpb8EUQTguxEYczWM6TAa56O6G
	Tk6PVEQRq85IeyOkgXEfZEzR6JYBpJ5n/SUrcPXY3C/dfgqg1jhEHBGWKPuza3A+zIkwh+YinSx
	vszYdWUh89uL8ASxmybo6ZUVIxnLgTNbNrHWXOjDDjQol9eEsv/2a9eAR2Glege8i0kcdPSsjMU
	nYm2Rg==
X-Received: by 2002:a05:6402:1d4e:b0:669:d9a4:cd4b with SMTP id
 4fb4d7f45d1cf-66a8262af14mr3212998a12.11.1774463108886; Wed, 25 Mar 2026
 11:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <87bc37ee-234c-4568-b72e-955c130a6838@arm.com> <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com> <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org> <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org> <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
 <acNgUoWWMCi1oLU4@google.com> <DHBYL7Y262J2.263EOC2JNN4RK@kernel.org> <acP9-AfUQ7zp3kMS@google.com>
In-Reply-To: <acP9-AfUQ7zp3kMS@google.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Mar 2026 23:54:51 +0530
X-Gm-Features: AQROBzC57btNYqd28tboSY034eYP0IcSkF3_Hl9bgfxidfp7h8unSgphUiRekA8
Message-ID: <CANAwSgR7ABawrnSG6CievYT-BZ447TaFC_kqCYc+oqxkD6Uxjg@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Grimmauld <grimmauld@grimmauld.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_112511_714272_9FF8A383 
X-CRM114-Status: GOOD (  20.74  )
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

Hi Dmitry/ Robin,

On Wed, 25 Mar 2026 at 20:57, Dmitry Torokhov <dmitry.torokhov@gmail.com> w=
rote:
>
> On Wed, Mar 25, 2026 at 04:13:03PM +0100, Danilo Krummrich wrote:
> > On Wed Mar 25, 2026 at 5:13 AM CET, Dmitry Torokhov wrote:
> > > That means that you are kicking the majority devices (for now) into
> > > deferral path. I do not think this is optimal.
> >
> > That's not necessary, we'd only need to kick those into the deferral pa=
th that
> > have PROBE_FORCE_SYNCHRONOUS, no?
>
> Yes, it may limit the fallout, but as I explained in my other email
> there seem to be a serious disconnect on what synchronous and
> asynchronous probing mean.
>
> I wonder, don't we get issues with phylib in other cases? Don't we ever
> have a module resulting in creating a phy device triggering loading
> another module on the same thread? Won't that result in a warning also?
>
> Thanks.
>
> --
> Dmitry

In comparing the Orange Pi 5 Plus and Radxa Rock 5B schematics,
I noticed a key difference in regulator implementation for pcie2x1l2 node.
While the Orange Pi uses a dedicated GPIO (GPIO3_B4) for ethernet_power_en,

Reference: orangepi=E2=80=915=E2=80=91plus schematics
[1] https://drive.google.com/file/d/1cVT7lSLlgtIvHh4PllijP5E4zz7pxCyh/view

On the Rock 5B ties the LAN_EXT_CORE regulator directly to the VCC_3V3_S3
PMIC rail without a control GPIO.

For LAN_EXT_CORE regulator POW_EXT_SWR/ENSWREG is defined
as enabled by this regulator, but with no GPIO pin linked to toggle.

Reference: Radxa Rock 5B schematics
[2] https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pdf

Because the Rock 5B lacks that GPIO toggle, the existing dummy regulator
definition is redundant.

By stripping out the dummy node and pointing the PCIe supply
directly to the PMIC rail,

If somebody could verify these DTS changes

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 668b19c05f7e..cf7d9d516d0e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -81,15 +81,6 @@ vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
                status =3D "disabled";
        };

-       vcc3v3_pcie2x1l2: regulator-vcc3v3-pcie2x1l2 {
-               compatible =3D "regulator-fixed";
-               regulator-name =3D "vcc3v3_pcie2x1l2";
-               regulator-min-microvolt =3D <3300000>;
-               regulator-max-microvolt =3D <3300000>;
-               startup-delay-us =3D <5000>;
-               vin-supply =3D <&vcc_3v3_s3>;
-       };
-
        vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
                compatible =3D "regulator-fixed";
                enable-active-high;
@@ -480,7 +471,7 @@ &pcie2x1l2 {
        pinctrl-0 =3D <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;
        supports-clkreq;
        reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
-       vpcie3v3-supply =3D <&vcc3v3_pcie2x1l2>;
+       vpcie3v3-supply =3D <&vcc_3v3_s3>;
        status =3D "okay";
 };

Thanks
-Anand

