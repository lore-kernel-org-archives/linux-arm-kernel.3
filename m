Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA33D20688
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYBSEHFvHyPiaU9ahfJIaNgCg7UK+cjgnT1D/Tj2qTA=; b=WzFsrZfwXSGUklMZ8mgVZ6MYz5
	j2bpBg0uFYRx7apW970KWM8ngKy17MecCgaM6zceJn57+uCAoBGzsa/mhjOlPnsGznOl6yoYsJ9og
	4eKxRZCJYU7AgBzPI/uw1lzV35GwW9X+Ts0HDkB6/zduq/sKc6OODh9eljA2fqCuefGJcmlrEzFeq
	FxMACbbefVFEwOTfcVxGsh1bQkASz218YRqXV+510JSNh2viGslk1JKhrCUCd0TDii71BJSwZM2+x
	s6EWIoSNTDGtf+IhGor+kp++hIh/mPcsFKC2oDyryOUewrKJ/jcjj4bx8krKK63sZXFHJ4efcAzlf
	IhrmJaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9KV-000000083KX-3fsn;
	Thu, 04 Dec 2025 13:25:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9KS-000000083K5-3eFf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 13:25:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B7CE339;
	Thu,  4 Dec 2025 05:24:55 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C32F3F59E;
	Thu,  4 Dec 2025 05:25:02 -0800 (PST)
Date: Thu, 4 Dec 2025 13:25:00 +0000
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
Subject: Re: [PATCH 04/19] coresight: trbe: Remove set_trbe_disabled() from
 the enable flow
Message-ID: <20251204132500.GM724103@e132581.arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-4-7da32b076b28@arm.com>
 <789573eb-c12b-419f-80bc-3de65367583e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <789573eb-c12b-419f-80bc-3de65367583e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_052504_970031_FF931440 
X-CRM114-Status: GOOD (  13.35  )
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

On Thu, Dec 04, 2025 at 06:13:56PM +0530, Anshuman Khandual wrote:
> On 01/12/25 4:51 PM, Leo Yan wrote:
> > set_trbe_disabled() should never appear in the enable flow, otherwise,
> > it may potentially hide bugs in the disable flow.
> > 
> > Remove set_trbe_disabled() from the enable path.
> 
> IIRC without first disabling TRBLIMITR_EL1_E - TRBE registers or their
> fields should not be fetched or interpreted.

Yes. I think you are referring to the rule DJMDD in Arm ARM: "The PE
might ignore a direct or external write to any of certain Trace Buffer
Unit registers ... (when) TRBLIMITR_EL1.E is 1, and the Trace Buffer
Unit is using Self-hosted mode."

> Without that none of the
> subsequent HW operations should be performed inside trbe_enable_hw()
> leading upto enabling it.

Fair enough.

If we can conclude the trace unit has been disabled properly in below
cases, no reason to arbitrarily calling set_trbe_disabled() during each
enable.

  1) The SYS_TRBLIMITR_EL1 register is cleared in trbe_reset_local()
     during probe phase.
  2) The SYS_TRBLIMITR_EL1.E bit is cleared in arm_trbe_irq_handler()
     for interrupt handling.
  3) The SYS_TRBLIMITR_EL1.E bit is cleared in the disable flow.


Seems to me, this is not only for code cleanup, we need to promise a
sane logic in the flow.

Thanks,
Leo

