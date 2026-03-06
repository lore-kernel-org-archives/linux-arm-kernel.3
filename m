Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0B4FCC056
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 18:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fnWuRxHcCGvGhNymiZT7ueTTS+IKhMzxIbQZV3svhA=; b=noRq6RcSZRjZn24HA/oUfR3vTL
	ijpQNsJaMGxsTe+qw/2MM7f3PxQmxarru4ALlZLjK31rTh12qZHUIeOewW11GgL9Q+NC9Sw4eYqQI
	Sr3cPgC1OHuhBaEZ/oRzg6D4t8xRNaJwvS/DGtHSZ33oMGLqpBGW39obRSCurmdBnz96Nd0iBYVSr
	NYf5/WTv5jG37FDcg6Thtp8HNiUPXT6INbVFRqGi1JLFvELcLaLxdAUEtRE/OD4uf+ELBgapE+L9T
	mroioaFKWoddoipF3ZT4s4EhKHl3xtsxfVvXpmiYT65NbnFqfZTjT8jQGHYtlD2HS9KqvWrMe2ocB
	CP1ieO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZtm-00000004K2z-0dnW;
	Fri, 06 Mar 2026 18:27:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZtj-00000004K1Q-28rE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 18:27:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA2B9497;
	Fri,  6 Mar 2026 10:27:31 -0800 (PST)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA0C53F7BD;
	Fri,  6 Mar 2026 10:27:36 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Ben Horgan <ben.horgan@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	kernel test robot <lkp@intel.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 3/3] arm_mpam: Force __iomem casts
Date: Fri,  6 Mar 2026 18:27:18 +0000
Message-ID: <20260306182718.150569-4-james.morse@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306182718.150569-1-james.morse@arm.com>
References: <20260306182718.150569-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_102739_593693_3653F4B8 
X-CRM114-Status: GOOD (  11.12  )
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Code allocates standard kernel memory to pass to the MPAM, which expects
__iomem.  The code is safe, because __iomem accessors should work fine
on kernel mapped memory, however leads to sparse warnings:

  test_mpam_devices.c:327:42: warning: incorrect type in initializer (different address spaces)
  test_mpam_devices.c:327:42:    expected char [noderef] __iomem *buf
  test_mpam_devices.c:327:42:    got void *
  test_mpam_devices.c:342:24: warning: cast removes address space '__iomem' of expression

Cast the pointer to memory via __force to silence them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512160133.eAzPdJv2-lkp@intel.com/
Acked-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/test_mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
index 75bd41bcc395..31871f519729 100644
--- a/drivers/resctrl/test_mpam_devices.c
+++ b/drivers/resctrl/test_mpam_devices.c
@@ -332,7 +332,7 @@ static void __test_mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
 
 static void test_mpam_reset_msc_bitmap(struct kunit *test)
 {
-	char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
+	char __iomem *buf = (__force char __iomem *)kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
 	struct mpam_msc fake_msc = {};
 	u32 *test_result;
 
@@ -347,7 +347,7 @@ static void test_mpam_reset_msc_bitmap(struct kunit *test)
 	mutex_init(&fake_msc.part_sel_lock);
 	mutex_lock(&fake_msc.part_sel_lock);
 
-	test_result = (u32 *)(buf + MPAMCFG_CPBM);
+	test_result = (__force u32 *)(buf + MPAMCFG_CPBM);
 
 	__test_mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 0);
 	KUNIT_EXPECT_EQ(test, test_result[0], 0);
-- 
2.51.0


