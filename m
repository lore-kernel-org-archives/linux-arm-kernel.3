Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EABC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvziy4eou3QaoE99EKXIFfvgtdzshqQ6+XPSOJVwJnI=; b=L+kcnUHTmlT+HxVbV3D1HV/KJo
	hO/RI9irQydIjpWz7vldrkodZivVu6aXW8bs0IJPatVSTDqKHUPB1xCEZXnNjF11PTyPq1mEaaT5J
	UNnPYlb7kQmN5QhPSJodrlNpe8ISRcv6AhlldAzRWgHOuUZLdf/JzcCKg5bPfh8r3vdDVomEAr4h7
	93os6Bomscz1lhVfeFkJwnenE5mjEZj/ygKq1V+625CeATMGF5lzf0RjahtaIPfif6mr1tLhPJAK2
	py8P97mtyzED4uFtxDaDIHffoNIPdmo5mH9ixf+/UcwcBKFOX0izaRVmSyNQ8KgaGVrP3T/0xras4
	Wz0mubWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWv-0000000GIW9-2nTo;
	Wed, 07 May 2025 17:26:01 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChDa-0000000G4x0-2QPI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:01:59 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso78986a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 09:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633717; x=1747238517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvziy4eou3QaoE99EKXIFfvgtdzshqQ6+XPSOJVwJnI=;
        b=JkM/5h0TlZHtUznTdWuUimLmmMJSrIe5OQ2MmLLxMfxNsuolE3NF/NqF9qQKlaYDs3
         UTvCtVMdUL2ONRYhjBHVdJT8UT601QRPPuqg5BoKsGPjaO4odxIjxMUXV424S5GrgJpQ
         UoFYyKuOK0imanf3tgla6v4rMXb1JRotbhkaZqi9UwerwG+mTXoofFl/oKySwfdohuux
         DMta5nxLOIjcu5iHge1Ai7FeuYlwliDNZfwa7NIN/ZXRoogkAMw8LzljynyTj31h+p8+
         yTPxywgQ3FM7rfSPw3YeO3JZdf7zTdC7ur461X2Q8dP0Dv8pxOO228uNxjSo2y+fYPEe
         g9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633718; x=1747238518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvziy4eou3QaoE99EKXIFfvgtdzshqQ6+XPSOJVwJnI=;
        b=MllgTzCQ7oRVJE0vck5ARM9AD6h7mZF/AZeud21lljOJC4o7vRQ8mIDYcedNXosRbk
         MC15FU4iS2IF2o4nvmri9e0TwFHJbTt9s2xqxg/hWs/gWjMdR/ntfCVcYY7YGMvRf5ck
         4YfjaMD10wRXIXD2Js0HivoKURjJXP36qtZUzWUmxM6RUzOgBtyAbgHbOdCgxrQo8blQ
         FgoynH7tCz7cnM7UTeiQSPWSovwreVsfbM1GiUS/Qs9x97i7ODGUQjzo35LBqC1bygDD
         2WbKOGvuZornN4d4JtTQ+XOV1E4/euzOdY4/zevQZbuphuZ+Td7m4gMNGLj2L38uVa7X
         V6DA==
X-Forwarded-Encrypted: i=1; AJvYcCUOf+ZHLPULWUaqIAYeL98gyFnM+DYJOTVY92c0QjiGrjvnI2bDcxJzylIAnMcqUwy0/bMQ+ABJIppiY3M+hvW6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf/cJQRURapSuV2+VkoPoj3l08QxdKUfY+z3KQUPmMJcjzZh3S
	f3W06tqZ+leJdSrrkzQtJo7z/WoHcXdeK5JY4//c2+ZowPwnVh85
X-Gm-Gg: ASbGncuFPnECwlF15NoQi7LgRzUIfLO3kP2iy1xR9Ho70qM4iMmpesL54SWb9WCQZ0s
	xVE555rOaSZJrFRfr6AcWj07gp6Ot+v4TYs5dplvKvjMItO3WvxvNAjqJghnte3B6skb9iyUzWN
	Ip4883pK83Mon+cCT15Layxf+8sMq7OnyixAPjuMRV5pfggwi0Y/5K2wiAWJmiMO3GKf6idZv/6
	wF1s3cMO7Mo8TR6futjSIa/HGViVJ2YfviRpyVYgtAVIh72lS97uQY3mO08VQYhWbwnJveRTH3z
	4umweDdXSkk1iKgeyHSdn/Yh1e4b4NbMSL0tdVaDXKHbLBlItki9ZL0Ny/DoTX0=
X-Google-Smtp-Source: AGHT+IEVQn8W2DCaOLJ8nt6une9BpBR+Zi5adCUsrGW+yDHxUa7uKGXONWqkOwz+Hr7bQ3bU6dYRUA==
X-Received: by 2002:a17:90b:2241:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-30aac2483e9mr5393663a91.31.1746633717323;
        Wed, 07 May 2025 09:01:57 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4f82b86sm327242a91.44.2025.05.07.09.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:01:56 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Wed,  7 May 2025 13:00:55 -0300
Message-Id: <20250507160056.11876-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250507160056.11876-1-hiagofranco@gmail.com>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_090158_616313_22F61FF9 
X-CRM114-Status: GOOD (  15.54  )
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

From: Hiago De Franco <hiago.franco@toradex.com>

For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
by the bootloader, M-core and Linux are in same SCFW (System Controller
Firmware) partition, so linux has permission to control M-core.

But when M-core is started, the SCFW will automatically enable the clock
and configure the rate, and any users that want to enable the clock will
get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
fails because clk_prepare_enable also fails. With that, the M-core power
domain is powered off when it is still running, causing a SCU (System
Controller Unit) fault reset, and the system restarts.

To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
because SCFW will automatically enable and configure the clock.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Peng Fan <peng.fan@nxp.com>
---
v2: commit description updated, as suggested. Fixed Peng Fan email.
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..627e57a88db2 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	struct device *dev = priv->dev;
 	int ret;
 
-	/* Remote core is not under control of Linux */
-	if (dcfg->method == IMX_RPROC_NONE)
+	/* Remote core is not under control of Linux or it is managed by SCU API */
+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
 		return 0;
 
 	priv->clk = devm_clk_get(dev, NULL);
-- 
2.39.5


