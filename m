Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBADAC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZTcrQzGXuunNIwct3+GtblbyDkGvD9ZQvC5QSvDxeM=; b=tHLGQcgaolY4g1y6OxW8k8SYbQ
	jxgHDu8haWpNq5EG8/FuQsaQopXMyS76J4gWTO1djzHOgGOgHzZTxtoWm0yq9ZUzTTe6QGfc12Phl
	+we8r9TRKXKc+RQ36v3f9yVIxisuWPhsPaIGLoMPvmeU5kVW+v6uKTYY8XLx1adGhM9Z03J7IQVSF
	SXrGbxIi9ZqrNbaz3oWv1nw8DW7WqxmG50uMDH/efjq2I0pfeeSrESahye0CKujkZ7TDzkVvEC+rx
	iQQzpPevek6wD8GyLtuQHPZtjAmvwhTwQCEJErTbdmkFZdyZ+54gy147e4mXELUVlBgvkjzTB3R47
	VBwyrCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHpr-00000007fsp-0o07;
	Fri, 07 Aug 2026 10:29:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHpo-00000007frk-3GvC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:29:54 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3118190a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786098592; x=1786703392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZTcrQzGXuunNIwct3+GtblbyDkGvD9ZQvC5QSvDxeM=;
        b=BPXe8N4lVobLvSZ7W3j/PA0C1DBPgu9uvBtWmJUnVrNg3AdYVb2EUCiL2jt9fGvFZq
         hH81AfVr9Nsk1sRC7hqeheBi4N+ZBZLryOuX8+VnVFXadyAltJyeXFtJEW95m4tQrxOd
         O6gqui/k33sH81ozQQPd6f8Pm4AW/iTQMZXSFt6k+5blYcOYw9BZruE9v5b2tdOI7xBL
         35sTjGtw0TytMFAM0eQyQRlePY5PjBG+8yt+HWY/7qGMtm9tKri0hUGja9um+Ib4nteS
         0yZY3UPA1szfbQd28QeR/0gQhBzVfFbJDKmVmzmm4TlYOFLFIu77o/70uX01r9Ti+28n
         1TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786098592; x=1786703392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZTcrQzGXuunNIwct3+GtblbyDkGvD9ZQvC5QSvDxeM=;
        b=YDap6V20l0xme+ktO58/FMzhy2FcSH9xF0Fyw947C2oXoiuXgfFCahAav+LJ9HzMda
         Aif8h9S09xUOSTQGyW4/eygJpYqRD5035AAEuO6M6VhizlRgZvEExxPSBGTsxshmk+0e
         BzWt5Ptvmr4chEBdGLKAHHDWkZC29UK7wrAwxjSbcO1Pxyk0720nWhlaM3QdpNrDriqg
         RGxe2pgqxPqzE61nYbc2lyTluRZsZvXSXgCZln5PJ1mTX99tls40zdN52l7v2AD1lku3
         Mqb+vfzOCHUr6gG8NIM6pJP7RA5SpqBMqOiJTsDbYt2TSyTvJPuPDXHnmgFlzLLQCiZA
         zaqw==
X-Forwarded-Encrypted: i=1; AHgh+RrWI3mhFj/rv5MNE838aiMeRZ52uhKhlNXVrzlH8tEFmotVwwvclXo6jAoN7rfRzOZRO20NuohJxVwYwn+edWKL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw064y40a3uQeWBWbTf14PNEXNr1Ggi49/tu7jnf68qn4Qh2biC
	V7TH0Nwm77n6lQ2Xa0O3MiFtgS2pY78w5CbvXlLjdz6PMNmO7LF1fgaU
X-Gm-Gg: AR+sD13h/+TJE7sPQUwQyNfABSY2HMxemvmO3z0HqGqhDAM4gyLlkr8gk/3GbLvgQNr
	Kd9lAhHJsGDA0RMuGd0bVkcnkNT88P+Il5S5FylL/hbVeB0ZQaVSxXiJJcP181a4u42mEnxdqGs
	INSmeUQVsN6shLUCc4lIcxmAL3Tqh3Wv0u/Kg9Zy5Y4+G5QyCvJvJaokOYmfpA0rQ7Fd7grjCBX
	qIg/oJGVPlYGHBeAcGYrOHZS4thB6MMgSuw1b44J6Uk5KtXvWSvl6tnMUpWK1JEq6EVDj2LQWFs
	w9QuUdJ/UXWzdFG3Nvewmn3yzABQ+HSq1QQ7RdPI4mkxO5oyPj2UWRMMDgRtEzG9+UVVkrXfoxr
	K1tcuOYzatiPJ2SIFBLkEPpIZ0eqD1ABFnc8BdZJH4QpM53EChkLskCE+o8SF5vRQCgg5/yBd7z
	wFqkdQl9RANDs59Pzd0Ie4h8q4gDUYIbD8F8Zf01raU7XBSyex69b05nRlZddG9Tmzy3z9Pm1kC
	oQbyOuftzdwNAYfwocJazclmVNN6N6wzP2pTBbk9d6iNgK54ptvGs1t+XiWfxb2Wz5HsDqBdO7s
	Y8sI
X-Received: by 2002:a17:90b:1d10:b0:390:b41a:b92f with SMTP id 98e67ed59e1d1-390b41acf77mr3051923a91.18.1786098591764;
        Fri, 07 Aug 2026 03:29:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b1389e1fsm1133614a91.0.2026.08.07.03.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:29:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] spi: mtk-nor: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 17:29:30 +0700
Message-ID: <20260807102932.45785-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_032952_820743_AA8E9438 
X-CRM114-Status: GOOD (  12.44  )
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

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/spi/spi-mtk-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 74f34537b02c..6b9a5d728549 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -895,6 +895,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	irq = platform_get_irq_optional(pdev, 0);
 
 	if (irq < 0) {
+		if (irq != -ENXIO) {
+			ret = irq;
+			goto err_disable_clk;
+		}
 		dev_warn(sp->dev, "IRQ not available.");
 	} else {
 		ret = devm_request_irq(sp->dev, irq, mtk_nor_irq_handler, 0,
@@ -928,6 +932,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
+err_disable_clk:
 	mtk_nor_disable_clk(sp);
 
 	return ret;
-- 
2.43.0


