Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEDFC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bksl1grHHC9ENwLdrKoV8nNZBnNNdWkVPDuvfgKcTeo=; b=1nYC+1rV27MYbhxwtagngSpyCn
	wAW1QlfMsbM4KzieU8r6ZPLaa0bAd17PWo01KE9j4zj4HyUXhKA/dfipRUgPJiXVtRvRiiltcqRr3
	HREB7y6Sggp4BHx2CJxnIXka45SEv3xH9tmMPSrBMuXFp/EIPZAq7JJwh/thuUpwRId20jFkptSt4
	r7u7qn821HrLJ5rEYElWTQS8WxwRqUN1tb5ceeRvW9w3iz/KLX7mmnk9Ib+csut9dDnTxie0zMKcW
	2bEdOoO9+aHTmx9+pVSnMDzpVd6UIeFYSzrD3DXH6OT4WJGJwoHNhRARBN48NCdzRU7O/H96Ox5pY
	WUflLXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5Q-0000000CGsN-1Ay3;
	Tue, 01 Sep 2026 14:03:40 +0000
Received: from out-140.mta1.migadu.com ([2001:41d0:203:375::8c] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5N-0000000CGqh-0P7k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:03:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YdyDvE3tN60IKzKfKyZI9bbbKb+LrCKA/IsBMvtv8gM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788271414; v=1; x=1788876214;
 b=wNvglYEEkCn5ctxkoaG1x9yj5bMTOzdWIVJtg4/BwOtjisOrJDYkJv7ykQD2IwaXu4kwCSFW
 jMyTcMBbfqUp0dkho8Ce51V99XZuiAGUoAT52kT3Cj9xMqSUmMGWwpDFQbM+fe8YxbnB4d4iG8D
 iPGZAHtpYvxpUCiZRoKiZZk8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ef121039728df9a3;
	Tue, 01 Sep 2026 14:03:34 +0000
X-Mizu-Trace-ID: ef121039728df9a3
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
Subject: [PATCH v4 01/11] tracing: Include linux/types.h in trace_remote_event.h
Date: Tue,  1 Sep 2026 15:03:16 +0100
Message-Id: <20260901140326.3812068-2-fuad.tabba@linux.dev>
In-Reply-To: <20260901140326.3812068-1-fuad.tabba@linux.dev>
References: <20260901140326.3812068-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_070337_278045_994EE7C0 
X-CRM114-Status: UNSURE (   8.34  )
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

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
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


