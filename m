Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CADC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 13:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pcvAbNlPqy8avpN6kp5KhushkYLoqeoRe8/zurysr4=; b=DxdDZi15SyMVZf/hhEUkXKwP+d
	AbFaXJnC9uxE7ML4w5eUCybLLi5prLJQ1BrEoJPr+JwNUX5gfikjj0+luHKQKI94npBPO9SuC0VAp
	M+ul3JgrU7B0Wptd/OAgvDfydsFHtF4YlzPND5JlzgmgevNCnVpFOv1K5i2C46g+PUu3dfFdlNN0M
	j6NG1jdAmKXIAw5+7ykATsq2gJtpCmW9jazVlQsp7NP8si0EFhp0MJ3MKL8+GuZNYb6eSv86v81aW
	kck9s25JnNnaHj13udBgio+gAsBBXHms+0P6CJbJc8LjzBkZKZJ3pHm4s10aN/AAhV1wLZV69t00i
	a2iqOIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5BR-00000007Sg1-11H2;
	Mon, 02 Jun 2025 13:26:33 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM553-00000007Ruw-3k4R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 13:19:59 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-30e542e4187so3022917a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748870397; x=1749475197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pcvAbNlPqy8avpN6kp5KhushkYLoqeoRe8/zurysr4=;
        b=GivRZZZhFi1rJ8fhmYt6jAycQqOqR7J3Mzlsvlqy4lQ4Fa4HqJcY91t6NAy6YH4yko
         UiQ+KZLNDgZL1qTpVZtgaZBWWw3bsg3KjejnoNIMINi4osph/Q8nmPlhp/6zc07Z2jVo
         oQuml29R1RpvK0ThoPveWCwAZJv2tHukPu/kqs5W+4wHZYDHsAXTiWYjpoLBAz3lUvOJ
         NoQ+vc2mdYYbYxJg92tTMOMK69WOFBIzH1oZZF/gVTQXe0+oGSmPHR0mfL87/oUExX63
         NHBLtoGdP70kmuW9tjBadBRHRqEFPs7oTMJy+e4iG7TxCB0x1c7wawuo3xhLl3Q3PQzy
         qCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748870397; x=1749475197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pcvAbNlPqy8avpN6kp5KhushkYLoqeoRe8/zurysr4=;
        b=kpnPHHTADCmxCGgkVINjYqT4qsk1Lz+QYNOsCT+IJT4PdaFFr8ohNFGsIjNpRepygo
         FiDtppoeaGKtufxptrJdKiYc/NTF9Y4II3UKF4i617C3NTET6sw7oE1v92KApiUSde14
         npw+xbcrwRGJqpd1RaBq+00bGCzSc8V9Tz92M53+YG5GSO9QRTyDTFpnsCy9qAOVyDg7
         l2jJSFTb3gPl9SxrFxqmAEI92mfzQFI5U00acusViL8w9Y6h42DhR7D11K38j2qGxOb8
         HOrwg4BW+7/XfdK7s6mxcCZbAFu03O6BH7G+OrxCQriZIXvzXbtk+2GQNdsFsnBsDR86
         xj/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWssFTo12cPfeBCDTBlTPM0Sfe7ZdxnDFpD938vCYGsySm4bpYVHSZOIb3vG0CjoZshKvu7H+cXcJFLwHinBSte@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+IuUPEe5GPLALGK+ruBaZl+GMiguQ1RDZOfAUGIQszJAVDmGH
	HvjlfQLbocXOOzInGF+2lZ7q3wEm620eAq+lBrfA9Bysfy9RVK61wu11
X-Gm-Gg: ASbGncu/+r9PHJ365klNac3VaniIdQij0UDCzGprWEcZKRhrTHT0pDj4P53W0ug3gMj
	AW7qlEzr4zsVqheXKPW5xBU8Mo8OzDs7Xp6QisvV5cRaroz39eQs+s/g06qlw595rhdjFxfr97l
	dUqckiBoHpUItSel5ZgmaauxEELKPp9bzJVpErDbPC990L+nt+GJfOwqv16ix27mnoSV5RpFMxO
	jPi5c2LqMEdjErQM3ZstyvmONF7gLviywNuEG0htNdRfTwS6Ypykw6iD/tzrYRdobuUD6JUYNpG
	q6txuWW/jRo6n4KiftYpkHeGA8fPJ8ovTJvudHB34JeN1L2bVbtpfWCYD+cUM9SWfCpmBWNULR9
	1GzItQ0Gw
X-Google-Smtp-Source: AGHT+IGmdU9yIWWKtV28WuEUnscGkG0AjD3tLXlSKHPKML0pCpHKekiyfiKqp/DGTPbox5idKuB7SA==
X-Received: by 2002:a17:90b:1a88:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-3124100ca0dmr20343807a91.4.1748870396838;
        Mon, 02 Jun 2025 06:19:56 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b67bcsm6130983a91.8.2025.06.02.06.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:19:55 -0700 (PDT)
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
Subject: [PATCH v4 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Mon,  2 Jun 2025 10:19:04 -0300
Message-Id: <20250602131906.25751-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602131906.25751-1-hiagofranco@gmail.com>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_061957_933085_DC92AB00 
X-CRM114-Status: GOOD (  14.99  )
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
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v4: Unchanged.
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


