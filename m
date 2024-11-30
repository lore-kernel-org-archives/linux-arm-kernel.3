Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAABD73606
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LBqtIkKqqs3bjj0mz+CKgjkWz2efBS8qbc1Tcg5LZaI=; b=YsvdFOfAn1Rau0zzTjbitwSFZM
	36WFS5AmpdghHyg82+cDN3bKMBOA/7GBoQK4zn/dUlwrI7BXmRy34seBL/vv/iro6TvYsfMUwSH5B
	RdolmOXkVfWgW/7YeRUaEUKqbTzUmZrluPJ69TtEiR/djkKZXUBqC1iSnHYyD11D5oxpLD+ciRn/E
	A1I9nVToXBlnHojhgRr/c9f4LNVkZGJ/kgivQsntCoWFupl6S7YaRX4aiSCuUhCbXQR2DvcBeVSB2
	lf960KouFQk3Ri8vFfOqU/1zGnH7VKSM7Bnt0vEBU22lv3fNYG0I9JGDaxM+aO0bXQlfIAZPXS3k6
	8wsHzZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHOJY-0000000296k-0agH;
	Sat, 30 Nov 2024 14:19:16 +0000
Received: from lx20.hoststar.hosting ([168.119.41.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHOIZ-0000000292z-3BtA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 14:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LBqtIkKqqs3bjj0mz+CKgjkWz2efBS8qbc1Tcg5LZaI=; b=kNP1i5WxNv3Jj6oqGm67tOKT0M
	l5b9i72VFafsO6LBqtqglQeA86VHYbMYweAc3y9BwvGmFiUSzlpKjuV4P17YMkin613UYI0i025eK
	AJz6v67LBD4E8pezHQeOa5s9dau+oat8Pu7wb8/EcA2g5HPRgpUfzxbXo+S4fp40tk8E=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:61203 helo=localhost.localdomain)
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1tHOHn-008ZQH-VJ; Sat, 30 Nov 2024 15:17:28 +0100
From: Matthias Fend <matthias.fend@emfend.at>
To: Michael Riesch <michael.riesch@wolfvision.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dt-bindings: sony,imx415: add required clock-names property
Date: Sat, 30 Nov 2024 15:17:15 +0100
Message-Id: <20241130141716.1007115-1-matthias.fend@emfend.at>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_061815_821400_6A6B1EBB 
X-CRM114-Status: UNSURE (   8.69  )
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

The imx415 driver expects a clock with the name "inck".
Document this in the bindings.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 .../devicetree/bindings/media/i2c/sony,imx415.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
index 34962c5c7006..e110b39bb391 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
@@ -31,6 +31,10 @@ properties:
     description: Input clock (24 MHz, 27 MHz, 37.125 MHz, 72 MHz or 74.25 MHz)
     maxItems: 1
 
+  clock-names:
+    items:
+      - const: inck
+
   avdd-supply:
     description: Analog power supply (2.9 V)
 
@@ -76,6 +80,7 @@ required:
   - compatible
   - reg
   - clocks
+  - clock-names
   - avdd-supply
   - dvdd-supply
   - ovdd-supply
@@ -96,6 +101,7 @@ examples:
             reg = <0x1a>;
             avdd-supply = <&vcc2v9_cam>;
             clocks = <&clock_cam>;
+            clock-names = "inck";
             dvdd-supply = <&vcc1v1_cam>;
             lens-focus = <&vcm>;
             orientation = <2>;
-- 
2.34.1


