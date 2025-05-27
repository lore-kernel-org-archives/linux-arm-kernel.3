Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38650C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 20:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEjjjlHFoq7o+/yTqxUfZqrkGfEGUmO+Aiv+HInYXwg=; b=pRxL8yXrntWFKA1ilITUSG+0QH
	lCTMU2M6Mt+q7w3uds1QqSEF3r/IpoxUrg0M8cRPLCQvBPGf4o505u4jcZQR4Rbv/lRBeQFvkXqBK
	SQ7DHoUdb123wWkHdXnCa8W1o+O6VTJ2BCgU3ZB7wjK/rJknDhQpA51+OL6wA927tbI8369OdJxnY
	4j+7/Ryh37j7KBrEkV3xladPWlOjOPpAG76Gw/9ogzR4towU0fDDeoSgTE4hgq3Qwqw/YQuKygqlY
	L3jCzzQXx1SevRHZG/090aC7cPbVQpj/eoP8wbNRzGVJ5Zb3F+xv4aixN1AwG9gmIabpoEU2nKFoQ
	WON4H9cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1Nu-0000000BYF5-1BG6;
	Tue, 27 May 2025 20:58:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1Jg-0000000BXwj-2VU7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 20:54:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1774A4AA01;
	Tue, 27 May 2025 20:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64762C4CEE9;
	Tue, 27 May 2025 20:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748379272;
	bh=G2bOQ+/WCz0WzAESN4fFva64rvuKHL86G/4KuFHYgmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NM5t3HpwpsrM8pbTinC55acmXH11b2d/DTDsGz8/6R4vIOsLyaPkE480likyRaL1q
	 kcVTD041FF9AIMa5s+L1kTN7XTd0Ws6VTnPBkKgzgJdvDYBB6dSc3H4pMe1oQLDluf
	 4Lqq1Q8v+66CPLTeCZB/LZek/48LBw8eluC/TotB2b+CI5Y8gagqtran4VXgpqOVkj
	 sfYpFcByRuW2cUgU9963tIjfh5fVA7p6cwM3AH29h6xPjcvF7UWHKhwdWesO79AzY/
	 SpTdqEr+kaHW2aMx2xe8WPfB/vLBGpFCDmTDUxCF6qp644ykKqpm0KPFM+BmeETC8w
	 oKWO7LCZkrn5w==
Date: Tue, 27 May 2025 17:54:28 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, namhyung@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, peterz@infradead.org, mingo@redhat.com,
	mark.rutland@arm.com, jolsa@kernel.org, john.g.garry@oracle.com,
	james.clark@linaro.org, leo.yan@linux.dev, irogers@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, jonathan.cameron@huawei.com,
	hejunhao3@huawei.com, linuxarm@huawei.com, wangyushan12@huawei.com,
	caijingtao@huawei.com, xueshan2@huawei.com,
	prime.zeng@hisilicon.com, Joe Mario <jmario@redhat.com>
Subject: Re: [PATCH v2 0/3] Add support for SPE Data Source packet on
 HiSilicon HIP12
Message-ID: <aDYmhILZTC79Qp_t@x1>
References: <20250425033845.57671-1-yangyicong@huawei.com>
 <d06b1e86-b6b8-3909-65bb-45b7cd70d263@huawei.com>
 <aC3oFxuEbVEHd3Pb@x1>
 <f5afc098-def8-fa83-db9e-32837eadec0c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5afc098-def8-fa83-db9e-32837eadec0c@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_135432_650944_8E62F405 
X-CRM114-Status: GOOD (  20.85  )
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

On Mon, May 26, 2025 at 07:06:37PM +0800, Yicong Yang wrote:
> Hi Arnaldo,
> 
> On 2025/5/21 22:49, Arnaldo Carvalho de Melo wrote:
> > On Wed, May 14, 2025 at 11:38:42AM +0800, Yicong Yang wrote:
> >> a gentle ping on this..
> > 
> > So this involves both kernel and tooling, as soon as someone merges the
> > kernel part, I can try and get to the user part,
> 
> is it still possible to catch up with this cycle? Kernel part has been picked up [1].
> 
> thanks.

I'm applying it now.

- Arnaldo
 
> [1] https://lore.kernel.org/linux-arm-kernel/174790933967.1291842.14160046478134585349.b4-ty@kernel.org/
> 
> > 
> > - Arnaldo
> >  
> >> Thanks.
> >>
> >> On 2025/4/25 11:38, Yicong Yang wrote:
> >>> From: Yicong Yang <yangyicong@hisilicon.com>
> >>>
> >>> Add support for Data Source packet on HIP12. Support counting L2 HITM for c2c
> >>> statistic since it was missing.
> >>>
> >>> Change since v2:
> >>> - split the kernel/userspace changes into different patch
> >>> - revise some mem_snoop decoding according to the discussion
> >>> - count missing L2 HITM for c2c statistic
> >>> Link: https://lore.kernel.org/linux-perf-users/20250408122809.37884-1-yangyicong@huawei.com/
> >>>
> >>> Yicong Yang (3):
> >>>   arm64: cputype: Add cputype definition for HIP12
> >>>   perf arm-spe: Add support for SPE Data Source packet on HiSilicon
> >>>     HIP12
> >>>   perf mem: Count L2 HITM for c2c statistic
> >>>
> >>>  arch/arm64/include/asm/cputype.h              |  2 +
> >>>  tools/arch/arm64/include/asm/cputype.h        |  2 +
> >>>  .../util/arm-spe-decoder/arm-spe-decoder.h    | 17 ++++
> >>>  tools/perf/util/arm-spe.c                     | 96 +++++++++++++++++++
> >>>  tools/perf/util/mem-events.c                  |  5 +-
> >>>  5 files changed, 121 insertions(+), 1 deletion(-)
> >>>
> > 
> > .
> > 

