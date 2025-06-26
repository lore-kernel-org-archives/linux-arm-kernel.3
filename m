Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDB2C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19+6eq/UcLTUhcGPnlhBGclygh3KIPHQ5cqQpFzjJBc=; b=dLoi9NZQ6AspxgQDkRxLH+5CNV
	v+UaRcVe3jsC0dLH+Ck8NYKNT5DM6B0PHa53gRZrkpArV+erh6OorPUyD2y2IHymGLg8wf6AtdcJx
	BcotA+ddkwXASixkXkhJa578pgvHeYJUrSQsiMKLqRaPhYZNMiXRuOzrfY+z58hKkBaK0z9oxjPVj
	tK+WiWsHToEIH1eaRMxr5jx8ZZR3seV+VsCTJx4iT37E7fWW7igLZJrg8m8LOSQyfw8fElIiCo2td
	qb7Zcpw+0wDst3LXHZocSd3dp5EKwqiVugZlzvuA/PbZ+/AUKK020XX/SMVvL+9ygsXz7rk4248X/
	iEGjPgfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwQT-0000000D6wh-3M4c;
	Thu, 26 Jun 2025 23:54:41 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUudC-0000000CtMH-1eye
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 21:59:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-234f17910d8so16948545ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 14:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750975181; x=1751579981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19+6eq/UcLTUhcGPnlhBGclygh3KIPHQ5cqQpFzjJBc=;
        b=H021Gxmj16dw/SU//GpZwidosYbtwWfrNcIvUoCwejYNVClwhvVQXoNSBaw9gABHa1
         f0HiphHYsPerx91WuOm7yFVM9NMTd7WA4LmafFgDy6c0ogO0d1ifTfFSADg5aj1sfQlO
         KxyW7YCzhvItW9iWpHYZ2nCxfZawVhzdOaCXyC9NtewZZCBFvTDvwgzXQALUd8xPjM+Y
         kNT7ye2+YYYYCcUEL0wPeM61TZF+J9ODLCdTx9dfoFSEbuqzgSU6lCPiC7u2Hb60bKXY
         9TqjsB5tDmdZSU6v5oztDIwWnAXb+YKHl74Mrvsc1SfV72G2o5HVpEsdukEQEf32hBck
         Yy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750975181; x=1751579981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19+6eq/UcLTUhcGPnlhBGclygh3KIPHQ5cqQpFzjJBc=;
        b=sjxwspsatyxAcMjToNWI0V4Rsv29bovFHDaZ7ak8wEUNI/NnlSIOUBGcL1uHp1oAIq
         l5ZZ/2dlqGNRyH2j3tkFHxFdaGERGjgGI/Jx1k0bIinYflLZxgyj118An540INO0P9l2
         arAcTDsaxx17RYxXlbnKtiiL7iYUZexa3APOFMGNT4dcYkYtbgZI8ccUxJLKxWYhowHo
         pGejvB2ueYCpmixaOMeEtwWl9a9tp/M9P6ekCWr7hI2uZwPFd3YrtJisBUl82lX6XSyD
         2ze9Bah5mGvmsSjKQNseORgfOzVWzdvSG4H1aScDbYYAjqh1+b94lwIWGjnOno0CzrwB
         G0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGYdKvl+fQW417hndzjM6dsppr2CzvpyghLVdQ1CnFTd9HegUoYfhIOhdIuJiZlmu2OO4E8c9bnVVW02sIOjNm@lists.infradead.org
X-Gm-Message-State: AOJu0YwA8GssXJtdAo6ZAuOmN+ivqKgy/n03gIbFahcXK8sitEIYGkn8
	jnWOaFELmb6db0B/cPzXeA7hmDTashocWY743lr401HZkixG3Y3yf2eq
X-Gm-Gg: ASbGncvYrKTB5yQtG2toZ1YxhFSfudlRBa6/+ixT5XsY/AsObDP73bIimmYFvYw5kAn
	foNp8lsXLFxCuAOxuw/KlunvEIZR6pIFn2jiiZXNgtKwofXNHxp+EvagS2MtiY9/fkjzOD3P5nf
	r+7ET98/fo2HdQcWzigwPmEHEf5NNazDkAIGuqTDpyygqAxn7i6GTHNCSOMqfZXqoMzDlkBo3pm
	UGpqJnN4oUewDa5PT+bNLxp0QH0YuVGiLK89legryea3WoC+c5aLHs99F+YYMX4s9XL3WtTTfvh
	ZaEUdWnoyJYBKT24PqbHnnNRU+63ZsqFg/xWpCoNcTqoXjlNPytQiBYfAyOogsYXGINoafwd0SJ
	unhs=
X-Google-Smtp-Source: AGHT+IFGHYw7pNh3YY2ppWd/GXJ7nll6kZo8n/rfheAtH7R1R5QnYe8TH6ojABszFWMLG+uP4MGkOg==
X-Received: by 2002:a17:902:ec89:b0:234:8a4a:adad with SMTP id d9443c01a7336-23ac46824a1mr12395525ad.26.1750975181615;
        Thu, 26 Jun 2025 14:59:41 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b8b9sm585275ad.118.2025.06.26.14.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:59:40 -0700 (PDT)
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
Subject: [PATCH v6 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Thu, 26 Jun 2025 18:59:10 -0300
Message-Id: <20250626215911.5992-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250626215911.5992-1-hiagofranco@gmail.com>
References: <20250626215911.5992-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_145942_435524_8291F975 
X-CRM114-Status: GOOD (  17.02  )
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
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
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


