Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C64FCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khmPjeN+u+APZhVACT8SI8Ta/vWWuWX5CS8JMTHJ/H0=; b=kEg2YKLk6Zsd2ZNb5SioLix+DT
	T+PzZ0H9oaa4pMSixcTkT16OB8diAGNBbIlNN/PgBu+VU4K5jUcbiz8DUyzD0cSAB6BDEAHXSFbuM
	ZJlr7F3ct3fR5earl6Mp+DYAoVPTLpWQCt7IW0jyRxG85zzot1Te+I81vJN1xEaHAG1hbPDJpOxQr
	6QuNw1K7adCuxI5NDXrC/96vINtTwDfPF1sL0CeJ/qeT8GY1t84MiN3iLGJMnnDDZHMf5ysUKCt9j
	G3jDpWxemyevK95iqzdHWoKe/NOoB5N6c/GCPsBqbU3Df0k2KkSEVObvABA2eT5Pu7afBG+Fa9sPw
	YcYJDb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9dZ-00000000TT3-2BUs;
	Mon, 28 Sep 2026 11:35:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9dX-00000000TSM-3VAt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 11:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=khmPjeN+u+APZhVACT8SI8Ta/vWWuWX5CS8JMTHJ/H0=; b=YhQNRxqRRqtj3X3Qe4oz00EEVe
	mFh2UA6TiDB4QlTZpKvkaH+EcDglF+DKukhzPWKTcZJzuwhAutS5Ea+v9uUOtAj7i53NoZdGUr9Ig
	Jzor2K3TgNxxsLBl+MnjKERAQ9luNzdXvr57gKsqcy6DL8ExdnDWrqbXjNV540k/VOruYMcXf05yw
	BtMDhFfclrjksawNFgXvZaFmgfjInUs1szmB9eiV8QkJrRpDbpaR6E16p72LLQd+d/3OpO1zZAon2
	ajzRiFFqjDvHU0TzI2rXW6Se3UiQ7+ocRxYOwOCWpYEAhN40varSK0m79QHDKI/rO9FboWVSESxhm
	jXhV9g0A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9dV-00000006QJ4-1Hn1;
	Mon, 28 Sep 2026 11:35:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F0A95300754; Mon, 28 Sep 2026 13:35:07 +0200 (CEST)
Date: Mon, 28 Sep 2026 13:35:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>, Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org
Subject: Re: [PATCH 1/3] perf/core: Export perf_event_itrace_started()
Message-ID: <20260928113507.GA776954@noisy.programming.kicks-ass.net>
References: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
 <20260901-perf_suppress_itrace_start_records-v1-1-c4fbc6860859@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-perf_suppress_itrace_start_records-v1-1-c4fbc6860859@arm.com>
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

On Tue, Sep 01, 2026 at 05:36:15PM +0100, Leo Yan wrote:
> Since Arm SPE and CoreSight drivers can be built as modules, export
> perf_event_itrace_started() so that it can be used by these modules.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  kernel/events/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index a6c8e38a311042afab6b65814a84c67b87ba929b..8afe89179a62127eebae0f38f29cde045ba56251 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -10560,6 +10560,7 @@ void perf_event_itrace_started(struct perf_event *event)
>  {
>  	WRITE_ONCE(event->attach_state, event->attach_state | PERF_ATTACH_ITRACE);
>  }
> +EXPORT_SYMBOL_GPL(perf_event_itrace_started);
>  
>  static void perf_log_itrace_start(struct perf_event *event)
>  {
> 
> -- 
> 2.34.1
> 

