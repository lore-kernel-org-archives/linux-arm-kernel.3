Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EB1C021A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKIz19uyCwZNQcDJ4YYDTBGrwJ31r2M9Viqm0WfKWdg=; b=ER1SXy8YE9VtcZjGgfh1F0upFo
	wEp0F61GwKZABKIDvTTCbF7bTgooBnqJOR1zl/5zv87v2rYOg+nwF2sDlYbUFdaMoIJCOl8hPwWRK
	9nkInidC6m8MOzUZTtwS6MwsR7xKetAjzCdjYdzO/vtUPmddiwI+kyDuCCS0gBkSOqpjVozu+fIyn
	0y7p+FhsS9RJG4k0qaLwiVVkw7EexC6oBCQVyfS6KmgAXMxgQdpJNh2KRPW/W8xK9l2kNfT0EyQ1M
	MW7dsq6jJTgZ02uXcDQVtxhUdZEknhTKFZVZnIYdSS5INx6VxihP0DSQvENp3+vSgFDGi9FPY/i4n
	dXhjWmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYT-000000016TP-3jqA;
	Mon, 10 Feb 2025 19:34:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYjI-00000000yrT-2t2v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69E90A41FE1;
	Mon, 10 Feb 2025 18:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB94C4CEE6;
	Mon, 10 Feb 2025 18:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212919;
	bh=m74jfUKAjF1AZA6q50yggxbhx52u63cIVgdy05odc3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pRFw3gYPDmA7j5LH7ee8LXO81L+3Gge9vYUVZagNDhacwEhstaZLlAHL5euse0k+k
	 l5HVBiBbTv2lA14lbNitvqXDWjIHSnUmykbun1aRwXhOuE9hYAyiUiYbJlpKF0PcXD
	 p55/g57tpgCcobHN7is6TcCU0TtIBcAIjxvxYdtRqCVlTKPo0OuC3y+TgUKoPi8MVC
	 9Vaj2y9fCLHK2sd800EJuSudydMPCZeBW04l7n9wYuFKNhoHPhWiA902umLTMLvP0G
	 iM1OlZaZXNfqSOA59TeG9EIfa3hmeIF6uu8QqwtLmeACTRSJ0PPoB3azXg7p6zl22H
	 RZ1W/VhHDdTxQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1thYjF-002g2I-KX;
	Mon, 10 Feb 2025 18:41:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 02/18] arm64: Add syndrome information for trapped LD64B/ST64B{,V,V0}
Date: Mon, 10 Feb 2025 18:41:33 +0000
Message-Id: <20250210184150.2145093-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250210184150.2145093-1-maz@kernel.org>
References: <20250210184150.2145093-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_104200_789087_CD26EEB9 
X-CRM114-Status: GOOD (  11.04  )
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

Provide the architected EC and ISS values for all the FEAT_LS64*
instructions.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/esr.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index d1b1a33f9a8b0..d5c2fac21a16c 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -20,7 +20,8 @@
 #define ESR_ELx_EC_FP_ASIMD	UL(0x07)
 #define ESR_ELx_EC_CP10_ID	UL(0x08)	/* EL2 only */
 #define ESR_ELx_EC_PAC		UL(0x09)	/* EL2 and above */
-/* Unallocated EC: 0x0A - 0x0B */
+#define ESR_ELx_EC_LS64B	UL(0x0A)
+/* Unallocated EC: 0x0B */
 #define ESR_ELx_EC_CP14_64	UL(0x0C)
 #define ESR_ELx_EC_BTI		UL(0x0D)
 #define ESR_ELx_EC_ILL		UL(0x0E)
@@ -174,6 +175,11 @@
 #define ESR_ELx_WFx_ISS_WFE	(UL(1) << 0)
 #define ESR_ELx_xVC_IMM_MASK	((UL(1) << 16) - 1)
 
+/* ISS definitions for LD64B/ST64B instructions */
+#define ESR_ELx_ISS_ST64BV	(0)
+#define ESR_ELx_ISS_ST64BV0	(1)
+#define ESR_ELx_ISS_LDST64B	(2)
+
 #define DISR_EL1_IDS		(UL(1) << 24)
 /*
  * DISR_EL1 and ESR_ELx share the bottom 13 bits, but the RES0 bits may mean
-- 
2.39.2


