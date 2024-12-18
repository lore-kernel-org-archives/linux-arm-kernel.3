Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00140E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ek1bSpTwItKNd3Ic8QlEpJYptCCTpK1qsHK9ezTvxFU=; b=k3aRLrsI1/H3UPv1QJCTu9Vg7i
	qSVQ6/dTH9gJsY23CuTOLnIUWxToiIvyMQT2pnge6hYNJtEedQN+M14EZt8MUHeCHZnguJWRaaoQK
	lh5RvZgqHQAB6LXM3CfywzCWjOKEGutG/7PD2pW6CxN+jlc11j3wB6CJd0cdMT6FjGpj0XCzu+y1+
	ZbcIBg9FKHDM0n7Soge61UEUiXRIfvyDb9vm7rRpu3J4tcFpWWS5/qTPYNhIGgaMoPGz2QGyjsSKn
	cxfRMKldlwV8u0EbaKzvjsMYUMRYrypa264mZ1WTt4nkqWXRx+57k5BTS/wX1MOjqNFUi09pA/Xbn
	vmSzBevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwEn-0000000H4Fs-0o4z;
	Wed, 18 Dec 2024 15:45:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNw6E-0000000H2Z9-2Kpf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:36:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D04C497;
	Wed, 18 Dec 2024 07:36:59 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D82623F7B4;
	Wed, 18 Dec 2024 07:36:28 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	kernel test robot <lkp@intel.com>,
	aruna.ramakrishna@oracle.com,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH] selftests/mm: Fix -Wnull-dereference on Clang
Date: Wed, 18 Dec 2024 15:36:15 +0000
Message-ID: <20241218153615.2267571-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-5-kevin.brodsky@arm.com>
References: <20241209095019.1732120-5-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_073634_636119_0F95031A 
X-CRM114-Status: GOOD (  14.15  )
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

Dereferencing a null pointer on Clang is not a good idea - it will
entirely optimise out the dereference. Make the pointer volatile to
force the access (and fault).

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412140850.4TW4YBqc-lkp@intel.com/
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---

Hi Andrew,

Another fixup for an issue reported by the LKP CI (building with Clang
instead of GCC). This should be squashed into the patch I'm replying to:
"selftests/mm: Fix -Warray-bounds warnings in pkey_sighandler_tests"

Cheers,
- Kevin

Cc: aruna.ramakrishna@oracle.com
Cc: catalin.marinas@arm.com
Cc: dave.hansen@linux.intel.com
Cc: joey.gouly@arm.com
Cc: keith.lucas@oracle.com
Cc: ryan.roberts@arm.com
Cc: shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: x86@kernel.org
---
 tools/testing/selftests/mm/pkey_sighandler_tests.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index 17bbfcd552c6..1ac8c8809880 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -161,7 +161,7 @@ static void *thread_segv_with_pkey0_disabled(void *ptr)
 	__write_pkey_reg(pkey_reg_restrictive_default());
 
 	/* Segfault (with SEGV_MAPERR) */
-	*(int *)NULL = 1;
+	*(volatile int *)NULL = 1;
 	return NULL;
 }
 
@@ -192,7 +192,7 @@ static void *thread_segv_maperr_ptr(void *ptr)
 	__write_pkey_reg(pkey_reg);
 
 	/* Segfault */
-	*(int *)NULL = 1;
+	*(volatile int *)NULL = 1;
 	syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
 	return NULL;
 }
-- 
2.47.0


