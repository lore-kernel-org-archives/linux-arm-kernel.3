Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5103C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GX1kDtjAfCXSGF7xrHyk2v4uUNilnK+1K3CoVNBtw4A=; b=JUSOIS999ny55iY72WsyYb/FtH
	stZDEs+kkT5z90f1alumdQ6NfDQthxTGGhsVEd5+v3RVrkF84O759bxk/vN7fbw7VvfeSU6Y9uA1d
	D9+wsbUCZcVpX0adfdcQbn8hruFJwoQ2FAmlJmei+1HeXVX1HNFUgX4E2dQqazJ7iY0jlLPzz6i7F
	+Pycu+iRgzqNul+qeL+/awM+/syJNYh8P2sA00jVD9kEKeKxSU/Vmm0MRgR6+szsSbnxGac8Dkppx
	Bac/0yvc6F1sLHq96JGM6zommRxTrPbFNe8xtre29Z8TyuwBMzEG6kag9f+76RCS8jL4l4KFxHD/9
	1Fr3XAeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kAl-00000003IRd-3iQl;
	Mon, 21 Sep 2026 19:59:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kAk-00000003IQr-3O3w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:59:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8912840238;
	Mon, 21 Sep 2026 19:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542F91F000FF;
	Mon, 21 Sep 2026 19:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020770;
	bh=GX1kDtjAfCXSGF7xrHyk2v4uUNilnK+1K3CoVNBtw4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=araOXMAq3aGf5lhsHaF9EYdes13PfMxi/AKztAHU3Va9Nn/vDgBSHqo0RuqeabItb
	 oNtT8BI+9WhQK8aNHeB4p9DzopBjegRomly7sPn5r0P6tX7YLA7OEiadHOlHz1p3Po
	 0VRvp+5bka4Xj+WWdxNA/7dio0SkeoRI17P+Y0ba9o+uQWj0w05brmPZmTKxsTn9T5
	 eP2rj5gGHKTms7HdD42p0zHYEeGtpIJcstNChorLw7RXgTT55bYgqWnIG8AhDR8Yut
	 jAnt6ui6lqRaHEYMrQx5RSmAvq0KzO9sZYYAsJDB7eJ6B5lTlV3T9gsx0VW4f0eoni
	 3JhTcsw/W2k5g==
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
Subject: [PATCH v1 04/17] iommu/arm-smmu-v3: Switch to use
 acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:47:52 +0200
Message-ID: <2073406.usQuhbGJ8B@rafael.j.wysocki>
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..98f105798b89 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5307,7 +5307,7 @@ static void acpi_smmu_dsdt_probe_tegra241_cmdqv(struct acpi_iort_node *node,
 	adev = acpi_dev_get_first_match_dev("NVDA200C", uid, -1);
 	if (adev) {
 		/* Tegra241 CMDQV driver is responsible for put_device() */
-		smmu->impl_dev = get_device(acpi_get_first_physical_node(adev));
+		smmu->impl_dev = acpi_bus_get_primary_device(adev);
 		smmu->options |= ARM_SMMU_OPT_TEGRA241_CMDQV;
 		dev_info(smmu->dev, "found companion CMDQV device: %s\n",
 			 dev_name(smmu->impl_dev));
-- 
2.51.0





