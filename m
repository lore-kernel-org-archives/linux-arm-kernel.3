Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F99C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 04:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xvo929vZe40Bej4+5nG1zx+7ENE5vhyPaIbe1OuxRao=; b=Q4VOspwI9a8J/IdBmIij3KIiZy
	XYwniqhVOxvIpNG0awaKNs26f7/0MuEx5oKC6a9VnCvy/72jin+UZFxn4PzLOkRtNmBGkYSSwaIqB
	CbU9JADaVOvu1Hu1lRht3g7QNTj/2CRT0hITFNTVV9loyI41wf2D2snvEo4oNCwHU8Wdzx9kiU7Bl
	HmuwwA/hEAIpi+Q4m4Q7GynqcpghUG1+nDp6IKsMmHzU+HBD5Ne1XsooKhVbAek6IxFmayDKtXgzR
	VROuokyy3u5afmOaTF7bg3voL8hTTrXa5tz4qOwhUGeKbCjciRrLLDb7dsx1Q/Qd5vTAquF+s06DJ
	BDO1YXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzoQx-000000056xR-0SSL;
	Fri, 28 Aug 2026 04:43:19 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzoQu-000000056x6-2OAl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 04:43:17 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-44cf70de986so284134fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 21:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787892195; x=1788496995; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xvo929vZe40Bej4+5nG1zx+7ENE5vhyPaIbe1OuxRao=;
        b=DhpFlQm4nWsoYW6obtaK4b1LEXDjrayJ63jITGEp9on1XgtNuQYtfXUZjihts6lbFw
         erwouYZ6b3I146D2HjUKTHjPZGFB7SRmrQ8f4J48G9/0Eyt35R3hKlGLdYH9e62qSwv4
         /3h00zixKvpTyjuvQ+VS4F9jf9vd3furKViN/XEoLxu73MOLeVqKmj5OpEVu5GsnaAo3
         /AHGkKGwqtXmMCJ7frqetd7lBR1BSyxSjK8IW8k/rYCj4/6/stFQX7WNE45zTIcT1Hw0
         5iY4CvFdTU6r0WSyjDrtMzXK2yWSe5uosCrlMM0+DbyNEDleia5BSbAewCmnuq/QwNcr
         NbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787892195; x=1788496995;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xvo929vZe40Bej4+5nG1zx+7ENE5vhyPaIbe1OuxRao=;
        b=VKis2PLVNsKPE2ctl6Ax+OV9o3wnsLBdZIEiQrKRcekSbRiTSLXrHUYaMpVqhDvQyA
         J0Yt+3lUvIu/Dcv8+sn7QMFREXDhVCjem0p+VAZOcB7/c0DNhMhUZSbiuCgL0scm0IDZ
         El1XP1fLCfRP7hxj77M3IEuLfQYgCKZpaXTYaq8WCsLjGra2kjcUaAEafPKurY3YkKVB
         TVpjzjt/5CC5LJHyX4wsazodJ+2NDhx8RuaEsT0pEhGKuSa2h12QlAVGuPeEzQv+t+Jx
         /r6NRcairy/1o6+nreVKXaO3416xhkWyuTHvUETyY3alaPp8Cm1PLY1f4nqNTc0ticiB
         3z5A==
X-Forwarded-Encrypted: i=1; AHgh+RogLTWUNrRsWcbLDnKRudRtyOIY7XIPvA4N3ryDyrbiwLDN38bA2fPJgoQUZnHsjEWeHhBV1I5HPs6LWYM6zqfP@lists.infradead.org
X-Gm-Message-State: AFuF++kZRTs/Fwo9HqxTPmaEymLQ+FfpuWjyWncdj5a5HrGvndqcdkTl
	pIn4MNniSwWmBnd3BdVnsfVbnVJUrvPaf1dwC989zxVt5609tBu4lsvx
X-Gm-Gg: AR+sD10rLXuG/FfO0zcirF8Q9H1LEMQUjWuTDtbJAupRGYJFAPQ53cuHtCtEqi1mioJ
	lHfbd7Iwfp5+cJoOVd27NswRZB3pRxIeV4Wg+RSTsO3ImV3TBmAWkQuDGnZem0QB6X0F1r4h8BF
	7hlr7rhqEzfXEOdXgdmVq/XLqv3GYP7Yzl6kx0YBlm/wZ9kzuxJ0RDUo1bKIE/nYHbQA0Smu+6F
	oELJu0oQeOoHUbBGepgM3P/daRkR3uqk+7OOTj74Ee3045IZR8cp15R6G7rZqALE0id7bqtXYIk
	ZS0utJrpuyqrJFXMVGImXK8qRuGzRUulU0GSAwsUPFk2SSlAeP5ZKgugpIoeXB+oZGvNIsGtTof
	frx/Gju+mFtnnGg/fq9GsSlQa0Y0Su7TSec2xVxWupRhSRnbpeNoHpOZRj4hkOLfIcJvwaIaXaT
	TZuc9LIf6xamgnGW5tP0VcUwasmmy7x2wS3Chp7chFcElz+ay2gxl1uivTzbeB/lrgaeRV57bnY
	8GtBY+Ay1Jfucvt03GD577xhSSSlSA7c6oHp0lpdO3MdcJB/T1CJp25qIhuGFeEsEsv5i3ek8Zy
	BPQeO7/s3MNmgfeTnTd0NYBkF/DUoApveMY0stXo58bnX+CKOa4M9jdnqPGR8bauK3zzbeYP9dS
	d2hEWBPTY8mwEmY4zQb8=
X-Received: by 2002:a05:6871:a516:b0:44c:d6f0:7f70 with SMTP id 586e51a60fabf-468377989e0mr4945563fac.17.1787892195218;
        Thu, 27 Aug 2026 21:43:15 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-468a2fedbcasm497632fac.2.2026.08.27.21.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:43:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 27 Aug 2026 22:42:31 -0600
Subject: [PATCH v2] watchdog: sunxi_wdt: preserve boot-enabled watchdog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-submit-sunxi-wdt-boot-enabled-v1-v2-1-610d37dccc97@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dgytiMWV9zAsaDvAGGhNWxFDu
 LsFT2Ayyc9Lft6fhQX0hIFds4V5nCiQswnEIWO6b2yHQCYxE7kocykuEF5qpJjCzgRvE0E5FwF
 towY0MHGoCm1KhVKejWBJ8/TY0rxP3OsfJ8cDddy8W6OnEJ3/7D9MfOv9MZeOg+FlW50KrWVe3
 bqxoeGo3cjqdV2/S14P++IAAAA=
X-Change-ID: 20260827-submit-sunxi-wdt-boot-enabled-v1-94cd6be885d2
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Carlo Caione <carlo.caione@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_214316_626393_CA6B50EC 
X-CRM114-Status: GOOD (  17.64  )
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

sunxi_wdt_probe() unconditionally stops the watchdog even when firmware
left it running. This opens an unprotected interval during boot and
prevents CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED from taking over the active
watchdog.

Detect an enabled watchdog and decode its programmed interval. Preserve
representable timeouts, and round the 0.5-second interval up to the
minimum representable one-second timeout. Use the configured timeout for
reserved interval encodings. Set the Linux reset mode and ping the
watchdog without clearing its enable bit, then mark it hardware-running
before registration so the watchdog core services it until userspace
takes control. Leave disabled watchdogs untouched.

Fixes: d00680ed0026 ("watchdog: sunxi: New watchdog driver for Allwinner A10/A13")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Use one second for the boot-enabled 0.5-second interval instead of
    falling back to the configured timeout.  (suggested by Guenter Roeck)
  - Leave an already-disabled watchdog untouched.  (suggested by Guenter Roeck)
---
 drivers/watchdog/sunxi_wdt.c | 45 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b6c761acc3de..3db34524ed13 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -128,6 +128,38 @@ static int sunxi_wdt_ping(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static bool sunxi_wdt_is_running(struct watchdog_device *wdt_dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
+	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
+
+	return readl(sunxi_wdt->wdt_base + regs->wdt_mode) & WDT_MODE_EN;
+}
+
+static unsigned int sunxi_wdt_get_timeout(struct watchdog_device *wdt_dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
+	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
+	unsigned int timeout;
+	u32 interval;
+
+	interval = readl(sunxi_wdt->wdt_base + regs->wdt_mode);
+	interval >>= regs->wdt_timeout_shift;
+	interval &= WDT_TIMEOUT_MASK;
+	/* Round the 0.5-second interval up to the minimum representable timeout. */
+	if (!interval)
+		return WDT_MIN_TIMEOUT;
+
+	for (timeout = WDT_MIN_TIMEOUT;
+	     timeout < ARRAY_SIZE(wdt_timeout_map); timeout++) {
+		if (wdt_timeout_map[timeout] == interval)
+			return timeout;
+	}
+
+	/* Reserved interval encoding. */
+	return 0;
+}
+
 static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
 		unsigned int timeout)
 {
@@ -259,6 +291,7 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct sunxi_wdt_dev *sunxi_wdt;
+	unsigned int running_timeout;
 	int err;
 
 	sunxi_wdt = devm_kzalloc(dev, sizeof(*sunxi_wdt), GFP_KERNEL);
@@ -286,7 +319,17 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
 
-	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+	if (sunxi_wdt_is_running(&sunxi_wdt->wdt_dev)) {
+		running_timeout = sunxi_wdt_get_timeout(&sunxi_wdt->wdt_dev);
+		if (running_timeout)
+			sunxi_wdt->wdt_dev.timeout = running_timeout;
+
+		err = sunxi_wdt_start(&sunxi_wdt->wdt_dev);
+		if (err)
+			return err;
+
+		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	}
 
 	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);

---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260827-submit-sunxi-wdt-boot-enabled-v1-94cd6be885d2

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


