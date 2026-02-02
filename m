Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4B1E7315A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zNET4cB1sm9Qeo8/ddW/rp1W1AMGIlwYL7OuMi2rFaU=; b=FggYcQtPEPZz4d
	vSPKFB0d/AAIqEJOqlhYYYY9HceAsUwIaryg6c9jP1VZrGasMT8yy+9ypgypWy8BINw9SLROaC/8s
	QqR+POuKQ7JxTvmNQTIYJsUNu/4LiG5QZxvteKPTA7UwZ4d1Mmh5uZg3HdRVpb9VJ8KEVbOY/HhCM
	oQg+ZAscqRDRXOvh2gy6mVmoFw5gBrYLAB9SXMIZ8npZ9x33Y4YkvgLEWJ3u1IJinxKclk+ni8gP1
	KmBy5cXh+RDxm78O4d1pJXVjQs5nsgXZbIZWGhP1xGcroOXq0rPPpF6F6BJO1rwMAyx/Orrba3HFe
	jjS+0131attg5xVSLrXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsZF-00000004w3N-3hv2;
	Mon, 02 Feb 2026 11:58:09 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsZB-00000004w30-3lNm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 11:58:08 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6126IQ8K3184416;
	Mon, 2 Feb 2026 06:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=zNET4cB1sm9Qeo8/ddW/rp1W1AM
	GIlwYL7OuMi2rFaU=; b=qWmTplYa1+WkRUjluYmAeCJ19yhX805HEiuU97YZ3o6
	4C59tGrcG1K0g2a1NBevTbn6AmeBuqGgz3ON2j/bUwLm2cKHryM2NM+P0WEsqMX5
	iPAxZEdsnXsbawVgjVfHUCoZ816OgsTR7NH7EdLdLV/EOOMkc9xsOxfJk+nrYzUB
	grpnYR/u678gLfaI5ZZ/HKcc8dzkrv+A+2nxxoRUbmfWDLxUHXa0pFDOUqigSv8z
	i8wd7sIn0jZxXPaGAl1JLKBZvWNMHoLArO4n0LK/8qBmBjFmSXqABy457jG8pxgf
	c9377C4CEnvkil0x/Tc5SCXOTSc9N2VZq5g8RCQueLQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4c1fh4xb1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 06:57:53 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 612BvqYW052150
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Feb 2026 06:57:52 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 2 Feb 2026 06:57:52 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 2 Feb 2026 06:57:52 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 2 Feb 2026 06:57:52 -0500
Received: from HYB-b1tGeUj4GP1.ad.analog.com (HYB-b1tGeUj4GP1.ad.analog.com [10.48.65.247])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 612BvblC005712;
	Mon, 2 Feb 2026 06:57:40 -0500
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Jonathan Cameron <jic23@kernel.org>,
        David Lechner
	<dlechner@baylibre.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Antoniu Miclaus <antoniu.miclaus@analog.com>,
        <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] iio: adc: at91_adc: change at91_ts_sample to return void
Date: Mon, 2 Feb 2026 13:57:30 +0200
Message-ID: <20260202115733.21382-1-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA5MiBTYWx0ZWRfX6y9y6Vefcfcj
 RdOuXmN3I6zdGe3tGO9RHY6BH/btbVR1lA1XaevhdzgGyMHNJeLiNcrtHbjeKXXHvj6X1DEcNHS
 sN2zvQ7pJ8Ih8LlvGa67B3ka216o0b0pChafSa2ysPKTEGkWSdCRbVp51AlQmJ5d4rhNraf5ceB
 Kzm5PyfSqRbJu1XoIz8K2EKR6Az31q0xMi99Su2WgWeeEjVfOQezAPlGP5w/pXc86IvkCD0Vjf6
 holXggAyYd9SmGrqFpDr57ajV/MfxMJzKNpp/3Ushw+oUOUYdPItprEricsBBaXh0z7XQs0spGj
 7c5y4w7gMbHB86ZBD4XNl8EK3BFRjKn6a0PdCxwaWs95UAOPp2hqNpCYl1GM2Ufmt2b63cVDlxz
 WGItVwkTjkhUWBXdqsal3v93H7YszhUq54QzG7VgZYog0DWfLyghgG6sjDA6vdMp71yTtykm7ie
 WC5eqZagNEYV+dr0Rnw==
X-Authority-Analysis: v=2.4 cv=Vqouwu2n c=1 sm=1 tr=0 ts=69809141 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gAnH3GRIAAAA:8
 a=oSRCIsmF31W-FNxCO44A:9
X-Proofpoint-ORIG-GUID: oT70BiQzE0EpJPr0YB5BDBmaZFLWcv6g
X-Proofpoint-GUID: oT70BiQzE0EpJPr0YB5BDBmaZFLWcv6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_035805_967603_6B022A47 
X-CRM114-Status: GOOD (  15.47  )
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

The return value of at91_ts_sample() is never checked by its caller.
Change the return type to void to make this explicit. The error
conditions are already logged via dev_err() which provides sufficient
visibility into hardware issues.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
Changes in v2:
 - Changed return type to void instead of replacing -1 with -EIO,
   since the return value is never checked by the caller.

 drivers/iio/adc/at91_adc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 920dd9ffd27a..8942d15b3978 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -304,7 +304,7 @@ static void handle_adc_eoc_trigger(int irq, struct iio_dev *idev)
 	}
 }
 
-static int at91_ts_sample(struct iio_dev *idev)
+static void at91_ts_sample(struct iio_dev *idev)
 {
 	struct at91_adc_state *st = iio_priv(idev);
 	unsigned int xscale, yscale, reg, z1, z2;
@@ -323,7 +323,7 @@ static int at91_ts_sample(struct iio_dev *idev)
 	xscale = (reg >> 16) & xyz_mask;
 	if (xscale == 0) {
 		dev_err(&idev->dev, "Error: xscale == 0!\n");
-		return -1;
+		return;
 	}
 	x /= xscale;
 
@@ -334,7 +334,7 @@ static int at91_ts_sample(struct iio_dev *idev)
 	yscale = (reg >> 16) & xyz_mask;
 	if (yscale == 0) {
 		dev_err(&idev->dev, "Error: yscale == 0!\n");
-		return -1;
+		return;
 	}
 	y /= yscale;
 
@@ -363,8 +363,6 @@ static int at91_ts_sample(struct iio_dev *idev)
 	} else {
 		dev_dbg(&idev->dev, "pressure too low: not reporting\n");
 	}
-
-	return 0;
 }
 
 static irqreturn_t at91_adc_rl_interrupt(int irq, void *private)
-- 
2.43.0


