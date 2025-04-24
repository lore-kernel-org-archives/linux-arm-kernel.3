Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E479C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8F6drkyY0eyTxeDSyy+HwaKqjKnQVzFkSR1ms3XaHyE=; b=dEbyLlMBP6M40/
	8N56/Aj7fqvM7AZ0iFMoLt5h3YOJVKaig0hoK4xm5Us4dFa3PVi40PuA9vDBxXwuLBGINfWJxexW1
	9iNwRcqxtorkTHATBV9F0cd8NkKoHst5o92zdpARPl/uSImIJeEeWP6FR4xExvkQcKfmuunVTYkax
	Voq/LDraPlJiO7eqlsyRQnLyWPwfjODoh5j6+FbWN1QLgaxUjRDhYdZi6XDRQ5dzFxrlTCYw40LMW
	106bOqn7jSZuz4p/DhENa5qkXmjQsRMPMXz5ChiHSpkvgBpxYKAev1aQm5uOUS9aFs0WxUh6xFEYb
	N5OFYgy8rcT67Owyl//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uNL-0000000DnBj-29c4;
	Thu, 24 Apr 2025 11:04:15 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tWC-0000000DcUl-3lsq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:09:22 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 144B9343016;
	Thu, 24 Apr 2025 10:09:13 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/5] allwinner: Add EMAC0 support to A523 variant SoC
Date: Thu, 24 Apr 2025 18:08:38 +0800
Message-Id: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKYNCmgC/3WNQQ6CMBBFr0Jm7ZihMARdeQ/DotYpzMLWtEg0h
 Ltb2bt8L/nvr5AlqWQ4VyskWTRrDAXMoQI32TAK6r0wGDJMrWmQasyvwKwoD+sIWZoT2558d/N
 QVs8kXt978ToUnjTPMX32g6X+2f+tpUbCthNpXc8sZC+jhDnGY0wjDNu2fQFSbWT/rwAAAA==
X-Change-ID: 20250423-01-sun55i-emac0-5e395a80f6bf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=aTRP5MOUdrYudfIXeH7X1qFPiPt5o8uB0GSNLVO1Y3Y=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCg21wuR03eG7PJ5BcbAbEvSBCD2s6I1UGgiC0
 4QRFOwWOemJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoNtV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UcED/41P2u7nuUUGzH+Nl
 RH0IcFgw4kRxzmS64sXWYjeWMg3ZTJsmZdlrMePlTHFpT5dyt5lwILhAahFQxmswPOyiEJz5QDZ
 enEhZOQNb2wn316NeTE0oQzcsZzxYerhMMQcSsT8pO6zNCq0dEixRV/yik60P9ZCmUqdqUI51NN
 NlOegqa70BDG04ab2t1Q5FlNqDp+TfSFL6Dp5IF+VcKLzMcQgWoyOXSH8Y8yEyUdQkCHl6qrgyI
 cQaypj/GjCf1zrQOx27Hr4mdprc5fm/6nL7AuadhA4Qmy+Ln5K5Cj9A+ydj8+RSMMKEwQI+3r0v
 M73RO/nDJmKdNTG7e4Y/CGHo7+fsKYseFNB1C+39ruUa7rmudnAX+TzpRM2mp2kuepALq1nWtG8
 R3SyqHSM46UQNnt8ueMREiOmynLNvPujhGfE5cPA0RrfjTAffqx2tOIGtSRgLNl731NtW0R138O
 f+591g8Da+aSCnTDvaehhifgMbWiZ4DeAWsB0VB6DoqwHVfH/idMFbTcKZQ7gSPd0E8Ot+VIItr
 toWl+nYX/lr0XFfA7xxCpZASIotWVbXTsdqcxg3waYs5DasLWJX0OC0bNxoUOFapabMa/4XiJW+
 qMQGkDHKz1eJGgHSs0dvSOIE8Sy+MN8aI7bkETD8k7ZY1VJn9+qPX58+iwQpq8PPoZlA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_030921_039109_70AD0061 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

This patch series is trying to add EMAC0 ethernet MAC support
to the A523 variant SoCs, including A523, A527/T527 chips.

This MAC0 is compatible to previous A64 SoC, so introduce a new DT
compatible but make it as a fallback to A64's compatible.

In this version, the PHYRSTB pin which routed to external phy
has not been populated in DT. It's kind of optional for now,
but we probably should handle it well later.

I've tested only on Radxa A5E board.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- add ethernet alias node
- add phy-supply
- change to rgmii-id
- drop PH13, rename pin name
- drop bias-pull-up
- collect Review tags
- improve commit log
- Link to v1: https://lore.kernel.org/r/20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org

---
Yixun Lan (5):
      dt-bindings: sram: sunxi-sram: Add A523 compatible
      dt-bindings: arm: sunxi: Add A523 EMAC0 compatible
      arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
      arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
      arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1 board

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    |  1 +
 .../sram/allwinner,sun4i-a10-system-control.yaml   |  1 +
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 40 ++++++++++++++++++++++
 .../boot/dts/allwinner/sun55i-a527-radxa-a5e.dts   | 19 ++++++++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 19 ++++++++++
 5 files changed, 80 insertions(+)
---
base-commit: 69714722df19a7d9e81b7e8f208ca8f325af4502
change-id: 20250423-01-sun55i-emac0-5e395a80f6bf

Best regards,
-- 
Yixun Lan


