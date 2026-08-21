Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9853EC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T4ZlsnhWnTXz6K16ZuYeuUkMt+IUn71+covo7rgy9FI=; b=GkPDPDRegZnEGL/L4WAMfWW/kS
	2G7v1xJBtnq4OFuY0hpIY6dEUWgaczTxn2xC2vUrl77RDVfMwPa7bWQx4SD5jvOIVZ6GjOovj+j8+
	Nt6A5pTB4NcPc3c9E3Q2HoMpmoog1vsj0IhtWJNyGqjNtaWhi7v1KcSmcwEU2UX3iJJzkWGhUMkSA
	67uWWPiQ3Z7fzQTjNMCohrvg9RSpj8Zy2NjpJJAkBcdTCxv+cl01Fp4ZtuNOlwrkXfs5ZpMrbW05u
	NsW7cxOmtsK25QptHruNCdATrfw9KJFu3vN6lY83WeX4IOcZfkBXPvOH1adxNMg6LYB3JDZe4UE6b
	LxtW5rZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNxN-0000000DG2n-3VSU;
	Fri, 21 Aug 2026 12:02:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNxE-0000000DFvp-1MuS;
	Fri, 21 Aug 2026 12:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F9D060A69;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3932FC19425;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787313755;
	bh=Y1C3qRn442xlluBhCAz1HPQxJgAgw1FEMP66Vz9gg1o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aYq4U7bxwjkD3GqDJZyNMTXOcEsm7BnuJ+S849n6CZlXIah0iZE9hhF1/CmQhGo+c
	 Hfvt6op6J7/sHXt3fb4DlyFOsNoAXvfvVY+mgjSXWksoz+HjdRUTIAzC6iZSQ/Ij7v
	 9+GavYsRxHeadqfZ4MV7Hzs7jARAp95qqZlI31EVigZ4JtNlRB9xlP4J4FSb4slt+x
	 rp2uGzXurtds5w4kE/GoAEIsmWpPspgik1YDlbGwwhuoKoPBzdF1TLBdlJatUHGksu
	 Wz+Lcpc42gKbhpSX5So6dn5pZvGDU/FuXAJTBrMR2mv9igFD9A16tP/bmgsc5J0KIt
	 Uyu5lh3jnLIEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D292C5DF7D;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Subject: [PATCH v4 0/7] phy: rockchip-samsung-dcphy: Add the MIPI D-PHY
 receiver
Date: Fri, 21 Aug 2026 20:02:28 +0800
Message-Id: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQ+iGoC/23MywrDIBCF4VcJrmvRMTe76nuULmTURGguaJGEk
 HevyaZJKczmDHz/QoLxzgRyyxbiTXTBDX0a+SUj2Kq+MdTptAkwKFkFnGoc25n6iUZOpbJFZYX
 RVkuSxOiNddNeezzTbl14D37e45Fv3/+ddIzmFmuBDFGhvDedcq8rDh3ZOhGOtjxbSBatRBS5y
 jmoXyu+tubsbEWyCjQUCFJpi0e7rusHhOPeqh4BAAA=
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787313753; l=6334;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=Y1C3qRn442xlluBhCAz1HPQxJgAgw1FEMP66Vz9gg1o=;
 b=CIyaWHObjUNlaWJQaZx3DaWxkSdnktoEQptoWPbrZ4JDwn4adguEg+GOeI3zmYbj31WeSdo2Z
 RVb8tO0UFC/DLSe24SIYvzDd7U5F9fhKV0XIUcoTfuzcRxzVg/WXWm1
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
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
Reply-To: jason98166@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
(DSI) and a receiver (CSI) on the same PHY, and two drivers can use them
at the same time.

Mainline models the block as a single struct phy. The PHY core refcounts
power_on() per struct phy, so the two cannot be powered independently,
and the single devicetree cell selects the mode, so it cannot tell
whether a consumer wants the transmitter or the receiver.

This series registers a struct phy for each of them, adds generic
PHY_TYPE_DSI and PHY_TYPE_CSI constants so that the devicetree can
select between them, and implements the receiver.

  1/7  adds PHY_TYPE_DSI and PHY_TYPE_CSI to the generic header
  2/7  allows a second cell in this binding to select the transmitter
       or the receiver
  3/7  moves the block-level setup to runtime resume
  4/7  names the transmitter helpers and ops (no functional change)
  5/7  factors the transmitter teardown into a helper (no functional
       change)
  6/7  registers the receiver's struct phy and takes the second cell
       in of_xlate()
  7/7  implements the receiver bring-up

First, my apologies for the quality of v3. I sent it too hastily, 
and much of it had not been thought through before it went to
the list.

I have removed the Assisted-by tags from 1/7, 2/7, 3/7 and 5/7. Writing this
code and the commit messages of those patches don't need AI; I only
used an AI to catch typos and to smooth my words(same as this letter).

On the points Krzysztof and Sebastian raised, I have rewritten the
commit messages of 1/7 and 2/7 and the binding text, and the binding
now lists all four combinations, so that it is clear how the mode and
the choice of transmitter or receiver go together. A single cell still
means the transmitter, so existing device trees are unaffected.

On the D-PHY / C-PHY mixing Michael asked about earlier: at the end of
TRM section 22.1 I found the sentence "The TX and RX only support
operate in the same PHY mode." So DSI and CSI can run at the same
time, but both have to be in the same mode. 2/7 says so in the binding
text and in its commit message, and 6/7 rejects one D-PHY consumer 
next to one C-PHY consumer in of_xlate().

Because of that, and because the list pointed out that this is a combo
PHY, I treat the block as one transmitter PHY and one receiver PHY,
each of which can run in D-PHY or C-PHY mode. The transmitter and the
receiver therefore register their own phy_ops, and power_on() only has
to work out which mode the block is in, rather than working out both
the mode and which of the two it is being called for. C-PHY still
returns -EOPNOTSUPP throughout.

I have also moved the block-level setup into runtime resume, so that
the runtime PM usage count does the counting and I do not have to add
a refcount and a lock to protect that count. That needs the point at which
probe enables runtime PM to be fixed first, which I do not think
belongs in this series, so it is sent separately for review: [1]

[1] https://lore.kernel.org/r/20260821-dcphy-rpm-v1-v1-1-a7db728b2539@gmail.com

My apologies again to everyone who spent time on the earlier versions. 
I will look over my own code more carefully before sending from now on, and
take responsibility for it. Thank you.

Testing
=======

Tested on an RK3588 board with two devicetree configurations, one boot
each.

With #phy-cells = <2>, DCPHY0 drives a DSI panel from its transmitter
while an IMX219 camera feeds its receiver; DCPHY1 drives a second DSI
panel through an unchanged single PHY_TYPE_DPHY cell.

  - both panels light from boot; the camera then joins and streams
    with GStreamer, so the transmitter and the receiver run at the
    same time on DCPHY0
  - the transmitter then leaves and rejoins mid-stream: the panel goes
    off and comes back while the capture keeps running
  - no WARNING, underflow, "Internal error" or Oops in dmesg

With dsi0 disabled, DCPHY0 has no transmitter consumer at all for the
whole boot, and the camera still brings the block up and streams. That
path only works because 3/7 moved the block-level setup to runtime
resume.

Not covered: RK3576, which this driver and binding also describe, and
the 3- and 4-lane receiver paths.

The DSI panels only light with the U-Boot SPLL fix [2] applied:
without it the bootloader leaves the SPLL at its 351 MHz bootrom
default while the devicetree describes it as a 702 MHz fixed clock,
halving the rate of both DSI hosts. The receiver path is unaffected;
the camera captures exercise it independently.

[2] https://lore.kernel.org/u-boot/20260804002643.2308515-3-jonas@kwiboo.se/

---
Changes in v4:
- Put the second cell back: the first cell selects the mode, the
  second the transmitter or the receiver.
- Drop the private use count and mutex; the runtime PM usage count
  does the same job.
- New patch 3/7: move the block-level setup to runtime resume.
- Split v3's 3/5 into 4/7 and 5/7.
- of_xlate() rejects a mix of D-PHY and C-PHY consumers.
- The runtime PM probe-order fix is now a separate patch [1] that this
  series applies on top of.
- Bryan O'Donoghue's Reviewed-by from v2 is not carried over; that
  patch was rewritten.
- Link to v3: https://lore.kernel.org/r/20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com

---
Jason Yang (7):
      dt-bindings: phy: Add PHY_TYPE_DSI and PHY_TYPE_CSI definitions
      dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Allow DSI and CSI consumers
      phy: rockchip-samsung-dcphy: Move block-level setup to runtime resume
      phy: rockchip-samsung-dcphy: Name the transmitter helpers and ops
      phy: rockchip-samsung-dcphy: Factor the transmitter teardown into a helper
      phy: rockchip-samsung-dcphy: Add a second PHY for the receiver
      phy: rockchip-samsung-dcphy: Add MIPI D-PHY receiver support

 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   |  20 +-
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  | 552 ++++++++++++++++++---
 include/dt-bindings/phy/phy.h                      |   2 +
 3 files changed, 515 insertions(+), 59 deletions(-)
---
base-commit: b828e5a7fb47aa434b8b20636de5d47356314322
change-id: 20260721-dcphy-rx-v1-9af57f3edfd9

Best regards,
-- 
Jason Yang <jason98166@gmail.com>



