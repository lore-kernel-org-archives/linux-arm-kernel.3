Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55EAFB5188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 03:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e/TQHykLdF85VtC6CTJ2wonciXUmXtr/iGFz2p1d+iM=; b=f7OrwgUUhIpHUJtpiUVohFus/5
	QGm6/bPhtJH9gszfc7kchwqWXzliY9VqfIN/5Na9O8XFEdd+IKh5oSQdJtDVBfoBLGl+huRUkgVNH
	Qf6ZbCc8nYurqSK51Vdl1LwDEjF0q5cXTx/juLjMl/EkDXvd8PCu270tGBi33lkL7mRCh4OAe5tX4
	4msLRuqIqT/Baqfyf+gniWKf5OFzWXMOpX5Fq5vnkz96+FE1ZRVYh2irYKDP11MxOCXhGQj0ViWgl
	5E835Ag6pQ87lr7N79Cn/KDkHhMbbD4KoZa61SEB/kr8BiQ/wiSlV/BYfagiHZ55EWD8Xp1BgiSFp
	aWZv3HpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xTo-00000005qsz-2HOw;
	Tue, 07 Apr 2026 03:51:56 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xTl-00000005qsc-39c7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 03:51:55 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-50d6b9bca48so58729011cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 20:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775533912; x=1776138712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e/TQHykLdF85VtC6CTJ2wonciXUmXtr/iGFz2p1d+iM=;
        b=l2eZYHN6qlmsgcROonRobY7Rr5FaG06xtPpy5rj5kCqjhRkVUIQdRPeLGBpcHbZhHd
         XlCd6/xY+RJAkV1Hxrd6JKKWmB3ia9QO5uFAQhxKIRAjsZqdxFM7Af5YAtKhf5K4P+vv
         2JHsK4fBq+Qx9vbh/xK5xhtVKKhFXikcRCm2YI1b924YtjMYyP7Ch2XBvMtHhTfEocsg
         4ri7eWkDtfOPtz7CylfxaElNGflzURQ8OkBd05F2oExqfgHBkq+aYjgxd6aZ9BYjeho2
         ABLpGtdHQQiGQyHj/aY+5OgpjX83bPP2Hh7J3FrF5C8tTbPlJaZvguuyHV9RFLnWSlNU
         spcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775533912; x=1776138712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/TQHykLdF85VtC6CTJ2wonciXUmXtr/iGFz2p1d+iM=;
        b=MErw6g0OMr2ik/LQBu6HjVJc3UugkYQliZ4JusgRzVUFdsvNcO8otAQQZvSQ9R0ouX
         51QdrvfpbZYo0ibHoH/F/hj70jJLIym+W2ysCx7oI0/EeBUoUS3f8ss3HkB+rA6/J36W
         fR1/ezw4of3+8MXaFE6DmpatGrEc57PWnhLfvpKkJBpvRNUhCDNzj16Nqyt8zRsrRd1v
         mkljLxV18D8xgtCQHMuka3jGnCGViDNjzitZLrOGQvoRwa17MJoGwSNHgtTzebvZIuib
         Rwag8iiJpIU9r0ycXQPTea05h2RoT519IgqIvbRroxJUUhKl4LU710hZp0vWMmUFVKDP
         Kd0w==
X-Forwarded-Encrypted: i=1; AJvYcCVL2Gb0FWjvCrGwWLihql2Hb5bdSCnTZLUDhk0Fi/uKKIEOLcOXMYIPke+lhfP+tACc5LhqmppPD4tEjMgHEmB1@lists.infradead.org
X-Gm-Message-State: AOJu0YyayEItiOIQYeHa2r63F6ALpZAP3vgHEr1DEPaC3fLf5OxOKfBk
	riJFsWFwa+d6GM9gJTtn4xGKJUnJ/uO7AWGu/zcaZCARrMv/Qu7RgUc5WIygyw==
X-Gm-Gg: AeBDieu0weBzgYy0eu9qaQNOuBRykNSxuRmlmjAyJT4cvnQZeu8g2q5cYB2H0+3cgpj
	ihII538+J8z+n6+vBi6hAbr0bVtn7TJB4/d/VMuRjHFve99EihcgKaMQHuYl5tcmblPRbu7U4LN
	+UiL3Suxx7Tc0xLHP/pwx8cmSNHJg32r4l7ArIDGkJJhtPak0z3pd/1Mxfe/g9tefZHlvrtdMIH
	B4Z87VW5LtuzkcQzKdEM6jRa/Kr4g6r5etJLK/PglChuSJp0XonjFEQjRBF2ivhTxPWDRwx7+gm
	MmNyCivBEzVzHRfZRjSgkLsI8Y8niArZvmnChLMIGjEwR4qdoQPsVIKJ0Uphi125aU4t1CU2Kbs
	NcaoWLytq/TpvdFlkXFAckWNwhv2Oht2YifJZDeuqNlkEXNoyxmGxgQaeYZciiKwy/QEDmGWgz6
	pAJn/+k8AU+IT2aKjm9vJZHlcn7cGPwG6yR5l8QvK05oS/zf+CTB0pJOA=
X-Received: by 2002:a05:622a:1247:b0:50d:8389:c3f3 with SMTP id d75a77b69052e-50d8389c6c4mr146678471cf.54.1775533912203;
        Mon, 06 Apr 2026 20:51:52 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d82afc7d5sm77280341cf.30.2026.04.06.20.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 20:51:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC18XX ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] dmaengine: lpc18xx-dmamux: simplify allocation
Date: Mon,  6 Apr 2026 20:51:32 -0700
Message-ID: <20260407035132.99037-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_205153_896522_A3DFF9BE 
X-CRM114-Status: GOOD (  13.27  )
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

Use a flexible array member to combine allocations. Requires
preparation, aka reshuffling before the actual allocation to get the
proper size.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/lpc18xx-dmamux.c | 42 +++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
index d3ff521951b8..5dfefbc496da 100644
--- a/drivers/dma/lpc18xx-dmamux.c
+++ b/drivers/dma/lpc18xx-dmamux.c
@@ -32,11 +32,11 @@ struct lpc18xx_dmamux {
 
 struct lpc18xx_dmamux_data {
 	struct dma_router dmarouter;
-	struct lpc18xx_dmamux *muxes;
 	u32 dma_master_requests;
 	u32 dma_mux_requests;
 	struct regmap *reg;
 	spinlock_t lock;
+	struct lpc18xx_dmamux muxes[] __counted_by(dma_master_requests);
 };
 
 static void lpc18xx_dmamux_free(struct device *dev, void *route_data)
@@ -122,12 +122,30 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
 {
 	struct device_node *dma_np, *np = pdev->dev.of_node;
 	struct lpc18xx_dmamux_data *dmamux;
+	u32 dma_master_requests;
 	int ret;
 
-	dmamux = devm_kzalloc(&pdev->dev, sizeof(*dmamux), GFP_KERNEL);
+	dma_np = of_parse_phandle(np, "dma-masters", 0);
+	if (!dma_np) {
+		dev_err(&pdev->dev, "can't get dma master\n");
+		return -ENODEV;
+	}
+
+	ret = of_property_read_u32(dma_np, "dma-requests",
+				   &dma_master_requests);
+	of_node_put(dma_np);
+	if (ret) {
+		dev_err(&pdev->dev, "missing master dma-requests property\n");
+		return ret;
+	}
+
+	dmamux = devm_kzalloc(&pdev->dev, struct_size(dmamux, muxes, dma_master_requests),
+			GFP_KERNEL);
 	if (!dmamux)
 		return -ENOMEM;
 
+	dmamux->dma_master_requests = dma_master_requests;
+
 	dmamux->reg = syscon_regmap_lookup_by_compatible("nxp,lpc1850-creg");
 	if (IS_ERR(dmamux->reg)) {
 		dev_err(&pdev->dev, "syscon lookup failed\n");
@@ -141,26 +159,6 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dma_np = of_parse_phandle(np, "dma-masters", 0);
-	if (!dma_np) {
-		dev_err(&pdev->dev, "can't get dma master\n");
-		return -ENODEV;
-	}
-
-	ret = of_property_read_u32(dma_np, "dma-requests",
-				   &dmamux->dma_master_requests);
-	of_node_put(dma_np);
-	if (ret) {
-		dev_err(&pdev->dev, "missing master dma-requests property\n");
-		return ret;
-	}
-
-	dmamux->muxes = devm_kcalloc(&pdev->dev, dmamux->dma_master_requests,
-				     sizeof(struct lpc18xx_dmamux),
-				     GFP_KERNEL);
-	if (!dmamux->muxes)
-		return -ENOMEM;
-
 	spin_lock_init(&dmamux->lock);
 	platform_set_drvdata(pdev, dmamux);
 	dmamux->dmarouter.dev = &pdev->dev;
-- 
2.53.0


