Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270C1CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 20:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yX/9xC1BB29XKcsi1gHnIwdtNtc2m1SRNjsZRYQWmUk=; b=wTXJeFmAuhIAKChZPZH1jREOSc
	yw8JoUWNvvF6uNITjVKe3jqDXEBDP/eB8zbq0pQoznsfXX3yFb41lNJ8qGSVUXDb4QYHbjZqJim9K
	xXIEAjkgJpZEoAGAdJoAnQPXsdvzG1cuFcEVmShN+xj/5Uuj3WpenP6TNvpYCylCc9Do2OqZc+R8Y
	/+MR+5811++Jjewv4J1fTlU36yvOCdvL7QNd3oH/61qm5hMK3w+WxUNL372TaY2UN23AhtAy+L7oX
	nT7i3iajecBLpGlmyxdimY7R2GtRvzeCwY9CsnZmsx254qmcSjNBeYcnjnKS5AFDkUF1hf6JqrVvp
	416yu3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjkB-0000000CTOq-0JsR;
	Fri, 02 Oct 2026 20:20:35 +0000
Received: from mail-qk2-x1f.google.com ([2607:f8b0:4864:34::1f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjk8-0000000CTNH-18Xz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 20:20:33 +0000
Received: by mail-qk2-x1f.google.com with SMTP id af79cd13be357-939ca12ab70so931541585a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 13:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790972431; x=1791577231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yX/9xC1BB29XKcsi1gHnIwdtNtc2m1SRNjsZRYQWmUk=;
        b=Ncik68Bh6+gdnEjvtWGUoXc8nBQ+/aC3Twq9R+9pox25j92qpreP9DSanZ1C3ogNIL
         E3gLqtSVg60w5egBDM3Yyq0sGN07iwr95CGSrGmPN2nJBuKvwrHEk7rXVMPLO1K3mG4E
         5oVA+TcxTR3CtI1WGgpuBuIMpruiC7GmkqqQIkrprtIsxukxHmEwxSOIzYFaHDARRQrD
         PtoaFkoiORHN63ogcyGyLCP586Q6fBLjVU62m+gNe2i0STGRbQpP4XqQTWzsD5wZNDHX
         TLgqzbKRH1mfaISc+qBbOlBDG+wAA9Q/vLCHi+xVabTiOpLRxKT1T8/R+ZG93cRhUcsf
         8y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790972431; x=1791577231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yX/9xC1BB29XKcsi1gHnIwdtNtc2m1SRNjsZRYQWmUk=;
        b=CDPPx615Y8oJOI0roDKS1cpV6FLTuTB9QOM4s4+vm+YlYzaAegb+3ubrgL407NbNC7
         3DN1RTjgInSFDhuBRX2tWMBFzDsPA8hJ9Zg8+QztYvXjY1tryFxqfy1+++i+JMUmgbU+
         TRtIfESuJloOl4u5LUhMf6H5PENPX52dqKzOfzjDJoko5nvF7tIeFfiDtcR1PDiR72PW
         jq2HqurdBekIjoucFkxKp5+jE1kUttps5kcIKhWwCinGJsg+SXU7Fqpb/xBqBN+yO2HF
         asusJfs03165zWPELT4DwYlso+mwIcT+tztJuiGCXb1TkJX4EZo7kIRByhdgWlu0QB06
         xYYA==
X-Forwarded-Encrypted: i=1; AKwUvBy/aG8YtmlRTBePsECv402PqjOLcsURg8zI08pV71miswsDE8MIvGkIf7s91cHQrP5lBOpG13zf6xYDBEN+RYBe@lists.infradead.org
X-Gm-Message-State: AFuF++lIkjZ1QrCB4wFkJPjP2SHBdwsV8H/Jlh57+LQ2pRP+2ouyDfgp
	MwcWlDtsMM0byHctd6SZXuKpKJeO4m4wv1U+Na+QcwcR4O4imeBMkyI=
X-Gm-Gg: AYBFou3FF0yz7FQvNBz6X6nKoNuJ77sBo2f0xBHhwyib3Zqtkx8p8t7YqCNPwIN/gfK
	+s+AFGjIB5weaGPgDPJXwdlrtTLYDMoPMdoibtjymgCbpQkG+aNpEr9RIF0UNHy2QNWvoGC7+uF
	q9D7z2iwyx0L1bRWZHIfc1CbfKQ2F2aB5lFbaIs//qYJC7T4PZ2LD3mXGrEI+43NZxYY5OKVEQi
	m1wTNXs0rCkpxDr3epz4CBEuP5ydst+p1Rs8kcZ/EroXl3pcFvxsWqESOOXbkVNa+sGhZw+S0Yi
	v7VNqrxgrsGio4Qfgt8Fm5mP2RurJXW3oyHNl7EGINIbt4VQTo+OuHrafAEonYXF5JguXB5rXGj
	Tx5qaLMn7Hb4PXCJQR6+zeSi/7KrVadaRsfQSmvRGwRWcvmVrDPFjEKuUUXgg4waSBFldxFeMw1
	Ra6T3U1njYGDjywkcTASvhnWaF7awthJjhbZzNqm5b25QFMT+HEBlrODaL2iCFgTeHQ+5p+B1oH
	poLS7jIxaiUfirqLFCxpjXbUNbkRMwnAMbLdNugc0YAfXdlQgzk5BKNuxBj8NSYyfsRxYJeRfPD
	n+dV60PKIrL0bUwEnTExTYd3P5kV
X-Received: by 2002:a05:620a:649a:b0:93c:c405:3215 with SMTP id af79cd13be357-93cf17580abmr702882185a.44.1790972430750;
        Fri, 02 Oct 2026 13:20:30 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a63d8sm305025585a.12.2026.10.02.13.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:20:30 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] soc: mediatek: mtk-devapc: release IRQ before unmapping registers
Date: Fri,  2 Oct 2026 16:20:28 -0400
Message-ID: <20261002202028.420575-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_132032_321679_1B1FC82D 
X-CRM114-Status: GOOD (  12.80  )
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

The managed IRQ remains registered until devres cleanup after remove
returns, but remove explicitly unmaps the registers used by its handler.

An interrupt handler already in flight when stop_devapc() is called can
continue accessing ctx->infra_base after iounmap().

Release and synchronize the IRQ before unmapping the register region.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: c9c0036c1990 ("soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove")
Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index f54c966138b5b8bda32c383d179a57c78172bf52..57ffe49c99eeb9b0989bd5eefa557a0a7dddbf18 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -54,6 +54,7 @@ struct mtk_devapc_context {
 	void __iomem *infra_base;
 	struct clk *infra_clk;
 	const struct mtk_devapc_data *data;
+	unsigned int irq;
 };
 
 static void clear_vio_status(struct mtk_devapc_context *ctx)
@@ -289,6 +290,7 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	ctx->irq = devapc_irq;
 	platform_set_drvdata(pdev, ctx);
 
 	start_devapc(ctx);
@@ -305,6 +307,7 @@ static void mtk_devapc_remove(struct platform_device *pdev)
 	struct mtk_devapc_context *ctx = platform_get_drvdata(pdev);
 
 	stop_devapc(ctx);
+	devm_free_irq(&pdev->dev, ctx->irq, ctx);
 	iounmap(ctx->infra_base);
 }
 

