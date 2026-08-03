Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF36FC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVKtopwMrqzEnOyVedKGwt1g22ev9g5F8tMkWzZJze8=; b=rN6+FQS6UJfcpxLU+zXoEem1Ca
	xYRp6rHDRdoKscKaMJTpS7SfAhHZU7IRKb3MSH1PHWmbN6dIDrYy8RuZKAKCcw38FZU9SK/ucfakd
	DXTu3+aliCJh5qQkUQtCpOw0jc4SV4U1Mtra6RhIZhnU3/IDYXXFApQfzFs7P+tGrwnxuSFAqBOvU
	PGZBOmGjww/MpqY9Njv0xa2vMROPKafBkW+LF+uh78hRRpPHtMsM1O2SVWfkb5q8vvzOBIWkl9R4x
	qg+H6uyh8mtXRA4uaqJtmH5m/c/hV20shKT2aAqkPXuQxdQYsZYwuSFOkj/06qAp6/AVc9dE8RZQ4
	oxEn3Evw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqs05-0000000H3R8-1CSz;
	Mon, 03 Aug 2026 12:42:37 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqs02-0000000H3Pm-2DsE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:42:36 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785760951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVKtopwMrqzEnOyVedKGwt1g22ev9g5F8tMkWzZJze8=;
	b=nv1sXr73B89awbKPZkmi8w6iiuTkHiV6qBC96Bqef22ErCzkvNaTiaWHZRxq+A3UC+/29v
	wLkDtFrKl4t1Srl7LCdrgb4f9uZNQuHyDC9fzst/xRHLcgrjlQujELaOfTM/Tb46n5Zz3Y
	36yGJ+M1qi4XRNQl7Xx5uZAuJGnFdVo=
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
Subject: [PATCH v2 01/11] tracing: Include linux/types.h in trace_remote_event.h
Date: Mon,  3 Aug 2026 13:42:10 +0100
Message-Id: <20260803124220.332248-2-fuad.tabba@linux.dev>
In-Reply-To: <20260803124220.332248-1-fuad.tabba@linux.dev>
References: <20260803124220.332248-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_054234_730364_11936915 
X-CRM114-Status: UNSURE (   8.25  )
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

trace_remote_event.h uses bool without including linux/types.h, so a
translation unit that includes it ahead of anything else that pulls
types.h in fails to build, as with nvhe/trace.h at EL2.

Fixes: 072529158e60 ("tracing: Add events to trace remotes")
Acked-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 include/linux/trace_remote_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/trace_remote_event.h b/include/linux/trace_remote_event.h
index c8ae1e1f5e721..e4cc2d4497bcf 100644
--- a/include/linux/trace_remote_event.h
+++ b/include/linux/trace_remote_event.h
@@ -3,6 +3,8 @@
 #ifndef _LINUX_TRACE_REMOTE_EVENTS_H
 #define _LINUX_TRACE_REMOTE_EVENTS_H
 
+#include <linux/types.h>
+
 struct trace_remote;
 struct trace_event_fields;
 struct trace_seq;
-- 
2.39.5


