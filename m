Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3B8C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mLmbCLzuywYLsOVyyYkrBNI0Jw0ZVFv5psG5aDAHyEg=; b=XKuhyjT0qbN8FXPYCiF25VqdpP
	CIhvbcWltctyHiQszUMNeshvkJsxDaUhIw9iFGVL25VrQ8h5+bUXtXYLH8VG7KvKTB+TPTRtUsZVS
	ZO/Lf1FxCgfm7rGMkaTqyc3taBYIbrlInTxWZcGstmbdfge0cJCddpOtrRtlHRd8+kKBrmztbtVWK
	Q4BD42CUiNYkfmF/k2JDUPqYDRKvvlVhgFpPp6l6AuiAlafAIk9cYowNMGUDZC/Hhaswmmatk8IW5
	h00ckHZ5gbZPLRugzfsvv9CoJnn/JSL6V1bPL2xjXtkLCKvMHFeJr3BPdRa4y+vUemsxxgfwpfBi8
	clB896IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsc0o-000000099Oq-3Mng;
	Sat, 08 Aug 2026 08:02:34 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsc0m-000000099OV-3YHY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 08:02:33 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-39266382df6so313524a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786176152; x=1786780952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLmbCLzuywYLsOVyyYkrBNI0Jw0ZVFv5psG5aDAHyEg=;
        b=e0ZT8TqDKDTlQ7eCPn+0DCszpx30nMcdFVNMPDBNPA6NnzKoQx1QV2eV6wx8SJZ61C
         Eyr7FIA1XSyZCvJmlNMeLixk8sDgM0WcnAYinWGWQ3mGTTFKxIzYLMwVaiFQy2GnS4up
         ysTFR9ap1dll/YgNJJXh73aviJ88O1QGDdpSe5cv1mvP6RekdQI/5dRqX/cA+hi1DGI3
         R1Ey+uAeGmtzuSTRBTnmKzJGZVg9I1lW/iR7gE6TPFWlgzritA+xoa9wNc3zoAIa+FF+
         8qL+MrZJm4Pjl05CYoyl/CAfpMDz+fCNmL62M13xTfAxMOX5sVJaUC+UVUSeV+16B0Xq
         Pn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786176152; x=1786780952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLmbCLzuywYLsOVyyYkrBNI0Jw0ZVFv5psG5aDAHyEg=;
        b=sQ/+zDiR9++KA6vcamwquuxMJ9Y6Qjze0hu975FVc1wRr1CFnVZxvhdaA72Y5CU3Ay
         zygQwqEBiQcEFV2BkZxs7yMtcDFNjUb780zy/zS2wAP9N1X5tHJw18aXlwmr/QtXqLxl
         gY9eLRQKAFJac+4UxdKXXokshp7LfRFdVttdlRnQ1pKlIXxRPjf7NM0noSlo9EZXfSKI
         q3OJancCcR971hcMSVNE91KLMaa5483+vJcOkAuhTPsel8T/7Mjec3h3bfnKOui0Ndgy
         TFLgWUYvTGiHiH+eT8E2yzbBb+TAIhXnHXZNQQ8BrdmQI0X22BcKvvgvtar4DvMeepUI
         aXAw==
X-Forwarded-Encrypted: i=1; AHgh+RqAeJ1Wkd0n3KkPmHiw+D6gijeni9Mse1tBHxaKnwieVxPuSrfcj8bko334h8Tj4t+YSotdQ9s8FIFlYKiIWwEH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0AhZPhjxXmC/mb7qmH6k1qFPWLIzIPF0tC0zeUNVNP7q41awG
	LjSJXJOCbim4sFrS24WSjA53eGX4LQz+PkqOyzgahAj2FnzUI9OviOng
X-Gm-Gg: AR+sD13c8pIXPVy/pekGcxktOIsxWs/5MFj+cN39AUp+qLC+s14bobRhyRb42gSRAXx
	nU2ts9VCw1CXOgjHzTpX6fBBAfNPgL7cvF8UlcBBNCQ2j8/rYJEkxTfdUWGvzH4NQl0Icjqv1cK
	HWekRfT2TOwgB61EEVRUtZUySA69lOyEW9M4SQ1VZ3OYkTu0uks4tROmQdDNOWZo5VQSeuFCuAm
	U9j9CkUFfCq28VIeVjiJthSI1278TVnCYeUbSL4j+MnFn/GmIl+Yo9AutVxW7N2K3vi9T5D2/hn
	arjmQqK3BeM5nVFk98igQlOTsORyBB/3cPIGkeevnGiU3eyBRP5KFL2bff69kxsl/EaJtADvwY2
	mpDOR6HrJnRe+vB8VRWGjxEmkynmCJFoHL6KNydo2gzXCzGbqHdjQNnyemDDc1ILvaIYdkO2Cmo
	6GrBwaJr5j83Axivy8cZ3vkKmHpXso3S1w8NrkL6wlc3E4YcrkFqTd1u/z5JX7bUNCEikvCZWll
	CYiLd2Q
X-Received: by 2002:a17:90b:1d02:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-3903c599356mr29221904a91.2.1786176151990;
        Sat, 08 Aug 2026 01:02:31 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de8ddcsm7774143a91.6.2026.08.08.01.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:02:31 -0700 (PDT)
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
Subject: [PATCH] clk: imx: imx8qxp-lpcg: fix runtime PM cleanup on error path
Date: Sat,  8 Aug 2026 16:02:15 +0800
Message-ID: <20260808080215.2669452-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_010232_885903_2D07CA40 
X-CRM114-Status: GOOD (  11.14  )
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

imx_lpcg_parse_clks_from_dt() takes a runtime PM usage reference with
pm_runtime_get_noresume() and enables autosuspend with
pm_runtime_use_autosuspend(). The success path drops the usage
reference with pm_runtime_put_autosuspend(), but the error path only
disables runtime PM.

As a result, the reference taken by pm_runtime_get_noresume() remains
unbalanced on registration failure. The autosuspend setting is also
left enabled instead of being undone with
pm_runtime_dont_use_autosuspend().

Add pm_runtime_dont_use_autosuspend() to undo the autosuspend setting
and pm_runtime_put_noidle() to drop the usage reference on the error
path.

This issue was found by manual code inspection.

Fixes: 18cdbad40c6c ("clk: imx: clk-imx8qxp-lpcg: add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index 1dae3410ee99..262645bef62d 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -277,8 +277,9 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 		if (clk_hws[idx])
 			imx_clk_lpcg_scu_unregister(clk_hws[idx]);
 	}
-
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 
 	return ret;
 }
-- 
2.43.0


