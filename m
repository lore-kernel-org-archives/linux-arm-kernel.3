Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC57C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zdo1eCOF4VOtCudJbd1E6new56U7OZpmLHyb1jyPiLQ=; b=Dnxt7ogyPhbfo6sB6srvd4WAT+
	FbdgY+lG6shFUQqtffWcS+/F+AGcq2i/YHebj7iv0LPH2d4PdTduIx8IzcsJi66XqhUQXNWftZ4vz
	mW/YbeL9EU6aTyn4pveavWWm/2WAYmo9cRX8+FhsxKHWz4JbJt0BZ5NJJ+FTW5+qXCT9+wAPC3/pP
	MSDBa31ITYrnReO2IEm3pksM1Qrs9cn9OBEGmNFGMJB9yLnckV+0UUK90M6ccq5ERT9MHFhIevWn0
	z4cRuaCqIyye9lD/eIO2xZKu3DtvUsFoHLSofvto/ca9GGP7SgIFSKdY7LH6+PXzZu1MoNoinRw8r
	nmfyWkHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6Qy-0000000EIxB-07Cp;
	Fri, 27 Jun 2025 10:35:52 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV67F-0000000EELj-2Kcj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:15:31 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R9RL6N000707;
	Fri, 27 Jun 2025 12:15:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Zdo1eCOF4VOtCudJbd1E6new56U7OZpmLHyb1jyPiLQ=; b=EInUqIPChS2tXgag
	fN1JsGh7PmOZsYCv5wDkuBgNh+fF93d3i9XC9uV0Hh8jD4eVPtYoMaFIrTI47oaw
	J5SxUg/LgzH0PLSn9lnuTDzJDN0lQ7Q16TdEItZ0OjAO5bnUiq7i5cGNKOF8cs55
	0bOHLDKNiDaNQbBQXEkX386Fnx/IZlbEIVaH6UUd8w0KEoU+/TPGVdrEsVUsYXv0
	TqtH7hoCIDwESXbQOoeYKSCHJwX6kapve7paMIZLtob/OHzaIJfMJIOhS4TA4iHn
	0TWRn9fIgblDsyKWdFOaP2PhA3EIGdvaerWnNCD3s8jCmR2dIp/S/oq80ntUbrco
	ViL2kA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm33uktv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:15:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4E8E840051;
	Fri, 27 Jun 2025 12:13:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE244B423A2;
	Fri, 27 Jun 2025 12:12:58 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 12:12:58 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 27 Jun 2025 12:12:57 +0200
Subject: [PATCH v2 2/3] i2c: stm32f7: unmap DMA mapped buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250627-i2c-upstream-v2-2-8c14523481dc@foss.st.com>
References: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
In-Reply-To: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "M'boumba Cedric
 Madianga" <cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-07fe9
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_03,2025-06-26_05,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_031530_231549_63234D0A 
X-CRM114-Status: UNSURE (   8.60  )
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

Fix an issue where the mapped DMA buffer was not unmapped.

Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index e4aaeb2262d0..042386b4cabe 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1554,6 +1554,8 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(struct stm32f7_i2c_dev *i2c_dev,
 	if (i2c_dev->use_dma) {
 		stm32f7_i2c_disable_dma_req(i2c_dev);
 		dmaengine_terminate_async(dma->chan_using);
+		dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
+				 dma->dma_data_dir);
 	}
 
 	i2c_dev->master_mode = false;
@@ -1622,6 +1624,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 		if (i2c_dev->use_dma) {
 			stm32f7_i2c_disable_dma_req(i2c_dev);
 			dmaengine_terminate_async(dma->chan_using);
+			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
+					 dma->dma_data_dir);
 		}
 		f7_msg->result = -ENXIO;
 	}
@@ -1642,6 +1646,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
 				stm32f7_i2c_disable_dma_req(i2c_dev);
 				dmaengine_terminate_async(dma->chan_using);
+				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
+						 dma->dma_data_dir);
 				f7_msg->result = -ETIMEDOUT;
 			}
 		}

-- 
2.43.0


