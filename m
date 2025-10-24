Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9196BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6d2YBVRAxsxtD7aavxLd6mWyhAION966pctRhNP1ms=; b=F9wiuXTimptPcnYva8llz30oAn
	ofhB4Rh+o1DG5eZoJB6AayOXJK4pVUDcOEuMUts5ct/nvXXixYL7SmN6nhBZGtw6XXOfuVMrWiJXr
	alFg8plsn4dPZ85F5qz9J/qULkq9zejrojD29lwebklawxrdqZmsOhTsJWWFme/9jnXBmGAos+eMj
	y1afkAd6Cpjnyf22omKH7Ephimmm7gK3vAePilDZ+8/Co9WI/vHk5eepPev5ztU4rPC7cShwVbxzT
	8UDiKbO5aEil8OFSMsYmABQsbDZlwVXCtkVFj+PqLaTovhQIHpQM1nvUmhQptzg6bU6baU2nTof9O
	fZy7J6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHGo-00000009QY0-3VHx;
	Fri, 24 Oct 2025 12:51:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHGb-00000009QGn-1GNY;
	Fri, 24 Oct 2025 12:51:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FAD248AF0;
	Fri, 24 Oct 2025 12:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 095E5C113D0;
	Fri, 24 Oct 2025 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761310296;
	bh=rtJkcFLFc1knvqExD8Pr/+VubLNDMv/tDbYdwMGF14s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DtCSGojIF7VlVB4ANTcCgJy5alH7n3wA33ojaT+zZ8iIPmtE9ffxrHS3jNbXwJbhf
	 I3WvgVUGTPoaCUAGQ5ZSh8owtdKI5vEBlFQ9n8GOioXqOa5y0q99NRxLX/ZRl0EdhO
	 U2SDE485ynd3XCK6/6OzZWzR6oLYtuOH9ffx7s7oEwYf9zmx4YZiljoihE4ZVvT8CD
	 a2gpJmiGF6d32OXxCNsusHbz7lMxO5Xf6TlrwfIEpn2CN8JI00dbxH/LFHHih/gRF4
	 vhWJ7OldaMe9MhOyqE3eU3b73+2bjB42yR9HjbA23ijGhuWcQmu9Zu64IT4AWHg4qW
	 bryVYaVLFaiLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9CECCF9E3;
	Fri, 24 Oct 2025 12:51:35 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 24 Oct 2025 14:51:31 +0200
Subject: [PATCH v14 02/18] media: dt-bindings: video-interfaces: add
 defines for sampling modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v14-2-b38b6da0fc80@collabora.com>
References: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761310293; l=1070;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=i0G3bjQUxPWSrwDi2kbON/7nXKFuVdlWiYyEBIeG7YY=;
 b=t/jppvARtOZw9azNNX6OwO+YqleU7f70H9cyKNXpnF32cO/mTYQz8AsuUqB5w8mSR/RABzX64
 oYdl4s0KzswDKjLD5P8ED348qJxuGQFws9gYW7hD0ha334PnH3hM81Q
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_055137_381847_8604D214 
X-CRM114-Status: UNSURE (   9.69  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

Add defines for the pixel clock sampling modes (rising edge, falling edge,
dual edge) for parallel video interfaces.
This avoids hardcoded constants in device tree sources.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 include/dt-bindings/media/video-interfaces.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
index 88b9d05d8075..0b19c9b2e627 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -20,4 +20,8 @@
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CAB	4
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CBA	5
 
+#define MEDIA_PCLK_SAMPLE_FALLING_EDGE		0
+#define MEDIA_PCLK_SAMPLE_RISING_EDGE		1
+#define MEDIA_PCLK_SAMPLE_DUAL_EDGE		2
+
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
2.39.5



