Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6148CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4L9KB743dJyhVBRNiNV8YEwpftY1J+e9ffJPm3qRbXs=; b=Ju2+tTWOgUAFkcS5cxZl6Pa7kU
	e4j0H2jop5ZeU9Cmu+2DNUeisr1YBjpJLU0do8v3xGOIG3jTxx1sFNGi9edW0TzmGZIXQxO6ERdMT
	7wxJQvYnPBWpnDuTvnL6uw5XQAAElJ08BlLO3Tr2x/px+e/5h4FCS1FhPUkx+5rP7YSxaQQPxb4LJ
	A9WhwuoK+Z4++Z3FC3WM44+t+TzjHvFYIqdTrvtRgYl35uuRwcaNxBoYcO9UcBb6JFQuuS3gdKbjR
	YMEtNlO1PPe+x/GYw42PhSupPZxqdOvDmXe0EGTsU/773tFro0H7pi6n6ns5N7jKyh7Z129HW3Mlc
	DG48E3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzJF-000000070UR-2OHJ;
	Wed, 30 Sep 2026 18:45:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzJ8-000000070QR-265L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 18:45:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA52C601FA;
	Wed, 30 Sep 2026 18:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1575F1F00898;
	Wed, 30 Sep 2026 18:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790793933;
	bh=4L9KB743dJyhVBRNiNV8YEwpftY1J+e9ffJPm3qRbXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RG1fLF31K6zig5yEi5YRjknLKdChfwUOp2jevRATPbks1co7p1huVxFGG6TvhDK+G
	 sbNzoLGi3xrD14lz9/X68Uqc4xc6dW1j+u0izKmyeNJsM5XlKaie9JYt8n9leWE2SO
	 97qzMCTfJp7GPxjzN7fw7lesKHTIX7YkgN+kAwztGNBUmZAeWVxm5vROXr0SawjKTT
	 6ob4egvQNlW6Bn0DGov74p826B/bqu5rTy12ySNIwDi9v5FgaA2saLDkJIsQ5q0+OI
	 KSSsWizGOySibRN+fB16hubKDwmpBEygTLzTUReovxGDST2C1yzPejNmJm1lGnYJzM
	 gB36thUB6B11Q==
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
Subject: [PATCH v2 3/5] ALSA: hda: cs35l41: Switch to use
 acpi_bus_get_primary_device()
Date: Wed, 30 Sep 2026 20:42:15 +0200
Message-ID: <6200303.MhkbZ0Pkbq@rafael.j.wysocki>
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
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 62296be45c55..32abb71dd401 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -1926,8 +1926,7 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	}
 
 	cs35l41->dacpi = adev;
-	struct device *physdev __free(put_device) =
-		get_device(acpi_get_first_physical_node(adev));
+	struct device *physdev __free(put_device) = acpi_bus_get_primary_device(adev);
 	if (!physdev) {
 		acpi_dev_put(adev);
 		return -ENODEV;
-- 
2.51.0





