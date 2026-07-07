Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3060C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxqEWZp1qs8ndMuXkIPLb77vUFNki4MesCWvabNqrRw=; b=te0u1Hl7y0GmVKZlSRPq+VS05t
	SjXFXxM53OIkmI8taABSBFBolL8n5viHyyzWuHht2PauHqQF15F0aTXipv5y+w3i2hILlEVxl2YVG
	FplbQtXp0svGOS63ccnjY6W+b7pkmezA+wIZMHK2P6WTXbIjO/zjwAKzai0aqu4hDfuT4I+l7EdNd
	DIyYkjsRt6Wv5GsWv9Kn/4x8OwGkkm37KXCjj5VVo3ygjQHaW0baVXRYpNOCIp2FRtRuUKtVj8wx0
	nFx8NHag20Zef/Mre/aBrX6Vh4K3eXJbzcwPD5cw1QLgPs+vlE2IhDtyZzC4Hzyb92I8ptHHwRhqD
	Q+Fpu+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1ax-0000000EY7c-1QOp;
	Tue, 07 Jul 2026 08:55:59 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1av-0000000EY6Q-0iuc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=HxqEWZp1qs8ndMuXkIPLb77vUFNki4MesCWvabNqrRw=; b=KTHutmk6OI9gPbLyrJ+/KgMksH
	ZjC7y5H/kUrSdpuRTUrSL2fgQ5Bm+4BoH7VB6HbsKDNI7gQBHPItXcn+QtQV4tXi3GbJtb8AgT6Hm
	I4dgVQYqPWZ7EuYz4M+C5GVX2iszeZU90zPERRRoOvDY3E5SV0cBLoBhwwBB1i9zgh5RZ7EC8dnWW
	GwuPorcjm+yi09qAhoCJ44wFDf3u4W+6949BhQSJ6OQx1WRy7sRgIjreCHISY/3YX3Vp3ycdLYnRq
	uLJ2qjs9+p0woj93L7cVoHPsWGdyly1c6KVi1CpE0f7deUsTW5lK2LiEw5T93PYxp/b/IDoiwpU0a
	ef8JufbQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1as-000Gjs-2w;
	Tue, 07 Jul 2026 10:55:55 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1as-0007hK-0C;
	Tue, 07 Jul 2026 10:55:54 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] arm64: dts: imx91-tqma9131-mba91xxca: USB phy adjustments
Date: Tue,  7 Jul 2026 10:55:42 +0200
Message-ID: <20260707085551.1683462-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
References: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_015557_322909_41DCB79B 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Add samsung,picophy-pre-emp-curr-control and
samsung,picophy-dc-vol-level-adjust using the same values as other
TQ-Systems GmbH mainboards.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
index 5c430e6fca651..60d11a4573e3f 100644
--- a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
@@ -518,6 +518,8 @@ &usbotg1 {
 	adp-disable;
 	usb-role-switch;
 	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
 	status = "okay";
 
 	port {
@@ -532,6 +534,8 @@ &usbotg2 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
 	status = "okay";
 
 	hub_2_0: hub@1 {
-- 
2.54.0


