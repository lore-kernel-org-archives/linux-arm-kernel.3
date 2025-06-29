Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B9DC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 17:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBbPPcEdQtei5+NuNnufcyttJ+zLeB0/TIiitwhS+8E=; b=ZPCkKbvWifJj+I8cGy7op0ZfYN
	u0iwdxmxZr4Jw4SXZ57lAYMCPqTcEI/IYGXGuDgxhDtGmCxk7wtw3zMjxtP9TxPmqXdRM1lNzDdc5
	nxrezGOsKFi7/DJAqbniXdOKRAg8ih/b+VYrWjCNo2M4NCIOBcQn5vJzz33GGfD6COD8kPpNDKnjB
	n8505Uohct5nT/o1uAEgfJe60EELvWx2OBrhepsxN/e9Z9XVqHoMag6Dpirdu/m2OoWBGST3C5zKR
	W3AMWEHXEyQ0qGwi8/gs1leja6ErjUIel2trNWI7tzF9t2V+U5dMDMaySQbrmV849nhqp5+QgojWK
	K1ZjQJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvv2-00000000Wc4-1U4v;
	Sun, 29 Jun 2025 17:34:20 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvmh-00000000Vbq-1ZQv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 17:25:44 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4a7f61ea32aso68369251cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 10:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751217942; x=1751822742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBbPPcEdQtei5+NuNnufcyttJ+zLeB0/TIiitwhS+8E=;
        b=gtwrBnbQ+Ul5nMlC8H/3fl+x2VFMG4BNMj5rWXTV9+c5fvJbJj+Y9B+6hVOOmn5J/c
         1cdVpH9LsyiildHTFKDmbhZC1+H1oIr3/LJ29G2wfnlS4yoxTGxjNbtg/Tc91AKazpSI
         TnxEATPnaWxWaxQMIVWpV0+l5ocmHpH0qnLRaeijJNq+X9Txgqk1pySKRVITuZq3qP6K
         xwOziGi8KwHua1S/MsgXAkPv5/0E4tGWxikU6NaIvPi9xXHUkpkXwGCrpbkKxl2u21r3
         1vhV1ziCSgc0BbCX4qBSDB8U+5m1UVT8bBMf+JM04thoGc9eYs92DfGxmA7T+I9WypKV
         giPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751217942; x=1751822742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBbPPcEdQtei5+NuNnufcyttJ+zLeB0/TIiitwhS+8E=;
        b=Py4FW/bZApYDADoZ0DcdwZWwlThtih9eHpmk8342/Yx1kiZIRDV5HSt+USr3d3MjQ1
         du9TFL2piBORpELZwp2mOtAZCpH+YfD7B/POQ3VlP49tjzxFNgYuaa1Pd2Xwe+SOcvt9
         mS7iH54Ms0sB4G8Ifb+1d+D46Kj5W11SkGc+iZ3j5vKgeDpf6q2/eKFx6yeJvLeNjyB1
         3b81rzAySn5VEgMoi1k5BgWoWZvCSGn9CcuWg53Jgzc4fxhoU89vecKikHJEoZBg855F
         c5cjERnnXF8+CTBcg4O81ECRSmGks++NM4AF8GlQ0OIfyZucRZbX+R2B6SlZAYPQUpz+
         uUvA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ4UB0l1uv8nkhr+UQXYBaNmoqivNH/3pHFkD/QJAV/7DkK2G6yJNvxwJv51OuV6ZrPaxTga6xnqjN5lun9Zs0@lists.infradead.org
X-Gm-Message-State: AOJu0YwFQAmFk++lrXHZrttxqyvCBM6lrIGXwlUaU8RDsTx/gB6n0G2p
	wGO/QoWyZSw4t6Kyx527965WdTdzE6o1dyDbAMjbpCpEWbVyMYnFNQwv
X-Gm-Gg: ASbGncs9+4A59IyBLt9vBZ0PhSqNdOJ5uyjvQB2ncE4LjtD3OKAJXd8xlNtU5O91alc
	6UmSAe7palNP7XIOI2B69KshZG0Wu2T6bVverzXqiSFaw0/GRNa5XHdRBBygNW70/Vx3fZfbjDX
	4qInxIcC43TJxdoU0gkjEvsfdS9CPBs2KIGz0uMwAqBeAo4WybDqw2ZsD6sD/ib5pFtvRs3O5yC
	XUK19KJY1dPCEVHqhR6aAUNFIZqxf5ldEmja01R3h6mIYtRmvgaEyPpW1Vlhl5nTHQIA+CyO/MG
	GG2VUGj0Ad/CuQNiMOaT8y194kX8deG9k/+Gbp++D2RliszLiGH+4nV+PrnWXC2AY9NOkDT0cqD
	wGg4=
X-Google-Smtp-Source: AGHT+IH0oA4OuFF0x2nQSxRW9BOpq3H9adGI3VCEA8SilmvSk/JkXEeS26LmCye5qmOTPQlaP6fQKQ==
X-Received: by 2002:a05:622a:506:b0:4a7:f683:975d with SMTP id d75a77b69052e-4a7fcb3aacbmr184575131cf.49.1751217942253;
        Sun, 29 Jun 2025 10:25:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d7dcsm45549761cf.60.2025.06.29.10.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 10:25:41 -0700 (PDT)
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
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v7 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Sun, 29 Jun 2025 14:25:11 -0300
Message-Id: <20250629172512.14857-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250629172512.14857-1-hiagofranco@gmail.com>
References: <20250629172512.14857-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_102543_412600_C19B3E40 
X-CRM114-Status: GOOD (  16.99  )
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

For the i.MX8X and i.MX8 family SoCs, when the Cortex-M core is powered
up and started by the Cortex-A core using the bootloader (e.g., via the
U-Boot bootaux command), both M-core and Linux run within the same SCFW
(System Controller Firmware) partition. With that, Linux has permission
to control the M-core.

But once the M-core is started by the bootloader, the SCFW automatically
enables its clock and sets the clock rate. If Linux later attempts to
enable the same clock via clk_prepare_enable(), the SCFW returns a
'LOCKED' error, as the clock is already configured by the SCFW. This
causes the probe function in imx_rproc.c to fail, leading to the M-core
power domain being shut down while the core is still running. This
results in a fault from the SCU (System Controller Unit) and triggers a
system reset.

To address this issue, ignore handling the clk for i.MX8X and i.MX8
M-core, as SCFW already takes care of enabling and configuring the
clock.

Suggested-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v6 -> v7:
 - Added Peng reviewed-by.
v5 -> v6:
 - Commit description improved, as suggested.
v4 -> v5:
 - Unchanged.
v3 -> v4:
 - Unchanged.
v2 -> v3:
 - Unchanged.
v1 -> v2:
 - Commit description updated, as suggested. Fixed Peng Fan email.
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


