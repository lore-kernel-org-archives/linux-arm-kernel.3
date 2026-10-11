Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07480CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 01:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w5e0+n/SZwb+mdMGSpmZA8wmqSq0w/SQYcFKC9N+I3s=; b=RKlEHfcHlne1I+hzFSMH6pGnrV
	NfYVoQxNc4hHsnRwQWJ90M98LGdAfvsbwzG54wuE8Y47PvaPGlNj/e6cq+JCpdJM/HtfWrodaeJcO
	syDiCxhwNo9XZhE03p4D3BulOZoJ8z3cx8wOGBn7nTeBcuVPKaJKQ0KrzEsY9dk6KR5U19ClpRAPh
	CSGr73S7vy8mrfLPbtYKxnw1QpHIyjws+k4nqKqS7oqFowvzk8f0MJzhZ4RcSy83VPpBFKml0c3T8
	SQ383nFPADu2S816znZDF1ixOscGTPyvtAP+YKKwqWoXURG3UejXKtFFDFTQr5LmP/6ftSCppf8E4
	l+qTsW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFiAL-00000008bzx-0Neh;
	Sun, 11 Oct 2026 01:15:53 +0000
Received: from mail-qk2-x08.google.com ([2607:f8b0:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFiAH-00000008bz6-2snh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 01:15:51 +0000
Received: by mail-qk2-x08.google.com with SMTP id d75a77b69052e-53524092d9cso10342561cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 18:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791681348; x=1792286148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5e0+n/SZwb+mdMGSpmZA8wmqSq0w/SQYcFKC9N+I3s=;
        b=kKXNpMvdGCshz7Wvh6Bo8moDODbU78qE56JkZ71FLzyaRJ5cx8FPIxE+6/jvbPSYqz
         pI61UbOupP3/OhCUrIeAWdaxY5eQLCHkr3NrNI24FsaAAO0o2RB4LJEp0sRmZiHJQbNe
         MfU/JSvrUMHd3snsYxBWhk7DOCmAO5ubjre1oDddDsLncyyOawA6z0O0waSFTmxQv+NT
         JbbWay6ifn9Nst0l2S28p4/LM49M8CXJjaF6nKMSRgWmmLIct/Q4Jaos9JiMhBnMZVXt
         h4laUi1Donauct7lYXXc87InVz/7eStXy9jmnrTAEA/q1RFu81m8QgCMXvbRCs8XlWr4
         nXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791681348; x=1792286148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5e0+n/SZwb+mdMGSpmZA8wmqSq0w/SQYcFKC9N+I3s=;
        b=vFkFi5vm3Cj2AdK0SHyvuV583wtukixhK7zLBZyrT0bjBxKkjRtuwkEIyAzMyg5fAo
         qTXeXv4LGP9eYpblJo7ob5U6r37Td0ueY0pkpWCZOL7YofHfiNfuEUu+byio698pzrTl
         i0tBrXJP0hXcFLmK7LjQ3fBNR+ehB96ut6MjtJWGYU5Ei98xZqTC3HdwUQTdoYhos9qn
         7OFM+a2RwQImR4E5/oG6zUNauUEWo8R0zjl1dGUtQcJCOolL3eDmmHc80u+0n/UctY8R
         +v2ymk6dUqqLdVg9AfHCrERQBYoaIC/JzNyYg+i9Ncag1qcOI9DPCct0UMqgFNW+DzQx
         Bsiw==
X-Forwarded-Encrypted: i=1; AKwUvByQpiLmVi2+Bf0HCdCHyOnUHRdmy+LY3skw5Bc1uAzXOY5ne9ThnUuSF78zJIIuIGQRXgU7RUWkA3k3Z+agvrY0@lists.infradead.org
X-Gm-Message-State: AFq9FYIGyflpKGviIpKCpWlKFgMA5JTRxOcbE/bPYgETpS1vgwZaxhHq
	9AsYSITzCVXN/toUjCKhMIlUaXyTlDopYEuLcxvpfk9k0y0Pc5HsbW//
X-Gm-Gg: AYBFou2UTjFdJLQT+327ZT0FWF5psn5EFcEkUZaz6XOpxU6E8uwjgrXeQpHLccWSBsD
	2SPd5YlKH55ewmVXUqBwLnuaoWiGhhe8PwLs8t8wXeR7FGoH9Fvc7IeRk03Wb+kh1aaBtWIwDSu
	OIhIpqbeqkT7i+uxRe3fDA6XwXbaLbiyzBH0KYiObgE1WeQyQMYx7KIbWaoc/Wyh8ZRWiTrqoyC
	gjxfxEpwzsMePSueUUIXOm7LbDb8N9oFWlaSxjecMAJPh5z9hgT0oeFSpJVKuQj0baWeqxR+udj
	3hUROfLIRlJafKsv2ioOJY5bafXTS0NFbe39K0Z7Dh7Hbccm+/HV+LJNd2axHCt7EuxyG6Vjqnz
	aZZvXMwGuA8juX001syHjoxlIns/uNHaH4kqb2+PL9XSRhzr82JrvgTE5QkRGfffkFlcMKiFwrF
	9vAKwM6be6LeOLfXkrsWIEOyjM3bSHuqZ7L2TQgbHdvt4MMNp8QmRgQeFbgpdPg3JJNHw=
X-Received: by 2002:a05:6214:3d8a:b0:919:5a24:d77c with SMTP id 6a1803df08f44-91b5556a830mr104675746d6.31.1791681348207;
        Sat, 10 Oct 2026 18:15:48 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550c354asm58641236d6.39.2026.10.10.18.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 18:15:47 -0700 (PDT)
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
Subject: [PATCH v2] watchdog: mtk_wdt: Stop a running watchdog over system sleep even if not opened
Date: Sat, 10 Oct 2026 21:15:36 -0400
Message-ID: <20261011011536.1139162-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_181549_739234_080036E0 
X-CRM114-Status: GOOD (  17.57  )
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

The core's ping worker for such a watchdog would keep running across
the sleep and could ping the stopped watchdog after resume, before
mtk_wdt_resume() has started it again. Have the core stop the worker
over system sleep with watchdog_stop_ping_on_suspend(), as imx2_wdt
does: it pings one last time before the system suspends and restarts
the worker once everything has resumed.

Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---
Changes in v2:
- Also call watchdog_stop_ping_on_suspend() in probe, so the core's ping
  worker doesn't run across the sleep and ping the stopped watchdog
  before mtk_wdt_resume() (pointed out by the Sashiko review of v1).
- Link to v1: https://lore.kernel.org/all/20261011004322.1118027-1-agentzoan@gmail.com/

Testing: on an MT8189 Chromebook (next-20261008 plus MT8189 support)
whose firmware leaves the watchdog off; a local module parameter
(mtk_wdt.start_timeout=31) starts it in probe the same way a
bootloader-enabled watchdog is picked up (WDOG_HW_RUNNING set, fed by
the watchdog core, nobody opening /dev/watchdog). Without the suspend
change the board reset about 30 s into s2idle. With v2: 4 s2idle cycles
of 60 s each, awake 45 s after every resume, all came back with no
reset (so the worker feeds it again after resume). v1 also passed a
10-minute s2idle sleep. Not tested with a watchdog actually left enabled
by a bootloader. Built with W=1, checkpatch --strict clean apart from
the sign-off.

 drivers/watchdog/mtk_wdt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 1630ab65d593..3c493a470b37 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -543,6 +543,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	mtk_wdt_init(&mtk_wdt->wdt_dev);
 
 	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
+	watchdog_stop_ping_on_suspend(&mtk_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
 	if (unlikely(err))
 		return err;
@@ -572,7 +573,8 @@ static int mtk_wdt_suspend(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&mtk_wdt->wdt_dev))
+	if (watchdog_active(&mtk_wdt->wdt_dev) ||
+	    watchdog_hw_running(&mtk_wdt->wdt_dev))
 		mtk_wdt_stop(&mtk_wdt->wdt_dev);
 
 	return 0;
@@ -582,7 +584,8 @@ static int mtk_wdt_resume(struct device *dev)
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


