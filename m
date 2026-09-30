Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51587CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPUa1UDCepLgjEsxDYzNytI1H2lpA7WtjDbyVIjlxxw=; b=UjkUsgI1UuswV8dpE4lMCcJy8w
	YKygndSr2wIKdFW+TT2UGQVmQx0AOxZno+2ftkXi/caIUquPhzXmhTBfBFvaiAWmLCbsn9qLYlG7Q
	3GN+/Gs3oB0sjuGh2OYG5mnN5TS3gTQeHvsvPy4WtierY0xaKm8hHRHQ8MoOPVuKORt11AVlUI4jL
	2T6kak+ZUmBr1HVz5BLqgYz/4mM+F6FHlvLAidgmLnYrEr2hN3MYAYJtAeJX4WE1R2oeoMoA8VyeI
	5uIcRJJ9W0M4rCHibzk97noB1Aif+bb+Fbxcmc6O/7l/kfVkm56SxW6ZPOD51l8lwZxNPLKVaCS70
	99RrvjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzJP-000000070ZH-3h0Z;
	Wed, 30 Sep 2026 18:45:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzJF-000000070Uj-3iME
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 18:45:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FDC0444F2;
	Wed, 30 Sep 2026 18:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C88A1F00898;
	Wed, 30 Sep 2026 18:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790793941;
	bh=sPUa1UDCepLgjEsxDYzNytI1H2lpA7WtjDbyVIjlxxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nvAgqC7+qL/txwB6g/TswQeMlYhqV9aY8pC6/L455ocIF2QraBN9yB7ixoNUQzQIr
	 AZAPONZ6gWyHGW+LUosU4Ts3onnbq40wLFrUX8c7cCSHYH4zzVUbRZJEqxjRAcrjPA
	 9AQV4IbWrLJihN0wZ00K4jZ/nIhS0I8wz/cZoqbpKlcoz3D06Azuxd+oZUA2Hr39lY
	 oLvpXENea7TXznnfd+XhNSaCzUrunYcm36OlagR3IJ1dNarLnGsIGsoq/7FG/FCetw
	 j+HOMAH5/1q4RgX1yyjE2C9vH76CtofXW4PAT2wIWT8AjJrCHMudpX8MaWGWGGGKPa
	 A01KTsF5lw4eg==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>, linux-efi@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>
Subject: [PATCH v2 1/5] efi/dev-path-parser: Switch to use
 acpi_bus_get_primary_device()
Date: Wed, 30 Sep 2026 20:41:40 +0200
Message-ID: <3974502.kQq0lBPeGt@rafael.j.wysocki>
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
 drivers/firmware/efi/dev-path-parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/dev-path-parser.c b/drivers/firmware/efi/dev-path-parser.c
index 13ea141c0def..e0f864cbaa8c 100644
--- a/drivers/firmware/efi/dev-path-parser.c
+++ b/drivers/firmware/efi/dev-path-parser.c
@@ -37,9 +37,9 @@ static long __init parse_acpi_path(const struct efi_dev_path *node,
 	if (!adev)
 		return -ENODEV;
 
-	phys_dev = acpi_get_first_physical_node(adev);
+	phys_dev = acpi_bus_get_primary_device(adev);
 	if (phys_dev) {
-		*child = get_device(phys_dev);
+		*child = phys_dev;
 		acpi_dev_put(adev);
 	} else
 		*child = &adev->dev;
-- 
2.51.0





