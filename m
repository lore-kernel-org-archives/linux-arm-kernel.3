Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5E3C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxfRIJ6qq3bOCR6I3JzRzMOcD54RyJqsZjPNcoTDIK0=; b=mhARfLvNano0ULBEPVteoKIXXo
	tFHAp5cfOxY1Wum30ZQNnEhN/obWPtYfIF1TdcxMZtngd8ybrBwq2n70D+hDJB97Ky54rw/pSZ6yf
	cIRGZD8er9dS4UyQO+mhQDTdf51Ia5DDSHMPNJPyxsnhilQ9O6gcerBV+a8w0eZhLGtE5KlVi/9Ld
	XINNTFHLTU/HCB8DuFaRHIpZw0aAhukHe8+beOPuYPRMTIc3XZ9NmSKBLCKBCLMm379VP4PTDuMMv
	ujDO3rnl04Ck740/VLFfqkf/GnS9nBR6FiGnMCjlxCd4qMBvhYQGpSHV7SQyDwdN22Qy/WNzFja4e
	tJEplAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQh0-0000000DWp2-0WZ9;
	Tue, 06 May 2025 22:23:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOz-0000000CiSl-40wF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46A066116F;
	Tue,  6 May 2025 16:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF245C4CEEB;
	Tue,  6 May 2025 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549857;
	bh=GiGc1R1Pi1q8F7lTqhQerLhx4turyXGHxprlQAfaI0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YBy/vWP6RdVVZRGfCOow4wh68Lp8BIwlYEaiYUglDsQ2Yywas7sKrz/os0d+n+ykl
	 hWrWKrKPRcmBXApF75DKrk8rcY4DRQAEGE1zzkBx9ZLoVhoSBckCt5K5dcQU5iZJ9x
	 Gy8iuU2Ss5Jlc6og07ulyn8i7adzE9XY1B8IdX9jEmSq8UtVKK3KUO5m7T76yx+HYX
	 3tZJSehkTc/lUAAS0W4yy6+CqESkDEooVp1FUWHFtkk0ngF77oJG7KmrZEqeNGk6Mn
	 sIzcBORO6CRbWU0vpzSLfqLFyUwFxX4klyAcu+PTau89Yqg+MEOEN4BAeQYa9V54Nf
	 Ck/mmoq3zvhhQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOx-00CJkN-7f;
	Tue, 06 May 2025 17:44:15 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 39/43] KVM: arm64: Add trap routing for FEAT_FGT2 registers
Date: Tue,  6 May 2025 17:43:44 +0100
Message-Id: <20250506164348.346001-40-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Similarly to the FEAT_FGT registers, pick the correct FEAT_FGT2
register when a sysreg trap indicates they could be responsible
for the exception.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 3312aefa095e0..e2a843675da96 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2485,6 +2485,18 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 		}
 		break;
 
+	case HFGRTR2_GROUP:
+		fgtreg = is_read ? HFGRTR2_EL2 : HFGWTR2_EL2;
+		break;
+
+	case HDFGRTR2_GROUP:
+		fgtreg = is_read ? HDFGRTR2_EL2 : HDFGWTR2_EL2;
+		break;
+
+	case HFGITR2_GROUP:
+		fgtreg = HFGITR2_EL2;
+		break;
+
 	default:
 		/* Something is really wrong, bail out */
 		WARN_ONCE(1, "Bad FGT group (encoding %08x, config %016llx)\n",
-- 
2.39.2


