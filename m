Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784FED12D48
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 16:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1+noFxxILdhA4F27UwKO+s1L0xupNVYRgTXkH4alXM=; b=LsVU51EKl/x1umlaZZSZ/Zu88u
	B76Se0e/UM8RL47ev3bzPptEv4LLWVNUXNJAhH/isuqLgcluf3DgZO0xqL+1jL+tM4UVUhssSNtaw
	De+MmRKxq6hVL86JWP0KyM7WZ5L75IdAFidIlYqg/kNZI3XajD3mBkWjshc5Ax0qr2Da6HnJ52WUk
	cKeNYweNxUZCpgJGM1PxpmTo63xOS7gW+/uRWVjDYQdq3kTaH8bWdhN8M17sG/qgWtvlRzTmqXsB3
	wWsZNW0/Bk0FPjhOooR0Wy5jjQeQWH0McMsEUb+Req0yR7AdaeCcsxBlBeH/EK7f4jPLViW2VnhN5
	tCAWmJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAAVw-0000000FCoi-3XRQ;
	Sun, 10 Nov 2024 16:10:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAAUA-0000000FCeJ-1dR3;
	Sun, 10 Nov 2024 16:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65B5B5C57AC;
	Sun, 10 Nov 2024 16:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538ADC4CECD;
	Sun, 10 Nov 2024 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731254900;
	bh=JBXIFanmQXeLs3qZ6yNho/Yd2mSxSWulQTXSJ8lku+M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OYgrwdeiIbXgYq4lpWU8ck843JRk9VLM45YTC7B+syAZuDHLWzeSXy8jy54D0SXY1
	 2aoJMvK+L+f5iVh4sLEOi/bRCiVORQoDSM6NNekqjJBEvfHI1of6mQNEn3EgNn8L85
	 AfRb3ISkyebM37b/j7yo8ZRhkfbedxURnqeUrBKP6D/Vup9fGQ+A8jHwvx44NRBxtS
	 S0n0DuUj8R9FDw3hURr7PPOKFctKxhTFKHPToz8KuH2tQmek/1WYWFl60NFULDOV3h
	 o59uDdwi/v47HNFGKV2O7MpNY07k/w7XupIoS1OJrg3QHE94bd7+10rD4Iy1j5egAh
	 4sV5WlXAgbO2A==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nick Terrell <terrelln@fb.com>, 
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
 Changbin Du <changbin.du@huawei.com>, Guilherme Amadio <amadio@gentoo.org>, 
 Yang Jihong <yangjihong@bytedance.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, 
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
 Atish Patra <atishp@rivosinc.com>, 
 Shenlin Liang <liangshenlin@eswincomputing.com>, 
 Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
 "Steinar H. Gunderson" <sesse@google.com>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Ian Rogers <irogers@google.com>
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
References: <20241108234606.429459-1-irogers@google.com>
Subject: Re: [PATCH v4 00/20] Remove PERF_HAVE_DWARF_REGS
Message-Id: <173125489927.241089.8450722244768775739.b4-ty@kernel.org>
Date: Sun, 10 Nov 2024 08:08:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_080822_509598_32319F0E 
X-CRM114-Status: UNSURE (   7.07  )
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

On Fri, 08 Nov 2024 15:45:45 -0800, Ian Rogers wrote:

> These changes were originally on top of:
> https://lore.kernel.org/lkml/20241017001354.56973-1-irogers@google.com/
> 
> Prior to these patches PERF_HAVE_DWARF_REGS indicated the presence of
> dwarf-regs.c in the arch directory. dwarf-regs.c provided upto 4
> functions:
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


