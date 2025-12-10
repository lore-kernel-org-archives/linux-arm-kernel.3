Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826B7D3C92B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 16:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZbdO134BBsVhwZgF+BFYibhTW9I3uMcf/ZCcSSjIO8=; b=Tgf0Rt8bhRw0hDI9Twt6B+mtrb
	qHTQuAXBkVeMrOlnyDg4RM1bzYF8Nqxvqb1zn7M+UJidKN2WwOObu/Dq0ep6EbbK9WqZFxBmDq2mS
	XN/LeYFuBd45EQYrGREas54dSvk2M+synSc1KEHb/ltSBG2nrUP6kJBRS9+QRj991p+oNa/PNBOnP
	mpw3PL5UqAzdBbLJsnMUOnjmmVHDKmCUQDxo7TB8xBfsMslkt6DBRTpMWi8TyxtmydI09++r5y+hy
	EkYfyLxTXvSYE9bOiLtLia07m/dv7KXzqtYNwQQNAe/GTc9gJA1ADb3TDObdSSGZZV1pbhyfV9RRq
	Stwob2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMv5-0000000FdMM-3iic;
	Wed, 10 Dec 2025 16:20:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMv3-0000000FdLM-2kzH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 16:20:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50DE2153B;
	Wed, 10 Dec 2025 08:19:53 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28C553F73B;
	Wed, 10 Dec 2025 08:20:00 -0800 (PST)
Date: Wed, 10 Dec 2025 16:19:58 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 08/19] coresight: trbe: Use PERF_AUX_FLAG_PARTIAL instead
 of PERF_AUX_FLAG_COLLISION
Message-ID: <20251210161958.GA724103@e132581.arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-8-7da32b076b28@arm.com>
 <5f6bcd93-b565-4b10-9a2d-6851141e5dbe@arm.com>
 <f1ac7190-bdd9-4725-8955-d82d6f1912fb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1ac7190-bdd9-4725-8955-d82d6f1912fb@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_082001_739029_E0B73FA0 
X-CRM114-Status: GOOD (  17.52  )
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

On Tue, Dec 09, 2025 at 01:40:35PM +0000, James Clark wrote:

[...]

> > >   	if (!is_trbe_running(trbsr))
> > > -		perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
> > > +		perf_aux_output_flag(handle, PERF_AUX_FLAG_PARTIAL);
> > 
> > This is interesting. So there is a no possibility for the records to be
> > overridden in the perf ring buffer and incomplete record is all that can
> > happen when TRBE is stopped, without stopping the ETE first ? Could both
> > of these scenarios might be possible as well ?
> > 
> 
> There's no chance of overwriting because that would be the TRUNCATED case
> and the event would get disabled. PARTIAL seems to be when there was an
> error that's recoverable in the driver only, but as in my other comment I
> don't think the extra complexity is necessary and always using TRUNCATED
> would be enough.

If I extend a bit, I would say that the TRUNCATED flag is used to prevent
buffer overwrites, while the other flags indicate why a record is
incomplete.

Thanks,
Leo

