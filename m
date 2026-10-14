Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DCFCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpDVtITf3q8Ifbj2iEUKwlnz+d7HVCX5OeHwbVW15bw=; b=m7uoJvmcqVvn6TzbaBEETJKHk3
	p5Zmn95dZKCPeKmYeFY9Kqn2zdyVlUVrxI6eUR33TptYyIWMoZSo47vsWIlTQ/H1jl0+fQHAqH6Su
	e37Lv1MODRSOZiw1fvLsycDH12wOj+u+vKyS9PXsK9DYFO1ccSdotYMRiPozD1cn+WG4PRZKyDG1C
	AHl3FNHsev0tN1CVkiwVERf0viKoGE11r92GjcPJw98YAGgQuKW5cEyqQypU9V0XNCnK/Am+el0NM
	gxHd/C7n5R+/xn/glP9QTSh/KzXWmW4DD3WLR8qiXCAT0zJOOXoU+hkgOoAL20I4P4wFJRcEBH7/x
	XHrGsoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydg-0000000FWTM-2HKU;
	Wed, 14 Oct 2026 13:03:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydX-0000000FWQ9-0iF7;
	Wed, 14 Oct 2026 13:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qpDVtITf3q8Ifbj2iEUKwlnz+d7HVCX5OeHwbVW15bw=; b=UfOmPQFfXG9yQ7V+vbm7oiZOGW
	NkkZDTPdShRGr1WZwDjypGTA7zupgTteD6J1yBpVPpbVLHJTv0YV7Zl/Nabgk+fVnfYN4E58omPO1
	yf/zzdLKDeqzn7lKGFMsQ9OlIxVB6lipNntBqNlOK0FbScSBo8NoGe/qQBqnyZN8sfvTDo8+QlZ83
	rn9JWN0qxxqWnYagLnPikr7k8ZB1IeCiDBFZ+EOzfNVwhMAQqEBdYov75Y7E0BD8Gx6BY1zscNr3S
	DowBcc+dAVyNZTBi0iPpA4jytlU+03GZu34ZslvnXA4wVweNjUhWII+52gjtmFPlz8lwC2OlIncTd
	//Xt9exA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydP-00000003mxp-317m;
	Wed, 14 Oct 2026 13:03:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6EC9C302FBC; Wed, 14 Oct 2026 15:03:06 +0200 (CEST)
Date: Wed, 14 Oct 2026 15:03:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Haris Okanovic <harisokn@amazon.com>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de,
	will@kernel.org, akpm@linux-foundation.org, mark.rutland@arm.com,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, rdunlap@infradead.org,
	david.laight.linux@gmail.com, broonie@kernel.org,
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com, ashok.bhat@arm.com
Subject: Re: [PATCH v15 12/16] cpuidle/poll_state: Wait for need-resched via
 tif_need_resched_relaxed_wait()
Message-ID: <20261014130306.GK2009045@noisy.programming.kicks-ass.net>
References: <20260831202251.305046-1-ankur.a.arora@oracle.com>
 <20260831202251.305046-13-ankur.a.arora@oracle.com>
 <178908146776.2725577.2613699832033292946.b4-review@b4>
 <878q58z2ej.fsf@oracle.com>
 <3e8bda45-0aa7-d0be-8aad-dab95902dcde@gentwo.org>
 <as9EospGcR2e1mpO@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as9EospGcR2e1mpO@arm.com>
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

On Wed, Oct 14, 2026 at 10:00:18AM +0100, Catalin Marinas wrote:
> It
> would also be nice to get some acks from the atomic infrastructure
> maintainers.

That'd be Mark and me I suppose. I don't see anything substantial
happening, just plumbing the new function.

Now, I really rather dislike timeout based schemes, but given we have
users, I suppose this does improve things. We should however be weary of
new ones I suppose.

