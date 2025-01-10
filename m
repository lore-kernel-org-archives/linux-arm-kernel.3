Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A335DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55yJ6kb45jJSHxPy2vqBRzzipcynjeqXIxJjfktFSFo=; b=oBn7/VwSmkpeqziNMBxClqWdKm
	eDfiFJVaPTa4EhiK9yXZ4ce2L8x2v7+ZwCkSETo0/uoPt6RE4rFK2xgDURff3WKj8bFEXZ5ucI7as
	OeoIoFlKLLn6cEda9sFv61x5k2S5SybevqI72q7Dw58KrXCeFgrvWYdXQ6s1QzET26Qn/38yuCwwK
	kzMpYecK26ADsBM36lTVIbastwwAk4W5WaxBdgRs0RN8s4RNdRyjEaqxGaOEBP7c63hitA5WGZC5K
	IwAMdW9gmJhf1tRJCIn73YJSubMixxIPP/AQdsrS+KgYvPRw93vpCVZFdF9/NgJANtHW8qPvcqVYI
	s3iwoYbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCnA-0000000F37l-0QmL;
	Fri, 10 Jan 2025 11:03:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCkp-0000000F2bz-48OI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 11:00:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94D945C5C00;
	Fri, 10 Jan 2025 10:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21EDC4CED6;
	Fri, 10 Jan 2025 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736506839;
	bh=Za9GLFN307WlkUl4niP5UUi9dXFcP6CZJGyLTcZ6JB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rfipLdXDNDrYj9mvGzw+/seBMC8NGic0jCoI6n1JtOoDqS5avsb6sPCPUGh8YYeRE
	 EcyKAOK0b3HuWZkDF+YLdY/QXj2sFgFdhbuQ7xhaQhxxxhP5JrZ3F5an2SB76ucQ3f
	 FN9zW54e0WsW0BvJR+IA+tGFUApqzOqYwJ9fY87oi2pxB0oqO3yB858RB34365Lt8e
	 0XuYN3Etf571wfynznXYuisKYaz8V+sdAzJOhmH86p9mqhXgV/BCRmY02HqSyLCLqY
	 FVuotW9UMB4pdWvjVxUCuuERnoXVJ+WldI8SnPzJbm0SypCVWZ9MoI6kHioo+Hoq3/
	 ivHIh4v6wv68g==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH v2 1/7] arm64: Update the values to binary from hex
Date: Fri, 10 Jan 2025 16:30:17 +0530
Message-ID: <20250110110023.2963795-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_030040_058631_53442BAC 
X-CRM114-Status: UNSURE (   9.69  )
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

This matches the ARM ARM representation. No functional change in this
patch.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/memory.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 8b9f33cf561b..cb244668954c 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -178,17 +178,17 @@
 /*
  * Memory types for Stage-2 translation
  */
-#define MT_S2_NORMAL		0xf
-#define MT_S2_NORMAL_NC		0x5
-#define MT_S2_DEVICE_nGnRE	0x1
+#define MT_S2_NORMAL			0b1111
+#define MT_S2_NORMAL_NC			0b0101
+#define MT_S2_DEVICE_nGnRE		0b0001
 
 /*
  * Memory types for Stage-2 translation when ID_AA64MMFR2_EL1.FWB is 0001
  * Stage-2 enforces Normal-WB and Device-nGnRE
  */
-#define MT_S2_FWB_NORMAL	6
-#define MT_S2_FWB_NORMAL_NC	5
-#define MT_S2_FWB_DEVICE_nGnRE	1
+#define MT_S2_FWB_NORMAL		0b0110
+#define MT_S2_FWB_NORMAL_NC		0b0101
+#define MT_S2_FWB_DEVICE_nGnRE		0b0001
 
 #ifdef CONFIG_ARM64_4K_PAGES
 #define IOREMAP_MAX_ORDER	(PUD_SHIFT)
-- 
2.43.0


