Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC69CFA46B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 20:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AF5ogFOESgOt7rvRfEwnyUu5pZ0Em2kftQ5XUCG+Du0=; b=m2h3SETM33RP/SoD4S1ZTzPidR
	pqkNkSdVwqfy5q7Hlb4xmmCx2Eqfl84EHDs78gWIqWZPz1U760bmqGe7lw4yxa/k8IazT6iGsTryx
	djYipMOBTIt2yYkWtapDgz69cYCIzz1zX1uTmH3UpQcwk1/pmjkCZxc08bC0skx8WEHmSqLY/daiU
	VULTzzDaVFIELJNFHm/HovSap/Z8jB5/icw2sFVDHQrtH3PhQNrJgnLSIi2e+CkB1yUY2P6mwD6+1
	BF5aK/lSACgF251jd4LVeTg4oZrT5VdAM+nR4uPhaa65hMwBxtsFrS8To332DgIySxjrTCwPqnHHN
	dsPvUDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNGdb-0000000AgQz-0STc;
	Sun, 23 Nov 2025 20:24:47 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNGdY-0000000AgQc-3dFn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 20:24:46 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-37a34702a20so30876971fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Nov 2025 12:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763929482; x=1764534282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AF5ogFOESgOt7rvRfEwnyUu5pZ0Em2kftQ5XUCG+Du0=;
        b=evYisUYr2dWNXxoR0b8/bII5VvQByH818/ANfRbsV7BWIpAKIW6EwAMVus/ODTSdno
         v+bV2Gq8PftFHDD5ebseq8eehY8hsFtKwk6+1cj428B2PiIuW9ts0wZJ2vChQ0KaR0I/
         9huBFM6uPlKJVv2K5X4h28MFTyyIw12J8e/2fKSkk3YYnIMEESn00oDJhR4oJdlCzPoZ
         a+2hYgwlmg+sKJHTV3jGHtVkzjaQP2eKwJkxsGVV9Ombc7iE1U5btZhdi7I7R0SrT4Nx
         DeP/ZdXsjZtfKFDys6ZKhrv7qT/DiYjNufYDu+ucqkMMslF3rj5OD7RVfJeVEP4FmgON
         fSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763929482; x=1764534282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AF5ogFOESgOt7rvRfEwnyUu5pZ0Em2kftQ5XUCG+Du0=;
        b=lE4jgn6caktf55V01opQLqfNuS8HqKyb6jyr4wABr7qalhZZVTQckGH5dex0lsOHqi
         Ld4gVQzkMnrglVg5h3yEhiFW+uhoeUIQjuNRIlmkSymvfB5rwv1/g8CVrYss1MUTfFqJ
         hEbKBOPrucdR8AU+qs61+kHeLu+L1NGV/Zw55H1bBd2FodWVrU9uhwRRatuJko0Cw5VA
         4zAfhRq2Ho0l7L/pcACduJCNcoYFKw3kS3POc/RcPaBgtNXKgkfHkyE+hhq6i85Bnicx
         wC1qDztXTHZ8SYj5yu2rz/4oedXKQqvYxKi7IKF9vbjO/Gc3BMz7EJDOk85kiI5oHt76
         HamA==
X-Forwarded-Encrypted: i=1; AJvYcCUxddECgujQstUGLee/1i/2ZadCYeHvgPsRafQF6XzKJy6+7HI/UflsBrzNXEAXi6PD/7T2Re2ePAxNQ0YbMH9x@lists.infradead.org
X-Gm-Message-State: AOJu0Yw55Zft0BNxipiSb8cDHqbRZwSi1GrQieeDZ8ldQvmwVYm/TVKM
	+JeVcV10QLfyVzdlCAfq7GMlLGt6JbcJZOsp2T2J6lBlJ0ld7z0jXczE
X-Gm-Gg: ASbGncvWMgwDI3GqH1tAZ9jutDdxoeFg5G55grSDrG2/KNr2Psu4T0SpgCE0achMXwx
	HhljzgPTySON98qB9ZHQOz8rJzjE8KuEXVO4uDyv1hgkDLxBooJFtBpGuaRVQ5jAX14ewIorhn7
	v0Dc5vzcppiwL2Jar4JxNrToyB+2tWjej6H1AU6W0Uk/lhU0mN2pxeYaqLLqy1PJMKHnwNHyJ4H
	2yHl3jySlt+U/z+Dygzt6jGjLbJwPEo8cn3Uy4IYSceDplZIO3K1O3iNXxQNnF3Z2ojD63lSLid
	pLw2UGpESwmJwq7B7z5BKFH17ClrzTLeKJ3NiolgSRIgrhbxNiFA3OirGEdQJsgtJ7tGm2LHBxg
	TXsZ8j897JD5mcMVbDQ/BCiTk5riBHXmMepxA+ZtawFPRiVAbJi7m0rbRnz10fF5GNkWA41fkYt
	TLxzeDZxHDxznzKolcetlZO+7liQ/Pe+E7rZBwEbiFIl0OM7I8Ls4=
X-Google-Smtp-Source: AGHT+IElMmJIMHZiMdJFwuffpKzKXBYS7kUrz2YRBC6mjXJcPZe+Z3suYg7bX4lYoavOAlzsAyWpjA==
X-Received: by 2002:a2e:3509:0:b0:378:e540:2f69 with SMTP id 38308e7fff4ca-37cd92e0edbmr18198111fa.45.1763929482031;
        Sun, 23 Nov 2025 12:24:42 -0800 (PST)
Received: from CryoVivoBook.. (176-67-24-127.dynamic-pool.mclaut.cc. [176.67.24.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59d3esm23275771fa.14.2025.11.23.12.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 12:24:41 -0800 (PST)
From: Oleksandr Suvorov <cryosay@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Oleksandr Suvorov <cryosay@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: imx7ulp_wdt: handle the nowayout option
Date: Sun, 23 Nov 2025 22:24:33 +0200
Message-ID: <20251123202437.2340955-1-cryosay@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_122444_931430_1C115034 
X-CRM114-Status: GOOD (  10.66  )
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

The module parameter `nowayout` indicates whether the watchdog should ever
be allowed to stop, but the driver currently ignores this option.

Pass the `nowayout` parameter to the watchdog core by setting the
WDOG_NO_WAY_OUT flag accordingly.

Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>

---

 drivers/watchdog/imx7ulp_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 0f13a30533574..03479110453ce 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -346,6 +346,7 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_reboot(wdog);
 	watchdog_stop_on_unregister(wdog);
 	watchdog_set_drvdata(wdog, imx7ulp_wdt);
+	watchdog_set_nowayout(wdog, nowayout);
 
 	imx7ulp_wdt->hw = of_device_get_match_data(dev);
 	ret = imx7ulp_wdt_init(imx7ulp_wdt, wdog->timeout * imx7ulp_wdt->hw->wdog_clock_rate);
-- 
2.43.0

base-commit: 1af5c1d3a90246a15225fc7de0ed7e5f9b2f3f98
branch: master-imc7ulp_wdt-nowayout

