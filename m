Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E0AC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 23:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6bnoC0uo9IGH0cOMPy+k1Qy1T/eK3SlwaiW/6NceV8=; b=ipBiphd45BDKh8TynU0jMy18vV
	T2931VJ7H/KvVWaIMAtdiWjrriW85V7DWeoUVMuML9n1IvFKa0FiAJxH/D32/NuGCRjUnE+EzFT19
	ozB3TlTPwiSSB3jZk5B6j1JLw8+tYhxpJ2SeNMp7nyK2ZC3LjiOhgfrTwrsgvnArfuH/s/WyZu4RZ
	2AI7+MTrtK4rUoKdCk67AS2sHYvsAQZj84mpCBZmR2e8Po2n4FvRbvMdGBgL2tNtYgSkQ2zHfYu0F
	yC/b+Fn0Fprq6tSDA/GmM2r2Zs+iSJPHKeVhf/nX6gGtir0Glnun/+8eZj0s5sj1nDqqXbSqWZZ+n
	vveaTPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOVw-00000002vHF-2PDo;
	Tue, 04 Aug 2026 23:25:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOVv-00000002vH5-3Fqa;
	Tue, 04 Aug 2026 23:25:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2CC64118D;
	Tue,  4 Aug 2026 23:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A319F1F000E9;
	Tue,  4 Aug 2026 23:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785885938;
	bh=F6bnoC0uo9IGH0cOMPy+k1Qy1T/eK3SlwaiW/6NceV8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=gBueRxtyL1mYzDbdrW1e1N7tJhLUFwak5BnADb3TTiKTMI8GgbFrsgcLbu9h1r5XV
	 C/JzFyfCPosyAq5jIus7ub1cVMkTq4YRt7Oab3wFFCTp2FEL3KtMUa35qCLyMJGCqQ
	 kfUb0AU531BxfUHzqqbIVgwwy7JuKJbEukRQbDZOTg+jOHJkZGHB3uNRwlKe0JMGWK
	 BgBUCf9F1wWcsLr5un2yHLDN+CqJ+dJcmkCtbnPl18D+cp7jWUCueGLlTPMGxOVmuv
	 PHWv7TIUX3DOlXqodhjRXiHEm6E1ZNYWVIuH/iKDBkcouOzjVwyKZWWDPkObtBeEgn
	 lJMokykGIaYTw==
Date: Tue, 4 Aug 2026 17:25:33 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atish.patra@linux.dev>
cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
    Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 01/22] RISC-V: perf: fix resource cleanup on driver
 probe failure
In-Reply-To: <20260701-counter_delegation-v8-1-7909f863a645@meta.com>
Message-ID: <bec23082-4f4c-0dc6-e6d7-3d64c8e22df2@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-1-7909f863a645@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 1 Jul 2026, Atish Patra wrote:

> From: Atish Patra <atishp@meta.com>
> 
> Sashiko pointed out various UAF and memory leak issues around
> pmu_sbi_device_probe() error paths.
> 
> If the probe fails, here are list of cleanups needed.
> a. Already registered pmu must be freed
> b. per cpu IRQ must be released
> c. pmu_ctr_list data structure must be freed
> d. cpu hotplug state must be cleaned up only if added.
> 
> Fix the resource cleanup by reorganizing the code around probe failure.
> 
> Reported-by: Sashiko AI <sashiko-bot@kernel.org>
> Signed-off-by: Atish Patra <atishp@meta.com>

Thanks, queued for v7.3.


- Paul

