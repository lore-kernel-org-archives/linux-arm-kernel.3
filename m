Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD1BD41D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C6QofcCdQmsLqvy2bS7OgsAFd+Nwlz5uz8nWM8QdfQg=; b=nQj8miu1eGW3u7MzwJ2QyERWNv
	5H7MwqdzhgaPeWR9tZtIehdfXtuAPHcyXqOGboUgLF7UBqQRJ/W4NsnTUSU10SbS5YXP0ffJ8Q8te
	NfMZoogeStPAf10zvBs8XwEHu4xF5MYE1CCdp7WBdCQ637NEMx47zfKwO9KrTdnkkPQ/xlt//+foD
	c82OvOd5GYbO04W2XTRvi4LlB7HqClngG305qxomDy2ePXMXWwq65J892A9z0/d/csYZV9kZx71D6
	fkacIZOcY3LYh7DVnR9Y/Aedb78upYC9bIhrIOG0P0IorraHKUOEfU9TT7KSbk58E2KONx9rXsCTr
	SqRiNiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmSh-00000002fjo-2j5F;
	Tue, 12 Nov 2024 08:41:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmNR-00000002efY-3dEU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 08:35:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43155afca99so35510795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 00:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400556; x=1732005356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C6QofcCdQmsLqvy2bS7OgsAFd+Nwlz5uz8nWM8QdfQg=;
        b=UAXqF/2nQDNy8qBRsrrjzplRgilenqgiSH6k7mwE7q4bjEHornO310Kg6h+aMFHJRC
         EhopHmsdYWnP/kWeAbUZIzl+DjeGjv8CLZ9yRawKln8lAgPzGR/qRMACSMFKumMduSBM
         rT+u5TTRD6JxhKNo6ruxD3D0kDdcxqMvBTfqwUzDbIttOYOCgr/aecNY2Uc2D8oECAxm
         pLARKDJ/WWL8OwGgko0WSViLXBlKkYJV9F0cnKTecI4ItbJ7rPgoGEF4xpEfg/nfr4o3
         4DNzqYGC60drBErWrvL+EmtNgoJQ3S2a0RtMFAiwGJ+eCOkXYMyJUM66N6XegSGYTnqv
         DucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400556; x=1732005356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6QofcCdQmsLqvy2bS7OgsAFd+Nwlz5uz8nWM8QdfQg=;
        b=qwpNHyhiBJm/LN0AzjrB2RafAPZQQbTlGNWvjW7ljfmmwGU6zJFPoN7ewdCq7ytnQ/
         HNubWpOWU7kiVKgjGAxxwzeE/eTsvpHFuCRadHYx1+DtakK4Is0h3bl4dMJ9mUn4AACu
         J/sV95WIKNIwwo8orH2nRttNAghPRkdI/g0E49r9uusiY+x4+PnS9pon/+WDkCAleL5p
         0zCsE2CHOAaQnjUSqt7u67J7qx24Wxf4wXvp52fbR8SPCHDb+8QLHVZhk7d/iI1ka/oa
         u3ITHgYhqJM+S7pmLFYtkbHl2IBsgb3TqxAMSa0b7IGHWRsHfF7BR3RsXBQXEx+TWDcv
         R5Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWs76q7+vIdLlsp9lp5RhQO49NGoEKTQwCfHG/eMIG0KbTrppFnDoR3EN0PAPMpcUup6VPGw8KAUy2IW8U5dMLM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1eMzIQAwtqqx/n7ZdJtDWEDfDwuDJIg5qy4apu3dnjGWaYhTe
	UtilnnrI4UK0kX2ZZ/RxIB2S21fdxX9Dlv73809P2Otd1TPpaoIaB4N2cCMZZL4=
X-Google-Smtp-Source: AGHT+IGW+y3BR7dFB04YA4ES3C1lW4o7kCU2hloqBgpq+LKWd/AQDkgHN2jgVjcYHfhMS3JEIGnWwQ==
X-Received: by 2002:a05:600c:4690:b0:431:5226:1633 with SMTP id 5b1f17b1804b1-432b744ef66mr130754775e9.6.1731400555594;
        Tue, 12 Nov 2024 00:35:55 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa523a0esm233176195e9.0.2024.11.12.00.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:35:55 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gabriel Somlo <somlo@cmu.edu>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Ronak Jain <ronak.jain@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	qemu-devel@nongnu.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH] firmware: Switch back to struct platform_driver::remove()
Date: Tue, 12 Nov 2024 09:35:20 +0100
Message-ID: <36974feb6035201d53384557259ec72fe311053b.1731397962.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7555; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Mu/o9Qv5X4vFA1jVqoDuiGcIFYCOHs8UofluQ4+eEKY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnMxNYRTU/Z/YcH9oKPyjD1Bi3PtTwnTXisZzZA y+s+3m+Wv2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZzMTWAAKCRCPgPtYfRL+ TnzXB/wIb7KWzpl9KhF1WQm264Rj2ne8x5AR+YU2GkZbmy5FZrtPt6HXJuJgBDULzpxixsmxIJF VlvB5dKowmesjkiHP1AFIiR2D9fWHM+CZMEFlqVCJGrdEQrW9D+UmULcTNI3XB222G4b7YLFHM0 ed5WNuOnohzkIvJSnXdnFm/sx4bu902DDKuNLJAvDs03YbVOb2skn28UEl0B7lXZ76AcJCc3CkS wV70cKyYkGbRAjHgBNtbZcxR/2sZ1BL6KTlE4IXgb8MxxwahMWg2nbcdW/xI3OHYzt0LTeREnhL 2dc2WNr0WcclVbruKzpBOsuQEfd3vxFF7Hm2ApRGzKe6CE3/
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_003557_955588_6255D196 
X-CRM114-Status: GOOD (  20.62  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/firmware to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/firmware. While I usually prefer
to do one logical change per patch, this seems to be overengineering
here as the individual changes are really trivial and shouldn't be much
in the way for stable backports.

There is no dedicated maintainer for drivers/firmware, maybe Sudeep as
biggest committer there can take it? Or would it be sensible to split
this patch?

This is based on yesterday's next, if conflicts arise when you apply it
at some later time and don't want to resolve them, feel free to just
drop the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/firmware/arm_scmi/driver.c            | 2 +-
 drivers/firmware/arm_scpi.c                   | 2 +-
 drivers/firmware/google/coreboot_table.c      | 2 +-
 drivers/firmware/imx/imx-dsp.c                | 2 +-
 drivers/firmware/microchip/mpfs-auto-update.c | 2 +-
 drivers/firmware/mtk-adsp-ipc.c               | 2 +-
 drivers/firmware/qemu_fw_cfg.c                | 2 +-
 drivers/firmware/raspberrypi.c                | 2 +-
 drivers/firmware/stratix10-rsu.c              | 2 +-
 drivers/firmware/stratix10-svc.c              | 2 +-
 drivers/firmware/xilinx/zynqmp.c              | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1f53ca1f87e3..1b5fb2c4ce86 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3333,7 +3333,7 @@ static struct platform_driver scmi_driver = {
 		   .dev_groups = versions_groups,
 		   },
 	.probe = scmi_probe,
-	.remove_new = scmi_remove,
+	.remove = scmi_remove,
 };
 
 static struct dentry *scmi_debugfs_init(void)
diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index f4d47577f83e..87c323de17b9 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -1049,7 +1049,7 @@ static struct platform_driver scpi_driver = {
 		.dev_groups = versions_groups,
 	},
 	.probe = scpi_probe,
-	.remove_new = scpi_remove,
+	.remove = scpi_remove,
 };
 module_platform_driver(scpi_driver);
 
diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index 208652a8087c..882db32e51be 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -220,7 +220,7 @@ MODULE_DEVICE_TABLE(of, coreboot_of_match);
 
 static struct platform_driver coreboot_table_driver = {
 	.probe = coreboot_table_probe,
-	.remove_new = coreboot_table_remove,
+	.remove = coreboot_table_remove,
 	.driver = {
 		.name = "coreboot_table",
 		.acpi_match_table = ACPI_PTR(cros_coreboot_acpi_match),
diff --git a/drivers/firmware/imx/imx-dsp.c b/drivers/firmware/imx/imx-dsp.c
index 01c8ef14eaec..ed79e823157a 100644
--- a/drivers/firmware/imx/imx-dsp.c
+++ b/drivers/firmware/imx/imx-dsp.c
@@ -180,7 +180,7 @@ static struct platform_driver imx_dsp_driver = {
 		.name = "imx-dsp",
 	},
 	.probe = imx_dsp_probe,
-	.remove_new = imx_dsp_remove,
+	.remove = imx_dsp_remove,
 };
 builtin_platform_driver(imx_dsp_driver);
 
diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 0f7ec8848202..38a03698cec9 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -458,7 +458,7 @@ static struct platform_driver mpfs_auto_update_driver = {
 		.name = "mpfs-auto-update",
 	},
 	.probe = mpfs_auto_update_probe,
-	.remove_new = mpfs_auto_update_remove,
+	.remove = mpfs_auto_update_remove,
 };
 module_platform_driver(mpfs_auto_update_driver);
 
diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-ipc.c
index fdb083f42ebf..2b79371c61c9 100644
--- a/drivers/firmware/mtk-adsp-ipc.c
+++ b/drivers/firmware/mtk-adsp-ipc.c
@@ -132,7 +132,7 @@ static struct platform_driver mtk_adsp_ipc_driver = {
 		.name = "mtk-adsp-ipc",
 	},
 	.probe = mtk_adsp_ipc_probe,
-	.remove_new = mtk_adsp_ipc_remove,
+	.remove = mtk_adsp_ipc_remove,
 };
 builtin_platform_driver(mtk_adsp_ipc_driver);
 
diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index 85c525745b31..d58da3e4500a 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -757,7 +757,7 @@ MODULE_DEVICE_TABLE(acpi, fw_cfg_sysfs_acpi_match);
 
 static struct platform_driver fw_cfg_sysfs_driver = {
 	.probe = fw_cfg_sysfs_probe,
-	.remove_new = fw_cfg_sysfs_remove,
+	.remove = fw_cfg_sysfs_remove,
 	.driver = {
 		.name = "fw_cfg",
 		.of_match_table = fw_cfg_sysfs_mmio_match,
diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 18cc34987108..7ecde6921a0a 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -406,7 +406,7 @@ static struct platform_driver rpi_firmware_driver = {
 	},
 	.probe		= rpi_firmware_probe,
 	.shutdown	= rpi_firmware_shutdown,
-	.remove_new	= rpi_firmware_remove,
+	.remove		= rpi_firmware_remove,
 };
 module_platform_driver(rpi_firmware_driver);
 
diff --git a/drivers/firmware/stratix10-rsu.c b/drivers/firmware/stratix10-rsu.c
index e20cee9c2d32..1ea39a0a76c7 100644
--- a/drivers/firmware/stratix10-rsu.c
+++ b/drivers/firmware/stratix10-rsu.c
@@ -802,7 +802,7 @@ static void stratix10_rsu_remove(struct platform_device *pdev)
 
 static struct platform_driver stratix10_rsu_driver = {
 	.probe = stratix10_rsu_probe,
-	.remove_new = stratix10_rsu_remove,
+	.remove = stratix10_rsu_remove,
 	.driver = {
 		.name = "stratix10-rsu",
 		.dev_groups = rsu_groups,
diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 528f37417aea..c5c78b869561 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -1271,7 +1271,7 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
 
 static struct platform_driver stratix10_svc_driver = {
 	.probe = stratix10_svc_drv_probe,
-	.remove_new = stratix10_svc_drv_remove,
+	.remove = stratix10_svc_drv_remove,
 	.driver = {
 		.name = "stratix10-svc",
 		.of_match_table = stratix10_svc_drv_match,
diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index cdb565c41119..720fa8b5d8e9 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2118,6 +2118,6 @@ static struct platform_driver zynqmp_firmware_driver = {
 		.dev_groups = zynqmp_firmware_groups,
 	},
 	.probe = zynqmp_firmware_probe,
-	.remove_new = zynqmp_firmware_remove,
+	.remove = zynqmp_firmware_remove,
 };
 module_platform_driver(zynqmp_firmware_driver);

base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.45.2


