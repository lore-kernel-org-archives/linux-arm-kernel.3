Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3035CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YR90EkWwJSLCfMczGEB5+HrU6/Wdn0NZfB5BOFTbURA=; b=f3tzdsNwe4IBkhZQimdTfuS6kS
	jAVT9kNkkg6otWJr5gFOJ2wdaSs5FOUfjBRxStUP4dOo9cwPw9b6Jod1f/+qhKmq37v6xeSrtRZoD
	ibXE2P5zh9cCb7FNPsb8xpRqQr6Vn8qFYc3t8aqUI34Y2+Jrk8qAIzY1kBZVGn3/A7E5pT+hCXamL
	1wqRjYap17PqP+701kmi6IqV5NT7OEQfWhfBqSh10oAWbL03aeo00DJpA6q9dKlc2QSj749aTnsaQ
	mPVLkecao4wCLmrZ9V+yPcKoqa1InJdu52gxMXnGUbgrkpUpKRzzhyIhvuWGqVEVzV34Pzd3rMaX1
	mWYmkSyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEsh-00000004CYn-3Yzt;
	Tue, 20 Jan 2026 16:47:03 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEsZ-00000004CUn-10Qr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 16:46:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 190C8148AD7A;
	Tue, 20 Jan 2026 17:46:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768927613; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YR90EkWwJSLCfMczGEB5+HrU6/Wdn0NZfB5BOFTbURA=;
	b=wn2vRAPrqdP7/ry3T/94tRFINwothj+ZqrCFWA+e6JLax2OlQxP6kzwviYhuLliGhcsxBe
	zjvgfJUZxvqZ4+vMNFl487QKqDojHqWGDdrgxZIJiE2GZb7JMMWGLfjYnhpF3EDRR0MdtE
	OtMNKMsMmL1WJEpOOuO2p78+mx8W03QdzyjejyLbB5dFx64Q3jpPJZmCoX+f+11JP1magU
	5Oxt+d80fj409eA3X87e/ILvprgovwr9TWkjyuWckQpQ82SP17VlmifVHyUyk+TonVo+0M
	MC/bDmbDUj/wqRXa88yBlv7Ne7fa1a/nGzy10pFCU5S4CpYT4qzfM0iBuWQQQQ==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH v3 14/19] nvmem: microchip-otpc: Expose UID registers as 2nd nvmem device
Date: Tue, 20 Jan 2026 16:44:48 +0100
Message-ID: <20260120154502.1280938-8-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_084655_454356_4F2397E3 
X-CRM114-Status: GOOD (  15.59  )
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

For SAM9X60 the Product UID x Register containing the Unique Product ID
is part of the OTPC registers.  We have everything at hand here to just
create a trivial nvmem device for those.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - no changes
    
    v2:
    - Use dev_err_probe() for error reporting (thanks Claudiu)
    - Move required register definition over here from removed patch

 drivers/nvmem/microchip-otpc.c | 38 +++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index 34c0d7611f3e4..b35ed13b004bb 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -25,10 +25,14 @@
 #define MCHP_OTPC_HR			(0x20)
 #define MCHP_OTPC_HR_SIZE		GENMASK(15, 8)
 #define MCHP_OTPC_DR			(0x24)
+#define MCHP_OTPC_UID0R			(0x60)
 
 #define MCHP_OTPC_NAME			"mchp-otpc"
 #define MCHP_OTPC_SIZE			(11 * 1024)
 
+#define MCHP_OTPC_UID_NAME		"mchp-uid"
+#define MCHP_OTPC_UID_SIZE		16
+
 /**
  * struct mchp_otpc - OTPC private data structure
  * @base: base address
@@ -230,6 +234,16 @@ static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
 	return 0;
 }
 
+static int mchp_otpc_uid_read(void *priv, unsigned int offset,
+			      void *val, size_t bytes)
+{
+	struct mchp_otpc *otpc = priv;
+
+	memcpy_fromio(val, otpc->base + MCHP_OTPC_UID0R + offset, bytes);
+
+	return 0;
+}
+
 static struct nvmem_config mchp_nvmem_config = {
 	.name = MCHP_OTPC_NAME,
 	.type = NVMEM_TYPE_OTP,
@@ -239,6 +253,15 @@ static struct nvmem_config mchp_nvmem_config = {
 	.reg_read = mchp_otpc_read,
 };
 
+static struct nvmem_config mchp_otpc_uid_nvmem_config = {
+	.name = MCHP_OTPC_UID_NAME,
+	.read_only = true,
+	.word_size = 4,
+	.stride = 4,
+	.size = MCHP_OTPC_UID_SIZE,
+	.reg_read = mchp_otpc_uid_read,
+};
+
 static int mchp_otpc_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
@@ -269,8 +292,21 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 	mchp_nvmem_config.size = size;
 	mchp_nvmem_config.priv = otpc;
 	nvmem = devm_nvmem_register(&pdev->dev, &mchp_nvmem_config);
+	if (IS_ERR(nvmem)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
+				     "Error registering OTP as nvmem device\n");
+	}
 
-	return PTR_ERR_OR_ZERO(nvmem);
+	mchp_otpc_uid_nvmem_config.dev = otpc->dev;
+	mchp_otpc_uid_nvmem_config.priv = otpc;
+
+	nvmem = devm_nvmem_register(&pdev->dev, &mchp_otpc_uid_nvmem_config);
+	if (IS_ERR(nvmem)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
+				     "Error registering UIDxR as nvmem device\n");
+	}
+
+	return 0;
 }
 
 static const struct of_device_id __maybe_unused mchp_otpc_ids[] = {
-- 
2.47.3


