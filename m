Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7DBCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 08:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6P0y/Q79WY1s2WSJKAVn4OYeud7z6vgKLms8t7x+yjg=; b=XPhYZwNBQMJ/O2vkrGE2NUoiUJ
	hNlLo6vlOKKOIZodVQLdhfB2YQQwwCN6veVSKrumVJTyKsxuoRQBTy6PpAR0pWHKmn2WD/yzhKUGR
	aUgUybuQsK3uhxiSqAwHPYctaj8BKP54j3msz98rAF6z946geka3Pc2Bt9Zx5aIbyT1FwA1pdXWlx
	JE11iX2N1QAQ9wD3ZWnqVjCtwrxJNrv6iy+EJTeY1OWR8YpV00+TUHZsLn/xwB0zYLRTZBwEoefYC
	ZV+dRXzFu8wxRADLXU4h+ZcuZ8en0852yfyg6rGqR505hGwoxfzFcE/MA3fu/ZA0IKcueg9nLwc13
	onQexycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINSh-000000050W1-25Yy;
	Mon, 10 Nov 2025 08:41:19 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINSe-000000050Uo-1MJA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 08:41:18 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so4860531a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 00:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762764074; x=1763368874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P0y/Q79WY1s2WSJKAVn4OYeud7z6vgKLms8t7x+yjg=;
        b=gAdLBQsJ1VCDhoOv+vE4gSyHE6KDlwGsrlm/axqDhHMhre8+WlUs7veMCULpKbprWD
         UKMrbRdh9s4s9zcQogPodmNfbLHEZCcNEqjARpYcHOuvK0FB/s31L4E8iEGu18InnK7b
         ZP4/otwtjr+GQngChdWcfs7hmZ5L0PPhpxSe7L73kp9XirBrme3K/ACTDpZsfhGY/iTL
         a51kHABTu1HB0KYcG3kwsyQVTk/LJDVjEQn71EQTpLAx6Jj7Q4k9CoUt9QMrtpw8pD9F
         GqwUC0R21XSXamDrv+imNEyb1rNkG7lo59glJA/KiqfZ/2H4x91bj/0b9d3S1CkZqgTx
         G82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762764074; x=1763368874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6P0y/Q79WY1s2WSJKAVn4OYeud7z6vgKLms8t7x+yjg=;
        b=StO+d0A3Z8Cm83TQUmZluI+oKo8XaWHL4UOVPWrqQgjwgB61uvRnWudQbXzASC38GB
         4hRFx6pxAtbqOV3lcsWUghrlKgQp16PVKrGQdoKnB3PWJefLhIkOvKLmJSXHL2/NpasP
         5C71VwXAqLvuUHQU3sFHn3HFcBNr/a59ta01YDDjU85G7LpXTq+ysh8FhTPzCxwZIYn/
         RHGzuHWLCOeS3WT/3ASw1EtuBzSVc6nZE3VgAWo5AGNKA8g140cCkBI/KnzFuiHB2PIa
         P8U+UMGhJ3530uVMhrmqGWW4dVpiL8plVLaG1yt6KNV3tM01rmYHw2bW66s2Q0DZv50U
         ZU/g==
X-Forwarded-Encrypted: i=1; AJvYcCUWtYz6fbKNdhuf/0RN4Qf7Djv8TSSM7iZNmjXZCyBvZrt/Pd+mg88fkE0wH9a6Iu+JK+8Zm+sJ/6icW+GaRoFi@lists.infradead.org
X-Gm-Message-State: AOJu0YxXTcOLeY+01v3murEZVDZaQtsbG7N9N6oXGeR5uVSidGF3wgDs
	mI0Fz3QzloE2FcoM0yZxEu/mp6CUZZnWCnGzDBZ0iPKiL4p6J44az64J94js+V6TZAD9rFOlTR5
	WMBz01aRc2/YxxdiP567JdoxZPfYjPLE=
X-Gm-Gg: ASbGncvh+M/lllctnC+EhgN1Ncyy07cSWl1en9/2lV6+5NQcvZDR3tHjHWH56wZ4ZUQ
	C9ewxxLi1zoIdQD7haGOrJ977tyE5l1mnQcJ+OXE2UoF6cM78MDeF2aDl/WHVQCaLX7Qjgzoeea
	gNf5nyyUCghw2/y4379VQI7lwUBkd5craL0Am8+2ErmiYTFs5EpzE2BZuNw0jHuQbBj0o2eS7hH
	pouGM8J4XSMizexsBJeKCBGZBQ0jzPKZre07lRWYAPRqci4u7hXHXcqpujypkcS24miA99is6cI
	7JVT
X-Google-Smtp-Source: AGHT+IESNTw6qjYvvZVQIviNrko/W/ThLKfPP6Zlh7jZBNCmaaRmiw1Z2ff+JZpJCCEs3KNCeqlEMNKff6nGkITYWsM=
X-Received: by 2002:a05:6402:51ce:b0:641:72a8:c921 with SMTP id
 4fb4d7f45d1cf-64172a8d10emr3999634a12.23.1762764073934; Mon, 10 Nov 2025
 00:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
 <cf6zumlp4iiltglu7bbrpdeysaznrkyvlemwl4lxwkfjkgux7a@wl37bxilsprx>
 <cbvcjgcd7saxj42ifgqn3l6mwpgenlhbr4zuf5ibqbtj6rmzqh@yuc7flbwyi2y> <CANAwSgSvtc57kh-VJewk5=_MvfL3KVxNFU8C+tGh4iqJhnEVtw@mail.gmail.com>
In-Reply-To: <CANAwSgSvtc57kh-VJewk5=_MvfL3KVxNFU8C+tGh4iqJhnEVtw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 10 Nov 2025 14:10:56 +0530
X-Gm-Features: AWmQ_bmU-RlL1-d4qH4b9tmN5UWK_GZG4fHWCZvQROFJ3et4gEEIr6Y6zbTvTnI
Message-ID: <CANAwSgTj0JzFN2CHOSG=X_gx5KttP-tZeLaC5uYZYhcPheP_Vg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] PCI: dw-rockchip: add system suspend support
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_004116_399295_4F32B2D4 
X-CRM114-Status: GOOD (  46.12  )
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

Hi All,

On Fri, 7 Nov 2025 at 00:31, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Sebastian,
>
> On Tue, 4 Nov 2025 at 00:29, Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> >
> > Hi,
> >
> > On Sat, Nov 01, 2025 at 07:29:41PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Oct 29, 2025 at 06:56:39PM +0100, Sebastian Reichel wrote:
> > > > I've recently been working on fixing up at least basic system suspe=
nd
> > > > support on the Rockchip RK3576 platform. Currently the biggest open
> > > > issue is missing support in the PCIe driver. This series is a follo=
w-up
> > > > for Shawn Lin's series with feedback from Niklas Cassel and Manivan=
nan
> > > > Sadhasivam being handled as well as some of my own changes fixing u=
p
> > > > things I noticed.
> > > >
> > > > In opposite to Shawn Lin I did not test with different peripherals =
as my
> > > > main goal is getting basic suspend to ram working in the first plac=
e.
> > >
> > > Wouldn't it break users who have connected endpoint devices and suspe=
nd their
> > > platform? I don't want to have an untested feature that could potenti=
ally cause
> > > regressions, just for the sake of getting basic system PM.
> > >
> > > But if your goal is to just add basic system PM operations for CI
> > > testing, then I would suggest you to do something minimal in the
> > > suspend/resume path that don't disrupt the operation of a device.
> > >
> > > But this also should be tested with some devices for sanity.
> >
> > My goal is proper system PM support, but I would like to go step by
> > step. Right now system suspend on the Rockchip RK3576 EVB just hangs
> > the board and it has to be power cycled afterwards. In parallel to
> > this series I've send a bunch of fixes to get it working. It surely
> > isn't perfect, but I fear things regressing again in other areas while
> > the complex PCIe system sleep is being worked on - simply blocking syst=
em
> > suspend is not very helpful, since it effectively hides suspend problem=
s.
> >
> As per my understanding, the current DTS configuration is missing definit=
ions
> for critical PCIe power management GPIOs (clkreq-gpios, perst-gpios, wake=
-gpios)
>
> clkreq-gpios, such as PCIE30x1_0_CLKREQn_M1_L (not sure if it is used ?)
> perst-gpios such as PCIE30x1_0_PERSTn_M1_L
> wake-gpios, such as PCIE30x1_0_WAKEn_M1_L.
>
As per the TRM 11.5 Interface Description
Signal Name     Direction   IO Attribute             Description
------------    ---------   -----------------------
------------------------------------------------------------
BUTTON_RSTN     I             Pull-down                    External
reset button input; pulled low to initiate reset
WAKEN                   I/O        Open-drain, pull-up      Wake
signal; enables device or host to signal wake events
PERSTN                 I/O         Pull-down                     PCIe
reset signal; asserted low to reset endpoint or root complex
CLKREQN              I/O         Open-drain, pull-up      Clock
request signal; used for dynamic clock management

See the following commit 4294e3211178 ("arm64: dts: rockchip: Split up
RK3588's PCIe pinctrls")

    These pinctrls manage the low-speed PCIe signals:
    - CLKREQ#: An output on the RK3588 (both RC or EP modes), used to
      request that external clock-generation circuitry provide a clock.
    - PERST#: An input on the RK3588 in EP mode, used to detect a reset
      signal from the RC. In RC mode, the hardware does not use this signal=
:
      Linux itself generates it by putting the pin in GPIO mode.
    - WAKE#: In EP mode, this is an output; in RC mode, this is an input.

    Each of these signals serves a distinct purpose, and more importantly,
    PERST# should not be muxed when the RK3588 is in the RC role. Bundling
    them together in pinctrl groups prevents proper use: indeed, almost non=
e
    of the current board-specific .dts files make any use of them.
    (Exception: Rock 5A recently had a patch land that misuses _pins; this
     patch corrects that.)

    However, on some RK3588 boards, the PCIe 3 controller will indefinitely
    stall the boot if CLKREQ# is not muxed (details in the next patch).
    This patch unbundles the signals to allow them to be used.

So we can use these pinctrl to perform different tasks
like PERST# to reset and WAKE# to wake the PCIE in suspend / resume state.

Is this a good way to split the rk368 PCIe pinctrl into separate components=
?

Here is the example user wake gpio.

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
index 19a08f7794e6..13a7aa3ec1fc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
@@ -359,9 +359,10 @@ rgmii_phy1: ethernet-phy@1 {
 };

 &pcie2x1l2 {
-       pinctrl-0 =3D <&pcie2_reset>, <&pcie20x1m0_clkreqn>, <&pcie20x1m0_w=
aken>;
+       pinctrl-0 =3D <&pcie2_reset>, <&pcie20x1m0_clkreqn>, <&pcie2wakeup>=
;
        pinctrl-names =3D "default";
        reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
+       wakeup-gpio =3D <&gpio3 RK_PD0 GPIO_ACTIVE_HIGH>;
        vpcie3v3-supply =3D <&vcc3v3_wf>;
        status =3D "okay";
 };

I haven=E2=80=99t come across a working example for this in RC mode.
Is there any confirmation that this approach functions as expected?


> However, the RK3588 TRM indicates that these power management functions
> can be controlled programmatically using specific memory-mapped registers=
:
>
> The PCIE_CLIENT_POWER_CON register at 0x002C provides comprehensive
> power management controls, including link-state management, wake-up
> event handling,
> and clock management.
>
> In PHY GRF, we have the PCIe3PHY_GRF_PHY0_LN0_CON0 register at 0x1000 all=
ows
> direct control over the PHY's power state (P-states like P1, P2),
> enabling transitions into
> deep suspend (L2/L3) via register writes
> clkreq_n Clock request for lane X. This is a side-band signal that a
> PIPE 4.2 controller needs
> to enter and exit P1.CPM, P1.1, and P1.2 power states.
>
> My thought is that using rockchip_pcie_phy_deinit() in the suspend
> routine and rockchip_pcie_phy_init() in the resume routine are
> incorrect; these functions
> likely perform full resets or power cuts rather than managed power
> state transitions,
> thus disrupting the desired suspended state of the PCIe link
>
> I tried a few things on my own, but I am not moving forward.
>
Thanks
-Anand

