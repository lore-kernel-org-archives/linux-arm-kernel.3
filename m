Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CF5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XALqRiTDTuOSqYmjbalZaLG3ALZoTVNBky71yHDurWY=; b=bQIBO90s1WyNLOMsaAm0Aj/2SX
	tC+uJeo8Yuw/rd1zyLI54WofBBjVeRI64Q3jTHV9Wv8S6do1ERvqs1fdHZjJ4IOtdft2sFwZFJQsZ
	CNQiH1UB2L4gQW1IJTMzlBn2o1Mn27Lt1M5gA4GVMiossQATHnJPI7EHaov3r/RxssmkP6HdhFFdw
	cRxvvTXnGh31DGsimz3hwJvyb9Gc4VlRaq8GSeRorRfhJfZWKAVKuHMbpCgeI0YxbqiHxoLiFCT2O
	A/YVSRTbGQKuHi+kDDey8Vy2ZYlc3K0vHVQ8M1se1ELkUjOMiVfUKYCpeYJWQ03ISIvuOeJxXiumI
	HggW4IbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5t-00000004YMB-1pvb;
	Tue, 04 Mar 2025 12:09:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQXC-00000004PzO-1Lzy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:34:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C189AFEC;
	Tue,  4 Mar 2025 03:34:14 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A21523F5A1;
	Tue,  4 Mar 2025 03:34:00 -0800 (PST)
Date: Tue, 4 Mar 2025 11:33:50 +0000
From: Leo Yan <leo.yan@arm.com>
To: Namhyung Kim <namhyung@kernel.org>
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
Message-ID: <20250304113350.GK2157064@e132581.arm.com>
References: <20250217195908.176207-1-leo.yan@arm.com>
 <20250303093853.GG2157064@e132581.arm.com>
 <Z8YYY2Q_ZPIaZ74g@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8YYY2Q_ZPIaZ74g@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_033402_408704_A6364533 
X-CRM114-Status: GOOD (  20.09  )
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

On Mon, Mar 03, 2025 at 01:00:19PM -0800, Namhyung Kim wrote:
> On Mon, Mar 03, 2025 at 09:38:53AM +0000, Leo Yan wrote:
> > Hi Arnaldo, Namhyung,
> > 
> > On Mon, Feb 17, 2025 at 07:58:56PM +0000, Leo Yan wrote:
> > > This patch series refactors branch flags for support Arm SPE.  The patch
> > > set is divided into two parts, the first part is for refactoring common
> > > code and the second part is for enabling Arm SPE.
> > 
> > James has given review tags (including the new added patch 06).  Could
> > you kindly pick up this series?
> > 
> > Sorry for pushing a bit, as we have dependency on it.
> 
> No problem, I'll add it to the tmp branch and run some tests.

Thanks a lot, Namhyung!

I saw you have picked patch series v3 in the tmp.perf-tools-next branch.
On the other hand, to follow up on Adrian's comment, I have sent out
v4 to remove an unnecessary change in patch 01, and the rest of the
patches are exactly the same as v3.

Please consider picking the latest change (either the whole v4 series or
just the updated patch 01 would be fine).

Thanks,
Leo

