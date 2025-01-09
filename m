Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAF3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dDoiMsFnbn5JUQtcG1rs+LkrtkLOU3JtO7LMBBVfgVo=; b=5GtkEf7NqKGIwc98LF6rp3C7ar
	8cipTErnlUS+Hko+LnM0z+cDW0E+dcHLmgRKYNCdCwNiIrNg1BIPSjdhiGbzOtaHdhDP3MLGQGKa/
	m8t+FhA2MlKhzBc+HY/kFMcO8gpNhiHcNexJrbNltU1SykO2wgndL/f+B/upww+rLMFOrABInE9TF
	Dwppq66sKjTbxwfm5FbTwFHZK0riuV5P4VQmv96sZHdBBWjR1825P8UVfwgFoqRjk5+DN3Kqtk5Aa
	Nt5afRz+Ry5nLgaz/QoOTWL27rFdW+k+eD6tsWPiVWbuV6ZOaa2ncX+O6NyE8CVsvWRZywrD+xyuB
	YkkkfUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVv66-0000000CcDc-1BQl;
	Thu, 09 Jan 2025 16:09:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVv4s-0000000Cbw3-0OFx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 16:08:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43618283dedso11556035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 08:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736438888; x=1737043688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dDoiMsFnbn5JUQtcG1rs+LkrtkLOU3JtO7LMBBVfgVo=;
        b=CoXUzRwEyVKTBBBXFZclpWMKKJkl0besy7B2ornquoJBudwdfZiajxigrdle1bPj7p
         2rQGhrsfH42vi+SznXQWTG0T8OpaSOJAEMzmpdO2gmBfaGH1Dd3l/PXeP9z3rCQcaIQT
         P4J3tTtJDlU0rRHQjwSHyz1/hBWVfxfRsF0Tpp9P6/h1rVDDWk9FzvUNJ+7ppkrHi9n0
         G8lnxx2U0FlY8CnddKDNSh0NvXrwA2v0jAzWFfwXh3NrrRnDk3/Qq5LULC1L5xUHopMK
         SJFv+MNulfbv15w46zkvLyZ8rf/q+jRgVeWRXdeILiHaAQJRC3EJUx1tjsx2Lnr630+r
         h6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736438888; x=1737043688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDoiMsFnbn5JUQtcG1rs+LkrtkLOU3JtO7LMBBVfgVo=;
        b=GUqC1d8Bl9GjS21K3zynLrA3lcHCGv7PWJruvWkmxwJ6Dq7+oARja+4+egg88UWifY
         S1/cgsIKaFvHpFXVL601cJmiyi9sR9J8w7R4nc4Jou5MF83CkrLrK3aQn5psdSnuXpfv
         inqy8PB9nws0x8QUx4a2zOQArigT53RAWrwPf6uylKa/Zo8CxzQBGp2A7J8Ohty4R8tg
         7IQn4ZJNEAxJ7HkxPtyU0b2Z0es9PiUq2m8sT5n4MbQ9+c6vgDkMrJNaL2lyTY8CC/ko
         EvWex0orIwQqbw5gzb5VYFdzOpRo+A+NaxxZ95anP+ryaL5Di9JF9LYuMJu47Vp91N4S
         EmtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq1iE0SvlKYnEjxfxkHZeaeAAbLb5cD4JbDyhFRvRA5QWWb+ugmPU8MNan0ln100bSwIa9mVN2SOcpERjS6tIL@lists.infradead.org
X-Gm-Message-State: AOJu0Yya33x0smvWzFo9WNDXIdJ0zmBdCAXYOUOZocNvlIT6V4c+l+CV
	yBW/f7fxBIQG0NndCQPqbHeBAVo8HO39QO403OU4nUj1mYbLXzBN
X-Gm-Gg: ASbGncvzmCLUKZJm3rGeWk7jGc9ElvsIHMcM9jFVcc/SuL2aGHae/9VwUE6E3t7meX1
	HHbwWBMjTUq/3kPFnDdIySVOkZ50cPliwjYTBrQ8/gQGxxJ3WoEjtXM/kay8Fz8jhcbNbcvbUPl
	EsWL3+aZ+3FhtBSLH8MMHRrAyT4z6OP1mdoL/5PW/j2B5zZeanhiaOVwvV3vK3hXLim5yBExAOb
	qe5czb80eGOCbhJbjEMxm57XVyKKHK0C+1T69MOWtMDi5bDsTtHaTDV
X-Google-Smtp-Source: AGHT+IEsGCIC45RR7BVCyQeCR8u7TPJ5P1zGMYvvoU4MqQxYu495kCeS24QxHR3OQGZbTFPwVjqHIg==
X-Received: by 2002:a05:600c:3103:b0:434:a746:9c82 with SMTP id 5b1f17b1804b1-436e26ae9b1mr68525405e9.5.1736438887686;
        Thu, 09 Jan 2025 08:08:07 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e62333sm24728155e9.36.2025.01.09.08.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 08:08:07 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"'David S . Miller'" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] net: stmmac: sti: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
Date: Thu,  9 Jan 2025 16:58:42 +0100
Message-ID: <20250109155842.60798-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_080810_131432_EC9D6847 
X-CRM114-Status: GOOD (  14.98  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Changes in v2:
  - Split serie in single patches
  - Remove irrelevant 'Link:' from commit log
  - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-5-c7d4c4856336@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index eabc4da9e1a9..de9b6dfef15b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -313,7 +313,6 @@ static void sti_dwmac_remove(struct platform_device *pdev)
 	clk_disable_unprepare(dwmac->clk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sti_dwmac_suspend(struct device *dev)
 {
 	struct sti_dwmac *dwmac = get_stmmac_bsp_priv(dev);
@@ -333,10 +332,9 @@ static int sti_dwmac_resume(struct device *dev)
 
 	return stmmac_resume(dev);
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static SIMPLE_DEV_PM_OPS(sti_dwmac_pm_ops, sti_dwmac_suspend,
-					   sti_dwmac_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sti_dwmac_pm_ops, sti_dwmac_suspend,
+						  sti_dwmac_resume);
 
 static const struct sti_dwmac_of_data stih4xx_dwmac_data = {
 	.fix_retime_src = stih4xx_fix_retime_src,
@@ -353,7 +351,7 @@ static struct platform_driver sti_dwmac_driver = {
 	.remove = sti_dwmac_remove,
 	.driver = {
 		.name           = "sti-dwmac",
-		.pm		= &sti_dwmac_pm_ops,
+		.pm		= pm_sleep_ptr(&sti_dwmac_pm_ops),
 		.of_match_table = sti_dwmac_match,
 	},
 };
-- 
2.47.1


