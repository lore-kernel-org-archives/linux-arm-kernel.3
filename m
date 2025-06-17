Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD52EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 19:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1scGrWmFNF+u0XSYuCytdGqLKRqsOgk+ZZqdhXd5JD8=; b=BErtRhZ5YUHIQgFAyMDgsswBX9
	WvFU11CXO/34Jz/cmT/IYAa53PkOmpK3Ghctve9ukl0rl8iDhzZTc0WyLzdju0SfcxK2VXNdAl1vU
	pKBLEzFASiXbmzELgKcHbnXVRrfmmv4NzNLTRPvF5aYDbmZ+MIkeXoAuooFR6I8PY9Teoe8CNSwQu
	yl86f75D+w6VQJsco6a3yEuicgAW8OJqKdAiLD6KmXfQp/pq6HsImG4v2bFzzQscnNXeV7vitsnQZ
	LqFfjA4B4INqHAoXXnDAo1MEwvhys8SC7ygdIHIEa+hG7qGlrnmgZ1DgqQPaEEqBPhcQXV7xiCkGk
	JRXilD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcCm-00000008Gkj-0U2V;
	Tue, 17 Jun 2025 19:42:48 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRc6L-00000008GBc-07iR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 19:36:10 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso4903943a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 12:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750188968; x=1750793768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1scGrWmFNF+u0XSYuCytdGqLKRqsOgk+ZZqdhXd5JD8=;
        b=iN5oWmlNzOv19JTo304tFfji+cJhpwpIarEYV7MZOjNpnGYlPch/rnHj6a1cvwB4fc
         YOunVMfwI79eXXkOsA/L3IV4sTqsdysT2LWo3i31Jdl9jTaoj/xBpvsaH4PkqvIaJFXC
         eudwaYsfZ0jb2FOWvWZVhRtoXr4e1Ch4wZOwic5K4pnGSeXwdU9/rmIM7OSUgmfCTDJ9
         8EGmueSDSZUyZLqploN1ReFKNPrrBD5W+uMtkdk1gr1MbKGI9yYMSqR9L6kjsS9DWTMQ
         qIgaBIAmCvf87q2BAobTnCHAIzbIOM5bLQ9NdcCrSR5GLF9at7+eyByqlEgQk5ZDArgv
         H50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188968; x=1750793768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1scGrWmFNF+u0XSYuCytdGqLKRqsOgk+ZZqdhXd5JD8=;
        b=pTus4KYolhTWGkBKxzqNPkJqOUpAw6PJKIhfUvAdYosZgeK3KMHMx4U/kUjhmNKUE/
         WPdpoJqVAiQ46d976wUfXG+MwW+Oayb+nfmmXc7ZDQ40IStP8aFIsrguYzH5FpTFWez6
         iA6jxp/QgdlcRxr1w4aFzlBiB3w+mMzuPLRV3Wnv+yInlPAgHszPV2ytMDa9wGN3cL38
         TaaC9VWydg15OkVZp6NKFMFtlbDyrNh+d4pbjGkk8tUrW1ndkNduRAPpeIuiEwbnPdgF
         r5pT61RkFZiylfnIlJVDV38ykzfMYGjBpxhBIQxErD8+wTL5uSRzCTe58I1+gcvHZfLR
         VUfA==
X-Forwarded-Encrypted: i=1; AJvYcCX6cIrAhknWd1yiD/Cdrtj9uvQwUm8Agleg0SGid2D9iNS4S+0Pj9MjiK61+BcmHjQdLEdsIvmN3ltxBqIuzy3N@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/GuMqyNc/U7M1oLCzWrWn3cgsSzHlvzmH+oE38Zsl/lgsM7ta
	NIuPgGpcS1p/OiUhiUWIsZaWSz1gt9PtcKHFKZKCDMZxcxJYE14MRmvx
X-Gm-Gg: ASbGnctC6xZKDMwO9m5ZkGpxtZoiQhf1zZ5ST55X4hYjJDe37WOA49iQeEDd3+ry7ru
	ECWYEalflo4spV8sSRcKmdIz6wZFUxD6YoZkMW4PkxBopmdtjHeo/RMRKtTAer1F/PP+CVRL8Y4
	56brsm83zGohouci/H0PEm5hpntLMjMFPpF0mFo546FF1qAtVZX3M8HQS05XrZqMQHt0UuM26b3
	8xCnp7ynyMtDpJIqXv7HqTShwLc9zJNBLX/FtYm7BgXpsIXPXhivwsjKjLEKWniwWtdQZuScduh
	uxSU7o7Q2tGc/G323+8kUzo+xG6KThHwJYGQLygdQtZOhHy0QgeRG9S1nE8tP0TDbpxRUW/bfYd
	f7/QFEG3A
X-Google-Smtp-Source: AGHT+IF/rndT3pqVzap/b+BUcpqjMIETJYig28EKMkQ28U1cw4wJ+jDydO+2ebPcgPtnZZvK5fdPAg==
X-Received: by 2002:a05:6a20:2591:b0:1f5:769a:a4be with SMTP id adf61e73a8af0-21fbd59fb65mr24359112637.36.1750188968258;
        Tue, 17 Jun 2025 12:36:08 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7340sm9648582b3a.179.2025.06.17.12.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:36:07 -0700 (PDT)
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
Subject: [PATCH v5 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Tue, 17 Jun 2025 16:34:49 -0300
Message-Id: <20250617193450.183889-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617193450.183889-1-hiagofranco@gmail.com>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_123609_068209_7E0D2D84 
X-CRM114-Status: GOOD (  14.65  )
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

Suggested-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
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


