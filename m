Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884C6C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvJrUCYeofuYPHAjARFRWr5l7qxZ1/+bhoCs1SbUnvc=; b=Zze3xJLgE/HHeQEYEfxFSs2Hvm
	VNjA5GgBVYzPRp0qF3nJC24Ws1E4I9AnsdV1zh/vWqWoLvid4YJ87zxoeYuXIbLJSx2pRsc2543xC
	KHnaSFzTllB9xv7kS19L4JJsE3hy0hyE/OPeUbuPqRIFIL901gzqDmiG/7/evRpRoQSj7qNZeXek7
	Fnphs6tdSQbO4o/Q3oIq09Du3FjGKPTY8KbLO8qlKTbcxM8ZEWbyc/qI171dThsfMWC7AGMhzyhyJ
	Yf0fYSlYsE8Ah/veR5zWnyYcqT65c2qnovCHLj3h0b8JICbfMlKjTZKiqYAoWBTRQ2BrHeE1h+xIN
	SE0d3aDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuBp-0000000Ejne-1VPi;
	Fri, 14 Feb 2025 11:49:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titwM-0000000EgjH-0hL3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 11:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gvJrUCYeofuYPHAjARFRWr5l7qxZ1/+bhoCs1SbUnvc=; b=EA2UNALB7k0m8xBfELX4M+lMXA
	jGxq5sShKOW2IESK/+gWlL1zaMowMOP3Ae1a0uGa/ZLpf0L2MwA5f2faTtXfSkt/APuoK3p0Rc0qX
	fR6xC1fzYNxdxXLN+EVBUGwbAUg2ASUtWMwduDYAQTy9mlS5vLoQ7buu8I0YiaXreI2XIJKYAXW1z
	UbxBQ0J91t5DCTnHYBVoTIR64a6njsF3bBRcOlzFx09pmVIECWV1hSJqnyHOrwneYQnJOwepDobIU
	lsKWMWc/GVaBtfiMH3PHrGqtwN5ZXalNaIhPe0CuBId+R7bJOfMveljOZCFU1hEQ0ooToBVdctpIv
	6KYeq4+g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titwG-00000001Eok-2sUY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:33:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C77C113E;
	Fri, 14 Feb 2025 03:33:12 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A1363F6A8;
	Fri, 14 Feb 2025 03:32:51 -0800 (PST)
Date: Fri, 14 Feb 2025 11:32:49 +0000
From: Leo Yan <leo.yan@arm.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Graham Woodward <graham.woodward@arm.com>
Subject: Re: [PATCH v1 00/11] perf script: Refactor branch flags for Arm SPE
Message-ID: <20250214113249.GA6174@e132581.arm.com>
References: <20250205121555.180606-1-leo.yan@arm.com>
 <CAP-5=fUH6X2F5S5eH+iU+-hT0vNvMKPTqbGt=E9W06sG=MzxEg@mail.gmail.com>
 <20250212085439.GA235556@e132581.arm.com>
 <CAP-5=fX6veqJYbTRfOiOqtpg8Dq+m3nZJRd4zEBCZeNiwB5Xpw@mail.gmail.com>
 <Z62DOPuDJ-PrcHQw@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z62DOPuDJ-PrcHQw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_113256_968877_57383C67 
X-CRM114-Status: GOOD (  17.30  )
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

Hi Ian, Namhyung,

On Wed, Feb 12, 2025 at 09:29:28PM -0800, Namhyung Kim wrote:

[...]

> > > > Built and tested (on x86). A little strange patch 5 adds a new bit not
> > > > at the end, but "Sample parsing" test wasn't broken so looks like it
> > > > is good. I was surprised the use of value in the union:
> > > > ```
> > > > struct branch_flags {
> > > > union {
> > > > u64 value;
> > > > struct {
> > > > u64 mispred:1;
> > > > u64 predicted:1;
> > > > ...
> > > > ```
> > > > didn't get broken. Perhaps there's an opportunity for additional tests.
> 
> Probably because it just checks the value as a whole u64, not each
> bitfield.  But it seems to test if the value of the input sample data
> and synthesized-and-parsed output sample data is same.  So it may not be
> important what value it has.
> 
> Anyway it'd be nice if any ARM folks can review this series.

After discussed with James, I concluded that it has risk to break
other arches (e.g., x86 LBR).  So I have sent out patch set v2 [1]
to keep the existed bitfield layout in patch 05, and added Ian's
review tags.

I expect James will give a review the new series.

Thanks,
Leo

[1] https://lore.kernel.org/linux-perf-users/20250214111936.15168-1-leo.yan@arm.com/T/#t

