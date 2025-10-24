Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A434CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 18:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ma5RnhfBXxstn3+ECQF56pVas/GNfRyve1sRM2daeac=; b=VNVAbkkLBipUNFYaKP16udJFHn
	6uOQ5nNN5B9V73M3NS7IxB+HzcdPMMYVhBmUDGqJF4zDgKVcjrUD8VtLSfzGuLppIBD5pbgm1UKFH
	EwCfQSTGC/MpA72wDRsQbeFCPAVdAozEVvdM7jucrPjU3kIxMY5uP/V7v7ogRYRjgMuryTJB0yHaT
	ftW/ARnZxu4fT/Ixx8AZn9pweks9X+17BN6C3EEQxjPqb3BfRbvcQlhwVgnGUF1PYH8DPNPqmSglW
	Vm/+PvEVoiwJZVzkJOU0kR9PqKWbt3MCJeRp9dG2RyMZwEc9NDeiNAKGM+mW/0OCw+LEMfa4Sxmo5
	SPtSjUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMyW-0000000AJEY-2tJq;
	Fri, 24 Oct 2025 18:57:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMyO-0000000AJCx-0Yqz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 18:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86E1B44D86;
	Fri, 24 Oct 2025 18:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE61C4CEF7;
	Fri, 24 Oct 2025 18:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761332231;
	bh=F6sAvOGHNl4pLZVKMsc1wcVztQ8yBEOvaYtnPjPeRCA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=XXeYOarkIdMzTofm5V401CY0ZT+c+I2DajCJRNOsDOm/nMqTBDB2T6EgDePxNSPYs
	 cQO+//UCkwZ1MbT/0qdOLGvLCfjTZwQNWNZTyUfFK4oaqyvJ7tWTCf8o0v2DEX32H5
	 8FfEJWt5A3oxAiJxCaTf2IQC0j9Cinb88CYdYOEp8XjK71pUXX3mbBZ/HoFTIqRHP2
	 olNQkHmse/hoOcmhxNNDnM0o+9Hy90T29I+EXX/1QBWTtxCbnMKIJxJtOSaPQAAJvq
	 Fk98zjhGFInRv9KbLKdYslWicA/dqSyF3VsMGjnWaHcvOygbo3MzBbC44UnilGw1FA
	 Rm8YovR5Whlsw==
From: Namhyung Kim <namhyung@kernel.org>
To: Adrian Hunter <adrian.hunter@intel.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
 Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@linaro.org>, 
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>, 
 Leo Yan <leo.yan@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877bwnyh6f.wl-kuninori.morimoto.gx@renesas.com>
References: <877bwnyh6f.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [resend][PATCH] tools: arm64: Add Cortex-A720AE definitions
Message-Id: <176133223085.3710582.9720560648208610370.b4-ty@kernel.org>
Date: Fri, 24 Oct 2025 11:57:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_115712_198761_C248F4FE 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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

On Tue, 21 Oct 2025 23:21:48 +0000, Kuninori Morimoto wrote:
> Add cputype definitions for Cortex-A720AE. These will be used for errata
> detection in subsequent patches.
> 
> These values can be found in the Cortex-A720AE TRM:
> 
> https://developer.arm.com/documentation/102828/0001/
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



