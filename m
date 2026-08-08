Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17684C5AD2C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VKPZin59jcLEgsj7vGd6U8AiKKUkanMgykS2/LGEdhs=; b=gSL+OjOkUbrcAzgfls3AamTDWL
	sBvcgEDNt0I+EpF7BIqOWHCn579ANrLTnU01rvE0l7BNqeiN1xLnXiUYTEHNuJhd2QvJaLc+FHgK5
	eLNTA0geT1FnjNlLU69CdrEroWJDk1Z5+1bXZkoFkTkUYLTtqU86Z7BzCcZlT4F+dhDYeGHBU5Xb7
	2WMPMrlQs0aL3M1lSPYZ+GpTbUUb4lVmQqUTRYzBH+TXPuvD6ZS9D/fyy+UHaGR7zgypMExAxajOp
	3s42GPQVx6NNhR49RDuFWa4ZoDs08fAUaJ4MIGtjM213Qmeck3war0/1TwHZrKl+k30XJLUewnM3L
	Mm/kQ05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscTE-00000009AeH-2lZD;
	Sat, 08 Aug 2026 08:31:56 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscTC-00000009Adu-0R3t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 08:31:55 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so293821a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 01:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786177913; x=1786782713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VKPZin59jcLEgsj7vGd6U8AiKKUkanMgykS2/LGEdhs=;
        b=gUPbRr/lQVWFU4Xx2HA+JA70u6purHpZxYa+Di7BW62cjowHAE2SJK8Ypt/xhMa6uN
         jVjLD6OB+j9FIzHs21YiaikNA6vIyNbzOEQmFgYvJxv2GdnzTXlzSzLwK9KDsMRphjU/
         hXVUBsVdPFckLb8ZdbGGQVBAgxTgO/AqJ5WZ77rIDC84iDE44/6gjixjnW3BUZqEUbtH
         OAdV0gSrK63gEfBhy1rWK4wv5xwN1perFFIch5Zayu5zMqw9ieIpMqvC3Wu+DTWrhfkk
         NDYpkptEEOIXAIibotoFb6ayhDk+AK2AaYfepEbuQ5sYUGSNAgMJCu9IIh/t4xSViWZI
         ItLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786177913; x=1786782713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKPZin59jcLEgsj7vGd6U8AiKKUkanMgykS2/LGEdhs=;
        b=WuTkrLYFIhLa6nqsWn43zWKg+3wjdtcwi5LdRAkAvsKka7UALi8ETnx2k6IMP2bxui
         ifHIRgIGkN0F1ulACIX+uX5eE2G4IJDsBTnZ9sScVA1wWV2sXkaFPkLgKRDIItRYzAXx
         56K/NGej4YjfiX9C0Ljg/QoDH+4ySUUJbX/HIyCNVAe1P7DSZpP4NA/rFXkqvEEbqgVe
         U7L+ZybhTHJc6NpKsbVyeMlyD/RSmLVGriaUKjgtu1EnWjf0iqXFnJdll4SHReeEvCWx
         1W4uHhSTZbAysgfm3iozwW2kXF0YUGhtgTA9FkurARv5R3+EcdM/GKj2zmXH5c0egcBE
         rlNw==
X-Forwarded-Encrypted: i=1; AHgh+RqT9/poH7rVE+CB/rAgYADfOdG+n9mnohDm2aLQMtLIS4G2u91d/lXcq1pp308Ga0syOVIOw6NIOpBed5+brwX4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn+beA8wkygZ2MhWfPahNZsYt1H7te3koCo1xP0Hdb1xODBHSS
	WZVIld4mEpZQs5EJ6qG2SOtNfvTuOIjr/i4P1/p4Fc11E15SSBZu73uu
X-Gm-Gg: AR+sD13wPHfgWIws0xDlw3ez+n4gAGYVLNfBqLfTVs6gWhTwDQypvLcQRQEal4SMf5U
	1cPvl9pLk+zWMRYfjCXxzDV7Yg6MBoIOrffhJXHeIZwPEjRgxYAlqZIx561Pr3jJoKFtQsuMQUt
	DLyFIedVnQFcakpgMyihnt9QC8Y4nucSpdY1/v+PYkeMj/rOIego/drHG50tzZN0N8aHnS5XjER
	11/767kEueLPcOU0oefYXwzvnBdi/KyUXER8FpH+sUU/Hif8n+5/Frb2uqJi46aHecEFCdMivfi
	hmhXSepbkGrWh0UbITinrqYeeYhuUD1ac4lobBLVC25vebZy7MyQzvvRyuzlkw1nkq/7lg29mFM
	hMa2woktaDt3nK5qgtl3xCzBNjbCA3zDPxV036sj/yuQiv9HyzLLzaW+ju62FkNuYCswm4IiW0Z
	/7WUinvY8ZsSDMXtMQhwxJwtHtW9QXpQP5pjHHskfk+B8=
X-Received: by 2002:a17:90b:1d4f:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3903c5381d6mr27967961a91.5.1786177913049;
        Sat, 08 Aug 2026 01:31:53 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de9f6asm7623040a91.7.2026.08.08.01.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:31:52 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: imx: scu: fix autosuspend cleanup on probe failure
Date: Sat,  8 Aug 2026 16:29:33 +0800
Message-ID: <20260808082933.2692878-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_013154_145194_1A8921EC 
X-CRM114-Status: GOOD (  11.95  )
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

imx_clk_scu_probe() calls pm_runtime_use_autosuspend() for non-CPU
clocks, but its probe failure paths do not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() calls to the probe
failure paths before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 78edeb080330 ("clk: imx: scu: add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/clk/imx/clk-scu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 9b33df9967ec..6d29fcc2306d 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -542,6 +542,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret) {
 			pm_genpd_remove_device(dev);
+			pm_runtime_dont_use_autosuspend(dev);
 			pm_runtime_disable(dev);
 			return ret;
 		}
@@ -550,6 +551,9 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 	hw = __imx_clk_scu(dev, clk->name, clk->parents, clk->num_parents,
 			   clk->rsrc, clk->clk_type);
 	if (IS_ERR(hw)) {
+		if (!(clk->rsrc == IMX_SC_R_A35 || clk->rsrc == IMX_SC_R_A53 ||
+		      clk->rsrc == IMX_SC_R_A72))
+			pm_runtime_dont_use_autosuspend(dev);
 		pm_runtime_disable(dev);
 		return PTR_ERR(hw);
 	}
-- 
2.43.0


