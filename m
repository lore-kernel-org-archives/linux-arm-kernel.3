Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14BEC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pggRQk8Zulvr6Cr863p0bNlrJVErb5Ls06+ht2GM3Yw=; b=g3iZe3VPTqEeJvCwxGx46xU5Hb
	rCGL/i90Twxq3X7y1+vBtPGTm6OKRz3VeqbnHzV8B6vG9/k5M0RWdF6UrPCtVy0Xm17rsNoPoj5La
	I0LAy3u6c3Yfo/271pQhxPnr7TBznSyYr/hccmVpQe+SLuqwCCf6Xsoo/QI84bLv66OvHCkuIuAJv
	Kygmnc3Aqd3zGGMo/sc+EvvwBFIi7j2PJsW4H/E2cpXZMhlrITGUt9SL71upPOLvCN2CGmqzZdj2P
	5/3l3UiQpw7aPkAHtocayZSRhQaVM+EoEteh5150ZH8XGYM7x+9B0xl/cgQWefpt0ZehxowMsGXD+
	VJTRY6Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kAE-00000003ICc-20PR;
	Mon, 21 Sep 2026 19:58:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kAC-00000003IC4-3EZc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:58:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37AD6601FB;
	Mon, 21 Sep 2026 19:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7791F000FF;
	Mon, 21 Sep 2026 19:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020735;
	bh=pggRQk8Zulvr6Cr863p0bNlrJVErb5Ls06+ht2GM3Yw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cr8/jTPO4ju29h7a6Bana2wcdvyB81E04rvfgbs3js4wDOpP2pD0Pyb5vUGE6iyv1
	 7N7Mf+BHtmNQ/dQc+jNyHpxnUhnBGT2YrCP/ZkEXPf/vvUytwBUZf4JpaYlXM/L22C
	 4sI5NBdRiav6nUzbdg7itH/5iLuc1F4ZoRx6qT4F+973/OG0uIKOIF6c+aSq1+v6xY
	 P7ii9/OlqTKUrsZ0cWncNQT0+tGZDO/rKffEAumSnameaPiYDr92z08CDd6ixae3yb
	 PudyK8w+Y/3kdtYKXa+VHHAioQFDjHZ07r5b5sAdWFFPj1Svk3lDFMLaXgucCC9H97
	 EowGMpegtaKCw==
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
Subject: [PATCH v1 07/17] platform/x86: apple-gmux: Switch to use
 acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:49:49 +0200
Message-ID: <2287208.Mh6RI2rZIc@rafael.j.wysocki>
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
 include/linux/apple-gmux.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
index 206d97ffda79..d7939c3a08fd 100644
--- a/include/linux/apple-gmux.h
+++ b/include/linux/apple-gmux.h
@@ -109,7 +109,7 @@ static inline bool apple_gmux_detect(struct pnp_dev *pnp_dev, enum apple_gmux_ty
 		if (!adev)
 			return false;
 
-		dev = get_device(acpi_get_first_physical_node(adev));
+		dev = acpi_bus_get_primary_device(adev);
 		acpi_dev_put(adev);
 		if (!dev)
 			return false;
-- 
2.51.0





