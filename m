Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23BCC98315
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 02:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaMiUMglehvqssUcziIH5Hq2M7vEcCaUT0xnjZYkIcg=; b=dLLKnD1+9+yYxaUqYgHZfwY7GG
	oFZecHnVx00AYMx75zuvY/XUgA1QtzH8VBKtCDCveKxNsi0ksJDjzCQ0Cfz1BvxPUEXnmRaGKJzVt
	Fv2nNHDiBfXUll8TUR4uHpnGF3laW5v5Jk8zuExG68PknOGanp+Lu5iHgTkQ91D1kBh2GRVRBuIe5
	YSa4rACZlH2Lq8AGuDaz2Wwbd35yYu+KYUt0KdJN0I57/1CNk4bj5JVB+8fhT/kTv5u3clBQtvaKC
	whVSy0mGeJs3AxsCI3gHKTY+R4AIxJ6buaJ0ln8k5k/QvIaielOw4fdCnNYUzb+NYQgEYnp9x+IdH
	OI+f7LZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhf3N-00000001GZI-0Gt3;
	Mon, 19 Jan 2026 02:31:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhf3L-00000001GYW-3Z0P
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 02:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XaMiUMglehvqssUcziIH5Hq2M7vEcCaUT0xnjZYkIcg=; b=TNqORRaDc3hO2VyS8si5XKGN1S
	hWAPUKFvMlftO9Xwrk8cvPv3NJvISqqUz9tb74cbkIHM6dWSxrqwcfZT5PL6XTjFp2ev7d0qP/F1I
	QXt0K1EQRstF5VeDYtzwcWEclAs34tPHY1uj7RZkKZdlJXLHPDWl/eLt0LO0Y6msZM0IQ0i1wNC6F
	UxQB68Rms2Itwbe8KPRDLdcUUM8SVZQE8JRJQYtN9eU99rlrOgknuWgk/NJ5ChvIqr/3iA5TTC2Nf
	3c3pwahAQA5YdTwDQy8RJKq4v0jr25ZvhQORZMAMNheAOCr7+3kHFbaFWezftjn4PqB8QXnVmC/XH
	tnuc8NRg==;
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhf3H-0000000BHE0-2uBY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 02:31:38 +0000
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4dvZB11h0pzRhsn;
	Mon, 19 Jan 2026 10:27:53 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id E3F2B40588;
	Mon, 19 Jan 2026 10:31:15 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 19 Jan 2026 10:31:02 +0800
Received: from huawei.com (10.90.31.46) by kwepemq200004.china.huawei.com
 (7.202.195.237) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Jan
 2026 10:31:01 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <arnd@arndb.de>, <joey.gouly@arm.com>,
	<suzuki.poulose@arm.com>, <yuzenghui@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<yangyccccc@gmail.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v8 RESEND 7/7] kselftest/arm64: Add HWCAP test for FEAT_LS64
Date: Mon, 19 Jan 2026 10:29:28 +0800
Message-ID: <20260119022928.149358-8-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20260119022928.149358-1-wangzhou1@hisilicon.com>
References: <20260119022928.149358-1-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_023136_789391_6FE8FCCC 
X-CRM114-Status: GOOD (  14.41  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Add tests for FEAT_LS64. Issue related instructions if feature
presents, no SIGILL should be received. When such instructions
operate on Device memory or non-cacheable memory, we may received
a SIGBUS during the test (w/o FEAT_LS64WB). Just ignore it since
we only tested whether the instruction itself can be issued as
expected on platforms declaring the support of such features.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 49 +++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index c41640f18e4e..9d2df1f3e6bb 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -11,6 +11,8 @@
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
+#include <linux/auxvec.h>
+#include <linux/compiler.h>
 #include <sys/auxv.h>
 #include <sys/prctl.h>
 #include <asm/hwcap.h>
@@ -595,6 +597,45 @@ static void lrcpc3_sigill(void)
 	              : "=r" (data0), "=r" (data1) : "r" (src) :);
 }
 
+static void ignore_signal(int sig, siginfo_t *info, void *context)
+{
+	ucontext_t *uc = context;
+
+	uc->uc_mcontext.pc += 4;
+}
+
+static void ls64_sigill(void)
+{
+	struct sigaction ign, old;
+	char src[64] __aligned(64) = { 1 };
+
+	/*
+	 * LS64 requires target memory to be Device/Non-cacheable (if
+	 * FEAT_LS64WB not supported) and the completer supports these
+	 * instructions, otherwise we'll receive a SIGBUS. Since we are only
+	 * testing the ABI here, so just ignore the SIGBUS and see if we can
+	 * execute the instructions without receiving a SIGILL. Restore the
+	 * handler of SIGBUS after this test.
+	 */
+	ign.sa_sigaction = ignore_signal;
+	ign.sa_flags = SA_SIGINFO | SA_RESTART;
+	sigemptyset(&ign.sa_mask);
+	sigaction(SIGBUS, &ign, &old);
+
+	register void *xn asm ("x8") = src;
+	register u64 xt_1 asm ("x0");
+
+	/* LD64B x0, [x8] */
+	asm volatile(".inst 0xf83fd100" : "=r" (xt_1) : "r" (xn)
+		     : "x1", "x2", "x3", "x4", "x5", "x6", "x7");
+
+	/* ST64B x0, [x8] */
+	asm volatile(".inst 0xf83f9100" : : "r" (xt_1), "r" (xn)
+		     : "x1", "x2", "x3", "x4", "x5", "x6", "x7");
+
+	sigaction(SIGBUS, &old, NULL);
+}
+
 static const struct hwcap_data {
 	const char *name;
 	unsigned long at_hwcap;
@@ -1134,6 +1175,14 @@ static const struct hwcap_data {
 		.hwcap_bit = HWCAP3_MTE_STORE_ONLY,
 		.cpuinfo = "mtestoreonly",
 	},
+	{
+		.name = "LS64",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_LS64,
+		.cpuinfo = "ls64",
+		.sigill_fn = ls64_sigill,
+		.sigill_reliable = true,
+	},
 };
 
 typedef void (*sighandler_fn)(int, siginfo_t *, void *);
-- 
2.33.0


