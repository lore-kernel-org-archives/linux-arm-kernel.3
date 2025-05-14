Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A257C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GibpOKw2Oeij1CARh01uy2fPKLSvtfSGjC3d7eZhmY=; b=054Z6DFgKtpXXR+xpx2oCZHpSY
	FhKOYENA8eR6tsIxO12sxKfRELyvKEV9yNErzE3Uhx7I9/WQ4BnAwYbYGLk+2T/S9mnwxRUt9ADm5
	Ozb6RivV3it4GSHZI+YKNnpl3n1XN3FO5c0/0gLYQb/hO3cc4vtWuig9LUFtx43pWJh2yr4DXdwLy
	GfxMkAjbhEniuTrvgzQN+ibp2gQtIcTg5CTvJrJNTWivaW/IB8cQbexXjDn7mPJThYHJtRZI2hotI
	qCEZNIvuP9DwSLjdRR+/e9w5z137JQjIaEqzYD/sQbu1J35fqjNdZyGC7eggYfM04EIoW6SRX/wDQ
	z7ObDMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBX-0000000Ftsf-1g3R;
	Wed, 14 May 2025 17:46:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEPo-0000000FeNf-0nnx;
	Wed, 14 May 2025 15:53:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DAF94A883;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9825C4CEEF;
	Wed, 14 May 2025 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237982;
	bh=kTKppK2H79eLeACzamVwFdZ/qi0nWKnNmS/TmUsNZ3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pnM/5MyzI/LF5kipZnXsuqwZkrYzKU0VJJsq28qeB7CWmTav19vkJYsi8gZy0TLq4
	 QBoJ+px9NIiH3AKMv/ARvD8cY+M466Tz/GOhXhi7GEdTLuWMooqod0H8arNDz/uULe
	 F0ESAE5X/+XBqYuK3wYUQZUismT7xoqkOAN1XT0PKGbHLHR5Myzsztz2Uc2fFMHO/P
	 mroevL9seZP+0PHNHCGoVWDcmrpkD6e1jo5TWa/sBnbnXNSFZpJVH0Pi2+yW+ZGiSq
	 OWLAV9lBeXsRyuHXSQ5DhYhQmm4TRlADN7yiZFJykaZT6nBP5KFyuEFW/MvGfrFZwx
	 rNHA8w2RHi1GQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7985C3DA4A;
	Wed, 14 May 2025 15:53:02 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 14 May 2025 17:41:03 +0200
Subject: [PATCH v7 02/14] media: dt-bindings: video-interfaces: add defines
 for sampling modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v7-2-7581fd96a33a@collabora.com>
References: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
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
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747237265; l=1010;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=Uz74OJ3MrVHSpMmLIY3bphZ6CO+aAi3TjYd87Bbmoq0=;
 b=aXQDZzcf3P3lun1FnmmzkLGtPTpCqpHllknkzO+jelA5vj/R5wYGgLWOH51/phaVt0UP4bihI
 XtEcsBVt9efCuYpfEcr+VllcGj28IxT5deEYPtabs9A0MRjvb9XKxon
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_085304_275010_EF2AF194 
X-CRM114-Status: GOOD (  10.28  )
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

From: Michael Riesch <michael.riesch@wolfvision.net>

Add defines for the pixel clock sampling modes (rising edge, falling edge,
dual edge) for parallel video interfaces.
This avoids hardcoded constants in device tree sources.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
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



