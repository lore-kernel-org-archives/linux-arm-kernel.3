Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259BEC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsZ0DZi17ldtcLE4tcHGLrTacY5Ss52JYGTyctr549g=; b=0mfwuizoSWN6UF+3EWYu2QoHwQ
	oAGKRe/4MWH0K7Mu8DDE0CBEXbByzT25piHcd44P9uaYA2tMhHh+MRFy9iV5dPvrzCysEKLuLA7Am
	4rbWKPAM/0D6zzGvnf0DYOuFSBHjbBgGdagoEidvfOclT1S48xydDFFa+ViNkvaxEtRHyLBVCge/U
	r8sXVzAxbDU1PXqvbdw1GLmKfe0Wx5YhPx95JfkZK2AvnZ0bDSRnVaqrnI+LlWFCWdfr6UqdcK/tJ
	M8DGfxSZGfNDSCIQNz4jK1ecbs71Zw21pcUjCYsAzfai0HhZWlNhSDcqT9af8cV4Nqw2dNf6EXmJ8
	9n8DJxFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPej-000000050kV-45QE;
	Fri, 21 Feb 2025 09:49:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPPd-00000004wwI-45eH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49C7E5C55B4;
	Fri, 21 Feb 2025 09:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DD2C4CEDD;
	Fri, 21 Feb 2025 09:33:35 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 1/2] kselftest/arm64: mte: Use the correct naming for tag check modes in check_hugetlb_options.c
Date: Fri, 21 Feb 2025 09:33:30 +0000
Message-Id: <20250221093331.2184245-2-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250221093331.2184245-1-catalin.marinas@arm.com>
References: <20250221093331.2184245-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_013338_075412_E8E3392C 
X-CRM114-Status: UNSURE (   8.51  )
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

The architecture doesn't define precise/imprecise MTE tag check modes,
only synchronous and asynchronous. Use the correct naming and also
ensure they match the MTE_{ASYNC,SYNC}_ERR type.

Fixes: 27879e8cb6b0 ("selftests: arm64: add hugetlb mte tests")
Cc: Yang Shi <yang@os.amperecomputing.com>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 tools/testing/selftests/arm64/mte/check_hugetlb_options.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
index 303260a6dc65..11f812635b51 100644
--- a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
+++ b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
@@ -270,13 +270,13 @@ int main(int argc, char *argv[])
 	"Check clear PROT_MTE flags with private mapping and sync error mode and mmap/mprotect memory\n");
 
 	evaluate_test(check_child_hugetlb_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE | MAP_HUGETLB),
-		"Check child hugetlb memory with private mapping, precise mode and mmap memory\n");
+		"Check child hugetlb memory with private mapping, sync error mode and mmap memory\n");
 	evaluate_test(check_child_hugetlb_memory_mapping(USE_MMAP, MTE_ASYNC_ERR, MAP_PRIVATE | MAP_HUGETLB),
-		"Check child hugetlb memory with private mapping, precise mode and mmap memory\n");
+		"Check child hugetlb memory with private mapping, async error mode and mmap memory\n");
 	evaluate_test(check_child_hugetlb_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE | MAP_HUGETLB),
-		"Check child hugetlb memory with private mapping, precise mode and mmap/mprotect memory\n");
+		"Check child hugetlb memory with private mapping, sync error mode and mmap/mprotect memory\n");
 	evaluate_test(check_child_hugetlb_memory_mapping(USE_MPROTECT, MTE_ASYNC_ERR, MAP_PRIVATE | MAP_HUGETLB),
-		"Check child hugetlb memory with private mapping, precise mode and mmap/mprotect memory\n");
+		"Check child hugetlb memory with private mapping, async error mode and mmap/mprotect memory\n");
 
 	mte_restore_setup();
 	free_hugetlb();

