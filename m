Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF68FC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIJ1oaiG3BdIqo77RCT5sHNhP1YT2icSKWhSLWIr8GA=; b=xLs9guIxOllhCNPiHtQ89odWGq
	sePEbHqVEtqtVOkzfi2GilRKvsVumHkq/Ng1elNrjwGRBI3/JyXqnrS5uMmiR1mdmK0CCflzvqKpr
	vp0l/YGDGGRGGo4SUQoRAvhbwwKGntmn1kmbgIF+kkND5dpHHXBlnvVcLhxpZXRR9EogHHtpNWOek
	3zhnGMjtb+evzLpXBz5p8K04948tQOdeaAaVVvYbF9rmY89rdwUw/4jFbIvy7EXRUwleyDKUZ+2ze
	mwzRJKCXQUmms53gP9kBFwuDsj7Iiop/LmXRe34gvdDCdcoLmyYylKyfvxXUzFUXlINgRdvmHjfmV
	H1ZFAkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugi0k-0000000Ga1n-1YKV;
	Tue, 29 Jul 2025 10:56:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughav-0000000GX4x-2TG9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 10:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB438A54E87;
	Tue, 29 Jul 2025 10:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8683C4CEEF;
	Tue, 29 Jul 2025 10:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753785004;
	bh=FPo8YQqOadYn1SLIdyIUhOdC1QxNA1+UX5dVUQRyf18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BagLhifsVfRtRYe693MOPXaH0MDHVEcCsj/9+B5e1df1R4YGBcU7puY5o8QVWMWlO
	 bbEimocZrrSVVvnZtezyTDHAwm7PQq+T9WTbdDS5NUCirB8//xDfGdjfhxQIZ8iz9g
	 Ugl1Oe4veyFL9z7jKbZUMBh7YkkzUaQ8pQGTlgeX59XzZUvnzDlv8QtGOgulO+zlaD
	 oqRokKw6yTaXTq3qJSQcwr1VXf5uBCTPxlmpXRoJvdGshwIkYqZXjELI4pZXV+TEDp
	 oPfbVMS86b+4iNDkX6wQO57LzBqr5cql2YZmytGFmGLzIwmHvaVIShvrZgD3X/kB0L
	 +JubbS7ROZTRg==
From: Jiri Olsa <jolsa@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>
Subject: [RFC 10/10] Revert "ftrace: Store direct called addresses in their ops"
Date: Tue, 29 Jul 2025 12:28:13 +0200
Message-ID: <20250729102813.1531457-11-jolsa@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729102813.1531457-1-jolsa@kernel.org>
References: <20250729102813.1531457-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_033005_688875_8D2BBBAC 
X-CRM114-Status: UNSURE (   8.21  )
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

This reverts commit dbaccb618fabde8b8596e341f8d76da63a9b0c2f.

Current code uses ip address to lookup the trampoline and we need the
ops to point multiple trampolines, hence this is no longer needed.

TODO this probably breaks arm.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 1a61f969550d..27b26a87231c 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -457,9 +457,6 @@ struct ftrace_ops {
 	struct list_head		subop_list;
 	ftrace_ops_func_t		ops_func;
 	struct ftrace_ops		*managed;
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
-	unsigned long			direct_call;
-#endif
 #endif
 };
 
-- 
2.50.1


