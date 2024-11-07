Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAE7D5D687
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7jKe0VhAZMO69k6s3j7rDnq+tQfHJZEZbLSKj50CvQ=; b=ykA8ldNbrbWIP60niYixzO6ylI
	llIgqX5ioH7iRU9enUsVysHOGkGUEWYHATRe3371gmYBRbdDQJ0zd8kTkaRYEDJFbumeDOkE9xe7S
	TTzXu23J2gRw7k8vOyAJmsrrtWrb7Qwavm33iBFTsScjb9Rdd5f4nSl0joT/NCJcD3pN9kGW081/s
	vchIqN8Nz/t2KTbWREwCKOTkC1xBjAUGrx9H3i9WJQb64RVIHiq1nYE9+HYPG9TUHZ756P9WUV+DX
	oC4jQEpelI/NNfhLqB51W21wafEGEo8yHbPSYFLWu1emJwsDTY/HguzS3AXshj/wniiYw+UujlyEv
	l0fnL6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98Ya-000000089UG-2xJs;
	Thu, 07 Nov 2024 19:52:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t987s-000000084Wr-18g8;
	Thu, 07 Nov 2024 19:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12946A44A4F;
	Thu,  7 Nov 2024 19:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A98C4CECC;
	Thu,  7 Nov 2024 19:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731007502;
	bh=6q3di7FCObUiv+8Jph+EMw//u0ETdnwSd7iOqeptPbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GG73QAevx0zlzfcdWAvXpV28VzlJoMdMbX0AMjUcQI5vRN+7+pMfRGgqU0cDfptSb
	 zL2MQbJ6cjAH3Kg5SzBu7m7j14xnl/Pw+YVlvNdqS2jOHNCUnnBLn/bw/GEN8Al1Vm
	 h79qPml7pCyhy1l6XdwW6rHsctM7ryhCv2NTyRg8wXWMHsRBW8Jduz4Oi/v+MfUUaP
	 4wTFJIdKoIbBBEjHQAgG0A4oRVx5kYPCGe67ZROg3W+7wYMcljYzILh4wU7dN7t6kE
	 mR473WoU0J7nZIGUw0BdXT67ZoZLu/6e1QiZVvH0drnfh+vRUNdfkjYTbJSFflSC7h
	 Lddp+3GFnvwWg==
Date: Thu, 7 Nov 2024 11:24:59 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Guilherme Amadio <amadio@gentoo.org>,
	Changbin Du <changbin.du@huawei.com>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	Daniel Wagner <dwagner@suse.de>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kajol Jain <kjain@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Shenlin Liang <liangshenlin@eswincomputing.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Steinar H. Gunderson" <sesse@google.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Dima Kogan <dima@secretsauce.net>,
	Yury Norov <yury.norov@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 17/31] perf dwarf-regs: Pass ELF flags to
 get_dwarf_regstr
Message-ID: <Zy0UCxKmD3_mQmNh@google.com>
References: <20241005195541.380070-1-irogers@google.com>
 <20241005195541.380070-18-irogers@google.com>
 <20241007170927.f30fced63c5e777628bea311@kernel.org>
 <CAP-5=fVmD-M-ZOinkWZ7AOtfRHqo89gFtDeeatwufq0TcBiZUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fVmD-M-ZOinkWZ7AOtfRHqo89gFtDeeatwufq0TcBiZUA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_112504_451005_3E594D80 
X-CRM114-Status: GOOD (  14.38  )
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

On Mon, Oct 07, 2024 at 08:05:23AM -0700, Ian Rogers wrote:
> On Mon, Oct 7, 2024 at 1:09 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
> >
> > On Sat,  5 Oct 2024 12:55:27 -0700
> > Ian Rogers <irogers@google.com> wrote:
> >
> > > Pass a flags value as architectures like csky need the flags to
> > > determine the ABI variant.
> > >
> >
> > Same here. I need some examples of this chaneg.
> 
> The code here was already using the ELF machine, so dwarf-regs.c
> functions would already support cross building. There is the addition
> of ELF flags as on csky the registers change depending on the ABI
> version in the ELF flags.

I think it's used by the probe-finder only which won't support
cross-arch environment.  So probably no changes to users at this point.

Thanks,
Namhyung


