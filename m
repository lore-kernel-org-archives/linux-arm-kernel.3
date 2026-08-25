Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84608C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcjQYxJSDuzLIJWxbldwZuYiOSwnH8+4AZ5XCME/3vg=; b=qmrWNMw+CazIVpykp/LxjuBWkZ
	wboMfSG4ad6IHaW6eHqh5eEHP81CnFGCc1+WIkoNtdQRupJMdgS1Ze3oUCtQGSUI6BjOOkeydnKfC
	pqovwdhVl1fcVfanzMehIHps8Nr8U8j4nHcgTs5kW+8DKBsjeLUhRj06K8oDKey/Tm+JahyL9sD7R
	IGiInMDbkvTzzrC50FGTGmx7/XUQQBj+HJMxa1BMEYwHhpTOdr1hKvFmD3+QJck2WTL0hQZuHpfcF
	/1R863ajoZSsaSU9zetGNCLt3TWl7epWUsBmQFBEZuQCtqTUppE7O/DPD2uiFOh26TAg7Bu2dm6Wc
	VxZ/67nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyEL-00000001SpH-0Ryk;
	Tue, 25 Aug 2026 20:58:49 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyEI-00000001SnX-3GTT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 20:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691521; bh=tcjQYxJSDuzLIJWxbldwZuY
	iOSwnH8+4AZ5XCME/3vg=; b=CcCNa3x52RoI0/e0OH+7hcs4HFDJkoOwd9ESWola0c+lSe7Lf6
	CnSwRptOswVUyIHK/C7TPc0qWfS8/iPkLDG8qnWZXY+x/QDHRrsZoziS53t1yQB6eFHjoHhntzf
	cmw1HIs9e/0h1g0o2hjQafUQiVvmkxNxkOJI/RSiw9nlf6wINziuKyr1EFj9F5XISYgZ3pjaVAr
	LPQR++QwnEVzKTrQmxYaUtgDnO8f8WBaiQ5TXt6JL/5VwvQtx85/RTeXzt/o2hagYsTAhh3J9Jn
	pygMXMcjCj8otGaOMGK3d7rhA62iUL+MtF1ucGdI+UchHyfFWP/mvY/vVGy7JaMtYVA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691521; bh=tcjQYxJSDuzLIJWxbldwZuY
	iOSwnH8+4AZ5XCME/3vg=; b=XCXO5TuFHBpaNStAIMteueMkdMR+xerG/ycXx00bgQY8i7qniq
	ngEH7n9BEoM+tyPSwc3hPVM/CJqGVOEIflBQ==;
From: Bradley Morgan <brads@mainlining.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH 3/7] arm64: hibernate: free MTE tag pages after saving
Date: Tue, 25 Aug 2026 20:58:35 +0000
Message-ID: <20260825205839.14571-4-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825205839.14571-1-brads@mainlining.org>
References: <20260825205839.14571-1-brads@mainlining.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_135846_967499_DD596829 
X-CRM114-Status: GOOD (  13.92  )
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

swsusp_arch_suspend() calls swsusp_mte_save_tags() to stash the
userspace MTE tags, but we only free them on a successful resume in
swsusp_mte_restore_tags(). If hibernation fails partway, the tags stay
allocated, and the next time we try to hibernate,
swsusp_mte_save_tags() warns about duplicate entries in the mte_pages
xarray.

Reproducing it is easy, just make a hibernate fail twice in a row.

| # echo test_resume > /sys/power/disk
| # echo disk > /sys/power/state
...
| PM: Cannot find swap device, try swapon -a
| PM: Cannot get swap writer
...
| # echo disk > /sys/power/state
...
| ------------[ cut here ]------------
| swsusp: save_tags: Duplicate entry
| WARNING: CPU: 0 PID: 123 at arch/arm64/kernel/hibernate.c:234 \
| swsusp_arch_suspend+0x3f0/0x5b0
...

Free the tag storage right after swsusp_save() has copied it into the
hibernation image. Where hibernation succeeds, the tags come back from
the image and get consumed by swsusp_mte_restore_tags() as before.

Fixes: ee11f332af96 ("arm64: mte: Save tags when hibernating")
Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/arm64/kernel/hibernate.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 7bf117427777..8ac29058a839 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -241,14 +241,18 @@ static int save_tags(struct page *page, unsigned long pfn)
 static void swsusp_mte_free_storage(void)
 {
 	XA_STATE(xa_state, &mte_pages, 0);
+	int n = 0;
 	void *tags;
 
 	xa_lock(&mte_pages);
 	xas_for_each(&xa_state, tags, ULONG_MAX) {
 		mte_free_tag_storage(tags);
+		n++;
 	}
 	xa_unlock(&mte_pages);
 
+	pr_info("Freed %d MTE pages\n", n);
+
 	xa_destroy(&mte_pages);
 }
 
@@ -355,6 +359,12 @@ int swsusp_arch_suspend(void)
 
 		sleep_cpu = smp_processor_id();
 		ret = swsusp_save();
+
+		/*
+		 * Hibernation can still fail from here, so free the tags now,
+		 * a second attempt would warn on duplicate entries otherwise.
+		 */
+		swsusp_mte_free_storage();
 	} else {
 		/* Clean kernel core startup/idle code to PoC*/
 		dcache_clean_inval_poc((unsigned long)__mmuoff_data_start,
-- 
2.47.3

