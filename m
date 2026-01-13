Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A44D30CC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 20:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BynuQiMi01cz5BlHnWaY8mSPq1dRQeDNZnD2puYb03U=; b=RnQw0QS4H//sfgKjJX1KGkqg3j
	ZukA4YSC/KODmPqzqbN+NKDmkCo8GRRaYDgjoQYiIUg6eFKXS6sF/5ttxszHpYaWEsUfLzUfmNYw7
	OCikqHzaEmNT/ed1EayGsLrnIJghgA59w0vunQtfIqfjSBcrNOaaNRZdcFpA0wTKkNFfT5YZX2XBM
	TCZdgXCqca79mJqoOR4zE4Q9QqUgoCzGgzd4K5+FbM94v6/qae+t2li7fafrPdX0kVdcMQA8fbn00
	Iid8gqoce9wT3ZQMyPXBGDDs7AUzZ+d0PqLauWiay4IvI68r1qG2EBP0cugxtq5fsPel/MJLnsYCW
	0k9MhAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflM7-00000007hzM-3Zsr;
	Tue, 13 Jan 2026 20:51:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflM6-00000007hzG-0D0P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 20:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDDC560018;
	Tue, 13 Jan 2026 20:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113D5C19422;
	Tue, 13 Jan 2026 20:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768337468;
	bh=NFwBjT4kFkm446c7jci53iP8L/+BbkTGCvjXyVA9DIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpGcWh0R5DZSq4fqhi8iLVZR+rsMu+oG3PF9MwSocWq80nSppKZSoMZofp9Rm6vDn
	 fgYBwHuA+87BfEPr8dlizTCBGh6vRpv1HFHxdvp1qcmaQz3zIyQOfTL4IfB89JkYE7
	 TeepAF3e2oZ9TsTUEUkWJPwv2CU0Mt0//YIOdyuhgZf1iBJoZ5pVmbT7y1BMHDDaU2
	 E0T8TdvLaOba0U3Lt7a222wAcQnqF+uqXPCgne2uT/Ur/ZPSL4L/qYdPNdGjrbzEbR
	 2QiQnvRT6vOaUr53xhLsoefy5C2oJpA7Myw6oTL08hjyhcIVMm9MDndB+U1/rObKoT
	 TRMvH1kf7ohSA==
Date: Tue, 13 Jan 2026 17:51:05 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v3 00/12] perf cs-etm/arm-spe: Remove hard coded config
 fields
Message-ID: <aWawOTKpREcVTtUL@x1>
References: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
 <CAP-5=fXrLck7XACML16hzQO-pHGXA+qAM69kDDC6Za4O5S=SmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXrLck7XACML16hzQO-pHGXA+qAM69kDDC6Za4O5S=SmA@mail.gmail.com>
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

On Tue, Dec 16, 2025 at 01:00:32PM -0800, Ian Rogers wrote:
> On Fri, Dec 12, 2025 at 7:32 AM James Clark <james.clark@linaro.org> wrote:
> >
> > The specific config field that an event format attribute is in is
> > consistently hard coded, even though the API is supposed to be that the
> > driver publishes the config field name. To stop this pattern from being
> > copy pasted and causing problems in the future, replace them all with
> > calls to a new helper that returns the value that a user set.
> >
> > This reveals some issues in evsel__set_config_if_unset(). It doesn't
> > work with sparse bitfields, which are an unused but documented feature.
> > And it also only writes to the attr.config field. To fix it we need to
> > start tracking user changes for all config fields and then use existing
> > helper functions that support sparse bitfields. Some other refactoring
> > was also required and a test was added.
> >
> > Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Outside of some nits, for the series:
> Reviewed-by: Ian Rogers <irogers@google.com>

Are you ok with v4?

- Arnaldo

