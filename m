Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B549FC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdltIrQtV/Sa43JqxqCgaPBwW4yMUqs8Fh418ryHzxQ=; b=V9DOIlPMmQXF0lRcUN7Qsfk0Dr
	ML7fMnTvLV9PtVGEilw7DYDveD5K8qRWutL2lGkRWV2YjEAaRaRFJKiJTlfKAjF7i4cPnDcsOiN/C
	TMWmE603MZGKnOi8vyhsf6i2zXQV2IfpZjf0QxPfgTYlJbcP2R5WnrJrxWK7FyQQ6Ydbvq4uLlNvw
	NQ9In2CWMTBJ390R4p3qZF4KdhFwfBujms5LjQiBvuPLqagLNSNK0ixgsvYHpEtqapTKRGjUsXJLO
	8i6xgCcroRgHQZ6vdO5aL4i1OXhYPZzAA1xT/e/1z1S4N/U0a0AFTJL9kt65C79sltuhUeMPM72wg
	yNB18a6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6oU-000000006BC-1yFA;
	Mon, 28 Sep 2026 08:34:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6oS-000000006A4-077r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:34:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3990D1570;
	Mon, 28 Sep 2026 01:34:09 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 506053F86F;
	Mon, 28 Sep 2026 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790584452; bh=sjy+jOogKa1C0RGxmYJGrorGsiGN1pV70X0DLsrysPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRM4nm5fEynHDgWuBm3y1ICeroMFVhyCUHft4T4Qp0Kt4JMgIC+qaIvC01LZcQa3X
	 6nujvNBv/arIA6xAFxZtfT0GPi6eh+EfrG31NYgy27zzHFDXnybuSv77FVsSuvxQ6X
	 g5tZlyWTbdGjOgwB67jNes5KDT49OKr8rYhYDS4A=
Date: Mon, 28 Sep 2026 09:34:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>, Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org
Subject: Re: [PATCH 1/3] perf/core: Export perf_event_itrace_started()
Message-ID: <20260928083410.GB14479@e132581.arm.com>
References: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
 <20260901-perf_suppress_itrace_start_records-v1-1-c4fbc6860859@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-perf_suppress_itrace_start_records-v1-1-c4fbc6860859@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_013416_109401_C11EFACA 
X-CRM114-Status: GOOD (  16.25  )
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

Gentle ping!

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

