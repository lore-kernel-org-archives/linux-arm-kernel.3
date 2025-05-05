Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E33FC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrh837RVy54Gg6Y+qeX+8goZwlDp8QNNPgp6OA+KrOY=; b=PSlUM4VyzOAIGbS8Fq/GX2tP+p
	UDKU1rcn0FOdk5mg6XKaKgxnkoYudwO3hIQW2I6DAJcCBpTtAj8Ms+bAlSQLAk/WFU6n8YMGQOjou
	mglivs25ZTtaqPPI8k4MD7rqnFoqVUv4A4TiSksvW2h/jo0bONlP3veI+axQMxJsDQojy/ph+e3nb
	9ijc22Fs9juJfzlE+au6vLIQPliF6sdGK85jLLM2eLrnqQcHJGRPqBWuUnqq95uzR2gh67Sq8T1dH
	l3rkvlsRBejc8XaMZ00l94og4DwKtTQL4kUoAoTTarhCeI+G6o0It4pBEtOR8F/PU01k9bbu7Y2xc
	zaVnSaIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBy8g-00000007tK8-2kXf;
	Mon, 05 May 2025 15:53:54 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBy4o-00000007sUX-3VeF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 15:49:55 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6064d4c14ebso1054553eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746460194; x=1747064994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrh837RVy54Gg6Y+qeX+8goZwlDp8QNNPgp6OA+KrOY=;
        b=gL4epKZoDfwSiOqA1Q22I2y4LznShfCqBQbYyjGZ8AnaPF47VGjNpETLuU9gnl1yPx
         SM9woHT2JwT/ifTCGtV+XAi8e9yRsypo7VVxVDoxATBj0ck98bDjdp5QswlOA2/BxONC
         Q9p2BbKyrr+fouo8OOd8+lckxe2t+srcxpbdTLAL0Qt87YxKnlV8dI/i+hqOHy06cYE8
         23a46EumdmXuwp1QMFmnztxisymVAgQDqlYXn3Jc/PoIgtb7qQtK64d5ipz0czesfmuI
         5qpZ2ngQ0pQizVUWgsUp2zCgGwYrNM6e2F/EHennwhbv+Y5JTIW+iU5pvlA0QOWmrpXJ
         Y06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460194; x=1747064994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrh837RVy54Gg6Y+qeX+8goZwlDp8QNNPgp6OA+KrOY=;
        b=CiYRyHtQh7pMr+lgdKnIyY4l7NvL2DhqqCujJmET/Qj6I1OghBypfUj/pk9/XTyRE4
         v4ocFmZ8n0Rr1ewdIbtl2WBSgi9mMUqg4SXNroG7AOihDRdD3peVRp3cfcdFwtNlwYMP
         wViKFGse8xeAfqZwLNwE1XsBgmtiK4WnfHeVg24DYD0JM6Ecz47EJlbXy2OfqZFO3qh5
         StSP4mWw5O+8PiP9bQf67/4VXtzefLITd5cr48LFJWfgKf+JrJLgN14uO4BXkbAwLSHX
         uhSZgIKYlaz4Aq90n8f8gOxHSUefJRHSJWzpGl6Gc3x9/ufHUk73/es5ANmFffA0rWBH
         g8hA==
X-Forwarded-Encrypted: i=1; AJvYcCWyBJ0t95mmX9rkXV5Fx5ezLv1V9AnrxhkE5ZYB7ePgBtqpC2M3dkAf4uwhIgpx4EzogeG9SuJsfKH/PjDAe547@lists.infradead.org
X-Gm-Message-State: AOJu0YzJk+8y4od3U0WUzIEjuDE7QQZG0LEhtkZf/Bg3oGUh32icNKml
	wBTjyfwemktrqh43l+kyMft/0ibKe08KwIcDldDKTNxqke54qr8L
X-Gm-Gg: ASbGncvg2wEoBL5HSkqir3hKLXaHy/aKcGlC9Uo9QAsRac+enFywykQUXX1puuw0NcF
	II9H4hTrNeDa3R8938EZR8hlZkyJ3YR5p1G0CgZYERCpX9zKpaBG63SoGmV3wLwsWjblk5dfUxE
	kAJ7IRHRp+7PCuIDIOLGs06lar4IXt1AP7XmwLOHSSW2ohiRve7sMh34EIBuv6cccAtpt5P33q/
	AISFpeVlbZmB/G0criP+edHoZNPWY6RXsnnXQiL5gWaBSnGmc2OrX1IfsWx6e4L6IcwtOl8D8co
	4ARIXytQeN0gLX9Ojrxu5Yj/kVAGv5ysaTyRjeaCRDP8dK4ChKIDZ9xbRYP+oqk=
X-Google-Smtp-Source: AGHT+IHzxBFSeMM74yjOto3P7ALY8hiN3bLZVvyyH/Nc6q5335Rn3C/QA8sNLRqmd/RLKdgG+WebEA==
X-Received: by 2002:a05:6820:1391:b0:607:cc1a:572f with SMTP id 006d021491bc7-6080030f9b9mr4884601eaf.6.1746460193770;
        Mon, 05 May 2025 08:49:53 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7fe84a8sm1606217eaf.36.2025.05.05.08.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:49:52 -0700 (PDT)
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
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Mon,  5 May 2025 12:48:47 -0300
Message-Id: <20250505154849.64889-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505154849.64889-1-hiagofranco@gmail.com>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_084954_875242_58189595 
X-CRM114-Status: GOOD (  17.90  )
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
before Linux starts (e.g., by the bootloader) and it is being managed by
the SCU, the SCFW will not allow the kernel to enable the clock again.
This currently causes an SCU fault reset when the M-core is up and
running and the kernel boots, resetting the system.

Therefore, add a check in the clock enable function to not execute it if
the M-core is being managed by the SCU.

This change affects only the i.MX8X and i.MX8 family SoCs, as this is
under the IMX_RPROC_SCU_API method.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Peng Fan <peng.fan@oss.nxp.com>
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


