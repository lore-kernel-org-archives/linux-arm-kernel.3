Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F032E87835
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEVDyNGIeHf4pNw+X2bXrhjpf8wdFUs1OWtMdxxb5PU=; b=t0cJyz6dUU318YGrpwfBXkyCQb
	/AWWwMxfgRvOo8CPXSHcXZYak7sd1I9dPd6jibJowD85CJw9Rllcl2S8HJR79aufUjMsAjsZkA5be
	kPgdczxauvvkcnTleBcJhP8j0M+wOclo/6vfQIU/yjdZMeSu10rptSVXEp1/ouJupg9GkYyaif0f1
	50Xw/tzvGiLhHcb5cX6qJpQ0+oyqRZ+0MpWTwe6JY4r1Nc2UGeyr48o4i15RYOnjygLLfRIlJxb1S
	Q5OUFV404EEqFwp1G4WOu/qcAZiJ5BN0idW3inIwIEPq20oV5nbsa65nUvqddRTLvweYu3y2Y2NIU
	bNU5FPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnH4l-00000006jKe-0Jx8;
	Tue, 03 Feb 2026 14:08:19 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnH4j-00000006jJe-0DmQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 14:08:18 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-81dab89f286so2822170b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770127696; x=1770732496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEVDyNGIeHf4pNw+X2bXrhjpf8wdFUs1OWtMdxxb5PU=;
        b=GNCC4UEvERBcIwaO0MoYgn+aa/jQ3Vq+PWrloGxL5SUI6It2r3gd4FV6unyph5JDmR
         OmRn6GPJOD+ppFDbkp55ILABkAcDFBrEfDfCsiu9GRiO3zjtg5qN63J7azXEvcPsiw/2
         tfyy2pDx/qtw2wX5OoTK/DUngH++0q7u0Xl9qkwg+4Lajoa9qaCaoPnLBHv36RcB8L8F
         pJTJ+F9M9v8Z4sGnbMfnFOhSpt2zNsT+SWciefPuOBiVIjfdOCL2K4uj/9v1HmZ/DVUs
         GjOSKtuUqmkkB+vG328LwKEUizOttSgtuIVAe3XQlOHfKHP6Il6k79I02JuBVd1hRPiq
         I8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770127696; x=1770732496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uEVDyNGIeHf4pNw+X2bXrhjpf8wdFUs1OWtMdxxb5PU=;
        b=at2Sl4h2Vj+PQz5NqsKskpXTgUUDSUC/n9H3WmRmvCFXVo2FTz+IuU1H6ScCcGPcsm
         01eWWUhQ64DiO2BstWiuqQCsT72cMjBo4s7X1nQVqTOxUTlrDel7u4IwwHG5DHi8e/7B
         f4Bkger0ktrB+r1JEUJHqJCYJgGgOr7BRzmKOotlb5miV1MpcntHrnIj5gwb65RyL65J
         L3vjtzzlxflBnBVquYhTTjB9T6pSE29tgLY03owgvw5pMLkU0V3cUHW56P3KjeRVHU5s
         EmZnuDIJ6pKPAP6GoE7gBR8hJQYNybFTKSrrmOr2B8+hsmZUIM7vbRAKypPeWu8aNMWh
         dMug==
X-Forwarded-Encrypted: i=1; AJvYcCX2n0FxEVFAwOAPJBb94G7c/EjzvWYt5lfHipScfM7dnxS3k0NHxTQp4CLkSl6A5Zf5AOX9DbpFrmA6CUw/d+GB@lists.infradead.org
X-Gm-Message-State: AOJu0YyYg0ZxYYaWjbQ+jpBEbb48m1us7uULDmRdmjE4U1y/juPa8+6K
	/rupos0Fz/tJdGrbPSGmhUEy/C8ampqzy12qvsM9d5fxAgz/RhLfki7Y
X-Gm-Gg: AZuq6aJTeB1Pt314b/OPprQMgboaofK6//yuNT12EfQ6ExH2+TtK0dga/ENrP7BhaBv
	Az+xoiUyZ/bHEWAXHJzbm8E155uYrd8DvnYHv+dHXrsp8giC83zEPdnxPaRTUV9PrRnpuO3hD/0
	DdfA/7dTNUaef64BR/oYSwkYOkqt2lRuEX2D0zJHhiMH2OQst1o908nawAOk5H7ynrd9dZYVket
	Wi48k/ajT0yj3rJt0YcMTNxpmdGIpHcPZuNReGe9rOqsw6auCSK69REJUPO7RcHY15w189YdFJo
	d/jHUUYqiFua4/4hQwRkXAyDssEuAXiPPViswqWHoeomC6FmCkY5+4lQvpp9ePV6NTpS3a9iLBP
	Kizerc6gYtydWlpyXcFqDQkx/N2drpknqxxdp34EwB3QQ7+3RK0HcuL634A12OrczJFvD3CXHhn
	7yKGtBVOHKXHFCRuXQzqvMNDKt0A==
X-Received: by 2002:a05:6a21:8888:b0:392:e81f:6711 with SMTP id adf61e73a8af0-392e81f696bmr11458034637.8.1770127695989;
        Tue, 03 Feb 2026 06:08:15 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:f091:7dff:927e:f788])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm7694684a91.4.2026.02.03.06.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:08:15 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Feb 2026 22:07:57 +0800
Subject: [PATCH v3 1/2] clk: imx: imx6q: Fix device node reference leak in
 pll6_bypassed()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-clk-imx6q-v3-1-6cd2696bb371@gmail.com>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
In-Reply-To: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770127681; l=1359;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=WD9h0fFVKsfX86DefFgHgmW9sLJVVxtbAMFvxApruCc=;
 b=wXAWXX5AmnINy0EhIfleVbe6g2DbP1E2ngkrqcfESd6zIOLTsamfvNCQ5N2/Z0tXObOxAKayW
 41Nf1MuQstPCrduCmw3LSegnipFmeLm3NxmMflgZk4fI7MuO3mnAE0h
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_060817_097387_84748F82 
X-CRM114-Status: GOOD (  12.04  )
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

The function pll6_bypassed() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing
a memory leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
v3 changes:
- Fix Frank's comment, add check before calling of_node_put().
---
 drivers/clk/imx/clk-imx6q.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index bf4c1d9c9928..ba696cf34fe3 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node)
 			return false;
 
 		if (clkspec.np == node &&
-		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS)
+		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS) {
+			of_node_put(clkspec.np);
 			break;
+		}
+		of_node_put(clkspec.np);
 	}
 
 	/* PLL6 bypass is not part of the assigned clock list */
@@ -249,6 +252,9 @@ static bool pll6_bypassed(struct device_node *node)
 	ret = of_parse_phandle_with_args(node, "assigned-clock-parents",
 					 "#clock-cells", index, &clkspec);
 
+	if (!ret)
+		of_node_put(clkspec.np);
+
 	if (clkspec.args[0] != IMX6QDL_CLK_PLL6)
 		return true;
 

-- 
2.43.0


