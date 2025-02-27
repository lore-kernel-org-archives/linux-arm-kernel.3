Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D019C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IMEA7+I1lNG6+Eupiawm3rjIQBkeaBYwdFdzeEBCJk=; b=KvIGGTr4lJUJFGpBRodLRwsLrD
	6COODNaB+7UtCfSDRUHmsLRWu0N1oOTuQFxmEc1O6wHfuDPAamIF6a3nKZ2Zk82Kdk+XmONuzbRfF
	3z6KLHjXXNGTgLFbUFAOK7ohxb838gCO9bCUlKyC0d6SnQ8utbzzYeQgw4C3JNKhzKOUDrsPK9bYy
	dsGZ2YtXipDe+PWo4RP/nLaqNQdjoJgJvBhJSTTB0pyMWg95kAs4Q6aZugqmFQxMxqtHQTcRfB/WD
	r2BA6kmg0UDKuzEAhnQUSotKViMJbyJAKlr9LYZ/+xf4d0PNwsveT6fRSFIsZxIp4+YCfYtU4Wib6
	h3UyZoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZC9-00000006gfo-0GVX;
	Thu, 27 Feb 2025 08:24:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZAb-00000006gUw-42xl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:23:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 659E72C1C;
	Thu, 27 Feb 2025 00:23:14 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 594FF3F6A8;
	Thu, 27 Feb 2025 00:22:58 -0800 (PST)
Date: Thu, 27 Feb 2025 08:22:51 +0000
From: Leo Yan <leo.yan@arm.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf arm-spe: Report error if set frequency
Message-ID: <20250227082251.GD1821331@e132581.arm.com>
References: <20250205183009.224182-1-leo.yan@arm.com>
 <20250217082008.GA8144@e132581.arm.com>
 <Z8AOpLW6RSUU09Ns@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8AOpLW6RSUU09Ns@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_002302_042724_62BFEC73 
X-CRM114-Status: GOOD (  11.04  )
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

Hi Namhyung,

On Wed, Feb 26, 2025 at 11:05:08PM -0800, Namhyung Kim wrote:

[...]

> > > After:
> > >
> > >   perf record -F 100 -e arm_spe_0// -- sleep 1
> > >   Arm SPE: Frequency is not supported. Check manual 'man perf-record' on how to set period.
> > >
> > > Signed-off-by: Leo Yan <leo.yan@arm.com>
> >
> > Gentle ping.
> 
> Sorry for the late reply.
> 
> Isn't it just -c <period> to set period for Arm SPE?  If so, it'd be
> better to say that explicitly.

Yes, '-c' works for Arm SPE.  Will change for this.

Thanks,
Leo

