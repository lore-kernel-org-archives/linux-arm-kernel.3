Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC0AC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HOpTOcijVncQnGYEtKs8l7VFXU+Ee9wdpHMU7vcpB+4=; b=Sqw9REs8VX3R7NekCB8y2WVVmY
	MGyfVL4g5/WOMbhiCMl0cfNI+eJ3XShcQuojPhcay4WSnNigOezQSDEj8XpAmS+V6rjmjXdOq1gUd
	kYakJ6GYkBOERZGEVW/d4rGR5DwmixslqzQgKSArTdP63FIYgtGD9COna4GmhsmYVA0cCoA9gY1k0
	l1r/drD8v1yenZyHk3Gc8fOjGixvpcSud+5OH38UgctpMepIxtJH69xumoxaFl6LGF81eYgBMAwOk
	/WLPSU9ZDLdqeyW9/cxeekylHE1T6jCMBOWzePMVBVxGxkMyXPFqPbLJva/PYiWgjbL7Y+aI5eAEr
	xyh4EaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJtG-0000000CjCV-0vdf;
	Fri, 21 Aug 2026 07:42:14 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJtD-0000000CjBc-2YNq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 07:42:13 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso489469b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 00:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787298131; x=1787902931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HOpTOcijVncQnGYEtKs8l7VFXU+Ee9wdpHMU7vcpB+4=;
        b=l3ZyLNd2sfchC3vMYcNvg0JOVi/2TEiJUWTZasY0yAUshJKi7VGBRMqYrBRvk/ZoT5
         il1IayQbPJJOugVitGaTuRuultSChpuRgkMGXu9hjqMAqsmNUzar/zFzqyhN2GrBVdVq
         0/56vboBl9rhxgnCWpH8YL7jyiTkpALed39HJjZGxBwTu/mgaxO2Y3vw9FWZnrPoegVx
         Qbd2L8VOZ070/+Kg6sO0WKDl+V0NMGPLShru6cwkzo5sZ3KHBMgA5lNgOxbmPJBpXjMu
         jcoifS9d/1UIDGCrY5pAvrv+xoA4yBt7qdOysXEN+g1h5U5WWzm+EtEa7jBpYHs7nIAB
         +c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787298131; x=1787902931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOpTOcijVncQnGYEtKs8l7VFXU+Ee9wdpHMU7vcpB+4=;
        b=fG8py/8gG40gVWKvXJQC1+WpZpKMJoXCyXu14Y4JKjCOvsILiHtLN4YEUrF+4oXNqp
         ujKCvpitwlOeAeD32Jk6aGTJbZ39K4aVLUgO4lm7+Nmip5ZN9necpWz849Ke53TIgaAD
         QgB3SAigZXZ62rXNJiQxmuuYIYVbYzeknLb/s+GRxf+0cjUaT6ZsPh0OQPCTvk62cAhw
         2am/Vb+aCPNE0N76fjq/ZXBjwMuTz8pJysoQyemWgdry0Fmf+imFeRnf6PlkbFkuxOyS
         108LZxBKaPjVE/ybdlxJv7XfXtGlF4h4xWRRCvlV0wrgnxsp7mpDaXE9nQuSV8ULqUZY
         7/gA==
X-Forwarded-Encrypted: i=1; AHgh+RoEbXIVFgTf/uzD1nYUhu1ZvqGn2IKTqZ/eyMt7w4YEbXSTVRME7gpI2cYnTVwitWnFsoEbCKewnXiewpgC14UH@lists.infradead.org
X-Gm-Message-State: AFuF++muAMdwwo7N2lRNfl5/7jxVXt72T1xDZF035Fn+9IVQ/KbaydFu
	gNG3D21fQO96uvQYGhQYezI/lOLCPvncYy/4xxLeLVoVFXurWdOk3lSXQggBpjTAQw==
X-Gm-Gg: AR+sD135+R/S9gx6QadA7xg2ZKVJjSusrVCuHBlw7fgvSrSx2nX5LSyYWKjpsF2Jf87
	HqS96yib6EecTOdaH9RLb92EpE54V8om7ZpQhOi2kIF+HggyK/x9Hn38m9OdWCEDuZq/5EdsyE2
	9IILbhljnTXK0Eg3QiAcahA22H6w0KTpkX7i2kYi9mKyHAwMZUGvk171MSwEPqaLneYYO0DroSI
	tt7J9zN+66ZmeXd07fETBQjUfQVUlgf+8NdFVGSPtlBfZpAYTJUgq87U3vX4EnoBbVluwDjacF3
	liSf7XZ35o7Ubu1dJBd1BFoa47F5AqrGZan6pXuqc2wLY/rZT2XrKmgYx8IdvHt+ZX7JB7IAOCz
	IWbEcw9Gn33ichQPMd/fqlSP3ntUXg2O/QgWlgDDLwUErbfEmiPMA9uFQZx6tGJY/EybQoZRpvC
	rBxxlARXTsOXkBaX5aqkyzL4PP010iB6LyzmoduPWT1kivndGglyjbzNIHQHtGmr6dQ6v15YKnf
	g==
X-Received: by 2002:a05:6a00:9099:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-851f9f8f1fcmr6787491b3a.11.1787298130695;
        Fri, 21 Aug 2026 00:42:10 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d33b4135sm2546275b3a.27.2026.08.21.00.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:42:10 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: krzk@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] memory: atmel-ebi: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 14:42:03 +0700
Message-ID: <20260821074203.258920-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_004211_675061_94C07FF5 
X-CRM114-Status: GOOD (  12.52  )
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

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from its suspend and resume callbacks,
also reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/memory/atmel-ebi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 1e8e8aba2542..3b1246e9ed66 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -610,7 +610,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	return of_platform_populate(np, NULL, NULL, dev);
 }
 
-static __maybe_unused int atmel_ebi_resume(struct device *dev)
+static int atmel_ebi_resume(struct device *dev)
 {
 	struct atmel_ebi *ebi = dev_get_drvdata(dev);
 	struct atmel_ebi_dev *ebid;
@@ -625,14 +625,14 @@ static __maybe_unused int atmel_ebi_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(atmel_ebi_pm_ops, NULL, atmel_ebi_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(atmel_ebi_pm_ops, NULL, atmel_ebi_resume);
 
 static struct platform_driver atmel_ebi_driver = {
 	.probe = atmel_ebi_probe,
 	.driver = {
 		.name = "atmel-ebi",
 		.of_match_table	= atmel_ebi_id_table,
-		.pm = &atmel_ebi_pm_ops,
+		.pm = pm_sleep_ptr(&atmel_ebi_pm_ops),
 	},
 };
 builtin_platform_driver(atmel_ebi_driver);
-- 
2.53.0


