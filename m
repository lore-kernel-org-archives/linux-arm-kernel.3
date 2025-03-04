Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B01DC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zL/g7s9StB2KuMTnvmF5A/JcdZZj6JhLjRG0xgR45EI=; b=GZXLqHA9nOJyofl4BMYihtUv62
	C0F1DM5Vmm8fOWTrm0yovwta+aWMrhCNulvlMYPh3zb+5MxIjzmHBK/xdkaHTIYe6yjHxLy5mJTNT
	L2gA1vAcfbT/9ekAsRbHi/+4tgK7PMqKKphGsyQ3Y0ixne1O+MSEqtL8jWJYhd369MjSBB8Ffr/rh
	eXMZbYiAX+vUW+6uUA4aCVRjEb7tjc+BWfC9WiIXkHYxYxKYHVkfW+s50KLNN+Oef/TmPhJbW85m9
	W7XcO+3TcJHGLGpNUIzBbLFWIs8K/h9cfnN7rTZxbLnfwYa7F++wg4+ZeRLaLqELOJfX5eBfsAzin
	Lw+BvT2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZ8C-00000006DRH-3i3Z;
	Tue, 04 Mar 2025 20:44:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXEs-00000005t5y-2xpq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 18:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4063D5C62E3;
	Tue,  4 Mar 2025 18:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E66CC4CEE5;
	Tue,  4 Mar 2025 18:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741113813;
	bh=MaCdA5ZR6l7zULNgrfHmO/03rDMi0kLhXHTr9N98E+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqcGzJYUnUMbMA8p6Xw5DhbbdRmftfzfiR8HsuWPyAXJuhhlK+TWF2FcfQQ+0RS7a
	 LtbXJZWdAVtwFiNexFEBJlaF0uhp2yXqrCIHWviOIOF4W6dJ89ZN8GlQarfJw5yf/4
	 sgt98rxb8LPG8D6VWFi1ee6Gm2eIJFNIbDPR5GL+ytMrZlGUGXgjMYKQOJPE2PEFKT
	 eDTJg/iTyevfJo2ShASIYpqmOeB0Yotlzd3Vf4Xn4hmBGuAx5fs4tKnYYjqM8sFleT
	 Y+OCIyYa4OEA0C+650mULD98TNs/Z2Joq6PGsBkLEMx92FxWGxjBmsCL0Rfv36gKOo
	 s+KrmRXmasc7Q==
Date: Tue, 4 Mar 2025 10:43:31 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Will Deacon <will@kernel.org>,
	Graham Woodward <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/12] perf script: Refactor branch flags for Arm SPE
Message-ID: <Z8dJ00nIeVqMMncD@google.com>
References: <20250217195908.176207-1-leo.yan@arm.com>
 <20250303093853.GG2157064@e132581.arm.com>
 <Z8YYY2Q_ZPIaZ74g@google.com>
 <20250304113350.GK2157064@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304113350.GK2157064@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_104334_783009_BF6B583C 
X-CRM114-Status: GOOD (  23.05  )
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

On Tue, Mar 04, 2025 at 11:33:50AM +0000, Leo Yan wrote:
> On Mon, Mar 03, 2025 at 01:00:19PM -0800, Namhyung Kim wrote:
> > On Mon, Mar 03, 2025 at 09:38:53AM +0000, Leo Yan wrote:
> > > Hi Arnaldo, Namhyung,
> > > 
> > > On Mon, Feb 17, 2025 at 07:58:56PM +0000, Leo Yan wrote:
> > > > This patch series refactors branch flags for support Arm SPE.  The patch
> > > > set is divided into two parts, the first part is for refactoring common
> > > > code and the second part is for enabling Arm SPE.
> > > 
> > > James has given review tags (including the new added patch 06).  Could
> > > you kindly pick up this series?
> > > 
> > > Sorry for pushing a bit, as we have dependency on it.
> > 
> > No problem, I'll add it to the tmp branch and run some tests.
> 
> Thanks a lot, Namhyung!
> 
> I saw you have picked patch series v3 in the tmp.perf-tools-next branch.
> On the other hand, to follow up on Adrian's comment, I have sent out
> v4 to remove an unnecessary change in patch 01, and the rest of the
> patches are exactly the same as v3.
> 
> Please consider picking the latest change (either the whole v4 series or
> just the updated patch 01 would be fine).

Sure, I'll add v4 to the tmp branch soon.

Thanks,
Namhyung


