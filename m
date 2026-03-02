Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3C9EB362E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 19:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6imtz3bxJygf9zO6wVukOjUdBXH8LjgNZeWsa/69hk=; b=KjwRZNLNmHK1eiO06HX79gpYwS
	u3aFh4pxz2z4O1kGEYyleBYWe/9lJIDjAEnDoqKALeta34XGPbrO4YpTxwhnKaTTewpXU6jbPom2W
	V6eZG0MUM0S0Cnc2CFJG+reIzGi81TTHYNLDWcaHHAywL8dxJwihlNtXm3cHDxRjjwNJAI+KbQ4H6
	4j/WAO5Ts3lPVh5z3gsNgnAkmWG64j3Jvg0UOyM034TUv9rHY0uGGLaXmWnlprF+qDqozkGUE611S
	HAjkOEEXP9MfxrcF/qxjJFv78gkVWVDzKJ156esyflWp36E2933smH2dW/V2lkPvdjL7MAI1HDCVQ
	IJTCD4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8he-0000000DjAx-2eDr;
	Mon, 02 Mar 2026 19:13:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8he-0000000DjAa-03jD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 19:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Cc:To:From:Sender:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=y6imtz3bxJygf9zO6wVukOjUdBXH8LjgNZeWsa/69hk=; b=hSeoCi4hievzkljoyrhwPx8uUn
	sSEQKlY5SjfnKcdjc4bqiQkrK4bOMfHUiJlCD0jvTJI8p8MRC+6R4dqfVKo2wTQcL9+YF4ndXKqzB
	XYjVne7Dgk1sggJ6PVkTcoEWmJ2am5UGVR7bnGiYxdQZb5WucjAwkH+HdZRP3dCiPGYMC6wZ3LT+7
	g2WIsewBEE8bLadQ7HCU0kKB6UCRSDR2UB9SIKARk8z9sVOTqPYqPPsRZ6A38l0caH8ciPGwurLEh
	9/b8SErIzacWdSAnl1zXyCuc111bhq38m86J8bX+PQpYF4CINun1Xh2UuPLw9Ay6RAZ7gbsfNPcGn
	K4r3k/1w==;
Received: from mail.hugovil.com ([162.243.120.170])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8hb-00000009xQv-1RJf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 19:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=y6imtz3bxJygf9zO6wVukOjUdBXH8LjgNZeWsa/69hk=; b=uGWjS+LMb7R9Q5QCIpjbyD9xFB
	TOX/HzqQy9icmHXshx3P+YCUmz19UtAbEZIbiW63TgzjtPUWzzmpFtGdCbMJaAmTDxG4lPmtbjikm
	gnC0izhaC9lZBohGwl8Gh9wWES0rpLNO9RpvvT4P9PI9l4+oW5yCL1Fd4VVvm3X5kcME=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:59962 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vx8fC-0007Wl-Q4; Mon, 02 Mar 2026 14:10:43 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Mon,  2 Mar 2026 14:03:40 -0500
Message-ID: <20260302190953.669325-5-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302190953.669325-1-hugo@hugovil.com>
References: <20260302190953.669325-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH 04/14] dt-bindings: arm: fsl: change incorrect VAR-SOM-6UL model name
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_191311_431770_5E02004D 
X-CRM114-Status: GOOD (  11.86  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

There is no Variscite module named VAR-SOM-MX6UL.

The official name from the manufacturer is VAR-SOM-6UL.

Change SOM model name to VAR-SOM-6UL to reduce confusion.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292cf..99dc1b3f1ba92 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -688,7 +688,7 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
-      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
+      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
         items:
           - const: variscite,mx6ulconcerto
           - const: variscite,var-som-imx6ul
-- 
2.47.3


