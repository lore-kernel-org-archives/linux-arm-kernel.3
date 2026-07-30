Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9C3C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IrNx642kewl/zDKJOpDkLzgjGLhqUgb7rTigNrbEyMI=; b=ygRRRl90DxglRbU/OKdGgZ6OUH
	l/kef2QTntSJusgplNpWJ3C5np4abm34arJzJ6XyLYY1yuIfLYyZobE4yanSNTPBlAK+kOIjVV9sl
	FI8IKG0HA1yIoy0BdvJ1eRqkAchFq21YcES8LiV8ZeSDlBBBJ17l9RRZJ+Tg+7sIDS34Gv6oNRpb4
	o1FmYVLhb93cbjHxgZLvzx9Kp8e0f6mucDdvzDXvXpUP2RTZGqhNsJduJwa2FY3j8GB54okm2nbYf
	nghPFc1oKZWExjyemfOxp8M+4e3f2BFlheM9pMLnq248gtnbLNLqIAJlrQRZ/iUeSrR5BoeLbjjLl
	eNMFR7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpL67-00000009jOM-1xoL;
	Thu, 30 Jul 2026 07:22:31 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpL64-00000009jNP-1Azm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:22:29 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84e507b079dso1273729b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 00:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nearthlab.com; s=google; t=1785396147; x=1786000947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrNx642kewl/zDKJOpDkLzgjGLhqUgb7rTigNrbEyMI=;
        b=NhmHDLPJYyAlG4ikVxbI0bVQqGyn/MACFcbvyNMpm20CSh27jWzgUPdVjXMYs4nx0V
         IZeHHvFtYX30BfcDMRqosvpTTgORMNKCSuo9qMZEOVEB365iNpZK7IPXJ5svDUYCsxkX
         FARxMrot66gSz+h4ywz0dSnOE2UKXDNm9NOJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785396147; x=1786000947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrNx642kewl/zDKJOpDkLzgjGLhqUgb7rTigNrbEyMI=;
        b=OOt7aKoKdVkhr3MFI5tjqOUrB45AxEYhsHrO9N+hbHIMTld/TCRp1Aoftas67I/XCR
         qrjHt6UsVuO3E7WhgMQQcEhSDLT24QtqQQ6eotaIDpBZg46XHykzjO1SOB3/rRZzC3hI
         BJTtOxJAceS2XCDvQT9moTjakRzUCc77JyQY0/xEwTTmso+kcsjzp+9BSQq3tlHRmAi2
         PFSi1sQ6ma5ouOiThOYlGQ9vV8KOGOqVVfl2Th1YVEFc5ed8NuUT81O3fG5lwlO/OBkD
         yN6c3MwF3XfNPgcIfx/NWrAth2BfeYbJ0lo9/7j8ow8YT1GyIJf9SQcKVav8wrYNpH7Z
         AkPA==
X-Forwarded-Encrypted: i=1; AHgh+RpvH4HFpZPnyRMxLbaIVFzhPTNiq0U7Z386nJkpWc1Ovrfy8zYVFmyHdJD4HHcbUfVOv1PIPIFWp9og/+mtVkth@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ02ErV7N1bGnB8Sw0vkBWJ6xErOjL6pJW7trIo6BYnRlW3v5P
	7kBrVIGmUfUco51tFzkOu+vcFy6YEYu3Z5AHXnHajVPBs7bKE7BbmSjN4Wv5fMaBkVI=
X-Gm-Gg: AR+sD13EumJrmSp9xGjl2hy71IxRxOmx3B2B7BtXSqVXgCYMfslE8Q1IXW9/ZEqC+Qu
	8v0F3yUaJenFK0hZ2E6ztZuwVWdn9BsnBRZFvz1B38FlXUs4inwNQDrhjp9Jnhb0u4kzJPhjXmK
	3Suxlx9GysPjViXunxDvqHVRTKAzfQ7uan/vYX74C0ACnOp5wcYm/kl71VqscdXznfPt6BJJ4if
	k8RvUWSHZO6YaimWXmBGITbBbz3QiotBMRVgfj2yjyZ0e0I/IAcrQIC8uT47UNGJNgxUUVWQMNK
	WkW8As9CeGTMTZTAU3BglaSmRJ1jVBdcNTy6db8PT5b4MW/mtr6q8P7rXBVHgtMyonaAKRVNuN/
	7YcOsRMToZoMMwupGTsgcYlDxgolz7tV5z0SYKDL0HKTs/cqGzIFX0IJkt7uPqRsNvm9E4nsohJ
	ohxNgyYbZv8vlcxMjrlXGZ5iFxhtJw0txn8w0FgUKOr+VQxqxwgCr5ghDodkZESTDN+EMLxKF4s
	k6Rl6ET
X-Received: by 2002:a05:6a00:a16:b0:848:4080:afe8 with SMTP id d2e1a72fcca58-84ebc2384fcmr1614396b3a.22.1785396146880;
        Thu, 30 Jul 2026 00:22:26 -0700 (PDT)
Received: from sangwoohan-nearthlab ([121.133.119.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa4c9sm2573323b3a.32.2026.07.30.00.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:22:26 -0700 (PDT)
From: Sangwoo Han <sangwoo.han@nearthlab.com>
To: jim2101024@gmail.com,
	florian.fainelli@broadcom.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sangwoo.han@nearthlab.com
Subject: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are handed out
Date: Thu, 30 Jul 2026 16:22:15 +0900
Message-ID: <20260730072215.2090974-1-sangwoo.han@nearthlab.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_002228_341672_2DC0A124 
X-CRM114-Status: GOOD (  19.12  )
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

brcm_msi_alloc() reserves a naturally aligned power-of-two region with
bitmap_find_free_region(order_base_2(nr_irqs)), but the irqdomain core
releases the vectors of a block one at a time:

  /* irq_domain_free_irqs_hierarchy() */
  for (i = 0; i < nr_irqs; i++)
          if (irq_domain_get_irq_data(domain, irq_base + i))
                  domain->ops->free(domain, irq_base + i, 1);

That loop is the only caller of an irq_domain's ops->free(), so
brcm_irq_domain_free() always sees nr_irqs == 1 and
bitmap_release_region() clears exactly one bit per call. A request whose
vector count is not a power of two therefore reserves
roundup_pow_of_two(nr_irqs) bits but releases only nr_irqs of them, and
the difference stays set for the lifetime of the controller.

Multi-MSI regions are order-aligned and the controller has at most 32
MSIs, so the pool is quickly exhausted. Observed on a BCM2712 with a
5-vector endpoint behind a 4-port PCIe switch: the switch ports take
hwirq 0x0-0x3 and the endpoint's block walks 0x8 -> 0x10 -> 0x18 across
three driver reloads until no aligned order-3 region is left.
pci_alloc_irq_vectors() then falls back to a single vector for the rest
of the boot, silently multiplexing the endpoint's four completion
interrupts onto one hwirq.

Devices that ask for a non-power-of-two vector count are not exotic:
wil6210 asks for 3, the MHI modems for 5 (Quectel EM1xx, Foxconn SDX55,
Telit FN990, MediaTek MV3x) or 7 (Qualcomm v1), ath11k WCN6750 for 28
and ptp_ocp for 17. MSI-X is unaffected because it allocates one
descriptor per vector with nvec_used == 1, so the order is always zero.

Reserve exactly the vectors that are handed out, at a base found with
bitmap_find_next_zero_area(), and clear exactly the vectors that are
freed. The number of reserved bits then matches the number the core
releases, whatever arity it uses.

The base still has to be aligned: PCI Local Bus Specification 3.0
(section 6.8.1.6) lets the endpoint encode the vector number in the low
order_base_2(nr_irqs) bits of the Message Data register, and in this
controller those bits are the hwirq itself. The alignment mask has to be
roundup_pow_of_two(nr_irqs) - 1 rather than nr_irqs - 1:
bitmap_find_next_zero_area() requires a mask of the form 2^k - 1. No
align_offset is needed because the bitmap index is the value the
endpoint ORs in, see brcm_msi_compose_msi_msg().

For a power-of-two nr_irqs the alignment and the region length are both
nr_irqs, so the base returned is the same as before and those
allocations are unaffected.

Fixes: 198acab1772f ("PCI: brcmstb: Enable Multi-MSI")
Cc: stable@vger.kernel.org
Signed-off-by: Sangwoo Han <sangwoo.han@nearthlab.com>
---

Notes:
    Tested on a BCM2712 (Raspberry Pi 5) with a 5-vector endpoint behind a
    4-port PCIe switch, running 6.12.25 where brcm_msi_alloc() and
    brcm_msi_free() are byte-identical to mainline. Without the patch the
    endpoint's block walks 0x8 -> 0x10 -> 0x18 over three driver reloads and
    then falls back to a single vector for the rest of the boot; with it the
    block returns to 0x8 on all of eight reload cycles and the inner
    domain's mapped count round-trips cleanly.
    
    Compile-tested on mainline for arm64 with W=1 and C=1 (sparse); no new
    warnings.

 drivers/pci/controller/pcie-brcmstb.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 8a0c353d2a..6c5166666d 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -595,11 +595,22 @@ static struct irq_chip brcm_msi_bottom_irq_chip = {
 
 static int brcm_msi_alloc(struct brcm_msi *msi, unsigned int nr_irqs)
 {
+	/*
+	 * brcm_msi_compose_msi_msg() puts hwirq in the low order bits of the
+	 * message data, which a Multi-MSI endpoint rewrites per vector, so a
+	 * block's base must be aligned to the Multiple Message Enable count.
+	 */
+	unsigned long align_mask = roundup_pow_of_two(nr_irqs) - 1;
 	int hwirq;
 
 	mutex_lock(&msi->lock);
-	hwirq = bitmap_find_free_region(msi->used, msi->nr,
-					order_base_2(nr_irqs));
+	hwirq = bitmap_find_next_zero_area(msi->used, msi->nr, 0, nr_irqs,
+					   align_mask);
+	if (hwirq >= msi->nr) {
+		mutex_unlock(&msi->lock);
+		return -ENOSPC;
+	}
+	bitmap_set(msi->used, hwirq, nr_irqs);
 	mutex_unlock(&msi->lock);
 
 	return hwirq;
@@ -609,7 +620,7 @@ static void brcm_msi_free(struct brcm_msi *msi, unsigned long hwirq,
 			  unsigned int nr_irqs)
 {
 	mutex_lock(&msi->lock);
-	bitmap_release_region(msi->used, hwirq, order_base_2(nr_irqs));
+	bitmap_clear(msi->used, hwirq, nr_irqs);
 	mutex_unlock(&msi->lock);
 }
 
-- 
2.53.0


