Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B721C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dO/fbXCwwsDTpCj7W4vUaIfdwS/oE05+bHk2g2QXOMc=; b=4ilCz4wQ96VzdglOHHuDfa7xkt
	BNcotAbJ5r/UIycgCPTErG2a+hzMUstyy3SoprXgDx7I3PjS5zgdO/0L2Yep5H9yCTsrol2Dtcp7W
	3T6Lj63n3eHrPYK5PlTd8jyr3mZmS7mO7Ho922BReoTnqu+o1XLhQjTNNF2ppYgU41+bla48lCNI5
	K3WOGrIa3VOOkdOjSJCgx2cWuecfIKqJWO+5VQGO/zG0a/ButcVetbwb+R9zArUIsunXotA+OaHcj
	YZ6yINnFo/nPXKDdbnYx5Fi855K1nXodQ8XGSMKl8aqQrOR68wpsmYp6RnS9h5EuUTvlBO/EmJ2fe
	YxPTLZ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKgV-0000000CoDt-0Tru;
	Fri, 21 Aug 2026 08:33:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKgS-0000000CoDQ-2oNF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 08:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787301183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dO/fbXCwwsDTpCj7W4vUaIfdwS/oE05+bHk2g2QXOMc=;
	b=ew8sRayQFYl47ICO+dgPxsdrc7qhtPJS1JvSXD7sZJS57aVkkl7HlaM5NmwXx+IyTyN3Ep
	6ZvMf3C+0rGUpVxPg1ARm8VpoWi0SqaeyZXLZMnmUBmCmeV8btgs6u/Z2IOMYUZISVYixV
	RewV8FCTLzmAYiiRVgJzO5AkeSdDMWY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-kAJrx1l8PjGlKUUMQMLN_Q-1; Fri,
 21 Aug 2026 04:33:00 -0400
X-MC-Unique: kAJrx1l8PjGlKUUMQMLN_Q-1
X-Mimecast-MFC-AGG-ID: kAJrx1l8PjGlKUUMQMLN_Q_1787301179
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C82818005B2;
	Fri, 21 Aug 2026 08:32:59 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.129])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8E6B43002D26;
	Fri, 21 Aug 2026 08:32:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: EXYNOS: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 21 Aug 2026 10:32:51 +0200
Message-ID: <20260821083251.194341-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: ClOTvmPIxmWeJenWItCyPVfu-qN5AccDhdduvTd1iUo_1787301179
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_013304_779482_1EFB8E9C 
X-CRM114-Status: GOOD (  13.63  )
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

While the GCC and Clang compilers already define __ASSEMBLER__ auto-
matically when compiling assembly code, __ASSEMBLY__ is a macro that
only gets defined by the Makefiles in the kernel. This can be very
confusing when switching between userspace and kernelspace coding, or
when dealing with uapi headers that rather should use __ASSEMBLER__
instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
this confusion.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This has been split from an earlier bigger patch of mine into
       a separate patch to ease reviewing

 arch/arm/mach-exynos/smc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/smc.h b/arch/arm/mach-exynos/smc.h
index 5c30feb8f07d9..5c7730f6259fc 100644
--- a/arch/arm/mach-exynos/smc.h
+++ b/arch/arm/mach-exynos/smc.h
@@ -32,11 +32,11 @@
 #define SMC_REG_CLASS_SFR_W	(0x1 << 30)
 #define SMC_REG_ID_SFR_W(addr)	(SMC_REG_CLASS_SFR_W | ((addr) >> 2))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 extern void exynos_smc(u32 cmd, u32 arg1, u32 arg2, u32 arg3);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /* op type for SMC_CMD_SAVE and SMC_CMD_SHUTDOWN */
 #define OP_TYPE_CORE		0x0
-- 
2.55.0


