Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71A8C982F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJ0j+leg3y+Dpt5s4ny9DBNrD2A1KCj7Cpe/XpV27PM=; b=Ppzu3DH+x2kFZbFJt024B1I6+l
	bgWB9aCUjsNRARZ/ZMupQdsS9K2y2P/9J02evCbDdlvKjhKivm16NE3xjevevJEkABj46bCC+nDRG
	nazNzDexWhO31REzAcdXEQSK/BdYwHXs5V7XMkU/5+XQ4DKyRMnm5xGLa5RKOY3XraGb8QS8D6rrY
	8shr2EffvyaWOIVDpl/nIIENq37777VCIFJxCJ7KXOrGfJBsbBHpvi7CtssaSC102R93ntxJ/CzeH
	rdRLmFZcYODqIsAT6sqgtaKeAh7nHb/R3SpDfRynkY8hH0Lgb/it1Q2OarhgFxOEDjeLT0yzSRJN3
	WeujJaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kAa-00000003IMW-3FoS;
	Mon, 21 Sep 2026 19:59:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kAY-00000003ILN-3jm6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:59:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 55E7560220;
	Mon, 21 Sep 2026 19:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1FE1F00893;
	Mon, 21 Sep 2026 19:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020758;
	bh=OJ0j+leg3y+Dpt5s4ny9DBNrD2A1KCj7Cpe/XpV27PM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LJMUchJq4XPhBwwniY+m7JZkvTDeHbUY5uyTkX0G05IqLNA6EH3+lQHO0F3undOJe
	 Em9rOFh9y54stRVtWOT9ltk7rw4wzV5ISTEuKXzmn1+B53EUPrGDanCqq+wc3EY7C4
	 JSiBlogkHgPTiFOFSqFOUxrtQIxXt9Hop5CyFNS8/BJgDIlp5TUHIKYQY2BuOiA6hc
	 XwpOSpzVpr2LaJjGR7MSoMH4SpOYbaoCPdtbSvIv69G5xETyO/2hJaVv8rul5kt74O
	 v/UKkHf0XTi+FrYAvK9+UHlUO6QImrQmOaU0XspiAZGlafld7GrXFInYxK88sSND0H
	 d8kukbBC/zKGg==
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
Subject: [PATCH v1 05/17] platform/x86: yogabook: Switch to use
 acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:48:30 +0200
Message-ID: <1973238.CQOukoFCf9@rafael.j.wysocki>
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
 drivers/platform/x86/lenovo/yogabook.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yogabook.c b/drivers/platform/x86/lenovo/yogabook.c
index 1a4b2ab1f35d..8a91d440724b 100644
--- a/drivers/platform/x86/lenovo/yogabook.c
+++ b/drivers/platform/x86/lenovo/yogabook.c
@@ -353,13 +353,13 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
 		goto error_put_devs;
 	}
 
-	data->kbd_dev = get_device(acpi_get_first_physical_node(data->kbd_adev));
+	data->kbd_dev = acpi_bus_get_primary_device(data->kbd_adev);
 	if (!data->kbd_dev || !data->kbd_dev->driver) {
 		r = -EPROBE_DEFER;
 		goto error_put_devs;
 	}
 
-	data->dig_dev = get_device(acpi_get_first_physical_node(data->dig_adev));
+	data->dig_dev = acpi_bus_get_primary_device(data->dig_adev);
 	if (!data->dig_dev || !data->dig_dev->driver) {
 		r = -EPROBE_DEFER;
 		goto error_put_devs;
-- 
2.51.0





