Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAF9C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjuhjdcPWYZrYIacXWd1nBlaDE4dP2NnRD4hhXsdcTE=; b=uFbM0JYhZ4duUw6KIQxO46TT7+
	3qxHQyFDtyBUq2c9BmDTXNl8g6sSGLtfXyhtOlfKDZziZ4E02nkSGWHC3iao+YmKlVUxV62+FrbMG
	PdUeZLBttZgfB5XEQpaz/fIMigfXndpUOHngM/1PHXvdHmBZfCCG/Mq8+YuxpRQAX3pYIAckHT3cR
	7SSR+IJgX3K3y7D1eeCCoe9QyyuTxjEwQUdMgYvgDiJWms5yXEj5luRqnlJfO+f/m19wJa0dTb5uw
	FsYk+ndA6+CPAuuc8Xwd1tozDb8L5toDV0FmVaM/Ict7/Nk4iibWoGrlIa0LwEZ+lAxZsv9e2wTCs
	0/pxqSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5X-0000000CGvz-2VIW;
	Tue, 01 Sep 2026 14:03:47 +0000
Received: from out-159.mta1.migadu.com ([2001:41d0:203:375::9f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5V-0000000CGu4-2LqN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:03:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=OVNe98vubbbTaN+IclJcwO0viGj4aPmde+BOllis7HY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788271423; v=1; x=1788876223;
 b=SPREFmMz9ERsVI/0Osbk6FbC9l11v9e5eetogDze18l67FCMOEy70FmaDl76+Z7pvHS5TuY0
 bwYJ1X9sZVRo3DpGfJdXRlKqjTMjpmeipXsygGok2F1rU9kVb+GOV0In/PbO//XDilmYHS5eNZD
 fqnkuQWFH5tEg7WS/HQvezLE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 230a545285999ef8;
	Tue, 01 Sep 2026 14:03:43 +0000
X-Mizu-Trace-ID: 230a545285999ef8
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
Subject: [PATCH v4 03/11] KVM: arm64: nVHE: Declare the hyp event IDs before defining them
Date: Tue,  1 Sep 2026 15:03:18 +0100
Message-Id: <20260901140326.3812068-4-fuad.tabba@linux.dev>
In-Reply-To: <20260901140326.3812068-1-fuad.tabba@linux.dev>
References: <20260901140326.3812068-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_070345_760344_5CCD83ED 
X-CRM114-Status: UNSURE (   8.28  )
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
Reviewed-by: Marc Zyngier <maz@kernel.org>
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


