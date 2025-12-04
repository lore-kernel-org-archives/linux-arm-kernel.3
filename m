Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07222D206B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkQCstPwFaXUBoLnwB8u1TIrNKfkW3xWkDDKGz+ydi8=; b=K+Gj5ZUn5zNsfn9/aQWsvngCeE
	WPhzEKkZqAiVAToemYEbjhe66uxXH7aJA9A81lvXNiMs3yCn4DIUwbZMgddPETrBIsFnE2BYYKwry
	Z3VcxlC4Uk8xGkzZ7nhk609LLCCJeOgiHttMKl/8Zx7+TD7cfu9tRRxLuNX0PPv5BsBxvsf5RgXOx
	pkBCmbD010Uq/uhWMmwkDIOhyWQkRjYR69GzWpO2ax7mnrq1yD5GuNqnL/AQe02ZQHOK/XIOt/g3G
	YGMaISltXAQYQcOgqKmWzLrJASsGz8ISGyVC/vFa0Ao1FfXfjN6H1ztqRF/P7GvX6ml6qbQ30jmUG
	HCBbhYYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAYc-000000088ez-2ELq;
	Thu, 04 Dec 2025 14:43:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAYY-000000088eR-03lR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 14:43:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA605339;
	Thu,  4 Dec 2025 06:43:31 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDAD23F66E;
	Thu,  4 Dec 2025 06:43:38 -0800 (PST)
Date: Thu, 4 Dec 2025 14:43:36 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] perf cs-etm: Don't hard code config attribute when
 configuring the event
Message-ID: <20251204144336.GN724103@e132581.arm.com>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-6-22ecbbf8007c@linaro.org>
 <20251202121528.GX724103@e132581.arm.com>
 <857538e7-cac2-4871-9711-4c434420df8a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <857538e7-cac2-4871-9711-4c434420df8a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_064342_090750_4B6273B6 
X-CRM114-Status: GOOD (  16.79  )
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

On Thu, Dec 04, 2025 at 02:08:59PM +0000, James Clark wrote:

[...]

> > > +	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid", &ctxt);
> > > +	if (err)
> > > +		return err;
> > > +	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid1", &ctxt1);
> > > +	if (err)
> > > +		return err;
> > > +	err = evsel__get_config_val(cs_etm_pmu, evsel, "contextid2", &ctxt2);
> > > +	if (err)
> > > +		return err;
> > 
> > Seems to me, this is not right.  The current code checks any context
> > ID setting but it can tolerate if missing "contexid[*]" format.
> > 
> > After calling evsel__get_config_val(), if any "contextid[*]" format is
> > missed, it returns error and will diretly bail out.  As a result,
> > cs_etm_validate_context_id() will always return error.
> > 
> 
> Missed by the driver or the user? evsel__get_config_val() only returns an
> error when "contextid" isn't published by the driver, not when the user
> doesn't supply one of those options. The actual user supplied value is in
> the out param, not the return value.

My question is for missing format from user.  Thanks for reminding the
error is only for driver's publishing.

> Having said that, this does make it an error if the driver did stop
> publishing one, which might be too inflexible and is a new behavior. I can
> change to it ignore the errors instead.

Yeah, this will likely break nVHE / pKVM cases.

Thanks,
Leo

