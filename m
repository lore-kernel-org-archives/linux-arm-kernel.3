Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23841C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoaVniN0arinq9TJLewHP27jkLDlQlxBJA98FNchSyA=; b=BE8O+f1/5rNGkbTfXv2RzPiR43
	pF8eGJL2C5gujKh1dSjWwHlzNJfKqyhkXDzrdcFd0kOVXo80pmvSlAGQFKq8cZ8KEMMdIMXS5X81k
	rBuFBuoXAf3GZFUebfWn1aON4fFz8a8k/uVrHwex7t1NnNT0H6artC/4xj34UYt75FbR0ZA9Qcx+Z
	OpZUERko09iw1LlgoT2swQsWeSUynQWTjfXzMw9/pvlvmD0Xr8qAF6JRDnPJi7Qj62kxJU5ZqNEi/
	vCnrvkV4ig9nRz065H7k4qTq1jXOYKT0xgIvYoJLV8nRDNY3aNW5D8z15q3w9TqBYTAhU6UqAPIHq
	+K4VMSZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSog-0000000BH9P-2xem;
	Wed, 11 Jun 2025 21:17:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPri-0000000Aq6V-0ABD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 18:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WoaVniN0arinq9TJLewHP27jkLDlQlxBJA98FNchSyA=; b=dLjzoXQBpZjnb38G937LrmrsIr
	w6Zo4YYo8cVeOU49vnkRt+YETNeABdn6Zv+E+SUd/t77Syc6D5mWdE/CRWNmP/xAhxRt6U2th+ifj
	MNIgYnlvVIxU+fcQ2xBhwRUUrOaxrv9tVgpAnMRA6UA0UPDwkSxmef86w87uPsU3JJwyjqtnOKwG0
	EnBnch9uGiOnOV4/QKEvEoJ+Qwhp6ygMgPCkil/arnMod3dI0/5VPAnJium9zUzYZjTeJW67G52oH
	V4KUPYiCIuL5DNalUl/6MPe/wAwEvreoKo2AuIfPefUVih2cEqT5MYxZrHQcmHt8rT1nmgl/8uER6
	TY/Y4SoA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPrf-00000002TPo-2PnJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 18:07:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F19E15A1;
	Wed, 11 Jun 2025 11:07:33 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 093643F673;
	Wed, 11 Jun 2025 11:07:50 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v8 5/9] kselftest/arm64/mte: check MTE_FAR feature is supported
Date: Wed, 11 Jun 2025 19:07:30 +0100
Message-Id: <20250611180734.63657-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611180734.63657-1-yeoreum.yun@arm.com>
References: <20250611180734.63657-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_190755_831251_468CC541 
X-CRM114-Status: GOOD (  10.82  )
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

To run the MTE_FAR test when cpu supports MTE_FAR feature,
check the MTE_FAR feature is supported in mte test.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/mte/mte_common_util.c | 4 ++++
 tools/testing/selftests/arm64/mte/mte_common_util.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index 83240b980f9c..5c5680a87498 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -26,6 +26,7 @@
 #define INIT_BUFFER_SIZE       256
 
 struct mte_fault_cxt cur_mte_cxt;
+bool mtefar_support;
 static unsigned int mte_cur_mode;
 static unsigned int mte_cur_pstate_tco;
 
@@ -325,12 +326,15 @@ int mte_switch_mode(int mte_option, unsigned long incl_mask)
 int mte_default_setup(void)
 {
 	unsigned long hwcaps2 = getauxval(AT_HWCAP2);
+	unsigned long hwcaps3 = getauxval(AT_HWCAP3);
 	unsigned long en = 0;
 	int ret;
 
 	if (!(hwcaps2 & HWCAP2_MTE))
 		ksft_exit_skip("MTE features unavailable\n");
 
+	mtefar_support = !!(hwcaps3 & HWCAP3_MTE_FAR);
+
 	/* Get current mte mode */
 	ret = prctl(PR_GET_TAGGED_ADDR_CTRL, en, 0, 0, 0);
 	if (ret < 0) {
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.h b/tools/testing/selftests/arm64/mte/mte_common_util.h
index 6b109e84fa39..4e1dd959df9b 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.h
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.h
@@ -37,6 +37,7 @@ struct mte_fault_cxt {
 };
 
 extern struct mte_fault_cxt cur_mte_cxt;
+extern bool mtefar_support;
 
 /* MTE utility functions */
 void mte_default_handler(int signum, siginfo_t *si, void *uc);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


