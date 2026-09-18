Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC60FC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KcbJsmqKUVlgmMgW8drjDCDfJeq+Ke5tmTlLzlkgAFE=; b=hUftpvdA2ULMDQ8mdRiiYYMvAI
	CXGrwkrIb4wjz1nKdwUbSSPybUdHJrfjj1R5/CAAvud6azbKAyfHdMncdEVtup95uRI1Lm87QHSEr
	2cOAeJ3nmtTuwpykkhJAYNr385hLm7zYdDtmbX+sAvJfiKxZvXnvo6/PKyvVIpeqODXZxx6H+4VDd
	g2EAovBoc3AzmRu9DuTcwYVWLUW5z6wDAVHbcrvPDjD+3YLUo1hkSPmhuQKsSpDDOZGP144xoHq3G
	8Mxz3qv74uagax+kxDBnhdE71iPhGr7UM6wNCBQKbEl1Mn1b+k0mWuTxHJh5PK3RYREOZ+WBsm2+T
	DHnoQO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7axK-0000000Ewii-0osh;
	Fri, 18 Sep 2026 15:56:54 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7axH-0000000Ewi8-0ym3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:56:52 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747f0135fso9320895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789747010; x=1790351810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KcbJsmqKUVlgmMgW8drjDCDfJeq+Ke5tmTlLzlkgAFE=;
        b=ZgRerTzwsmtAj+uaxMpzmANKMIh47FWzyWYxfVyhnSZcAqNOjaK7LJbAIDaw3A+vlh
         5nwuR8UVzFhfO/D9APbnj21ss6AUzZS8aWeAl0hUWC5116a3b46gmQcG1ibwQOn1vp2s
         ZVSCO+oF0rUK/7MxOLk+Saoj1Dk5tX+fv4rutwrGLSRKSeOYumrUYFO2SsBwjEZZzCb3
         zD11wukjuq+hHnMuD1MLnqEfCqAbJyhE33TS+zO+19ncikHULmhWFyze3YZSr+5G50kH
         5haMyDzX/jg4N8JJQLcS+6Ny8Uf8IgVwbDv+kXwAc7yGL0LKxVQr+iNObKxRSCrTEUgm
         QKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747010; x=1790351810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KcbJsmqKUVlgmMgW8drjDCDfJeq+Ke5tmTlLzlkgAFE=;
        b=FfXTGlxzntAkBADZnndT7lwLRsr84U9V8k+7Pl6a++0RyZzsyEz9SM+kYxuoatcqdc
         BhzAZYbsl07ei3vjlf3gRpSELz3l0yej6ZbimMFXQyrz2g+S2gS5gqLU0L4m5vRlMdva
         F4rIHsNZfE0kXuIcVkBqunLDCQ9uueELg8IKwFKVJ0WcmYR+hFdfX463uvDDn/TXioZB
         kgNsgsWOutekRNntas5RzB40tO//G/vNUhxdYcO7a/mSN4eugc62fw9tuLyqE6cJreQ0
         djTOLrcHNrl9epVyNDXnYspg1GPD3o5zJKYNjh0Zjdn6sJkObz/OK6bydWzYl7IQZseH
         q95Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8Tp/UlCWj7NaNbXP2MafilwU7GZqlu0v8OCyQJy0kJZ4rl+t5SiPs1GqPMUU1Vox39W92sEgPEgUxQnL8kiw8@lists.infradead.org
X-Gm-Message-State: AFuF++nBOoBvFfN2KLT8w995MLab/FD6G1Y+au9LhF89Lzj6h3LDqKhh
	g5zSs33lDreY0OBgcu1PTEzRYSSpMQYFjdazULTn0NVmJzrFrDhxYNtGb/ONhQ==
X-Gm-Gg: AYBFou3s0T/h6IlcK730VMEZ97CbRqxcRxDzywFBgz6mLqcKd8kx9uQ/JimUE8DZDie
	q5ao2exmJl2FAeJFH+O240atrN+/phHQb/FlZyWgbme/VqkZz1zBPb7Zr8UKy1qMC+7heP3G45w
	p2ENrsByijpLUtNNg0gG1UETiUTOIGOroDIbWY+Dn7yk34z0jPTHOa2sIJEWCCsQEMZNjeo1t1s
	KwwBUEm+nBV+NbdgqDr9LAtg7ZjMDkF4cP7QXztAnSMR3gCkOPBF8jbVosYEdJyB66m36gFB3sm
	HxWmN5BBE8AQkDudeEsw51/BCWjayNVWmWjI9GIFgW/1kxewiWOCwWLygsulY9rP6HmD7KgKMhh
	v19LP7nuAm92Nu6+rXe35PFy3hyn8cAWImARtPjAVzDZEQLUlUb5yOPZRZpT55w5ER+HJ3z/XKb
	91Rmw/c8xzWPJ492Fsqa/DKTK+wlMCbRneGBbMxSLsFDTFWM0kW6NWR9Lr/lYFjsDA00lTYHcIn
	4lYv/hRkasyJm7SzA==
X-Received: by 2002:a17:903:1844:b0:2dd:c100:942f with SMTP id d9443c01a7336-2ddc1009bf7mr1190205ad.45.1789747010314;
        Fri, 18 Sep 2026 08:56:50 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7525be8sm10938445ad.24.2026.09.18.08.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:56:49 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-rtc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: mxc_v2: fix clock-unprepare race with the still-live alarm IRQ
Date: Fri, 18 Sep 2026 22:56:42 +0700
Message-Id: <20260918155642.2557978-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_085651_273495_77982418 
X-CRM114-Status: GOOD (  12.04  )
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

remove() unprepares the clock, but the alarm IRQ is devm-managed and
only actually freed after remove() returns -- so it's still live while
the clock is unprepared. If it fires in that window,
mxc_rtc_interrupt() calls clk_enable() on an unprepared clock.

Free the IRQ explicitly in remove(), before touching the clock, so it
can't fire during or after the unprepare.

Fixes: 55d5a86618d3 ("rtc: mxc_v2: Add missing clk_disable_unprepare()")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260914134826.EC26D1F000FF@smtp.kernel.org
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-mxc_v2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index a07acbbcfaeb..3c174f6004c5 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -365,6 +365,7 @@ static void mxc_rtc_remove(struct platform_device *pdev)
 {
 	struct mxc_rtc_data *pdata = platform_get_drvdata(pdev);
 
+	devm_free_irq(&pdev->dev, pdata->irq, &pdev->dev);
 	clk_disable_unprepare(pdata->clk);
 }
 
-- 
2.25.1


