Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD38FC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21smCt5veLbVqe+S+GWthbuG/xZam00DYMCOlQBhZRg=; b=SMzaOhf9fMUjDUN8hFhkWkusVe
	g7qY/7JKO90TXWTRyB4XpJfJpCjxz9vEK2F9D/fCJ38rrGZjty2hrgvlKvsmswdM2b0QFONynubfl
	OIRvlstuKcpEMyRhctK1Fs36U1JQMWO6jCjexFxWHIzu/uVKLG2y79QisLFK4zGXlFmb8ViZskHrR
	WiAIitLwvfmx4fZB4W0j7hgsaYII3XrJsqmz0HFH+oBjKgEL7cOvzMWRLE0ryZOEsNFN7uxVhlsHF
	X5iFH7Uf9fS8HVISrOFHcNXqp2IWsnPE516zzWZWGiS28M7GGSwUUahQaCCadifODm4/LyFNJleGC
	cAIKBM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjmE-0000000AFUj-0ETV;
	Wed, 19 Aug 2026 17:08:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjmD-0000000AFUZ-043N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:08:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 195BE60DB5;
	Wed, 19 Aug 2026 17:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9A81F000E9;
	Wed, 19 Aug 2026 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787159311;
	bh=21smCt5veLbVqe+S+GWthbuG/xZam00DYMCOlQBhZRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kMfIT/cJ4WIwWWFk0uWjh8XUTnAx8W8OWI7C2tf1xlp6Bt7171PRN75/ukSbF5crC
	 cVvtB8C6y7A02XV1Q6YetGHEjc8JI/OUBUjnCkP8Nb5b6etn72KfjadjgJzIo8GQbS
	 LinXBkpHfvE98Mzez05ZYALDu3PFVk7NqyzjF8fkwLfJH/TrcnlOmeX/tSSEnQScDT
	 rusv05dECaChlQP5tGfM7yRh5VLEn4n5R5rPQftWLV3lgYLE1Zz6Z9X7IrQNqnIZWW
	 getDqBkttWaAz41wl2vy1ihm0bVaJ6tHceoTlwTEgRMo8hbnjW4ztGCmfc38133Pg7
	 dNcnMV4y7UYpw==
From: Namhyung Kim <namhyung@kernel.org>
To: john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org, 
 leo.yan@linux.dev, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
 jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
 Mike Leach <mike.leach@arm.com>, Besar Wicaksono <bwicaksono@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tmakin@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, 
 rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
 mochs@nvidia.com, sauravsc@amazon.com
In-Reply-To: <20260813170155.1156593-1-bwicaksono@nvidia.com>
References: <20260813170155.1156593-1-bwicaksono@nvidia.com>
Subject: Re: [PATCH 0/2] perf vendor events arm64: Fix Tegra410 Olympus PMU
 events
Message-Id: <178715931078.2811574.8141825092501896684.b4-ty@kernel.org>
Date: Wed, 19 Aug 2026 10:08:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
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

On Thu, 13 Aug 2026 17:01:53 +0000, Besar Wicaksono wrote:
> Fix two issues in the NVIDIA Tegra410 Olympus PMU event definitions:
> 
>   - Correct the swapped MetricGroup assignments for the L1 data and
>     instruction prefetcher metrics.
>   - Correct the name and description of implementation-defined event
>     0x0197.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



