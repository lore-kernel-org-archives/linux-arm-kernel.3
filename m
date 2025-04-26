Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85575C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxfRIJ6qq3bOCR6I3JzRzMOcD54RyJqsZjPNcoTDIK0=; b=ulJJ/T0/0PJo7RJRII7HNHC0xQ
	DCfTu/igi8RAH69qxHt4DQ7jSRjYcXh97EWpEozKaCWeOhGZFwtV2jOxaPnrDSQWe5W7sJam6WDhG
	YwPqB69iJYtuR9Oe71T7c7spNu39eCK6bdehaqwWpSgE7qmZWhJo3aTboYs69ksMIy4LZBjySl74J
	9ODy/lBfO0DM8a9nJwb+klsTn+4iRFwUVP2CfVptl4ec08C7H26cN/dZ/qWCB9D9chiA5zoz56kR/
	xXGjQr0d5APFkW1iDIDC041xTGkAXwsSf2AsB2bNrxcWoKqCHZYPiY4wMeiJHNO6MF6BKmOPg+wd6
	N9TtaAOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fq2-000000026jE-2gs3;
	Sat, 26 Apr 2025 13:45:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeV-00000001z8O-47M0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:29:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C1D4A4D2A5;
	Sat, 26 Apr 2025 12:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2749C4CEEB;
	Sat, 26 Apr 2025 12:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670542;
	bh=GiGc1R1Pi1q8F7lTqhQerLhx4turyXGHxprlQAfaI0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f8g65JXNF9BgHfxSJIW3oelUbZh0FRuOuKnx4xNmhVJSedV625rh79UWR2PgaGHwX
	 eNPt3jTYqbOs5nCURrM8Z+ZJYX3KJoVfoKCfI0UT0MgYQnHiyj9hWlxpX2LYZQGHu6
	 +PXroWRg30J1ftCp9JjDkotSf3gdHysICUWcAJjEqG1UBvdQ2iu7bFPM32tp1Ryy0B
	 a6vZQCY9rdq9IdnQeJUNI9tUszdcqyGbMQnvZRN+g3P3RAdAGHsZvDmpmOQ2olAYmk
	 +GC38BIJThwCWJLihHWUv6Yjl9cA3Ugn2rHzlnzAdb19MUsdyIcEs0QRWRpYeX2Eww
	 sl0LgiV8uzCog==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeS-0092VH-Nd;
	Sat, 26 Apr 2025 13:29:00 +0100
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
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 38/42] KVM: arm64: Add trap routing for FEAT_FGT2 registers
Date: Sat, 26 Apr 2025 13:28:32 +0100
Message-Id: <20250426122836.3341523-39-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_052904_105320_7F03188B 
X-CRM114-Status: GOOD (  10.43  )
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


