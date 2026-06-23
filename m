Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B264CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NeXrq3s7XQQ03NTVUcOFA9RC9zObh9CMfGYLv0lwNEI=; b=138zIHhvOh9afKxqA7OsjTQ6Id
	ZGnjf3tPyZawPa9t24S6d6e3uikT0Gv7IX/SfNmg0D33Wc/qjmxTndjVpxyaSHxszC6yJNq90TMD6
	GjdgInAIQcwsaXAlPUEYUhu2OYHDTU1mElHkR1PMOaOZbo3DlhIxLm5RbSdsYVsi6WDstzdMJSzFO
	36Q4I4RyW7y8LmLIk86l/qwgaeOIjUCqtaxekfaNaCPkV65neEY+Law5LPqW0e6VtpkxJI4mMlNs+
	qB8ziQagmwXccxSaZ0BQEeSWcBFn2VuZ1TMvsviX8z9QUJwlvVbcMmw/0EQkFvs6hqKRDy03ZldTs
	SsD/X5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbye1-000000066f9-1GD1;
	Tue, 23 Jun 2026 10:46:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbydy-000000066ef-0LJs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 10:46:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4924593f45dso37929125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 03:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782211572; x=1782816372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NeXrq3s7XQQ03NTVUcOFA9RC9zObh9CMfGYLv0lwNEI=;
        b=ZVeKMLVpwt448xFUH2ObqZ3f1d2QdtUn4plT0k7GhjiID3offvMKNV5YSkzDpJs61K
         UFrEsXbuRK1UgYmE5trNMHEEhK1EiYApmFiOB3zFqz6pQIFhFsi/G3CdcnxOM1Dq/Rqb
         HDDwLOUDrA3FLi/6/xpqex70xS+ewkzYo0NYyjid3F36I8NCuT2vthEC0Yag4UkmTofO
         2f70b92kpTEuuyDh/5cri2XHxkzQ6WhlZbpw1L63wlRybuHldcneym5QcSljkbzCX7yG
         sUwrJ0Ph02xplADX74WS/rRz9q6SX0Lpt+s64Zw5F1AvYNYy7/09F/RGmQSytixGQRcW
         794A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782211572; x=1782816372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeXrq3s7XQQ03NTVUcOFA9RC9zObh9CMfGYLv0lwNEI=;
        b=PndszVqU/AKL65YduFp4bYfMlyE93qJP7n9ERTHZRtwVjcDlW2jn/gN5kJcZlI5vMf
         emRSCWOkQm4nH/BM5701wHQZv+JB6Ia3IWCZE7/QdtYB1RUQ+c9Ui5hM4lKmSRG+bJFU
         gNxzCSwZlro2fEQ1AMjtOJnm8X3R8F8+c9JHp5X+7YonyxK0ZHqPlrJXVTUHcM41y2kW
         K7TFmQ8WSOIAwt3TIhiqsoxKpH00nKTCsJdwID6xy9LriMy04ggkWGYFgcqUQQIWEzt6
         HlxiStHub9bhuQhEDY277YN3oTezPAv/eFGYGMR7MHTYyrQiYS0GW2ATlG0OD44GT5LO
         9dJA==
X-Forwarded-Encrypted: i=1; AFNElJ/KpcgpFA5aOtsZZ+5ihFLufqPjFC5MVRLRk74uO9MO/dVDoQqA9VOHuuVMIBWL8QKpk5vUbUk272NOSLu1mZGK@lists.infradead.org
X-Gm-Message-State: AOJu0YzxQ9cjDJqbagm1OmGLvHTUFWFgPXSwgWcSz2S7iD8Y6NE+6f9e
	badI0KRUPgKPVZ9Nn22bstHgvepBVgSxgD8UCYBza3BOXf/QVs7UVq2CGJLebOybLIs=
X-Gm-Gg: AfdE7cn4lPljW3vfHQ5D1xwSxccjIhLOKvk31zR8nvucIMudY+yICyRh0kj7FFLp4PB
	Y0yx4SPxkwIoUg7ZTQ2rBSLlCPZVsGF6Vc1t4gpGF/ADXI+E6oNaqpnNJiQ/woIvgwXCHinOoVG
	BwuNajTcbU4IRKS8+z7aw5roMir0w7E6GF3RvwvbHOdEUmnRZT7n2hTQRdF+LOGtWsNDR3CkYWe
	O2qlwMdWSdmn0bdcUNbOXh2lHzLBsLObumiQEn1jUsV5FGDjvSDyY11vIxKbeKGpSKF3E+zHArg
	0rXdpfZjOamzZOTt8IdSfcTc1UWuTN9tNM33mnauX7HjCZDicc5zX3IfW0hfJ6tAL59hHTsLCu7
	fGlDiJJLykMLb/3q5vYvDQvBrT3R3gtsuEbUa1vZS5QrZfBTWs0vOENHKPkmk8Mx4sStAjsTddV
	OJ8BXBcQrmd5NvOaJK4csL3CvEAoZbj5FzD2h9zTp/0ElsF72FtGugBHI6SvvOext4ArktjqtD8
	OptHnGqdrB7ss4=
X-Received: by 2002:a05:600c:4e86:b0:492:2f3c:d0ed with SMTP id 5b1f17b1804b1-4925b3b6a6dmr32351285e9.30.1782211571510;
        Tue, 23 Jun 2026 03:46:11 -0700 (PDT)
Received: from localhost (p200300f65f47db04fc6db6816c271cd4.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fc6d:b681:6c27:1cd4])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-492494497ffsm295458225e9.11.2026.06.23.03.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:46:10 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH] ARM: imx: Drop obsolte stuff from common.h
Date: Tue, 23 Jun 2026 12:45:57 +0200
Message-ID: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=wjMPVOYlQDUbbr5l/O1Z3Izp55XAJ8pUek6vzl+NKM4=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiyr5KeZ1bxvclSYN0ryzWjd4DVvquCtxSt7lodOrRP6X hEy0Sirk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJVIaw/xXf8WnFlD3W+lJ5 T/lFGpdftL3ntyQ4yLp1b/2krSWLe5l9hfqiZhxbpK0tWRNle+P2aSOhcre5c7Z2GExI/B7aVMc e1rC182PkjJh9NsqqJ1MF9i+1SbW/vS7Qrywlw3wN+1yjrMmF60t6PKely7cyK3+8ymW6+nMlR4 yi743T0cam9rsbu1339sxLjiq99+EB6+VS5m5Ww005QvZTXjxd6Vr6//G0l0k6+7zWF82/Fndcy v3RBvPlpdMUzqhkWz3Y2FPQXGj6+caE/uwDmS5KCReDloWcmNjZGN2/Ka6FY1+0wof14etk2XM1 1m1Z57Ch9H2E3LYFJpP1rzy3VlO0cvO8em5dsP+HFOXrAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_034614_143073_B855EB62 
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

i.MX21 (and thus imx21_init_early()) is gone since v5.10-rc1 (commit
4b563a066611 ("ARM: imx: Remove imx21 support")).

The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).

And mxc_device_init() was removed for v5.10-rc1 (in commit 8485adf17a15
("ARM: imx: Remove imx device directory")).

The last user of imx1_reset_init() is gone since v4.9-rc1 (commit
e1291cffcc50 ("ARM: i.MX: Remove i.MX1 non-DT support")).

Drop declaration of enum mxc_cpu_pwr_mode, the actual definition follows
later in common.h without a usage in-between.

All users of of_device_id also include <linux/of.h>,
<linux/of_address.h> or <linux/of_platform.h> which is enough to not
need the forward declaration.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

found while working on *_device_id.

Best regards
Uwe

 arch/arm/mach-imx/common.h | 7 -------
 arch/arm/mach-imx/system.c | 8 --------
 2 files changed, 15 deletions(-)

diff --git a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h
index 45c1a2a7b35f..d7ecaa822adb 100644
--- a/arch/arm/mach-imx/common.h
+++ b/arch/arm/mach-imx/common.h
@@ -14,23 +14,16 @@ struct platform_device;
 struct pt_regs;
 struct clk;
 struct device_node;
-enum mxc_cpu_pwr_mode;
-struct of_device_id;
 
 void mx31_map_io(void);
 void mx35_map_io(void);
-void imx21_init_early(void);
 void imx31_init_early(void);
 void imx35_init_early(void);
-void mx31_init_irq(void);
-void mx35_init_irq(void);
 void mxc_set_cpu_type(unsigned int type);
 void mxc_restart(enum reboot_mode, const char *);
 void mxc_arch_reset_init(void __iomem *);
-void imx1_reset_init(void __iomem *);
 void imx_set_aips(void __iomem *);
 void imx_aips_allow_unprivileged_access(const char *compat);
-int mxc_device_init(void);
 void imx_set_soc_revision(unsigned int rev);
 void imx_init_revision_from_anatop(void);
 void imx6_enable_rbc(bool enable);
diff --git a/arch/arm/mach-imx/system.c b/arch/arm/mach-imx/system.c
index e88ca027129d..1afae485f203 100644
--- a/arch/arm/mach-imx/system.c
+++ b/arch/arm/mach-imx/system.c
@@ -74,14 +74,6 @@ void __init mxc_arch_reset_init(void __iomem *base)
 		clk_prepare(wdog_clk);
 }
 
-#ifdef CONFIG_SOC_IMX1
-void __init imx1_reset_init(void __iomem *base)
-{
-	wcr_enable = (1 << 0);
-	mxc_arch_reset_init(base);
-}
-#endif
-
 #ifdef CONFIG_CACHE_L2X0
 void __init imx_init_l2cache(void)
 {

base-commit: ef0c9f75a19532d7675384708fc8621e10850104
-- 
2.47.3


