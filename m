Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25113C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vgjYeNTVTX6rqRmqUDB+RtaLvgr6oHZObz3FWgpgTU=; b=GFqPPKgN7ROzOZ41YrkObLeXor
	XLZ9YVtw0bBEsGLVDItndry1Si54tDbT/Iykctv1PtRjPoFXBtREgZ3WOg4cvXxBmesnjXndZffsU
	3IZm1gOdSP7au5P9HQf1P9cnbeZFtJoDaNKbXZwOBt1D5VDolr7vCmzFMkoO5NdgVAIoDV3NB2kKL
	DTMSHN1OafgBy10Oc7F77UQbBd+41/9+MnFuhoxWWCQi9WfRGOtuxYs0R4ASFU8OJwxdP79k65G+B
	QQFML9aRuibBF+7kfPQp28xedv9Ya98Wtb1i9/xw0WdBD9Ad0yc5WEreXrq56hr+5fbyIxogJi03R
	5+mZohtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREao-00000005F9w-35uf;
	Mon, 16 Jun 2025 18:30:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDpo-000000058cs-2vcH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 17:41:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2927150C;
	Mon, 16 Jun 2025 10:41:04 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AC5F3F58B;
	Mon, 16 Jun 2025 10:41:23 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:41:20 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Yicong Yang <yangyicong@huawei.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ali Saidi <alisaidi@amazon.com>, Leo Yan <leo.yan@linaro.org>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
Message-ID: <aFBXQGeYCO2nJYNG@J2N7QTR9R3>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_104128_780780_1B2CB8D3 
X-CRM114-Status: GOOD (  11.29  )
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

On Mon, Jun 16, 2025 at 10:29:48AM +0100, James Clark wrote:
> I was also wondering if we could just diverge on the tools side, but in
> reality it also has to stay compatible with the definitions of all the MIDRs
> so might as well keep the whole thing identical.

I think that'd be the best option overall.

The only thing we really care about updating periodically is the set of
MIDRs, and we can factor that out to a cputype-defs.h header, and
possibly generate that too (as with sysreg-defs.h).

Mark.

