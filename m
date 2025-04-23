Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B879C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wPRG4P6zuN7b+oIRKRmBif3E2Id0Ps/A8QatLwDRfq0=; b=KwL9HqQNbSgFkw
	LhfwfquU5H4KiMwnH/EKoo4Mtps+gtcC0UGLQAEKfbPrW2n5ROpm7SqEv1el02wb2sgglvAcloO8D
	vJJhZ09cXyQEYWY4KYXfD8+uJHORnq6Sbq6r7glfvj+ewJyMbJdqE0fZwl/HpogM5SXrV4oDoJ78S
	DMfqJZN+yZYi9vK6PaC95ZTeTS2s1ZbkayypB5d3MxYzrD8J16QIHz+hxUX82cD/mfIMx3d6klUNW
	jhLwyDjPQYMOMXVqDHSdB5UgPaOta0XQlwnI3dYRBxyDzm4oSq2dnRDdoFMptQB7mbYXllIW1XgP6
	vKOH9YrUdidMBBSsv7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5K-0000000BINE-3htt;
	Wed, 23 Apr 2025 17:40:34 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ahq-0000000AlHl-005y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 14:04:07 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id F323A343087;
	Wed, 23 Apr 2025 14:03:56 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/5] allwinner: Add EMAC0 support to A523 variant SoC
Date: Wed, 23 Apr 2025 22:03:21 +0800
Message-Id: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACrzCGgC/x3MQQ5AMBBA0avIrE0yygiuIhbFlFkoaUMk4u4ay
 7f4/4EoQSVClz0Q5NKou08o8gym1fpFUOdkMGSYKlMiFRhPz6wom50IWcqWbUOuHh2k6gji9P6
 P/fC+HyFAyS5hAAAA
X-Change-ID: 20250423-01-sun55i-emac0-5e395a80f6bf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=hZqEM5nE7TvaLpWqvoc5l3TI9Oubf5G1nbiY8Pi5PH4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCPM4DKPuBzZRVqb50T8PXyF0UCKRr4fPVdY3s
 xmCwN+ZxpuJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAjzOF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277SAQEACFJYjiSRxvE/mbb9
 F0SyhbAmPcpzsTcEoKbxHroJiSTxxoeWs+r/5TyOOnNbUwJnYoJ6+gjZHiAelGlImh7gSNnOQGy
 VEuHuUZGDpiGPB4fU1sTh1Fl/5ii8niwqIu+Ygx6ScocrgNNciHTC48Ge0/7r9zl+x+WhYwnY94
 JHQLC9hcrNUxzj/5JUtUJ/BIT+XmC2YJEOV0VZeA0rtcGBFhyuFufIrBTVq/cYpKhTCIM7I0fMX
 8fqENSCW9DT2ycGBbSFiBIgOk+Lb2irHyzr2HZDPhkW6OYMnSU9vkey+13JszErEZf6LV75+Df/
 LtFjXyGU7YziaK0JevsgLA0p7EJU7MXxizfGOVO+Qj6PNqxCLttlv607QizLCpWkcr13sl59xW+
 T2bHYmmll5s1VM0mQWuJqjit+gJWm9Rt+aE1/dRwKjjN+2fTJKKmC0IxYgttiDu84WRDHo4lo0t
 cXSoyWKB2FVwZ0dQDvqiSCalX3CQs0V2ZvFsE+GCBbBTWMbN/jlQ39sP13SHdZzuoiKabkf9dRr
 RyHSARPSW7QT/UBAaOfi/p3GPfllr6RY7CP73piRJy7sUNXyR2qNX4DUUt8yfdwKrJ3PzeXHJuo
 guSiGgJzjAsvw6CvPr8khtvtTDHP9pAM7UmN8vfAhwwCP/UTEeXalnYgzr0uTrKxgT7w==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_070406_072343_CE49A8A9 
X-CRM114-Status: UNSURE (   7.78  )
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
Yixun Lan (5):
      dt-bindings: sram: sunxi-sram: Add A523 compatible
      dt-bindings: arm: sunxi: Add A523 EMAC0 compatible
      arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
      arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
      arm64: dts: allwinner: t527: add EMAC0 to Avaoto-A1 board

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    |  1 +
 .../sram/allwinner,sun4i-a10-system-control.yaml   |  1 +
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 42 ++++++++++++++++++++++
 .../boot/dts/allwinner/sun55i-a527-radxa-a5e.dts   | 17 +++++++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 17 +++++++++
 5 files changed, 78 insertions(+)
---
base-commit: 69714722df19a7d9e81b7e8f208ca8f325af4502
change-id: 20250423-01-sun55i-emac0-5e395a80f6bf

Best regards,
-- 
Yixun Lan


