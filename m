Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842B6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAmMtPikedDzzrWNEE4etFqjFIi0lZYc3D9DwNk0y+U=; b=hP/iCyvhF1hCIAuBU4ESHWd0ew
	/cjtvgXOOcgU6kOzSSJZOJlBjmz5Mjg0ZX/mrWjgOFEaDLdRGiLjBfXYxgbbDce6Nov6asioEqJSb
	B1FTb5ogqJmsTjlTdPHywjNPAO7C+vvbF8NdBhKszrvKxtW1HPbvFyc1Jq5ccGarrW2WD1gm00GRM
	uRA5zz7IlbAWZGBbqrHKpPzMq5kckb6QjRhakwI26ttZtH8Dhe1oPS1kL9nO0rHVRknQfJKC/Z5GD
	Rx/YZOjv/ffVTYwJPpWlZaj4XL3xO1o5X7V05Duumsf6UtQM5laZ2pkOz99/PyLdaaBHNlswiqxfg
	jVge889Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEyG-00000001hc3-1lUk;
	Mon, 14 Jul 2025 08:55:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEvQ-00000001hFF-2cl6;
	Mon, 14 Jul 2025 08:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752483145; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cPIvEWqgyPzfPU2Pzl4YkZxowH0/lPVy7yb660klPkA6fT6qLmtzHqPgv570Jz8zrXsozQ44gA1ww2BrymQ2I2bgPDcuKY8Fxu/T96rin4jmK7JKOjQ6WugRP+Iyawq3odYVMAUL7I3FlmvCJVTmB7q97Qx72nmGx6jogycH5mY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752483145; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aAmMtPikedDzzrWNEE4etFqjFIi0lZYc3D9DwNk0y+U=; 
	b=jt9y2WhoNnM4SmJsJv9wT7lX2EZq1F/M7CkIQWYOa5TDg2rv+ZD5wAloQvBHMX7Kot22OV/SDCPLYf7mEocKcdL08rt204KOlu6lkMW7Jaa5l6GtNB+zmHpEgvTYuO4pi4zYKFWqB3bPdxNPx7csXPBwUJB59rb/hDddDDWISgI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752483145;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=aAmMtPikedDzzrWNEE4etFqjFIi0lZYc3D9DwNk0y+U=;
	b=aRlmpvpfXLglPznghkrAXTJQRU1ayaqRIDd2Xtwqn98e3zaPKq+fCS7Ph5Q9/HeG
	oFq+8p97xAcDIN9/jWDB5y6IWwZUpLHXfhJHhd5/m+gJ4/fFFrwZWb47N5emgnCZ0qs
	yt86GP4VB9YIYypqen0iUWqG+EUHrtPDpoKEMxlg=
Received: by mx.zohomail.com with SMTPS id 1752483141694960.830248739222;
	Mon, 14 Jul 2025 01:52:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Alex Bee <knaerzche@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-rockchip@lists.infradead.org, Kever Yang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F,
 Sige1 and NanoPi Zero2
Date: Mon, 14 Jul 2025 10:52:17 +0200
Message-ID: <13801788.uLZWGnKmhe@workhorse>
In-Reply-To: <aHRWmMFTh7leEhrq@pie.lan>
References: <20250712173805.584586-1-jonas@kwiboo.se>
 <88c7b90d-4c29-453b-9a5c-9679b371a3a9@gmail.com> <aHRWmMFTh7leEhrq@pie.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_015240_738032_3BD974A0 
X-CRM114-Status: GOOD (  59.39  )
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

Hello,

+To: kever, as he may have some insight on the differences between
RK3528 and RK3528A.

On Monday, 14 July 2025 03:00:08 Central European Summer Time Yao Zi wrote:
> On Sun, Jul 13, 2025 at 10:56:59PM +0200, Alex Bee wrote:
> > Hi Jonas,
> > 
> > > Hi Alex,
> > > 
> > > On 7/13/2025 9:13 PM, Alex Bee wrote:
> > > > Hi list, Hi Jonas,
> > > > 
> > > > > This series adds dt-bindings and initial device tree for the following
> > > > > Rockchip RK3528A boards:
> > > > > - Radxa ROCK 2A/2F
> > > > > - ArmSoM Sige1
> > > > > - FriendlyElec NanoPi Zero2
> > > > 
> > > > this only sub-related to this series: Is there any particular reason, why
> > > > we call the compatible "rockchip,rk3528" and not "rockchip,rk3528a"? From
> > > > what I can see all boards currently supported (and those in this series)
> > > > are having the RK3528A version of the SoC. I didn't follow the development
> > > > here, but there are differences - I did a quick compare of the datasheets
> > > > of those two SoC versions - it looks like RK3528 version has USB3-DRD
> > > > controller, while RK3528A has USB3 host-only controller. Also it seems to
> > > > have different video codec IPs and the DRAM controller additionally
> > > > supports LPDDR4X.
> > > What datasheet versions did you check? I can only find:
> > > - RK3528 Rev 1.0 (2023-05-22)
> > > - RK3528A Rev 1.2 (2024-04-10)
> > I used
> > 
> > 2023-07-12 Revision V1.0
> > 
> > which didn't include these features - which is interesting: Why would a
> > SoC vendor not try to sell all features in the first place :)
> > 
> > But I now double checked in
> > 
> > 2025-05-12 Revision 1.4
> > 
> > and you are right: It appears there also for RK3528A.
> > 
> > The only difference I could now make out by comparing v1.4 of both versions
> > is the cipher engine: RK3528 additionally supports "SM2/SM3/SM4 cipher" -
> > but still it exists and additionally the different video codec (if mpp
> > userspace library is correct about that).
> > 
> > Anyway: My question was more about: Why didn't we choose the correct
> > compatible from the beginning? And of course the dts files would have to be
> > renamed if the compatible is changed, as they are named according to their
> > SoC-compatible.
> 
> Just like what Jonas said, I was not aware of any technical
> documentation at the time of writing the basic devicetree, and even for
> now the only datasheet I manage to find is the 2023 revision about
> RK3528 without A suffix, so I didn't realize the difference between
> RK3528 and RK3528A, but just followed the vendor code and devicetree[1],
> where only RK3528 is mentioned :-(

I wouldn't be too worried about getting this wrong, the only set-in-
stone part of this is the name of the device tree for devices and the
compatible; we can still rename rk3528.dtsi to rk3528a.dtsi and shuffle
things around internally. Furthermore, if the only difference is
something that can be enumerated at runtime (e.g. if a different set
of supported features in the crypto accel is identifiable with some
config register bits initial value), then I don't think we need to
distinguish them at all.

As another data point, rkbin mentions "Add support for rk3528A" in the
changelog file `doc/release/RK3528_EN.md` for `rk3528_bl31_v1.15.elf`.

Someone could contrast and compare that BL31 binary with the v1.14 one
to see if they have any immediately obvious differences.

My personal guess for what happened here is that they switched
the packaging process after release to optimize supply, like what
happened with RK3568 -> RK3568B2, and the only change is some OTP
values to identify the chip variant. This would also explain why
everything we've seen on the market so far, at least to my knowledge,
has been RK3528A.

Kind regards,
Nicolas Frattaroli

> 
> Regards,
> Yao Zi
> 
> [1]: https://github.com/rockchip-linux/kernel, branch develop-5.10
> 
> > Regards,
> > Alex
> > > 
> > > And both list LPDDR4X support and the A-variant seem to list USB3-DRD
> > > support, did you mix them up above?
> > > 
> > > I think these SoCs are similar to rk3228/rk3229, rk3228h/rk3328 and now
> > > rk3528/rk3528a, in that only the second variant support VP9 decoding.
> > > 
> > > Use of rockchip,rk3528a compatible could be something to change,
> > > could also be something that bootloader set at runtime, similar to
> > > what it does for rk3288w.
> > > 
> > > > I guess it would be good to discuss this before this series is merged,
> > > > because re-naming *.dts files after they have been in a release is somewhat
> > > > impossible.
> > > I think renaming the device tree files is unnecessary, as there seem to
> > > be very little difference. All boards I have come across are currently
> > > RK3528A variants. How would we treat the Radxa E20C?, it is not named
> > > rk3528-radxa-e20c.dtb, yet uses the A-variant.
> > > 
> > > For mainline U-Boot I have included printing out the SoC-variant,
> > > however the compatible is not adjusted:
> > > 
> > >    Model: Radxa E20C
> > >    SoC:   RK3528A
> > >    DRAM:  2 GiB
> > > 
> > > Regards,
> > > Jonas
> > > 
> > > > Regards,
> > > > Alex
> > > > > The bt/wifi_reg_on pins are described in the device tree using
> > > > > rfkill-gpio nodes.
> > > > > 
> > > > > Changes in v3:
> > > > > - Rename led nodes to led-0/led-1
> > > > > - Remove pinctrl* props from sdio0
> > > > > - Collect a-b tags
> > > > > 
> > > > > Changes in v2:
> > > > > - Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
> > > > > - Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
> > > > > - Drop regulator-boot-on from usb 2.0 host regulators on Sige1
> > > > > - Add bluetooth and wifi nodes on Sige1
> > > > > - Collect t-b tag for NanoPi Zero2
> > > > > 
> > > > > These boards can be booted from emmc or sd-card using the U-Boot 2025.07
> > > > > generic-rk3528 target or work-in-progress patches for these boards [1].
> > > > > 
> > > > > For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
> > > > > Fix UART DMA support for RK3528" [2] is required.
> > > > > 
> > > > > [1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
> > > > > [2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se
> > > > > 
> > > > > Jonas Karlman (6):
> > > > >     dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
> > > > >     arm64: dts: rockchip: Add Radxa ROCK 2A/2F
> > > > >     dt-bindings: arm: rockchip: Add ArmSoM Sige1
> > > > >     arm64: dts: rockchip: Add ArmSoM Sige1
> > > > >     dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
> > > > >     arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2
> > > > > 
> > > > >    .../devicetree/bindings/arm/rockchip.yaml     |  17 +
> > > > >    arch/arm64/boot/dts/rockchip/Makefile         |   4 +
> > > > >    .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 465 ++++++++++++++++++
> > > > >    .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
> > > > >    .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
> > > > >    .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++
> > > > >    .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
> > > > >    7 files changed, 1211 insertions(+)
> > > > >    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
> > > > >    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> > > > >    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
> > > > >    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
> > > > >    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
> > > > > 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 





