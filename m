Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F21FC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XW2kMLggkRWNkVt6ExhJhc6qzBTBSihv+LUgIX5RMcA=; b=MqcV0oo8nYMer+ScCnNCPQGbwj
	rWwXJsDsv6geRJSAiGbYVaRgvoWiSDHyZFTKOnFumT3XA9VhZjzrxWFuWnFkg/W7pRwdJ/1OiZhLC
	PTA7aMzm1VmSWei/cGr1j0xOQUpWU4S5E7MiB24iI03dl/CQkfzEw2fHpa+AAEOFkjQe2DkvsDY5I
	kmqsTdUctEhiyenqw3NEHfMBm64nqHSSjEsqCko7g/WT/MHw2qxK+EMHtCsNzVE2wPWBkade+f5lz
	weX/32+ZHCINkES0s+NdE4NXWSmAa+Jx+WvDoovkDyzfOyL9DEMDxMF2Hs2VNvM5qauXK27cKGnwj
	eTwwq61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iUv-000000035bM-0UW5;
	Mon, 21 Sep 2026 18:12:13 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iUs-000000035an-0vwE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1790012833;
	bh=XW2kMLggkRWNkVt6ExhJhc6qzBTBSihv+LUgIX5RMcA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DsymiE1MQAtmEN6uUB15xdAYVJDZfNgJnj2uprYa57YqGKxBPw/trT1vR1DDzhUmO
	 mG9CZX/7ouqOPVy1PfkrG6LJZR68SWo47gb09EdLmAGiAeSYTe398ITRq5Z08JDXrL
	 1zi94uzbdB0Ko5/ITaTybb562kwpWXK8p179l0Rc=
Received: by gentwo.org (Postfix, from userid 1003)
	id 85E8E406E1; Mon, 21 Sep 2026 10:47:13 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 82BF2406DE;
	Mon, 21 Sep 2026 10:47:13 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:47:13 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
cc: Haris Okanovic <harisokn@amazon.com>, linux-kernel@vger.kernel.org, 
    linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de, 
    catalin.marinas@arm.com, will@kernel.org, peterz@infradead.org, 
    akpm@linux-foundation.org, mark.rutland@arm.com, ast@kernel.org, 
    rafael@kernel.org, daniel.lezcano@linaro.org, memxor@gmail.com, 
    zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com, rdunlap@infradead.org, 
    david.laight.linux@gmail.com, broonie@kernel.org, 
    joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, 
    konrad.wilk@oracle.com, ashok.bhat@arm.com
Subject: Re: [PATCH v15 12/16] cpuidle/poll_state: Wait for need-resched via
 tif_need_resched_relaxed_wait()
In-Reply-To: <878q58z2ej.fsf@oracle.com>
Message-ID: <3e8bda45-0aa7-d0be-8aad-dab95902dcde@gentwo.org>
References: <20260831202251.305046-1-ankur.a.arora@oracle.com> <20260831202251.305046-13-ankur.a.arora@oracle.com> <178908146776.2725577.2613699832033292946.b4-review@b4> <878q58z2ej.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_111210_278287_0FF7EA45 
X-CRM114-Status: GOOD (  11.62  )
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

On Fri, 11 Sep 2026, Ankur Arora wrote:

>
> Thanks for retesting.
>
> > The new unit tests all pass on both metal and virt variants of the same machines.
> >
> > I hope we can merge this soon.
>
> Yes indeed. I'll send out one more version which addresses a few minor
> bot comments (and patch-1 needs a re-review because of changes.)
>
> But other than that this is as mergeable as it will ever be.

I dont see it anywhere. Is this patchset scheduled to be merged?


