Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BA7D6CFBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 04:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=763Y8wgxqOBpiI5BJtrJdLWUubpBorJVhhtkTNUdHAk=; b=3yYxzEuCOEToFRv7AUlfIxtjAz
	OJpVsgjoJsHP6uBvAT8vG13BYtvSOc+otbeBqvM9W0PKNMCEOkoPdV8MKvrAyMtNMEcbtrK+PbV45
	J4POGA3RVgChn7jvwSfIBkggsib4nC85LNrz6+ITjLYNkfeOIo1uYoxRh9Eb85rH7r9YicQD0Z5QB
	PoRSpibFQxs8AdsqP4HHjnHoh8MnGhJhMfv09I4moZFPyXKUb6+HTy3ckBVfaqt/Cz5rQUAiFMbSn
	5oZJND/bhB+nidmTaD49EUMz4poSLfQxLdU9+l6Z8CxB1X2RZB9QYe04Vwigy0g739mjKcMKJO6BV
	zZfHX5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8tN-00000008Cio-3s0a;
	Fri, 23 Jan 2026 04:35:29 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8tG-00000008Cfi-0V3e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 04:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142921; x=1800678921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1gu0totriDn1ozYhHhCpCH4EjVldmns4h+Ibq/ykI7s=;
  b=g5tM6XFBhxL4Mj7MmA7hEjurvnMW/eT5/zBTYFHDEoaRX0vSOpK/lFkH
   LFjqE1Ww1YKGm9TAvpABLXijDOZrfNWcEzwHgnkqwAJDpDCPLLccPIxoW
   Ss6gqabWRDf9bNRWRlTJa/o/z5KlZHNCBM7syUs3hn9EQMp41HlLlNVu/
   8aDdu2Q/sbgpnGwV71E7FqnbiJLS9lV9ZFk2gr2VmWhuHaRxjLJ/gcmo2
   7wykvaThH5zqWbazObDgf3qiH3BRu6FQxYpVr3ACdAbuuYF5QFYnj8B2o
   DFzlfK1YclA8QO9ZZu6Jo9FjGK/BrsQ9FYQLeAKXO/c1aMvkFHWY15OhF
   w==;
X-CSE-ConnectionGUID: iOrMwuO5Q/K8s39bi6rfLg==
X-CSE-MsgGUID: hRuVECCIRSaM+N5Aj3eNIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="230841956"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="230841956"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:18 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 56A89100036C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:19 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0E4EB1009E26
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:19 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E280F1001536;
	Fri, 23 Jan 2026 04:35:14 +0000 (UTC)
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
Subject: [RFC PATCH 4/5] kselftests/resctrl: set shareable_mask to zero if all bits are shared between software and hardware
Date: Fri, 23 Jan 2026 13:40:30 +0900
Message-ID: <20260123044034.141247-5-tan.shaopeng@fujitsu.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_203522_426688_395E37B5 
X-CRM114-Status: GOOD (  11.13  )
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

When all bits are shared between software and hardware, CAT test can not run.

In the case of MPAM driver, even if all bits are shared between
hardware and software, they can be used as if software-exclusive.

To enable CAT, if all bits are shared between hardware and software,
set shareable_mask to zero.

Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
---
 tools/testing/selftests/resctrl/resctrlfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index 195f04c4d158..4b9ee803a112 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -495,6 +495,8 @@ int get_mask_no_shareable(const char *cache_type, unsigned long *mask)
 		return -1;
 	if (get_shareable_mask(cache_type, &shareable_mask) < 0)
 		return -1;
+	if (full_mask == shareable_mask)
+		shareable_mask = 0;
 
 	len = count_contiguous_bits(full_mask & ~shareable_mask, &start);
 	if (!len)
-- 
2.47.3


