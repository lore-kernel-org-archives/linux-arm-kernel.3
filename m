Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8773FD59D62
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcZl481DY8OaRRj3rMFJuxJawJSPpineGKXRw7PG+UQ=; b=MEb/dXSuoA0M7SCBg6j6IWdXWV
	VSJwQtNd0h6/0TEQzhn0hiwYant4vKo68+xIneCwq3/Oc2rGiEz5HuQplG6BWJ8Z5vbISmqw3+aKT
	G5GE3EiVOmEdabbI1+ROjmaQJ+/NLwYE369ckhshKNmOPhjTdR8Lip/7Z9oc/R0KquWZbH/OKnmcw
	F8jSkehOGmpaSQnndcV/5lbUKRVDQ3W4K8B2VomSChTR+Zgk/eAQS44MLCSCK/E72WUZWkMnTrSys
	q3e83Tw8fCG8qHFqnoJNeeONS5VBSaKi/j9YvDqmi2oTfu3hxmi9Wo3Qcy6uLUDAtQGy+KjDuQeP+
	heqIw20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU53Z-00000000iVe-2e1I;
	Fri, 12 Dec 2025 15:27:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU53W-00000000iV9-1y28
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:27:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 396FB1063;
	Fri, 12 Dec 2025 07:27:33 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A2C73F73B;
	Fri, 12 Dec 2025 07:27:39 -0800 (PST)
Date: Fri, 12 Dec 2025 15:27:38 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 07/19] coresight: trbe: Refactor AUX flag setting
Message-ID: <20251212152738.GA181228@e132581.arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-7-7da32b076b28@arm.com>
 <a638f74f-94bc-4052-b8e1-e940aca2d4ce@linaro.org>
 <20251210154308.GZ724103@e132581.arm.com>
 <27417fd5-902e-4474-8d60-356a94ac9590@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27417fd5-902e-4474-8d60-356a94ac9590@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_072742_566607_B264096A 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, Dec 12, 2025 at 04:50:52PM +0200, James Clark wrote:

[...]

> > The trace can be stopped on Fill mode (stop on wrap) or Stop on trigger, so
> > it is not (only) about buffer error.  In these cases, even though the trace
> > unit is stopped, the buffer may still have space available, tracing can be
> > directly re-enabled in interrupt handler, thus the COLLISION/PARTIAL flags
> > are better choices.
> 
> I suppose this is the bit that I don't understand. If there is space left
> then why is the stop hit at all?

For instance, the buffer becomes empty in the middle:

   +----------------------------+
   |$$$$$$$|            |$$$$$$$|
   +----------------------------+
   ` base  `wptr        `limit

In this case, the trace unit stops when it reaches the limit.
Meanwhile, the tool might have already read out the old trace data so
we will get some free space, thus no need to set TRUNCATED flag.

