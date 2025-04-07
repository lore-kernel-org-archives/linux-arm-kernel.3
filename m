Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034B9C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i7yUmtcPXYs5jDz4UO9uvLqV1/UD2ocMo6ScIwBAIPA=; b=MsnzW10qUsbW8h
	bbbnkQpRgotv+bEn85877nyiniYVtXDwcPsrb/4I29PtNAVxCLJIhJe+OMzJVykXA7S0dFsgmH3oh
	OqpyKpBMlDsT/mfoI2TWkmdQVPSOFWX5JXYY3BlRGnhL0CrlEE8mXL0ZNUvoVqgFOiZ/H/Njn/l33
	26IgBmULTMQy0S6HsgI3ReHO9RzKqhxgaiu5d6ruUEBGoC5t7Src5pN7QFo3hWpIaO3FiWjrBsEw9
	e81IBJjz1JheagtXVKbJp6pqmV3h0HrGagAWKakQPWeiFuQZLPf0tVdj4SDV4RMqghdVREWoiZ4Hc
	LeNxQlCLr2CSvn+zOTOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1s0Z-00000001n50-1pbe;
	Mon, 07 Apr 2025 19:19:47 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1quz-00000001TfX-2LFg;
	Mon, 07 Apr 2025 18:09:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744049382; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MA29WiSaM/qGw8Ez5IWEq+k0N2YAnfiNfAhPgQHriNRPs3EL3yjtKFFtGwEbVGsyo3QmNx0TTr8siu2V121Ox4gfxO8Lnz60I6ZI+pK7jPSNwtlEgfVtFnXaWFk+dJilbETEQ2Ob1jpwG7IHHKL2QDQlRQoXjvn6yDoyRnv6ZJg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744049382; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i7yUmtcPXYs5jDz4UO9uvLqV1/UD2ocMo6ScIwBAIPA=; 
	b=MzysafK93/6rHCj0cYFISDahwz2lsGydQU5sYBwQBuLQo1Vo5UbN0PHoTIAojVuGMDnLH4JwQGsJTHWxImSERg5GqWGlb92nJBrpiq2dBZAgGYrsnzbx4O9KySgYEqT2zhzGULJUEEnDicmtAfNE0Bz/atsW4cR9xR91i+0DD1o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744049382;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=i7yUmtcPXYs5jDz4UO9uvLqV1/UD2ocMo6ScIwBAIPA=;
	b=aMYIGLxLmuS8LHedJmkzvIWJCZ21bwD1Ms9cqEuChNGK7MNfmvOdJdPQv40ImOev
	8fmXjtvGPgf649q2yQnwB1xLrMnC7pBaYu2E1ujWsCSSP/jWjJvjs2LJQihe4UEsQy5
	FJ0aXsuuj/ukpo4MjOIU6/YUezwv01Ach2y1GsSo=
Received: by mx.zohomail.com with SMTPS id 1744049380397611.0260384445199;
	Mon, 7 Apr 2025 11:09:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/4] RK3576 USB Enablement
Date: Mon, 07 Apr 2025 20:09:13 +0200
Message-Id: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkU9GcC/yXMywqDQAyF4VcZsm7KXBhbfJXiYpxGG4raJioF8
 d076PI7cP4NlIRJoTYbCK2sPI0F7mIgv9LYE/KzGLz10QZ/R3mHeKtQuaeIi7bog3XWJ6KUE5T
 bR6jj35F8NKeFvkspz+cIbVLCPA0Dz7VZq6uLKNlBs+9/rj/QuI8AAAA=
X-Change-ID: 20250328-rk3576-sige5-usb-230102aeeaca
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110957_643582_36D55DDD 
X-CRM114-Status: GOOD (  18.78  )
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

This series is the result of what I thought would be a quick 10 minute
job, but turned out to be more like 3 days of pain, suffering, and
confusion. This should be expected with USB Type C though.

The first patch in the series extends the inno usb2 PHY binding in order
for us to be able to do what the second patch in the series does, which
is fiddle with some GRF flags in that driver when the PHY is connected
to a USB Type C port. Without this change, devices on USB-C simply don't
enumerate at all, as the state machine gets stuck waiting for vbus to go
low or something along those lines.

An alternate way to implement this would've been a vendor property in
the PHY binding which is then checked for in the driver and needs to be
present in all rockchip inno u2phy instances that happen to be connected
to a USB Type C connector. This is what downstream does, for example.

Patch 3 was really lovely to run into and needed a good amount of
sleuthing. I'm still certain this is "the wrong" fix, as it simply keeps
the PHY on, but it's a fix nonetheless, and one which has precedent,
namely in the RK3399. If someone is on a hunt to save milliamps in the
future, they might want to invest the time to come up with a less
sledgehammer sized solution for this problem, e.g. by disabling power
management until the controller is fully initialised.

Patch 4 adds the USB related nodes, including associated regulators and
Type C controllers, to the Sige5 tree.

As it stands, superspeed on the Sige 5's Type C port is still finnicky;
after a full day of debugging I still can't figure out why superspeed
only works in one cable orientation. I did a thorough pick through the
usbdp PHY driver, comparing it with what downstream has, etc. etc.
Because everything to do with testing Type-C ultimately comes down to
narrowing down the search space of non-compliant devices and
non-compliant cables to where you can sort of guess at the bug, it's a
huge time investment to debug this, and I'd rather submit the series
as-is right now for review and maybe some additional insight and testing
from someone with a wider variety of USB Type C cables and devices.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (4):
      dt-bindings: phy: rockchip,inno-usb2phy: add port property
      phy: rockchip: inno-usb2: add soft vbusvalid control
      arm64: dts: rockchip: add phy suspend quirk to usb on rk3576
      arm64: dts: rockchip: enable USB on Sige5

 .../bindings/phy/rockchip,inno-usb2phy.yaml        |   5 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 153 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   2 +
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      |  78 ++++++++++-
 4 files changed, 234 insertions(+), 4 deletions(-)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250328-rk3576-sige5-usb-230102aeeaca

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


