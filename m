Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53959C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 07:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RV3fhgTUiFE5VWNVLFbOVq1Uvf+BwjLKdZ/zyjmf0I=; b=Ovqp0s2ey/5fnn
	NrrhsGHhiTHuKtv0Q1Lz2WnrJbZ5x1dgnZd0AJQ67ljcHgFAKEWbQbak7PfA/MxZtH4TUxy/6yUfR
	+g9m6pGNCWhlhAFA5exC+uqrDBMd+5VPB1SmyNMnCIqtWSj08aBEQReAA2rWs6qx1KMlzs50Ovhan
	HP0JwDdhuiyMkHRvIFicACbwwtg7n5xXoxkxWT8xJB8+snZhBo+jTbwDaWCIG/RVaKSdupiKQUJ77
	xtnuqzj2nR57iawmdCMzHiZr3go6k8E2dy6DyPQZt1VdV6ZJABrPgnqsJJH7qVq5wIV5LZeLR3eas
	/olTQ+/tfqXkdXCkj4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkGa-00000002lxS-2wCC;
	Tue, 11 Feb 2025 07:01:08 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thk8u-00000002kcx-3fTZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 06:53:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1ACE5148718D;
	Tue, 11 Feb 2025 07:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3RV3fhgTUiFE5VWNVLFbOVq1Uvf+BwjLKdZ/zyjmf0I=;
	b=Q2h4rqakGU5/WcMnFYZmntvJM+pZ32O5QvbGJjNwHAGAz4B5MW0EHIinv90QUCZeOJ3z17
	/NTCADvZN09+8K0lyXOYbnyOleS2ksX4LmZNKA9LX/1UnJ5rnmVZSNutDg2bfnU7xtyama
	zO0osD7C+03MCT8moRGLmkwCJEGB3+AgmJzNUslC5FxbOpSoY2hbLk6qs4dCKsOWzENvUc
	qbJtfM8cFcI3BFmI67mSrV9yH76uZZA4Fq2QXdCoyOmU1Ae4gJn7CjojLsBcAKXy+54dsm
	e2j0y6nwrHKTilkzkirrt0YI++2ULVUIecxCwT8LUsej8w9wugaZLtTgVGMp6A==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 15/16] nvmem: microchip-otpc: Enable necessary clocks
Date: Tue, 11 Feb 2025 07:53:03 +0100
Message-Id: <20250211065304.5019-3-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211065304.5019-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065304.5019-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_225313_074817_B8A84A45 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: devicetree@vger.kernel.org, Ryan Wanner <ryan.wanner@microchip.com>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Without enabling the main rc clock, initializing the packet list leads
to a read timeout on the first packet, at least on sam9x60.

According to SAM9X60 datasheet (DS60001579G) section "23.4 Product
Dependencies" the clock must be enabled for reading and writing.

Tested on sam9x60-curiosity board.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - Rewrite to enable _all_ clocks defined in dts

 drivers/nvmem/microchip-otpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index d39f2d57e5f5e..2c524c163b7e2 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
@@ -241,6 +242,7 @@ static struct nvmem_config mchp_nvmem_config = {
 static int mchp_otpc_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
+	struct clk_bulk_data *clks;
 	struct mchp_otpc *otpc;
 	u32 size;
 	int ret;
@@ -253,6 +255,11 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 	if (IS_ERR(otpc->base))
 		return PTR_ERR(otpc->base);
 
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Error getting clocks!\n");
+
 	otpc->dev = &pdev->dev;
 	ret = mchp_otpc_init_packets_list(otpc, &size);
 	if (ret)
-- 
2.39.5


