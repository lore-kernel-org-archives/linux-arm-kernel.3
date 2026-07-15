Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209F7C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4sxxYjabBMDuNPYs/dekkLCAVyFQe7dZPVIfnECI90=; b=zAakCex4SkBOyGIX2I62HVnTS6
	IgEjTk97KXOZrv/trT6UuUVkWvSJsvoxPmlpQ0erKR31b1Z78u2zyAiDUo2C2IujH1rQNupY14kqb
	TJYCSBzi0xdZOvW5NhHq3UZQxXzHWI7IuRm1AYxRvT0kSddKJvOn6Z17MfxBRrJY1vte45C4nUPOj
	Bl+HfM8dllWCLmHL0SVOKE33S8Mf0oM7mUk5Aph+++mHIAAGAAw4bJT12tyxYnZD8Bzn3vZ+XE1M7
	TOvMWC3qDXGNkoRXJ9AEH96S+61BSPYki1IhnPyatbVZAhujV73d2mXt1oWsGhCtAkPjXqfhM3DnX
	W28Cf9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvPN-0000000EEzY-1bmE;
	Wed, 15 Jul 2026 08:56:01 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOn-0000000EERm-0WZc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:55:30 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso2936846a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105724; x=1784710524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4sxxYjabBMDuNPYs/dekkLCAVyFQe7dZPVIfnECI90=;
        b=ndhzVIc13cslwqi2Qb+Kiv6hw12XaQjAtywQX3WshdhOuP4v/Yggq1t5RYEL99/8Nl
         u8LWa8TXu38aFUZJHH3VfUsoA8GvzlBZWvGoA3UvXnVw0rt8GzUMeS1If5dYvJrCpQMs
         omIN428L3joneb1fl4iK3djPgtaDDwBBfjgfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105724; x=1784710524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4sxxYjabBMDuNPYs/dekkLCAVyFQe7dZPVIfnECI90=;
        b=WuPUXuiOxBo0K6EGqIXDb7pupbQ9lzu1r1WCV3gHb6RM9L3Jx+akDrgqN6y/Lx+lYk
         4H8cTxPxJtVORSumuXRYqE+PvvawQF/q84Fu7nzfLka6HMj3ZQxeABSW0iMClNmwk9aJ
         rE9122rw4icqThJ6T6uvUkqX7sO8G2cxp9wv1rpqrA2ywiqOdSL83h5H1ilKEhwa+ABj
         5oX3nxNae3n5HDrVkFoTZcHS9qzpT+Ug9d6Z5OOQTGy+UduvTk8QGxqz+da6+Nre80Vg
         v6hvTUbZ+pf4lTBpoWo4wa1OuCEGWwx/J37jV3/QXfC85z9LaejJjPyc2FGbDsstyaWC
         uadQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9jkIA2s5BLmb60+YviMc+F+RzPZZ4I0luuHBm2D1EXInxDP2eHBO4mapmRIdd6UGd25h8BUFDB6aIZPVtUdsQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyosq1JS0UZfptwNL7CGgTI/pJG5bqb3bVKxzQ5hcPzy+qJDIrZ
	tAr6pYO3C0XIGrNTW2ItwWOokbUo8HVr8U1M+EP940/VC2zFKzcJIK9L/4peno7ehw==
X-Gm-Gg: AfdE7ckV7803xT6rKSwquQH1DyEZ8rnjHB4OchMHTTKuFXL5B1YVmFTt3dIt9x1dwjs
	1f/AShqK9ZZHK/B+k0m109O5h4Wpf7F9ihAB8fG7lohZ2dmNIPc/YRUTwDxZ6UyFsUPkA7CGWGL
	Y5E9oVp3wUY4/800xte+qp+l3mvLSmeuv9EOx0BY8lG/sxWn9jIAVyyMMIfemqAf8i58VE9bWL2
	LQwTRUThkUVysS2JhxuE1QDe7gKeyy+44rRCFaGhpE/MwwoAK0qHugB8lab/faR9BWBZB4Gqbr/
	sHy6D119FLUrxvAE8JCdsaGd9UyAyswABgyAj91k3J/nSjX1l2TmJimNvuqE21oxf1qsCuNFvn1
	237ybEJDmTGZ27jdh7tBOPhpJQktklSXLM/obpKnWCb6T7qYOB2dGmcZ9/KhT/o938Z/nGA168y
	XvT1Xdd98ciVy6DnIGHJu4XNm3pwFm/Q5lJUlt2XbRkZ+OQL75uV+X+OjKd2xs6cxztF4yiq+72
	4oiVaDl
X-Received: by 2002:a05:6a00:12e6:b0:847:712d:19ac with SMTP id d2e1a72fcca58-84a67242621mr1719045b3a.8.1784105724146;
        Wed, 15 Jul 2026 01:55:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:23 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v5 14/16] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Wed, 15 Jul 2026 16:53:44 +0800
Message-ID: <20260715085348.3457359-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015525_210953_2FB18C10 
X-CRM114-Status: GOOD (  23.26  )
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
index 693b0d33f8cf..56e4f40e0480 100644
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
2.55.0.795.g602f6c329a-goog


