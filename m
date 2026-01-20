Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA67CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kj8j1lSiFNV6ItVP/sSK3Apkmi5cG5J6MNdKKWb5RxA=; b=b8aBQe6HIyX95GjGTA+2+fDsxd
	hY3xAGFe0fLH/y8cSmjn8+RCC5EkuDwqPy9D+a93K3khLK3mo3RA1XhHbXS/sGucDOS3kGtt9CUf9
	GOKAqGWZ0PtKS0fUyR0PppRWZ9ivqAIE7Q5zOmqCilN6PmPAGJFc+bNyH/zog+Qqfht4VYBq6J+av
	f1pshfdhzTdOiSID0vdb/zLPZ0KgAnZqMVXpbHUq1senF5F8oE7qkZ5Cag8hgn2VMReCnlGI1zGjM
	TT3nyhBnRxIEZT5bEDbBHpwIFzqyFT6rCvsZq9EBojrxowzUP291UTaMYOmx9Ashs84OwQXuYbRqh
	MEQ9YVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEsb-00000004CWI-3AxZ;
	Tue, 20 Jan 2026 16:46:57 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEsY-00000004CUk-46ZO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 16:46:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23B7A148AD75;
	Tue, 20 Jan 2026 17:46:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768927612; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kj8j1lSiFNV6ItVP/sSK3Apkmi5cG5J6MNdKKWb5RxA=;
	b=T1Yyb6qIJr0P3oXL6s19AD1RXrZqtP8PX91Ltp/gfeuDnTRVVqcNmZAWbPkvLeEmdmHNkG
	T0KfXaS/s0/cafX+kFzXDKNJTS1mxDUTPkZdlV2WnOEkXdJhGzGbwU32qUPwJiZkm5F/IZ
	t/N0nOlu2dJmKJ7YGpUAaD/KFXftSfOw1C3h3RISv1eVDq7ztal3509T/6TOwPBPaE4eZI
	hdUwrlko34l71tx24ilW8aQNoBkdPmd2NRtWgtNAOWfVvYKEBSfX1l8d5mj+Ttt//CfQVp
	16vDhEfcB6lJ8K29rp/AUAG4G5OzWWRFq42SkWwqqWptXQExw0OHtVV0iRDGbQ==
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
Subject: [PATCH v3 12/19] nvmem: microchip-otpc: Add SAM9X60 support
Date: Tue, 20 Jan 2026 16:44:46 +0100
Message-ID: <20260120154502.1280938-6-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_084655_173363_A2522291 
X-CRM114-Status: GOOD (  11.66  )
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

Register layout is almost identical to SAMA7G5 OTPC.  SAMA7G5 has some
additional bits in common registers, and some additional registers all
related to custom packages in secure world.  None of these are currently
used by the driver.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - no changes
    
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
2.47.3


