Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB043C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4tfQQNoh1s0SuFBn8g/TxJGhMe3ZOSgNRY3dXc6AJk=; b=R2eaXGFBFcB+21dwLbbC5hnuLX
	xBcq63GsePvy9K3XjtyxBPeczs23GG9mdL5cv6zQeECmEEsTq+/dbLGE9le29xIw11i2KbUBaCFtF
	nvHq5tETQRGbB/7oAbtxdDoGlO+aOTRRN9wEIlipdcqGy8CzkuyqwoAAkSz5onnBlh6dl9SJ8h0Wu
	UC2b1iBdPD42nXF3srroeNLC+BzrYVZM/AHgHNeSSe4wTqbZLksttqYDzM4BbiqVWI5p/QwcNEDhx
	shbFwJHzaEGrD/nAlB622XbiVFLAOwYrnGO1wytul4nVedgwxZwtVJtJymagdTdltbxb73WMZZt4j
	KI58LRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k9K-00000003Hom-3ePv;
	Mon, 21 Sep 2026 19:58:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k9J-00000003Hnn-3iet
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:58:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5567B601F0;
	Mon, 21 Sep 2026 19:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763B91F000FF;
	Mon, 21 Sep 2026 19:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020681;
	bh=n4tfQQNoh1s0SuFBn8g/TxJGhMe3ZOSgNRY3dXc6AJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ci0EfexEzpXudF6A1c0TRtaS3ijsUSJzv01W1MLD2bmATKrk4YDSRg9uokuQTkYan
	 urzbYyusNB+l570E5twrDA1odMxPLzuEshNs6shFYh7z7YT1HLPBhUZTBB8UUz/NDp
	 DrCb4KDhJ8OUEOs7U+IbTOs/3KI0DnpxKsWjXdModl6jPM22pi7RlmvW7WL6q+E+Tu
	 iS657fJiAxB7i8oRzIHoC0Vm/Or2EPgEm/yHGYZBleqSlxQybJDLd7bVQSOJfd0nUt
	 Zw4WOcr1rc00S7qHzQL747+8FZYX4Y5yDELZISU2iLc8BNhPOIj3b1lrJDbfR0Vyyo
	 W7Q5xsASeT4Ew==
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
Subject: [PATCH v1 12/17] ALSA: hda: tas2781: Switch to use
 acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:53:12 +0200
Message-ID: <895014215.0ifERbkFSE@rafael.j.wysocki>
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
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 3 +--
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 5e5f46c9fb6b..161ca965c63e 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -100,8 +100,7 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 		return -ENODEV;
 	}
 
-	struct device *physdev __free(put_device) =
-		get_device(acpi_get_first_physical_node(adev));
+	struct device *physdev __free(put_device) = acpi_bus_get_primary_device(adev);
 	ret = acpi_dev_get_resources(adev, &resources, tas2781_get_i2c_res, p);
 	if (ret < 0) {
 		dev_err(p->dev, "Failed to get ACPI resource.\n");
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index da71b57a26ee..f3ba7132d2b8 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -341,8 +341,7 @@ static int tas2781_read_acpi(struct tas2781_hda *tas_hda,
 
 	strscpy(p->dev_name, hid, sizeof(p->dev_name));
 
-	struct device *physdev __free(put_device) =
-		get_device(acpi_get_first_physical_node(adev));
+	struct device *physdev __free(put_device) = acpi_bus_get_primary_device(adev);
 	acpi_dev_put(adev);
 	if (!physdev)
 		return -ENODEV;
-- 
2.51.0





