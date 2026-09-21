Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A69EC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJ8N+mrV6u3cfqGcoiPMbpRTWJEEOHp2lUrNnbxW06A=; b=DbU9J972ZTHJR6s9R8i80ElBED
	wmFdnAwIQBgDtVRUgKk43s+9M9u53WOj+kjcFoLvgmascmMaH7Us6/JkVzODvLAXAnMDRdSerhuuc
	JecAZ01D7z4SagBZ65Z0pLn+fZDncyDQDElE0qKVy3SMxP777wFZkcupBnNiL/RLoRgxCv8CryY6Q
	fexeeHxJ6aSE3vo0v3qCYnhyqT/iBWbw6M6+3t0lQ4FebKwBXOVx0PeqllEsjY4FXrQzjLfkllZXT
	jMWEBHZgbb1AagZsxdZp8YdVZp0ZlyTiSoIs37zLNchqKSBDwady3JbKMgsNffccPCIOnocF+OOKk
	trhZigMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kA3-00000003I7F-1Etf;
	Mon, 21 Sep 2026 19:58:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kA1-00000003I6g-38cD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:58:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30B8B42A00;
	Mon, 21 Sep 2026 19:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6F91F00893;
	Mon, 21 Sep 2026 19:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020725;
	bh=WJ8N+mrV6u3cfqGcoiPMbpRTWJEEOHp2lUrNnbxW06A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LD6W2WyzOksR0uOR2WulOxOo+3440yB3T3ZMsOTHOPwG4m1pEyPQOCOmNph0T4LIU
	 Nod+IxbhEmbhGxA5ARKKzMEa+6U+beez7PC0zbeMF7v1JKQ1cNeyPncwMnfZnqnLtt
	 xZ5BOp9K/5Pf/Ee55DqyWUNEekzivJ11F9niaNBC7trGJ6YqV3TipSMREUgAhk3jQm
	 roY8A7XHayg9rtMl7ADBJpfS1AuOSN1bHCjgttaIS1y3nbEW1WMa19VXzEUahCNLBJ
	 OLkpMSNuYCxAss9qlQX4y38Z8UVv48a18jH5UlbHiUhTI11KEXLou6o6HuzlAyDgF3
	 fUNb1sQPq2V4A==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: [PATCH v1 08/17] platform/x86: x86-android-tablets: Use
 acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:50:28 +0200
Message-ID: <3912360.MHq7AAxBmi@rafael.j.wysocki>
Organization: Linux Kernel Development - Intel
In-Reply-To: <7995179.EvYhyI6sBW@rafael.j.wysocki>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Replace acpi_get_first_physical_node() that is slated for removal
with acpi_bus_get_primary_device() that takes a reference to the
device it is about to return.

This addresses a potential use-after-free that may occur if the
device returned by acpi_get_first_physical_node() is removed right
after dropping its ACPI companion's physical_node_lock in that
function.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index cfff7f5eac5d..2c262f117235 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -390,7 +390,6 @@ static int gpio_secondary_fwnode_init(struct device *parent,
 {
 	const struct software_node *const *swnode;
 	struct fwnode_handle *fwnode;
-	struct device *phys_dev;
 	int ret;
 
 	if (!node_group)
@@ -418,7 +417,8 @@ static int gpio_secondary_fwnode_init(struct device *parent,
 		if (WARN_ON(!fwnode))
 			return -ENOENT;
 
-		phys_dev = acpi_get_first_physical_node(to_acpi_device(dev));
+		struct device *phys_dev __free(put_device) =
+				acpi_bus_get_primary_device(to_acpi_device(dev));
 		if (!phys_dev)
 			return dev_err_probe(parent, -ENODEV,
 					     "No physical device for ACPI GPIO dev: %pfwP\n",
-- 
2.51.0





