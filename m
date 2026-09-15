Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6D5C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 00:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvVrBgg+vONYjj2Z+vL3bZIO/5A/H3xh1/bkiLsmcaQ=; b=kCLb+71uFnIGVA4IXxd3hrhfIa
	8FL2FWHx1aNC2hyTZQXu1ghs10LOYgnpvo++gSsCb01UKA21BST0t6WyvIJ87Erhwqii4ObNW52xw
	k0dSeV64Td6YR5NvUu9c78gyCey/ry6lBINRqbtscTK81VQLy679C52FNwVWC6bRfUuUrV8qJS/rG
	FrZTRrNZvkbbthoikw4LuQWJ0nLB/mHM3sN0g1qWymzJ5lWGJwJRevjTmE4W4XQreTgqGIYjjCKhG
	yCqZfneowkxroBpPIWwFCqybJCQ9xhE/DNk67MTyuKhLNrkOTOwvQDIQ3zWAizWDrp88SzTSZh/cT
	vCnkBedw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Gn9-00000004tpt-2Qk9;
	Tue, 15 Sep 2026 00:12:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Gn8-00000004tpn-2C3r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 00:12:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF2CB40732;
	Tue, 15 Sep 2026 00:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395CC1F000FF;
	Tue, 15 Sep 2026 00:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789431173;
	bh=YvVrBgg+vONYjj2Z+vL3bZIO/5A/H3xh1/bkiLsmcaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CDT7ph1+48JbmxfifrHwu7ho+8gWl2UZprSk6k8ihEBcybC8NLuEDTCilh5OmufL8
	 G2mpzcvcIKWh8Umw7kAfnCj2LblLjc4B4VqtSB3MOY4rTkbRrd3yiG/z3mWMV7g5x5
	 Qb300QSs3f5H/KTkHUCHqItsqcqIl/vkG1Iqrubw7dQNu72LozTSF3A0WYdu974aMN
	 Sw5E00VbxJSxHSE50aHPipaq8dlJOQwEHAWybhmOSiqHKBPMhkzOo51MYkjXr+/xN0
	 XBCTS2YPTujXEir5p0zR0BarialXzjxmfMl02/4FuMC+HA9J3/4AHAPIp8yAqkmiRN
	 s7ljNFc0fr6bg==
Date: Mon, 14 Sep 2026 21:12:50 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suyash Mahar <smahar@meta.com>, Leo Yan <leo.yan@linux.dev>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/14] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
Message-ID: <aqiNgmB8-C_TuGf9@x2>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
 <aqdL33fw9AoxTrPq@x2>
 <20260914081343.GF200420@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914081343.GF200420@e132581.arm.com>
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

On Mon, Sep 14, 2026 at 09:13:43AM +0100, Leo Yan wrote:
> Hi Arnaldo,
> 
> On Sun, Sep 13, 2026 at 10:20:31PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Tue, Aug 11, 2026 at 04:30:03PM +0100, James Clark wrote:
> > > Fix a few issues with per-thread mode:
> > >   - With TRBE, thread migrations hit a queue without a decoder assert
> > >   - On nVHE, everything looks like guest trace instead of host
> > >   - Tracing multiple threads didn't really work
> > 
> > This series applies cleanly to perf-tools-next but has no Reviewed-by
> > nor was processed by Sashiko.
> > 
> > Can somebody from the ARM camp take a look at it, please?
> 
> James has sent v2 [1] and I gave some words on it. Adrian also has one
> comment for snapshot callbacks refactoring.
> 
> Sashiko also sent out review on the series.

Ok, so it is still in development with open issues, I'll wait.

- Arnaldo
 
> Thanks,
> Leo
> 
> [1] https://lore.kernel.org/linux-perf-users/20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org/

