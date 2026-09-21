Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C131C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eN+0DjPC2PIBDvK9KcouX9O0xXht3SUEsMqJsvIURUo=; b=Iyqyo9ijPFdJJ478/LNk8hHrqb
	inInCvA4zPdO6iKQAhhdv1OG+b66XJoc0wcnc/H9qAkCnxETDJFCngezayLrM1pdObb0KQoNeWTxw
	A9CE1PALsT28kfrA7zFwK6oayYY692uLEjyqr2gaiInmpPF+ijTGpdhdMC7ncWl7NsIDx+pgdcvLK
	0kzs85EB2bjh3jUhJ6hA/mbFkpUqC0WL9ER+mTfHJJUn4cMxpkKsuPn5sHVXRg/NVPyNJ0F70xoBL
	Sa4fPKCr1bl9lmeW+ShkJoUJuOmgqfoDdLo49pSAj76e0tNTBm6B2C9uyhw/W6Vxf2+CXkTkPDKsF
	iWDfGgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k9s-00000003I2q-0hbL;
	Mon, 21 Sep 2026 19:58:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k9r-00000003I2F-0ADT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:58:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B76560008;
	Mon, 21 Sep 2026 19:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8898F1F00893;
	Mon, 21 Sep 2026 19:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020714;
	bh=eN+0DjPC2PIBDvK9KcouX9O0xXht3SUEsMqJsvIURUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ThZj/UOPRjQXCwRJZ/gEI4TMK9E3OQjwyrhcH8Bf8KJ76a5XslxbM0iNnyzwdCccP
	 cdNW/zsTGGtHNFzkkKBnEMg0H3+t1qrp8F2cpOhHE49PGKnlIgpB/QgDWeixkungrs
	 u+fk5tmMOjmJCIlPNcTTHfclpOfmw1cQGkYPxLbE4Z73fBQmLbJU4iP0zw68bS0dLg
	 K7ELvdntHu8ZvCIH76dHZzWSEnrq6zJF7JzAr650C9YYtR4TgWl0cjOJAFKezcqjtj
	 NL6jgtGlEnBNoM0QGZ2UC4BgHenUWmzGV8UmnOKA+QQrAjD1vzb4+dAkIUZFZ1PaQn
	 Ewb8KNTEGclJQ==
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
Subject: [PATCH v1 09/17] thunderbolt: Switch to use acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:51:06 +0200
Message-ID: <1941270.atdPhlSkOF@rafael.j.wysocki>
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
 drivers/thunderbolt/acpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
index 53546bc477a5..be91bc604900 100644
--- a/drivers/thunderbolt/acpi.c
+++ b/drivers/thunderbolt/acpi.c
@@ -17,8 +17,8 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
 	struct fwnode_handle *fwnode;
 	struct tb_nhi *nhi = data;
+	struct device *dev = NULL;
 	struct pci_dev *pdev;
-	struct device *dev;
 
 	if (!adev)
 		return AE_OK;
@@ -37,7 +37,7 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 	 * USB3 ports might not even have a physical device yet if xHCI driver
 	 * isn't bound yet.
 	 */
-	dev = acpi_get_first_physical_node(adev);
+	dev = acpi_bus_get_primary_device(adev);
 	if (!dev || !dev_is_pci(dev))
 		goto out_put;
 
@@ -74,6 +74,7 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 	}
 
 out_put:
+	put_device(dev);
 	fwnode_handle_put(fwnode);
 	return AE_OK;
 }
-- 
2.51.0





