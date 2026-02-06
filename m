Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921D5EE20A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BXMbjWKKnQFTM8gP6MA21mYbY4TQiL2EEz6+u00QQgc=; b=SJvKuwlgq/tkFLOXK+NzGpc6Od
	iwEyHQO8MarMRxMpAYDmJWdFQWKhqZuAJxI67A1+3581dCK5a8ZiigVdRrBZItWBghCwj1vKHrUB3
	0oTYHUkWuVmXx5gXBgMehM3P9jQavUJ5lK5w4FEXZx7JC+eVq9FL1LutaXd1Z98/EjxCRjDYEmpkH
	RH/PXM09UnshPsZbhEBJO767Kg4Xodwvd/cl6LI6Rw5mJ/LV199LzCi8ilaOYLTZA0B/wINNFyPbP
	AW0J+qgYs6eAVNbY2zU/jBiOE8y/w4rK+YDoeruvvqM5XJgEfb9wu1vum5BeL4qpaD2LWYvvFzYW6
	yQbKQbow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voO4H-0000000BWKb-1sh3;
	Fri, 06 Feb 2026 15:48:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voO4F-0000000BWKD-1dLZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 15:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A77C1419DE;
	Fri,  6 Feb 2026 15:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCE1C19422;
	Fri,  6 Feb 2026 15:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770392902;
	bh=u0kXhBG7RKykT4a2plJUwV+qAtS+NbaloqTIo40MoRc=;
	h=From:To:Cc:Subject:Date:From;
	b=oY0vaaiG77HJNetYFwAFKR1W7fx/9iZr6G410Djd7mCwWzY9pY0w6BHiW73xnVuGO
	 yHHfdUEeUSCz85Vk3pUX5QZx2te+ICxuoOoKmiaUHFoTIXZ3HoF7wN1yC4hiPMEq6Q
	 iPVG/XgcUEGHuPs0TzMPnpYyHcH0DMC9OfVWcrOx6gbx983HFT7qwnpLrKg/XuaZ2m
	 MzKfWyN3ZTnbZxa3QRfFh/jZoesgng4kJD4sESkvrBA4bgy95M/gLKhuQ1PDs/+Cbr
	 fCv7Ks5x1euNZGqEpaeqhcwN3R0biCIg9qTidgAC3h8FXKF1pV1AEKt5BpoXXL070G
	 1WmWRszSmuIgQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1voO4B-00000009Bya-1fUT;
	Fri, 06 Feb 2026 15:48:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH] irqchip/gic-v3-its: Limit number of per-device MSIs to the range the ITS supports
Date: Fri,  6 Feb 2026 15:48:16 +0000
Message-ID: <20260206154816.3582887-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@kernel.org, robin.murphy@arm.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_074823_491487_B9D210F2 
X-CRM114-Status: GOOD (  13.87  )
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

The ITS driver blindly assumes that EventIDs are in abundant supply,
to the point where it never checks how many the HW actually supports.

It turns out that some pretty esoteric integrations make it so that
only a few bits are available, all the way down to a. single. bit.

Enforce the advertised limitation at the point of allocating the
device structure, and hope that the endpoint driver can deal with
such limitation.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v3-its.c   | 4 ++++
 include/linux/irqchip/arm-gic-v3.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 2988def30972b..a51e8e6a81819 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3475,6 +3475,7 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 	int lpi_base;
 	int nr_lpis;
 	int nr_ites;
+	int id_bits;
 	int sz;
 
 	if (!its_alloc_device_table(its, dev_id))
@@ -3486,7 +3487,10 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 	/*
 	 * Even if the device wants a single LPI, the ITT must be
 	 * sized as a power of two (and you need at least one bit...).
+	 * Also honor the ITS's own EID limit.
 	 */
+	id_bits = FIELD_GET(GITS_TYPER_IDBITS, its->typer) + 1;
+	nvecs = min_t(unsigned int, nvecs, BIT(id_bits));
 	nr_ites = max(2, nvecs);
 	sz = nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1);
 	sz = max(sz, ITS_ITT_ALIGN);
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index 70c0948f978eb..0225121f30138 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -394,6 +394,7 @@
 #define GITS_TYPER_VLPIS		(1UL << 1)
 #define GITS_TYPER_ITT_ENTRY_SIZE_SHIFT	4
 #define GITS_TYPER_ITT_ENTRY_SIZE	GENMASK_ULL(7, 4)
+#define GITS_TYPER_IDBITS		GENMASK_ULL(12, 8)
 #define GITS_TYPER_IDBITS_SHIFT		8
 #define GITS_TYPER_DEVBITS_SHIFT	13
 #define GITS_TYPER_DEVBITS		GENMASK_ULL(17, 13)
-- 
2.47.3


