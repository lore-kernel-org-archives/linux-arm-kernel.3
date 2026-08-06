Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDB3C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqr3oUhZX5ra+T3FtU2tSBeC6r2+zGcnj9/7Iuk0kXY=; b=TN5ueoXo7jwdAiH6oZFDOC9aqd
	CFRBND8Ae47gVuPMe/Uh8u4AvpWbjYIFkPLcgYQ35qD4zrJGVgzr8J+LBDBYzKPrBByN0Zk8cjH9B
	c/rvWg3Fowzt5zLsnVUfQmrWGtKGvGyj895qDfoyBrNAk+T5sqGYDtc72gjnt6KOp1esp5jLYaCrz
	Z7zYPeLI6JliISL22/Mgn2pwVwCaEqkKQi4U3n1xn7bTps/WDAMsvWFuPdqTQjGvVgJIO3sBSDdp3
	szwIqTc3AhKeuq1RFd4AHesYc93z5bpr1249weDNwwpsqqtwIm/0lSDg88fWFHr78ln2bLAhK5pcS
	Sn9ijbzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtlT-00000005HiW-3rhK;
	Thu, 06 Aug 2026 08:47:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtlR-00000005Hh8-494H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786006069; x=1817542069;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qCks5QmHaWli0znQDgqe7ceH6hFdVyHKYF2/F2T/0N0=;
  b=iIckpWvf8Wn41C+eo/S7WsOevSdGB/jvEdFYkuU+flMfHajyR1FuBF+Q
   Y3WGdTbCr0y8WWKVK8oife3180VGtyjh+PdhwmyejScTIN5RyrKgZPGKN
   odLap7MBnfofiFA1e7+j83S46NcfpQEjgZT7YS2VPpDAAuHZR+BGl30iP
   x8U5GDsBkJVeqoCWp5NUOySYex0HbHz/MwroS4OOGNVteSx+fLFiRn0TY
   aKvlj2qwC3Rems06kiMPUcZzwRXWHeLnuMcHl24tLpLIgLaOYzMLdwczc
   DBPbb+L7y4n5vVgB0rdkYmyPmoJcqF94fp/TwdN6obrePwCy+sKlnm8ey
   w==;
X-CSE-ConnectionGUID: mb0tXTfvT/iY9DC6oUULLQ==
X-CSE-MsgGUID: 1QwlM/TuQTqvGgCK0uZpFQ==
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="71343314"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Aug 2026 01:47:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 6 Aug 2026 01:47:44 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 6 Aug 2026 01:47:34 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
	<Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
	<mazziesaccount@gmail.com>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 06/17] iio: adc: at91-sama5d2_adc: remove unnecessary casts in of_device_id
Date: Thu, 6 Aug 2026 13:10:13 +0530
Message-ID: <20260806074024.531259-7-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806074024.531259-1-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_014746_031391_508BD9D6 
X-CRM114-Status: GOOD (  10.54  )
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

Reviewed-by: Eugen Hristev <ehristev@kernel.org>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 5b21367cf6b4..3e9feb824a66 100644
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


