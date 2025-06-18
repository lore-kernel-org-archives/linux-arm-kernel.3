Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93979C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YL86OvJyPmwEjpN8LH4AbWSZd3ri6FglbDePDSbQD3I=; b=4tgChdbbWN8sRx1RQ+Vg8uD7yi
	n1dXem5Rngq17ABP+/29n5kAKuG/03lYpqNU0zHzwtemApW9bGYe3hepH3mxtezDACsVpVzCyRGlW
	xEfoRYUaXRtMC3HsnsCH02rC4lQ8t6sU9ZfdszXZshKwHFiRfGFQeyuPlsU4XCnXB4n+8QIRTPe+n
	lq4YSpCanMAMHYxAcQp+O+H+39V76PD3LnDOwu5R9w8G84m9oBgk4awXDvOKgq/wtKT0J+n2Okmzm
	OZCP5dR2rigsok5kX4p+vUszQ5kKwrS2Iurhd+tVC0Eqb1vsK79ZZj0OBXreZRaqt0r1gLhUUy24k
	xqjzc4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyBv-0000000B9LC-14AR;
	Wed, 18 Jun 2025 19:11:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsdB-0000000AGLg-0Zus
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:15:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47C6CA4FFC0;
	Wed, 18 Jun 2025 13:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73704C4CEE7;
	Wed, 18 Jun 2025 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750252507;
	bh=l7dK2s+tHt2VVkd90I7sqvan3K9gBnQs8sPn/1yFon0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQs9qgWqR/zw9deq52GhNt+dLEwGGbzmZrvcBImHv4OAbz2u2HyI8ZjT3nX9tmpf9
	 QYE0F7kxd49UtFDCqGjxT/jZlksPToMqt0vlrK0wge4smQRetYqOc3rwKuOmQVWuga
	 Tu2uykgX3z4Zdzdbx2LLoma1x4c/Hqr6yBy49Cfc5FyWmzIH69NNSrb9pstOzs1RCa
	 tRko4MVlOx4C0vuDeyw+mGCPjx9nVeflcBQYDg0eJsife2rAZTQyDDKo8ZTyNsvyKV
	 s1yuGTNqDIuDJYbowkQftLS/U9WBHIwUZew166iFuus3X6xutZ3YU+nJSgBd/5IZmm
	 NZYfkukY1azUA==
Date: Wed, 18 Jun 2025 10:15:04 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	yangyicong@hisilicon.com, James Clark <james.clark@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ali Saidi <alisaidi@amazon.com>, Leo Yan <leo.yan@linaro.org>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	yangjinqian <yangjinqian1@huawei.com>,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
Message-ID: <aFK72GUlT-EStfU2@x1>
References: <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com>
 <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
 <20250617141810.GB794930@e132581.arm.com>
 <aFJ-Za6oRGKKASN1@J2N7QTR9R3>
 <20250618112440.GC794930@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618112440.GC794930@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_061509_236928_DAE25DA5 
X-CRM114-Status: GOOD (  16.66  )
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

On Wed, Jun 18, 2025 at 12:24:40PM +0100, Leo Yan wrote:
> On Wed, Jun 18, 2025 at 09:52:53AM +0100, Mark Rutland wrote:
> > If we want to share headers between userspace and kernel, we should
> > refactor those headers such that this is safe by construction.

> > There is no need to update the userspace headers just because the kernel
> > headers have changed, so the simple solution in the short term is to
> > suppress the warning from check-headers.sh.
 
> Sure, makes sense for me.
> 
> @Arnaldo, as Mark suggested, do you want me to send a patch to remove
> cputype.h checking in check-headers.sh or it is fine to keep the warning
> until finish the header refactoring?

It is ok to have the warning, its just this one at this point and it is
serving its purpose.

When the refactoring gets done, it will go away. Think of it as a
reminder :-)

- Arnaldo

