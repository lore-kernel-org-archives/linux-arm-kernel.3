Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA69C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIqLl2fR0Y8FnAZS32z+o+xiwBvBARRJCqimT/79qTk=; b=ez+acEPx2aau+stT5ncxGj+A5F
	VGQT97uwt/k9RxtJcyfEgVztsWays56YGvwlOPiGDO37giJVoX7QSvH5yEYuStbMRiDzrSRsn1uVW
	uo7YWhkwT5kV90ETZyuO3plGtuWKgAxxm7vKc9e5EjghNus3u/OhYinDzQNPzDX57rfE5zXSuQZ/N
	yziJRRDogpOEVdzwim/2Kj4tJFJghNLsuxJ+C7nP5IvXlng+lQ0J3C/rT4CpPbPjOZlhqbLZYJgrE
	2Ca4K85DaSTlTwzFHxTo3TlXdqJCyjP+2Z4rHll4eURnwKIqRgXgpMEhwTSwtUAltuCVyNXJcKJ/k
	+qA3HxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k8z-00000003Hei-28pJ;
	Mon, 21 Sep 2026 19:57:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k8y-00000003He0-0Nk6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:57:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 849E6601F9;
	Mon, 21 Sep 2026 19:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A461B1F000FF;
	Mon, 21 Sep 2026 19:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020659;
	bh=kIqLl2fR0Y8FnAZS32z+o+xiwBvBARRJCqimT/79qTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lRV8I/cxEYMAz9r1D9EWEMa3f2Cm02BZ36hP2eztkqtgDxPF4HdjKCutBQDwK7SyC
	 Qwk4Py/zVgM/smZIVVKBf1SaMl+mUyXF+G3QU9onmszrXe7RcaYiupUKWgHK/1AKHZ
	 caXhXf5qed0b4I8Xk55EX4WchV9ty/tTRBvcyMbY4himnpN4VfIM3AmhOJ86l6mpjY
	 NE9qm8+/5X3C4g085fpBZhy9lG73sZT+rYOlPODTSAPV0WSU1wN4qrom9OQEd25ZHz
	 1IJwLW0huDYmNFSo74v0+hHiYl5aJz9d6Tl1h7mC1ZvORpVR0ojgoM6znH8S0BSgiB
	 gjtvMse2uYc4w==
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
Subject: [PATCH v1 14/17] ASoC: amd: acp3x-es83xx: Switch to use
 acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:54:29 +0200
Message-ID: <2310746.NgBsaNRSFp@rafael.j.wysocki>
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

It also fixes a device reference counting issue that may lead to a
premature device release if devm_kzalloc() fails in acp3x_es83xx_probe().

Fixes: 54fcd9dd44b2 ("ASoC: amd: acp: Add machine driver that enables sound for systems with a ES8336 codec")
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index 3a640e652314..c522b421e1ec 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -428,7 +428,7 @@ static int acp3x_es83xx_probe(struct snd_soc_card *card)
 			return -ENXIO;
 		}
 
-		codec_dev = acpi_get_first_physical_node(adev);
+		codec_dev = acpi_bus_get_primary_device(adev);
 		acpi_dev_put(adev);
 		if (!codec_dev) {
 			dev_warn(dev, "Error cannot find codec device, will defer probe\n");
-- 
2.51.0





