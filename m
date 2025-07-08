Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC10C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 22:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGN6DJCTkVUIAy2RF65sa0W+Q97U2Qgd30M42gFEzGQ=; b=cqbOssTppbZATHn3Fxu5FLmUmo
	ShZ54Umn6o07UoGV/iK5euvlPO0z9SVlZ9hAqvQnR1JHfP6jSOvGbcYb1j83fyboDBvkDbZUJ56P2
	eHMyJ6rCtGFsr8sQdZ9MQJLvSqqxyi9/QrKuCYsIohWPHvAuZjRYzKPqPEweheiNRxXaFaBC1940W
	98a+wWYxqjNElPGqd8VN74A8KlL0/IGjRN7fPorAPI+gptKauQsV1r/2trKtvtQBrFerixT5PIHns
	FZMcK4TCZbq11UqBUAAVGj02fhlxy7MA4rEd8WqXgR6IGee+Va2wwqkYVG9OVpBJu7Y1xUK2oOxPD
	zcwMnD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGUr-00000006jjr-3iKf;
	Tue, 08 Jul 2025 22:09:05 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGQA-00000006if2-1R0i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 22:04:16 +0000
Received: (wp-smtpd smtp.wp.pl 8392 invoked from network); 9 Jul 2025 00:04:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752012249; bh=EGN6DJCTkVUIAy2RF65sa0W+Q97U2Qgd30M42gFEzGQ=;
          h=From:To:Subject;
          b=pJH5xRvb2jZHL44s2wXktgXk+Klty8X/N7+60VeilV7PqgQmpOpFoBDIRskisQYy/
           kpGbeqdfjUUeDb0vm/SFn1TUqKBKe78Yc6hj8N72gvXIC52Pv7P+hEX9zU3WBBvU1H
           bpnuXapHq5ybtCzRmcYY9dVtnvicflsvILIwpfX+cJzCv4Q/NycEgMDVrupWvIMSqa
           AfU1xdHmaWMVoYNR0vO46nz/C+tVFvH7OilCwJXfsWFUgNvJhlElouq85JE2fk4+vi
           H5rPuL/fmJVW2+rkM0pTL0gEzCq4DKQa4efNi1uL43Bg0dUcWPi2NnOyF7UIq1ycB8
           Am5DYDgg77DBA==
Received: from 83.24.138.239.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.138.239])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rafael@kernel.org>; 9 Jul 2025 00:04:09 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	s.hauer@pengutronix.de,
	olek2@wp.pl,
	zhiyong.tao@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: iio: adc: Add support for MT7981
Date: Wed,  9 Jul 2025 00:04:03 +0200
Message-Id: <20250708220405.1072393-2-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250708220405.1072393-1-olek2@wp.pl>
References: <20250708220405.1072393-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 5152ad29fb8f55b57847c266456bbc96
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [8SPB]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_150414_851689_8217B42A 
X-CRM114-Status: UNSURE (   8.74  )
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

The temperature sensor in the MT7981 is same as in the MT7986.
Add compatible string for mt7981.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
index b489c984c1bb..14363389f30a 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
@@ -32,6 +32,10 @@ properties:
           - enum:
               - mediatek,mt7623-auxadc
           - const: mediatek,mt2701-auxadc
+      - items:
+          - enum:
+              - mediatek,mt7981-auxadc
+          - const: mediatek,mt7986-auxadc
       - items:
           - enum:
               - mediatek,mt6893-auxadc
-- 
2.39.5


