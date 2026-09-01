Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40109C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqar7tzQ2iO5nzzzDtPeFs/ZHO0wxXrubyHMModZRKU=; b=uWk2zZkYXodhqRP4l/d94/veDM
	q6ry7JogMnRlvC4AqbTL3BBftaxf/JEDNG+aUM7nEj4Cv9gBG5y+0tnnFUdJQXbGsdnnuHiYWEITU
	ACsrdmquahiAtChFwisRDwzKwi8aiGQoTDBgciv6nUVJgxSgjgdqSgKSbXgYy5w4Pe5lbaZZSTGT5
	KDdbxfEWy1YjMPzLbIzxvfVCavBalzMo+2XLrL44f/LsBrLGDpBE6jRVTL50c5d6jQYabDSbdiNTt
	jk905Kcf85b0ObyWVSLx35E2v3MSqnOtr1nh6MZ7vIQM/C1kqHRPeeamBY44CWeRGfJsHxLSU6c4M
	3pssKrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5r-0000000CH8Z-0gZe;
	Tue, 01 Sep 2026 14:04:07 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5p-0000000CH5I-0zq2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:04:06 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=nf9m83+hrKqgn8YWup9R6VRwseln6uhzrpOiLyHdB7Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788271443; v=1; x=1788876243;
 b=Zncaz+Aq55l6zKrKuKdZ9uKk58puDA7hTL/UKDk6P7pYoBnaEJ0YSWVtMA5fjysMXq4ZWmPq
 awgIUS0qeD5/xME7YU8zd4pjevZQ4nTHsk6FzMjjOkvH4tUFWaflpN16Ihl6Qk+Y2YdioeExYoI
 ofGonMD0is4hR1k2Id2rKmD4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 652305927580f4db;
	Tue, 01 Sep 2026 14:04:03 +0000
X-Mizu-Trace-ID: 652305927580f4db
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH v4 05/11] KVM: arm64: nVHE: Run the source checker under C=2
Date: Tue,  1 Sep 2026 15:03:20 +0100
Message-Id: <20260901140326.3812068-6-fuad.tabba@linux.dev>
In-Reply-To: <20260901140326.3812068-1-fuad.tabba@linux.dev>
References: <20260901140326.3812068-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_070405_420024_E7ABFC20 
X-CRM114-Status: UNSURE (   8.32  )
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

The custom %.nvhe.o rule reuses rule_cc_o_c, which hooks the source
checker only for C=1, and that only when the object is rebuilt. The
C=2 hook, cmd_force_checksrc, hangs off the standard %.o rule that
nVHE objects do not use, so "make C=2" silently skips every nVHE
source file. Call cmd_force_checksrc after the compile rule, as the
standard rule does.

Fixes: 7621712918ad4 ("KVM: arm64: Add build rules for separate VHE/nVHE object files")
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index f57450ebcb498..ccc1fe8394094 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -49,6 +49,7 @@ targets += $(hyp-obj) kvm_nvhe.tmp.o kvm_nvhe.rel.o hyp.lds hyp-reloc.S hyp-relo
 #    avoids file name clashes for files shared with VHE.
 $(obj)/%.nvhe.o: $(src)/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
+	$(call cmd,force_checksrc)
 $(obj)/%.nvhe.o: $(src)/%.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-- 
2.39.5


