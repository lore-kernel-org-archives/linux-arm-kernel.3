Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0BECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9VMnuiUrkX0H+Kw6nHvTBx0n/0CTb1RDqV1l1vT+AU=; b=AjSIR8o8CH9zFwB17K6S8S3l+J
	XYnuBAtvxPvQVp5AocYLZJLjnoMuyE40wcHztToYA1K4UctzuVExczlRoF/f3B8TivaFLao4qvKQT
	FJ9gRudWekkAnHa8CfTvJXFSQS1xcoJR+Rw9DQkWVCvkCx79uQmujgYgwyB7elTZlkXWZ2T1rGkI7
	JRmaJ8/gjxbKAE6jooUDpyonWFaun87siQ6Kei1EoLVyoY4+kuFQMqEg9kh5Lv0wNFIazi+ZFC8L4
	6uq0ikSJIs0R4nkwCQAosE18RW+z/N5dXZ1gVnq+rz7RNwfgXrpBFDfXtg2w6ur9JPai2d+Zoy7aM
	YyeX1O9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx1W-00000002wDd-0jpp;
	Fri, 15 Aug 2025 16:11:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umv89-00000002gFR-2dkb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 225B85C5C01;
	Fri, 15 Aug 2025 14:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076C5C4CEEB;
	Fri, 15 Aug 2025 14:10:00 +0000 (UTC)
Date: Fri, 15 Aug 2025 15:09:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 7/7] uprobes: uprobe_warn should use passed task
Message-ID: <aJ8_tj3Y-nDh60_2@arm.com>
References: <20250811141010.741989-1-jeremy.linton@arm.com>
 <20250811141010.741989-8-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811141010.741989-8-jeremy.linton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_071005_707740_BFD1C41C 
X-CRM114-Status: UNSURE (   9.05  )
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

On Mon, Aug 11, 2025 at 09:10:10AM -0500, Jeremy Linton wrote:
> uprobe_warn() is passed a task structure, yet its using current. For
> the most part this shouldn't matter, but since a task structure is
> provided, lets use it.
> 
> Fixes: 248d3a7b2f10 ("uprobes: Change uprobe_copy_process() to dup return_instances")
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> Acked-by: Oleg Nesterov <oleg@redhat.com>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

