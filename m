Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DFDCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 11:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayyGuPXNbzMLe8mQZepDWEiqCjn5ZdZsLi7kFkvJiOo=; b=H+YWPCkdhBKhV20WxIiALNKvGc
	t0RgJnyvEalYJWDSxyCVKaztQyD26zLAR+Vv/Xy0HVfXlgtmF98sREOIm+2ciItzFT6A6pa7hfB9N
	DrOC96M9hFVPOvkRu19tgr4vSK5BpxUvaTXKwB3Hrs+O8iwyFH3rBfGDce3mG/t4BAEN9GlsJ8Tz+
	danCxPirtkD6SsQaQ6KlhakPztpmwdH87MRwbjvGe9+brv6Iy1OLJmHIKimnvfsATDmcK2oB7wybh
	p2v1o92JAIiw/YtMe94kKKnsUuad8m4XEjWJZcRMxN27igCsX878WxzednmJFpjfnk+vWlBg/l+Ui
	6R+QylLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0QM-0000000AhAO-3aFU;
	Mon, 01 Jun 2026 11:03:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0QL-0000000AhA1-188o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 11:03:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E75391E7D;
	Mon,  1 Jun 2026 04:03:05 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78C693F632;
	Mon,  1 Jun 2026 04:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780311790; bh=Gn/MPnQncWjyVKr1C8mFGSS5/tSH4yD2SL94sLUzlG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhKvFbbVn3oyAQ1xfG8opZ7YgHS/Fi4eQfWZZUiQwELi8O1NmWx6DhTEPkEAARcyM
	 7+oDtUKwTJ+Du1Rj9JKoM6Q0qoFK69fSnCn5VgflkkWfJhOv5rA/r16N6WbFvgdSYV
	 stoJeMjLB9zOxHjaCvzy2IexjtP+A/b1C3xf+H84=
Date: Mon, 1 Jun 2026 12:03:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	Leo Yan <leo.yan@linux.dev>
Subject: Re: [PATCH v6 0/8] perf cs-etm: Support thread stack and callchain
Message-ID: <20260601110308.GN101133@e132581.arm.com>
References: <20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com>
 <ahmpSnDTJ14_BNiv@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahmpSnDTJ14_BNiv@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_040313_345680_BC43D0C1 
X-CRM114-Status: GOOD (  12.74  )
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

Hi Arnaldo,

On Fri, May 29, 2026 at 11:57:14AM -0300, Arnaldo Carvalho de Melo wrote:
> On Tue, May 26, 2026 at 05:59:36PM +0100, Leo Yan wrote:
> > This series adds thread-stack and synthesized callchain support for Arm
> > CoreSight, which comes from older series [1] but heavily rewritten.
> 
> Hi Leo,
> 
> 	Please add what changed from v5, v4, etc.

Will do. I am waiting a bit for James' workload test series, I might
rebase on it and send a new version.

Thanks,
Leo

