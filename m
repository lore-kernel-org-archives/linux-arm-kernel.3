Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A6CC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nxiYwftdpVqx+EtmQ8XKxOub5dhOMa5yQi0CUX9lyho=; b=stP6r3SxgSv0tFEKNuHnWseKaG
	VaWmwKx6EEWcxxkcSXM2bFxI5jGdII0I2iM51XynYIHMuX1Z9+410sLqvW8uuKNwvunIO1ImsjPvl
	1QolJQuFarLTei/Wi8G9NU6IZCqtMXpfzxynbWqqflTJvorwjDs2ztydcrb4h76o/SO8LUhUgg9xT
	lQ3nCQd1zUFtqImsxgPt3zh0movPUkVLhX1wV7kc4axYJu2nrzkeu48fQEjmiEfFxu2ZBF5aX07Ly
	YFUjngSA+3PLbQe+fuozij4EBSpjuOB6suC4KMPrMpvNXfNpoELuEcDbeHOINrXDls+DNTGTxrrZ1
	JcX60V2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJvR-0000000CjPH-2dT7;
	Fri, 21 Aug 2026 07:44:29 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJvP-0000000CjOw-3Pkc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 07:44:28 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-383cb94f742so752176a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787298267; x=1787903067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxiYwftdpVqx+EtmQ8XKxOub5dhOMa5yQi0CUX9lyho=;
        b=nxcoGJcNqJD3n1/VU+CjvMDlEydaCvfuJRXlc6Mm2l4us0lMwz8rLs4X+uG/2yiPxk
         3qdgeAYpwX/3lPR1QpgdXC1K0N8pElxBKA2QNCp/LuXmY12qO9jW5AlE3M/kN8IvnsBO
         tswmK1kHwjKy6JxB35aB3+RfKbAlxGRG16fDu3IMCfzAbji8KvYNeeJ06GxO+kxOJ4NN
         w9P2TSYKNfb+KMAttz2quJPbC6emBYXisCJcmGF62JjTygleUetB9f3b3g94qUOlAxeY
         FuKFGemUQz9LvSXSAuhLx0adFrt09QdTAnn1w2DOVjB6e/CFGEHAmS0/WiNo3sXvvhVi
         sBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787298267; x=1787903067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxiYwftdpVqx+EtmQ8XKxOub5dhOMa5yQi0CUX9lyho=;
        b=quDImKNwKXP1B4ZlVVqWGKsO/eKaz+Hnw3/faSu9mZYhymOuFaSaF11UQ1hPSf0EMU
         rMuUU3c+Or4l8LG7VGErE8zwYhjcbejK2bVTQhe5/grU6mtoy6oYtEnQhoaj1HjRX+Ea
         oeNq8r2XR7iQXTIRD+CNblU346GBYIG8vf5Fpf/9RqMGoLgtmRft4o9tgLfb4rsyWVDw
         2e2NGrKtxqtsRp7HVqSe+lo7kigaEtWvqNyA92gZ1XIKKyJVjMJqirPRY5qJVIxasXAZ
         uzsxeC0tmoCSft3kCY2AffyFax6g8McVCCzJH0/baYXQvaJgHUxez4qrrssBDb5sHcag
         WowA==
X-Forwarded-Encrypted: i=1; AHgh+RrB7xh3RElD4o1Ul6/SzkWMV88wCsK4cDLT/0qoId7iwP/oz64LFht9ItQHSXFAB3qPK5WStQnhs6MG/e0c0xhF@lists.infradead.org
X-Gm-Message-State: AFuF++l29xlrI+hvw3wU/r1jTW8ETteLhiWhl/Bs48gnSByGl4bWILe7
	GHnpopqVMcHYpC1OqN6Xd/UgiT4CdD+LDU4IXAkU+4e91urRbKVs4kIA+Irn0swdyg==
X-Gm-Gg: AR+sD12q7gnjxVOHBFz6bJmfoP5UVi0Kx3lrgH+hCmsWz2m030+kF43wU6Xj267eCsl
	RjE1yQgwXijIaOU1ubEQqhC+8vgnG4bS5KydnYNaY34IIyU9N401gWmnXl0wmSNSI8duW8ynTdE
	rUrQmuTz3TGscHbvbV++2ZlMEk3pPTZlZ8mwP5OEsfgIHRm7L/M781I6NeyqOxKEkLPqvoh3k5y
	NjpyRQH3kwBfy4tF3HnIthL69iYOtiy3jdt3Pnq1UvwE1uHAO7Cij5XKtbF35Bpj5g85hcg6xwF
	PaK+VedFqrZIZFxcDbtWdowZLkq+9tuodwSOmg4S8p0WNohhTg6dyn2W9J/s0i49/KblZwdZKG0
	D6k0NTHN9VAgYi481iPqEGbnHI+xyqKHpf0YJZhW6Vyoc7OXwXH3WPz4pDaKThYPLA0SxkD+uaO
	NoxrYg5zo68fpHumjbe0tEKfbLiSknc3RaF9IyKRlhlvJoBywtoU0emnUkdBB/E+qXdZFjrjc5c
	A==
X-Received: by 2002:a17:90b:4f48:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-395c336489amr7901357a91.3.1787298266888;
        Fri, 21 Aug 2026 00:44:26 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm2047114a91.15.2026.08.21.00.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:44:26 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: miquel.raynal@bootlin.com
Cc: michal.simek@amd.com,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] memory: pl353: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 14:44:17 +0700
Message-ID: <20260821074417.261168-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_004427_856702_C8944A14 
X-CRM114-Status: GOOD (  12.12  )
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

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from its suspend and resume callbacks,
also reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/memory/pl353-smc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
index 28a8cc56003c..047e42c8715a 100644
--- a/drivers/memory/pl353-smc.c
+++ b/drivers/memory/pl353-smc.c
@@ -25,7 +25,7 @@ struct pl353_smc_data {
 	struct clk		*aclk;
 };
 
-static int __maybe_unused pl353_smc_suspend(struct device *dev)
+static int pl353_smc_suspend(struct device *dev)
 {
 	struct pl353_smc_data *pl353_smc = dev_get_drvdata(dev);
 
@@ -35,7 +35,7 @@ static int __maybe_unused pl353_smc_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused pl353_smc_resume(struct device *dev)
+static int pl353_smc_resume(struct device *dev)
 {
 	struct pl353_smc_data *pl353_smc = dev_get_drvdata(dev);
 	int ret;
@@ -56,7 +56,7 @@ static int __maybe_unused pl353_smc_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(pl353_smc_dev_pm_ops, pl353_smc_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(pl353_smc_dev_pm_ops, pl353_smc_suspend,
 			 pl353_smc_resume);
 
 static const struct of_device_id pl353_smc_supported_children[] = {
@@ -121,7 +121,7 @@ MODULE_DEVICE_TABLE(amba, pl353_ids);
 static struct amba_driver pl353_smc_driver = {
 	.drv = {
 		.name = "pl353-smc",
-		.pm = &pl353_smc_dev_pm_ops,
+		.pm = pm_sleep_ptr(&pl353_smc_dev_pm_ops),
 	},
 	.id_table = pl353_ids,
 	.probe = pl353_smc_probe,
-- 
2.53.0


