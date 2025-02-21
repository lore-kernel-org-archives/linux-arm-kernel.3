Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884E1C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoLUK2kiH6LhpkhM1d4olRTr16QRL80FgGNSdZLS3/8=; b=Ovf68loe3ty6c7NMI95/yPoLus
	YfAuYmdcH5G9zvKE+AP+PxLguaacIf8FIqVRyRedW/V1pXnXFeQZ+BGd2bB22aGF2m0BAo38+h6VJ
	Zo1FbC8CtMoxVLOX6Fy+ya9GhnsP5MnB5VAd+5AAWbaUR+aVwR4dpsjvuQjrbiGiWnluRW+KXChSi
	E7OgYgFbDZ17+FpyGhpCNKLh9T4+ZYeyALVyMPUFCYv8WFa0eoZWhq7LQuatUynH+XFRB1ij/ETpa
	FMtV3jqpi3wZX9pwxPmkxIamfbucWTCt/ZJ/145YhIOqVjG2jBIXJEdoxtvTx7/tBkSRrCG2c4Dqq
	eadrb5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPgF-0000000516m-2jPZ;
	Fri, 21 Feb 2025 09:50:47 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPPf-00000004wwp-2Pj9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB732611C8;
	Fri, 21 Feb 2025 09:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E015C4CED6;
	Fri, 21 Feb 2025 09:33:37 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 2/2] kselftest/arm64: mte: Skip the hugetlb tests if MTE not supported on such mappings
Date: Fri, 21 Feb 2025 09:33:31 +0000
Message-Id: <20250221093331.2184245-3-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250221093331.2184245-1-catalin.marinas@arm.com>
References: <20250221093331.2184245-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

While the kselftest was added at the same time with the kernel support
for MTE on hugetlb mappings, the tests may be run on older kernels. Skip
the tests if PROT_MTE is not supported on MAP_HUGETLB mappings.

Fixes: 27879e8cb6b0 ("selftests: arm64: add hugetlb mte tests")
Cc: Yang Shi <yang@os.amperecomputing.com>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 .../selftests/arm64/mte/check_hugetlb_options.c       | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
index 11f812635b51..3bfcd3848432 100644
--- a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
+++ b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
@@ -227,6 +227,8 @@ static int check_child_hugetlb_memory_mapping(int mem_type, int mode, int mappin
 int main(int argc, char *argv[])
 {
 	int err;
+	void *map_ptr;
+	unsigned long map_size;
 
 	err = mte_default_setup();
 	if (err)
@@ -243,6 +245,15 @@ int main(int argc, char *argv[])
 		return KSFT_FAIL;
 	}
 
+	/* Check if MTE supports hugetlb mappings */
+	map_size = default_huge_page_size();
+	map_ptr = mmap(NULL, map_size, PROT_READ | PROT_MTE,
+		       MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
+	if (map_ptr == MAP_FAILED)
+		ksft_exit_skip("PROT_MTE not supported with MAP_HUGETLB mappings\n");
+	else
+		munmap(map_ptr, map_size);
+
 	/* Set test plan */
 	ksft_set_plan(12);
 

