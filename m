Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041D2CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YblfJ9iaDEmuXmVSiW5lRC34BnwsfybOT0/taYuff6M=; b=V3I8DSuZ/IJZeyEE1gg5mYyv/I
	TBMH6KG5iVT8Lkrkn0fekpc1Ob6kjcgmRCp//qQXrZoY1wDntKAq4F+JsGwF9KKdNOdoWv6Kr3/Sw
	mOtvLGkdk+dRS1a9Edpafxh7gTg4XzDcpErbZ53ybIEkqchaybWC6eHbD9Kzz0ibUUb0/j5CS/Oix
	3JSYJarmiBatesW5m01qa37AAZ1lZdt4dsNwcKYPVIRee0LDZDnP28MdjH9cq8VMBp8qvt9KlKTGQ
	jR35qmBkzwWCMRy3T4FBwXtZ9HHDijNNZ+gJWYiIskkGbwxdR73woePAtv8cMCKtpeJ9F6U0jWL7A
	0r9mQtcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc24E-00000006Qta-2Syi;
	Tue, 23 Jun 2026 14:25:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc24C-00000006Qsk-31cj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:25:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FC7E244C;
	Tue, 23 Jun 2026 07:25:26 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B3603F632;
	Tue, 23 Jun 2026 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782224731; bh=8l579QzwifHqIylgwlzSwwRSPuALvfSk4I4hKWN5ClY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RrYOia/Eyt+n2Yawt4WsHI1PoYwuLZnwyyNCz6lkO8yyo5MLIGyXTTZoz6JpyTrDw
	 mI9BBDm8cbwtNTmIgyaHD1cPx6UYDdrrkrXvWW7ZSUH9TFkrxfbtlpFxBmCc8Y2e7k
	 DDT+rLstWSHB9IHuHWtqXi3hJ2mLXoFJJzBzwATE=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 1/3] KVM: arm64: nv: Print nested mmu info in kvm_ptdump_guest_show()
Date: Tue, 23 Jun 2026 15:24:41 +0100
Message-ID: <20260623142443.648972-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623142443.648972-1-weilin.chang@arm.com>
References: <20260623142443.648972-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_072532_880419_19D682DC 
X-CRM114-Status: GOOD (  10.84  )
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

To prepare for creating per nested mmu ptdump file, extend
kvm_ptdump_guest_show() so that it differentiates canonical and nested
mmus. If the mmu is nested and valid, print VTCR, VTTBR, s2 enabled
information in addition to the ptdump.

Also switch to a lock guard for mmu_lock.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/ptdump.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index c9140e22abcf..2a6afe67646a 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -155,9 +155,16 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 		.seq		= m,
 	};
 
-	write_lock(&kvm->mmu_lock);
+	guard(write_lock)(&kvm->mmu_lock);
+	if (kvm_is_nested_s2_mmu(kvm, mmu)) {
+		if (!kvm_s2_mmu_valid(mmu)) {
+			seq_puts(m, "invalid nested mmu\n");
+			return 0;
+		}
+		seq_printf(m, "0x%016llx 0x%016llx %d\n", mmu->tlb_vttbr,
+			   mmu->tlb_vtcr, mmu->nested_stage2_enabled ? 1 : 0);
+	}
 	ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
-	write_unlock(&kvm->mmu_lock);
 
 	return ret;
 }
-- 
2.43.0


