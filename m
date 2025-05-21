Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8E0C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31Me9B9sg14ozZXX3INOV8kCr7Jx3p56Q1d79focTDg=; b=in8256a6u8pq67GsAPx3N8tgGV
	q8jp8Q+XabLwmJ7D00yuwYfqDI+4IyqgWhVc2PRaO6VcCnSjtP/CktF1zZiknbXAZXvysaPX65D3i
	qaB6Xf9R8dR708u6JuK6f2nPfUJOlZ76SjlNitPoA6xE2+FIxD4Z+UkYuBth8EnM3tHel0lzSnlcj
	D5JUo1UgYHLWV/huK+fz90Ic6JgwdnQu0+uvOUh8ZGf474tSfZC6vTMAYW8dwzauR4tL6ewkmF3+A
	Z50cG4RQiYIDW6yLIjJH3Js5eK5Y8/HADBlHonhfcNkx5iLjy0Wp5Ekm+wXmZJOd0N6nt0QG3mift
	K+4yEv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkno-0000000GApf-2Btu;
	Wed, 21 May 2025 14:52:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHklf-0000000GAPG-3SJg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 14:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB84F629E7;
	Wed, 21 May 2025 14:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262CAC4CEE4;
	Wed, 21 May 2025 14:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747839002;
	bh=kpejLVfuGzeC4eSxpnmOWcLTEEDUfc6nPoJRhXIElao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Idnbwoj9CIZeH4b5+gII+STCrWkRoMVQ0V8lrtBBPsxqJgHbzfvGmJieF3lzVSC/5
	 cw4qNgg6Utg3C0wCOKRjs9M7ey/pCWT5Hlt3kZiagzzVe7Gx+NcL++QM7/xg7IWnWq
	 pW3ubvbPBOoldgF78fC4V/7U6GCs9GlzlraqBU+BP1gFn5+JEJlnGkb5FmTumYS2vX
	 MxEGQw0tUx+seDdl8N2FfLedOB2sABP1aAbzI62bPWUkvnjrRPN9nas3/JE/DEAtbl
	 Ngf3fxnwFxcDtatWVL4vpF6IKTdN+dY5ATPR1FeGX2vbPlvOGolv/4JjHEl/PHFpbe
	 LPKsyu2fGi3Kw==
Date: Wed, 21 May 2025 11:49:59 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: namhyung@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
	jolsa@kernel.org, john.g.garry@oracle.com, james.clark@linaro.org,
	leo.yan@linux.dev, irogers@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, yangyicong@hisilicon.com,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, wangyushan12@huawei.com, caijingtao@huawei.com,
	xueshan2@huawei.com, prime.zeng@hisilicon.com,
	Joe Mario <jmario@redhat.com>
Subject: Re: [PATCH v2 0/3] Add support for SPE Data Source packet on
 HiSilicon HIP12
Message-ID: <aC3oFxuEbVEHd3Pb@x1>
References: <20250425033845.57671-1-yangyicong@huawei.com>
 <d06b1e86-b6b8-3909-65bb-45b7cd70d263@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d06b1e86-b6b8-3909-65bb-45b7cd70d263@huawei.com>
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

On Wed, May 14, 2025 at 11:38:42AM +0800, Yicong Yang wrote:
> a gentle ping on this..

So this involves both kernel and tooling, as soon as someone merges the
kernel part, I can try and get to the user part,

- Arnaldo
 
> Thanks.
> 
> On 2025/4/25 11:38, Yicong Yang wrote:
> > From: Yicong Yang <yangyicong@hisilicon.com>
> > 
> > Add support for Data Source packet on HIP12. Support counting L2 HITM for c2c
> > statistic since it was missing.
> > 
> > Change since v2:
> > - split the kernel/userspace changes into different patch
> > - revise some mem_snoop decoding according to the discussion
> > - count missing L2 HITM for c2c statistic
> > Link: https://lore.kernel.org/linux-perf-users/20250408122809.37884-1-yangyicong@huawei.com/
> > 
> > Yicong Yang (3):
> >   arm64: cputype: Add cputype definition for HIP12
> >   perf arm-spe: Add support for SPE Data Source packet on HiSilicon
> >     HIP12
> >   perf mem: Count L2 HITM for c2c statistic
> > 
> >  arch/arm64/include/asm/cputype.h              |  2 +
> >  tools/arch/arm64/include/asm/cputype.h        |  2 +
> >  .../util/arm-spe-decoder/arm-spe-decoder.h    | 17 ++++
> >  tools/perf/util/arm-spe.c                     | 96 +++++++++++++++++++
> >  tools/perf/util/mem-events.c                  |  5 +-
> >  5 files changed, 121 insertions(+), 1 deletion(-)
> > 

