Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D78C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 06:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7ZPupAqKk5CZVK/CQ4Ue0k5HUeF4M2ZpeGOEPD1OnQ=; b=Ewxz3htPq9Bjla
	DOXcUza61AWKka74mmFqIyMGcGq9LpoQM5mg+2dN0ocizCMBkdjmxBmRGdlH5vBXWLW9QSDLekvh8
	6O0Qc4O8VPxp6SmArRlpY1THabxmaCi34+y7Aq3/W4EmuMLLhxzlZA7w+jH3mmOYXQKbuGJ4jkeD7
	bWBPnZLUxJcQBXAjTB7JBDVASwAlzMt304pcxAk5HaiDglbxGv0Rn5KoIMaWD8pKw/NHaE3tBCvYh
	nWmWka+qbYW6CbmbbJL66OaFg2XL9Bfdg7cqv7qn/zNYrmWQPYrdCbSK2/F7dOBoqFT44nlhwLqW9
	QY8PfbE9lRhyGQEpFufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkB3-00000002kzG-2PC0;
	Tue, 11 Feb 2025 06:55:25 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thk8G-00000002kTX-0IVq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 06:52:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02FE2148718D;
	Tue, 11 Feb 2025 07:52:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I7ZPupAqKk5CZVK/CQ4Ue0k5HUeF4M2ZpeGOEPD1OnQ=;
	b=GhUSxRtBnj0vU0y6JUZzwoLMI/zhGfkVr4ENF3tc+svAb6TGUl3fu3ehDPDmgcjDCAkQvN
	/koKqFqKPvzJzjkUTljbK8oIpE6gShLEpSvhprxe83Tnat3ZWKdRAIorZx2Du8iOf0r0I/
	shuUx2d2fAgckDw3RM+EGM6CI+Z2ArGeLW0H7JfqnliNHTKmbD+eqvb5hNQLbv955qfg/K
	tljAXGXM+14DIQcROM2sfJpJlgSUVfHZDbTIDYCDFnrjgEu7RbQaLUzSqgN7yv+PQ3vlgH
	FEdNw/Yu3OpcuIanseMyBFWFV7fXmxOQDojK7+Jgy8aptGiZAXvGwmFACvAdAA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 11/16] nvmem: microchip-otpc: Add SAM9X60 support
Date: Tue, 11 Feb 2025 07:52:22 +0100
Message-Id: <20250211065223.4831-2-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211065223.4831-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065223.4831-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_225232_569265_A7AF0623 
X-CRM114-Status: GOOD (  11.03  )
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

Register layout is almost identical to SAMA7G5 OTPC.  SAMA7G5 has some
additional bits in common registers, and some additional registers all
related to custom packages in secure world.  None of these are currently
used by the driver.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - Reword commit message (additional information about SoC differences)

 drivers/nvmem/microchip-otpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index bf7e5167152cb..d39f2d57e5f5e 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -269,6 +269,7 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 
 static const struct of_device_id __maybe_unused mchp_otpc_ids[] = {
 	{ .compatible = "microchip,sama7g5-otpc", },
+	{ .compatible = "microchip,sam9x60-otpc", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mchp_otpc_ids);
-- 
2.39.5


