Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC702CF9C73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oW/BRu2cz4LoSyh0iOtyq1EALIGdNyykFh9Ck33T4tQ=; b=4iw1zJASSc5eiLbx2/TW3Zobss
	kGJmvN97uludSHzgy7oCQFjXzSnRRxQncURmeE1n3GZaTCp/G5/3cA1RCxnptF+OHRMwTUUEPo7eA
	bZYbrIpW7ZAN5dbzeXSWRMf1FKten+oeGmtD2VCwo9wX+iDNnWEAV0AXK3ysP45fFfXSZUle79K0X
	LcOZEPRHZq+mZ8G8bXpMPR02KlLEF/JO2BEJq+1QXHkNkmQiOtFJWJkVt0PuBJR7qV0e1QnAEn0uo
	o7I0vzZixyA4aK7vlCstPqsRb0qVWeDvDQ2tSRyqwgbA8ZiM5DVvUApQmTh2282GThasO0F4K/xyb
	39TwoREQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QW-000000076aK-0Vqa;
	Thu, 20 Nov 2025 17:26:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q2-000000075Zw-2Uwp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C79043BFB;
	Thu, 20 Nov 2025 17:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C336C116C6;
	Thu, 20 Nov 2025 17:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659566;
	bh=I9ccNvnN5tYXZEamHv0x3EQ8Z2CyyHc1QdPzU7e5cnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H13RLatvl4ppCYaoGGLVZJf1mrpCf6fRJrwTemH7l7RFusqiWyANCV2Kq9ZFdvZXZ
	 NLH4CdG4dqRfoLdSyksgsZu7nxjJgjgGjMRVMKHWtYGEun7exyKFv3pfLAfIH7JQyF
	 /+kLo4XPPzUGY5lqQr+Tl8Izdl9m5ieOszLl/S/Z/6SLy3xceWol86YmeFzeqISp/b
	 UZBtk3HhScbEo2A2xk4bAuLFYULAtn91Cwho/FENa5g6txDY8DJ7ejzGnE3Bkiu5e4
	 /gdlPnM1aHKJfYU+LrXGyQvh15FNQdBSc6jn0TG0HODrG0Zo4Ql1nEOrBGybLvmEQi
	 JCooQJCyCni5A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Q0-00000006y6g-2Iu4;
	Thu, 20 Nov 2025 17:26:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 42/49] KVM: arm64: selftests: vgic_irq: Fix GUEST_ASSERT_IAR_EMPTY() helper
Date: Thu, 20 Nov 2025 17:25:32 +0000
Message-ID: <20251120172540.2267180-43-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_092606_668658_BA0578B9 
X-CRM114-Status: GOOD (  10.68  )
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

No, 0 is not a spurious INTID. Never been, never was.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 6338f5bbdb705..a77562b2976ae 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -205,7 +205,7 @@ static void kvm_inject_call(kvm_inject_cmd cmd, uint32_t first_intid,
 do { 										\
 	uint32_t _intid;							\
 	_intid = gic_get_and_ack_irq();						\
-	GUEST_ASSERT(_intid == 0 || _intid == IAR_SPURIOUS);			\
+	GUEST_ASSERT(_intid == IAR_SPURIOUS);					\
 } while (0)
 
 #define CAT_HELPER(a, b) a ## b
-- 
2.47.3


