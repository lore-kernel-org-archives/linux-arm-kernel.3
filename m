Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E198C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzIk5I7OqDCOAhpxa2DhuDUN9BeeRjYb7EQC4Ahia0I=; b=eiBfq+tw97oWORPjfnyyW/JbEk
	8qg0Wwd6rzb6DcAGckbCg5VrXCU8OY+taQlFrpjLQeMMKYaHiixnZZPctO6lypx+Cgm47msPWQWxF
	yIFsV+1GA3hbyZop+frstYogcNi5lQKxUxLJ05h/8W1p35NHmmyDYPiEIMrQDygEuUshkpWeNVp1z
	IjcyZzvCdDknNa7IS1ZUJrVQEkm5kKwjtzjStzO0hOx2Ndz1c92BE6boHukcW1QGo/gL3Clb6Q5zF
	zAGQS8x555hHcoqxIpWG4TmAyvkJ8jWJKuIKu3GAB/uH9/0Kw0q27eC0hDMFA7vZAq31G8ZCIxTtS
	MMMuu7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAyU-0000000GTPG-3pnY;
	Wed, 12 Aug 2026 15:34:38 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAyP-0000000GTMG-1Em6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:34:34 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1341596a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786548873; x=1787153673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzIk5I7OqDCOAhpxa2DhuDUN9BeeRjYb7EQC4Ahia0I=;
        b=jyvbms4I82AdodRLWtOKyO7EZX6B1m62CvxHGqkEyw/sM2wF8vA53xiMnX8qV5ixXz
         sknhDy+s8DPP1FIMARWsctq9dRh3g96XPp2g++pTHmcKDFoWm3neXpFOlSvjxMW2UKZi
         qx7OwO9WQD/EJ6bB6Ndof/bOcZ8kQz8zu3WUgWKXSJojvRapjHpEzpVrLDdP5gfrC1Yu
         b949Mu20IxBxuTBfUZxtA3DkoUFAPIv7dl5+F40pdshaXFaIEL/lBMSbilfqpqFulntf
         BV2O1cFfCFcOsvkEXJx8OHZnhOkFF/5dc/qnV7INkuq7O65/pblO7ZhBP3hF3qyUKKXP
         roSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548873; x=1787153673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzIk5I7OqDCOAhpxa2DhuDUN9BeeRjYb7EQC4Ahia0I=;
        b=LdfCZ+4yOyWovtnD6uyDWcXU607t4vgI7RP2SujeS42Jx/tcKBJgqtYxRIwUxKy9S9
         xrzL+AS7EUp1qJKUzvh1/QpjdOlk25f887GQF3COWzOkj9iLp2OsjGqb8uGga/sv5Ylm
         3vL49AV+cFDFowvSoYq/a4fpxZWaJvFxSUX1mQYoC6uD/rqDbKUJ8vfYMJSGpkbBAOUd
         M7mXoPyncf7VKliB14VL6mJ0zAz224ze4RlTmHQ9Jb+RX2Sj9VyusIrj6b/1NZ5b6LHe
         t6FPo912757Ov0d2C4GjdFFScfnW2ReBDHzMnwPnsxjpg/Ej6m50DONjBlPrgxS62NsN
         zyeQ==
X-Forwarded-Encrypted: i=1; AHgh+RooK7QOwUUaXU5QrAJ0q2HYrp998SbDBg84Zzda0roFhW5UOQj3VzY59UnNNi/26LdJLOtS7c8tj5AJ/kQZwzD2@lists.infradead.org
X-Gm-Message-State: AOJu0YwzN5af1f7YOa46HyrylkZPb73NuimmQX70BmHqrAgVyJhjra5D
	NqwzhKILe3/4o8AfHR+gbv1DgUwnumt3Vba4kSYTusT1Ai/HSuG9TCU=
X-Gm-Gg: AR+sD11xXOB0a6PymreJiKjKY55B1fZHZtr3EPkuLYwKIkxYuFkCjK8iky5fTMjlSTM
	/CT5VoqbmcusYuJes7ulRory2wKOHqbhh2zKekdwrM0gg085ABgZeZDdDrbuwChdcPkdNai4gj3
	GdpsnjDIqwUuTuc89KJOAiIv7sEmsLUmUw3IHWg+fKFOl52OWVXHZpzOc5e4SOp3caFYE+rhEJV
	kqewBat1ehdWtXqSshDHWhBJt1vVPz0slFPfOHy5UqZ2vhxsWEzf72OOhDdBFSUvrGNHGpgJpBo
	FLFAyFdipQmQT8VwT19tziM0EUJJUAiSiAPzGbfHxGQrFmIYTwXpG8s8AMOkYjd4LIFAx341s9h
	LX4g+5aQsZeZSDKtYPX6WOnTeHBDDBTCOkL+NEGLuiJv8Rd9NzHNsywjHI5HDGqAwvujR9XM+Kf
	HwlwbOkQ/pZiIAafNVJ6JqnhkvDCOvLawZ67VyTWxAUeGDdK4LWjztGaoiUqja92GjL0ActPea0
	J9WFCUift4awdDHl9NbyTRhpcPQ1SMfMvY=
X-Received: by 2002:a17:90a:d64f:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-393011eea08mr7525677a91.7.1786548872437;
        Wed, 12 Aug 2026 08:34:32 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([14.97.72.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31dba3e9791sm7160804eec.0.2026.08.12.08.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:34:32 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andre Eikmeyer <andre@negmaster.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Sebastian Reichel <sre@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH RESEND v7] thunderbolt: Add device links for Apple T2 NHI
Date: Wed, 12 Aug 2026 11:34:07 -0400
Message-ID: <20260812153411.1159-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812153411.1159-1-atharvatiwarilinuxdev@gmail.com>
References: <20260812153411.1159-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_083433_373977_C7EC7EC9 
X-CRM114-Status: GOOD (  17.89  )
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

Ice Lake Thunderbolt NHI That are only on T2 Macs. The NHI and its
associated PCIe Root Ports all sit directly on the Root Complex
with no upstream port. Identify the tunneled PCIe Root Ports by
their PCI IDs and create device links back to the NHI so that
PCIe tunnels can be re-established after sleep.

And on other Thunderbolt NHI's, like Titan Ridge, the default method
is used to add device links.

Co-developed-by: Andre Eikmeyer <andre@negmaster.com>
Signed-off-by: Andre Eikmeyer <andre@negmaster.com>

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
Changes in v7:
- Used pci_lock_rescan_remove to prevent race conditons.
- Fixed patch format.

Changes in v6:
- Used for_each_pci_bridge in Icelake section
- Removed has_apple_t2_chip as its not required now

Changes in v5:
- Used Icelake root PCI IDs for detection of root ports instead of TRP

Changes in v4:
- Limited TRP check to T2 Icelake systems only
- Optimized has_apple_t2_chip check
- Included pci.h to drivers/thunderbolt/tb.c
- Used __free(pci_dev_put) to avoid label

Changes in v3:
- Fix build errors with non-x86 machines
- Used __initconst for apple_t2_devices
- Removed UEFI_QUIRK_SKIP_CERT as its unused now
- Used IS_ENABLED(CONFIG_ACPI) in tb_apple_add_links for the T2 part
- Removed !bid check to remove warning with -Waddress

Changes in v2:
- Used a less generic name for has_t2_chip
- Used DMI instead of PCI for has_apple_t2_chip to avoid PCI problems
- Initialized ret in tb_apple_add_links

Link to v6:
https://lore.kernel.org/all/20260730223435.2874-1-atharvatiwarilinuxdev@gmail.com/

Link to v5:
https://lore.kernel.org/all/20260727211807.1223-1-atharvatiwarilinuxdev@gmail.com/

Link to v4:
https://lore.kernel.org/all/20260724164641.2239-1-atharvatiwarilinuxdev@gmail.com/

Link to v3:
https://lore.kernel.org/all/20260721063412.11588-1-atharvatiwarilinuxdev@gmail.com/

Link to v2:
https://lore.kernel.org/all/20260721054506.11871-1-atharvatiwarilinuxdev@gmail.com/

Link to v1:
https://lore.kernel.org/all/20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com/

 drivers/thunderbolt/tb.c | 49 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c69c323e6952..2534c6378000 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
+#include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_data/x86/apple.h>
 
@@ -3305,16 +3306,62 @@ static const struct tb_cm_ops tb_cm_ops = {
 static bool tb_apple_add_links(struct tb_nhi *nhi)
 {
 	struct pci_dev *upstream, *pdev;
-	bool ret;
+	bool ret = false;
 
 	if (!x86_apple_machine)
 		return false;
 
+	/* Identify the tunneled PCIe Root Ports by their PCI IDs
+	 * on Macs with Icelake NHI's
+	 * and create device links so that
+	 * PCIe tunnels can be re-established after sleep.
+	 */
+	if (nhi->pdev->device == PCI_DEVICE_ID_INTEL_ICL_NHI0 ||
+		nhi->pdev->device == PCI_DEVICE_ID_INTEL_ICL_NHI1) {
+		const struct device_link *link;
+
+		pci_lock_rescan_remove();
+
+		for_each_pci_bridge(pdev, nhi->pdev->bus) {
+			if (!pci_is_pcie(pdev) || pci_pcie_type(pdev) != PCI_EXP_TYPE_ROOT_PORT)
+				continue;
+
+			switch (pdev->device) {
+			/* Ice Lake Thunderbolt 3 PCIe Root Ports */
+			case 0x8a1d:
+			case 0x8a1f:
+			case 0x8a21:
+			case 0x8a23:
+				break;
+			default:
+				continue;
+			}
+
+			link = device_link_add(&pdev->dev, &nhi->pdev->dev,
+					DL_FLAG_AUTOREMOVE_SUPPLIER |
+					DL_FLAG_PM_RUNTIME);
+			if (link) {
+				dev_dbg(&nhi->pdev->dev, "created link from %s\n",
+					dev_name(&pdev->dev));
+				ret = true;
+			} else {
+				dev_warn(&nhi->pdev->dev,
+					"device link creation from %s failed\n",
+					dev_name(&pdev->dev));
+			}
+		}
+
+		pci_unlock_rescan_remove();
+		return ret;
+	}
+
 	switch (nhi->pdev->device) {
 	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
 	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI:
 		break;
 	default:
 		return false;
-- 
2.43.0


