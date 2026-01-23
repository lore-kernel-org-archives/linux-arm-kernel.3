Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29AED6CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 04:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAuOGsHby8jKz+wNlJVEkQ7RKZ8BWpuU6GLH7qC1WM4=; b=jwIMtDzYQrik0wynsr1DsSH2pg
	fR9luqO4TjLGl8nqko83StOlo6lf8Qx1Qp/9nlYXyZY8w6Sp4IAj1Kxzo/WN8BmIR1TUzy4i7SqeZ
	GnBM1QFdS07+YRG7dt8pEHJO+pHhdWKpa3lQKJp4W3AWQ9GDPSnoI8ms0BQwp0QkZTX6U4iU2fXxR
	fQJpZcpTZyRrFewL3JL8NQJU8h9SJMyaNdyGFgIKzsnJpxapQ76/xv7KqC1UhEUg9FDZl1VZc6M/Y
	N6mt5lRc+fdMwvpjwIIDiRQxvf1gJ5QO/WyEouBfMzNLOAY5/HWeVYAmvJA6KQhqJOUQ866gETu5+
	xxLyF4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8tO-00000008CjB-10se;
	Fri, 23 Jan 2026 04:35:30 +0000
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8tI-00000008CgG-1Br0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 04:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142922; x=1800678922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jSzi3osQGXYel0AVxMTyFvIA70HNOFE1gzNweLFqOzo=;
  b=kZjZue/hwBcplGesYowBry2ojhC4qLqPeIEzXRS0K/4cAq0adf+zo1p3
   5tFrVr3tzqmaAmSU4Gm8e598cPEt3qmdH4LpaiObHdDd/mMbU9g9COajo
   7Ni+tHXp26BLRbTNsFWkQmk7RYGs1h2vHib9WKkJwhp1DJj+MCklPJLXs
   4w2uGG9+P0V0yx4DLPnsfPJ77LWPw9JL3DYHtAd4FGHnjop227uaqrGf7
   B1rDC786FZRZuxRqnYOIbJ2JN/o/TVD9JO2CK5PWl1hgAr7qhrq91mvIO
   1V8NKzAHIFCNfD7pjKSRYblhTqhQLykdrmZE/d5s4h+tz8Gp8+5p25t7u
   w==;
X-CSE-ConnectionGUID: Wnx53IiARsK6g9ooiQRmfg==
X-CSE-MsgGUID: ehM2WAljRlS7gWKpfIU+lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="215388597"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="215388597"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:21 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 838EC4DD2
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:22 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3D0201C135E4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:22 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2EB7C1001523;
	Fri, 23 Jan 2026 04:35:17 +0000 (UTC)
From: Shaopeng Tan <tan.shaopeng@fujitsu.com>
To: fenghuay@nvidia.com,
	reinette.chatre@intel.com,
	ben.horgan@arm.com,
	james.morse@arm.com,
	shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tan.shaopeng@fujitsu.com
Subject: [RFC PATCH 5/5] kselftests/resctrl: Add support for CAT test on ARM
Date: Fri, 23 Jan 2026 13:40:31 +0900
Message-ID: <20260123044034.141247-6-tan.shaopeng@fujitsu.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_203524_594111_33F74305 
X-CRM114-Status: GOOD (  12.25  )
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

Currently, CAT test is limited to Intel architectures.
Add cache cleaning and enable result checking for Arm architectures.

Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
---
 tools/testing/selftests/resctrl/cat_test.c | 2 +-
 tools/testing/selftests/resctrl/fill_buf.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index e1b30ab4cef5..58b1590695d1 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -113,7 +113,7 @@ static int check_results(struct resctrl_val_param *param, const char *cache_type
 		ret = show_results_info(sum_llc_perf_miss, bits,
 					alloc_size / 64,
 					MIN_DIFF_PERCENT_PER_BIT * (bits - 1),
-					runs, get_vendor() == ARCH_INTEL,
+					runs, (get_vendor() == ARCH_INTEL || get_vendor() == ARCH_ARM),
 					&prev_avg_llc_val);
 		if (ret)
 			fail = 1;
diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
index 19a01a52dc1a..dbbf80d22f42 100644
--- a/tools/testing/selftests/resctrl/fill_buf.c
+++ b/tools/testing/selftests/resctrl/fill_buf.c
@@ -35,6 +35,10 @@ static void cl_flush(void *p)
 #if defined(__i386) || defined(__x86_64)
 	asm volatile("clflush (%0)\n\t"
 		     : : "r"(p) : "memory");
+#elif defined(__aarch64__)
+	__asm__ __volatile__("dc civac, %0\n\t"
+		     : : "r" (p) : "memory");
+
 #endif
 }
 
-- 
2.47.3


