Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE53CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 03:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pcrLohvrD/CJTUV8ZAH7m4b1jxNWxv5+mBvbFEvHjQ=; b=jG/PQeCAJEOxJaa8ap9mlrWerR
	st+L9AttvP4SJOPvG95Pc7ftlp5P7FeGNrmjCF5EonqpflbWTR+/a9cLHScfGsejOqIya+mOANQ5S
	sFuvVkxmebH75ma/o04UxGI7yExTE3QgZPLgYsJB28exWQUXMhqjY3O/GjVPHYvJ/DXxnos5isyfG
	XUIkxDcc9tNb9MTAPNcyo0eshE1H/ygKaEF41FAM2DveztraAOg2iUos9L0g/5pVqDrZ4zL12NT2k
	oG/xW4hIttH65s2tL/G5MRT0BfIUlimnEcAMnrVqAB1PoPj7zSjwJQ1bfHLnXp4m011f6MhuNbfdg
	lSrDN5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOK8-00000006qpq-3eoy;
	Mon, 25 Aug 2025 03:56:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNyl-00000006olI-3wDo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 03:34:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E632A15A1;
	Sun, 24 Aug 2025 20:34:34 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F7043F63F;
	Sun, 24 Aug 2025 20:34:42 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	thiago.bauermann@linaro.org,
	broonie@kernel.org,
	yury.khrustalev@arm.com,
	kristina.martsenko@arm.com,
	liaochang1@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v7 7/7] uprobes: uprobe_warn should use passed task
Date: Sun, 24 Aug 2025 22:34:21 -0500
Message-ID: <20250825033421.463669-8-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825033421.463669-1-jeremy.linton@arm.com>
References: <20250825033421.463669-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_203444_011145_269B8580 
X-CRM114-Status: GOOD (  10.53  )
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

uprobe_warn() is passed a task structure, yet its using current. For
the most part this shouldn't matter, but since a task structure is
provided, lets use it.

Fixes: 248d3a7b2f10 ("uprobes: Change uprobe_copy_process() to dup return_instances")
Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Oleg Nesterov <oleg@redhat.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 kernel/events/uprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 7ca1940607bd..4b97d16f731c 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -121,7 +121,7 @@ struct xol_area {
 
 static void uprobe_warn(struct task_struct *t, const char *msg)
 {
-	pr_warn("uprobe: %s:%d failed to %s\n", current->comm, current->pid, msg);
+	pr_warn("uprobe: %s:%d failed to %s\n", t->comm, t->pid, msg);
 }
 
 /*
-- 
2.50.1


