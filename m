Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B4FD3C922
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIuhEOI6LDKpNlQ7odVdM+9q2td2eqhccAeqRZYtyvg=; b=1bVwTuSIIozPqEzdLFDqvQ4EVv
	fMzi1M8B8J0YF9l+VuX4yCUqgIpRrJlX+Ob1H9pHRXuQTcLS9V781zcq7pMzZTnqmBHs/g1G49SRO
	WXSqmd19GdMYNKbHsEIQrPin30BKJT4wtrAPDX79T2xTM041PjM6jKhz4SdeTvYOFjaAUsNlXfz79
	bFpnCAwvbyrFgHZnFnCPvR5gG9sV7ZsWKUYmML95tW/V/N9WjQPE7JS1qhLAIWqwydwZ3dwKHbWFx
	x0rDKaI10wMCBQr/EQhoa2OgaMyFLMuUkOv1S6t3n/y24IQklXc25bLbheBoWoeffnaFHY0zVEyXq
	dlASp1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMLW-0000000FZwM-3FXI;
	Wed, 10 Dec 2025 15:43:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMLU-0000000FZvr-1H8a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 15:43:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 848B8153B;
	Wed, 10 Dec 2025 07:43:03 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FE623F740;
	Wed, 10 Dec 2025 07:43:10 -0800 (PST)
Date: Wed, 10 Dec 2025 15:43:08 +0000
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
Message-ID: <20251210154308.GZ724103@e132581.arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-7-7da32b076b28@arm.com>
 <a638f74f-94bc-4052-b8e1-e940aca2d4ce@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a638f74f-94bc-4052-b8e1-e940aca2d4ce@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_074316_389661_2AC14CF2 
X-CRM114-Status: GOOD (  23.21  )
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

On Tue, Dec 09, 2025 at 01:37:39PM +0000, James Clark wrote:

[...]

> > +	if (!is_trbe_running(trbsr))
> > +		perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
> > +
> 
> Do we need the complexity of COLLISION (changed to PARTIAL in a later
> commit) and TRUNCATED at the same time?

> From my understanding, TRUNCATED would be when Perf is too slow and we want
> to disable the event for it to catch up, and PARTIAL is when there was some
> buffer error so technically we don't need the event to be disabled, but Perf
> still needs to be notified if we want to start only resetting the decoder
> when a flag is set rather than on all aux records?

The main difference between the TRUNCATED flag and the COLLISION/PARTIAL
flags is that the TRUNCATED flag implicitly asks the event core layer to
disable the PMU event.  In contrast, the COLLISION and PARTIAL flags are
only stored in AUX record and no additional action in the event core
layer.

Setting the TRUNCATED flag would be a over-killer if the buffer has
free space, as it would run the expensive sequence of disabling both ETE
and TRBE and then requiring userspace to re-enable them.

> There is no happy path where there is a buffer error, so I'm not sure why we
> need the complexity of an extra case? There's no harm in disabling the event
> on a buffer error. Also it's hard to see what the exact scenario for PARTIAL
> is, because we set truncated anyway for fatal statuses. The comment in the
> later commit for the PARTIAL change just says "trace was stopped", but not
> why.

The trace can be stopped on Fill mode (stop on wrap) or Stop on trigger, so
it is not (only) about buffer error.  In these cases, even though the trace
unit is stopped, the buffer may still have space available, tracing can be
directly re-enabled in interrupt handler, thus the COLLISION/PARTIAL flags
are better choices.

Only when the buffer is actually used out (i.e., handle->size == 0), it is
appropriate to set TRUNCATED flag, since at that point we must wait for
userspace to read out the data.

Thanks,
Leo

