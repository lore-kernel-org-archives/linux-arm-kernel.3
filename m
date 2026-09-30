Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E529CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vA5hsqCvhvz/T3rPXSDNs/An5ZWBLUxtfQ5Oe7HS6yk=; b=n5AjxdMsj0sEG5EO8UDpx1mRh/
	slAf+/Qu/+xY5pOBDDzaeqjptkE4XFw+yKGaSWAw07E0wXXgeWiVyA4pAZwO9Tmlo4CJ0/igmKZll
	RUegy3yD8pPwxodGl02C96JINvTFF5oqncpJJpuo7lAM8jegmAYjH81JIwRakGQwYELgKzarSRLb/
	Jg1/s4N/y2Af6n3o1BGl6NwTZamRV0Oh63HGGN48irP1ekkekJnesSfBpmAnZBB2ldG7AUOM3t/uS
	wufussAhwNETTBnPp1vh7L2LsWF1KTIfEJ7i0JcQ2fEa0O7xQryi31svOOGPYMvkMrWKIAre8IsjZ
	7Ce2y4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzIy-000000070Mx-1CeM;
	Wed, 30 Sep 2026 18:45:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzIv-000000070Lz-11r0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 18:45:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 54EF0600AA;
	Wed, 30 Sep 2026 18:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597EC1F00898;
	Wed, 30 Sep 2026 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790793920;
	bh=vA5hsqCvhvz/T3rPXSDNs/An5ZWBLUxtfQ5Oe7HS6yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hSWKQUAUMSVWY8REIbJ+wlwC5u8T4148msWaoNWgoJXh7xwPaFnhSYKH7JRmLBqyX
	 L+Apd5Y0CEHCGhWFZurBxVDtbOdZ7mRVGJfBrmENkww9WZN+EnYt5a6Yb+EHj/bTW5
	 Bcql1ZBb6HCDvzztw7mt0DTRzVW9o+OLh1OjbFcgpDcFOAPr0MMXeUCmoEWvCg7Jyu
	 FIr3MpKTblh9NuPJSfCrNy/TMXxrBH1knMccsawQ5HMi+0rHt4ocTepOR5CC/IhROD
	 uoXGPt0OdxtCj9AKFkxpAdhoqxOi8ZzhTtQbrYUe5N708o11e6kzedWOmIFqn3FJ0J
	 NO20Z3rDtLZtA==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>, iommu@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Robin Murphy <robin.murphy@arm.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>
Subject: [PATCH v2 2/5] iommu/arm-smmu-v3: Switch to use acpi_bus_get_primary_device()
Date: Wed, 30 Sep 2026 20:43:03 +0200
Message-ID: <3636226.QJadu78ljV@rafael.j.wysocki>
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





