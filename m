Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C27C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fosxO2aakWlymDAhSXtvCLChemt0o7MdN2FsRA0clTA=; b=1ogLtn/zEdAjP/sJwRhT5RoKHg
	bwjegp7FGus3yexru7gA1NcLqHMdruJjeV56sXDndtJdk4aw8nRIznMk9thfnlHunYWE2XksWMfF2
	KGQ9CapULHDszjwr7Ld9zj2N15B1tcmNBMpmVIOK3HxxajqGPOxKIjI9HEfXW25ZI+dsmlv+3/8v9
	gfkkfvRJQUyGvPNC3ew1df/XtPqOdD7bLz895OR06lQjHO1Pw1VkRhVALxy0IUllBsXju7BxZolrO
	zEK6DgeGvaRyHxzBp4Bau/X0mTWBv0+sKnGJbW/SiceTmtjNHz2F+VzxJLxGgov4PORHgGaoiQ2Y9
	kYxYZAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiy2-00000009UmJ-1rdy;
	Sat, 08 Aug 2026 15:28:10 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsixl-00000009Ulh-401r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 15:28:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cc891373e0so5576205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786202873; x=1786807673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fosxO2aakWlymDAhSXtvCLChemt0o7MdN2FsRA0clTA=;
        b=qCqCR7U0FdMSKtUzp75hGK+7rNBnL2eFZO4Uaj72FNUIpbrrVjJ2RsbQdENcq7rCGh
         gXMiq7zJ5AdN487OP585oyByt+cfyHDB3top0cFZzCimNNVv9fvr2EZNxQ8Gv6zG0JZ6
         ZifLj+wah04kIY+Cz2rkY/K6k679uF+FSJeLM9oraN2nzD28TsZQAf103NsLqkEogMig
         neJ5xmH1xNgd/NEcAjcE1hb39KeMGE4/16HxC4Z/8Wdfw+mze3vLBC3cdjLDil+lckhT
         laIl8lAGnGkbItOtSvO0W0QAnuBZHZxGpDqQLP5yHSVkKju0tjppMm6FmqOYVkzYhhZO
         at3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786202873; x=1786807673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fosxO2aakWlymDAhSXtvCLChemt0o7MdN2FsRA0clTA=;
        b=S7RcrF5nMU88Q1OQDkFZincTZq/WxdupWrhWNiqqOnJO0xH5fSNPvqNGRQW8BEoEpx
         1D7/3/AERqojZNv5BYwcSLA5XeekS70amrfLfcZNqdlhOhy5N9JXPfoJ04i3VIAHFAiB
         oX/M7zE0D0sgyXKWsBcYZ54+u2xKf+0Y506ANDjblYCqHJy+TR+1Y5MAXRbouOTEW2Hd
         8mNt/qT+TqFHhTr4jPRhI2JyvoWZ2mkX4SSyCWiM2qSBt4O3DfgFxTkbM4Vj0S2shHZg
         gECSW17cS9h8lxmp8hyPjJV0r4nj+7NJWFeKngNCM5p1k4T4d7EaPayckXHzowfOdfU3
         In0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqRE+D9vwjB2bdjLZHQXePw21dcgivLUXH/8EcUf9bRKdcL1+A10ONhlabTmGRJDi2vESCSdwPUCHUEiknGcZKr@lists.infradead.org
X-Gm-Message-State: AOJu0YzRww52C8y5T/P2PUHKqrkuWKBjT9MTbhjd0ZMZM/HHaMYWV5tE
	3mxe9nwfUiL3YS3YbNYqx4wEtFsJCLAyRzjbrg+uUGjfR0PVneT7DVcM
X-Gm-Gg: AR+sD10MpG/hyzIJWHD7gVDk2jic7UpqNlDOkvuFsyvNhyVdkp8i7JFgi+xwF70v0B3
	VSCSpioeaEOtSWSLKFQSWZWM2rXkvpuOizYuo6pYRh5m/8B1LcJPqR1TaI8XYilyTJmlYfdNpNA
	ZnkqxHZQY3rLFI+B5w5vm9DpcJXUHc/L/U0auWkTbVzrDg3Fu4WTSlpH6L/HyaxVOohTtPpUMgM
	OrBxiV/9zzWmpCtpbRGHOHkkjPE27XvIL+KX6eKhnY8M4X/03uExnIuUm2nrOL74KbsbB96Crzs
	2I5eCRdr6Fg3zWlYtc/sr6HEFHBitAj3szjUceGv6pwKIEfNtGcjjG1w1XOnWwGbl0Qd/4wr0Tt
	s78AIkIzoSLwSO3vimCmjzZIxi66q7IlTdVr+YbPIjgVxuuWRpQhB+Ko7MluWQ6zfRtoygciWmJ
	zJR4YuLNarxD5WoAZhaYNiKDuIcl9nsCQL+ft16CJ6zifR95XEk5Hlx6ELDnl4YHhdtbUsCg==
X-Received: by 2002:a17:902:e951:b0:2ca:bf68:2a54 with SMTP id d9443c01a7336-2d0ca96246bmr402478875ad.22.1786202872580;
        Sat, 08 Aug 2026 08:27:52 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14d57f8b7sm19558175ad.30.2026.08.08.08.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 08:27:52 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ludovic Desroches <ludovic.desroches@atmel.com>,
	Wenyou Yang <wenyou.yang@atmel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: at91: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 23:26:54 +0800
Message-ID: <20260808152654.2943371-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_082754_002471_BCF2FF62 
X-CRM114-Status: GOOD (  12.62  )
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

at91_twi_probe() calls pm_runtime_use_autosuspend(), but neither the
probe error path nor at91_twi_remove() calls the matching
pm_runtime_dont_use_autosuspend() during teardown.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped.

The documentation for pm_runtime_use_autosuspend() also notes that it
is important to undo it with pm_runtime_dont_use_autosuspend() at
driver exit time, unless runtime PM was initially enabled with
devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() calls to the probe
error and driver remove paths.

This issue was found by manual code inspection.

Fixes: d64a818859af ("i2c: at91: add support for runtime PM")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-at91-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index b64adef778d4..65b389d07d2f 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -253,6 +253,7 @@ static int at91_twi_probe(struct platform_device *pdev)
 
 	rc = i2c_add_numbered_adapter(&dev->adapter);
 	if (rc) {
+		pm_runtime_dont_use_autosuspend(dev->dev);
 		pm_runtime_disable(dev->dev);
 		pm_runtime_set_suspended(dev->dev);
 
@@ -270,6 +271,7 @@ static void at91_twi_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&dev->adapter);
 
+	pm_runtime_dont_use_autosuspend(dev->dev);
 	pm_runtime_disable(dev->dev);
 	pm_runtime_set_suspended(dev->dev);
 }
-- 
2.43.0


