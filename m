Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED685E9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z1ccuRZOE2fGX89Ufz9m3PCpe51YO4pxo/+mYV1v908=; b=BaedAO1IPZt3I3B2fXmtcnYkGs
	4XEtKNJJhAcygah7IcpmsFnWmzeKNeetY4Nkx9CHk821inQWwcRz+TjFbvLIQV1olJFr+PNE6Q66S
	05D6/bsMR/vmmTN9W0B44K/XnEQP7fVVTgO1eTE9CpKiPKI1uFSArVPclwoujq847qa4I6CMyNI+g
	ceb1+3bnINl8M1fueQs1cxEYHo4YVCLpQUXoRv4yFkzZcOFyyUIaf4WnNuPCRCdmnxyGwsUt9/mo/
	gfo5eJg11Sq2Oq59WO48Zh1GVrfAgiwvoyDSyQdqwSyN2IBv3++MIh0z75RLkSp5bnItJkgObM4Z/
	VlNsFQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Ww-0000000Cpht-003d;
	Mon, 02 Mar 2026 11:33:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Ws-0000000CphI-43ai
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772451219; x=1803987219;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TLAGm/Xm/NIOke7FgpiE5RxbSPLY/5vGq7tktPxAuTs=;
  b=v18q76ElJJSM32KL0eY9rASuWOAIuNP4fPeGibfQa/ZxOz4xjR3XzXye
   9+W8yqNuZ/CSsSClYD7zKHq2wC78YtW1twtjK9vHBd2gmYDTS789YZzaH
   N1kfdLpzwze4OzeKGsKt1tMXQ3q0yb9Vr6By0888FOgkRLj9t7Yk68yc2
   h9q8lIWRuElUJ9NtRPesPOibpfqwI1pycLlZiEzsZgon5bM1Bmhkc96Zd
   Jld0XC4DGuUmYnH2Ct7sX8yN6AXBo1QdGs38wGd1SqZ1t5RlNkGo7iS+5
   LSqsJ9cmX66opSLoDNYjppo6qBEb+k02F8M8gXRNEw0+gnK+2Xo8tjGXs
   Q==;
X-CSE-ConnectionGUID: Btinl9WeT2+oaoBxEtKcig==
X-CSE-MsgGUID: vw7UREDWQIqModl2L0GP0g==
X-IronPort-AV: E=Sophos;i="6.21,319,1763449200"; 
   d="scan'208";a="54070300"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 04:33:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Mar 2026 04:33:14 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 04:33:11 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-watchdog@vger.kernel.org>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<alexandre.belloni@bootlin.com>, <andrei.simion@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/2] watchdog: sama5d4_wdt: Fix WDDIS handling for SAM9X60 and SAMA7G5
Date: Mon, 2 Mar 2026 17:03:08 +0530
Message-ID: <20260302113310.133989-1-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_033339_329274_1B16F5F9 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
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

The sama5d4_wdt driver hardcodes AT91_WDT_WDDIS (bit 15) for WDDIS
detection, which is incorrect for SAM9X60 and SAMA7G5 that use bit 12
(AT91_SAM9X60_WDDIS). This series fixes the detection by introducing
a per-device wddis_mask and documents the bit position difference in
the header.

Changes in v2:
- Reorder patches: fix first, documentation second
- Drop patch 3/3, not needed with wddis_mask approach
- Keep AT91_SAM9X60_* register names, drop _LEGACY/_MODERN naming
- Limit header changes to WDDIS comments and datasheet references

Balakrishnan Sambath (2):
  watchdog: sama5d4_wdt: Fix WDDIS detection on SAM9X60 and SAMA7G5
  watchdog: at91sam9_wdt.h: Document WDDIS bit position per SoC family

 drivers/watchdog/at91sam9_wdt.h |  6 +++--
 drivers/watchdog/sama5d4_wdt.c  | 48 +++++++++++++++------------------
 2 files changed, 25 insertions(+), 29 deletions(-)

-- 
2.34.1


