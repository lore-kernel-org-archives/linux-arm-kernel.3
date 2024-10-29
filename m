Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA5AD2AB3B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DWp1sG7Vo8Wkyhyou70u/TgL+bDM+Pbz41lA/1tjL5A=; b=G8KblqYuDEYoJmkTDp4IV0txkw
	RQGOBAm5BqDpEEPCURdPfD9LUd76A4UTk7vamI8WsZwHoi2xpN0GQ4CKfsjcWhzewcA1cW7D0D3aO
	dmUYc1Y4RppWfSjg0Vkc5QUXw5/OLxc57tMNe8W4g3GVw5ZcjPU75ObxUMaRIjm/ozJE4i+yMh7tf
	49iAMlL4NqC7VIMI0ptoTG4+jx7zbqltrdX3h8zHyH/stsVBvdA/Lxwk16zzwBcTg0OeFxOnh/gek
	ILeXo76fXDHP+1eXEtfAo8TWuYIcbGWzpMOcyv7zsqb1Kk5FyiOuoC2dDU9YozRlH9uLOtjPkTPAo
	2fhv2Wkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5llq-0000000EU6U-37aK;
	Tue, 29 Oct 2024 12:56:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5l0C-0000000ELRC-2Vec
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F0E15C5463;
	Tue, 29 Oct 2024 12:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A757C4CECD;
	Tue, 29 Oct 2024 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730203631;
	bh=kiZLkwF8fQO96OiGl46+TaQWs5mkDteNFUwQ8IXPdw8=;
	h=From:To:Cc:Subject:Date:From;
	b=fsn66LdYCVr4VzXxIPYSry3ByPNOpNR1rIMElECX0rWRzNt9nP1WpesiOxWN2HrjV
	 p1p3v8vwUrPQC0VE0kWiTLj+h/FThg083o5CQyx0SskDCbjvDq64+IPlRKhH+HRCfk
	 CUuOKA0reUClb9rzd0aYjm/MwXmH8FkN28+YMUZfZ2cO4/tXoV96lQlZcA9JMKkc7x
	 o9C8NK8bPrYvKsQhzqbf06IotakpMI0jxGYlD5l7A2sQihB0MfDSIYpFXG1lOyL4O5
	 vD4GMBcdPlPc7vLsD1YGFq2sXyYF1WBIAUdCd6JmrjxMEPwtXsMCTJ2I6t1TkBiabX
	 9KJhgWlKiBYKQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: pmuv3: Add missing write_pmuacr()
Date: Tue, 29 Oct 2024 07:06:02 -0500
Message-ID: <20241029120602.4061566-2-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_050712_733659_E3241DF8 
X-CRM114-Status: UNSURE (   8.99  )
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

Fix compilation on Arm by adding missing static inline write_pmuacr()
declaration.

Fixes: 0bbff9ed8165 ("perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access control")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Sorry about this. Feel free to squash this with the mentioned commit.

 arch/arm/include/asm/arm_pmuv3.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index d242b5e1ca0d..2ec0e5e83fc9 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -212,6 +212,8 @@ static inline void write_pmuserenr(u32 val)
 	write_sysreg(val, PMUSERENR);
 }
 
+static inline void write_pmuacr(u64 val) {}
+
 static inline void kvm_set_pmu_events(u32 set, struct perf_event_attr *attr) {}
 static inline void kvm_clr_pmu_events(u32 clr) {}
 static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
-- 
2.45.2


