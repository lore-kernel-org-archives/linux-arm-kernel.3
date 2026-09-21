Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B70DC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAVGV/5Thua1TFZOVKbuRwl/jAXk2aReC7bLxrqFtsg=; b=csWQlgxfvQ0uK4UqRCMG4mALXz
	Z2DWGTNyABuibi2O/Dag3bHr4gWTk2aoLI/FycG+MzTh4J+ItxYss3ysJ3eolVVuwmXT+rXic3dA9
	ZzM3M9/81Kbw2N+7IHnOQi0mXac2ZMy0S27K4VYvApWcSOx8wlTWvqtbB4FprySPLZYXCUH0zaYLs
	HZXahEQWxguueTTQ+wGSNvEF50k2fEwgVUK8sROk7YnEPblqjozPk9NoryH4EpaWShtfaaVp0Xu8n
	QlPf/l1UquV1S5zgLTK/aUYTzg9VQHfk5uWEck9sbkVRczpNAawDmxUv28Pb6ja8rHrI8ONR2YqYn
	H1cGzT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k8c-00000003HWX-1AZF;
	Mon, 21 Sep 2026 19:57:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k8b-00000003HW9-1vEz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:57:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 394A0436F7;
	Mon, 21 Sep 2026 19:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A3F1F000FF;
	Mon, 21 Sep 2026 19:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020637;
	bh=TAVGV/5Thua1TFZOVKbuRwl/jAXk2aReC7bLxrqFtsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IdwgEx+YGAuylT795p2nuD/OUN0WwNll7UPKO7jtrFpUGbfB2ob36smndpAzNfWsm
	 5ppEiNvfzHg0fKrFzZIb+itRMzh6qndqxQr8pFoZUbHgUPHz0VxFNgDSvfymhuRNYU
	 4mS76GiBu07fKd+7HqmbT9eMiPL/Sq2FkdG2ODfs+YPG8sONNNaJ4VZY+7T14Keboq
	 pyId8WU52CtwkRDtulypkfELySzUMCu1ynPmTUL2MNBTRPooxu4shT3wo+JwvMKNq0
	 dZkVETyhg0G4jtY6AdWpwAZNxlY9y0DxnPh4Bg3IbGwQYr1v/pYAgOR+3rKYLwDsZI
	 PFqJcTS8OUDfA==
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
Subject: [PATCH v1 16/17] ASoC: loongson: Switch to use acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:55:56 +0200
Message-ID: <2796562.BddDVKsqQX@rafael.j.wysocki>
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
 sound/soc/loongson/loongson_card.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 6422cc1703b6..9f3907278462 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -196,7 +196,6 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 	struct snd_soc_card *card = &data->snd_card;
 	const char *codec_dai_name;
 	struct acpi_device *adev;
-	struct device *phy_dev;
 	int i, ret;
 
 	/* fixup platform name based on reference node */
@@ -204,7 +203,7 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 	if (!adev)
 		return -ENOENT;
 
-	phy_dev = acpi_get_first_physical_node(adev);
+	struct device *phy_dev __free(put_device) = acpi_bus_get_primary_device(adev);
 	if (!phy_dev)
 		return -EPROBE_DEFER;
 
-- 
2.51.0





