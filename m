Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0604CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6d2YBVRAxsxtD7aavxLd6mWyhAION966pctRhNP1ms=; b=E7SJgI7D0EiT1PDb56qOsw5oqS
	QixJ4R5Df48mxiME3+y1N+vUtiwRrJdjseUKoPwKJHmzeRCKvl6YICJ8+yK2uWVksXINa4hZpWVlo
	+h6ggQ+UMeRJ/v6x1zJKpVVRBwz5JhLNK7oS/KMNTrSEFGBdyhYfBr70FitKHsKNgybI3UVDeNszu
	IyRKVuTSSYF5CH+oIQcNPoet6NN+x/eM7Qw7NkQg/3mkjJAQSwreQqLbOyd19w+smucjVWzvqM9i4
	jw4BzQd1wCDKDgXuLuL3l9N9rPLpxeo/plO+qBysWKc6p5oGvDsssM9PyHqVnkgR9rifz/4Iwz+Xn
	8CX2AcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92vX-00000001yGg-0DMK;
	Wed, 15 Oct 2025 14:56:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92vU-00000001yDj-2zWa;
	Wed, 15 Oct 2025 14:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CDFB62635;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76001C116D0;
	Wed, 15 Oct 2025 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760540187;
	bh=rtJkcFLFc1knvqExD8Pr/+VubLNDMv/tDbYdwMGF14s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q1IsHLdQ3RX5kW9qBlmqvR+JG5fsods3nFXYW0I1BWjjAkOAYmxe06fkjXEJJzOH4
	 jyZoY+VOX+xGL2jmndSfF+7I6M6maW2DlY4rPudZaE6UjpKb6ovKPqGGSTwFFCX2va
	 vITrMWDHkte4wOlpiAhBAfgp8L5j9ssicYs/SBizbdOpBEdXLUm3KD3NsRlsRSi0pX
	 5BmUpIf/VzL2LbjpqJ2AaNgdJPicwe2Ue2XPiMi2/8t7Hkss5wc1t9bysU95OeLxP2
	 unSacUM+WaBl0P1YnoHlvLNX4R8njt5ZvXH5q+x5tQWa4Y0PWWCw9zac0kXX4v5SB8
	 LB26wRyXGnsRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673BACCD18E;
	Wed, 15 Oct 2025 14:56:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 15 Oct 2025 16:56:25 +0200
Subject: [PATCH v13 02/18] media: dt-bindings: video-interfaces: add
 defines for sampling modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v13-2-da164b4918fe@collabora.com>
References: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760540185; l=1070;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=i0G3bjQUxPWSrwDi2kbON/7nXKFuVdlWiYyEBIeG7YY=;
 b=i/V+z4NEblmSKwG2f+LDV0zy/55aYvz/qt0AhY+C5HVQnAjHt3AlugJaQwI0mMz7p9JEZhWse
 c9qYAV//IirAvHG9w/CDzSLb0WAkyd5T4Y+KwAclJhmpzHQzn7wp5Rp
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
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



