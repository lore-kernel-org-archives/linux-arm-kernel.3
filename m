Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CB0C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=417XFVauoGyNbZ2fFsLPx+Qnk3yQVmipFdkn7193Vpk=; b=RncflEn12kANpueiakTrs8gLB4
	byxv/HcQDLIktGyY0PViu+OUCILi/gAQh3DiiDX5CtqcCwz2B4pvGfdxX5Uh6eJ3VVcDABbrNYVsG
	Y95egi8JI1bqTH3QoGymB04L/flzENK/iJd5hFuXINrF3z2eLCe1gvT5pJyCa1A8ELM3hl6Rvzr48
	FQQXGByrGFKwYyM/VcOfJ3VPqN8yZZjDNBeMU7FN7UO6kZ0mtFouGpU6i7EL3WKuf0JrwAJKMGSpo
	WFqqF2iv1kGE5/tUVAzgKYmbvbV1v1FnBRUPtlYHXCf5EicvVmNf7DdAv8r9yqPnVoKGG7s5rGEPS
	bKtzDsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvqA-0000000AkOh-1SoD;
	Wed, 18 Jun 2025 16:40:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRu1W-0000000ATp8-3yrK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 14:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=417XFVauoGyNbZ2fFsLPx+Qnk3yQVmipFdkn7193Vpk=; b=WThoNUorntfEJN604LiytVJ22w
	2Bwzz4xBnd2SzDzY/HMUodBAe9Rr1YhCmBcjjyV4tb0FoUGyAEqr1OYCBvfH3KzNoETKt8Z1PpVh3
	E2vYWUoj8yUdsJNKvmSuG0AM31W5+bLY2kxKURL0JXNljzwMTb5222P/nrucG18eaJVqAFZzbtZZQ
	uQz5XXxzrRO4+J9BNe3kRKsTAI+PN2g+Z7ReMaRLgGZKjQ/Oe1gPdwRwvZ1iDkVxjij32qK8lbqat
	TSDQSqIkQyUdo0R6oA4RhzzeaP033ALEwW3oa6eglCbjvYyxFbhbpwQp6V8d/hxhfSDDKOYF2ZxMT
	8DiqRZdQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRu1T-000000046y3-3hJq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 14:44:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6A1514BF;
	Wed, 18 Jun 2025 07:43:55 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E88D53F66E;
	Wed, 18 Jun 2025 07:44:15 -0700 (PDT)
Date: Wed, 18 Jun 2025 15:44:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
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
Message-ID: <20250618144414.GF794930@e132581.arm.com>
References: <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com>
 <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
 <20250617141810.GB794930@e132581.arm.com>
 <aFJ-Za6oRGKKASN1@J2N7QTR9R3>
 <20250618112440.GC794930@e132581.arm.com>
 <aFK72GUlT-EStfU2@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFK72GUlT-EStfU2@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_154420_143147_9BE9BC47 
X-CRM114-Status: GOOD (  13.71  )
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

On Wed, Jun 18, 2025 at 10:15:04AM -0300, Arnaldo Carvalho de Melo wrote:

[...]

> > @Arnaldo, as Mark suggested, do you want me to send a patch to remove
> > cputype.h checking in check-headers.sh or it is fine to keep the warning
> > until finish the header refactoring?
> 
> It is ok to have the warning, its just this one at this point and it is
> serving its purpose.
> 
> When the refactoring gets done, it will go away. Think of it as a
> reminder :-)

Fair point. Thanks for confirmation!

