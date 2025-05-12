Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1D3C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oxuZqjCZA+niw6kd1oRlLWte6R2gJMvN6qaC26edFhE=; b=E3fTwSAFZoDkC4RzSyGEZD1VOx
	pEStfk5hUuJLvuiYq0LLYBKQGOivEeTwNS+0r7T6qmWaJLw4SItsdtQvfaJGK5RTSYSp2jyj8c1Ts
	IMcFZeNlcQctogsMPzGoNL53urQzudYtVFWJMTFZcnxJCv7iezLkxBGsfvpvI0sThoztgL2iwYZHL
	1pSZJnyciDO31SWTYXdnN4zgnhnP1GeEdFSrH85YpzgQczjaObc/1Tmjl8cmdzpUMQqhgO4ioRgIa
	WDKb3hzkWdctwrubOiGaafmvj1E1TzDNqPXktRY0LR3o7eKodyGKvOIH+/DiktdYxWaMWjJQdC6vo
	AhlwHfFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVFk-00000009uON-19h7;
	Mon, 12 May 2025 15:39:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUn1-00000009qN6-2HbE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:10:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17FFE14BF;
	Mon, 12 May 2025 08:09:45 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EFB13F63F;
	Mon, 12 May 2025 08:09:55 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] Makefile: Ensure initrd parameters in /chosen are up-to-date
Date: Mon, 12 May 2025 16:09:44 +0100
Message-Id: <20250512150944.38322-1-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_080959_632991_F8A598E3 
X-CRM114-Status: GOOD (  13.75  )
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

The initrd parameters in the FDT /chosen node are fixed when the device
tree blob is generated, so it is important to regenerate the device
tree if the initrd image has been updated.

Currently this does not happen, so the parameters can be stale.
In particular, if the initrd image is bigger than it was when the
device tree was first generated then the value of the linux,initrd-end
parameter is too small, leading to truncation of the initrd image on
boot even though the whole image is present in linux-system.axf.

Make $(FILESYSTEM) a dependency of fdt.dtb so that the parameters are
refreshed properly based on the current initrd image (if any).

Without --with-initrd, FILESYSTEM is the empty string and the
dependency evaporates, which is just fine.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
---
 Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.am b/Makefile.am
index a8d5c1b..0178e5d 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -185,7 +185,7 @@ model.lds: $(LD_SCRIPT) Makefile
 DTC_NOWARN  = $(call test-dtc-option,-Wno-clocks_property)
 DTC_NOWARN += $(call test-dtc-option,-Wno-gpios_property)
 
-fdt.dtb: $(KERNEL_DTB) Makefile
+fdt.dtb: $(KERNEL_DTB) Makefile $(FILESYSTEM)
 	( $(DTC) -O dts -I dtb $(KERNEL_DTB) ; echo "/ { $(CHOSEN_NODE) $(PSCI_NODE) }; $(CPU_NODES)" ) | $(DTC) -O dtb -o $@ $(DTC_NOWARN) -
 
 # The filesystem archive might not exist if INITRD is not being used
-- 
2.34.1


