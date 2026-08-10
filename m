Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3DEC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 17:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5CEKvdjZ+GqV7pqn1nM6jfrimrYnL16pPlu4q1fQ5xU=; b=yc+EDZACggpn06o881bWqoiHyR
	+llUPXGHCni09M/e3CtT73Ey88fyT2K1h5NBqGuSSzVLbLn6YuYbrPERlQmwycvULZCBPwwhC0F/7
	zm5E6n3wYNxRJ87ElWxRRCQSfebmAdqAGuOklZFRyRce0uHSdciIJ62V2IqVqUR6A12kmFkQEh9tT
	1IBLuEDdi0Y2dNI3kcYO4tiaI33Vx2f7ARkEyQHNq9iyhA/4V94llG6M9076BHqMDGrPhB5FFW0Yh
	hkpuBDQan4LzdXWW892+nEgibwK7VTzmQYdGcC+iJyY9mBPQqYO3GdUt7UAIa8KZZURLa8wKMvbTD
	pH6o77Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTSA-0000000CTO0-0suX;
	Mon, 10 Aug 2026 17:06:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTS9-0000000CTNl-2HOn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 17:06:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 505AC40858;
	Mon, 10 Aug 2026 17:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C131F000E9;
	Mon, 10 Aug 2026 17:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786381581;
	bh=5CEKvdjZ+GqV7pqn1nM6jfrimrYnL16pPlu4q1fQ5xU=;
	h=From:To:Cc:Subject:Date;
	b=asMIQGAuH+bY8/eRhEhYan4Y0Q39sbZsdOmdZOsJGyiJkB+8pAomI0kPRIvLctkt9
	 Aeo7Rm1/d9U5PTwpKUq39ZJaIJM1TrHLv4dBqlb3RR7mk4M/5gA7dS2EjeUXct50vP
	 BLZ/NnXIUnr3T10Mi1LWk56560/5E0LW2QjAqeIpAxo1uVPCyCzPmhXvkir0tV4612
	 74RdYxxo2oqErcv1lG9KVIIb3PUe6nVSE+J4o8DCCGyO+srzmVijT/SUWCP+cU/KLN
	 BBwvaQuQ3OvyU5ln5qNPlDpZcoSKRixMjV9C7VQ3yXqI7FDfCnpPE3xLCru8xdJ3it
	 HYS7PcslXtAcw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wtTS7-0000000ECcp-0cSL;
	Mon, 10 Aug 2026 17:06:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: Correctly cap TLBI Range to the architural limit
Date: Mon, 10 Aug 2026 18:06:16 +0100
Message-ID: <20260810170616.746100-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, weilin.chang@arm.com, stable@vger.kernel.org
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

TLB Invalidation by Range has a fairly powerful way of encoding pretty
large ranges in a small number of bits. This range can be based on an
arbitrary VA, which means it is pretty easy for a guest to generate an
overflow should the hypervisor be naive enough to add the range to the
base...

Make sure the range is capped to the limit dictated by the address bit
that determines the VA range. For an IPA invalidation, this is further
corrected down the line to ignore the upper range.

Fixes: 4ffa72ad8f37e ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
Reported-by: Wei-Lin Chang <weilin.chang@arm.com>
Link: https://lore.kernel.org/r/yifz3wn5gk5sr6mapi32trgk5m5kp33bquctsjmkifebnsnndt@fix6u4rthx4g
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/kvm_nested.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index c83be6d0e79ac..1ed7083358096 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -305,6 +305,12 @@ static inline u64 decode_range_tlbi(u64 val, u64 *range, u16 *asid)
 	num	= FIELD_GET(GENMASK(43, 39), val);
 	*range	= __TLBI_RANGE_PAGES(num, scale) << shift;
 
+	/* Cap the range to the correct half of the address space */
+	if (!(base & BIT(48)))
+		*range = min(*range, (BIT(48) - base));
+	else
+		*range = min(*range, ~base + 1);
+
 	return base;
 }
 
-- 
2.47.3


