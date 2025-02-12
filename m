Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5420C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6iBaAGe0KrY+OEZak1BeJk2DKIsCei3RU56QURTU3c=; b=PreYfY/OrOaaH+n5diAzEY9Q72
	y+8VWSEs7mYprpDR9ttllhd+X1kfXTFRKW5o9OoHAGf+biGAR+1aXk5NlJASp9H18zm5+0HPTAQaU
	2CmJ/MBIr8BWWQ8kAWQR9KRtS+vb6W+3+TQcQujo/UijeWYTeoFewWXzh2Zz2RZVYD8iM4al/CKw8
	lYYmxRoNL6r+9OB69KpAb2Y+HU3blxwbC47cW27Ds7KWa1/GWKMToa5cItMVcu+jNMDmoNsDtnQxp
	l5JLvCEqv5n5baeITOqy8Zk5TjUWKiGojk9EMUKb42GhliHoJAGOlD4X14MGUgNQO4WRyfALODxSs
	hnpyPzrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8fT-00000006iEi-1OyQ;
	Wed, 12 Feb 2025 09:04:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8W7-00000006gnU-2Nvu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:54:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9D0413D5;
	Wed, 12 Feb 2025 00:55:04 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6925B3F58B;
	Wed, 12 Feb 2025 00:54:43 -0800 (PST)
Date: Wed, 12 Feb 2025 08:54:39 +0000
From: Leo Yan <leo.yan@arm.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
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
Message-ID: <20250212085439.GA235556@e132581.arm.com>
References: <20250205121555.180606-1-leo.yan@arm.com>
 <CAP-5=fUH6X2F5S5eH+iU+-hT0vNvMKPTqbGt=E9W06sG=MzxEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fUH6X2F5S5eH+iU+-hT0vNvMKPTqbGt=E9W06sG=MzxEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_005447_673261_F7FBA3C1 
X-CRM114-Status: GOOD (  19.94  )
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

Hi Ian,

On Tue, Feb 11, 2025 at 02:34:46PM -0800, Ian Rogers wrote:
> On Wed, Feb 5, 2025 at 4:16 AM Leo Yan <leo.yan@arm.com> wrote:
> >
> > This patch series refactors branch flags for support Arm SPE.  The patch
> > set is divided into two parts, the first part is for refactoring common
> > code and the second part is for enabling Arm SPE.

[...]
> 
> Reviewed-by: Ian Rogers <irogers@google.com>
> 
> Built and tested (on x86). A little strange patch 5 adds a new bit not
> at the end, but "Sample parsing" test wasn't broken so looks like it
> is good. I was surprised the use of value in the union:
> ```
> struct branch_flags {
> union {
> u64 value;
> struct {
> u64 mispred:1;
> u64 predicted:1;
> ...
> ```
> didn't get broken. Perhaps there's an opportunity for additional tests.

If the branch stack's flag sticks to a hardware format, then the patch 5
is concerned.  My understanding is the branch flag is a synthesized
value (see intel_pt_lbr_flags() for x86).  So it is fine for rearrange
the bit layout.

The "Sample parsing" test is for big/little endian test, it does not
test for specific bit ordering, this is why the test passes.

If you think it is safer to move the new added bit at the tail of the
bit definitions (just before the 'reserved' field), I can send a new
version for this.  Please let me know your preference.

Thanks for review and test!

Leo

