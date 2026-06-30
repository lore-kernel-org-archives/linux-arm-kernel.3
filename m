Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDB4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6bh4jBEphMG7ihkZ16kaaoOAnDIWxUT6Wo00wnq5q+E=; b=KNKahHqDO7UKYlGrcAnMluYexB
	ZBuqb1ZIHL+kmO51UyiaJ04NStjlnPo6czSz8yKJSwZzk1/uPSpBm2OZ+f8IeybcUn6lCbk/GMQNB
	dWdzKZb7VNC6sByUgub4tYohvy1Gzt1sLmes73mGmIMV8WY9KB5KIxfJo9H7dOqOcyFWRHUxoS8ZT
	Wd3My381/JDevw9/C3/sSIgSPGmXEeV4+FIu+1Aneg6/B2REnkC8lxpIG0B880H/MRu33LmhdcpZt
	txIYWT2wcGVMCbI93t7mBRlbjA5ReJR2afnpNyr/PyPuqsjAFrnZq13U3Gmg1ZhbL6ii4nZV+bqK5
	L8OPjJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWKL-0000000GnXL-0625;
	Tue, 30 Jun 2026 11:08:29 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWKI-0000000GnW3-0p86
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:08:27 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-37fa53bc22dso2893488a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 04:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782817705; x=1783422505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bh4jBEphMG7ihkZ16kaaoOAnDIWxUT6Wo00wnq5q+E=;
        b=ohdN5ItcHvxSc5IcUajxcN7Myrotg/sPPJVgt5lTDMXBNY6DoI2ZfOnxucGsx/4dfE
         unAZLWgC18zSUKk9Adv5yYCgQX7Ftaa21yD+vaPZoYdoj4zJpm8FCVfxECWpC38XC8XO
         YVLglrdDnTiLSA7R5LsrH9BHag79KbQLtew6cmWtYPYj7ta6Vzbflj/wWQI79H3pNeKa
         LbJfs5S4pnCq80RDRRTB/vX1E+UfQNRplA7sndp1u6eI34fXNIzwVfyZKXrFNuEhyK2a
         aDbzG4M+P0Rfrny/RjgXrDTMSwiCXgaLg3+tU4wLtA4vorZtpXgT9BvzVyH+UrZ1IoIr
         2vMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817705; x=1783422505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bh4jBEphMG7ihkZ16kaaoOAnDIWxUT6Wo00wnq5q+E=;
        b=Y3eVQia+sSx2DVJcWV17s+NPGdA2tQbB7S4j0ehakFJNQtFj7yeVKy1TXTQt+PlEiu
         YOXNkd10tANiTSCciTkJlD+CoUv8Wb8Lm5nl652OUVqGLfk0gqD0pXeG2wsD90S4i80s
         wXRqxdRNC3U/ZGmgHCdI7qoz0P2ktt/h0B8IbaM4K+l2XfGyQRIAYsNAk4MIyqqjszSF
         nD7mxA4zRSrZDzweSRdE3ROae/lVnJfD30idCQ4ElViIcPMSESPSQowZG0oThNKK2sJJ
         yhi+OCEF8RAwGIjOoGQiBXt00/68aFZWiWkAr3pAA5ZBdFGpKLQfagQWtnHQmpfjtMbk
         j6cg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2oFIQyREr8h2PwuytrxR8L5dNhSlSQ/nC+NLaxSYSX9jni98HGKxzoDVIz6D4ptDvluGGqllJXGI6o4hzefsj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5dyr7pmNoRAeiNnnz43tUtm7JQljKHrQg2y5yFrDidzxR4J4e
	9cPscluZ5s2ZPICfzkIiaU3Yh3ZlnQRk70ux6BMFYWWC2+0dMOvUSi5cA4qN5w==
X-Gm-Gg: AfdE7clpO7Fy0sOql0lbNgaVS6S+vGVFRJHiGYduJqN/p3CjnkoxzFDGfGjcNfylqVF
	85HfoAe27Te76Gplh3ccJCzsI0w1YfVM3XLdCbi33e6SDlWQ9JnLcTci0/76Y7LRHsD7P5FYfme
	R4YpMB6xFDiZ1//NwZD4IHHBujpeF6/BLfcPynIxfIv9HwYuIc20s47sX5uNRE0r8PrbYdO4G88
	RAibCDjmAl15hcnIJfp9aLqZlHQD1Wzz4umyN3TSwxSJUOfhvruxFcj0ZE8R0GH3gwufC7ettaV
	uxzKB8USV6ndxsDDMOwn4YV4KsfbGl5hKwFjQSiL8Rzt1fzQCkooUmaE/9P+widl88qpkXxUr2c
	t58cRGOBLZNidC/t5ZHn0I6lsO3mWHTFqKWc+5DKoCe6Gdz2ZAOfLqeQkGNFMXyO2ofOCrf2D+w
	lNyj1fN9MWWGw4EN6j47BrGxOowMOCd0qtAWzvx5LsTA3E23rwqOLhKN4yow==
X-Received: by 2002:a17:90b:3bc7:b0:37c:6505:e7c3 with SMTP id 98e67ed59e1d1-3805273970amr2295663a91.22.1782817705202;
        Tue, 30 Jun 2026 04:08:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380532b020fsm1501738a91.1.2026.06.30.04.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:08:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] i2c: mt7621: Use dev_err_probe() for clock acquisition failures
Date: Tue, 30 Jun 2026 18:08:09 +0700
Message-ID: <20260630110809.559134-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_040826_237920_210640F1 
X-CRM114-Status: GOOD (  10.49  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when devm_clk_get_enabled() fails. This correctly
handles -EPROBE_DEFER while simplifying the error handling.

No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..8b0407d70c4c 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -280,10 +280,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->base);
 
 	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "Failed to enable clock\n");
-		return PTR_ERR(i2c->clk);
-	}
+	if (IS_ERR(i2c->clk))
+		dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk), "Failed to enable clock\n");
 
 	i2c->dev = &pdev->dev;
 
-- 
2.43.0


