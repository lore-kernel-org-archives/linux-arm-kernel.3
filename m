Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD45C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCS9YBkYCw+URVZXcbcYXfVkyifcshj09WiHSyzQOPU=; b=krKjLw+nkDbUVR
	36L3R3iwBiihjq2dNbjWL3lZtiJcyh7fortOe1zciVP13IaDnUaL9U8n1R1Uh8QslhFqH6zrlsWW2
	diE4SSgmXBjil4RCQnHKch9Znn9mIREi6bYw4ZG9ELQy3VSTi6G9CAufvF0TULjBDiAdqf1FfxcvL
	BLj9oTAU1FCy48LmQm6y4F47zKuK9+LJw6Q8PqaaH+Q93mnwSk3VS+Fqc6HQNVI0z5rPrlNwgXMI8
	FDINuIETYC9A1GgupAOIG5rA2I3PF5eApyHr+E1S+SBdxN5R8K1b1jqatnEEXeWB6CAYDINAsSvqA
	aprinEZS9pRlXQzU8PiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndo-00000002KSg-11pB;
	Thu, 09 Jul 2026 12:14:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndm-00000002KPX-0hHC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Jul 2026 12:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MCS9YBkYCw+URVZXcbcYXfVkyifcshj09WiHSyzQOPU=; b=SGDT9LUWF4fW4BjxL4nImowILr
	ioRcYUf/VeAZqudNyCLimTAY+YDsXsyRWKgNDjtIB28RD9WYWY76AnptOkPzZo1QwNO9U5t1nH2ot
	BS5X1GnqKxvrNuIFl7SQc7CfGAO3VtEJ9FpRbcVUdb6z8wCB+ktT1udNFFJTw+2lpiXaBcnK4CDY5
	zdfzxNZKqJbbF2LHYm+h2FrjTA2Rb/5BA0qhO3sukS6+/tL3TcZvOSKRT6Aa6lxxFQQFI677j1MWt
	ToWCfIFCT9/HLYNWZ5C8IfnJoKtDKDdGPKHib0hWM079vR+zcoZQ1nyNqkvmqy0SpFn4kXKcIKNY7
	HIaflJwA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whndf-00000009Bk2-37H8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0219D152B;
	Thu,  9 Jul 2026 05:13:53 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 236AE3F66F;
	Thu,  9 Jul 2026 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599237; bh=PqYqA+Uka3hKnG3ofSUdRYEbe7o9p1qptfN/wL+TdJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QTl1OqIWEUt6NKpl3GEMC2gx7taC6reqOdOdOBriwNPC4PL+e/i4YWScSquHz1rgj
	 ZfJMRrTg8mIX4OA8cCO26OSyHbkcnKY5/iCjwPVse8FYwN5j8JE6J65c9krCJs03FV
	 nxHDynh9UMQ3iERG+xqUobJgMI9Vdl5Ljw2BwbxI=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 02/36] arm64: debug: don't mask DAIF for mdscr_write()
Date: Thu,  9 Jul 2026 13:12:59 +0100
Message-Id: <20260709121333.23507-3-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_131401_788936_278FF03E 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Masking DAIF around the write to MDSCR_EL1 doesn't do anything: we can
write to sysregs with interrupts unmasked, and writing to PSTATE is
not a context synchronization event so it does not synchronize it.

This is done in the context of a general interrupt handling cleanup,
so it does not address the missing context synchronization for the
MDSCR_EL1 write, staying consistent with the current state.  This
should be addressed in a future patch.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/debug-monitors.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 29307642f4c9..e271fbac5f82 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -40,10 +40,7 @@ u8 debug_monitors_arch(void)
  */
 static void mdscr_write(u64 mdscr)
 {
-	unsigned long flags;
-	flags = local_daif_save();
 	write_sysreg(mdscr, mdscr_el1);
-	local_daif_restore(flags);
 }
 NOKPROBE_SYMBOL(mdscr_write);
 
-- 
2.34.1


