Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BF2CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oDyvw0L8OYXJ6cX888dTXA0t+K6akFsCVQtR50QGsSw=; b=H7cs7gr1d4dtoAmV8PhTE/IixX
	6GzowktsE0HuGQUTqmbUC7wRO81Q1yR55dQJSDowJvbykz6Km/j7wdlXoaqVYeHRXeges1tJbqbCH
	mbJejXTcpmJon/c4Nnnz9qwCOF4aI5VUyp7gsQhrIAb7fY7o4xSKo7w/oY+mvBrZDRTrXns1cZhuf
	qiWZZ9d7O3V1VnV84pQxbQx5azMPeUx2zLq8oF5XyD1JTrpeC9mqXlsLBa7Q2Qw/j6g5R7Mzo57jm
	SwotA6Enz1cy+gMGzBPouzvbhPaTB4xy6DqjtkX8OaaKQA3BUgFpB44ZO5DIJ8D3RbvRIhGcmUPXi
	/VRG8dJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL26H-00000004Q04-1QpP;
	Thu, 07 May 2026 17:01:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL26E-00000004Pym-1Nza
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 17:01:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488ba840146so10208175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778173280; x=1778778080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oDyvw0L8OYXJ6cX888dTXA0t+K6akFsCVQtR50QGsSw=;
        b=PPN01Ny75y84TUM5AtZT7xx5KVRWO+tibcRrVg+w33c31xGErAplhGFnkuu5dEbT5+
         jF8EaSaThKPqQGn5cOtz1WyM/0E851SroAeclASuAGlz+WTFbgYbFMmnZLR1vhOTzXrl
         mGb6hs0URlReyCKkghW5Y2eqBBzOnIRumxuweqzazJZtsoPabdoRX0P4jMi7bwquIvS1
         lNxFstJBue7I/qqwUwxXLrKKw8dyCo9FnWBoAtMS7m1tMYutUIhwokN8zKdmOmThqrQ2
         Pmg/4iQfz9gaJYpXQH1kxgGeUQZno2/JctixTWmpEziJihBvCaU92U+PTuktYzjVyekf
         ESiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173280; x=1778778080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDyvw0L8OYXJ6cX888dTXA0t+K6akFsCVQtR50QGsSw=;
        b=LIvwCMJBAzK0MHVSZSgE+MTA0k9QmC7cqRAdKLbmUoqcKteLrPaYbHwYDGQacYYv9j
         LB5iTs1COks7ghxnufK4oq3mUNNfr+R4VvUD0UNwUeTgJsNRiG3LS25roypFZ7ZnNjvT
         Pb5gIlVHjWL4pA5r32+rRzEiX68FPI+ciBXI3NpKZKq755tMf8+s4v2/7dkurVLtViXg
         zk/phyr/G0tY+H+1s1vVX4m/9K1NRBsmXqVq7kmmJJ3CkVLj0VEWKixIRKlrEssTAHGh
         gCzhJFMUZ0rRuPSrWWfRGGL3HAsagyhisATfcMsAI6oSd/gwT8viJkwVbD++fKPlHXjw
         haQw==
X-Forwarded-Encrypted: i=1; AFNElJ/gcSATR53Ujsofmw8i6WjLgS4gcErd00mOhK1FoHt2uptDlAHrkltUjt03FjDaMX1pape+e5W0FnsPDVsOinoq@lists.infradead.org
X-Gm-Message-State: AOJu0YzyHCGwz+kHDKKWd4mrxwPZjsuyevAX5hdhxtyXpiKosNQHsHzH
	3gkgTgLINqHHNCivUQiLk8/kBf0TSZhzGdui8Y3Rhw8S4DXB2z4a7PyH
X-Gm-Gg: AeBDieveyOjT2KXpglM8fTyBfeqT1be9R0r7gFKAbxWCltSNAtxk8hJX3rsnXEEs0P3
	nxOI4WJLNZAhPBVsgrxXaxUZYaRLtRrwyIj2sShg4OSRr3zCY7Dk5mzoaVHhWIUB1mdxz4A599F
	iwg5CizFgAIYzGldGkVYGYx06YcJfD70NvFMNvH6IrHuWj1jrpkrKw6ub4+GD1fOM+VloqoSL5t
	FgWSEKdAqjjVAF06NS+NM+ZKs9d98IGLqgPh9vj7W34PYz/LkO48uZ3PllF+rSptMo9UVkbNIhf
	1GwuKUke1nB48KbFOYUESKVmH3hT29YCc9YdM2M7FX0PWDYuNQ4ysrL6doFwPwNina8/7K+UkJ6
	v3BKL016ybaf7+Y0xpm9KMyItpgvl4CtnCldUZ70zZwGMqbFtMNrUbrmujbEBiU7xEnu65lZ5lh
	ujyu27jpNg8L0LCMbLeOLH8VtXb5qUTg==
X-Received: by 2002:a05:600c:8485:b0:489:ecee:c4ef with SMTP id 5b1f17b1804b1-48e51f2f874mr149807555e9.13.1778173279572;
        Thu, 07 May 2026 10:01:19 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538c4ae1sm131912545e9.12.2026.05.07.10.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:01:18 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt8167: Fix orphaned mm_hdmi_pll clock
Date: Thu,  7 May 2026 18:00:46 +0100
Message-ID: <20260507170107.88248-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_100122_383877_78FDA198 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

Clock hdmtx_dig_cts, parent of mm_hdmi_pll, is missing from the clock
hierarchy. Add its declaration with values coming from the Android
sources of Lenovo Smart Clock 2. Tested on Xiaomi Mi Smart Clock x04g.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index c64d918c37de..df9f9dd1bfd6 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -27,6 +27,7 @@ static const struct mtk_fixed_clk fixed_clks[] = {
 	FIXED_CLK(CLK_TOP_DSI0_LNTC_DSICK, "dsi0_lntc_dsick", "clk26m", 75000000),
 	FIXED_CLK(CLK_TOP_VPLL_DPIX, "vpll_dpix", "clk26m", 75000000),
 	FIXED_CLK(CLK_TOP_LVDSTX_CLKDIG_CTS, "lvdstx_dig_cts", "clk26m", 52500000),
+	FIXED_CLK(CLK_TOP_HDMTX_CLKDIG_CTS, "hdmtx_dig_cts", "clk26m", 75000000),
 };
 
 static const struct mtk_fixed_factor top_divs[] = {
-- 
2.43.0


