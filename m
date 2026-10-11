Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E731CCA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 00:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4/sSbLwCPSp4q8xFYrtdK+Sl95iWhYZVxZM9PhMl9mI=; b=W/YvT32PeYMoA3B+s95lJUoF9f
	Fo7eg9J+EcDCcydlogXitY5yz6VdPwkD0AWlj+8b3ZEb1YHWT1/+6vX1pFA7BnQf51gHYGNIPAInZ
	HtNXZTG0D09Jo7/hrSXAXnbyIZpjo69kEfAGd1xtfkNxHQZPqGG47ymn6i8eZ4EbqgKZ2Y8gqSTwX
	SMQ2DhaAyyC9S63xtEZzmiHCfnZrzHzYyvvuUvvKPaaQS7hh1t0oSWrAr0nHrREP+EayZToIORE0r
	Ln63H672hTptEfQqtNaB6Rljqr6xR5h+lO+Y2Jf6Wl1pxxC1/ZZehZFZCIIHaL5teCMMmCgwLJfHs
	SjYq1htQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhfM-00000008aqu-2Gqr;
	Sun, 11 Oct 2026 00:43:52 +0000
Received: from mail-qk2-x08.google.com ([2607:f8b0:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhf1-00000008aeW-3dol
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 00:43:39 +0000
Received: by mail-qk2-x08.google.com with SMTP id d75a77b69052e-53524092d9cso10206631cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 17:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679411; x=1792284211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/sSbLwCPSp4q8xFYrtdK+Sl95iWhYZVxZM9PhMl9mI=;
        b=go55O72ZyIHtFpvmuVHuPCWWfkmlDo/8MhNLKUAxiEaieRV4Y/7yAkuXvk3KF1XDlj
         Ms78BjGpK7XjKTDVvOziGHsiDSGdVMp9CHGI6PCIG63y7qC0pwZ0Bl4/WUXwUCX3cIHt
         oMDskl/lpMTFgE2O3Yrz9pPExAeCALa1H76o0g17YobiwgRoBu34s06tRodOzzwUAff3
         DdJYSIVDNoJlRfJr6zQxiW6s8tEsz3gG8bxLi5d2RoQ1OP44vC7o9EIpCvsJUj56OnCq
         z8unmS3Tmq0snR4BBpzGcDtCjO0Q4FdZEYztLlc+Oo8+Wq0orGkSgteeW5NF9+6kEXu0
         Wj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679411; x=1792284211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/sSbLwCPSp4q8xFYrtdK+Sl95iWhYZVxZM9PhMl9mI=;
        b=wibpspgHRRxmCfMhAHphQxvpqZOskfKqDP/DJskuhSsEHi0iVJ0fPZax73UVJDYjCJ
         LfbRyDzHiHJqhREHq+cLCBPLXA0CbYm86aF1YYHWgDfaFt0jJ0h2Rvz4BIMTEWyHITpT
         R0A08sDl94u47S41SiDlKA5X1s0h3/xt/RbsNx4Udsx8kq+lUK5jBI4mXG0Q2EMI/xDl
         Ul6q4ysKJkGg55/bKVu3DoTBT92f6vLhnZh1v8DVoy+3RAJdOq6VW6zWrn3bR7ZUW3z0
         wm4FWyIHpw08GcieXkDEb0bTsedFa9RP0JkDQAPBWSVEdl0q0bMFVwhB5Ebevwq2NwlP
         occg==
X-Forwarded-Encrypted: i=1; AKwUvBwvKTiru/87mk8orqCLptBw6kkqLkA9ozaw68XWAf1DCefpFHbMQ3alsgM8mtwQj2cEX6puxIPuqDMxt2qG6tlR@lists.infradead.org
X-Gm-Message-State: AFq9FYIeA4FKV3MGf5b2oFrkEq3hjstTtT1kA6Tk7n1SoADNnjiRzZlG
	m9+6kvWLizgkDHnzOxWg3E5Nq/kMK2r6+vJSzvmtcQdMV3yntncplzhTVomBFPMHq3s=
X-Gm-Gg: AYBFou3LnuCa+JRgLDpElu2VnDLG3f1cwFazI3LiLPkez1bH7b+U5kGRgTmyDHiEuq8
	9xNnTqAdreUuPcxQBRAYP1t4YQ1ZVd5dPD2EUcJNUP5PMQKGRTYIFIvLTRsmBFMIUbikpWIPXX9
	qXJmQstam62yI7NXcY2j1qVEWaHbpYDp3vyAZ1RTvgMErTlO7xv8n6HaIMHx5XWOt/2/gWP7uuA
	+v5KLquAhkBD/j4tYNxXLW7ZYTqcgjurpISHahlQq0v5qXfAUTt354H67U7/sFGFNqBFjb1HSGG
	GKqRuR4h1Loa9yw6Ny38yKvkVdQiaLydtgjTKWb55GB7gliEbbV9OQesIeHCBNwyMF9LPTQvSdg
	S41dJKa7glXEChzKu+o0yGhr1iuZgzkCjP62PyO4/IHWqAklaFYVRFgLVud7De4Mzwf4Lg9RURP
	n7QVQltsfcs0RY+qcDOjDcqDlmt3uydTMYlsqGn+YmP7Rp37kUChJ02A/qjT7ZlFmhPrY=
X-Received: by 2002:ac8:5dcb:0:b0:533:79cf:18ea with SMTP id d75a77b69052e-5359fb88606mr102144591cf.57.1791679410806;
        Sat, 10 Oct 2026 17:43:30 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7dd1a0sm49229871cf.27.2026.10.10.17.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:30 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Freddy Hsin <freddy.hsin@mediatek.com>,
	linux-watchdog@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: mtk_wdt: Stop a running watchdog over system sleep even if not opened
Date: Sat, 10 Oct 2026 20:43:22 -0400
Message-ID: <20261011004322.1118027-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_174338_085613_E71154ED 
X-CRM114-Status: GOOD (  15.91  )
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

mtk_wdt_suspend() and mtk_wdt_resume() only stop and restart the
watchdog when it is active, that is, when userspace has opened it.

But a watchdog that the bootloader left enabled stays enabled at probe,
marked WDOG_HW_RUNNING, and the watchdog core pings it until userspace
takes over; that has been the case since
commit bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe()
to prevent the system freeze and it doesn't reboot by watchdog problem").
If the system suspends before userspace opens the device, or userspace
never does, nothing stops the watchdog and nothing pings it while the
system sleeps, so it resets the system one timeout (31 s by default)
into the sleep.

Also stop it on suspend and restart it on resume when it is running in
hardware, like sp805_wdt does.

Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---

Notes:
    Testing: on an MT8189 Chromebook (next-20261008 plus MT8189 support)
    whose firmware leaves the watchdog off; a local module parameter starts
    it in probe the same way a bootloader-enabled watchdog is picked up
    (WDOG_HW_RUNNING set, fed by the watchdog core, nobody opening
    /dev/watchdog). Without this patch the board reset about 30 s into
    s2idle; with it a 10-minute s2idle sleep came back without a reset.
    Not tested with a watchdog actually left enabled by a bootloader.
    Compile-tested (W=1) on next-20261008.

 drivers/watchdog/mtk_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 1630ab65d593..ff72e0fb1154 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -572,7 +572,8 @@ static int mtk_wdt_suspend(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&mtk_wdt->wdt_dev))
+	if (watchdog_active(&mtk_wdt->wdt_dev) ||
+	    watchdog_hw_running(&mtk_wdt->wdt_dev))
 		mtk_wdt_stop(&mtk_wdt->wdt_dev);
 
 	return 0;
@@ -582,7 +583,8 @@ static int mtk_wdt_resume(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&mtk_wdt->wdt_dev)) {
+	if (watchdog_active(&mtk_wdt->wdt_dev) ||
+	    watchdog_hw_running(&mtk_wdt->wdt_dev)) {
 		mtk_wdt_start(&mtk_wdt->wdt_dev);
 		mtk_wdt_ping(&mtk_wdt->wdt_dev);
 	}

base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.43.0


