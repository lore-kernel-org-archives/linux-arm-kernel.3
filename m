Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDB3CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIo75/ZA2hb+/w3b7P/tnJ5SIXlHwF5f78Uc4xRp+f0=; b=h5llH8rwHHfjApcEion+E5jGb6
	lfOJp5olFUzlRi5sG6Cmd9doGKZuP1RAmLpP8f18HQav+AKfZtL3pDTQ/m6/wNSseuV17EAZqgcxA
	c+kzyRNfhlq+1pamV8WFn3MZEpcppQvP3G9jw0n22m15pbZ49qAE3Ep2IuSk8NgOCk9SAo8hPyR+Q
	NpMmAP1NWaBjVcfU0oKrvHder90OStcwdQon1M0WpYcGkflmux0FcGv82WNLWMTiXWJLGeehVqWo9
	DDIW8vJCSDn/EOGFHfOUoah18BXgVdhwMwDi76y2xJ6w6qcr0PfhuppW/u4gvrGK1N/ewwnwJkQw2
	iHAFuKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzJ6-000000070PX-1yGc;
	Wed, 30 Sep 2026 18:45:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzJ1-000000070O1-11YV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 18:45:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0319841B2C;
	Wed, 30 Sep 2026 18:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375A31F0089B;
	Wed, 30 Sep 2026 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790793926;
	bh=fIo75/ZA2hb+/w3b7P/tnJ5SIXlHwF5f78Uc4xRp+f0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AmEbGLAUyUsgx7rwtTy2/gQiIBpEUL0KnmdkdTDXgNbaQEPv1IFdcd3vHYzvSBbPv
	 TCI50eYEQSO4uTA4b4w0EJaSZ8uM3f38Owwbj9quB2NvbGPnpEiUk9tR96DTcCa+Ka
	 qeI6qqAUjxUu0JR6nVkXkuHo3QG2pwzRLAXFDyKSaoO4R/yHl4982hC2hVhp851ReI
	 xH1mk20PuZXfQMtlMIorGwok616c7c993aAIiNp4fZWpJg/5pL/0VGJthdg9ptvCrD
	 9UGcImRb2H6Xqjqc0uid32emjNsvLZ3Rr1JmDfh0GAU2UatLWLd4xb+fAQ6+Pg7bu/
	 U6kUKNJt4dImw==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>, linux-sound@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 4/5] ALSA: hda: tas2781: Switch to use
 acpi_bus_get_primary_device()
Date: Wed, 30 Sep 2026 20:42:36 +0200
Message-ID: <8782185.NyiUUSuA9g@rafael.j.wysocki>
Organization: Linux Kernel Development - Intel
In-Reply-To: <4766532.LvFx2qVVIh@rafael.j.wysocki>
References: <4766532.LvFx2qVVIh@rafael.j.wysocki>
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

This patch depends on new material in linux-next.

If you maintain the code updated by it, please consider ACKing it, so I can
pick it up and remove the problematic API replaced by it during the 7.4
merge window.

In the absence of feedback, it will be resent again when 7.4-rc1 is out.

Thanks!

v1 -> v2: No changes

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





