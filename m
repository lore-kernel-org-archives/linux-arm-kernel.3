Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885C1C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zIKmZROYh74nqCSv6sg/c+Cjz0XlrnkYv/gMVvWs5g=; b=hFhs/9jfRDVMW7YrAKVdI5qZKe
	AGkdJH0tYZ691m42HQKd1oI7CP2xSxdVn0l6CBm8l8yKIzmyv9Ko4MZm9umeOkSITj+Dui7ANasn1
	1dHGvadN0UFwlRJGfN4aG8rgUtFiRZytfXKSsds1sZu0qF3jQd/jHP9RZwovL7qbtOIdhS8GDPzgl
	G3l8zxZ5HkntMrZAihlzsGAKfHw5Hmvi8ptdYlsRMmTC6IWq3ceGWFnrNccgHfpBWE+kLgOaWklyM
	tNN+dQoULip4TU5MngxG4k5+bQwq60nLbfrtx2Y3Iig3NskU/v37tWJKrvskXzoFR63E2v77gxJA1
	gvKqdsmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqdI-00000007KXF-1yb1;
	Mon, 20 Jul 2026 16:14:20 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqd9-00000007KP3-0B9q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:14:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784564048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zIKmZROYh74nqCSv6sg/c+Cjz0XlrnkYv/gMVvWs5g=;
	b=Z7BfzI45SyIIjCifTWZFRl69fF0oXedsowC4+zlSeN41852ATp2ILM4Syg9wpryJZbbVmm
	3xE4orm4inUitbpuRfwKY8rO0l0F3ibxz/rW5Ff6gZBVbTEviu0S5qoFQUJJh8i3Jblo4P
	RLhfWmD/gFMxoXxCh3k0S1vM5W+dKyg=
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
Subject: [PATCH v1 04/11] KVM: arm64: nVHE: Use NULL to reset the trace buffer backing pointer
Date: Mon, 20 Jul 2026 17:13:36 +0100
Message-Id: <20260720161343.1367007-5-fuad.tabba@linux.dev>
In-Reply-To: <20260720161343.1367007-1-fuad.tabba@linux.dev>
References: <20260720161343.1367007-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_091411_218753_D0DA9C05 
X-CRM114-Status: UNSURE (   9.98  )
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

bpages_backing_start is a pointer; resetting it to plain 0 triggers a
sparse warning.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index e7e150ab265ff..177fe3d8fbb13 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -93,7 +93,7 @@ static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace
 
 	__release_host_mem(start, size);
 
-	trace_buffer->bpages_backing_start = 0;
+	trace_buffer->bpages_backing_start = NULL;
 	trace_buffer->bpages_backing_size = 0;
 }
 
-- 
2.39.5


