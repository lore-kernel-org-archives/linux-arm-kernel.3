Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625ABCA5FEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/T777lhuRfNwSeNxFtz2iSXI/VIM8j8xuLCcKpt+bw=; b=nYBWPkcsXf3iD98Dg72uMJf8G5
	rNBZ1hBgYlF2Dz2tUEvgk/8gIjTe8u6g3ppIGiaiqoK0lynVZ3uoOIAeV1aaR6XHs+5SH6UaAyIuW
	ggONsfB3/FgyQy/gN3Bz+vfROrsyF60mWb3FtYo4fkb3lAeWGkG8F2sSHKDQzhOgZWAKig8JBEP0q
	2nR7TDddkYyjs52BdIBkzz+Mpgy8f374TZx7U8fGxgPA+qJOAtIeW11vDvJdEtVz9AcQvZu+sNGMa
	gEFlx5IDMusYEXusLWDdUZTb4pQLiFsai+jKnkniMNaGV76y/AEaHLAEjd/JLsHYqkiuAZCA244vG
	hXT7lgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVx-0000000Cnjz-3ujE;
	Sat, 03 Oct 2026 00:22:09 +0000
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVk-0000000CnJp-0Ogo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:58 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso62783a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986913; x=1791591713; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/T777lhuRfNwSeNxFtz2iSXI/VIM8j8xuLCcKpt+bw=;
        b=KI79rRhH+HxXkyB2DfXbuIuSdkfqf541EWRjf82iAIde6BGErBSU1gn/jq24q/fbp7
         dlvJQN1gvlMcacHaAbeMdhQidA2p/vIpAE8slN/5jNF4jFTdivtQJk5zgRUJLx2WPWj4
         DAMxp7+BIg+D5KhxLl/rQ6/HNBUGrTXuHJWpBWdnw5RHt+Uv8a/b1pjO32wJW5WtjWwX
         RzOcWuc9GlmCAPc1/M/7wm8nDXCWZYu2iSaZPDZ9SnGSVQ2T+VBJos6vZ3P5ZeV+mUr4
         Dj7pUwh1iZj8aCgVwCM94EOgt02lZ2gb6nDtAVuPlz6ySB2eYhdpqsOG+xmOv/DO6tmN
         bctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986913; x=1791591713;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/T777lhuRfNwSeNxFtz2iSXI/VIM8j8xuLCcKpt+bw=;
        b=AquDuh7vQdcOcq/awBFBdbRJl7F/z1iOlw2cZx9yWeHRGzjxc3Yceumc/BFsnts8Gx
         yvSMxZW3X6n8bDJODN1zDeR9j7BQFKAcnWyEYy7KsnckyIGRqTW1rrfcyn4NRSFpa99b
         16fENc04X8CTJbLk8WukQdgr80VZoDLIcx+/UpOoI1q+wmlHOQPKph9xwAn5+lR4R+vT
         xCAhIMvJtWpPaVY698H52UU/UKkbFRn1kiWzBNYSYGMSI3z3TvBAQ2Rvp0G/dXIF4xp8
         j0AmIYrz/NM/vYKDqwfDAWwy/j+dndGkAEsnYsxNsWe9db3AgyRaSeMPFzRHX6qQfkS/
         RTow==
X-Forwarded-Encrypted: i=1; AKwUvByEplyQBK0ygi3zlf5w91fw9qdtv+aYDDGOyuVgoYYCnh6cPk6MA1uGy8AiySDzghuYw2i+G13iXQO43XYFPmof@lists.infradead.org
X-Gm-Message-State: AFq9FYJghYhAZkpFdKNPuuPT7o8nNvejCZWlX8sNVS8g2IAo8leflOr+
	ijO+FOBCfL8pAj3d0pCQkD/hk5e1oCqwgpCljbOhldFfT6nRhnc+6xTGyvEFDg/toThO6U2H+Ie
	sjjOcVE8ewj+UrqMXvvew7g==
X-Received: from pjbdw15.prod.google.com ([2002:a17:90b:94f:b0:3a6:7ee4:e327])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:dfd0:b0:3a4:bc68:310e with SMTP id 98e67ed59e1d1-3a6ce7f684amr3283851a91.39.1790986912580;
 Fri, 02 Oct 2026 17:21:52 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:23 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-21-jthoughton@google.com>
Subject: [PATCH v2 20/20 DO-NOT-MERGE] selftests/mm: Add HVO pmd-split fault
 injection tests
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172156_211478_D7FC884C 
X-CRM114-Status: GOOD (  13.28  )
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

Run the stress test with PMD splitting failure injection enabled (if
supported). Keep in mind that vmemmap PMDs are only ever split, never
collapsed back to PMDs, so run this step first, before the main stress
test.

Assisted-by: LLM
Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
index 94357a4a45c2..2c874d15399a 100755
--- a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
+++ b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
@@ -4,13 +4,16 @@
 # Stress test for HugeTLB vmemmap optimization (HVO).
 #
 # Phases:
-#   1. accounting: allocate N hugepages, check that nr_memmap_pages +
+#   1. pmd-inject: churn the pool with fail_hugetlb_vmemmap_pmd enabled.
+#      Runs first because vmemmap PMDs are only split once, so later phases
+#      would leave few PMD splits to fail.
+#   2. accounting: allocate N hugepages, check that nr_memmap_pages +
 #      nr_memmap_boot_pages drops by exactly N * (vmemmap pages per folio - 1),
 #      then free them and check it returns to the baseline.
-#   2. stress: churn the pool (optimize/restore) while concurrently reading
+#   3. stress: churn the pool (optimize/restore) while concurrently reading
 #      struct pages (/proc/kpageflags, /proc/kpagecount), compacting memory,
 #      and optionally reading page_owner and offlining/onlining memory.
-#   3. pte-inject: like 2, with fail_hugetlb_vmemmap_pte enabled; this hits
+#   4. pte-inject: like 2, with fail_hugetlb_vmemmap_pte enabled; this hits
 #      both the optimize rollback and the restore (partial HVO) paths.
 #
 # After each phase the pool is drained back to its original size, memmap
@@ -252,7 +255,7 @@ cleanup() {
 	local blk t
 
 	stop_workers
-	for t in fail_hugetlb_vmemmap_pte; do
+	for t in fail_hugetlb_vmemmap_pte fail_hugetlb_vmemmap_pmd; do
 		[ -d "$(fa_dir $t)" ] && fa_disable $t > /dev/null
 	done
 	if [ -f "$tmpdir/hotplug" ]; then
@@ -333,6 +336,7 @@ accounting_phase() {
 
 echo "$marker" > /dev/kmsg
 
+stress_phase pmd-inject fail_hugetlb_vmemmap_pmd
 accounting_phase
 stress_phase stress ""
 stress_phase pte-inject fail_hugetlb_vmemmap_pte
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


