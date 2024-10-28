Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E13D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAlECAcGnuh4cuscZB5s8TRPHJ/b/S5CapIyxKLOHrA=; b=1LHhdXkfkhmDagxbJY6bjPEmJl
	vg8/5FtCrYvXILAjhCiLUoA2DgNmUEglpVi/58FcvRVpCXXyI3vRDUxwnFGxDSKCIC/NAX5CC9m2V
	cTVhcqDI4NDTA+OAIJ1lXL7TxV1C24jj3fRt60vh8wWoZ/DDQGmAxoxivlzwqvfE4Pz8HrVVNuAD4
	3iCUQ9ZKU3C235ERhaF/fEDkDgvzfjzk0OSkuelXNWFcj2990p9PkFxcltFJike8NcbMRS0u/152E
	X778ztuGN0PAOeaRYuDBs8IVJSw6WP+qlKShhFvKFwSUmfkWLuMSQ1skhJe8dNvZQ3C7ciaw56TM6
	LBWumNzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MQV-0000000AJCI-05mK;
	Mon, 28 Oct 2024 09:52:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MEm-0000000AGOB-1AlM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B587F5C586B;
	Mon, 28 Oct 2024 09:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD72C4CEC3;
	Mon, 28 Oct 2024 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730108435;
	bh=fOfCtMTTqempwM/M8Zy6RaQ+0MELCkS3ty5RpQLNX8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TMWEb3Q3yr8sCY6ZLd++1Af1iFAAgAf3jSpETEVxbSccuguh6Cym2Gy0O5Ke8gqrC
	 l5hThnrs87kVHIuDBxZmVkSq1poOrkDHM5x5HUXaraiyME1BiLZ2esgzvPO7Y4Ot5e
	 bjGZudSe67agjEV28Y3gCStBWuGGggC97WWT2CcNoUsTBDAWL1FvpPwbas9N+tdNtK
	 w8X2G2eQhWRt7LfDwo4moHlF8IhsecpR/PWczONikDyrTvfKsVbhSaFyFwA8akimW2
	 rAF62ze9EJPFvPfwyFiRkrpRcBbThL/JNNr5imv6a2GX4RfpPJgaauHUZDlKbVpeoF
	 Ta9UPxKwRrkTQ==
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
Subject: [PATCH 1/4] arm64: Update the values to binary from hex
Date: Mon, 28 Oct 2024 15:10:11 +0530
Message-ID: <20241028094014.2596619-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
References: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_024036_384421_2346DF81 
X-CRM114-Status: UNSURE (   9.36  )
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
index 0480c61dbb4f..ca42f6d87c16 100644
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


