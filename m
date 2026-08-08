Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAD2C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Be6DCppg/DEo+f3Oq+NlhfXUFVlwKCwHdneTqVx4xfY=; b=YZdYFehveJKbaGKpn0xlEFHWcP
	1va0m59AnhOLZ1a89aB/ohD6PqI9nmuJYCAi5IEfa2EYLucmkFj7mpD79U3x4e574ZBad2GsLZD38
	PU4KPDxmuuLSij7r6e9My4IXvZdF5hP3/nu+gi5B8eDnnSrpdFC5Ur9BOYyM1FpG6UgFD9sxzVknU
	YI5oMiRXYyNh0043ANwl3vcPPtfVhN8JZz2XDhxoZp8X6b8LHXq9GeUNeKEPRw1B0Z105qUSPQSg+
	1hf6gK9Q+xo31dmBHIoQxG8ZX1uQnrHk7ejrqdfZtweFXhCT1G1rnDZ3dTMJqia4b3XqVK6eXOPFs
	bQVgRS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsejr-00000009IBg-0NrE;
	Sat, 08 Aug 2026 10:57:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsejo-00000009IBG-0nih
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 10:57:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2caf228a910so3079935ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 03:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786186631; x=1786791431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Be6DCppg/DEo+f3Oq+NlhfXUFVlwKCwHdneTqVx4xfY=;
        b=fd/voy8gy2LPCgP7mEpTCE18DWrF7P/SaQfEO7PMXE3uMXNUQDK2uiFvB9/rxgNpWS
         qNGzO6htxpCXLFYzVJwnDRSCjEpap9N1xWPJxZdW/bSXRhPQ9jT12omy1TJ0369xUXSb
         dqHdGrY6ZT9SiwbvXKqyUxNKBA9xPE5Uhr5VpsSMmW2isUOS8V01fivhRTlFUn2epU8W
         PL9L74Qp/UsqeA32JfbF/CCyZkeX5lWj4oOKW75ZW1hSSdYIp8VNbNb8lb93skPXRZLD
         KZ37k/fDL2TQU1Z1BolnyKlqUsBsKUOpGqfhAk+/Vcw4yPbA51li+tO265yBQ7MIXfcC
         fAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786186631; x=1786791431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Be6DCppg/DEo+f3Oq+NlhfXUFVlwKCwHdneTqVx4xfY=;
        b=B4Mw+sRgITRmp+kvAPCntAt48knX38wRpOFt83D5ey0YnXT8tg8tTLNzfnffouj4S4
         5CtxFJvbriIqliTEzjiunCxsnHFa0wIb2e65Ttd1bDBn/TpfwNkOLbNmrGLsZ6DsOgG9
         dJuFKTeIMYW5Kzcqm99wS6FB3oZ0aLj6LunO/jvzFqgRH/CmHud/fw2PCkw6WkFk0g5c
         2emJ58fCAxqDuQoaSy5A1WVDJVTmcV6P4FZRk+Is5MO+31HchacU1THJZ+7mWob/qW9t
         2eXIuLin2Gj8Tvw6xD3yKePXs8NHjHlJhtTD4Bk5ECxflLJelaOrfesUAFrJXpdqy+WW
         ilug==
X-Forwarded-Encrypted: i=1; AHgh+RqLRHflZLfvbSR3hgu6gfzGhFAWwvozptG7dqEObOvlKlSMiDFRixeS1t32xeTvoH2XkGWtjK7cqPp3Oo5vQzy1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi6qL/fqtE4NGTuM7SDIbKTf9O9aAZmqoHjS6DB13uDgTszEgm
	dGZxGkGbSYM5B8+P+V57i5iF5PCGmoIV7Q+yuphRttJeAlzzpWq4S+uk
X-Gm-Gg: AR+sD13dJttwnmt+zaw4rLoVusj6bnCJYKnp7/M/6JdJWp0VAqZWqbvBwaN8dj0aAiH
	pDfAPKey0MYSz51b0fiFJz2owLGYooCfs7/Ko5KayX7kcRlu87X9QT/qTkbsyLIFDvFqrAP782A
	+pqnGCciWNaeZEPcE49nesiY93F6+ZP0+j9YRdCB5BePPgpwbFweYsUUAMgYuuv0/CQWT75Q8n3
	Le3UWGwBayXY9YrGEWjiUc+G2kza+PsiRsOy2JHWSk7h6YUNQFex43ZUH78hcKyZecNhnoO3mJi
	77v5ZU8mb+9qeC2f88WAmgtJU1jo96mEakYZKjrfzlDj0LcpoVqVu3MYtrW1FK3x6RYWI2Cgcft
	PnBCp50wu+orqg/gtTe3zpiDR4IkIYXFqiVKzFApf2wADZ79v2R3FAkzTVh3QcqGDYVR7yNvMxn
	6fxs4kosY2e+4Va9QqSvwFWzIYvqH9mlN211C4+07j4IboI+S4Bg==
X-Received: by 2002:a17:902:e5c1:b0:2d1:134:b86e with SMTP id d9443c01a7336-2d2a845758amr69362385ad.2.1786186630914;
        Sat, 08 Aug 2026 03:57:10 -0700 (PDT)
Received: from lgs.. ([118.193.39.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14da67e21sm17661175ad.37.2026.08.08.03.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 03:57:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Srinidh Kasagar <srinidhi.kasagar@stericsson.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <djbw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: ste_dma40: fix autosuspend cleanup on probe failure
Date: Sat,  8 Aug 2026 18:56:57 +0800
Message-ID: <20260808105657.2762974-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_035712_252735_FFE74164 
X-CRM114-Status: GOOD (  10.67  )
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

d40_probe() calls pm_runtime_use_autosuspend(), but its error path does
not call the matching pm_runtime_dont_use_autosuspend() before
disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/ste_dma40.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..e2ad50e0fec4 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3654,6 +3654,7 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
+	pm_runtime_dont_use_autosuspend(base->dev);
 	pm_runtime_disable(base->dev);
 
  report_failure:
-- 
2.43.0


