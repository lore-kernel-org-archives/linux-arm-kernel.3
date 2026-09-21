Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E71C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHcB4o2w3Zdn0ye43c8OGi6J8wemapWUr6CsKkoAjrE=; b=DOWi4+KRBnXP5KgWfYvrJGx0JG
	GWTk4YSDfocHRJ8gUyA/F8opBZNJIP1MSH4YeMvsnCoxd3TD/tGSxWAoBbRwEobzDsto9k88Gk+mc
	uQUeqfQX208MSCD+4HR3Gu5mOHGjj+ReiMMrDgtl8jjnxkuMHK/ej6/zzST01UAwzPBDwYyojkGDM
	dOpS2g4Cs1bYQ/sVwznDZSMonCWgvvm+vIPojhbge2iM8XZNxt45ASmnU7hX2eCPO+P4kp+7ulLJL
	7duQ4aZMmf0wZCsoMMq0MTR8oVt98yLRJvwIADHZ6D9q1Bf4kMuWojgfv7XiCImnEOuOY3KFQN1Sn
	sOMbxkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k9g-00000003Hyp-0Hsm;
	Mon, 21 Sep 2026 19:58:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k9f-00000003HyZ-28gP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:58:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45DEB42A00;
	Mon, 21 Sep 2026 19:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EAD1F000FF;
	Mon, 21 Sep 2026 19:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020703;
	bh=QHcB4o2w3Zdn0ye43c8OGi6J8wemapWUr6CsKkoAjrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SEe5NuA3oV+2rlY4NDNTgzgN+EhUtl/RhRX7W82zXhVGfmIVYdvu00kG46saiPclP
	 pNFVVc/p19ABBaHJ/C4VhAL9jnfUIpjaov1ujZU+I/YuEGj/oke7/muKpYt5aUCLRZ
	 MIPRQ9EhPcSmVSsMeha3pVlc+EjSi8K60gChy7K/69/KzLr8HH+Vh/iCP61PTsHRf0
	 JlnqF+sfNF+woCNll0zPPxyyyxcae6yot0V6v5gW6cjtKL3cs5u1wRT99jm4v0VQGH
	 x2mw9C8Lo6GgvKys4LOX9loRnSPyB8soJC1eBHy+snWuv/LTrqASg5EaywNPrz2TEF
	 Vtk7Xtu50mW7g==
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
Subject: [PATCH v1 10/17] ALSA: hda: cs35l41: Switch to use
 acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:51:44 +0200
Message-ID: <2290124.Icojqenx9y@rafael.j.wysocki>
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





