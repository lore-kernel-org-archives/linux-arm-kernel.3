Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E31AC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kS+alGnsif5zPcgusNl6KrEfFeDFZl8IkaD1XdPSRXw=; b=I+j7qZV9DBdLAWtylMbfCLs8op
	w61ir8c/P+fNanD2p+lTx3rJ8gVLhBMtM7VQcxhz2hKJu7FmUiEs5e3YYzWCV+2kv6ZQftD7J9fdy
	UChPd1MAtFzonygdNF06qhThbBr3+U1wiaHJ5/e/H3zFYvA6f2VtkmVfWfoF8iSlkPzNa9mHKlC7p
	wApXevAlaEsG3RVKKtrkYxbeXzWjquK4dmPx4pCqIrBFhRO6Dz9lYJwZJswrnbewDkrF/tEEcF2fk
	1bQ6yTBdCU26huJR6U0N1bQyifLCe9cP1xB/Nw40EzrtYzEchPqjU2Co3S0N3ZHvjCWnTwO/aJplA
	EblHVI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMwH-0000000HT1L-20EH;
	Thu, 16 Jul 2026 14:19:49 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMwE-0000000HT0N-49RN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:19:48 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-92e512a9a6bso348952885a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 07:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784211584; cv=none;
        d=google.com; s=arc-20260327;
        b=eOISNzbyIhIGXU3yA6pjvlwuXXkze4ecrFTRl51rBOq8AHUgAqiMARR67OI/zQ67iP
         1dupmfTLKayjWZHpJOf+OaAy6esuQBm0MK5Ljj2tB5d3k7vzvGv/xFlwcGT8FGmoW15t
         dpVzGT9nehqMhnGXg+zXyXyxV4DNPry09O1UsBBe5ZEU7lHThOsy8laWg1Z5j9gmQ9Et
         nfBFMjS2FI7/ewAfvjMvlPpM/kPKJTA3dgnE5YNW06SDLLN1U2m7B9SJbAyIAe3luI4t
         COCYvZVeBxEJn5R17Nohz1DSvLtUW2AhNWGfK5FTLGLeDyM8N8WwJ1F6U4QvJCxsjybW
         U2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kS+alGnsif5zPcgusNl6KrEfFeDFZl8IkaD1XdPSRXw=;
        fh=+jOn+k6LyUnh2cKQcZCoXiybP1cuTnn9OOc90FqlF6k=;
        b=lnd32Dnc73awoOZiPUz0NbvFyt1a5BVGvnxBoXhbox11jPsscfa+D9JFNVCpkw0vRB
         eM43kP/+u+0GMTuoeubYC2s7DLrGi8r7/AHkVVH4GMi1uw8X6oTNTof0fEtYL4woLTyj
         Zs+vSpkd2l7TlvjoCjQVistVFDbSKr7pkAElluWrb21TDpDZ2b683D1gUbrI8QRVkEzh
         bQ74toP33oU3utD6mBabu0aUn4Qsal82J+sIkOPpElsnyIgZElF+qpT1oMeYMItHtKRA
         7sZQF96OQ8GC/7D2ts34PNVoeECAOO52FGeTi0X0qYzXCH5mgot83+1I4Z9gdwDVnvOF
         Znog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1784211584; x=1784816384; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kS+alGnsif5zPcgusNl6KrEfFeDFZl8IkaD1XdPSRXw=;
        b=JBKyciQLD4RN+eW/j5Y6m86D+A5sYakIKv9AvFCZUOR/uDE+uaAoB+2yc7ANHxnxLM
         Tx4WUYyF7OACoGLnc9zconjkApW/mGo9J18NDzgOTMyOYXI+5SdcAzVPx+XqFwJVlHUo
         eYgZRi+QdTvS3zFD0RJ+ezbghCXly5DV++gPSBKs9JZ0vnbLHcQOT5K/b8/idkTm3Ojk
         9RFXwNJ9HKs1JYC7A+OgHZ3qf/nxnvmBD7hlz6xJfXJeOAopMXCkkODvyY3YwecgjrOV
         6JNQkPWegQWiODim8SDnYD414HbYzIu0WnQhv0vumPoetHoDaWHcCfHF+DEW+actcaiF
         LaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211584; x=1784816384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kS+alGnsif5zPcgusNl6KrEfFeDFZl8IkaD1XdPSRXw=;
        b=Kca2Fmtgzm7q09CxWD4mvmCfV1rPfoTnWToVP2/IAjj4YyF/BIq5dFy7NyEH0bo90E
         PUuXxSJo8zvuG6Tt+xxPIojVDlnu6/D3R5LRByW44A33EgArNPFQphOopiLzzZT2jiHI
         13gySWACq7ivX1QAo93QuQiwE0W1rLOQGpluFj3yQPgbn4LeS1s7x+DZ++H3lOV8kFu0
         1S9eg51tnmybXEgmPVyZmSMx9S2O/gNh+m67bB/ZV9gzu8csL+IgiF39jlAU+ChUCSqC
         yIbxxUS9LTux0I+QmhN9czNMExSc1MtHduSPERLC7GRjMuDS2FI2V2DoMArMnfUblMhy
         hTYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjfQ1qahcjCu2B0v1lO7PHGR6/NsTS2A/j7ilij8ZM//7EPEd1GOSfLeNZwBxjJ3Z6PE0FSaoPTjIq8s2fD6CC@lists.infradead.org
X-Gm-Message-State: AOJu0YyveXlDbq18YYtPh/g9xRxh8yIQ/GCwyU6skvAp1BercGkF4rsi
	aYY0DPIjeITVg8pkAYj1u3pXAbx+W9bNM9cOq4Sz++EhC7gTqffr1yrieu8S4LUUfTOsti7GAVN
	hQWc5HZxEaI241fz4vg7vll6QY8P+dAeB+wdJtvrAtw==
X-Gm-Gg: AfdE7clNER5kpXiiTf+cf3jAKMBYoFCKJewuE9L7uob5f6CJPaZgyq6ZdNOfEc/UPdO
	gaufdnRjLvuprSdLLMS6QJzK54AdeErYReMD5jY/NtgOERNZRTmjOgl2ascqzb6rRxc5biScUBd
	dx8kNHXhCBCfkgmmOPRAELjSTDKg0tQUwjCikues9u+tbvMKmkW3xMW4CvMtTgYd/jjzDtN1kn0
	qLKKbTn8phrZTHbx0uWMeWN626xxX1hhH9eoVCPI4q+mevN6g4lfs+8h8L9NCOYnojj5reMcb4v
	QVxPkBVDgfIVnZmw7GIuxEv+ab4MmvBOWxpGo0H7v7ZKystwGNjyUVmMIKugqnyX5OB1K0P2mWK
	uULxVNA==
X-Received: by 2002:a05:620a:6982:b0:92e:5c0b:a6a0 with SMTP id
 af79cd13be357-93086a54171mr1198167185a.26.1784211584260; Thu, 16 Jul 2026
 07:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260511025352.106126-1-dennis@ausil.us> <CAABkxwvWNvZbGNRYGQVnrORr0ycXFY=SdUTD9Oe9tkPcdPSUEA@mail.gmail.com>
In-Reply-To: <CAABkxwvWNvZbGNRYGQVnrORr0ycXFY=SdUTD9Oe9tkPcdPSUEA@mail.gmail.com>
From: Dennis Gilmore <dennis@ausil.us>
Date: Thu, 16 Jul 2026 09:19:32 -0500
X-Gm-Features: AUfX_myQKtrnP7-Wv8qJa1bMcngAWvoeQ8OxtsztRgnJdHO4XZo93xGlFfZgBk4
Message-ID: <CAABkxwuHdNUDvLbDhVTcDeBB4mzAE6XYq+TD47iHzcEpXH6yDA@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] Add support for Orange Pi 5 Pro
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Alexey Charkov <alchark@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	FUKAUMI Naoki <naoki@radxa.com>, Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_071947_055160_32B0409A 
X-CRM114-Status: GOOD (  40.05  )
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

Just pinging again to see if anything more is needed?

Dennis

On Wed, Jun 3, 2026 at 9:49=E2=80=AFPM Dennis Gilmore <dennis@ausil.us> wro=
te:
>
> Hi,
>
> Just checking if anything else is needed.
>
> Dennis
>
> On Sun, May 10, 2026 at 9:53=E2=80=AFPM Dennis Gilmore <dennis@ausil.us> =
wrote:
> >
> > This series adds initial support for the Xunlong Orange Pi 5 Pro, based=
 on
> > the Rockchip RK3588S SoC. The board features eMMC, SD card, NVMe (PCIe)=
,
> > a Motorcomm YT6801 NIC (PCIe), WiFi/BT (BCM43456), HDMI connected to So=
C
> > (Second port is disabled in this patch), and a 40-pin expansion header.
> >
> > The series was tested against Linux 7.0
> >
> > Please take a look.
> >
> > Thank you,
> >
> > Dennis Gilmore
> >
> > Changes in v10:
> > - rename rk806_single to rk806
> > - link to v9: https://lore.kernel.org/linux-devicetree/20260429024737.5=
44813-5-dennis@ausil.us/
> >
> > Changes in v9:
> > - removed support for the dp-to-HDMI bridge, will send in a second patc=
h
> >   set to enable discusion to finish on how to handle its two operating
> >   modes
> > - link to v8: https://lore.kernel.org/linux-devicetree/20260425031011.2=
529364-1-dennis@ausil.us/
> >
> > Changes in v8:
> > - Bridge node: renamed label from lt8711uxd to hdmi-bridge
> > - Bridge node: added vdd-supply =3D <&vcc3v3_dp>. The vcc3v3_dp regulat=
or
> >   gates power to the LT8711UXD. regulator-always-on is kept because
> >   drm_simple_bridge only enables vdd-supply with HPD which does not
> >   happen without power on
> > - GPIO output pinctrl groups (bt_wake_gpio, dp_bridge_en, ethernet_en,
> >   vcc5v0_otg_en, wifi_enable_h) changed from pcfg_pull_none to
> >   pcfg_pull_down to match the RK3588S power-on-reset default state
> > - pcie2x1l1 (NVMe): switched from GPIO-mode reset to hardware sideband =
pins
> >   using pinctrl-0 =3D <&pcie30x1m1_1_perstn>, <&pcie30x1m1_1_clkreqn>,
> >   <&pcie30x1m1_1_waken>. Note: despite the "pcie30" prefix in the DTSI
> >   group names, the SoC pin-mux table confirms these alt-function 4 pads
> >   physically route to pcie2x1l1's native PERST#/CLKREQ#/WAKE# inputs.
> >   reset-gpios is retained alongside the pinctrl entry for U-Boot
> >   compatibility (pcie_dw_rockchip in U-Boot requires reset-gpios).
> > - pcie2x1l2 (NIC): added &pcie20x1m0_clkreqn and &pcie20x1m0_waken to
> >   pinctrl-0
> > - Renamed pinctrl group vcc3v3_phy1_en to ethernet_en to match the
> >   schematic signal name (Ethernet_EN)
> > - link to v7: https://lore.kernel.org/linux-devicetree/20260414214104.1=
363987-1-dennis@ausil.us/
> >
> > Changes in v7:
> > - Fix up whitespace issues identified by checkpatch.pl --strict in
> >   rk3588s-orangepi-5-5b.dtsi
> > - checkpatch gave a warning for WARNING: phy-mode "rgmii-rxid" without
> >   comment, as this was moved over I left it untouched
> > - Added lontium,lt8711uxd to the compatible enum in the simple-bridge
> >   binding
> > - Added lontium,lt8711uxd match entry with DRM_MODE_CONNECTOR_HDMIA to
> >   the simple-bridge driver
> > - New patch to rename the regulator labels for the es8388 supplies to
> >   match the schematics and they all use vcca_*
> > - Fixed ES8388 PVDD-supply =E2=80=94 vcca_3v3_s0 =E2=86=92 vcca_1v8_s0,=
 5 Pro is
> >   different to 5 and 5b.
> > - analog-sound: use CPU-as-clock-master on the Pro. The ES8388 is wired=
 to
> >   i2s2_2ch (the only I2S block physically routed to the codec pins on t=
his
> >   board), which uses the legacy rockchip_i2s driver. That driver's
> >   slave-mode trigger path hangs for 200 =C2=B5s polling I2S_CLR and bai=
ls with
> >   -ETIMEDOUT ("lrclk update failed"). The TDM-capable i2s0/i2s1/i2s5
> >   blocks served by rockchip_i2s_tdm don't have this issue, which is why
> >   other mainline ES8388 boards get away with bitclock-master =3D master=
dai.
> >   Drop bitclock-master/frame-master and the masterdai label to let the =
I2S
> >   block generate BCLK/LRCK itself
> > - Removed regulator-always-on/regulator-boot-on from vcc3v3_dp
> > - Added pinctrl entries for all GPIO pins (dp_bridge_en, vcc3v3_phy1_en=
,
> >   wifi_enable_h, pcie2x1l1_rst, pcie2x1l2_rst)
> > - DP bridge rework =E2=80=94 replaced dp-connector node with proper cha=
in:
> >     - lt8711uxd bridge node (compatible lontium,lt8711uxd, with port@0/=
port@1
> >       endpoints). Bridge power is gated by the vcc3v3_dp regulator, who=
se
> >       enable GPIO (GPIO3_PC2) is driven via the dp_bridge_en pinctrl gr=
oup;
> >       no enable-gpios/vdd-supply on the bridge node itself.
> >     - hdmi1-con connector node (compatible hdmi-connector, type a)
> >     - dp0_out endpoint now points to bridge input instead of old connec=
tor
> > - remove accidentally included unnecessary changes
> > - link to v6: https://lore.kernel.org/linux-devicetree/20260411024743.1=
95385-1-dennis@ausil.us/
> >
> > Changes in v6:
> > - Move the shared configs for the Orange Pi 5 and Orange Pi 5b from eac=
h
> >   devices dts to a shared rk3588s-orangepi-5-5b.dtsi to avoid duplicati=
on
> > - Remove empty ports subnodeis from typea_con
> > - Move i2s2m1_mclk pinctrl from &i2s2 to the es8388 codec node
> > - Add dp-con, dp0_out, dp0_in, and vp1 nodes, plus the vcc3v3_dp regula=
tor
> >   in order to get the second HDMI port working via its transparent
> >   LT8711UXD DP to HDMI bridge
> > - link to v5: https://lore.kernel.org/linux-devicetree/20260401010707.2=
584962-1-dennis@ausil.us/
> >
> > Changes in v5:
> > - define a connector node for Type-A port, and list the regulator as it=
s VBUS supply explicitly.
> > - Requires https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e5=
5a4c2@flipper.net/
> > - link to v4: https://lore.kernel.org/linux-devicetree/20260310031002.3=
921234-1-dennis@ausil.us/
> >
> > Changes in v4:
> > - rename vcc3v3_pcie20 copied from rk3588s-orangepi-5.dts to vcc3v3_phy=
1 to match the schematic
> > - use vcc_3v3_s3 as the supply not vcc5v0_sys for PCIe
> > - remove the definition for vcc3v3_pcie_m2 as it does not really exist
> >   as a regulator
> > - link to v3: https://lore.kernel.org/linux-devicetree/20260306024634.2=
39614-1-dennis@ausil.us/
> >
> > Changes in v3:
> > - moved leds from gpio-leds to pwm-leds
> > - remove disable-wp from sdio
> > - rename vcc3v3_pcie_eth regulator to vcc3v3_pcie_m2 to reflect the
> >   purpose
> > - actually clean up the delete lines and comments missed in v2
> > - link to v2: https://lore.kernel.org/linux-devicetree/20260304025521.2=
10377-1-dennis@ausil.us/
> >
> > Changes in v2:
> > - moved items not shared by orangepi 5/5b/5 Pro from dtsi to 5 and 5b
> >   dts files
> > - removed all the comments and deleted properties from 5 Pro dts
> > - link to v1: https://lore.kernel.org/linux-devicetree/20260228205418.2=
944620-1-dennis@ausil.us/
> >
> > Dennis Gilmore (4):
> >   dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
> >   arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator label=
s
> >     to match schematic
> >   arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
> >     Pro
> >   arm64: dts: rockchip: Add Orange Pi 5 Pro board support
> >
> >  .../devicetree/bindings/arm/rockchip.yaml     |   1 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 256 +++++++++++++
> >  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 358 ++++++++++++++++++
> >  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
> >  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 263 +------------
> >  .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
> >  7 files changed, 637 insertions(+), 250 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.=
dtsi
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro=
.dts
> >
> > --
> > 2.54.0
> >

