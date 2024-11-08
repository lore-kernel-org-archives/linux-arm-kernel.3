Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE64D5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2n/TJCTp331aXu2D65MmKVXNw3ybHqKVAzwIeO+CMdM=; b=0HziHRa5hL4Bf8mSpODvUXQnw+
	sHMpansYlpb5TXh00KdULOjrKLFKDeF6Bcm0ju9oQkS8dgW/aPeleGGCyytm7IfU/jOYzleFGkmuS
	3dajJMBxsUJTXmJd6deElJDiJ4K3fqtPIOxnyXbUvOktUTVW/zcJ/SSnkGWLPKZCP7VZ8KvtaqfkO
	PtD2kqnCZQlOgynb8uUtw/i9e/v4TXhaDGByUZ7rOZB4divJLS5dfRgGvohaz8uwEQUnsdjeomF4o
	6xeT42VIqhCBO6NjDk24Ju9sDgrS++CX13tSGJNuWH+l2xyrSzw4IHWYlaxPvjTpjjyyV6pNV9CGL
	12WsJG1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PVP-0000000AmGs-3Za4;
	Fri, 08 Nov 2024 13:58:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PMh-0000000AkPx-0DS8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:49:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9A1DDA43ACB;
	Fri,  8 Nov 2024 13:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8748C4CED7;
	Fri,  8 Nov 2024 13:49:28 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 4/4] kselftest/arm64: Fix compilation of SME instructions in the arm64 fp tests
Date: Fri,  8 Nov 2024 13:49:20 +0000
Message-Id: <20241108134920.1233992-5-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108134920.1233992-1-catalin.marinas@arm.com>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_054931_220935_FBA1CB0A 
X-CRM114-Status: UNSURE (   9.02  )
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

SMSTOP/SMSTART require the SME arch extension for the assembler. Add
'.arch_extension sme' to za-test.S and zt-test.S.

Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 tools/testing/selftests/arm64/fp/za-test.S | 1 +
 tools/testing/selftests/arm64/fp/zt-test.S | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index f902e6ef9077..9ebeab6ce5c0 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -16,6 +16,7 @@
 #include "sme-inst.h"
 
 .arch_extension sve
+.arch_extension sme
 
 #define MAXVL     2048
 #define MAXVL_B   (MAXVL / 8)
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index c96cb7c2ad4b..ad550463d31d 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -12,6 +12,7 @@
 #include "sme-inst.h"
 
 .arch_extension sve
+.arch_extension sme
 
 #define ZT_SZ	512
 #define ZT_B	(ZT_SZ / 8)

