Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601CAC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Gc84nshf57F/O9JNJXpRgG24Hn8rEipfBZo0XmFWJ4=; b=ZnG9HViDvOmX3sbBC/P6VJevSL
	mWYD9ESFF3zz5SP7EkpFPq1RZIEhtdQAHKa+Pe36sJiFzJoO0Ce1pBgC1x0b9RJpnk6Wd6uya/A8h
	sPXVZmKXa2RAk6Qs5OLX6Zd8eqazGC3lTKdU5fIBlzFuROqL+ZVRRlX+GAm+0yYo4u55EE0nWp1re
	RCS7t0kvbzNwMLjOfjnbP1vvsLVfHGB0qZDdfo4jB0NceC/xvkVzhstQNU1jHOi+07biolqvWfkvY
	xmLaH7j/+POG6hfoHOOkbt9RdVJlqFq4RupiQTCY4DvW8iYz1J4x0637x400mzUnIdPsMv1egJHlQ
	xNp0GKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kAy-00000003IYA-0aVL;
	Mon, 21 Sep 2026 19:59:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kAw-00000003IWs-0WrV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:59:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90DC960142;
	Mon, 21 Sep 2026 19:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A611F00898;
	Mon, 21 Sep 2026 19:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020781;
	bh=4Gc84nshf57F/O9JNJXpRgG24Hn8rEipfBZo0XmFWJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GBNHRgIVmDV+JRar2AXK7q9NmtoXmMqVqeOQ+Zmz9MRMTqdjM9OinEXErDLc9F07D
	 Cgo204193T83ZK7ugq6VrDNajh35492FawZ7ZxWHDspmr/t1VjVdxyradYr9+XtmLl
	 Xu+tS6qUixcP5R4eta4rFx4wD22P8BfZXjQ6Th3bNLHe37mgq174PB0Nuz0bosGkwH
	 qrIOsB6jCvijrcIF8pN7h+OqhoCPORhqjTHwk7TBKXbVwZgDljCqXZZV7x04Ni69Oe
	 hMu+sWlpcG703QK9FbdiYYTAHgGnYL0XvwabJTfEkKkZHbt+Martqgvfr7sEtN/boP
	 pLbb0Xy0CeBKg==
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
Subject: [PATCH v1 03/17] efi/dev-path-parser: Switch to use
 acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:47:15 +0200
Message-ID: <1870567.VLH7GnMWUR@rafael.j.wysocki>
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
 drivers/firmware/efi/dev-path-parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/dev-path-parser.c b/drivers/firmware/efi/dev-path-parser.c
index 13ea141c0def..e0f864cbaa8c 100644
--- a/drivers/firmware/efi/dev-path-parser.c
+++ b/drivers/firmware/efi/dev-path-parser.c
@@ -37,9 +37,9 @@ static long __init parse_acpi_path(const struct efi_dev_path *node,
 	if (!adev)
 		return -ENODEV;
 
-	phys_dev = acpi_get_first_physical_node(adev);
+	phys_dev = acpi_bus_get_primary_device(adev);
 	if (phys_dev) {
-		*child = get_device(phys_dev);
+		*child = phys_dev;
 		acpi_dev_put(adev);
 	} else
 		*child = &adev->dev;
-- 
2.51.0





