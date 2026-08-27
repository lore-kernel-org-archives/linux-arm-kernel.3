Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46497C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 23:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zVdJjWb3UpbdKuHlq3/PIvwY2V+KiCYJBGO2pCIZorA=; b=3V5T/3EGOsC8k4OqI1Kj8Ijdgt
	oYBpolS5d7TZfIyV7JWcWsPgIt6tZ8JvL0dbN0SQ+9TDoQWofFUAqLTNfL+JpjbXv3XOw1Fw36+mh
	3q7V688m1L2H+1/m3HwLYtZ9elM4BHs4aNeD0tJ/1+dovFnhQVUKQgHZelmwZEf3m+MCjkSeUcFL7
	8s8ZmzGykKMVtQm3IJuKGMJCcBfH410RIIry4MX9kZMKn1LpdFSDcH5AxR9eICfxVGPKi/phNVtDf
	0eUOaSjBLeg6RDHPPWat7upwk0hUcngcXBM16az7QHlPGwptkHNdcwC4REcpd9QKyjE307zyP+F6s
	1bHTE5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjkY-00000004vLQ-3dTZ;
	Thu, 27 Aug 2026 23:43:14 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjkW-00000004vL4-0h7r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 23:43:13 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-44cd237446cso626656fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787874190; x=1788478990; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zVdJjWb3UpbdKuHlq3/PIvwY2V+KiCYJBGO2pCIZorA=;
        b=PKwo+zkEUrKUlzhY10oyynneMSMUHupXsHEKhFLcEpjNwyN5ByN8JjHrLWoNHI6E76
         b4H8He3MJhZE9G49SJBPAk0T7zNPmhXp9YQL/TdHupIBjgR6vm2JbkLjOpGiD0u8VT25
         CtrQfJfIR6twm9jurClVggHeqZc9iJs5qWtVB381P9ekFgPKqHiSr+t5RARYKLKbJH7O
         3bwic87Gl9FB6ysdNVQppfl1yaJOThtgH4uW1ZXKJmb2k9fTKTbX6AT458zrUze3Baag
         dCa9Z5hf1eYVf99LVPlKO18b7vC8TyCo9Q1fIct2NtHLDNo6imLK0UZb2g+jxQQ+Q1E5
         5HzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787874190; x=1788478990;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zVdJjWb3UpbdKuHlq3/PIvwY2V+KiCYJBGO2pCIZorA=;
        b=oEKXB/lIER+uKBhbM38CPkRLPm0DSRB5ulrE6rUzvfqI2ZCegvppU7Gv5Rr24TEf4v
         HC4fnlblM+ChPcslnIq5LKP+mKEuBK4udnc3mirD88jarlmuUp0pG2IJIpfqas8w7X8o
         7xK2cl+g1z4yv5z92UojYt4wGkYPCwCQIE3ESlKu8l9iGmrxRes5gxKmVKVfHiCImpjz
         kdPDRinpj4AgBAR2hMPqB0s52u2hZpCdTIsnkmXgpyU+TFKBbZ5cZY+ByGby40xDl6+d
         ///MsysXc5vTRIWen4ln4k1/m33nLSiKxd2dEYQkn0OTMAqbLqgi3TXvy42LsaPulP7q
         Fgtg==
X-Forwarded-Encrypted: i=1; AHgh+RrbIl6RToJvilua2NrlrL92TZIF/ghhwLvbg2cIY0TUB4MyVB2/CuBqhPTUuXf9ErgmP7vw8ucqfuhHxmiuBesV@lists.infradead.org
X-Gm-Message-State: AFuF++kqVccvMSINj+xTmIhkdUqECUNaGXWU6sYal844F5IFFlM2eoVe
	EF1aJHVVrI++CS+rtMRBeuaMxpNH2ETPlw/ZjurkiRzvcwa3R/ZFU7Z+
X-Gm-Gg: AR+sD132kECLgnT28I4c8+jVAQ9vJSW3JUqLdntT6As3rcyNxd1oACjysAu2gXS18FB
	fLksbLh5uwnpquKNwppBy7vAkw88gR10krY3unMM49At8e3B6AZBtLoly6TYXTrBIfLZV4az7GB
	0RKIAwV0KPJND1Pec/gCp0ZQ61zYbNfZYcWtrlIWJQLgnxO2GiMS1jPFP+I/eC55EOH5s1gJ0n/
	qJSfgPBzYUg0NIcha9R+xJ7vmuQMIbiVBIBzP0mT/227w3zgYPy9oG95JxUO20hz0/io3uCKOGH
	bRdLZL2aeqv5LpxdvkMjwtCn/w6suQ4APKSh8j6IOTq7xuQIEABoL2q6i4TLXZ1sZyY3D9DLpnM
	FKF7FDpUpJTvlJi2AmgQ8KfpSWyl9MkjsriQsDfrkpg7MkTH65/evvksUcSnoiW/TsacJNFEEpR
	Jrq5j2cp+PU9DbEm9qDfjLnaeRSGlZ5HhwLJycUQwnEraRAG/OK3FiP2kBumjI5Pu849LvF5myy
	zvWfayER2LcIo5CeOeokC9dAHgAWKZhZl3XandY5JivNpCL834ozIEidOo8Zku6rjiPMo/usc2b
	2N5cB5IANblpZ9uUhPIXHAA/E8VrWIpu4apd01X6n8moHVilgnYBH4ry0WJc7K76GlaPH9MUhfW
	coEU2vgJDIXJlCoTQ8Q==
X-Received: by 2002:a05:6808:1308:b0:4b2:21e2:82d5 with SMTP id 5614622812f47-4b3981256e5mr3096321b6e.10.1787874190443;
        Thu, 27 Aug 2026 16:43:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b36abbdb56sm5279979b6e.17.2026.08.27.16.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:43:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 27 Aug 2026 17:42:51 -0600
Subject: [PATCH] watchdog: sunxi_wdt: preserve boot-enabled watchdog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-submit-sunxi-wdt-boot-enabled-v1-v1-1-d16f934cc809@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTsJNIrVqxgWtDPIEG1NW5GEc
 HdHWb18m/+tkDkJZ7hWKySeJUsMiuZQgR/7cGcUUoOpTVtbc8b8dk8pOmER/FBBF2NBDr17MOH
 c4OXoqXVs7YkMaOaVeJDlf3HrdmtjYl9+Xdi2L4+MHriEAAAA
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
X-CRM114-CacheID: sfid-20260827_164312_241526_EF96890F 
X-CRM114-Status: GOOD (  17.68  )
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
that timeout while setting the Linux reset mode and pinging the watchdog;
use the configured timeout only when the hardware interval cannot be
represented. The enable bit remains set throughout. Mark it as
hardware-running before registration so the watchdog core services it
until userspace takes control. Keep the existing stop operation when the
watchdog was disabled.

Fixes: d00680ed0026 ("watchdog: sunxi: New watchdog driver for Allwinner A10/A13")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/watchdog/sunxi_wdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b6c761acc3de..1f3da1d47fa5 100644
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
+	/* The 0.5-second interval cannot be represented by wdt_dev->timeout. */
+	if (!interval)
+		return 0;
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
@@ -286,7 +319,19 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
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
+	} else {
+		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+	}
 
 	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);

---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260827-submit-sunxi-wdt-boot-enabled-v1-94cd6be885d2

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


