Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AA9C98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 05:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G1vNpKPR8tetL0rLolzuK6mB/xx/PcBi1bh4XSysNP0=; b=TTRozmSb5ySUnRKam83y2SHLvV
	Wz50Hpa3hmO8lnZIdr34spP4s8c5QDmwT5FcjYqmPagvmbVhEv01TnU8/ISJwz7+lip/B/3nArZeN
	DQUrX9fkI3hiQRSLrf95EemM8ufTizHyfZvkmGhxXrYyTt8pGLXokmQynnvasjPRQVgEewcHnovP1
	5Z0VhxLfNLCTxdoPa+pAfSkw8CPTGfqxpTaL5RwreJxYO8SXEqnprhmMQGeNUtcX4DTWxvAzmxsUA
	KdgKqt1o+F9oA6ff9CSWmGuC/74cIFiNly+26lxlqVOv9IgdNNyIHuDMWOi5WqWRLM6vhUnU72dpX
	RkWkPOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yNS-0000000CgrY-2wk3;
	Fri, 25 Sep 2026 05:21:42 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yNQ-0000000CgrB-230c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 05:21:41 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so226149f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790313698; x=1790918498; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1vNpKPR8tetL0rLolzuK6mB/xx/PcBi1bh4XSysNP0=;
        b=oHw6Q2X0CTQZPKeXUj3V5A6CXlq9ZYcdbLXZT9+qjpRmhqGDwyuDMXEge0O17Szd8n
         YqJ82p3i5xbhNPMYypD7eGsMXg+KWfnPzsM75o6zD3e6hlEUujB/JX3YtAsCyAqWBQha
         rO5ZRvcgqHQBEsPZlK5HEL0/3v673dY0GqyYMuxZVlAXdam1ou7I/0fG3FmlG10SbPUo
         AkgTbwwAVivPZddWKTjgdc6asnYZJcALF/OVu3rHv1vhGsgB0EfEpjQW5NrSYWr/u7S6
         pfD6GiuhpkRnsKf/HzuSm9RJfMhFD7b99PI+w8IIRNMEsC/c4phSrbnzM/d8FzDbopB8
         Fg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790313698; x=1790918498;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1vNpKPR8tetL0rLolzuK6mB/xx/PcBi1bh4XSysNP0=;
        b=SNp4wJKtNxRT6acxWecbG8gR4d88fz642yKyL3QOiKg0l328zJrp7wEIGlUAtdWQTk
         J12s/r0QuJQH3cHklOhwhTP5qSq4ZzZSZxL9c4fpUjgLhJtvO6HNfqwvLqHS9rYXxZGI
         pF1ntbXj4SU+6kIZVQeensxaLmbS49DBm4ZmbsufFYNlvb67DqAAFtrzTOxAtsyVtRwj
         mLSFqMcNw7rcbJO0par2KQdNdR91eaDBYyB1f8abHiJLR411g2qXxxYH7OicfIaWV9fa
         e1fm8u6Ig6n+tY4OC3KSFUGbP0tDw71klLpk0JYT2h/rPkhXpo3E4Ask/Zz+k+uz/QCQ
         qLqA==
X-Forwarded-Encrypted: i=1; AKwUvBwDt+3fuM3b+8KLRKVio5y9RxIliX+v1b8xV5Fkza9e1BeAlMwAIVFL3TsZIPhlzm4qViM4p7zMJBZFmI4+4+xt@lists.infradead.org
X-Gm-Message-State: AFuF++kwbU1cK2fTquHcXQmrOVzqXev/qOLoi2ES0mVb4hMTrXDhaa+i
	W57VzVFBV44mYiXlUNIG1BlxfAKEb0HPEmoftIkTEyTzPlJRt05Q+esi
X-Gm-Gg: AYBFou3hi6kczgqPrzQSmORYY59xue1MN09Euhb2JcS1RK8tBE82JPPRNOL0a6Zs5qb
	rbmtPVZyPyUboUwcd90fqsD0fIcMTVz5jcHvdZp+//uweu/eu8hXGkUq28z+ZhsYjU0jD8heuf5
	2eEF9+WyoiAcy+Oxerx9XNjrxoAqlb4IpkTRIzXiyh1DT3CkVzAS0yYApvJNNY74LxnBP4/PeFJ
	AU1u/Yw1vC5prkcayQMSl3NDejoT1Jg6qGZbvVgSG3VcPsoq9ot+BJpe7Z/NXNd4zdpA5AkbmZ0
	jr3/zBYD3FoPy5jgV2LdX0rXX1ie3SFpS4AfZLW6/ie8sDoRHTwnJQDbJuCw+Vu7sk8HrRoMRPp
	E8eN2gvtJgzBJH0D3gITBdwgUamxHg5T4fUx4gEYu7WPrxlvdGrYYgeJZHm2L1zBE4PK7s/3JW7
	6avvx/gMRivuoa2JrnIqn5APHVPU0PuYUcZuJYSdJKgzFw25iaIRi2zgjB8rETX7FX3qiOFJpAs
	5wjEcmQ43FgXatwwImoxwJL/RBmUYSDSZ5pKDK96HwT6hpzh33o9/gJmW3Df4jG+egLu3sOKNTw
	Ny8NNlJQWF8mnAqLaVPaeMdy1rRCXRtY4gfcjfLwE1yUcCpjoYU4KeMvQag=
X-Received: by 2002:a05:6000:29c2:b0:488:79d6:a4a6 with SMTP id ffacd0b85a97d-48879d6a64fmr2304968f8f.8.1790313698119;
        Thu, 24 Sep 2026 22:21:38 -0700 (PDT)
Received: from AHERLNXVDANI01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6450a3sm3699394f8f.25.2026.09.24.22.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:21:37 -0700 (PDT)
From: =?UTF-8?q?Daniel=20Via=C3=B1o?= <danividanivi@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Michal Simek <michal.simek@amd.com>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Daniel=20Via=C3=B1o?= <danividanivi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] rtc: zynqmp: Enable crystal oscillator when setting time
Date: Fri, 25 Sep 2026 07:20:15 +0200
Message-ID: <20260925052015.22019-1-danividanivi@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_222140_572536_EF6B46F9 
X-CRM114-Status: GOOD (  18.36  )
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

The RTC_OSC_EN macro was defined when the driver was originally
introduced, but was never asserted by the driver. On cold boots, after
battery exhaustion, or on platforms where firmware does not configure
RTC_CTRL, the oscillator remains disabled and the counter never ticks.

Unconditionally enabling the oscillator during driver initialization
would cause the RTC to free-run from an uninitialized or stale counter
value, reporting an untrusted time to userspace. Instead, keep the
oscillator disabled until a valid time is programmed: guard
xlnx_rtc_read_time() on RTC_OSC_EN and return -EINVAL when it is not
set, and assert RTC_OSC_EN in xlnx_rtc_set_time() once valid time is
programmed so the RTC can free-run.

Per the Zynq UltraScale+ TRM (UG1085), bit 24 (OSC_CNTRL) is a static
level enable for the crystal inverter rather than an edge-triggered reset;
asserting it from set_time() is non-destructive and will not glitch an
already-running oscillator.

Tested on Zynq UltraScale+ hardware, confirming that read_time returns
-EINVAL while the oscillator is disabled, and advances reliably after
setting time.

Fixes: 11143c19eb57 ("rtc: add xilinx zynqmp rtc driver")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Viaño <danividanivi@gmail.com>
---
v2:
 - Leave xlnx_init_rtc() unchanged so the oscillator is not enabled on probe
 - Return -EINVAL in xlnx_rtc_read_time() when RTC_OSC_EN is not set
 - Enable RTC_OSC_EN in xlnx_rtc_set_time() once valid time is programmed

 drivers/rtc/rtc-zynqmp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 5bcb7536e973..6c3ba8f1aa57 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -59,6 +59,8 @@ static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
 	unsigned long new_time;
 
+	u32 rtc_ctrl;
+
 	/*
 	 * The value written will be updated after 1 sec into the
 	 * seconds read register, so we need to program time +1 sec
@@ -78,6 +80,14 @@ static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	 */
 	writel(RTC_INT_SEC, xrtcdev->reg_base + RTC_INT_STS);
 
+	/*
+	 * Now that the time is valid, start the crystal oscillator so the
+	 * RTC free-runs.
+	 */
+	rtc_ctrl = readl(xrtcdev->reg_base + RTC_CTRL);
+	rtc_ctrl |= RTC_OSC_EN;
+	writel(rtc_ctrl, xrtcdev->reg_base + RTC_CTRL);
+
 	return 0;
 }
 
@@ -87,6 +97,9 @@ static int xlnx_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	unsigned long read_time;
 	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
 
+	if (!(readl(xrtcdev->reg_base + RTC_CTRL) & RTC_OSC_EN))
+		return -EINVAL;
+
 	status = readl(xrtcdev->reg_base + RTC_INT_STS);
 
 	if (status & RTC_INT_SEC) {
-- 
2.53.0


