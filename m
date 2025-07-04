Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B9FC83F0C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgoDMkiMUHk+EBU8CkARm75mSZLtYpIM4Qjcl0JBQBc=; b=1Fo9DOK4W8UY5sDn5amQZfNEjM
	kpozYwF92PMLoe11Qq1uePd4+4cDPx2m1YUJBThnxt/CLDfJz56kQ16AuncF6Zr8uT5fiU1fT6bla
	vJv64+j0XZSCG4EmD3dZQK/bAnhhMNPIqzJ2QvVuwHsVOPUdGuo1SyfstRAZu56pjvfzDIfvzoZYR
	f5bv/D8mv+i7ghsMZkpwJUENN0S4mhT6yuwfqlZLexUALcXeCtC29m/mBe0eIYnJQ0kawM03ohP8F
	OBK7x795hceNU07uJhYGuOtFkEmi9afVOIUXsBESl70ibC0CaK6t/bt5WSXPMVdq0NUAtSriq/nf2
	4p5K+iQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeUE-0000000EC7e-2Tdv;
	Fri, 04 Jul 2025 11:21:46 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbzY-0000000DlyM-2aUQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 08:41:58 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647Zri2028234;
	Fri, 4 Jul 2025 10:41:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	cgoDMkiMUHk+EBU8CkARm75mSZLtYpIM4Qjcl0JBQBc=; b=jg8HObSVt9+kCgyh
	RArNtuTm17TbJNYsK/+0X/DEGGKA3cWUwz/nil05Kj8armM9uqqy/k18JvPEjadn
	Iut3Yrl7nOJpV0ygQcCpAAhBUeoEqEnGTq09kZ5mQJwYo9ymu6vE38JK6M1z19zT
	2Med9uWLlLacPa+KD+vPVyyl/fPv2dpfU7jYVYct21SrVW+m3IrP4fdO3k71kIKN
	Tkm4BlEwdgddfkSYs86VpXT3i9tG+6AWDRcOdDLPjrMcL++X7Li2jV8unHFj5zIn
	1jWhXZq3W4r49MLhGJl6FXxnlfkqmtX9lUHhTqhUh/T2G/79/iz1tUmVGXyVQat2
	gX/Dew==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tmmaph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 10:41:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 98D5A4004C;
	Fri,  4 Jul 2025 10:40:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B39E7483152;
	Fri,  4 Jul 2025 10:39:38 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 10:39:38 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 4 Jul 2025 10:39:16 +0200
Subject: [PATCH v4 3/3] i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250704-i2c-upstream-v4-3-84a095a2c728@foss.st.com>
References: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
In-Reply-To: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
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
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_014156_946610_69D5CEA3 
X-CRM114-Status: GOOD (  13.10  )
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

`i2c_*_dma_safe_msg_buf` APIs operate on a `struct i2c_msg`.
The get operation make sure the I2C buffer is DMA'able according to its
buffer length, or if the memory use is DMA coherent for example and
return a valid pointer for safe DMA access to be used.
The put operation release the pointer.
Prefer using generic API's than relying on private tests.

Acked-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 73a7b8894c0d..994232646789 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -741,11 +741,14 @@ static void stm32f7_i2c_dma_callback(void *arg)
 {
 	struct stm32f7_i2c_dev *i2c_dev = arg;
 	struct stm32_i2c_dma *dma = i2c_dev->dma;
+	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
 
 	stm32f7_i2c_disable_dma_req(i2c_dev);
 	dmaengine_terminate_async(dma->chan_using);
 	dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
 			 dma->dma_data_dir);
+	if (!f7_msg->smbus)
+		i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, true);
 	complete(&dma->dma_complete);
 }
 
@@ -881,6 +884,7 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 {
 	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
 	void __iomem *base = i2c_dev->base;
+	u8 *dma_buf;
 	u32 cr1, cr2;
 	int ret;
 
@@ -930,17 +934,23 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 
 	/* Configure DMA or enable RX/TX interrupt */
 	i2c_dev->use_dma = false;
-	if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN
-	    && !i2c_dev->atomic) {
-		ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
-					      msg->flags & I2C_M_RD,
-					      f7_msg->count, f7_msg->buf,
-					      stm32f7_i2c_dma_callback,
-					      i2c_dev);
-		if (!ret)
-			i2c_dev->use_dma = true;
-		else
-			dev_warn(i2c_dev->dev, "can't use DMA\n");
+	if (i2c_dev->dma && !i2c_dev->atomic) {
+		dma_buf = i2c_get_dma_safe_msg_buf(msg, STM32F7_I2C_DMA_LEN_MIN);
+		if (dma_buf) {
+			f7_msg->buf = dma_buf;
+			ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
+						      msg->flags & I2C_M_RD,
+						      f7_msg->count, f7_msg->buf,
+						      stm32f7_i2c_dma_callback,
+						      i2c_dev);
+			if (ret) {
+				dev_warn(i2c_dev->dev, "can't use DMA\n");
+				i2c_put_dma_safe_msg_buf(f7_msg->buf, msg, false);
+				f7_msg->buf = msg->buf;
+			} else {
+				i2c_dev->use_dma = true;
+			}
+		}
 	}
 
 	if (!i2c_dev->use_dma) {

-- 
2.43.0


