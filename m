Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9826C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqr3oUhZX5ra+T3FtU2tSBeC6r2+zGcnj9/7Iuk0kXY=; b=XqxLiIigrJ8f1Eu8Rhi6o0+e2R
	rNo3VbWcgzMpiLo7/gbwfR81Ws8He9Tw/Wfn/4Fawg3FTTPzdB2TgeBw+D49la3ncvcI1OnWkuKMM
	kUgz/RNd7H5xuQAvuehzwD0LZufAyID2HG6RSwEuCSz2+hryOjhEEJbedqYP5yCgiZcB5Mj+qlsQY
	DiHeVqT/kiAzFJUKy2LlfrPS0DEZva1Rg1VxmgE8AMJZclMv3kr63btfN1qrDB0/eYzx0EP/Ow+3z
	wcV53cVSfOeLHU1OW57FTHjBR8dPAbxpm6DoISyqJg48VCae8rSJa+a+iSo213zgzGXnEZ35ty9ZA
	4aOE6B9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDQD-00000001i7Y-0Nl5;
	Tue, 04 Aug 2026 11:35:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDQB-00000001i5v-0MvU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785843298; x=1817379298;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qCks5QmHaWli0znQDgqe7ceH6hFdVyHKYF2/F2T/0N0=;
  b=xBZ6+giuVb6zNZ6j8mVGEI9GwQA5tmPtXmhO8EHSdzuVwOPiopujbhVk
   P18TdsUFJs6rs8yNAEnn484S8wN2NYZTtxNebQ0kS2ubWe45cX68TN1xS
   3cenwdzr38UE35P7sO3g7LWDZKGd/C3GCdmrdfOobrBSNiw6vGKyvymmm
   3dvWI+0r2GvK7NO0/9RbUbqOJ7XUSlO/nwO2ozRhIzhFCTeDIC653L9EN
   3Y3cu2PcSSwENoHawj/gmH95Kr6N9jbTPp+enj2RpapXB0qvDc2l1h3AX
   Kp6yEKaxK5d9IPIr7FjFI66xz3L6D00YNGjolZ1a0OxZRDuMc1SoXNxhA
   g==;
X-CSE-ConnectionGUID: 4xEEaEPvTgOvr5QEq3UPIQ==
X-CSE-MsgGUID: 5r93qYngSDKfxPhyB9+CLg==
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="71197889"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2026 04:34:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 4 Aug 2026 04:34:57 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 4 Aug 2026 04:34:47 -0700
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
Subject: [PATCH v5 06/17] iio: adc: at91-sama5d2_adc: remove unnecessary casts in of_device_id
Date: Tue, 4 Aug 2026 17:03:27 +0530
Message-ID: <20260804113338.261782-7-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804113338.261782-1-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_043459_126956_5BB80CD5 
X-CRM114-Status: GOOD (  11.17  )
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


