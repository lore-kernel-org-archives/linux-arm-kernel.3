Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5009C55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClYTj8QzgBnO7N7CWSz26CsAj405Dm7DCBLVlh0azJ4=; b=dBu88VbLgMEiAgRlaolZDQ9hNF
	SXdwQCQ6ya+mh8p0LRs/f4WVqO0RTH3ePbOdgH4WYhzjtHBDC++w7rybuUythO1HpWSZk2dQoVrdP
	fHIlmT3ld+UVgLRijrpvTKAaoDYbNH8yafc/bzVCzXY9PjdxfBOyuolGS32CJxvE00qfaqChHpXuY
	EfwazAZJfQRNN0vmxzyD4urMP/uOYdtJUNtPq5BF5fPAg4ntHGu/YeLHCmeuPrYeIHi//nS3ujDza
	G77yaAynIi+wqNezkvwCGqz2AmsVKmoemhwncoBWj5tOa5rKamykTnPd+XuO/xmywOjk29EPCvBpg
	dIfBJQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDFe-00000001fo5-3zA1;
	Tue, 04 Aug 2026 11:24:06 +0000
Received: from out-162.mta1.migadu.com ([95.215.58.162])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDFc-00000001fli-03M2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:24:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785842641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClYTj8QzgBnO7N7CWSz26CsAj405Dm7DCBLVlh0azJ4=;
	b=YqZGqwPdUakNx3Kj0pYdE42UUrWCKvM7oVflZ9d6L2HfNSyl//ExpcH1U8n1BYMNOc2pqA
	vJFpy3x3oDZlj9TVQTjj3HLyDsLt2WNPq1nkg4Sr9u14c/0845naqk3GKFvCAgGUlvm9SD
	/CI9bZLu3uc/CfPOrC1f45cyPiI/ZkA=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	alexandru.elisei@arm.com,
	vdonnefort@google.com,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	ardb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	tabba@google.com,
	fuad.tabba@linux.dev
Subject: [PATCH v3 03/11] KVM: arm64: nVHE: Declare the hyp event IDs before defining them
Date: Tue,  4 Aug 2026 12:23:09 +0100
Message-Id: <20260804112317.1937387-4-fuad.tabba@linux.dev>
In-Reply-To: <20260804112317.1937387-1-fuad.tabba@linux.dev>
References: <20260804112317.1937387-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_042404_188125_753D1FE3 
X-CRM114-Status: UNSURE (   7.65  )
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

The defining expansion of HYP_EVENT() in events.c is the first time
its translation unit meets hyp_event_id_<name>, so sparse suggests
making the symbols static. Include kvm_hypevents.h ahead of
define_events.h so the extern declarations come first, as with the
tracepoint headers.

No functional change intended.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/events.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/events.c b/arch/arm64/kvm/hyp/nvhe/events.c
index add9383aadb5a..b845be0acd117 100644
--- a/arch/arm64/kvm/hyp/nvhe/events.c
+++ b/arch/arm64/kvm/hyp/nvhe/events.c
@@ -7,6 +7,8 @@
 #include <nvhe/mm.h>
 #include <nvhe/trace.h>
 
+#include <asm/kvm_hypevents.h>
+
 #include <nvhe/define_events.h>
 
 int __tracing_enable_event(unsigned short id, bool enable)
-- 
2.39.5


