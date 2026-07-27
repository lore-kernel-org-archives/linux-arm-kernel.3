Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06405C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6SH6kstKaYwU8GK5Doa9WNEi+8KjiPHRsc67uA80ec=; b=Px0m8+zRgj3A/sGEhyrzl1s5r2
	oYQA600kivW03fUVCeI0qMjVRqurPhaFW5WOMEDQpwtyB64ylmsM5shD3ZV21xqdrgZ7dmlw2AEdh
	E1P77e6YLcqISobxnQEHOijDbA4s+UFirvTnR2wxmcRCOhHr5arSgV3p9Mvp6FW4NyMX7xjHWISU4
	pPGl3xu4JLDZZBD08ualQA8SH6RPUmBe1C2yp35b6YfJac8HWvPjb4xgSgZziJcQEuO/trx92Uy8F
	4sq0Q49YzT3tIlb8905Ctjnwc5hb86r8qgLILmNNCLU9yGT5684SHAoHEXBnI1XubS4imjZiapWvY
	GhZAW3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIt-00000003Mht-07jr;
	Mon, 27 Jul 2026 16:35:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIX-00000003MRO-3sgX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6762E1713;
	Mon, 27 Jul 2026 09:35:20 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D8553F86F;
	Mon, 27 Jul 2026 09:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170124; bh=WPSasZYnFbBCBuqOGXoOJfr5I7S7v3nP7bx+/ug1sNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M3qode9N6SDBkNRvjW30GRwuWcLDtdLPEIBEkG2kAsj5SJocsg4qfjtoKVRieSkvQ
	 NmyAHAlRxOvMXrvSlkjXRdgqFi6t3tDmdS1laZG58PR2cWt7Zgoe2kBrHOPJf/MqJ8
	 1xiJTOXtHUm8TSjRRHMI/Mx8Q0Aj7jtOvMMBECCA=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 03/45] arm64: hibernate: mask DAIF before restoring hibernated kernel
Date: Mon, 27 Jul 2026 17:34:11 +0100
Message-Id: <20260727163453.7969-4-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093526_076509_E2253CD8 
X-CRM114-Status: GOOD (  12.80  )
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

The arm64 hibernate code manages the exception masking in an unsound
way, leading to potential crashes and/or warnings during resume.

When a hibernation image is saved in `swsusp_arch_suspend()`, all DAIF
exceptions are masked (by virtue of `local_daif_save()`), and the
suspended image is saved assuming that all DAIF exceptions will remain
masked when the image is restored.

When a hibernation image is resumed by `swsusp_arch_resume()`, only
interrupts are masked (by virtue of `local_irq_disable()` in
`resume_target_kernel()`). When pseudo-NMI is enabled the DAIF.IF bits
will be clear, and regardless of pseudo-NMI the DAIF.DA bits will be
clear.

This means that there are two problems:

(1) It is possible to take Debug, SError, or pseudo-NMI exceptions
    during the resume process. This is unsafe, as during the resume
    process both the old ane new kernels will tranisently be in an
    inconsistent state, and swsusp_arch_suspend_exit() won't retain
    an executable mapping of any exception vectors.

    Any exception taken here will be fatal and silent.

(2) When re-entering the resumed kernel, some DAIF bits will be clear
    unexpectedly. This permits Debug, SError, or pseudo-NMI exceptions
    to be taken for a short period while the resumed kernel is not yet
    in a consistent state.

    This is detected by CONFIG_ARM64_DEBUG_PRIORITY_MASKING.

Avoid these issues by masking all DAIF exceptions during resume.

Fixes: 82869ac57b5d ("arm64: kernel: Add support for hibernate/suspend-to-disk")
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/hibernate.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 9717568518ba..1eb1c1074c5b 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -465,9 +465,21 @@ int __nocfi swsusp_arch_resume(void)
 	if (el2_reset_needed())
 		__hyp_set_vectors(el2_vectors);
 
+	/*
+	 * It is necessary to mask all DAIF exceptions here as:
+	 *
+	 * - The copy of swsusp_arch_suspend_exit() in the hibernation
+	 *   text cannot handle taking any exceptions.
+	 *
+	 * - The suspended kernel masked all DAIF exceptions in
+	 *   swsusp_arch_resume(), and expects to be re-entered in the
+	 *   same state : with all DAIF exceptions masked.
+	 */
+	local_daif_save();
 	hibernate_exit(virt_to_phys(tmp_pg_dir), resume_hdr.ttbr1_el1,
 		       resume_hdr.reenter_kernel, restore_pblist,
 		       resume_hdr.__hyp_stub_vectors, virt_to_phys(zero_page));
+	unreachable();
 
 	return 0;
 }
-- 
2.34.1


