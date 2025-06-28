Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9CDC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4D4A8XAdpX1i4Oxx8GKbKsEsP87KOS/0voX/OWNYJ0=; b=ju5+wTwfbRfzVIXandf0pqPt9L
	eQC5s1c6OCNJyFz5tcnicQnQhOQthDU6L9l7SpSKJMKF4DetuZocyJhojE/lLgne9RpIkwEDsFNtk
	csZTERhLucH0JMaYR/B98KL7pZuvDTpCLqGXvirXyc4FTZHeqeDm28i7HYM7UeybA8Z+Ppi4TIX6m
	JphUbL7jBQ8ngpD92C3ImddnfVJQpH+xRuRop4h7k4QbYLzmUFKCvgcz0HOpQ+xFJjU29/yiB+WeM
	tk8PplUW2EGM/eexSyuRZk8b0QFo+lpoZndrYcSHQK8Z5hC/7c4f59LoKqPPp9hec8RJx2i1yz9le
	IDS8fyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVeIy-0000000HMs6-48qh;
	Sat, 28 Jun 2025 22:45:52 +0000
Received: from mx3.wp.pl ([212.77.101.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVeCB-0000000HMHA-253H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 22:38:52 +0000
Received: (wp-smtpd smtp.wp.pl 30624 invoked from network); 29 Jun 2025 00:38:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1751150324; bh=g4D4A8XAdpX1i4Oxx8GKbKsEsP87KOS/0voX/OWNYJ0=;
          h=From:To:Subject;
          b=snyhA2IHcT9W6z5L2uRF9hYG2TAKfFXK42R8PScodBY/tr+9V01QIGJI/a2Pacg3I
           7bNjQyij1sT9Ura0N5nxwA7mdRyT/bwRX26Yv7rzIKBPqe79CY0jylSSmK77Aq9p/f
           sixeZUB7vK9+iTmZ1NNqUmeNgnAJWrE4rYQe4H2KYhXdZ0YuTzLS5+fQJIZaiHJu1V
           UEAof7cKFtPMJZnFQGbaAYJJg7yY+nCyGNZHC3cY18kQ0YHyop6ksYsv39vfgBmTja
           w+LTDyvsAbgm4XaCUv4LSC7gG12bkh93zR+9kgzDKBu7CmQht6uoUPwvdk9iEz673H
           LytEWgEI4M79w==
Received: from 83.24.145.121.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.145.121])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rafael@kernel.org>; 29 Jun 2025 00:38:44 +0200
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
	olek2@wp.pl,
	zhiyong.tao@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] thermal/drivers/mediatek: Add support for MT7981 SoC
Date: Sun, 29 Jun 2025 00:38:36 +0200
Message-Id: <20250628223837.848244-3-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628223837.848244-1-olek2@wp.pl>
References: <20250628223837.848244-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: f11e1f19f95536b631eb315c46069eaa
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [AQOB]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_153851_677510_3E6CC75A 
X-CRM114-Status: UNSURE (   9.99  )
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

The temperature sensor support on the MT7981 is exactly the same
as on the MT7986.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index 9ee2e7283435..020324901505 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1149,6 +1149,10 @@ static const struct of_device_id mtk_thermal_of_match[] = {
 		.compatible = "mediatek,mt7622-thermal",
 		.data = (void *)&mt7622_thermal_data,
 	},
+	{
+		.compatible = "mediatek,mt7981-thermal",
+		.data = (void *)&mt7986_thermal_data,
+	},
 	{
 		.compatible = "mediatek,mt7986-thermal",
 		.data = (void *)&mt7986_thermal_data,
-- 
2.39.5


