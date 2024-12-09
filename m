Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F82E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mPs3wye+bX06omYN6bcJnJM599UffflhhHId/XaClw=; b=YKYb/8RHO60ZQQ27UZczuFHVW0
	n6iApNRIhbxJuWWkn8jloww5RYPSdU7jRrbi0LOIKhyWPcVEh/Ci0B/m+HttQ3x2rjvyucRyxo2Al
	z+mleVQbFq2taqOEL6xvRes2Tn1dt3ifQmPuwiiLVRq6mkCDGALYMw/fj0BoKGM0grXu1Vd0oe5qB
	VsVMCglwkzauxZD4+gAtsNnzDDm8hYIX5KRpeiUSwTIBbmZAF4u/nZaMVhyfZoqnC7CrAIzs/IC4y
	yKEDfZLFEuYnq9Brzt0SYGlUz8w0AW5FKvq0HDAksLpawBr5uKbilhIgzbeVDtxDnieO2ScAmnOZi
	R45fgDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaVi-00000007BTF-35Rj;
	Mon, 09 Dec 2024 09:57:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPZ-000000079Bi-44i6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:50:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE5D0143D;
	Mon,  9 Dec 2024 01:51:09 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4ABF3F720;
	Mon,  9 Dec 2024 01:50:39 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	aruna.ramakrishna@oracle.com,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 01/14] selftests/mm: Fix condition in uffd_move_test_common()
Date: Mon,  9 Dec 2024 09:50:06 +0000
Message-ID: <20241209095019.1732120-2-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-1-kevin.brodsky@arm.com>
References: <20241209095019.1732120-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015042_049478_01B5C214 
X-CRM114-Status: GOOD (  12.16  )
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

area_src and area_dst are saved at the beginning of the function if
chunk_size > page_size. The intention is quite clearly to restore
them at the end based on the same condition, but step_size is
considered instead of chunk_size. Considering that step_size is a
number of pages, the condition is likely to be false.

Use the same condition as when saving so that the globals are
restored as intended.

Fixes: a2bf6a9ca805 ("selftests/mm: add UFFDIO_MOVE ioctl test")
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index a2e71b1636e7..74c884713bf7 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -1190,7 +1190,7 @@ uffd_move_test_common(uffd_test_args_t *targs, unsigned long chunk_size,
 				    nr, count, count_verify[src_offs + nr + i]);
 		}
 	}
-	if (step_size > page_size) {
+	if (chunk_size > page_size) {
 		area_src = orig_area_src;
 		area_dst = orig_area_dst;
 	}
-- 
2.47.0


