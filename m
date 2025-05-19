Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3509FC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 18:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGjXFGuWNPuMSkHVFxRqYuJrDQhGPryMypgumm+l/4k=; b=y8L2uIT8lcthOorI98pG7w2Khz
	8J9y0+2vFPG+LQ4VUwlOPX+eLRh+DyyXqJrpDuzdPKD3DhyfJnHqCVSElLwFhkBcf9Ryx0p+Z32gJ
	M6CNFIxnq4BDYB1qM2+0YVfBWluV/PhRjzlfDkjHyHZjwhjT8oLv1Mkon0b1adgW5vwMPj5gfinqq
	SoNQzgCRzzbDQ+E9c3TUqX3JfkqQFhp22gSCaV+T/+kj/MSpAmWlYGbr1zE14gRzKHajHj1R0ssGx
	xL06lN+XbspwolI/6osL3W8L4vm+ODcej3FHBBnp6aGR9JltkDb9f/5RrDTrebHGrIwbEA9+WCzFg
	AcU5mxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4mK-0000000A3lX-01Vv;
	Mon, 19 May 2025 17:59:56 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH46A-00000009wDW-1QFJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:16:23 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-87bfba85c18so629252241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 10:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747674981; x=1748279781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGjXFGuWNPuMSkHVFxRqYuJrDQhGPryMypgumm+l/4k=;
        b=X4aqvr2CWiI3Zsti2ZMtRs0tHTQotf9lFfsnACFJCp3FWS/owXGA6/97r7j6PWXSPi
         6Y7z8jWBkY/cN9I+AkFVSSN48uxdhgqLkz9w08Ai6xlaKELgkKyRkOyPV/4dNWXo50gp
         o7Ln7TZViT3w30Zycz8AIzM6+Zz8+XNLNq9PqWW+aXftgb6pcNyMxmfD6gf6dH7bDpuX
         +9UUPYSJpcXODqpaiw2/YX1EtRJSPlDXr2XoHbpgYgJB0GiPmwMQCVlq43k4FxS3MpCP
         zNWnebuNDU2Nn1t9QdgO/c4wc6EhzYYwJYsIoOtCCvNX0TVuNjNXXLgr6kiuNSL9fc7M
         1kYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674981; x=1748279781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGjXFGuWNPuMSkHVFxRqYuJrDQhGPryMypgumm+l/4k=;
        b=CEehuF+26mEEvg8fKorWU9H5PYJvtqsyOr7qZ3KZgXnmaQWAmU0Vn8FTDhZ1iaBTBk
         92aWXk+0Pu/AXH9oE2rwarWKh280VWoMz87AUrQ60bF8oTnm4maWzCBZH/jAu1qNqHp+
         uqb679YnPO73FfJIcDnIyA8FgTGh90QVl0hEcmxfNsdz/f1p8B66xuSKlh7LLoFAXmXL
         NkxtLwuqnrUM6PGTtCv8mkXy3nzT9K3iyfCsQ/F6jokqMe9cWnIf48/KfEwtM31oMz0I
         k9COzCMcbRgjV+uHatgMFAHPdPjD0GbBc0X7KyQnX/Lgu53VQySrSTndyJBMXJAvwmMP
         3bdg==
X-Forwarded-Encrypted: i=1; AJvYcCWwHfhcNZm7DN8Og0p93mOoj6/bN2ve2lvfEYzT9AyGMOB7TpIxbk6Mn/QPRV2BUNeIavbg7/0xBMwQqraWcAxi@lists.infradead.org
X-Gm-Message-State: AOJu0YwtLGocfr6PeUxR2loKXeEXpyB49DDCTgdD6MrVw65hyrQbv9Hk
	fMTx7pv9Idv2S60VjhFLZnk2gNK1XkZRDdx7g0AwiLLjOk8iLmRllL3P
X-Gm-Gg: ASbGnctNeORmS/NxyJgm+S3aj79vCYg3xiqDdBuWUde+qcm/NX0ukbhYddzPs0W7Lxx
	TJ8vLTHPzI6Wtgk+Ly+2tVGf3ggBfpKF+r6NAPmX+saHguCNn3q3qv6HM0d/HnuF0fZBIvZoi4P
	LnCzwnkeVJo+dq9jv+xf5XOM7jZ+BUoIv1kwg1T8ZokcYgkD94ZqymtPi4RE8ZUr4RJn8t4mNMB
	4N+Mm7iF6jfoktnwD91OolTfbGL8AYc/I2FYorzh2oXqKJXq4JOlUvHDsPoFZhhm52X14BlAdc/
	xWf4M5lj+uG50sa0K+OmTFjINpYQP5LSucFVP87bcB7KselXwpHyXq0NTJSFhqd9253IZjbMjw=
	=
X-Google-Smtp-Source: AGHT+IH9BchR+WY1xG/OkUX8wAcOrhxgnJTryDQb39oorpQKhqyzK9wy1AtcbLqbWwTQkOs8cLfUHg==
X-Received: by 2002:a05:6122:2049:b0:52d:bbab:2055 with SMTP id 71dfb90a1353d-52dbbab9460mr8433938e0c.10.1747674981032;
        Mon, 19 May 2025 10:16:21 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e983sm7003647e0c.31.2025.05.19.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:16:20 -0700 (PDT)
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
Subject: [PATCH v3 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Mon, 19 May 2025 14:15:13 -0300
Message-Id: <20250519171514.61974-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519171514.61974-1-hiagofranco@gmail.com>
References: <20250519171514.61974-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_101622_378771_3E8954CD 
X-CRM114-Status: GOOD (  15.66  )
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
v3: Unchanged.
v2: Commit description updated, as suggested. Fixed Peng Fan email.
v1: https://lore.kernel.org/lkml/20250505154849.64889-2-hiagofranco@gmail.com/
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


