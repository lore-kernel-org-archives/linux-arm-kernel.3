Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24D2C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+CtYN0tgKPETVlmb678BLgBAA4im2S7f1euATyuMTj0=; b=GvjhuTxxZrEumSy9poqmOrwhyv
	+MhjznMxpKkn9ZKuN8PWXfMZxuUwL/lk64dFaYd7e4UcoC9bID7t0Uo7J4q67LijEZzLY0x7q3Nh6
	qUAZRYZhhMDToWT9r0wkaRYCD0srOx/YHo6y6lc7snKL8wzWk8GEgVzxrMXMqa92AC6zysCUp0ZGe
	xsUFm1g5WDnNGWFioWyn0Jyo7rsPrgCWcv/r/AL4XVAhsH3KsRieyz9LRpRDpzi5wW5rgPB5tCUD9
	Wr3hRq3G1eUsYnwjLjzlm+DPyVz0A41kLjDqxHX6zkGh2xlcuWiOo3m90XaWc9/n+oENenRap/nIc
	2EBkZ79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66aL-00000003jF8-0YeG;
	Mon, 14 Sep 2026 13:19:01 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66aJ-00000003jEI-1pZ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:19:00 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747eefadfso4046845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391938; x=1789996738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+CtYN0tgKPETVlmb678BLgBAA4im2S7f1euATyuMTj0=;
        b=UCSKyr6qXyRGN6oExtLKuwTpymzbJvC+WrZ7jWTqk8vuqru+P23nFgnQlIn89cxWfR
         Da56KPvJNpi20BPkvGw/n6uxg7AUYn1iA9+mH4JruLLy+cmcNL533d8Y8+fS7HvWdCAU
         ZDAPo/IgoJhMZPSyn1/sw4yNCppqSZXT5o6cLX1rMSTHRIpgOt2Yt2Cml7Wb2eHVhY5C
         8VVw1V0fVHVfNmMGzBYzeW4S6jC3ErMexBr8YC13TtK6043s3Hyhl9GdT+N9067EhflZ
         KvSjzSQssdXLmmhBg+d6iiA9t1a8QFevOSOY8HwZDb7Ab4BRb9rOUbIf+ddE6HjtfsMK
         iz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391938; x=1789996738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CtYN0tgKPETVlmb678BLgBAA4im2S7f1euATyuMTj0=;
        b=lg1hoa1E2758msh9LcZ1PqSjT6nW7e7IzYhflmvfIcgb0MKBkEUZdp5X8nIn1FFuTJ
         qPSDutLsXCSIjLLePKLE9yBxHO3ka+czenvYS3NSt7wd10MpZkHu1ytr8TSDoe+r4S8K
         3o+zMKC6iAOltxOxRj+ks4VGoVsIPpB1OGJh8j/s6PT3t5gTQ/M6O+vSwiL+CQr/ZbBZ
         Tb06uLxvhG1upytPY8ASxkk6pO4Um3RTaO3y/axuEPHWZIcxxa4bjel0oBc1lbkpmxC/
         hgUWsrC0NwOwiCvUonE4z62AVghIUDdEXTheZxuz5AB54xxnqdbjxcbXDbFWlmHsBtpX
         Lmuw==
X-Forwarded-Encrypted: i=1; AKwUvBxGR/qMxWJOVz2NfFtKk+gyMPfEzHgLm3Un/8R6rTH58uv9d3HyCv796damg4gL4/qgJcjwWemV+zmwA5MmK0jI@lists.infradead.org
X-Gm-Message-State: AFuF++kO1o5FCpFDW9hfExQCtMOGP20oGokNB2fAFY8B9KLGrjcB5BSr
	6yV5x9W5eiTR2ZamPwK/ut+l5Z0NnuAUbGHp6ufCyP6RI2nBz2bUI9zx
X-Gm-Gg: AYBFou3AYO/R7WbCyyKHbxvTPOiseR0JBWIfX0NWUNx96vz6xS1kpaJ9xAU9c4ICUEH
	1tix/XlcAZcW55XUtGJY4TEhxBf/WDSL0FnTZw+Z0dD3MU18vNu9KYZj+lRNNbM7Qb57loUik7I
	woeC9bZ81jgb99w+2suabIo37+T8bUrL9efaistUxDOkR4ExDb4mOldJNfDvfVuoln6IkoNU4pu
	DKCpGUmcb5P4UNW30fTRv07nZqlzY2vrnjp3sbnONTni6ISKdQosz2KE9qswO0uTnujnJQvpZN3
	72XC57RE38gEsSxDhFChLOnQYWPSeSOwbtWnxNXjqcpYac0Cv1RuAmE0CdaZvUHNuUhsR2S3h2j
	piMdtD3Wtd6isTeZJbBeVyJPA7StCtZG3UcsMWNjrsfSVFPKNKIoOf6+u9Z4V/+QQRXwT1mvdxu
	BaLIkT9YR3yh1/dDjBLP+Y6y78o0GEwRLktMTHOZ7BZDhMP5JlIOlAW/Gsn3YGnRx+4SOw0k6gm
	RkmlHSgXUmx+ui2
X-Received: by 2002:a17:902:f791:b0:2dd:7370:e19e with SMTP id d9443c01a7336-2dd7370e21dmr12996905ad.16.1789391938060;
        Mon, 14 Sep 2026 06:18:58 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm40753855ad.4.2026.09.14.06.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:18:57 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: ma35d1: fix permanent clock reference/enable-count leak in probe
Date: Mon, 14 Sep 2026 20:18:50 +0700
Message-Id: <20260914131850.2331670-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_061859_475551_A386C17F 
X-CRM114-Status: GOOD (  13.16  )
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

ma35d1_rtc_probe() gets the RTC clock via of_clk_get() and enables it
via clk_prepare_enable(), but the struct clk * is a local variable --
never stored anywhere, and the driver has no .remove. So on every
probe, success or failure, there's no way to ever call
clk_disable_unprepare()/clk_put() on it -- a permanent leak, and since
CONFIG_RTC_DRV_MA35D1 is tristate, each module load/unload leaks
another one.

Replace of_clk_get() + clk_prepare_enable() with
devm_clk_get_enabled() -- same clock (both route through
__of_clk_get(np, 0, ...)) but devm-managed, so it's released
automatically on unbind or any probe-failure return.

Fixes: dc0684adf3b6 ("rtc: Add driver for Nuvoton ma35d1 rtc controller")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-ma35d1.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-ma35d1.c b/drivers/rtc/rtc-ma35d1.c
index cfcfc28060f6..43358d68565a 100644
--- a/drivers/rtc/rtc-ma35d1.c
+++ b/drivers/rtc/rtc-ma35d1.c
@@ -221,14 +221,10 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->rtc_reg))
 		return PTR_ERR(rtc->rtc_reg);
 
-	clk = of_clk_get(pdev->dev.of_node, 0);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to find rtc clock\n");
 
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
-
 	if (!(rtc_reg_read(rtc, MA35_REG_RTC_INIT) & RTC_INIT_ACTIVE)) {
 		ret = ma35d1_rtc_init(rtc, RTC_INIT_TIMEOUT);
 		if (ret)
-- 
2.25.1


