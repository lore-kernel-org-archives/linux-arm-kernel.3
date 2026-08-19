Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DEBC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 12:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eSZeXQQshKox3yLFUqzvKvYXcUz1++n+nWkDNgh7btU=; b=fp4v15le/+CM9Cs/Efb+Am6fBX
	1f+v3vJpvBn50hG77U5G3vFk+lHuNnllZX4FYNxNyo+kVGACQJN6wDZj6xu9pkppBV+JJNuQ6ugmn
	3nn9JbvNDhRRmdhI/GGDKdSQua1GL7qrtWgV6NAWBmgpg8WhKrNYiZPQL8c44E80zujAa7+E3F+u6
	zv6RcDAbkoHCs9UkBbuEqWbCV8ivbUeXqYx16Kvp28aPvv+NOG9HDo0PUPXVZ8J24JsPnIAxilmdB
	6GeL2d08sr9BgNu6evBfARNF5mDQSxkyM+d8pMFjjOyBZG07tG0aZvmTV0lhq5cLz6rkXRCb52qBK
	FjZlcWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfUN-00000009kfT-10xL;
	Wed, 19 Aug 2026 12:33:51 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfUK-00000009kem-1JGF;
	Wed, 19 Aug 2026 12:33:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2139320102E;
	Wed, 19 Aug 2026 14:33:46 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwfUI-002I86-04;
	Wed, 19 Aug 2026 14:33:46 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwfUH-00000000Os3-3vJg;
	Wed, 19 Aug 2026 14:33:45 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 19 Aug 2026 14:33:45 +0200
Subject: [PATCH] nvmem: rockchip-otp: convert to runtime PM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-rockchip-nvmem-pmruntime-v1-1-01f1acf80dba@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAKiihWoC/x3MQQqDMBBA0avIrDuQpCXaXqW4iHHUQRLDRKUgu
 buhy7f4/4JMwpTh01wgdHLmLVboRwN+cXEm5LEajDJWdfqNsvnVL5wwnoECpiBH3DkQdmYY1ev
 ZOqMt1DwJTfz7r799KTdsRtGoagAAAA==
X-Change-ID: 20260819-rockchip-nvmem-pmruntime-82bd0437a216
To: Srinivas Kandagatla <srini@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787142825; l=5657;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=2yti8HCNJ9vDWc5LoiWpTCzTx6WQbqJof4FNdXwCzW0=;
 b=lGUOTpDwTXUXJKBUI2UaN3PB7VrEdmGpsSo9rThy2fcy67xjmLo1t+6/BibPY9JGg008Riqi6
 Wwht32P4bNGApnaFpPWhBuTg5H3W02fo2FmdXtOw89pjO0riveA4/Oz
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_053348_520612_74E7E39A 
X-CRM114-Status: GOOD (  22.64  )
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

From: Stefan Kerkmann <s.kerkmann@pengutronix.de>

The driver enables the OTP clocks inside rockchip_otp_read() and drops
them again before returning, so the controller is only alive for the
duration of a nvmem read issued by Linux.

On RK3588 that is not sufficient. Part of the OTP array is readable only
from the secure world, and OP-TEE reads it through this same controller.
Its clocks are in the normal world's CRU and are plain gates, so an SMC
into OP-TEE hits a clock-gated controller unless Linux turns them on
first. OP-TEE cannot do that without a CRU driver of its own, which
would put both worlds on the same gate registers.

Move the clock handling into runtime PM callbacks. A consumer can then
take a DL_FLAG_PM_RUNTIME device link on the OTP and hold a reference
for as long as it needs the controller, without knowing anything about
its clock list. DEFINE_RUNTIME_DEV_PM_OPS() supplies the system sleep
callbacks too, so holding one does not keep the clocks on over suspend.

Enabling the clocks is now the callbacks' job alone, hence the dependency
on PM: with CONFIG_PM=n they never run and a read would go out to a gated
controller. Reads are otherwise unchanged.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
The driver enables the OTP clocks inside rockchip_otp_read() and drops
them again before returning, so the controller is only alive for the
duration of a nvmem read issued by Linux.

On RK3588 that is not sufficient. Part of the OTP array is readable only
from the secure world, and OP-TEE reads it through this same controller.
Its clocks are in the normal world's CRU and are plain gates, so an SMC
into OP-TEE hits a clock-gated controller unless Linux turns them on
first. OP-TEE cannot do that without a CRU driver of its own, which
would put both worlds on the same gate registers.

Move the clock handling into runtime PM callbacks. A consumer can then
take a DL_FLAG_PM_RUNTIME device link on the OTP and hold a reference
for as long as it needs the controller, without knowing anything about
its clock list. DEFINE_RUNTIME_DEV_PM_OPS() supplies the system sleep
callbacks too, so holding one does not keep the clocks on over suspend.

Enabling the clocks is now the callbacks' job alone, hence the dependency
on PM: with CONFIG_PM=n they never run and a read would go out to a gated
controller. Reads are otherwise unchanged.
---
 drivers/nvmem/Kconfig        |  1 +
 drivers/nvmem/rockchip-otp.c | 39 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 74ddbd0f79b0e..3e1a66530fdea 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -337,6 +337,7 @@ config NVMEM_ROCKCHIP_OTP
 	tristate "Rockchip OTP controller support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on HAS_IOMEM
+	depends on PM
 	help
 	  This is a simple driver to dump specified values of Rockchip SoC
 	  from OTP, such as cpu-leakage.
diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 0ec78b5e19e7d..bf1ffb46550c2 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 /* OTP Register Offsets */
 #define OTPC_SBPI_CTRL			0x0020
@@ -272,9 +273,9 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 	if (!otp->data || !otp->data->reg_read)
 		return -EINVAL;
 
-	ret = clk_bulk_prepare_enable(otp->data->num_clks, otp->clks);
+	ret = pm_runtime_resume_and_get(otp->dev);
 	if (ret < 0) {
-		dev_err(otp->dev, "failed to prepare/enable clks\n");
+		dev_err(otp->dev, "failed to resume OTP: %d\n", ret);
 		return ret;
 	}
 
@@ -306,7 +307,7 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 	}
 
 err:
-	clk_bulk_disable_unprepare(otp->data->num_clks, otp->clks);
+	pm_runtime_put(otp->dev);
 
 	return ret;
 }
@@ -457,18 +458,50 @@ static int rockchip_otp_probe(struct platform_device *pdev)
 	otp_config.priv = otp;
 	otp_config.dev = dev;
 
+	platform_set_drvdata(pdev, otp);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable runtime PM\n");
+
 	nvmem = devm_nvmem_register(dev, &otp_config);
 	if (IS_ERR(nvmem))
 		return dev_err_probe(dev, PTR_ERR(nvmem),
 				     "failed to register nvmem device\n");
+
+	return 0;
+}
+
+static int rockchip_otp_runtime_suspend(struct device *dev)
+{
+	struct rockchip_otp *otp = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(otp->data->num_clks, otp->clks);
+
 	return 0;
 }
 
+static int rockchip_otp_runtime_resume(struct device *dev)
+{
+	struct rockchip_otp *otp = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(otp->data->num_clks, otp->clks);
+	if (ret)
+		dev_err(dev, "failed to prepare/enable clks\n");
+
+	return ret;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_otp_pm_ops,
+				 rockchip_otp_runtime_suspend,
+				 rockchip_otp_runtime_resume, NULL);
+
 static struct platform_driver rockchip_otp_driver = {
 	.probe = rockchip_otp_probe,
 	.driver = {
 		.name = "rockchip-otp",
 		.of_match_table = rockchip_otp_match,
+		.pm = pm_ptr(&rockchip_otp_pm_ops),
 	},
 };
 

---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260819-rockchip-nvmem-pmruntime-82bd0437a216

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


