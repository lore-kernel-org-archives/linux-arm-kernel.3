Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9550EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 01:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=md9zT2jjgrRTs9v3b0TbZJ3ZYn/KP4ebTskMdmlmnYM=; b=kfh/7BzMgRAvzC4LNtFJoki9XW
	+ZnSx7HsHIAJd02BqLWOOj+K5SzKkLea2kw6FrObo1cCI9rFdGL+ADH6eSrm+oeCWaT+XD8vJoH21
	WP3TTwCGCJ0Ace79hLezx7eMVr3oUy7IwJ7J0hnCFSZTULxRVURVILvylpChc81cJxLxMjmPXRA50
	r5dvEKREA7Qc/iT4jW0Xfyi7dZ8C7toXUG5kREoVkRVbM3DLAPoubbQp+i7/tIuyZe4V2j0pvECkQ
	lxwZjcUoe41el8oDT9r6iSCyj05YfkSnLY9QE20ELqhLr8vysfuVguYR8nV2H6DnXE7wSh5bQC1rj
	XptoW6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BpP-00000006qzA-3SuG;
	Wed, 23 Sep 2026 01:31:19 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BpN-00000006qyl-3zXO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 01:31:19 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485933b24c3so330237f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 18:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790127076; x=1790731876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=md9zT2jjgrRTs9v3b0TbZJ3ZYn/KP4ebTskMdmlmnYM=;
        b=Ns2kbOxLaOL6LRLA4nHcYz8z5Vt39fXZT+9Wi+GlJ4MomBWr04P/wLbS9C+sM7IoCC
         AvvGWCRdlpeYjNoJ3j9cVRr2P/2eA4s9s8ZiXNpmFIfFtaUxPLy9E4EbvH0hLOPtHeLA
         mtEvflRkkW/i2AB6zLgb3got+LloBVMCdtpb5HXQSOAYNSgZ66WqhcDjVARFEKWT4T1L
         ERvuhDDzfC/aNG25/r8XJrg4+1xzuKhctX4KeyAVdCPLjdMVytnih/NJZpDCqFs0GmNB
         +eM/liliq72togM7GjQGWhs8t7S7Crg8xiZFi3VpcqHsdhwRghGWaxVS/2Bitt6xuRnd
         GF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790127076; x=1790731876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=md9zT2jjgrRTs9v3b0TbZJ3ZYn/KP4ebTskMdmlmnYM=;
        b=NpQGZUS93pAzCgH+/1i3htotSm2vhlshCfwyvKIYkl4X0aSHuvmM9vp9UcxCX+AU1M
         jx/BXF/1rcK/KnK/2iAvPiWF0WPSWj/Fl5rGGqZqal7fUbhgNDVVLAda+nXjvMv+HpwT
         p688F1RIZ0JsKVN+unG2bxWdsNa14o+gu3aMoITb3HT+Fq2/r9jfgIykv9FlKpmj0ISE
         xpkpr2yX/uZclvHD6KoITDHOSW0Z0wfZvOt/znbtKuISsE8JH04SICziVAA+RyuSQhYs
         tscD+aqwlq4wsFz4qre4s87GkY3LCBYg2HlsFnE4iiqQCYSIYn+n3r33gYujFl9VBut/
         isSA==
X-Forwarded-Encrypted: i=1; AKwUvBw1+wMdJ+1FlRwT0QpuM+bFQHIMPai1RlFoc0LCEDtw/VKnPQ119YAlHfV2Url2JAIgmvxpRm2PrH4Lu1tBuBEd@lists.infradead.org
X-Gm-Message-State: AFuF++kC3tMYVxyM1/CikPkPfU0jso0H2ajDlISqyjjsZk4Tdej0z/Qd
	/LrZiPY3avPH4IspoQEHBBj+K6WgFLoTfmLCgiRMEyXO69rAP2D7U9Ms1GHrcBoG
X-Gm-Gg: AYBFou3RBgCilIu+wVeOjWhGsTX8XXFM1OZ6mM00T7ZHzNkSzAazIS4PaY7285NXjQZ
	t/hW5iWphYuvaKDAatW4KGkbiNG7KKot20nMTgnARqzR/18L5Ve4QksfkuOXIxGSPrOatHIfVOT
	JAe3cGr191iLBlNJf9GB/RZi7OOHIaCSKcIe2pnaT9IeGxBuhDyjj8hihJL6JP0j8luNMnW+8GI
	6QcSysGEl5oc3YYuiyDE43oIasN7cCvjgoy0553bvzy+bdYp7HcODLE8/67lcjTkWoi9viXAiGJ
	8uhzRWqw9wr699A+mf+zdMb/+JEyWRFcKfgImCWdfGEqxY1N+FbN0IHYMkedxvG9QqnNAkLGtC3
	MWMqUy4NHd1REbu/v3ylGevrQxLhcvxhU23rpKve57i6yQopnfKWYzJoPSCcN41FMvnTrqoltxN
	l8YFm/W4WX0CGsIVGhSVdrUANShFw7JwGeP/FQzwMx64YhvOInsJWH4UKPjmfIb5c6J6BtobneB
	8xxAEygRNCY6EASjl+NTErAtAq9lkOlZRH0sHZKT7vym5VnFZ8xaKBeA+qHqo+M4DfE4t6N8/+s
	UxswyV6JX4ze5Z795Jqit7k7hpfTH5K+mfH+kiGRvTwknWi7L2eXssJ8C+A=
X-Received: by 2002:a5d:64c8:0:b0:487:2589:ce4f with SMTP id ffacd0b85a97d-488670a9a46mr1772611f8f.43.1790127075985;
        Tue, 22 Sep 2026 18:31:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-182-160.95.114.pool.telefonica.de. [95.114.182.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2d5sm2703819f8f.27.2026.09.22.18.31.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 18:31:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] spi: atmel-quadspi: balance runtime PM and pclk across system sleep
Date: Wed, 23 Sep 2026 03:29:50 +0200
Message-Id: <20260923012950.15651-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_183118_018297_F6BC5BE6 
X-CRM114-Status: GOOD (  18.60  )
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

On the controllers with a generic clock (SAMA7G5, SAMA7D65, SAM9X7 and
LAN969x), atmel_qspi_suspend() takes a runtime PM reference and returns
without dropping it or suspending the device. It disables the peripheral
clock directly. atmel_qspi_resume() only prepares the peripheral clock
and then reinitializes the controller with that clock still off.

On a SAM9X75 Curiosity board, the tested standby and mem resumes
failed:

  atmel_qspi f0014000.spi: PM: failed to resume: error -110
  spi-nor spi0.0: resume() failed

Reading the flash afterwards returned no data. The runtime usage count
grew by one with each cycle, and the second suspend disabled the
peripheral clock again:

  WARNING: drivers/clk/clk.c:1257 at clk_core_disable+0x6c/0xcc
  qspi_clk already disabled

Use the same runtime PM sequence as the other variants. Suspend disables
the controller and forces a runtime suspend. Resume forces a runtime
resume, which enables the peripheral clock, before it runs the init
callback, and drops the reference afterwards. With this change the
tested resumes succeed on the board in both modes, the controller
returns to runtime suspend, and the flash reads back.

Fixes: 5af42209a4d2 ("spi: atmel-quadspi: Add support for sama7g5 QSPI")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260709112006.390742-1-robert.marko%40sartura.hr?part=3
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
A/B tested on a SAM9X75 Curiosity board, two real suspend cycles each
in standby and mem, woken by the RTC, with a read of the on-board
SST26VF064B after every resume:

                           without patch          with patch
  resume                   error -110             ok
  runtime status / usage   active / 1, then 2     suspended / 0
  second suspend           WARNING, qspi_clk      clean
                           already disabled
  flash read               no data                matches

pm_test=devices gives the same result. QEMU's sam9x75-curiosity model
shows the same runtime PM and clock state. Its OSPI does not depend on
pclk, so there reads succeed in both cases.

Not tested: SAMA7G5, SAMA7D65 and LAN969x.

Unrelated to this patch: with and without it, each tested OSPI flash
read on SAM9X75 printed "BUG: sleeping function called from invalid
context" from at_xdmac_issue_pending().

 drivers/spi/atmel-quadspi.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index ec19fa0180f00..96ed734b56218 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1590,12 +1590,14 @@ static int atmel_qspi_suspend(struct device *dev)
 
 	if (aq->caps->has_gclk) {
 		ret = atmel_qspi_sama7g5_suspend(aq);
-		clk_disable_unprepare(aq->pclk);
-		return ret;
+		if (ret) {
+			pm_runtime_put_autosuspend(dev);
+			return ret;
+		}
+	} else {
+		atmel_qspi_write(QSPI_CR_QSPIDIS, aq, QSPI_CR);
 	}
 
-	atmel_qspi_write(QSPI_CR_QSPIDIS, aq, QSPI_CR);
-
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_force_suspend(dev);
 
@@ -1621,20 +1623,20 @@ static int atmel_qspi_resume(struct device *dev)
 		return ret;
 	}
 
-	if (aq->caps->has_gclk)
-		return aq->caps->init(aq);
-
 	ret = pm_runtime_force_resume(dev);
 	if (ret < 0)
 		return ret;
 
-	atmel_qspi_init(aq);
-
-	atmel_qspi_write(aq->scr, aq, QSPI_SCR);
+	if (aq->caps->has_gclk) {
+		ret = aq->caps->init(aq);
+	} else {
+		atmel_qspi_init(aq);
+		atmel_qspi_write(aq->scr, aq, QSPI_SCR);
+	}
 
 	pm_runtime_put_autosuspend(dev);
 
-	return 0;
+	return ret;
 }
 
 static int atmel_qspi_runtime_suspend(struct device *dev)
-- 
2.53.0


