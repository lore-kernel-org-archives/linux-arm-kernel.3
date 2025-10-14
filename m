Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC646CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTigBHzivYHW42aBP5JfT3vnHCceMIQ7pDEXCoTLL+g=; b=Il0vnbOAtEEIS3TZxz/WWnzmjo
	X7bzePY58LVsq0sFgNRhQbjvbPlNcGcfsg6VqohoNX6mFPziG9OUozeURD9QcHn5K4mVzNeKyZoRX
	846X5t8kDOwQnc+VPG3npdBR5uCUuEx/cEmRvtZ0A+HswrVq08vGUf5pKcwBYXdlQIPLdxXwlhh54
	idwwiCgll+Ffuh5MBB6ceQjlKBAZckPTXtMky057FI9euBBENwMIF3hCdx78GBwvHyr78HbL0MD5s
	UuKAzMD4KpyDseDBFi0HiI2ViEfXXHJ+Q8EECq/QROkBpXXsdVIkM+YcfQtcMwebV4PRWJcdSF/W2
	yDb8FL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8efx-0000000GLTO-2FYK;
	Tue, 14 Oct 2025 13:02:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8efv-0000000GLQo-1nCw;
	Tue, 14 Oct 2025 13:02:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8170628AB;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DCACC113D0;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760446966;
	bh=YADDeCmq5uePnzFDn+9evtVAHH2fPQHvEnKepdXqNFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fIkdWmAslne8xy5vQ3qxxdqAyjg0V6QmRdP76Sc6KT+PTuankczjeG6gz0qr0cIrH
	 TWHgCrLQhxEgHqZTVULmgQlECcuhu8FvBstWAsVQL7MObCsYUQImVvi5Dr9AzpxNGS
	 OIqyqzxIBCNESs5nvBuhAn1lHRcJgFONruOlxYjsiR2AEZhSQjAgOOz/FQAR2FMnNF
	 gsTod5XbRFU3H7fU1CSfMoa38wSsUGG357kW63JQoP+ARtKROlTntUhDVnLQJIvl3s
	 RQAMzgQZJN4QQxDSI09G/5bTu6b46mSNW3iwQHYLPTpELoryeTTLNqJBn9F0CXrDkt
	 gxXtp8P23RqPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949B4CCD193;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 14 Oct 2025 15:01:59 +0200
Subject: [PATCH v12 13/18] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v12-13-c6dbece6bb98@collabora.com>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760446963; l=894;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=qagheTrOUgm9PAts7S1syhcsrJaB5GYArNSZ52aSGoY=;
 b=i2/6TtnjEwY1XwBiRdryuM+1Z73ergSV/uElfYkRbLrWDg6uQatqmbwNuh2xrqwYn2La5I27O
 wNcfoQWJhAZBgUNN3jnii7uFFnUC4yutN7qCVGHuUh6d1psEoXVcTAx
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

The Rockchip Camera Interface (CIF) and the Rockchip MIPI CSI-2 Receiver
are featured in many Rockchip SoCs in different variations.
Enable the drivers for them in the default configuration.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..86e39240979a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -883,6 +883,8 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_CSI=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m

-- 
2.39.5



