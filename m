Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F070DC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=go+HK5V8dXGRhi+GpzpcFcbkmCcxgz1J0eAaEUWZhfc=; b=1cyZm46Jeu85XbZlKlIYo/Gz+4
	VP7HaiRvbiA4gfQd1wYfDOadW5KCf/QC1g9T3KwtA7lX30jWlcI6K1IEB80Buxj1vA2Q0uv59Fjow
	Umpncfeh8/Ji/I7EBxfACPbYXq9Tc39bZGLXWpdZQQ6l2GzSQqKsauGo8+FixGMczO0By7dv3DKTG
	uA4NSmrzyFiIN8M3axw62vK/65DQUx045Uifna6vmTo1J8DWYVH7Y6gnel6ws9ghsg87sKggXiuVc
	tpQt+Fbrulmdi75d7iwLaiuFHg9JRizNeP1RT6nFxYJLNHrpwczG0Pv89Zjt0S88nXelFenA4lI6H
	BEsbD4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k8p-00000003Hah-1bck;
	Mon, 21 Sep 2026 19:57:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k8n-00000003HZt-1Lth
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:57:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DFCE60008;
	Mon, 21 Sep 2026 19:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A071F000FF;
	Mon, 21 Sep 2026 19:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020648;
	bh=go+HK5V8dXGRhi+GpzpcFcbkmCcxgz1J0eAaEUWZhfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eBPbGqTSwksrjwkr4sxg4GHe82m+5pK2JSUOLuofQeoEN7JhyzubEqijBqEtw46TS
	 bPoTnDlA57zedfb5Z7p+fWJn7DwaDW7OzQfH2apBiwD+eUYWNXxyHOnIY+jjirXYET
	 9bkk2F8LTszcnZO5VWDUCrXVO/ZPSJWnr0ZkRY6XhOH+eYGqFn5ztxBShSHxgARBMC
	 x0xsF26npySnRmgjxsapwtfTr+nXKuTV2jBcagbONYfI5YOO3x6q9ihurNpOIbyP7c
	 q7G0Yw1nH6sPJ8us29TpeYvn/O2n4pM9zlx/iG2wcGTkl/Bro+ideclJNV2DUEJkd/
	 kRm35X8DqBfDQ==
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
Subject: [PATCH v1 15/17] ASoC: intel: boards: Switch to use
 acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:55:15 +0200
Message-ID: <15844908.tv2OnDr8pf@rafael.j.wysocki>
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
 sound/soc/intel/boards/bytcht_es8316.c     | 4 ++--
 sound/soc/intel/boards/bytcr_rt5640.c      | 4 ++--
 sound/soc/intel/boards/bytcr_rt5651.c      | 4 ++--
 sound/soc/intel/boards/cht_bsw_rt5645.c    | 5 ++---
 sound/soc/intel/boards/sof_cirrus_common.c | 2 +-
 sound/soc/intel/boards/sof_es8336.c        | 4 ++--
 6 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index ea387dc74273..4d8d1d176a49 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -601,11 +601,11 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	codec_dev = acpi_get_first_physical_node(adev);
+	codec_dev = acpi_bus_get_primary_device(adev);
 	acpi_dev_put(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
-	priv->codec_dev = get_device(codec_dev);
+	priv->codec_dev = codec_dev;
 
 	/* override platform name, if required */
 	byt_cht_es8316_card.dev = dev;
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 40da3eea5fa7..c84b9a0fe65a 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1744,11 +1744,11 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	codec_dev = acpi_get_first_physical_node(adev);
+	codec_dev = acpi_bus_get_primary_device(adev);
 	acpi_dev_put(adev);
 
 	if (codec_dev) {
-		priv->codec_dev = get_device(codec_dev);
+		priv->codec_dev = codec_dev;
 	} else {
 		/*
 		 * Special case for Android tablets where the codec i2c_client
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 62cb4856c797..a0ed56d285bc 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -943,11 +943,11 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	codec_dev = acpi_get_first_physical_node(adev);
+	codec_dev = acpi_bus_get_primary_device(adev);
 	acpi_dev_put(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
-	priv->codec_dev = get_device(codec_dev);
+	priv->codec_dev = codec_dev;
 
 	/*
 	 * swap SSP0 if bytcr is detected
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 249be121be15..4f20928a3604 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -529,7 +529,6 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	const char *platform_name;
 	struct cht_mc_private *drv;
 	struct acpi_device *adev;
-	struct device *codec_dev;
 	bool sof_parent;
 	bool found = false;
 	bool is_bytcr = false;
@@ -583,8 +582,8 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	/* acpi_get_first_physical_node() returns a borrowed ref, no need to deref */
-	codec_dev = acpi_get_first_physical_node(adev);
+	struct device *codec_dev __free(put_device) = acpi_bus_get_primary_device(adev);
+
 	acpi_dev_put(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
index 88fc6cb2bfd4..a4ecb1f9a615 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.c
+++ b/sound/soc/intel/boards/sof_cirrus_common.c
@@ -168,7 +168,7 @@ static int cs35l41_compute_codec_conf(void)
 				 cs35l41_name_prefixes[uid]);
 			continue;
 		}
-		physdev = get_device(acpi_get_first_physical_node(adev));
+		physdev = acpi_bus_get_primary_device(adev);
 		acpi_dev_put(adev);
 		if (!physdev) {
 			pr_devel("Cannot find physical node for HID %s UID %u (%s)\n", CS35L41_HID,
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 9b016136c639..3c0d7155f059 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -693,11 +693,11 @@ static int sof_es8336_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	codec_dev = acpi_get_first_physical_node(adev);
+	codec_dev = acpi_bus_get_primary_device(adev);
 	acpi_dev_put(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
-	priv->codec_dev = get_device(codec_dev);
+	priv->codec_dev = codec_dev;
 
 	ret = snd_soc_fixup_dai_links_platform_name(&sof_es8336_card,
 						    mach->mach_params.platform);
-- 
2.51.0





