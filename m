Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB4CC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D98Mt2BThELnUozhvWQ+a9TWWTndWMHSpzuyilayST0=; b=hcAgkywo1cbSmxY2Ok9ateoea9
	yy1fxYFpAK2Z5EAKa5d7Yi29mIoVbVozqwxFmLmVTDB/VkKfM4Gdab/uzcdgDJbNf4jtDRvaxu54i
	1xXuOjOszXMbgILldob01P11S/rWRTCQA11oIqxkneigg1edbsC9DaMvpxp5YALGy144t/3NTZXb+
	9vMtgNPuiJn5Fwr29/4FFqQBB0E6AKwWK7xtm2IA71HxtQa2gfHnSx5llN5BPk/Sg72Zgv4wYZgvo
	vs9V0prd/cZb2fy9hBeaSakxI4d2hViAhXGlAibPjAcs6AP84PsXlVeCt1ZSut08/JnRE27zljvuV
	KjhUt79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64xb-00000003GMO-16rj;
	Mon, 14 Sep 2026 11:34:55 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64xL-00000003GCi-2YJH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:34:42 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-86265451beeso1967372b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385679; x=1789990479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D98Mt2BThELnUozhvWQ+a9TWWTndWMHSpzuyilayST0=;
        b=F4hI0zk7ZqShAx80uuDBeUemSsZmqCsHPtPG6s+gtXRXJOmEu6xMIGi5GE9P9jJxop
         80YNyC/kJM9NL0FqlVrGp3/Y7LTmsYxK+taygyWNI8pmGPBl7955rF9mmSXd5exjb763
         bY4xnN0vUSaJMFhwgrCnSrwrSWr72tDwye93/aL3Eq9kTFKow/CILbQ0JJvqlGqqGgim
         4RZmEhKu+q6m+l/4bxuET1xxH4aeEPNgvgU3DsoL8DEi+m6sUIuBvXze00x7V/5A1RhI
         iYAvolTQNgerUd4w9vWrCyPxPeDDwiHc2auTJgQl0n+K2sKTEyuBjeI7SyYna5AeJsMz
         FdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385679; x=1789990479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D98Mt2BThELnUozhvWQ+a9TWWTndWMHSpzuyilayST0=;
        b=WBACqGF2VRL/t7gvYjeUqFs9LFy2dj3phRXXc++R5jSRatnEH9uxdywlVfx6kCtZyY
         VwwaAmHhR+gbR1X48/jrbjC69MZWEt0kKDVsLZUX+gHep+GXCGfgNkLDCTPsfYHbOlc5
         MMBNJvJNi0o5hiWSgZcjjztAaBlT40XeO+FiIOCkfTChr3ZFkqRPMzUy1B1lI96JTG66
         Xusm8RsTXtaAkk9pFFKbWE8o8b2Jq7zmHhX2PTHjG85zLng19oIh0SpBISbZ575kW4by
         lB2CI9AxonYZHtB4oYMPtS1GSZ4qXDoIxZH0px/9lR0b81qj2LSrEEfW+nw557RrTo1B
         t5AQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2wa9ypa4qwVRmu5EKWfmKaO2PCU+IN0NnjnEoDhRD0OwPH5PV5lns6eQkTWwlnfVnM1ET8MngDdgP1wEei5vA@lists.infradead.org
X-Gm-Message-State: AFuF++mvrmylWhr9P9Fl5HYqsFEMnMJf/cHBKY9rdamqn9T+YzOhEn9o
	x1ELsrql/vjyr9oETg9AWmjzPlVGr6YN1jADTcRjms3LVQe4NMWQ65+C
X-Gm-Gg: AYBFou2UFhESfWTyBqiNp1NSxYAdhC52X4gvBvAKMGOTo5SIYrFzkF/Z5cGYMT8L3lE
	kDjD9UAVPtqNsY6Egu/5LOwqonhJ9WnyxlgqpXig1pBZN6+kRK2QcxnYDOBzcYoiLGRYYQJ5eDU
	vkJsuqI/u5KJ7l0FXt+ysfFPUgLkuyXg/PIyyEwAMSIIWslIyR5frNEiJs71tpzhynl/rr7LmwU
	vSEmDnrN9Kn0bdW9HFEFOgEQbTegpD+uSu5Rdk0o7HxS8gbL1Cbh+g5yO9GOMnCtc2aVbNa1Nec
	4W5Va/yu/sB9LVH95dG+A3i+jzUdLSy/R3ducZqZNc8aFHqARRV3OIiQ8cBF7ikAJjltOLdiZvt
	KSVG8uea2qqTyodnKzlJjB/0YllmALHURyhhFwn65S+nw8d51hyLNcSJaSpwYScQrUjxEC0ZU43
	RCH7HoMNn8Yl8wkVLqu9JodoqYn+PNgcNskY42zPTPVp4WeTy+8k+4fg==
X-Received: by 2002:a05:6a00:1741:b0:868:f03a:70d9 with SMTP id d2e1a72fcca58-86f82f516b2mr4191540b3a.4.1789385678538;
        Mon, 14 Sep 2026 04:34:38 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250c019dsm4440557b3a.7.2026.09.14.04.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:34:38 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Eugen Hristev <ehristev@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] iio: adc: at91-sama5d2: disable autosuspend on remove
Date: Mon, 14 Sep 2026 19:34:22 +0800
Message-ID: <20260914113422.1689331-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043440_918959_B87E6C5D 
X-CRM114-Status: GOOD (  10.86  )
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

at91_adc_probe() enables runtime PM autosuspend with
pm_runtime_use_autosuspend(). The probe error path correctly undoes
this setting with pm_runtime_dont_use_autosuspend(), but the normal
remove path only disables runtime PM.

The runtime PM API requires pm_runtime_use_autosuspend() to be undone
with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
set therefore leaves the runtime PM state incompletely cleaned up after
the driver is unbound.

Add the missing pm_runtime_dont_use_autosuspend() call to the remove
path.

This issue was found by manual code inspection.

Fixes: 75d7556ac0e4 ("iio: adc: at91-sama5d2_adc: add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index e8a5285bb6d4..e68632e628c7 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -2487,6 +2487,7 @@ static void at91_adc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(st->dev);
 	pm_runtime_set_suspended(st->dev);
+	pm_runtime_dont_use_autosuspend(st->dev);
 	clk_disable_unprepare(st->per_clk);
 
 	regulator_disable(st->vref);
-- 
2.43.0


