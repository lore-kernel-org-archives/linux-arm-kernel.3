Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6A4D149C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1xCM1ACcR+e8vZp8ZeWNxMr9lABciJDnozk61Zgoap0=; b=YXkOw4EMCwFop9uG3Z7WIarEZ7
	8tUHaXS/ZHmPYwEq70ZYbNS1pAJ643aIqrNrMbyDieVs/1BnGkBgB75HujY8PrQzE6f6SWF/nNQgQ
	btU6BbZ+42P0uGLFef1uG6WZTi8oBWc3HQqDvFnDN54cNg7BXIxpKVpOulFrEwCk0BgTUwN1i0Mds
	Pyov8+YhAIvjo/xk3aGaXXRgYDjjKKRtwPPzFTRCgHLzq+oJVLIiD/UprQTdae1rqyB+VNNNOIPed
	IStJevMGswfiK1ME93S1SHj7ygzgV5710bpEqN8l5UBcb0mB5zZhFNvS6mTF21ySmYVVHDFs7yEx8
	IwQC8ovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MpN-00000004Lv0-2Xmj;
	Fri, 25 Oct 2024 16:06:17 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Mnm-00000004LjX-3cHf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:04:40 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb5111747cso21891511fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 09:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1729872277; x=1730477077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1xCM1ACcR+e8vZp8ZeWNxMr9lABciJDnozk61Zgoap0=;
        b=pwEqbAK304Z/jcOa+ipMFQgvJ+wD+RT5wO9bCJESpkqz71hg+pNtoGETQvlhYcfg5/
         7i60y+HmjSRsWzXfPaKUBOjQB0/BjnK/oxc7QkKe8oLGGMWqXIKGz6gEWnhV5uEjFQIh
         ebn5xUEU83OoNP5/aVfcUFbLSHopmScy5sZ0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729872277; x=1730477077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xCM1ACcR+e8vZp8ZeWNxMr9lABciJDnozk61Zgoap0=;
        b=R6dUCrjb0LN2zNz96i1WYIJTBVW5edqeT3Veb2/s36VMeObPWYrxmN3bdhwFE6Ny+z
         9AfvgqWiysoaTPP5T1XeqCRx+WjfGBmn2RR2/7l+6rwiWZQCh1BESpufUCwmqMRiGsKp
         0/PggmBnXmsf3hnmaLv0Ml+aJ8J0TkIxUtgHMXRrXhlvWMQrxv/+kYYjlVgbwH4Y01em
         nxkgZ0X3u25Eobc2oUOf/S7N70RCmCat9Qphkwp+cS8ctmyZhm83Kq9TNYQrnq77+KhI
         B0ZH9HTwcawywM0SWTVidZc2vus44XGUQnqe6LzPr/uhbT+OISXpTwuMiLJSCleREv+9
         ScOg==
X-Forwarded-Encrypted: i=1; AJvYcCVivEM1FX8Dyae2eCqvqrmjUSuqVmTSJlnmpG/owTznBMsQ56JvGoU8qDJ2FLd0ss8703YyzUQcV+9PRlEOU6c3@lists.infradead.org
X-Gm-Message-State: AOJu0YxtNB8ZE2GtSIgh93vhBL7s2jjYhoRzcS8xf6Lf2G4hWcvffovS
	rVnTpZMcL4wTWTiHgPmMXyv+HYUDHQH2ZZoRv1iEvUi8+1O/q40iGWfvN01OSzg=
X-Google-Smtp-Source: AGHT+IE5tAGEzSGr1VKCRE9qh4Kh62Hto2hpFgEH+icsAjjqXGeOuQHrKjPabwauzhg1pQ0otdSs8A==
X-Received: by 2002:a2e:bc09:0:b0:2f7:6653:8046 with SMTP id 38308e7fff4ca-2fc9d37468fmr61995861fa.25.1729872276573;
        Fri, 25 Oct 2024 09:04:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058bb4348sm1848614f8f.111.2024.10.25.09.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:04:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
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
Subject: [PATCH v2] pmdomain: imx: gpcv2: replace dev_err() with dev_err_probe()
Date: Fri, 25 Oct 2024 18:03:56 +0200
Message-ID: <20241025160430.4113467-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_090438_947450_942FDB7B 
X-CRM114-Status: GOOD (  15.41  )
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
Note that dev_err_probe() has advantages even if the error code is not
EPROBE_DEFER, such as the symbolic output of the error code. Therefore,
it should generally be preferred over dev_err().

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

---

Changes in v2:
- Improve the commit message.
- Add 'Reviewed-by' tag of Marco Felsch.

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


