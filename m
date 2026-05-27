Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2B6CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJ3i8VkppJ3cuisDm9fnehVuaULOzhvQPsWp+y3gzkE=; b=o5GBNDye62OcHb
	6n/msA/Ak0ue9tD5DYFpmmmFCo9Rw4rS8+NEqQBo4g4YOWEXimsl4OY3+sjHkJ9p3lTb4GKv4+cWN
	yWV6a8xAN6LL0H2jnVqir5ETVy3ZGiSIh8aTMUO8BctOK+UK6bxEDsPjTIEUTXOjNCCuz8OkbFUL6
	HLLP9IDWVnhPFMEkyrykyXF2Jn7WorXAMNtjA0s/BANM357bRp/s1o2iMCmwpLJg3QR0h2cFg3GB2
	g1sb9s7uhTgwcK/wulqi8A7gTFlJPysCPmr0js/GWW2Ik+IEuNw1LBWL07DiA4eVOGGEBXqSnrgvo
	54c4jSERV/IlLe+kuGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGvb-00000004UD9-3BsZ;
	Wed, 27 May 2026 16:16:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGvT-00000004UAc-0DRa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:16:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA2635BF;
	Wed, 27 May 2026 09:16:03 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.28.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C29053F905;
	Wed, 27 May 2026 09:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779898568; bh=LFL9zDac4XBbB1xyQdL6kYD//tvknN1q54/GfYJwkwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EBWaQ5o7KG4jP5tG3W7mz/52cRlpewX3RCkiXFvaVlnahAvnwEs2DKPndURHbfFix
	 iqV9VoZFlg/AdNK9zCMGGFIXKhQygjL7u3SkUNA2TlTmHBstSaezs0h0xdPuzj3wmb
	 XmRNR5ifi3WNXFz91pcWBLjPhPh6KCp1E1+E4jpc=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] arm64/debug: update perf slots in sync with BP registers
Date: Wed, 27 May 2026 17:15:52 +0100
Message-ID: <20260527161553.97676-2-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527161553.97676-1-ada.coupriediaz@arm.com>
References: <20260527161553.97676-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_091612_756027_6A4C47A9 
X-CRM114-Status: GOOD (  16.70  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The current order of operations in `hw_breakpoint_control()` is unsound
and can lead to the kernel getting stuck on a hardware breakpoint in
some edge cases[0], as it can be called with debug exceptions unmasked.

As we search a relevant perf slot and update depending on the operation
directly in `hw_breakpoint_setup_slot()`, when uninstalling a breakpoint
it can still be triggered while its slot has been cleared, preventing
the debug handlers from handling it properly and getting stuck on it.

Hoist the perf slot updates out of `hw_breakpoint_setup_slot()` into
`hw_breakpoint_control()` : set up the slot before writing to the register
when installing (no change) but clear it after writing to the register
when uninstalling.
Rename `hw_breakpoint_setup_slot()` to `hw_breakpoint_find_slot()`, as
the slot setup is now done directly in `hw_breakpoint_control()`.

[0]: https://lore.kernel.org/linux-arm-kernel/adeE4MD0RgapI8aL@J2N7QTR9R3/

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/kernel/hw_breakpoint.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index ab76b36dce82..ce99a00c8596 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -174,12 +174,11 @@ static int is_compat_bp(struct perf_event *bp)
 }
 
 /**
- * hw_breakpoint_slot_setup - Find and setup a perf slot according to
- *			      operations
+ * hw_breakpoint_find_slot - Find a perf slot according to operation
  *
  * @slots: pointer to array of slots
  * @max_slots: max number of slots
- * @bp: perf_event to setup
+ * @bp: perf_event to find, for uninstall and restore operations
  * @ops: operation to be carried out on the slot
  *
  * Return:
@@ -187,30 +186,26 @@ static int is_compat_bp(struct perf_event *bp)
  *	-ENOSPC if no slot is available/matches
  *	-EINVAL on wrong operations parameter
  */
-static int hw_breakpoint_slot_setup(struct perf_event **slots, int max_slots,
+static int hw_breakpoint_find_slot(struct perf_event **slots, int max_slots,
 				    struct perf_event *bp,
 				    enum hw_breakpoint_ops ops)
 {
 	int i;
-	struct perf_event **slot;
+	struct perf_event *slot;
 
 	for (i = 0; i < max_slots; ++i) {
-		slot = &slots[i];
+		slot = slots[i];
 		switch (ops) {
 		case HW_BREAKPOINT_INSTALL:
-			if (!*slot) {
-				*slot = bp;
+			if (!slot)
 				return i;
-			}
 			break;
 		case HW_BREAKPOINT_UNINSTALL:
-			if (*slot == bp) {
-				*slot = NULL;
+			if (slot == bp)
 				return i;
-			}
 			break;
 		case HW_BREAKPOINT_RESTORE:
-			if (*slot == bp)
+			if (slot == bp)
 				return i;
 			break;
 		default:
@@ -247,13 +242,15 @@ static int hw_breakpoint_control(struct perf_event *bp,
 		reg_enable = !debug_info->wps_disabled;
 	}
 
-	i = hw_breakpoint_slot_setup(slots, max_slots, bp, ops);
+	i = hw_breakpoint_find_slot(slots, max_slots, bp, ops);
 
 	if (WARN_ONCE(i < 0, "Can't find any breakpoint slot"))
 		return i;
 
 	switch (ops) {
 	case HW_BREAKPOINT_INSTALL:
+		slots[i] = bp;
+		barrier();
 		/*
 		 * Ensure debug monitors are enabled at the correct exception
 		 * level.
@@ -278,6 +275,9 @@ static int hw_breakpoint_control(struct perf_event *bp,
 		 * level.
 		 */
 		disable_debug_monitors(dbg_el);
+
+		barrier();
+		slots[i] = NULL;
 		break;
 	}
 
-- 
2.43.0


