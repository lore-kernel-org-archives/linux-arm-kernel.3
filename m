Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF8FC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCS9YBkYCw+URVZXcbcYXfVkyifcshj09WiHSyzQOPU=; b=ryAq1M9VUrjc0+nFO0rpRdtGrI
	9m/vzGa67HlyRTmK3UymaxqxXiPDmVkpikl+A+Eg/kHDdcufvSHZ/eXfJ7LJRqglaf8ladtFKznnE
	Lt23cU14JIG93UWY0gnWhsdoG4LKJflMH9VaTLKDQ/3NQmfRvJg5xEnXd807Tq9OVvQT9ouIHEUC0
	kTwG1hbOl9ayOCJFiD1wWZb+h8npZcz9CnMR3yYQBt6ibN88jiyign7vBU67u94iBi5u95nPS2pyc
	XeS/BP2wxHuENJgsIohIIK0ZMO+CvBmhbHyebfS96/ohpQxeBrXimuHuATJzzliiRGTHhXJ4Ad6nr
	MFvmEXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIY-00000003MSQ-3OB1;
	Mon, 27 Jul 2026 16:35:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIW-00000003MQc-1LmD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CB0616F8;
	Mon, 27 Jul 2026 09:35:19 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F0013F86F;
	Mon, 27 Jul 2026 09:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170123; bh=PqYqA+Uka3hKnG3ofSUdRYEbe7o9p1qptfN/wL+TdJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fdOKAeWYCdU0nD8AWd5fu0+BLuut8ILTCekwj4jKxfDN+yHAW4OtnPF9GrndDWDgP
	 b/RlWel8e28Gni2hxZzLhSwLCJV/i+5710Sfu8lqjV/ztzffbgUENUEEaoyoNQteTU
	 KKvNt+FMJVif1CziS32HKXwgxWVn9O4OXcqmPzLY=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 02/45] arm64: debug: don't mask DAIF for mdscr_write()
Date: Mon, 27 Jul 2026 17:34:10 +0100
Message-Id: <20260727163453.7969-3-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093524_419892_881AFA7E 
X-CRM114-Status: UNSURE (   9.87  )
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


