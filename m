Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC25D2628B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 18:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNbeLKJuz1RvRxewPnrUOwgP/eAxH+4YUlLYd3dHS5s=; b=EZ1yLypQ4MiwSvKZ8Rt/gZrzyp
	YBmKCkFeZPxcoEJzJkoAGjRWVJlL54DQyTDiGn38YrCgEr/4L09Li8EydCs1H2b/5L1srroad/LTj
	6aPwWYS4iwX1vRJcsVXTDt5IOoFLgr5hRxIHKtoInipRxhRTRB91BikMxDeDfGkWQNfIxWGF3k9Ci
	qHmDuiVj8X6Neamvho8zv9ymiqJvwia5299x21ARH5qH8Lma61xShbDtkQjyPeaulF7MbfqbEzo+3
	uqBpHKpGpEw3mTIA3Rm6QWW6GfSa6kfjennFTSopJ6AuYs6h87FVORq3wE3MLpZFhmlEEIqCPd1Ea
	aDMDsh+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGnn-00000004K9W-40Kl;
	Tue, 20 Jan 2026 18:50:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGnm-00000004K9K-0VVg;
	Tue, 20 Jan 2026 18:50:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2B7B60007;
	Tue, 20 Jan 2026 18:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20CAC19421;
	Tue, 20 Jan 2026 18:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768935002;
	bh=RmGeyuXo1uW+F5wAFWT4FNRAvYpuDuojoTmkmG6thsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMFr0HUnW2gYIg+E4/T/nh+T/QfHDMc2TLB2/zszUt0HXKwvhCRhKh4lcMkeSr2Ne
	 AAWnRTO264ZmkDHhpojE9ivFIjL+XA73XMS5r+nNVLd7nonTTwtkPMmxSOji3WXASy
	 VSYLaCKzBf02zAAWW9tcwWC9QBfANo4NPsJznBVq6coq8SMiOHpFoKSiaZ/c0wJnLF
	 vclTuYh5uRyhvj90KnGJeh4pjcU+OgAFq0Awl0SbsRStoKqGhb4e8ah+XE//Tc7nSp
	 42nG8H7qsbqyoxTVwfbNmkswQXM9rx3sjGlQxnnNZ0s5ek61vtiB0LniK69jN8Q1tX
	 +V9Z+6Eh30Y6w==
Date: Tue, 20 Jan 2026 15:49:59 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Shimin Guo <shimin.guo@skydio.com>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Howard Chu <howardchu95@gmail.com>,
	Thomas Falcon <thomas.falcon@intel.com>,
	Andi Kleen <ak@linux.intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Krzysztof =?utf-8?Q?=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
	Chun-Tse Shao <ctshao@google.com>,
	Aditya Bodkhe <aditya.b1@linux.ibm.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org, Mark Wielaard <mark@klomp.org>
Subject: Re: [PATCH v1 08/23] perf perf_regs: Switch from arch string to int
 e_machine
Message-ID: <aW_OV72q5rAVrgRE@x1>
References: <20260117052849.2205545-1-irogers@google.com>
 <20260117052849.2205545-9-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117052849.2205545-9-irogers@google.com>
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

On Fri, Jan 16, 2026 at 09:28:34PM -0800, Ian Rogers wrote:
> The arch string requires multiple strcmp to identify things like the
> IP and SP. Switch to passing in an e_machine that in the bulk of cases
> is computed using a current thread load. The e_machine also allows
> identification of 32-bit vs 64-bit processes.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/builtin-script.c                   |  17 ++-
>  tools/perf/util/evsel.c                       |  14 ++-
>  tools/perf/util/perf_regs.c                   | 105 +++++++++++-------

[ Include dwarf-regs.h to get conditional defines for EM_CSKY and EM_LOONGARCH, not available in old distros ]

- Arnaldo

