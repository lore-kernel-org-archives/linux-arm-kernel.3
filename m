Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4961CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVGlv8i5aJ/548uQssPsGts4bmGCji2+rdV9ILC2x0c=; b=3UP3y1/5iqL0TqOUvYQr5mhRCA
	6LaYBOI4bJ2I9Zb7aoVfESAnCUgAwwp4bvMRZZWed+VaiCWTMA6eccVyczmFTb0B6ndnGZUSrWiEQ
	Ho9HDrqhb48V2FGKPAITSYxqHIZtv0V0D6cH54ljwFzRrKApuac5i0nVoRnxXl01VGboKYnQa9ZrP
	xkk/atLaWo6/RXflcyB2guY2eAyb/BU+0/uI6H/qJQTKYEWjyl6urwMlJksLjQS8wLoc0muXjuvW/
	30S1KPgTV4tazsbuTc+iXd3B3BUkVyQX1fi3DlU8XEKR9n5OOCJOKVFiBVMhAYYu1AKCQlnnAXWLe
	jd8M7bIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjMNA-00000000XCS-3wgs;
	Sat, 15 Feb 2025 17:54:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM7W-00000000Urv-0g43
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:38:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87013A40763;
	Sat, 15 Feb 2025 17:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BF8C4CEF2;
	Sat, 15 Feb 2025 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739641104;
	bh=l6/K3TgHqFMCERF5V5TBAO9LtyJHG0zZIRxuUinA74M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ccLo+p3DqEQCuREatieqYtX4+1e3lMiYepqpQomKJ1107yhfwX+gbA9NWI4sLXFq9
	 wt2KhTmzojLKVGfMmeluUAkOHEfU9HYVD15zr0N71LKcQCcv+7SPgDjj17bbpldnvW
	 Bxtz6ts8f4apxuZh4lIEJil5wbuc9o/VG2Owb7pvKlrcS0DRjBP7iRpmmFsdnEeIF8
	 /7ynVofi2rsezg5USRPl/eBtQRbrt6UQxRnY6DtjrXg15UoKoK9sTplt6swTRhQ1rt
	 zUsPZJjwBy5p+PsJDai9aJy2Y3T7DWW1YwcPSz3Ur9TUwRXHFF7vj2LSIp+pp1owLT
	 syJa1Z0iskJSw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjM7S-004Pqp-Jx;
	Sat, 15 Feb 2025 17:38:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 12/14] KVM: arm64: Advertise FEAT_ECV when possible
Date: Sat, 15 Feb 2025 17:38:14 +0000
Message-Id: <20250215173816.3767330-13-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215173816.3767330-1-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_093826_265656_FF2B674A 
X-CRM114-Status: GOOD (  11.50  )
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

We can advertise support for FEAT_ECV if supported on the HW as
long as we limit it to the basic trap bits, and not advertise
CNTPOFF_EL2 support, even if the host has it (the short story
being that CNTPOFF_EL2 is not virtualisable).

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 5ec5acb6310e9..d55c296fcb27a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -848,14 +848,16 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		break;
 
 	case SYS_ID_AA64MMFR0_EL1:
-		/* Hide ECV, ExS, Secure Memory */
-		val &= ~(ID_AA64MMFR0_EL1_EVC		|
-			 ID_AA64MMFR0_EL1_EXS		|
+		/* Hide ExS, Secure Memory */
+		val &= ~(ID_AA64MMFR0_EL1_EXS		|
 			 ID_AA64MMFR0_EL1_TGRAN4_2	|
 			 ID_AA64MMFR0_EL1_TGRAN16_2	|
 			 ID_AA64MMFR0_EL1_TGRAN64_2	|
 			 ID_AA64MMFR0_EL1_SNSMEM);
 
+		/* Hide CNTPOFF if present */
+		val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR0_EL1, ECV, IMP);
+
 		/* Disallow unsupported S2 page sizes */
 		switch (PAGE_SIZE) {
 		case SZ_64K:
-- 
2.39.2


