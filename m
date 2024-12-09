Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BD7E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPrNqYZIVPL79Qc1TOF3mtxorgRM38fEG2ZYgHTWBPY=; b=RD6NC0L6C7kajUtivL8G4hPVn5
	oHFTWsqKDk5f9b3m8rDWFbufh3XxS0TceKQM6Itn43yx66xDiTWSi1Pf62uY69C1J0y+SZ+g/ritj
	Y+UybDbJyfQE0ufuwlsFI+HKWivoPI7s4G5uU+yQNGcQ31oRxkoG+U0HGkUHdhnuz2u0GjQ01plvc
	LZkU3dhPEAJKTt4TlstylfYiSw9PcMd73Ef3xu2u8YbtsTiiFqSeLjrn/iDDBC7RVadQ7OWCH5pvN
	bazgChGxAHUa8juPwTHCNuTdzIrAGGBg+aD/QOdF1emIZgPwc3pBCxaTxRAp1fX68JUd4570QiARq
	ahJ6jPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKabk-00000007CXi-1b7I;
	Mon, 09 Dec 2024 10:03:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPn-000000079Nm-2qom
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:50:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 664AB113E;
	Mon,  9 Dec 2024 01:51:23 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CC003F720;
	Mon,  9 Dec 2024 01:50:53 -0800 (PST)
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
Subject: [PATCH 07/14] selftests/mm: Define types using typedef in pkey-helpers.h
Date: Mon,  9 Dec 2024 09:50:12 +0000
Message-ID: <20241209095019.1732120-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-1-kevin.brodsky@arm.com>
References: <20241209095019.1732120-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015055_761088_9C291DBD 
X-CRM114-Status: UNSURE (   7.40  )
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

Using #define to define types should be avoided. Use typedef
instead. Also ensure that __u* types are actually defined by
including <linux/types.h>.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pkey-helpers.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index 472febd992eb..84376ab09545 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -13,13 +13,15 @@
 #include <ucontext.h>
 #include <sys/mman.h>
 
+#include <linux/types.h>
+
 #include "../kselftest.h"
 
 /* Define some kernel-like types */
-#define  u8 __u8
-#define u16 __u16
-#define u32 __u32
-#define u64 __u64
+typedef __u8	u8;
+typedef __u16	u16;
+typedef __u32	u32;
+typedef __u64	u64;
 
 #define PTR_ERR_ENOTSUP ((void *)-ENOTSUP)
 
-- 
2.47.0


