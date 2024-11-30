Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25D4D73604
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RIxZuzxWCmBHTdYELBwFpivm3cvG44kmtDreOahc6FI=; b=BLhBQDb8w+bP3s
	o1/UlSRrGmvXPpeQWPtn8XeUiW+IsgZHoNIgTdP1rbAPlfmnfZWEFhfDR+xt0J7d/UAk5+BrBs4wr
	rMxu0wY1LlDLJw0V2O1yyyBfQzfRG7dZN63dE3VETcsX/VlSa9QQRjhlBhEcpf/ZmFIzcLMDRQZ3q
	UlkMEvImCFP9UYIkS7MnA1k3AmyBl+1tnT15DzQ4NR1u7lgKjTpLcZ5bySnM4V0nZ9t0/qI0k/vBv
	PEwhBUqAMRxi184fUk2js68xzcGhfDNkm0jfr1AbNUHv0du0NkRZ5leKqiIzI5IKV9iGe0veZJ8cN
	0cQd4+0GQqLxS2Jys4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHP0a-00000002C2m-1FLj;
	Sat, 30 Nov 2024 15:03:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHOza-00000002BwG-2wSU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 15:02:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385e27c75f4so509175f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 07:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732978960; x=1733583760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIxZuzxWCmBHTdYELBwFpivm3cvG44kmtDreOahc6FI=;
        b=amnaZRbJv8io58aAuG4rnjuYC+xDN5rx8vHMK9klVywMHdznjZYiJtEF3WJ3+J3OKT
         qbB7Elf+0c7GzbEreRFz8c/v5EW0rFgOfz8DUQPoHyaSnw1n8h9/a57+TiUJ4rJL3VAC
         jLyKFjQH1gPgFMCRUefC7X0glzkiXMXxPLSrzY9Z0luHsdfJ/QQ3fwGhtoK3B0Mus39x
         pUgBGqg0s6ebKvvIr/ztZ5U0bEEEDWS/3+T3s0hIseOaA/YV1qnuXrqHPLF3gwuNEE7I
         9p6CSsMDQNVcb5AsBcEtrBXehiuzSo0HEaaVarxYmY9CP6g5IqwaNy12UnKZVIdebxkg
         O5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732978960; x=1733583760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIxZuzxWCmBHTdYELBwFpivm3cvG44kmtDreOahc6FI=;
        b=Jb9nTPaBRjuT0uzuQHCQMKMVcQRUQoH4/AocQFIY7M8l3cIXNUJsn1Wg3j1XqLST6A
         DQ4nbEO+YrMEYgGCS1k0xDtJr5f5PwIM14BxsrtBxSpzpAfwP8By4/dxHZhW91C8kkAh
         dMH20zdehWOZo2V+uL7zHx5Hy4XXt8xNQJLHb44RG5rt66L/8UsMIHnt0GRsXHDWL44T
         V1YIJ6SnU7OSUAaAltjnOAJ9bu099CKdaV3BDVJ63xbocQol3mIGmH7yCGPhbwRwnF4T
         8KZYNkNBFebi1qXhmBgo7OQbPVz6iZyGTkCwlwqGkOaKi+hvP5ucym3MsVCqE+CT+o/J
         OGmw==
X-Forwarded-Encrypted: i=1; AJvYcCW6IFugNNwC1+8EraaSGEwCM06MJBFIdAbRmXdaK4QBcZEHy5g1xsSb7XdBuiTUG/pITFH1JmyuBuzH8Pf31tko@lists.infradead.org
X-Gm-Message-State: AOJu0YzBoIv6AnynzcYsBqHPDmzcsydwNN/9EZlUroOLRLFYtvHpN9Fc
	zNF9jJfXvCm21DlaYDkHrh1bXxTZsIi65efhkUmDTFF9MrrI1lnCoITDi99N+t0=
X-Gm-Gg: ASbGncuQUajbTwclGqCnxl109kjYfpRmMh6Dq4Qc6or4I+Xs23uW01gpvxEWs3DWWH0
	4MyjMBI9JdKicqD1HI0OCsoHk4tqaP9W3FS4fhd7M4nrken5fyvhYfSK8BfkwhVU+SYeNiCcFoJ
	ZlUyn8yPiIwkjNkj3FG4d4H11N9roL4PXombAaRCVcNc8z4C3zQem4wYdpCbQ7LWvBVabv9N576
	/YhUTebrV4bVC5geL0aVW/D/o1zNRM3FC+526HKMGzj8HH55w==
X-Google-Smtp-Source: AGHT+IG7SmAgqLWpO0w58FJsWRhtR3KnnLD0aUy9Ativ6+ehPD5OdDccednlqkuUW6sKW7TgS9z6Nw==
X-Received: by 2002:a5d:5f56:0:b0:385:df73:2f18 with SMTP id ffacd0b85a97d-385df7330bamr5372688f8f.51.1732978958736;
        Sat, 30 Nov 2024 07:02:38 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:7ca4:5604:f5:65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385d7611af2sm5979701f8f.22.2024.11.30.07.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 07:02:38 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] misc: Switch back to struct platform_driver::remove()
Date: Sat, 30 Nov 2024 16:02:31 +0100
Message-ID: <20241130150231.900755-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7078; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=1zRfjh/TbGwcSXp6t+/CfaYBgE6ti0sCaNcOyp9qsIY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnSykIDZe9lqJpeaZD+flWQcLxbEmBh0Sux49lu SV5ovm6vmaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0spCAAKCRCPgPtYfRL+ TtyOB/9YEH0yxGtL0vZKsFbJLnEoT7d0IhAdw1TIS3Tu49473WdlyNzJjlbVk97uJZ5ATzOH3/S RQleqOs5gDX4t53tpB3MtLeAwxz/sfHd0fmKOvAJMxiVANNndwZzNkI1NFsC8qMdwewk2OWvCgc g+rIGbQ6E9n/WnqNFVgbm9tb26AkONi25AuHbk3raB50YQl3S7J+mFFcXaceC1cqMHinsT2wOjW pSbyH+FtZM5vKfi39iZxeH0qf9XaKA+v+5jIxt2yPzS+HRz7Qlw7u7fnPAMUeE07Gb0LsQaXgBo oWlNIHTHc+d9uyGKGhr6BGfKM5YS+f4xXhodbR78ItTZsAoc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_070243_084637_5D175D89 
X-CRM114-Status: GOOD (  17.09  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Donnellan <ajd@linux.ibm.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Usyskin <alexander.usyskin@intel.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, dri-devel@lists.freedesktop.org, Frederic Barrat <fbarrat@linux.ibm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Dragan Cvetic <dragan.cvetic@amd.com>, linux-arm-msm@vger.kernel.org, Andrei Simion <andrei.simion@microchip.com>, John Stultz <jstultz@google.com>, Amol Maheshwari <amahesh@qti.qualcomm.com>, Michal Simek <michal.simek@amd.com>, Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>, linux-arm-kernel@lists.infradead.org, Derek Kiernan <derek.kiernan@amd.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/auxdisplay to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is based on Friday's next, feel free to drop changes that result in
a conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

This is merge window material.

Best regards
Uwe

 drivers/misc/atmel-ssc.c           | 2 +-
 drivers/misc/cxl/of.c              | 2 +-
 drivers/misc/fastrpc.c             | 2 +-
 drivers/misc/hisi_hikey_usb.c      | 2 +-
 drivers/misc/mei/platform-vsc.c    | 2 +-
 drivers/misc/open-dice.c           | 2 +-
 drivers/misc/sram.c                | 2 +-
 drivers/misc/tps6594-esm.c         | 2 +-
 drivers/misc/tps6594-pfsm.c        | 2 +-
 drivers/misc/vcpu_stall_detector.c | 2 +-
 drivers/misc/xilinx_sdfec.c        | 2 +-
 drivers/misc/xilinx_tmr_inject.c   | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
index 1d0322dfaf79..35a196341534 100644
--- a/drivers/misc/atmel-ssc.c
+++ b/drivers/misc/atmel-ssc.c
@@ -269,7 +269,7 @@ static struct platform_driver ssc_driver = {
 	},
 	.id_table	= atmel_ssc_devtypes,
 	.probe		= ssc_probe,
-	.remove_new	= ssc_remove,
+	.remove		= ssc_remove,
 };
 module_platform_driver(ssc_driver);
 
diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
index 03633cccd043..cf6bd8a43056 100644
--- a/drivers/misc/cxl/of.c
+++ b/drivers/misc/cxl/of.c
@@ -339,6 +339,6 @@ struct platform_driver cxl_of_driver = {
 		.owner = THIS_MODULE
 	},
 	.probe = cxl_of_probe,
-	.remove_new = cxl_of_remove,
+	.remove = cxl_of_remove,
 	.shutdown = cxl_of_shutdown,
 };
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 74181b8c386b..412683e0ea86 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2215,7 +2215,7 @@ static const struct of_device_id fastrpc_match_table[] = {
 
 static struct platform_driver fastrpc_cb_driver = {
 	.probe = fastrpc_cb_probe,
-	.remove_new = fastrpc_cb_remove,
+	.remove = fastrpc_cb_remove,
 	.driver = {
 		.name = "qcom,fastrpc-cb",
 		.of_match_table = fastrpc_match_table,
diff --git a/drivers/misc/hisi_hikey_usb.c b/drivers/misc/hisi_hikey_usb.c
index fb9be37057a8..ffe7b945a298 100644
--- a/drivers/misc/hisi_hikey_usb.c
+++ b/drivers/misc/hisi_hikey_usb.c
@@ -260,7 +260,7 @@ MODULE_DEVICE_TABLE(of, id_table_hisi_hikey_usb);
 
 static struct platform_driver hisi_hikey_usb_driver = {
 	.probe = hisi_hikey_usb_probe,
-	.remove_new = hisi_hikey_usb_remove,
+	.remove = hisi_hikey_usb_remove,
 	.driver = {
 		.name = DEVICE_DRIVER_NAME,
 		.of_match_table = id_table_hisi_hikey_usb,
diff --git a/drivers/misc/mei/platform-vsc.c b/drivers/misc/mei/platform-vsc.c
index 71f9994da2cc..a70e64acf571 100644
--- a/drivers/misc/mei/platform-vsc.c
+++ b/drivers/misc/mei/platform-vsc.c
@@ -435,7 +435,7 @@ MODULE_DEVICE_TABLE(platform, mei_vsc_id_table);
 
 static struct platform_driver mei_vsc_drv = {
 	.probe = mei_vsc_probe,
-	.remove_new = mei_vsc_remove,
+	.remove = mei_vsc_remove,
 	.id_table = mei_vsc_id_table,
 	.driver = {
 		.name = MEI_VSC_DRV_NAME,
diff --git a/drivers/misc/open-dice.c b/drivers/misc/open-dice.c
index e6a61e6d9427..24c29e0f00ef 100644
--- a/drivers/misc/open-dice.c
+++ b/drivers/misc/open-dice.c
@@ -178,7 +178,7 @@ static const struct of_device_id open_dice_of_match[] = {
 };
 
 static struct platform_driver open_dice_driver = {
-	.remove_new = open_dice_remove,
+	.remove = open_dice_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = open_dice_of_match,
diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index 546eb06a40d0..e40b027a88e2 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -451,7 +451,7 @@ static struct platform_driver sram_driver = {
 		.of_match_table = sram_dt_ids,
 	},
 	.probe = sram_probe,
-	.remove_new = sram_remove,
+	.remove = sram_remove,
 };
 
 static int __init sram_init(void)
diff --git a/drivers/misc/tps6594-esm.c b/drivers/misc/tps6594-esm.c
index b4d67a1a24e4..2fbd3fbdf713 100644
--- a/drivers/misc/tps6594-esm.c
+++ b/drivers/misc/tps6594-esm.c
@@ -135,7 +135,7 @@ static struct platform_driver tps6594_esm_driver = {
 		.pm = pm_sleep_ptr(&tps6594_esm_pm_ops),
 	},
 	.probe = tps6594_esm_probe,
-	.remove_new = tps6594_esm_remove,
+	.remove = tps6594_esm_remove,
 };
 
 module_platform_driver(tps6594_esm_driver);
diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
index 9bcca1856bfe..0a24ce44cc37 100644
--- a/drivers/misc/tps6594-pfsm.c
+++ b/drivers/misc/tps6594-pfsm.c
@@ -314,7 +314,7 @@ static struct platform_driver tps6594_pfsm_driver = {
 		.name = "tps6594-pfsm",
 	},
 	.probe = tps6594_pfsm_probe,
-	.remove_new = tps6594_pfsm_remove,
+	.remove = tps6594_pfsm_remove,
 };
 
 module_platform_driver(tps6594_pfsm_driver);
diff --git a/drivers/misc/vcpu_stall_detector.c b/drivers/misc/vcpu_stall_detector.c
index 41b8c2119e20..f0b1fc87490e 100644
--- a/drivers/misc/vcpu_stall_detector.c
+++ b/drivers/misc/vcpu_stall_detector.c
@@ -233,7 +233,7 @@ MODULE_DEVICE_TABLE(of, vcpu_stall_detect_of_match);
 
 static struct platform_driver vcpu_stall_detect_driver = {
 	.probe  = vcpu_stall_detect_probe,
-	.remove_new = vcpu_stall_detect_remove,
+	.remove = vcpu_stall_detect_remove,
 	.driver = {
 		.name           = KBUILD_MODNAME,
 		.of_match_table = vcpu_stall_detect_of_match,
diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index ea433695f4c4..3135ba3a58ee 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -1444,7 +1444,7 @@ static struct platform_driver xsdfec_driver = {
 		.of_match_table = xsdfec_of_match,
 	},
 	.probe = xsdfec_probe,
-	.remove_new =  xsdfec_remove,
+	.remove = xsdfec_remove,
 };
 
 module_platform_driver(xsdfec_driver);
diff --git a/drivers/misc/xilinx_tmr_inject.c b/drivers/misc/xilinx_tmr_inject.c
index 734fdfac19ef..6284606ffb9f 100644
--- a/drivers/misc/xilinx_tmr_inject.c
+++ b/drivers/misc/xilinx_tmr_inject.c
@@ -164,7 +164,7 @@ static struct platform_driver xtmr_inject_driver = {
 		.of_match_table = xtmr_inject_of_match,
 	},
 	.probe = xtmr_inject_probe,
-	.remove_new = xtmr_inject_remove,
+	.remove = xtmr_inject_remove,
 };
 module_platform_driver(xtmr_inject_driver);
 MODULE_AUTHOR("Advanced Micro Devices, Inc");

base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
-- 
2.45.2


