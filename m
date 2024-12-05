Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18320E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZjVhFa2asUdoBtybvlAGGU/+Vg/GX/Ik9R9vBE0Ubw=; b=1iGK7EJxAAx7SyGCiLCdLK5bT6
	y8enR91c+d6OPH9VpETYAOG9mry5pp1HOJmqPCQv0P+btdWFeCd0IR8GQ7t+s+u6BspBHkszFHumr
	r6FYT36E2zFTLvqWxUSmeWbi8cdW8/voeimBZKp6AgfeTmUkGKig+649h1tqlzKTextSBOY7R00Gx
	E5AtUTTKcNp8gASrIctKljBCem3EWmym6MwptwgSTWU2axLJjRyYNOdup1kvB6x/P8BgbgbnqY/JE
	simmOZ1p14pG2fYke00IGmD4P9LczC4l+y3nDTEokLRbqx3GpJc/0cuQ2kGt+2TCEQ8C+Ypbb4/GP
	REAMzR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8A5-0000000FMor-0Yoc;
	Thu, 05 Dec 2024 09:28:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ894-0000000FMhI-0XXD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13734A42AEC;
	Thu,  5 Dec 2024 09:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B7AC4CED1;
	Thu,  5 Dec 2024 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733390856;
	bh=Kv1oegbIuBj+bRVgx2yuah3tYOZ7jP9hLeTNPPI8eM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ruM+KNnvxw6+yXSZbjX1N1ZVvIpayLAnNfvrrzUofA4HmwnSYuS8iqQ7Fzv85jlmo
	 Cm/X65LDu3iDj8muk7zzG6ZtsQS1dx9kmEHxL1Ll02s0lP/kGE9Gk0JOcnXNpo1owZ
	 mAD3KHEIzfnt5e05qbrLYnwCXLoKCiLnIcjwe3eo=
Date: Thu, 5 Dec 2024 10:27:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: James Clark <james.clark@linaro.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, stable@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>,
	patches@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Yang Jihong <yangjihong@bytedance.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	Howard Chu <howardchu95@gmail.com>, Ze Gao <zegao2021@gmail.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Weilin Wang <weilin.wang@intel.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Yang Li <yang.lee@linux.alibaba.com>, Leo Yan <leo.yan@linux.dev>,
	ak@linux.intel.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	Sun Haiyong <sunhaiyong@loongson.cn>,
	John Garry <john.g.garry@oracle.com>,
	Justin Forbes <jforbes@fedoraproject.org>
Subject: Re: [PATCH 6.12 470/826] perf stat: Uniquify event name improvements
Message-ID: <2024120517-reason-icing-8e77@gregkh>
References: <20241203144743.428732212@linuxfoundation.org>
 <20241203144802.097952233@linuxfoundation.org>
 <f2ada8a7-165b-41fb-8b7b-3c0d16bb8216@leemhuis.info>
 <deb83bf5-2342-479c-b1bd-7f8c49f5b1d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <deb83bf5-2342-479c-b1bd-7f8c49f5b1d4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_012738_229904_93DABD2F 
X-CRM114-Status: GOOD (  22.20  )
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

On Thu, Dec 05, 2024 at 08:54:15AM +0000, James Clark wrote:
> 
> 
> On 03/12/2024 5:24 pm, Thorsten Leemhuis wrote:
> > On 03.12.24 15:43, Greg Kroah-Hartman wrote:
> > > 6.12-stable review patch.  If anyone has any objections, please let me know.
> > > 
> > > ------------------
> > > 
> > > From: Ian Rogers <irogers@google.com>
> > > 
> > > [ Upstream commit 057f8bfc6f7070577523d1e3081081bbf4229c1c ]
> > > 
> > > Without aggregation on Intel:
> > 
> > My 6.11.y-rc and 6.12.y-rc builds for Fedora failed when building perf.
> > I did not bisect, but from a brief look at the error message (see
> > below) I suspect it might be caused by this patch, which is the
> > second of the patch-set "Event parsing fixes":
> > https://lore.kernel.org/all/20240926144851.245903-1-james.clark@linaro.org/
> > 
> > To my untrained eyes and from a quick look I guess the first patch
> > in the series needs to be backported as well:
> > perf evsel: Add alternate_hw_config and use in evsel__match
> > https://lore.kernel.org/all/20240926144851.245903-2-james.clark@linaro.org/
> > 
> > This is 22a4db3c36034e ("perf evsel: Add alternate_hw_config
> > and use in evsel__match") in mainline. I tried to cherry-pick it
> > on-top of 6.12.2-rc1, but there were a few small conflicts.
> > 
> > Ciao, Thorsten
> > 
> 
> Yes I imagine both commits are required. Another option is to not backport
> this one. It looks like it's mainly to fix a test, nothing is missing or
> wrong from the output, just the formatting is off.


Thanks, I'll just drop this patch from the stable queue for now.

greg k-h

