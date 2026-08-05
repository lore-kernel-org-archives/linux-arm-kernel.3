Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AA6C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 03:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NTcBSlM5LuKCDc9Ov6EpGoH7qPKq43ytKlh8zg6LOU8=; b=XX7j6tP8udBy7og5YUtdLMLhz8
	iV7ZSI79KbgcFxQOUlGHVyXQ44y7u3g324Ug+h+CadzS8c7NHQA53t295WdcZjThkmFzdXcdlPCv4
	27WrJVvppkJn+5gMGIoMss1/3PYNqWRsMlss9mBCDI05EV20b/D9gvCKWK4/fK7r0vYMbnwr9n8hR
	/4CMIt5K76n8onbeMzisv2lflmVgWXJOwgNIT3l+PP941/Mck5kGIzxfrEyZkCWNW+xJ4sO6fk5L8
	PMMHJDlxSIYRG5+uovNAG/ykVKx6YvwVPIj/v0eSuckyIpguW4G1beOZJXn9ICF+Yf3Ysp18HJmdL
	SOWpOLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSgs-00000003CCS-3hFP;
	Wed, 05 Aug 2026 03:53:14 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSgp-00000003CBh-0vfL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 03:53:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NTcBSlM5LuKCDc9Ov6EpGoH7qPKq43ytKlh8zg6LOU8=;
	b=ciB7JbH2jOtlsV83or6ZbFuGdUOa/oqJ1sMZT2E+QXFaGj3y9aEbYhCLtAe8hVKsZqPI8XLSO
	7F/rXN8KdAlKXWGFzaALI38bXSleMd7DLPmVUdg0C45hIcZvDE5s64xPDAiiLCQSqSDF0zZDZbL
	WU9PmPjrBg6HwB/tgb33hsU=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hFGTl5JYjzpSvB;
	Wed,  5 Aug 2026 11:43:23 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 011704057D;
	Wed,  5 Aug 2026 11:52:53 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 5 Aug 2026 11:52:52 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <anshuman.khandual@arm.com>,
	<BenNiu@meta.com>, <robin.murphy@arm.com>, <xiqi2@huawei.com>,
	<xiaqinxin@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <sunnanyong@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: [PATCH] arm64: uaccess: Optimize copy_to/from_user with LSUI extension
Date: Wed, 5 Aug 2026 11:52:51 +0800
Message-ID: <20260805035251.2813306-1-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_205311_974357_04E3DE35 
X-CRM114-Status: UNSURE (   7.82  )
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

Add support for the ARMv9.6/LSUI (Load/Store Unprivileged Immediate)
extension to optimize copy_from_user operations. The implementation
uses the alternative mechanism to select between the standard unprivileged
load-pair sequence and the new ldtp/sttp instruction at runtime based on
hardware capability.

Co-developed-by: Qi Xi <xiqi2@huawei.com>
Signed-off-by: Qi Xi <xiqi2@huawei.com>
Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
---
 arch/arm64/include/asm/asm-uaccess.h |  6 ++++++
 arch/arm64/lib/copy_from_user.S      | 11 +++++++++++
 arch/arm64/lib/copy_to_user.S        | 11 +++++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
index 12aa6a283249..4c1b94b275e9 100644
--- a/arch/arm64/include/asm/asm-uaccess.h
+++ b/arch/arm64/include/asm/asm-uaccess.h
@@ -94,4 +94,10 @@ alternative_else_nop_endif
 
 		_asm_extable_uaccess	8888b, \l;
 	.endm
+
+	.macro user_ldst_pair l, inst, reg1, reg2, addr, post_inc
+8888:		\inst		\reg1, \reg2, [\addr], \post_inc;
+
+		_asm_extable_uaccess    8888b, \l;
+	.endm
 #endif
diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
index 400057d607ec..f561a9c07345 100644
--- a/arch/arm64/lib/copy_from_user.S
+++ b/arch/arm64/lib/copy_from_user.S
@@ -45,7 +45,18 @@
 	.endm
 
 	.macro ldp1 reg1, reg2, ptr, val
+#ifdef CONFIG_ARM64_LSUI
+	alternative_if_not ARM64_HAS_LSUI
+		user_ldp 9997f, \reg1, \reg2, \ptr, \val
+	alternative_else
+		.arch_extension lsui
+		user_ldst_pair 9997f, ldtp, \reg1, \reg2, \ptr, \val
+		nop
+		nop
+	alternative_endif
+#else
 	user_ldp 9997f, \reg1, \reg2, \ptr, \val
+#endif
 	.endm
 
 	.macro stp1 reg1, reg2, ptr, val
diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
index 819f2e3fc7a9..a77dd153566f 100644
--- a/arch/arm64/lib/copy_to_user.S
+++ b/arch/arm64/lib/copy_to_user.S
@@ -48,7 +48,18 @@
 	.endm
 
 	.macro stp1 reg1, reg2, ptr, val
+#ifdef CONFIG_ARM64_LSUI
+	alternative_if_not ARM64_HAS_LSUI
+		user_stp 9997f, \reg1, \reg2, \ptr, \val
+	alternative_else
+		.arch_extension lsui
+		user_ldst_pair 9997f, sttp, \reg1, \reg2, \ptr, \val
+		nop
+		nop
+	alternative_endif
+#else
 	user_stp 9997f, \reg1, \reg2, \ptr, \val
+#endif
 	.endm
 
 	.macro cpy1 dst, src, count
-- 
2.33.0


