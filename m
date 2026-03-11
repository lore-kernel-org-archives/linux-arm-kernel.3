Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF73B1125839
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyrNJzzZ4i3GQObx0AKoUUTqmBLE+hXm5yoT7lUZJk8=; b=ZlteXXWtk5iUf2vGsucso/Mopp
	A27T4LVzFOQuTIpZanPT9CgZNSPLFNkHuV+FSRuWJiO6GSSNNrm+NFQmaNkFgnQsRyONtJbWX/4tX
	R5zJSxEkhbiFbNZbJtww7JXiRcgWmvBMYMx1pJ3skH/5TgTjeJA8MFPm2xY3axlLxU4x/bOEdwE3v
	vH4b/FJId1xQUi7gTkdVdROB5DA+NjFoz95b2DRXxoz6uFgOU4NYNw1VWU6t2wG1TU/huGFHw/d07
	W6E5QvudEp8jL7lD0fb00IoUQFVzYcRc+wqO0SzUrUWEmT86ItR+eYTlUhx3e0JFNWDNFb/sB0rnu
	1YsqvCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ks8-0000000Bjtq-0f5o;
	Wed, 11 Mar 2026 14:49:16 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ks3-0000000Bjsz-0fUt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 14:49:14 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b943a880577so632560466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 07:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773240549; cv=none;
        d=google.com; s=arc-20240605;
        b=Nc1nrl1gXB+Uq1zgBgHYYSaygHGcrq3JxOIAmoHKU4lg131jAKHtu+LAF4CsYOM89p
         kcPrsvw6wf0lLHtXzEqx4ZPDMdAdJyFHOS2hmuAPqBnWVx502ATImT/JmmNWohs78DZo
         QvdZnpiwdSXTKIwh1u+5CuV/kd46HdVOqtV601qzYWiJH/YJ0Ok4rsG6RJ77OR3EgSLd
         ErW3eKMSZRwDuRsLw5f8r6MXM5t341xqt9VUeX1Yey4baXgXy+ZhZRKGmFeLlk4DW+6U
         Co9gIZ8KK72Kd3o6jLNEWntuAyv/774wgdJ4w7JZz7JadZ+US3x3S0aNpyoPZ8JySRth
         NcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HyrNJzzZ4i3GQObx0AKoUUTqmBLE+hXm5yoT7lUZJk8=;
        fh=jFMmlnlpidX2u+hd+S8YzvEupw63RclpeLC0fVAyEyY=;
        b=MPKw8a3tyclljtk7EWBdADNN7IgufUnh2/+ifA5Vlata8jce1+IiTlQGTqK1xegwer
         aGgkMt5qbko80OH9GHNzz0XWKQxgP9FPbQfViMYTA0GvBfpaOrvYqTCX0PG3GABUxhND
         wiXwlsG+2DIfMuQbW2mbMdWyKnWbJ37z0gZx3xejBoL4TDohaZ0QZHqrkbMJzVm0OMw0
         foV5QDChJ1OBarqQ8MkUNIea1Qhrhdyq9wBIr5Dj4xCSWI/kLYgQbNbd/rOjQN1Lfp+E
         9NvcYkPao0tnl6LkDiwtOxtxPa40vFBv/o9fu60HRBbTgReiBGaPNKWzBNXxpFvLobDC
         iL5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773240549; x=1773845349; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyrNJzzZ4i3GQObx0AKoUUTqmBLE+hXm5yoT7lUZJk8=;
        b=UH81IH94fq92+7tkJqH5ckWX+hjbo9xeJpdMD3N1TS6vFTcAyTFCQbizhh6x/f7jwM
         Ucm5kS8X4UrSX7xzHQdXxcE5Vl4Yec0oJd/fNAIIWhPBXH+GYRq27ZdBC1bBCXnUb9Uz
         uvPzMgWRXHkYZKw2JLOL1Wlr+DB8rfhBORhzmoVFIfyypdh/+Pi3wbcSqJGRz2i/hrZs
         2azIo8KqtC62XFVPT0PzmVXYJA78HoVYc/CCa2zLAor+EH26UfmJMCw05kglGEWh5TMh
         zrNhK3eqMVsnC8wLLlR0Be2n/rIJrwaMpnAsg9yu+zPyjz7/b9JUFB3GUS/RFJOOhn0y
         BVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240549; x=1773845349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HyrNJzzZ4i3GQObx0AKoUUTqmBLE+hXm5yoT7lUZJk8=;
        b=vG5tT3pbDW5guoX9p8O6JeTzYjmV0ZqXiiID373bxPnumzpm0AF0YizxrweYa5M5VT
         HZWvQ7ZWLYaEeFz1U2t2xJP5gSAiROaTXmqOift70mBOCCtzS/O00U4Ghs6q02NwHIlq
         GQe+4/UQn+YxHwgf/Qtm2FhWQ5Nii8sSVzbkI0NQ6wMAGpclhiI0DGvXaClkOaW/7iqi
         HdZKkn/OIBFjIhk/UgcktFEuRkALyGqdHYx9SJFQwRxf+8Fnhqg2EUwcPb9AUIggBDjX
         JBqEwTnIR5TTD7RslOm6iVQWkyqWVW86rKf60OcwRYUPR+7rXUremHNB9+sXCaBEqO9m
         zndg==
X-Forwarded-Encrypted: i=1; AJvYcCWUpeBJY1vmi5Zgzn1t/7uAr62KagMFF34YKhRBHDc+fBk4gplZ7eREc7TMQy4ecA/hT39E18X5iIXo/LFCHBik@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1peUmdsxSurP0MKv4FLSBWgqUDyM6cIP10qfArfeDeUem+ra7
	oZbOVzPdfHNSglX0qDTXTH4gcj8mep/ClRRMyUV/YRCPvHGpV1Bz4qUCPAO7LL7feH+VACJOyjZ
	52rv0g7qzc+xLv3Ve9jVzr4Meb71hgGg=
X-Gm-Gg: ATEYQzxirlR4ioqy8C8i31YbXDUxEAwdOcDBfICsvQlROF/iOqohQ3Bd37/7SRMjM8X
	D4cZgTp1oEoZCTtaov2yvssMnCgjQtSA8XeQoOWXkuY36ust1kGQCrgDC0yazi9L8xPFgpmujcN
	S4uOtTYJR9EUF7NwI9jqtQT23r4GPlzm6ruh55CYI6lutT2Ht7dVqEx5CETTHur+qzxItq0lnZo
	ebr3dGQMjyK+BiVMNyela7t/6ihYZ1E15j8iXKmZaZ2SbUnCZe4pPdFfK0chMkc9J0Mwic8LFiv
	hAF6hQ==
X-Received: by 2002:a17:907:1c9e:b0:b97:2a5:8a82 with SMTP id
 a640c23a62f3a-b972e513dbamr157754366b.46.1773240548757; Wed, 11 Mar 2026
 07:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260311115502.7353-1-linux.amoon@gmail.com> <cc922ebf-9221-00f8-e951-903c97d24f20@rock-chips.com>
 <CANAwSgT_Qb+Xoqg4ezZaYDBu81--=yhdvQ+cskumoMMh=J2ing@mail.gmail.com> <77f0d3c2-649f-770d-1636-6fd52f3b5f5e@rock-chips.com>
In-Reply-To: <77f0d3c2-649f-770d-1636-6fd52f3b5f5e@rock-chips.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 11 Mar 2026 20:18:49 +0530
X-Gm-Features: AaiRm504WsyzcNjgdhaQXABVzgkA6xn4l4u9wkE3KoD7fHFPzIVd_Tqjf9SABH4
Message-ID: <CANAwSgTqycrsc+7+RO=nfeudy78qPK2jEJ0b49gsiCQ3ywEpwA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588
 on Rock 5b-5bp-5t series
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Diederik de Haas <didi.debian@cknow.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_074912_777928_27DBA3D9 
X-CRM114-Status: GOOD (  43.41  )
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

Hi Shawn,

On Wed, 11 Mar 2026 at 19:35, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> =E5=9C=A8 2026/03/11 =E6=98=9F=E6=9C=9F=E4=B8=89 21:43, Anand Moon =E5=86=
=99=E9=81=93:
> > Hi Shawn,
> >
> > Thanks for your review comments.
> >
> > On Wed, 11 Mar 2026 at 17:57, Shawn Lin <shawn.lin@rock-chips.com> wrot=
e:
> >>
> >> =E5=9C=A8 2026/03/11 =E6=98=9F=E6=9C=9F=E4=B8=89 19:54, Anand Moon =E5=
=86=99=E9=81=93:
> >>> Add supports-clkreq and the corresponding pinmux configurations for P=
CIe
> >>> ASPM L1 substates on the Rock 5B, 5B+, and 5T.
> >>> The supports-clkreq flag informs the PCIe controller that the hardwar=
e
> >>> routing for the CLKREQ# sideband signal is present. This enables supp=
ort
> >>> for PCIe ASPM (Active State Power Management) L1 substates, allowing =
for
> >>> better power efficiency.
> >>>
> >>> Cc: Shawn Lin <shawn.lin@rock-chips.com>
> >>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>> ---
> > I verified the change by comparing the lspci -vvv output from before
> > and after the modification.
> >>
> >> It would be better if you could put the link to the schematic here(und=
er
> >> "---") for folks easy to review. I paste it here for reference=EF=BC=
=9A
> >>
> >> https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pd=
f
> > Ok, I will follow this advice next time,
> >>
> >>>    arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 9 ++++++=
---
> >>>    1 file changed, 6 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi =
b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> >>> index b3e76ad2d869..668b19c05f7e 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> >>> @@ -468,7 +468,8 @@ map1 {
> >>>
> >>>    &pcie2x1l0 {
> >>>        pinctrl-names =3D "default";
> >>> -     pinctrl-0 =3D <&pcie2_0_rst>;
> >>> +     pinctrl-0 =3D <&pcie2_0_rst>, <&pcie30x1m1_0_clkreqn>;
> >>> +     supports-clkreq;
> >>>        reset-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> >>>        vpcie3v3-supply =3D <&vcc3v3_pcie2x1l0>;
> >>>        status =3D "okay";
> >>> @@ -476,7 +477,8 @@ &pcie2x1l0 {
> >>>
> >>>    &pcie2x1l2 {
> >>>        pinctrl-names =3D "default";
> >>> -     pinctrl-0 =3D <&pcie2_2_rst>;
> >>> +     pinctrl-0 =3D <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;
> >>
> >> Isn't it m1(PCIE20_1_2_CLKREQn_M1_L in the schematic)?
> >
> > I just used the pinctrl label GPIO3_C7_u as a reference to select this
> > one. see below.
> >
> > [1] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/r=
ockchip/rk3588-base-pinctrl.dtsi#L1613-L1662
> >
> > The RK3588 Technical Reference Manual (TRM) Part 2 provides the
> > following details regarding the clkreq# signal
> > pcie_clkreq_in/out_n    M0 PCIE20X1_2_CLKREQN_M0 GPIO3_C7_u
> > pcie_clkreq_in/out_n    M1 PCIE20X1_2_CLKREQN_M1 GPIO4_B7_u
>
> Okay, I checked it again, you are right. Apprently the schematic label
> is insane which marks it as PCIE20_1_2_CLKREQn_M1_L....
>
> >
> >>
> >>> +     supports-clkreq;
> >>>        reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
> >>>        vpcie3v3-supply =3D <&vcc3v3_pcie2x1l2>;
> >>>        status =3D "okay";
> >>> @@ -488,7 +490,8 @@ &pcie30phy {
> >>>
> >>>    &pcie3x4 {
> >>>        pinctrl-names =3D "default";
> >>> -     pinctrl-0 =3D <&pcie3_rst>;
> >>> +     pinctrl-0 =3D <&pcie3_rst>, <&pcie30x4m1_clkreqn>;
> >>
> >> The pin is correct but I don't think it would support
> >> L1 substates because the refclk is out of control. For
> >> any refclk coming from external clock generator, clkreq#
> >> should connect to the enable pin of the clock generator.
> >>
> > I did not find the external clkreq# signal for this #clkreq signal in
> > the schematics.
> >
> > PCIE30X4_CLKREQn_M1_L  (GPIO4_B4_u) .
>
> What I meant is PCIE30X4_CLKREQn_M1_L is connected between root port
> and M.2 slot which is not the right hardware design to support L1
> substates with PCIe3.0 PHY. We could do that for combophy as the refclk
> is auto controlled by controller when entering and exiting L1 substates.
> But for PCIe3.0 PHY the refclk is always there coming from
> Au5426_device, so the this port tries to enter L1 substates, no
> component could turn off the refclk to meet the timing of entering L1
> substate, except you connect clkreq# to the Au5426, because in that case
> PHY could gate the incoming refclk via clkreq#, thanks to the natural
> behaviour of how clkreq# is controlled.
>
> To clarify, PCIE30X4_CLKREQn_M1_L is connected between the Root Port and
> the M.2 slot. This hardware configuration is not suitable for supporting
> L1 Substates with the PCIe 3.0 PHY. While this setup works for the Combo
> PHY=E2=80=94where the controller automatically manages the reference cloc=
k
> during L1 Substate entry and exit=E2=80=94it fails with the dedicated PCI=
e 3.0
> PHY. In the latter case, the reference clock from the Au5426_device is
> always active. Consequently, when this port attempts to enter L1
> Substates, no component can gate the reference clock to meet the
> required timing specifications.
>
> The only way to satisfy the timing requirements is to connect CLKREQ#
> directly to the Au5426. This allows the PHY to gate the incoming
> reference clock via the CLKREQ# signal, leveraging its standard control
> behavior.
>
Thanks for the info. I've decided to omit this setting.

> Otherwise you could only see it in L1 instead of L1 substates. By the
> way, how do you verfy it could enter L1 substate? Do you use debugfs
> like below ?
>    cat /sys/kernel/debug/dwc_pcie_a40000000.pcie/ltssm_status
>
[root@rockpi-5b alarm]# cat
/sys/kernel/debug/dwc_pcie_a40000000.pcie/ltssm_status
L123_SEND_EIDLE (0x13)
[root@rockpi-5b alarm]# cat
/sys/kernel/debug/dwc_pcie_a41000000.pcie/ltssm_status
L0 (0x11)
[root@rockpi-5b alarm]# cat
/sys/kernel/debug/dwc_pcie_a40800000.pcie/ltssm_status
L1_IDLE (0x14)

I had just verified with lspci --vvv diff.

$ diff -Nru lspci.before lspci.after
--- lspci.before        2026-03-11 15:47:28.391050648 +0530
+++ lspci.after 2026-03-11 16:30:33.337808724 +0530
@@ -2,8 +2,8 @@
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
-       Interrupt: pin A routed to IRQ 119
-       IOMMU group: 10
+       Interrupt: pin A routed to IRQ 117
+       IOMMU group: 11
        Bus: primary=3D00, secondary=3D01, subordinate=3Dff, sec-latency=3D=
0
        I/O behind bridge: f000-0fff [disabled] [16-bit]
        Memory behind bridge: f0200000-f02fffff [size=3D1M] [32-bit]
@@ -76,9 +76,11 @@
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [190 v1] L1 PM Substates
-               L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2-
ASPM_L1.1- L1_PM_Substates-
+               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+ L1_PM_Substates+
+                         PortCommonModeRestoreTime=3D10us PortTPowerOnTime=
=3D10us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
-               L1SubCtl2:
+                          T_CommonMode=3D10us LTR1.2_Threshold=3D26016ns
+               L1SubCtl2: T_PwrOn=3D10us
        Capabilities: [1d0 v1] Vendor Specific Information: ID=3D0002
Rev=3D4 Len=3D100 <?>
        Capabilities: [2d0 v1] Vendor Specific Information: ID=3D0006
Rev=3D0 Len=3D018 <?>
        Kernel driver in use: pcieport
@@ -89,8 +91,8 @@
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
-       Interrupt: pin A routed to IRQ 118
-       IOMMU group: 10
+       Interrupt: pin A routed to IRQ 116
+       IOMMU group: 11
        Region 0: Memory at f0200000 (64-bit, non-prefetchable) [size=3D16K=
]
        Capabilities: [40] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
@@ -156,7 +158,7 @@
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+ L1_PM_Substates+
                          PortCommonModeRestoreTime=3D10us PortTPowerOnTime=
=3D10us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
-                          T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
+                          T_CommonMode=3D0us LTR1.2_Threshold=3D26016ns
                L1SubCtl2: T_PwrOn=3D10us
        Kernel driver in use: nvme
        Kernel modules: nvme
@@ -238,9 +240,11 @@
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [180 v1] L1 PM Substates
-               L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2-
ASPM_L1.1- L1_PM_Substates-
+               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+ L1_PM_Substates+
+                         PortCommonModeRestoreTime=3D10us PortTPowerOnTime=
=3D10us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
-               L1SubCtl2:
+                          T_CommonMode=3D30us LTR1.2_Threshold=3D54272ns
+               L1SubCtl2: T_PwrOn=3D18us
        Capabilities: [190 v1] Vendor Specific Information: ID=3D0002
Rev=3D4 Len=3D100 <?>
        Kernel driver in use: pcieport
        Kernel modules: pci_endpoint_test
@@ -250,7 +254,7 @@
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
-       Interrupt: pin A routed to IRQ 147
+       Interrupt: pin A routed to IRQ 150
        IOMMU group: 9
        Region 0: Memory at f2200000 (64-bit, non-prefetchable) [size=3D8K]
        Capabilities: [c8] Power Management version 3
@@ -309,8 +313,8 @@
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+ L1_PM_Substates+
                          PortCommonModeRestoreTime=3D30us PortTPowerOnTime=
=3D18us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
-                          T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
-               L1SubCtl2: T_PwrOn=3D10us
+                          T_CommonMode=3D0us LTR1.2_Threshold=3D54272ns
+               L1SubCtl2: T_PwrOn=3D18us
        Kernel driver in use: iwlwifi
        Kernel modules: iwlwifi

@@ -318,10 +322,10 @@
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
-       Interrupt: pin A routed to IRQ 132
-       IOMMU group: 11
+       Interrupt: pin A routed to IRQ 106
+       IOMMU group: 10
        Bus: primary=3D40, secondary=3D41, subordinate=3D41, sec-latency=3D=
0
-       I/O behind bridge: 200000-200fff [size=3D4K] [16-bit]
+       I/O behind bridge: 100000-100fff [size=3D4K] [16-bit]
        Memory behind bridge: f4200000-f42fffff [size=3D1M] [32-bit]
        Prefetchable memory behind bridge:
00000000fff00000-00000000000fffff [disabled] [64-bit]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
@@ -391,9 +395,11 @@
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [180 v1] L1 PM Substates
-               L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2-
ASPM_L1.1- L1_PM_Substates-
+               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+ L1_PM_Substates+
+                         PortCommonModeRestoreTime=3D10us PortTPowerOnTime=
=3D10us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
-               L1SubCtl2:
+                          T_CommonMode=3D150us LTR1.2_Threshold=3D306176ns
+               L1SubCtl2: T_PwrOn=3D150us
        Capabilities: [190 v1] Vendor Specific Information: ID=3D0002
Rev=3D4 Len=3D100 <?>
        Kernel driver in use: pcieport
        Kernel modules: pci_endpoint_test
@@ -403,9 +409,9 @@
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
-       Interrupt: pin A routed to IRQ 129
-       IOMMU group: 11
-       Region 0: I/O ports at 200000 [size=3D256]
+       Interrupt: pin A routed to IRQ 105
+       IOMMU group: 10
+       Region 0: I/O ports at 100000 [size=3D256]
        Region 2: Memory at f4200000 (64-bit, non-prefetchable) [size=3D64K=
]
        Region 4: Memory at f4210000 (64-bit, non-prefetchable) [size=3D16K=
]
        Capabilities: [40] Power Management version 3
@@ -482,8 +488,8 @@
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+ L1_PM_Substates+
                          PortCommonModeRestoreTime=3D150us PortTPowerOnTim=
e=3D150us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
-                          T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
-               L1SubCtl2: T_PwrOn=3D10us
+                          T_CommonMode=3D0us LTR1.2_Threshold=3D306176ns
+               L1SubCtl2: T_PwrOn=3D150us
        Capabilities: [21c v1] Vendor Specific Information: ID=3D0002
Rev=3D4 Len=3D100 <?>
        Kernel driver in use: r8169
        Kernel modules: r8169

Thanks
-Anand

