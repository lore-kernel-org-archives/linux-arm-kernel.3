Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4136C43638
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhMYuSJn/njbleZrCYYytyjl/Ylqyhswa1SUamMnalg=; b=jlh9zHRFFfWqx7wXHm5vlNIF2L
	7UuyBd2HqTD4BZfTajeLt1lMDssyh3/S0zDPTnjHpRQW8O5Y9DJOvCC0cF5EGQDRSDE5ebZLc3pYO
	I7mNEqZkbcjsoUFOZ35HxNofbZIr7Pz0/7LHYVDvoOMqVSBlRpk8qZxwNuUF2myHnM7fHFAnKq45Y
	lzQhBkJg7kr0bglmob7KKTDygzpkUC9ENL0UrDJZGHzazJ6sdZX4YX0W9utawcVdV7R58fpx/WNJL
	o2kakt0A5hmOGIFFmggt8WcnZZzclCgbIOUMG9cc8EVVDMTLuYNXU5RDUUcg82d76hm7bfXZt22Ch
	SI2sWkww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXJh-0000000GwWS-09lT;
	Tue, 30 Jun 2026 12:11:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXJN-0000000GwJL-0fhs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:11:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 477D9175A;
	Tue, 30 Jun 2026 05:11:28 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9032C3F905;
	Tue, 30 Jun 2026 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782821492; bh=28ACkWnLv7YMnNE//WvQjnBg78xe5Fk9GG40vt1q1ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lZrVIQJ6KwfHxRbspsdaaFLL4JY31qpds++E7hrs7ib/D87PWWSl46Cl/vUvoe79u
	 18xndfqem2wOolzhzsVmMS8Ycd67tHewNOJlgE66vihKtlwBHMUM6LPAu8eiQ5hH02
	 z3luARonf6fMy44CZ0L0EyAVhcU06wWp8XTjZfyU=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 4/6] KVM: arm64: ptdump: Factor out initialization of kvm_ptdump_guest_state
Date: Tue, 30 Jun 2026 13:10:03 +0100
Message-ID: <20260630121005.1130996-5-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630121005.1130996-1-weilin.chang@arm.com>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_051137_386909_A1ECFDBC 
X-CRM114-Status: GOOD (  11.81  )
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

Extract the code for initializing kvm_ptdump_guest_state to allow
reusing the same instance for dumping multiple page tables.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/ptdump.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 752d8e0cd25c..0c9647666e65 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -112,6 +112,23 @@ static int kvm_ptdump_build_levels(struct ptdump_pg_level *level, u32 start_lvl)
 	return 0;
 }
 
+static int kvm_ptdump_parser_init(struct kvm_ptdump_guest_state *st, struct kvm *kvm,
+				  struct kvm_pgtable *pgt)
+{
+	int ret;
+
+	ret = kvm_ptdump_build_levels(&st->level[0], pgt->start_level);
+	if (ret)
+		return ret;
+
+	st->ipa_marker[0].name          = "Guest IPA";
+	st->ipa_marker[1].start_address = BIT(pgt->ia_bits);
+
+	st->kvm                         = kvm;
+
+	return 0;
+}
+
 static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm *kvm)
 {
 	struct kvm_ptdump_guest_state *st;
@@ -129,17 +146,13 @@ static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm *kvm)
 	}
 
 	pgtable = kvm->arch.mmu.pgt;
+	ret = kvm_ptdump_parser_init(st, kvm, pgtable);
 
-	ret = kvm_ptdump_build_levels(&st->level[0], pgtable->start_level);
 	if (ret) {
 		kfree(st);
 		return ERR_PTR(ret);
 	}
 
-	st->ipa_marker[0].name		= "Guest IPA";
-	st->ipa_marker[1].start_address = BIT(pgtable->ia_bits);
-
-	st->kvm				= kvm;
 	return st;
 }
 
-- 
2.43.0


