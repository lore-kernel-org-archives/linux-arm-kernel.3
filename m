Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61769D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 15:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3g6cDjmkvpFrP7OR0OEQSMsAWtJ+yAOMAmoFUYsE9A=; b=DiY3ro6KCZFBM+6BKSFOjZQHaQ
	yjydd5qJDJkavDUnybP4vQBqQjz+bjXzqhkPBhaomDtI5y7ih0XPAm7k6UhTGjLy/CNmxJwIwl3g3
	0UGmCEtfg0V81M33ny6hRbDLw9/ag4HJWhqd2Gik3wDVwtRS/QqAkJxfGlsYDMD1+BhxmGzSrrcd0
	F8QsrEjv40camQdLXGLMxtJ3r1EoC4zXheZRZx8X0ckGhGlTx1RsRqNTEIn7MYO14UNsmWHqWvlnH
	18DlZsSzl/lLOY+QAn9w4GMwPXkuE2nfaeMCcXOpzOLAMS8ozFd85eGBoxmPiRXLF+4pf9HZ2hRd/
	eNtp7G9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzeL-0000000ESDU-45of;
	Tue, 09 Dec 2025 15:29:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzeI-0000000ESD6-2H5O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 15:29:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9ED2175D;
	Tue,  9 Dec 2025 07:29:01 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A557D3F762;
	Tue,  9 Dec 2025 07:29:08 -0800 (PST)
Date: Tue, 9 Dec 2025 15:29:06 +0000
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 05/19] coresight: trbe: Refactor status clearing
Message-ID: <20251209152906.GW724103@e132581.arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-5-7da32b076b28@arm.com>
 <fb3b495a-3e04-417f-a674-e1753fd85177@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb3b495a-3e04-417f-a674-e1753fd85177@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_072910_638760_FDB1B863 
X-CRM114-Status: GOOD (  20.46  )
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

On Thu, Dec 04, 2025 at 06:27:27PM +0530, Anshuman Khandual wrote:
> On 01/12/25 4:51 PM, Leo Yan wrote:
> > If the driver does not clear the status when disabling the trace buffer
> > unit, stale state will carry over to the next enable, though the driver
> > clears it again on enable.
> 
> There is no problem now ! Because trbe_enable_hw() calls clr_trbe_status().
> 
> > 
> > Explicitly clear status after the trace is disabled in the interrupt
> > handling and when a perf session ends.  Keep the status for spurious
> > interrupts for continuous tracing.
> 
> But is not that the behaviour already without this change ?
> 
> clr_trbe_status() in trbe_enable_hw() ensures that no TRBE session can be
> started without first clearing the existing status. Still wondering what
> is the purpose of this change ?

It is about the driver's sanity.

The driver should clear the status immediately when the trace unit is
disabled, rather than waiting until the next enable.  This avoids
unexpected behaviour, such as a spurious TRBE interrupt.

Consider an edge case: if TRBE is being disabled at the same moment it
is about to raise an interrupt, arm_trbe_update_buffer() may miss the
IRQ bit due to latency.  If arm_trbe_disable() does not clear that bit,
arm_trbe_irq_handler() will still run after the perf event has been
stopped.  The interrupt handler then retrieves the trbe_buf pointer
from the perf output handle, which is dangerous because the perf
session has already ended.

Thanks,
Leo

