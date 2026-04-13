Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E59BF34C65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1OPjx6EVJFqbaOhHASpBQer7/3sJPyccCGPM9+uBgBU=; b=Y2eoCRLki0TJPwne4inhI6FUXf
	8GmzmAvWh+boRCiHaDupmv5xMv+OGoz0I/NHv4u/ua6gnpmXv+N2sTLwP5HEhyhI7eTcqPch0PwkH
	/LqY4WYJu1ROfnidwMK1aUupyZMTN06ZABlkHJnWmWhFRgbL+iusJRkdZ/GviYexkMJRZ+i1PoaJV
	mgkHWmfCaf7CMLxCXyZGMAmyoCAgK9zsDittRgfFULCDepz7xIHiPNTtRLLcImzuW1a4F3j8f04Lj
	iiukIJQyNexBPZY1dyg6I3LBpbY6zmDKSinrA/RwNfrMvGifh1XYHS9sUg+Dyv9WIeC6HtDx9IcmL
	RHh9lVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJVs-0000000G09v-2j7K;
	Mon, 13 Apr 2026 15:47:48 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJVq-0000000G09Y-2WuD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 15:47:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-35d95017a68so2865366a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 08:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776095265; x=1776700065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1OPjx6EVJFqbaOhHASpBQer7/3sJPyccCGPM9+uBgBU=;
        b=d4oIvyRmCO1hsOBiacAkh/YxUYEETLzvwGxPpDRAP0HlUHMCmd5E2Qt/vNhl0czIRR
         G0p0KZh/UMVD23oVd7FMFbjMwbjVAptEKUG5uexy3evld8VGgJWf1vQFpvNnuI+NC0iy
         cpnTVhn3qkVetH/hhuMPKJ7jHTZ+HMonV4HdjTvUbSMY83gTSWDZThxF9rKQH9fZE8Se
         SLrt7LukOs41//R+EatGMlgNMkct3AP0eSIB0RAL9S/r7af16sTK4kvIOpMJBuAEKu07
         aMhH+7tHf1qDiK00b7TtIcAZWVC8R9S2NL8tIv6oR0wgabsWM6qoSwJ+1ix1Va8cc/6w
         jJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776095265; x=1776700065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OPjx6EVJFqbaOhHASpBQer7/3sJPyccCGPM9+uBgBU=;
        b=l9y6c6hmF+g/OHo8nOmIZxY3AsVHugQJkS+Np8EouJKCW2MhCUADQifbOAqKbNZof8
         Aufh6MBV8LfGIMu16Cx/hWzTbLHOPa0CUA6nh/dondpc3DBiULK/a7wMaq4JRgrtqxh4
         1a+O/pqZz1DC3wILUT1qmIwTb+aHlWhjXEMsaqgGTQtlLVEg1Ig27rCg396V+AmetiJq
         WqXgCbEGisd42EVXbeLB1i05NnpB54B9Qu2BL3HZ++0YbzxlUCd0qY12HXCytf7Sbmhl
         wBa5nCSJ8o0uwGh1nRObNThU3Hr8j9XRJRI/YZF7yIOcWOBmB0wq7t82QPhXtYjAC/o9
         xM4g==
X-Forwarded-Encrypted: i=1; AFNElJ8OWJnAlq2D6KAsyQ1RiqdpLrD3PePAg5RTcLCrcNZKuZl1wDzpmyn/8KYa6u7lAgj9gTHc9oZEBM73Dbr9Ceg/@lists.infradead.org
X-Gm-Message-State: AOJu0YyLRdKQaVxCLcHfINDVGzTWg6sj04oNNQB7by2S6rWz4TWtyDxO
	NXZqDdrgP6IKtz5MpB6Ju7d6zbjkExRw4CNtGcz0WQnad+/lm6BnnQoe
X-Gm-Gg: AeBDiesA7WTRmkE2GvxecyQBORB1JEeB6WlPpdyziG9qi4bJWupZbmUs5fAndEoZnPw
	Wr9NVKLY7gMacz9afEDx1atNby1iL6JCjup3aYHqEnJ8/uDnN81fcJrk5N5IdN7g+VcHWYyvOBc
	WJvpn4Gm1p2FL9O/6oZWv0IZ+oeBk/v6SxsZes4bfyz4tLW7+za9eK1VJasMXpI8llrrwIsUdcw
	KJUn+Mjua6AW9AkVp9Xyo4QJQASQ9bEGOOQstHbFgKVrwFOX9RZsJuJhnHpfwrC5wkLAatpXDaK
	KgfnJVS8LHqlMPM5ynDX/fOE61WnU2ZI8TQ9smlFpmsY6cj6fEVYLysqeGgT7EdOgNCqHbTN2EI
	ksXLUgPF7t14RtnpVcw1pLnp3kXtbfsDBlCtJiA2Ln35RSoD7GRgrt2xlZ/fJD8IqiaEQ2pBUS5
	2XLjAqvVfYsgs3vD6MjAqaM5BGNvk5ca0=
X-Received: by 2002:a17:90b:3c48:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-35e42849e8cmr14289796a91.25.1776095265313;
        Mon, 13 Apr 2026 08:47:45 -0700 (PDT)
Received: from lgs.. ([2409:893d:1188:142d:edd0:8593:d07a:ab64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a20100sm10228887a12.29.2026.04.13.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:47:44 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] watchdog: ixp4xx: fix reference leak on platform_device_register() failure
Date: Mon, 13 Apr 2026 23:47:27 +0800
Message-ID: <20260413154727.3051321-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_084746_645354_598B5CBA 
X-CRM114-Status: GOOD (  16.06  )
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

ixp4xx_timer_probe() directly returns the result of
platform_device_register(&ixp4xx_watchdog_device). When registration
fails, the embedded struct device in ixp4xx_watchdog_device has already
been initialized by device_initialize(), but the failure path does not
drop the device reference, leading to a reference leak.

The issue was identified by a static analysis tool I developed and
confirmed by manual review. Fix this by calling platform_device_put()
when platform_device_register() fails.

Fixes: 21a0a29d16c67 ("watchdog: ixp4xx: Rewrite driver to use core")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/clocksource/timer-ixp4xx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ixp4xx.c b/drivers/clocksource/timer-ixp4xx.c
index 720ed70a2964..924dbd58c4da 100644
--- a/drivers/clocksource/timer-ixp4xx.c
+++ b/drivers/clocksource/timer-ixp4xx.c
@@ -239,11 +239,16 @@ static struct platform_device ixp4xx_watchdog_device = {
 static int ixp4xx_timer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	int ret;
 
 	/* Pass the base address as platform data and nothing else */
 	ixp4xx_watchdog_device.dev.platform_data = local_ixp4xx_timer->base;
 	ixp4xx_watchdog_device.dev.parent = dev;
-	return platform_device_register(&ixp4xx_watchdog_device);
+	ret = platform_device_register(&ixp4xx_watchdog_device);
+	if (ret)
+		platform_device_put(&ixp4xx_watchdog_device);
+
+	return ret;
 }
 
 static const struct of_device_id ixp4xx_timer_dt_id[] = {
-- 
2.43.0


