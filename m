Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E2DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ap44HjH0YVkd/U/xEEXKG+E/eyCWGHQhfiU2g2gC+I=; b=AU7g3JTqjpGgALVYcZTpAopMBL
	TW4hMYvhC03mKwk0kDr1Re04mgornnqvRvlND9Jx0Nra5UCOEUxqeA81/6Ay+E92dlBixe1mmo/P7
	56hFlS0M4LneIkohLHlAXiqu3M7/8BqT2JuRVxj90Nj8F+uxaysLrWb8YDIQ23wyg7Czkd8bw7ZlG
	fELD0yChI+UXtBIm0dAb98fNg8TGPhpTRRhAq/m8a3Ck6QBhhfCBR12RLDLdkMBm58nThO5Oxa6QE
	AR1t7j6JHxkXLuYL2N0viPxZsOGWNsxUGWtlz/lmvEixrU1cA63yjQ0MOk+JIqRSpHVYPmiW1uOdx
	ak46pr3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmSI-0000000GJBd-3NXq;
	Tue, 28 Oct 2025 16:21:54 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmSF-0000000GJAI-3cyr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 16:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1761668510;
	bh=7ap44HjH0YVkd/U/xEEXKG+E/eyCWGHQhfiU2g2gC+I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PUp2zKMDVkgsfqqbu0QS4ubCJqzkNXG8lZFZBzraFOsZzmaKQceSqL+JtksJLsT9A
	 ffsdhEajqsL8bl4PDNRqP1qNlWtZ/Z9uxRH+8XTl6M7LY0jQ4rqqhWAtZa/cpemygO
	 X+LwwJfxjDE907dfXDJ6SkH4X2Vx9m8NOD0EyeO0=
Received: by gentwo.org (Postfix, from userid 1003)
	id 56CAD402C4; Tue, 28 Oct 2025 09:21:50 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 55B4F402BD;
	Tue, 28 Oct 2025 09:21:50 -0700 (PDT)
Date: Tue, 28 Oct 2025 09:21:50 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Arnd Bergmann <arnd@arndb.de>
cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org, 
    Linux-Arch <linux-arch@vger.kernel.org>, 
    linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
    bpf@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
    Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Mark Rutland <mark.rutland@arm.com>, Haris Okanovic <harisokn@amazon.com>, 
    Alexei Starovoitov <ast@kernel.org>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Kumar Kartikeya Dwivedi <memxor@gmail.com>, zhenglifeng1@huawei.com, 
    xueshuai@linux.alibaba.com, Joao Martins <joao.m.martins@oracle.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [RESEND PATCH v7 2/7] arm64: barrier: Support
 smp_cond_load_relaxed_timeout()
In-Reply-To: <3642cfd1-7da6-4a75-80b7-00c21ab6955f@app.fastmail.com>
Message-ID: <82febb6d-ba14-6a23-1955-9d505372dc23@gentwo.org>
References: <20251028053136.692462-1-ankur.a.arora@oracle.com> <20251028053136.692462-3-ankur.a.arora@oracle.com> <3642cfd1-7da6-4a75-80b7-00c21ab6955f@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_092151_944961_905E7774 
X-CRM114-Status: GOOD (  12.68  )
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

On Tue, 28 Oct 2025, Arnd Bergmann wrote:

> After I looked at the entire series again, this one feels like
> a missed opportunity. Especially on low-power systems but possibly
> on any ARMv9.2+ implementation including Cortex-A320, it would
> be nice to be able to both turn off the event stream and also
> make this function take fewer wakeups:

That is certainly something that should be done at some point but for now
this patchset does the best possible with the available systems.

Switching of the event stream is another set of complexities that should
be handled separately later.

Lets just get this one finally in. We have been working on this issue
now for more than 2 years.


