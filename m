Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76FFCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XCbc6evCAnW5/Lk0bejiMZ9J5LObQXJ3ouBPH/v5c+8=; b=jSSQc6gE+Q4iljwPWjLIC5VsBz
	cD2R1/JmO+j24F0Qot+bHwwrtSanSt6k691iK5B+x7QkDSXdTL8H88aaGX0kOLt9C8k8JNSVTSuKm
	VS6jvU95E/SlvVC2aYrwYNcFOV1pubusFMrLOQNRRFAWJbVKRNOjl3BnQ/8HRGR169tUazntnFZ31
	S6tNN9Zet+7HEr20mbCakqqBbvwFVbAtE2DT3SvnMNEfdrGnbUdtX0kmoVOSfE5I6rmmNydKDV69V
	XqaksSsbYasF7pBs0URl3FxCsBu+7aqQled1SMrQvLktGX8+nznIWHymbJ42L3P6iL24/k/R1BnKW
	V7F0LwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPxc-0000000Ayp7-454q;
	Fri, 22 May 2026 13:30:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPxa-0000000AyoB-2Pd5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:30:43 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bcd730e090so57608355ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456641; x=1780061441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCbc6evCAnW5/Lk0bejiMZ9J5LObQXJ3ouBPH/v5c+8=;
        b=FxH9+f8qvqfQqHWz3BPFFkM9Tfvp6+5NUL6Ips/XZs4XSN8bC3gyf2/GHjq+kE2qzM
         GRahUUKCeIE92WRS0GjXgH32WokSyWk6F+NHm+tjg8yBe9ctSvOXxALx+0xCMqub+krh
         PDZBR7rykQx+noDCgda+zdapVl0pNrwz+ZQNK8ZHwIBJstgLaUb2S2ErbcDFALbQJZX/
         7noPt9Xw5DE6n1jm2dTwPof4SVi+aiiQTp1IkJEGta+MJUcwrf7zGkCOZqFaVtsDuzQs
         yJk3mjArs5Qlevf9zmdyvRKnE3qmLZYBndJwON9qS+k7T5azWNpm0Fdf8oWHPYAM4CUs
         By/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456641; x=1780061441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCbc6evCAnW5/Lk0bejiMZ9J5LObQXJ3ouBPH/v5c+8=;
        b=ENmpd5gMcyduUrgCwkXEe5boIa1qo/ZrpC8P4lRA0fe1IOGN8xKtuvTIgO0mzhJYWJ
         xZRHqt1ifGlNiUmgBhFip1fXZfXjwaKFN5JXdtRtjEimPXArf/7ySXK+NRNLUm3BuzRl
         Zkm7jVQceh5AB6ELBqh3OgWZaE1x7qvBk7KBZKGEBE5WM/5j/4577GtPsQWODTw8Pe4c
         D2LnZ8dTQ/8QizTJzxl/hyFhqT0HEncmeLUWKG9AsPSS3xp1DTRb+ZRAVODnmSTE97jw
         rHhMfYrwWPAuFy9ck/zKo8ncB88PeDj2VD7hymek6mc0rFdIDTnsi/ukZ6wzTLKinE+s
         YCGw==
X-Forwarded-Encrypted: i=1; AFNElJ+/A+8fSyYIte+KP7MN+KP/y551YBY40xeGTaroRHbw0sUBSXOzkVxVHvq71kz7JjI9YPZCJ/L7eBx9Jh1g2kFX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd9580FjAeLHM3xwufE9tbeLWZPUkwCuxnjlUPl2Jg7ldGvoIe
	JC9UA3tiWELvSSKQrxVHC7DJ1OjEFn2UF4dIVrLXxMCC2pSuYp19DZjg
X-Gm-Gg: Acq92OG0SwLarVJj8fkb+PccwsVcwy8/r6oS7uuMObO4LLosK115lF4baiJ7SiOIkpW
	zHSsmpX1D1DWsvAfiqg8XLNlSz4MMNX6kvUzb5KRsWyemqHKdBG+YSS7DZd9q/J2K9kF4uHDBR1
	ZVCHp9P2eRY/pnPX5xM+GKyy8xfRfudFRWld7fGqP9f4KK8VQeB6sQvzp1niIrmlOWpuOwHZkzG
	pZSn6DDPpC52A42jjrBsRurIRUt66D7mf29lTa/4uzXSvZnjzFulE94u9DMfyXf0hD4p0pDaTb7
	lD4ImZRHkk393WTNYUyQ3g5xZzJJ2aanrOg1DxheADd57OuYE09fWDRv8yRNbIHRq06q2S8mqxA
	tsLBGiZERk1/DM0QSuGWjgkB4t7uMHauBIyVUHDzoH9/IPb3eyQxrywyWRydRvn8VHEPkSJRvpJ
	SvRgAoYN3FcJlnHJU/ptWCHB8szkHo0QVVNMI3XD8f1gcBiEYDIkWvc64Yd+oSJ9BFVEgFc+/lR
	yj3Gmg=
X-Received: by 2002:a17:902:ce84:b0:2bd:3bfd:74f2 with SMTP id d9443c01a7336-2beb0593137mr38054985ad.10.1779456641134;
        Fri, 22 May 2026 06:30:41 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm25147605ad.6.2026.05.22.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:30:40 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	laura.nao@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen
Date: Fri, 22 May 2026 22:30:23 +0900
Message-ID: <20260522133023.355404-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_063042_616016_22C4765C 
X-CRM114-Status: UNSURE (   9.76  )
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

The MediaTek MT8196 vlpckgen clock driver uses
__devm_regmap_init_mmio_clk() by devm_regmap_init_mmio(),
which is defined in drivers/base/regmap/regmap-mmio.c.
However, the driver's Kconfig entry does not select REGMAP_MMIO.
This causes a linker error when REGMAP_MMIO is not enabled.

Fix this by selecting REGMAP_MMIO in the Kconfig entry.

Fixes: 2f8b3ae6f0cb ("clk: mediatek: Add MT8196 vlpckgen clock support")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2c09fd729bab..fd8440122ec2 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1006,6 +1006,7 @@ config COMMON_CLK_MT8196
 	tristate "Clock driver for MediaTek MT8196"
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
+	select REGMAP_MMIO
 	default ARCH_MEDIATEK
 	help
 	  This driver supports MediaTek MT8196 basic clocks.
-- 
2.54.0


