Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5482C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tR8EcFnGl3J8Tt2kJltOV9Wd4bMYRmU1WDMYbhcN7oQ=; b=i2OAodLfPvKRSziN5itpQI3YWM
	N4XPdykCEKHx5CMqFz+OcHqY9mEkuv9ZROdEVCXFxCVbwWbQ0PU2Cn6GhGtb7c8wBIly9SeVVyzNn
	rBeb2DBlsliAmdx/iQDPEPTHVuUAPqX7jFzDqopqd73c/GTmWGodBWnQMO6HuXkHPqSw3OGCwsuge
	z0rO1GKWLkOC0mwMC9fjDtRTpkvoch+/fp2LlVHDnOKbBB56UeWCsHtFsG87VXDwbFdVxiYY4MKc1
	OX2l5WGpVAOr5vXEDUgbOKzWsF5VrqQuD2lt5UYFFlFhugxYXiE6uFqzRHbapzyYsbX01z1qh7qA6
	gl5goeTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog7Q-000000055ta-2M9A;
	Tue, 28 Jul 2026 11:37:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog7O-000000055tF-2PbX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:37:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C37260051;
	Tue, 28 Jul 2026 11:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6222D1F000E9;
	Tue, 28 Jul 2026 11:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238625;
	bh=tR8EcFnGl3J8Tt2kJltOV9Wd4bMYRmU1WDMYbhcN7oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ANlo7dNE9fx5EO7d+BCxaihNg39CXQ7/a7TpyVtZ8cbCA/UwFdSxf6ZYFLdb+B2Fd
	 u4MlYY7ycrHRPrToNH5PX8TNP6Tip6zoIq2cybB0ZJt0I0B4hDvBM3TpFiLJkou0yX
	 kwzbX4my2TwaNHHdxEtqfkhE1BxdECWVEq2c+xZQLbqnRtOObtiHxBqzbUbywZw/FK
	 5N86OhZFHsPdGp00q35w7WjkZku9aD7vmstfE/sFlK2bWJXw6Nkj0Bv4lmbXUOtOBu
	 6sjoxoynf1CvdOvGDlY2JNZmTGMZga7gguD0xrs0pb9O5hn30LqfmQ2JU1kj5v8ucF
	 k60sAyRo++BtQ==
Date: Tue, 28 Jul 2026 12:36:58 +0100
From: Will Deacon <will@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
	peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, rdunlap@infradead.org,
	david.laight.linux@gmail.com, broonie@kernel.org,
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com, ashok.bhat@arm.com
Subject: Re: [PATCH v14 13/15] arm64/delay: enable testing
 smp_cond_load_relaxed_timeout()
Message-ID: <amiUWpsL1QGf929i@willie-the-truck>
References: <20260714073041.40250-1-ankur.a.arora@oracle.com>
 <20260714073041.40250-14-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714073041.40250-14-ankur.a.arora@oracle.com>
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

Hello, Ankur,

On Tue, Jul 14, 2026 at 12:30:39AM -0700, Ankur Arora wrote:
> This enables the barrier tests to be built as a module.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  arch/arm64/lib/delay.c               | 2 ++
>  drivers/clocksource/arm_arch_timer.c | 2 ++
>  2 files changed, 4 insertions(+)

Acked-by: Will Deacon <will@kernel.org>

I think this is looking good from the arm64 side now (and appears to have
all the relevant Acks). What's the plan to get this series merged?

Will

