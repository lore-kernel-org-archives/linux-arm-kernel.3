Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF14FCFA457
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u9pUdYv82xqt7Xgtl7+4X7WHgZzcjvtNIADtHzAjrXQ=; b=dhbhYHwyf6H1JsmuQWFR/MG2Nj
	EJcgmol6t/dOf3sOSQoGx6pB4l5wl9vnU6FiqQdOwFyDGYIa3p2cnu5mhMXw8Lx5maJOajupkQZNL
	65jXwv1+KP5PBTlByjEQ7hX6R4ZR3gLNXpQjOdBOG1Qjp1POup6nKvLBeRVgOz9Bm7cYqe8A0fBRU
	eHspm9QEhFSJsyT2GuEyGG/ACvyqZbi2l9XG958m+ohn/73Ub4S/UgBQnb+4ieCgogponiq9MZ5Bd
	I3w3+91697MzkUr1WMmWhrAdaTG0RZ8zpnhz4Oay9UXUgEYNzNPCc5u8wNWRYrh1viEfxFVcLz7Q8
	FS0GN2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vJp-000000006hH-1u8K;
	Thu, 24 Oct 2024 10:43:53 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vBx-000000005PH-17XV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:35:46 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9a156513a1so96389766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1729766143; x=1730370943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9pUdYv82xqt7Xgtl7+4X7WHgZzcjvtNIADtHzAjrXQ=;
        b=VXASI2BXMlSdCV62ADIbdItYksl7utsctXmbKxgsC821TI/4tUMeIJr5OLQm6v1MZo
         4xuoJaTcx7cbvlZ+fTdaCORKYyW3ToW2VS7yvSDBJ8lye+llx2f/m6vVe6y6YOPsG8A+
         G2kJQKRzqkx2o1/KeLIIBddnJfUPN7X9EwglM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766143; x=1730370943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9pUdYv82xqt7Xgtl7+4X7WHgZzcjvtNIADtHzAjrXQ=;
        b=XSOh2/HoMsHGYojkS9t/oVuza9By3JURP6li3hARNXpK6pncWODnWpeWLJSNZ2TtWZ
         mjUXWCOwNFKXNCm3jz9UfOtpXsghMQ9vpgiMsYJivy/2vim0faljdVuCx+XjVmuwZc7T
         dM0NYBxI0MN1Rsf7LEgNS3Sp++oLcHX7bj5EcpmfzR984gJcaUL+SpNDtdERN/ON1Odn
         RE5uKNqxex0MXtdD7/zJIWG/EwFQR4XXNrBtFVbEK+54XUCWQOY6bikbZZg6ycKxaygv
         9kMAqdYxzcjQpfUQVntWsS5iQCrPC8iSYZNb8UUik1+lO5WK1+P4sIs/MB8m/ciunAtT
         8Hvg==
X-Forwarded-Encrypted: i=1; AJvYcCX4zM1H1E1duoBOdSwxOYaILzd7IrGGLLW00qDzwA4p8/+nucuvovUfX1TA85w5uZjtOH28wx115kqgHYqMJ5XS@lists.infradead.org
X-Gm-Message-State: AOJu0YxEoJm/sJeKObtPwnIFR7uVvpLP1sXey7LwlQa+ln0REsn+e7p+
	8eZ4RvV8atKddS/9jflr8eJCCfz063qSysJF4zHF0We7mXMP61Gim0yozJx5x9E=
X-Google-Smtp-Source: AGHT+IHfb3oc/tXlxpxsflSckSQeMBrns/+C2m2gpMY+5B92QOH21Ab4FKnncfZAer2tZKtes4/KtA==
X-Received: by 2002:a17:907:3e1c:b0:a9a:835b:fc8e with SMTP id a640c23a62f3a-a9ad286b976mr132409566b.54.1729766143356;
        Thu, 24 Oct 2024 03:35:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:f79d:49dd:b804:3f48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559f15sm598592866b.133.2024.10.24.03.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:35:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] pmdomain: imx: gpcv2: replace dev_err() with dev_err_probe()
Date: Thu, 24 Oct 2024 12:35:36 +0200
Message-ID: <20241024103540.3482216-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_033545_333323_D17D4307 
X-CRM114-Status: GOOD (  13.13  )
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

The patch standardizes the probe() code by replacing the two occurrences
of dev_err() with dev_err_probe(). Indeed, dev_err_probe() was used in all
other error paths of the probe() function.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/pmdomain/imx/gpcv2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 963d61c5af6d..6e6ecbf2e152 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1356,7 +1356,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 
 	ret = pm_genpd_init(&domain->genpd, NULL, true);
 	if (ret) {
-		dev_err(domain->dev, "Failed to init power domain\n");
+		dev_err_probe(domain->dev, ret, "Failed to init power domain\n");
 		goto out_domain_unmap;
 	}
 
@@ -1367,7 +1367,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 	ret = of_genpd_add_provider_simple(domain->dev->of_node,
 					   &domain->genpd);
 	if (ret) {
-		dev_err(domain->dev, "Failed to add genpd provider\n");
+		dev_err_probe(domain->dev, ret, "Failed to add genpd provider\n");
 		goto out_genpd_remove;
 	}
 
-- 
2.43.0


