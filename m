Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454E8C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zziC+imJfNqpibEo8R3DN11n7Ds3Jxw6/OGyIDHBdk=; b=lacAdNBuQPuPjyD9bGGs2GLa12
	Ch3Il8PuGamRzHHm/o+RN1fNhE/rzg0ywnc+rbcGOZ849CzIm33EzVgzjQ/dgbiW86M/5IbfKqogR
	qkjFQJUC4ZwJjLy7VoTcM9GeCxXnmmQ0cKWUhcK0hpHfOaKhBhh8BuxsNraGdc4wNrQeKmCnheTxn
	vZVaupqbCbMxsjX6KqwmrpCCTCB0vjEby69RYNDkHpOyw73lHw1EqSlHXRC2y5c7jQqHlVDoyX1qG
	ORly68z9ILzRTTS3pZhItlrE34Qs5sz7w7SCfs4jl7VOtvyBg29vdZOpKOd9bYpuZHS974qZ77oly
	RuOgT66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kZI-00000008evh-1qCR;
	Wed, 16 Sep 2026 08:00:36 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYF-00000008eJz-3hMg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:33 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso464595a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545571; x=1790150371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zziC+imJfNqpibEo8R3DN11n7Ds3Jxw6/OGyIDHBdk=;
        b=TEPpd+kFFSUYgWUpxVKgg38Vf+Lr52jTAi7uIJJlFen/sYRyH2sm4wqqDmlXj6xW4V
         Z1AbPyNiHfcNxkhDFv/EhxRz51PnpgPyU9zm+xllVzdOC6xEwJ2dd76R4C45+dfP3yZG
         nHldl47T6ATjXyZ/rR/EUIgKfllUc03SbjcAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545571; x=1790150371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zziC+imJfNqpibEo8R3DN11n7Ds3Jxw6/OGyIDHBdk=;
        b=I/jGoNPbFmhWqmIBjAxx3ZMUwYdKBOsR20RnBsy9HAA3T6p60iBQ5hIpiQYSfUrY1T
         iUSgERwFzuQRUqaP1OIYJRkkCnOYoeCTfYbyBlNSOrzTCmyX0bycWUYjzoFu/Yr+S5I+
         SOdPdTBc4AXLHBo6NkQqNZ91R9cO07CJGFaT5JbEiT01mB/2p4s70d2lSp3K3yjhAUgp
         FW4A1mhfOEFfEeGgmd0LXehpRFbBhK9ZOmEhAH1d95Bq7Xc25nEjOvfpF0nS0RoxxUmH
         ufEd3acmeyOdYpCUU81MP0esxyiRF28nYZoXvdmlZRXuZLQRn2QSInsgdYXBwlv65azA
         0H1w==
X-Forwarded-Encrypted: i=1; AKwUvByArWOrX7t7OhCN9d9sHziSPFY+oMFt3/itmkr7B1bhxezjof08CKpmHRWz37L2gzc0chQdPbR9o9xo6kod3vd4@lists.infradead.org
X-Gm-Message-State: AFuF++mZNUc0yfLPcJ4YsTN8/ziNiuMsCfU3w/qMQVxnp8pPZOy8Skz6
	AyfKnWVLW5IWQdfHi3Y2YS8FNVY3hVLNM78KwwGpV9Qx47YGOG9VpCKJBglb4fj1pA==
X-Gm-Gg: AYBFou3knLow/5b27HKhUMl01MJAk4mWuo++EhlnzM512qoIfhAuMJhWUgTVYOIBXAy
	patLCULsPeCfqa7AQw30Fm6jzLbzi/Il/+jh0L8nXvifEJSFQ5AG3PpCMsNzZFs9RekAcSPNR0Q
	/rz5j/IrGoaW89CBKS7CpzvJcdKhLaFVgq/hvIVdRHywMrIc+uP11Tv3gKeE+dTQq96KY04wcet
	M2jo1nHWfxAqT6Mw49g7jLfKr2RjhHfqLADr2CyPLcylQEZnV8WSoJzYQfXTFGC+UaRySTEPmQ7
	Mju2qjprEwX2UX47I4lERW56iI9y/C+sWee8N+t8MX98hn9BM8GN2lOYXAWMkCbRk8W50qMITxs
	cBeBp4+hi4/X88Ueishu5oQbme4Ar378TvB1JaCqI+78ZYyeFdiXrDgnLYdzfRgw5to8K/8jQG5
	cccTjr0YBWgHeVhU58/uoYbGHjmofPrXSmkEgmiF+OxVtQA9DD2tsmjXVaKB7HFOrQCcg4+O73V
	QTpVMaSf4VkCL+9ltvvxsPqhUZgclaZ/LK33SpP6fc48PRNdE71vc3PDg==
X-Received: by 2002:a17:90b:3c07:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39e1e2e2326mr4169180a91.7.1789545571154;
        Wed, 16 Sep 2026 00:59:31 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 13/15] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Wed, 16 Sep 2026 15:57:39 +0800
Message-ID: <20260916075745.3549953-14-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_005931_939485_F4F25F64 
X-CRM114-Status: GOOD (  23.48  )
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

Some UART / serdev based Bluetooth drivers need to be able to reset the
hardware during initialization or recovery. This is not possible with
the current power sequencing API if a unit is shared between USB and
UART interfaces.

For now, split the Bluetooth unit into two, one for each interface.
This allows either interface to independently toggle the power, with
the last action prevailing, thereby unbreaking the Qualcomm Bluetooth
serdev driver. This is also needed for the Realtek Bluetooth serdev
driver (hci_h5).

Having independent control from either interface unfortunately means
that userspace is able to shut down the controller from sysfs using
the USB port's "disable" setting without the serdev driver knowing
about it. On the USB side, independent control is also desired, as it
allows the USB core to power cycle the port/device during faults, and
for userspace to initiate reset and recovery using the aforementioned
"disable" setting. However when USB is used, a serdev device is not
created, and there is no conflicting usage, which allows the power
sequencing to work even without the split unit.

Suggested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- New patch

This patch is _not_ squashed into the previous to provide clear context
on the change, and the less than perfect nature of it.

I think what we need in this case is some sort of lockout. The serdev
consumer would want "exclusive" access, locking out the USB consumer,
which can tolerate "shared" access.

Something similar would be needed for the WiFi if we ever add support
for SDIO for toggling the state of W_DISABLE#1. At least the SDIO and
PCIe reset signals are separate.
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 499cfd291a39..357aedd2a17f 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -83,8 +83,22 @@ static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
-	.name = "bt-enable",
+/*
+ * XXX There are two Bluetooth units to allow either one to be able to power
+ * off and thus reset the controller. In practice only one of the interfaces
+ * is used, so there is no conflict. However userspace could power off the
+ * USB unit by disabling the associated USB port, without the UART unit or
+ * its consumer ever knowing.
+ */
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_uart_unit_data = {
+	.name = "bt-uart-enable",
+	.deps = pwrseq_pcie_m2_unit_deps,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
+};
+
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_usb_unit_data = {
+	.name = "bt-usb-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
 	.enable = pwrseq_pci_m2_e_bt_enable,
 	.disable = pwrseq_pci_m2_e_bt_disable,
@@ -130,13 +144,13 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_uart_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
 	.name = "usb",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_usb_unit_data,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
-- 
2.55.0.1032.g73a4cd73de-goog


