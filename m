Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E975DC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4KB7WVtaDosObIpUCqDYPu7qoZcuG9pB297PXP92g0=; b=F0BYTL1of0epm3C/aq9ckQy1zT
	ZOejWvQ7/N79a4+cnYBK40YE7r17NMFkvUFuhi4gs3p5Jb1Sn03MepeQY25aAakmb1br8TBKZ1W6+
	SbM25YcFL1xcg1cKP2pga54ICwBOGHxXqWiBHeEjhwvG8VuMnIuk1Hee3uIwh3QuP1v4ed15/0JIK
	PEvrJdU+WgItZN1EP2oBN1zNffFGlDHB3CgK76NInSaylq9oy//DBZpPBQy3qjM+Us4sNXHViS6Du
	3wtroakFM7ti8CdnmcZcFSmp+xN4bn6VIxM1irBZxnMgZzGKewb/OmdmswYAZmEpr52cskACfAUoM
	AwVjWTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKQu-00000002gH5-3DgY;
	Mon, 27 Jul 2026 12:27:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKQn-00000002gDK-2HpV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785155264; x=1816691264;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Zwd1mu3YCT2AqP9YqitXwSUmD2qgS2CTbBwbtUQ5TaQ=;
  b=o4sjyZp/QJXyhK6TU1rxKTMMRRNSZDUnjWLJkwHGd4qcAJ9ciTyQ83du
   XlLxThxoYiywdRlaJ+wAit6tIMkks5VyKtxlpDit8bH0u88WFYROK8fU9
   c2ouXm3A0tI2MWtw3YAlyUSyXURzTv92NwisCbTo/Z6MwKp0q934qP6rh
   GsyQYXF1h22Wmjpik6yPlfykx8vYhPPnQkTZaI+RKPaBFQaAWkO+WQBq3
   +x+F7Oxlkx8PTEBHwNfkL04I/CJxeYEawNM8WBD8Xz8saMquGLvfI5fJi
   eMlCMcVmnR8EctM+f8NG0bRcGrOCn3KwT2B7jrNDLgLXvRUiHBRDq1fcO
   g==;
X-CSE-ConnectionGUID: +0C84djJT7muJgfuPtKBzg==
X-CSE-MsgGUID: nmmDJL0WSJSxjscx2lDhEw==
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="228368847"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jul 2026 05:27:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 27 Jul 2026 05:27:37 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 27 Jul 2026 05:27:28 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<Jonathan.Santos@analog.com>, <jorge.marques@analog.com>,
	<joshua.crofts1@gmail.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <varshini.rajendran@microchip.com>,
	<mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 05/16] iio: adc: at91-sama5d2_adc: remove unnecessary casts in of_device_id
Date: Mon, 27 Jul 2026 17:56:22 +0530
Message-ID: <20260727122633.117435-6-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727122633.117435-1-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052741_654984_40392B63 
X-CRM114-Status: GOOD (  11.06  )
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

The .data field in struct of_device_id is 'const void *', so explicit
casts are unnecessary when assigning addresses of const structs.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 15dc88f4961b..63481ecb94f5 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -2628,10 +2628,10 @@ static const struct dev_pm_ops at91_adc_pm_ops = {
 static const struct of_device_id at91_adc_dt_match[] = {
 	{
 		.compatible = "atmel,sama5d2-adc",
-		.data = (const void *)&sama5d2_platform,
+		.data = &sama5d2_platform,
 	}, {
 		.compatible = "microchip,sama7g5-adc",
-		.data = (const void *)&sama7g5_platform,
+		.data = &sama7g5_platform,
 	}, {
 		/* sentinel */
 	}
-- 
2.34.1


