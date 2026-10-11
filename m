Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0516CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 01:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rqnBIiDXep9A/E7GHE0x8r23fh4KmbfjK4ifaUvrCeM=; b=D0VHLLz5KTGbFzsDH8hvJg7t/N
	uaXkk6eJoodr1GduA/LTMaSdoBGPNPefqQyXewOWHQAOzxZFX2tXRPz7UGxkgaBTUcEWaf+Tk8MKU
	k4nqgISbFO+1Z2puKG3hR6oKJ6zzisP3BI4XP4Sj3KW6yE6Ez8JsmuhWcyeWzBESK08VGGPrarWeq
	KZGPJONJLpPhQEGkoziyKMKQKIpudViFTdMqp8+TiTdqXlIfaoJL1z1PZrHJTTk2LfV0fglzNxEdT
	qUv2rUhG2tp5HVaiTes+jDj7vn6R3OVbXbnRtlal6GwnyH7GaNsL6eXT8RASI937ye0ETCkG6DRM1
	wHGojwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFiUX-00000008cog-2XUX;
	Sun, 11 Oct 2026 01:36:45 +0000
Received: from mail-qk2-x08.google.com ([2607:f8b0:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFiUV-00000008cny-0KDs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 01:36:44 +0000
Received: by mail-qk2-x08.google.com with SMTP id af79cd13be357-9369a6afaf8so54323285a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 18:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791682602; x=1792287402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rqnBIiDXep9A/E7GHE0x8r23fh4KmbfjK4ifaUvrCeM=;
        b=dQWzaYPRVne+Ra+NfV3qCv0L0lEM9/K4xBYhqVbOkPlUTLSGlkgJ3aKGFAGAb+CQNz
         ZfB1ShOFUCSliMsQebLacWb2Uxav0rqWqzU6xC5pRwQ4tWpt7qmA715W0+6WEHRf8sdd
         L5VAUUm9XRV7PMMuRSKRyI8j9jWffODfoxCPKCm/Gk7J2aWNo9NSrGO+7PLwoqnt3ocm
         glR/mY/qIHMt4ae//N+1T6Envg9N8t6nr9toclmYwLUSk2gWI0D12hanXShv4ZHSBdXS
         NFG7iJ4qmovmcbyokzdBa4OO9ntEn3Im3sXEjiUeb2a4v0EvOSsxJA+u2ZE5L+B6l6RX
         QFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791682602; x=1792287402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqnBIiDXep9A/E7GHE0x8r23fh4KmbfjK4ifaUvrCeM=;
        b=2yl/trLXwuJZj/OGeD7viYChrdRcoyS2xMkPQlxlG7m86IZZ1/Nh9jKdvxjps1nRXi
         O6vCLlJv36YgiF8MJ0Rn9toguFr19g9Fsv4HFt+HqE4kxQQdOre/wUIi4lgSpZYxTqrx
         QieIQjWga1b2rIq8SmPJQNeK5YYrMDCfSxbngUAO72T38W2abZW5WX+oHpeeBq5cNBoa
         5RC4yCZvqijM7IfxREggmdWHb5vNWdzHzpj3k1zxuzJJUme+N+HJEfIZmCa7Ecj0Z0gl
         nno+VOoBJqEvBlQ0rQxFoqjAm9WTUK6hxCwFsNvEHBJ2Js+cIgLdUuIueBV6aD+eI1bI
         AmBA==
X-Forwarded-Encrypted: i=1; AKwUvBynIQdBxHC53EAfXs7c8bz9Gwt46fNGdv8B+mV8XlUc/fKE2GVEwMpSjP3pKPt1AepCKC57q/O8im85bwqWpJ0H@lists.infradead.org
X-Gm-Message-State: AFq9FYIA2Ldf8QOUS4FTYWDzs92EyMEQGtFTbggl7NYrsL837ROZuMcg
	meS0kdxNJdpuhGm3F1lMYai6/iJUjU5wM4Hw1hAW62Mw0I7wmLgzU+Pe
X-Gm-Gg: AYBFou3FL0l6IkdzPK8/OJDTZSRkPvLWPVK9uw86xVL6xIZBci9G9rfD3vb/UB2oxB+
	cXjJpPld0Ya+LBJm3Fied64h8eYdoCc0dVEaYWWo3oJ9ea0pItMn5pjQfGNvkZ0D5/kFWdfh4lr
	2fPcRVyOhbm1YVhsThjQdyLSk1LbGEOw6ThXcLX/wj5RvlYrJuvkWSaUD2jk5Z7DDowDSDfxsex
	gvvohnWDJ0Qkt0BZtsVWg1uBWzHnBSiYgkuJWPu3YVpwVeAXhIaHhNVNHrF2CsB5GmU4KAY0vLk
	LS0sDy7mX5Byens2UlJPRPk8F+H8H7YnnBG1fqACAgvbIcgyM3H7MkC9/RPWsBs38eXFSSejiRK
	Ru1/blYTADJ7KN7zP461Gpaxav6XmdyhxzyLjtenIHdgK/XlHunZToVW38sP6J8CGCsFf97wrm0
	266noQzAjcA1MzE6pf2W0pSkzzQ7mPYpuva2fkt+sd2HJEU/neFEKI6EWm/5oGUgkQ8NXq
X-Received: by 2002:a05:620a:448f:b0:939:b94c:3e85 with SMTP id af79cd13be357-93ebd1bb1c2mr1032711285a.24.1791682601680;
        Sat, 10 Oct 2026 18:36:41 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm540139885a.12.2026.10.10.18.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 18:36:41 -0700 (PDT)
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
Subject: [PATCH v3] watchdog: mtk_wdt: Stop a running watchdog over system sleep even if not opened
Date: Sat, 10 Oct 2026 21:36:31 -0400
Message-ID: <20261011013631.1149228-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_183643_137355_FCFE304F 
X-CRM114-Status: GOOD (  18.99  )
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

The watchdog core keeps pinging such a watchdog until
mtk_wdt_suspend() stops it, so it stays fed while tasks are frozen
before the devices suspend. It may also ping once after resume, before
mtk_wdt_resume() has started the watchdog again; that only reloads the
counter of a stopped watchdog, and the watchdog stays powered over
system sleep (it is what resets the system from s2idle without this
patch). watchdog_stop_ping_on_suspend() is deliberately not used: it
stops the pings from PM_SUSPEND_PREPARE on, which would leave a running
watchdog unfed while tasks are frozen and could reset the system there
with a short timeout.

Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---
Changes in v3:
- Drop watchdog_stop_ping_on_suspend() again. It stops the core's pings
  at PM_SUSPEND_PREPARE, before tasks are frozen, while the watchdog
  keeps running until mtk_wdt_suspend(); with a short timeout that could
  reset the system during the freeze (Sashiko review of v2). The ping
  after resume it was meant to avoid (Sashiko review of v1) is harmless,
  see the commit message.
- The code is v1 again; the commit message explains the choice.
- v2: https://lore.kernel.org/all/20261011011536.1139162-1-agentzoan@gmail.com/

Changes in v2:
- Call watchdog_stop_ping_on_suspend() in probe.
- v1: https://lore.kernel.org/all/20261011004322.1118027-1-agentzoan@gmail.com/

Testing: on an MT8189 Chromebook (next-20261008 plus MT8189 support)
whose firmware leaves the watchdog off; a local module parameter
(mtk_wdt.start_timeout=31) starts it in probe the same way a
bootloader-enabled watchdog is picked up (WDOG_HW_RUNNING set, fed by
the watchdog core, nobody opening /dev/watchdog). Without this patch
the board reset about 30 s into s2idle. With this code (= v1): a
10-minute s2idle sleep and 40+ shorter s2idle cycles came back without
a reset. Not tested with a watchdog actually left enabled by a
bootloader. Built with W=1, checkpatch --strict clean apart from the
sign-off.

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


