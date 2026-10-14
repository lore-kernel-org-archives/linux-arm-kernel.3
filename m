Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CDDCC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MOzWJetT+rYY/8KQTlJp+y68I8y0Y8+Uyt+HZccthA=; b=giIVj0/ZsG9u1ijrdmw+Jn6ZHp
	KRc1G/Gfg/IhDlqxilqpJaNzFtDIzc7pQURAh8AwG7e/lf65admpAWxNAANJXNVMXMfW2qdWkpBnf
	q2XBhTyr8GrYMMDgfznHaxhUIiGvVwGSiSqvN2BrqtbOT1Evw+e/9kpRx/H680HF8keoFLWKchn2E
	CY95bbdWlMPvlFjJBKXKdjhAM+/mcixLyCQzH0fRChp/iVXw2GtSL8B4kydvks1DcR6Lo+t46Lyf2
	e2VK7/FkBD51Ddm5dF4aC+r/rAjef+8/LJFxiVq2tq0wszEc83uQdN3GbHKNNxWB6vyrsRtuCUIwX
	Bvd3q/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuqe-0000000ExeN-12tp;
	Wed, 14 Oct 2026 09:00:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuqc-0000000Exe1-19iA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:00:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3F361596;
	Wed, 14 Oct 2026 02:00:24 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A1513F7B4;
	Wed, 14 Oct 2026 02:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791968428; bh=QHHb0DZxd6vJXZJdg7EynMfshzf8IQQprxwja0EOQwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQIYGdPm3y0xRuJPv+eARHLw4283SpruBCAt7f+uNiNtj2bLUJLZJqiMiEptorMth
	 AHcohvXT/YR/v9xWV1xT5HGMk0lUPOhXuCoCas3fKXKz/oDeBsKz7dZ8C0EbaUTwuA
	 w7TvbAkKZuVD54ELwmQUaWMe7kRy40smDfYLxXLA=
Date: Wed, 14 Oct 2026 10:00:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
	Haris Okanovic <harisokn@amazon.com>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de,
	will@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, ast@kernel.org, rafael@kernel.org,
	daniel.lezcano@linaro.org, memxor@gmail.com,
	zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
	rdunlap@infradead.org, david.laight.linux@gmail.com,
	broonie@kernel.org, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	ashok.bhat@arm.com
Subject: Re: [PATCH v15 12/16] cpuidle/poll_state: Wait for need-resched via
 tif_need_resched_relaxed_wait()
Message-ID: <as9EospGcR2e1mpO@arm.com>
References: <20260831202251.305046-1-ankur.a.arora@oracle.com>
 <20260831202251.305046-13-ankur.a.arora@oracle.com>
 <178908146776.2725577.2613699832033292946.b4-review@b4>
 <878q58z2ej.fsf@oracle.com>
 <3e8bda45-0aa7-d0be-8aad-dab95902dcde@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e8bda45-0aa7-d0be-8aad-dab95902dcde@gentwo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_020030_362810_A44F6077 
X-CRM114-Status: GOOD (  15.81  )
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

On Mon, Sep 21, 2026 at 10:47:13AM -0700, Christoph Lameter (Ampere) wrote:
> On Fri, 11 Sep 2026, Ankur Arora wrote:
> > Thanks for retesting.
> >
> > > The new unit tests all pass on both metal and virt variants of the same machines.
> > >
> > > I hope we can merge this soon.
> >
> > Yes indeed. I'll send out one more version which addresses a few minor
> > bot comments (and patch-1 needs a re-review because of changes.)
> >
> > But other than that this is as mergeable as it will ever be.
> 
> I dont see it anywhere. Is this patchset scheduled to be merged?

Not as far as I'm aware. There were some minor issues raised by Sashiko.
Ankur said he'll respin a v16 but I guess his spare time is fairly
limited.

If any interesting party wants to take it over, that would be great. It
would also be nice to get some acks from the atomic infrastructure
maintainers.

-- 
Catalin

