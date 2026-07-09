Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F172C44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWBPEOc4ibaseAoOcg1Q6DREgtFfMd7be+wInKZgfN0=; b=D503dUqKhDLStY
	MJdfsEDxzLsrUnZcEP66qg9q9mVXQJbmSigZUu2MR+9WCwZ64ugcHL1MfM6BSoGhegn6BblAoAWBZ
	l6yAUPa/iyMJjz3o6GuEGcvMjbnQm9Hl684mWK/nkE+Mu/JmaA+ecll8jpka9I6GuJSkTSvCjrj93
	oj+fgfy2HViG0EhYLG4xontxm6FXFdKoaFB05PZgEd9etbZ2fIezaAbZZJz8RR9G+wLRtQqigUk0S
	/gQ+I7RPRKElhEJ/itEO5hbqHmZR4WA5eqP1VzRHrCRFVbqUCxIb+dAPvJT5RcXsOwIfJQZNL5Eas
	QexEsGwg47i3bO+dJ8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndo-00000002KTi-34zW;
	Thu, 09 Jul 2026 12:14:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndm-00000002KQS-3VTr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Jul 2026 12:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iWBPEOc4ibaseAoOcg1Q6DREgtFfMd7be+wInKZgfN0=; b=DK3wZXpfOZ5Jg6hAagxa5YBd+N
	d1mku7FJGXctOoQR52WRaecoSsG9Jm3xT0xm/H+JcpVxx99vJw6qYaj0Wo2ZXRfn5V7fHvWNr6nyl
	zIz0xGfUCdcWiiY4T9YDlTFJknw6UDJIDW+hg674vCLllX8TXu0vphg88kaLHROXGWyo5XKckhd1t
	uxU1aTMzkg3u639pncRsueoNja1LxV+Uwo5Hd9B2nywLm7EGXGXd7NDanc6EaW1ouoB70Uj1Y1lWU
	E6OjL54BAt7cQvKD8/ZpEEPJURFOoJMyd+OQiJaRiQfS82ZwxDMo2cOIw6JImXZfv6xTTm2g01674
	1GLzY0fA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whndg-00000009Bk4-1oVw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 880643569;
	Thu,  9 Jul 2026 05:13:54 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 98B663F66F;
	Thu,  9 Jul 2026 05:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599238; bh=A0HThDhV2EiHgkmjSvC1XV12EMUkekerQnoQu3QMhzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kTTNyZowsGIdS5pykPgtJf7DxIDrQ79kMNcRJqRqZyy0Mr/a5+fYqNSHYFj1oj7mF
	 Ml8YVblaTdInjf5iwukEa4ygrpXEo/CdLJ81EbZ4nN5D3t5Gh6yzBU4mNyoCub9MXM
	 xcWp1/7ys/ooIn5DzyPdK6WT/hgTIdsPHWhS+p6E=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 03/36] arm64: hibernate: mask DAIF before restoring hibernated kernel
Date: Thu,  9 Jul 2026 13:13:00 +0100
Message-Id: <20260709121333.23507-4-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_131401_893095_F7C87DFF 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org
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
interrupts are masked (by virtue of `local_irq_save()` in
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

Cc: stable@vger.kernel.org
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/hibernate.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 9717568518ba..d0d9bd91e639 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -405,6 +405,7 @@ int swsusp_arch_suspend(void)
 int __nocfi swsusp_arch_resume(void)
 {
 	int rc;
+	unsigned long flags;
 	void *zero_page;
 	size_t exit_size;
 	pgd_t *tmp_pg_dir;
@@ -465,9 +466,21 @@ int __nocfi swsusp_arch_resume(void)
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
+	flags = local_daif_save();
 	hibernate_exit(virt_to_phys(tmp_pg_dir), resume_hdr.ttbr1_el1,
 		       resume_hdr.reenter_kernel, restore_pblist,
 		       resume_hdr.__hyp_stub_vectors, virt_to_phys(zero_page));
+	local_daif_restore(flags);
 
 	return 0;
 }
-- 
2.34.1


