Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EDDFEFB5F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9Bh9D4dZfCmswtYoYNWndxYXeH/2BHsrOjRd5CN/mQ=; b=gE6poVRibCANNoonqvCfxHvGVG
	RTzdGD11pP2+PD9hTCRxlDAmTXhzgpO7VfSoVsE42vzEmI2vK0xrgswpOvNmcIZPks1doE9U46W7+
	AAtwOq1WZy2vfZ/hissee2BQx8Pn7O4eclb0QYpRLRnnQm+0+DxtdH4dptUnTfX1WKl/n53rywq2V
	ik/FQz8ofeWCniwnfs2po4wulQ+IQ5fyYREVICQK7vEpi4kPZlscKdACI8CUJxA6lfptKpLhALgij
	0mFz16/rGWTefg6URTwp/CwGvUYLOJtsTcYIKS+OTIMRIM+LMQFxsS6fqc7HvpZ9Pr1/uHCnhmU0B
	QHa6XWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzbM-00000008a3O-3vMH;
	Fri, 27 Feb 2026 15:18:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzbI-00000008a03-391h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:17:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7FF4339;
	Fri, 27 Feb 2026 07:17:48 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 512BC3F73B;
	Fri, 27 Feb 2026 07:17:52 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	miko.lenczewski@arm.com,
	kevin.brodsky@arm.com,
	broonie@kernel.org,
	ardb@kernel.org,
	suzuki.poulose@arm.com,
	lpieralisi@kernel.org,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	yeoreum.yun@arm.com
Subject: [PATCH v15 6/8] arm64: armv8_deprecated: disable swp emulation when FEAT_LSUI present
Date: Fri, 27 Feb 2026 15:17:03 +0000
Message-Id: <20260227151705.1275328-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227151705.1275328-1-yeoreum.yun@arm.com>
References: <20260227151705.1275328-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_071756_818640_B69337AD 
X-CRM114-Status: GOOD (  10.42  )
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

The purpose of supporting LSUI is to eliminate PAN toggling.
CPUs that support LSUI are unlikely to support a 32-bit runtime.
Since environments that support both LSUI and
a 32-bit runtimeare expected to be extremely rare,
not to emulate the SWP instruction using LSUI instructions
in order to remove PAN toggling, and instead simply disable SWP emulation.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kernel/armv8_deprecated.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/kernel/armv8_deprecated.c b/arch/arm64/kernel/armv8_deprecated.c
index e737c6295ec7..049754f7da36 100644
--- a/arch/arm64/kernel/armv8_deprecated.c
+++ b/arch/arm64/kernel/armv8_deprecated.c
@@ -610,6 +610,22 @@ static int __init armv8_deprecated_init(void)
 	}
 
 #endif
+
+#ifdef CONFIG_SWP_EMULATION
+	/*
+	 * The purpose of supporting LSUI is to eliminate PAN toggling.
+	 * CPUs that support LSUI are unlikely to support a 32-bit runtime.
+	 * Since environments that support both LSUI and a 32-bit runtime
+	 * are expected to be extremely rare, we choose not to emulate
+	 * the SWP instruction using LSUI instructions in order to remove PAN toggling,
+	 * and instead simply disable SWP emulation.
+	 */
+	if (cpus_have_final_cap(ARM64_HAS_LSUI)) {
+		insn_swp.status = INSN_UNAVAILABLE;
+		pr_info("swp/swpb instruction emulation is not supported on this system\n");
+	}
+#endif
+
 	for (int i = 0; i < ARRAY_SIZE(insn_emulations); i++) {
 		struct insn_emulation *ie = insn_emulations[i];
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


