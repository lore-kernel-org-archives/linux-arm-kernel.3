Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED831C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UjZ3rrjP9HMf//Eca0cD5Hxt1wv6E9n3d8DQuHis1c=; b=voNJ8IY2kvHq1j6wEH5tfy4Dyd
	qWZoQToBZQNWuIJmrL5Yvsr8yKN41KkbcB2ff2x1zUlB/obtI1wonXQE0Wq3G/bdd0qZZRsCALuFs
	1F08XIBpOObZCFbNLlxZxVPtdg4nY6SOiZqB1kXjmCNhiuAYSYM3mPrFb0O37tRkcNW6XGMg/bFNY
	h2fQxgH8xnXNhCaaMWnfK/VIZdGN2vHaJOHzsFIxL0yq+qBDB/cD9Tp3HLGRU99Zfe+3RmmBdbwVH
	fdJ9h963pPu0XtaUe1xI0BKuYucRjRkl7JFNGRcy5TrfttlJiBKzotXpPKHsObXyY8gw3u+oJk2/q
	fxmNmwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kB9-00000003Id1-1CLZ;
	Mon, 21 Sep 2026 19:59:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kB7-00000003IcQ-0a3b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:59:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EEE560142;
	Mon, 21 Sep 2026 19:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7921F00893;
	Mon, 21 Sep 2026 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020792;
	bh=6UjZ3rrjP9HMf//Eca0cD5Hxt1wv6E9n3d8DQuHis1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e/QZ44QoHkWQu3p7iBCIv9/7xn/8Du5V/nI1YenLVuShu29wR4TbMO/TFCpNmUIfQ
	 sA/NDjrZJJBqUNm+6p4NmRZwdQ3552p9YJguqEBwAcbguFjmUKFsUCuvLDsDjkrtBW
	 5aP3kEn7oAeirKrSev65TnRdlMpFzbJiDHemXNlnoc8HYUVxHa3TOGTYFzoCs37Cvd
	 FYn3/bLwkN4RcAmPSXWeCctarbfkKqlDcwehqs+0coUMpmTtd4BZAylrC+y0pehGXM
	 FGUaBREvbn3E5lZn3jfvOvrZpzH0LCVNWt4HhB6npAdLHRzoq1+c61E9/3215+MUFX
	 WAa9B+8VFsrVw==
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
Subject: [PATCH v1 02/17] ACPI: amba: Switch to use acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:46:37 +0200
Message-ID: <3362405.5fSG56mABF@rafael.j.wysocki>
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
 drivers/acpi/arm64/amba.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
index 1350083bce5f..7ee431d9464a 100644
--- a/drivers/acpi/arm64/amba.c
+++ b/drivers/acpi/arm64/amba.c
@@ -87,11 +87,12 @@ static int amba_handler_attach(struct acpi_device *adev,
 	 * the amba device we are about to create.
 	 */
 	if (parent)
-		dev->dev.parent = acpi_get_first_physical_node(parent);
+		dev->dev.parent = acpi_bus_get_primary_device(parent);
 
 	device_set_node(&dev->dev, acpi_fwnode_handle(adev));
 
 	ret = amba_device_add(dev, &iomem_resource);
+	put_device(dev->dev.parent);
 	if (ret) {
 		dev_err(&adev->dev, "%s(): amba_device_add() failed (%d)\n",
 		       __func__, ret);
-- 
2.51.0





