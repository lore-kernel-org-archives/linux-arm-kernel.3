Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4493EC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ji3o+ulSbP+i9U1/Xrwb9df+nl0gS/1m0flRPEBpn8=; b=Emrc66xZGZM7kdqN0EYtwRGhwJ
	jZEDYryo9qhlNPc/B41g7707/8j8dvl7JILGgg7yUuHPteR2zXIjE+nmNg0OQjM8X0UiFlKUlpRMn
	dO5GnGF778hLV4dKJyCC+hcmk+pF/VuDBN3DvjxO3FIoHgfLUz+323IoqagCkeTmhk/MqgzRUB97F
	h5U4wkqm88XtqifZwF7GROySWQFe5Rcd5PqKU7Cu4m8dGCOfudSVrAflakSCCoTTc9G1u5jm8uW3U
	+FM3zCG2IQpCDlngerqFquhs124Dg3BTr4yOSDfx9c0VWKrhjUc9AHNJD8Pwm7XRwdtKan9nc5k7G
	MSA/ojeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9a-000000015tG-3Qzh;
	Sat, 12 Sep 2026 19:12:46 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9Y-000000015rw-1alU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:12:45 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24afso580227a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240364; x=1789845164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ji3o+ulSbP+i9U1/Xrwb9df+nl0gS/1m0flRPEBpn8=;
        b=OB1kjzRmtz/KdctT5oOuIoFQcCcgWClUoHC/+jjzMnsHajXKBFu1y1TbJQtcpf6n7c
         DidPrhn0VotXnPNFh1Ry9RXTeGVMEcxP4WhjNMcGmaKebrwl4HyDMuaHAwMaeCYG/9jb
         THZk9TTcBdgprBZ6qWtPp9H5zQ0zCawnmXiN5ZtKqKl9dfGUajtE9UuBcmH/AOZz9bgZ
         MnYL+e+dlTCHMGK5nLiASoAABcYBany6T4FEICGJn8tu0TJ2oJev1Uc+qJasgMB+RwVO
         WQrU3dUV7NmXEqOTuX8CRZ9pm1TsJ412e1E1wjpzltFOnvpZ3UqyBC6uORbjXU2oP6Yu
         MB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240364; x=1789845164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ji3o+ulSbP+i9U1/Xrwb9df+nl0gS/1m0flRPEBpn8=;
        b=gt5+4lBnkyL/3YiwkBcwGgp+Rt+Y/xgNWUiDXb+rmxZlaca+NEf+2kRCoKSJyl4DZO
         ELGxp5nmeKi0AisCFM54/0MV18E0g98JuhjvmqYJIKXQH4kYh+E16yXXOXoe6jnduotU
         ns/29SDJosG96uJGbuGQG3mum9lojcwYbOYA6i+hEIUJZte1Vsxr+Y/UfPcdwIRkHWzc
         jxOT3tEkuqBRej+3k8MOf7WYEyPlWJLY/7AkHWDXmqIKS4QMme9bNNeJOUdjNc0SjCCb
         1XJsr47M8Tk7s7Mw6G+nOEcWxrlWex54PmaFQNK2PCoc89/JFFr6q612laxZg+uazFlp
         fkDg==
X-Forwarded-Encrypted: i=1; AKwUvBzw4njs8xYW1hqKIpiLPtxO/T3WBV+kmpyDO6M9sJCHCi1d32fr5nCoffy1QmLboUdc+jMOaVTqOL+qalp9p26t@lists.infradead.org
X-Gm-Message-State: AFuF++lYh3y/la+77hDdPXNKaRXAYilvNCb34h5YCxlzqOV8XZr6NvbJ
	4Z1fL+zRdHNZQuZbMZUIjMU/3XuN0rR3xIwu9Akn+t0Trfzzk1J2U/H2
X-Gm-Gg: AYBFou1uPO8UooUASrX0nVg7zt98AjcY3pMfaxLdDzb9WWU8/qj1334IPUzG/Ix/UFo
	0gJ1e/Mj/9hLOYqunuf+B9OKHjFN+Fs6iRhtsbOIf0h+HiM3JOBH8Qof/zYL5O5W4lK9Lh1w3up
	uUmMurp8Z7cHfqumcIxll3RODFEYhBAfJkOMWq4Uai1JWZof8rkt6qvpiXUfdkQnw89TyMGtelc
	YlRf1G4pkxXFFI8y/QzFzhrNkl7LPTJ/eRBtSnkMQ9FHjQ9dWPsVhJ1PRiSsp62M61o73XuYUnR
	ooUzHnBwNbpRdWMIwvN/1IcpOVZYYcYQNQ0ihCwGWZ5SJngaxU9pBQEWC169MMH6BCvTPxX1BZW
	jvZdotUiY9IV+Ie+imocv8Hti0spbRjH99DowR3ajLe04oDyG0ZnUiHuVJWBkaS2wuuE++IXDbY
	8ZVQ6o9VmApe5MMrJBDu7gIfvHJw3L4N/RJ9NcW3MA94GTx1Id92cW5TN4yESaJpyZ9No3
X-Received: by 2002:a17:90b:498c:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d9bbfa327mr18115862a91.5.1789240363673;
        Sat, 12 Sep 2026 12:12:43 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:43 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 2/5] devfreq: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:52 +0530
Message-ID: <20260912191156.185448-3-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121244_419236_F6777BE4 
X-CRM114-Status: GOOD (  13.73  )
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

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
-ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
gracefully and prints the raw integer value. This makes messages more
readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/devfreq/imx-bus.c    | 4 ++--
 drivers/devfreq/imx8m-ddrc.c | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
index 49798f542d68..dba76d8b9e5a 100644
--- a/drivers/devfreq/imx-bus.c
+++ b/drivers/devfreq/imx-bus.c
@@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
 	priv->icc_pdev = platform_device_register_data(
 			dev, icc_driver_name, -1, NULL, 0);
 	if (IS_ERR(priv->icc_pdev)) {
-		dev_err(dev, "failed to register icc provider %s: %ld\n",
-				icc_driver_name, PTR_ERR(priv->icc_pdev));
+		dev_err(dev, "failed to register icc provider %s: %pe\n",
+				icc_driver_name, priv->icc_pdev);
 		return PTR_ERR(priv->icc_pdev);
 	}
 
diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
index 52beeb5b7d65..28d7c595fa17 100644
--- a/drivers/devfreq/imx8m-ddrc.c
+++ b/drivers/devfreq/imx8m-ddrc.c
@@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
 	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
 		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
 		if (IS_ERR(opp)) {
-			dev_err(dev, "Failed enumerating OPPs: %ld\n",
-				PTR_ERR(opp));
+			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
 			return PTR_ERR(opp);
 		}
 		dev_pm_opp_put(opp);
-- 
2.43.0


