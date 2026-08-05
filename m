Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDB7C55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dlhi0OIvG0DzAmOHlpvJY0BTYkHJaLUzOYnoAusTIMY=; b=s4hc+NTrsOiN0vpTNa6LWIHKyF
	VA/jmeBjqELxgGYzuvaF3WciISm+TDLmYFIGjh7AVifVod8AIwcl7o/eIkC9yCD6U/1idPGUWGglS
	9xJsR+2vBtiZwcoMvyyv0E2VMExZk1IMxGwZVfEmWXjxCXFhoOMmWeEifR8JKctkGbbJ2V1vJH3Uf
	KJJDYxo5ETyiDBhLDUmQ5Uh7LNnf4bzYvBaq5bJtTCcQGyEnaUi265Rq8F0BSpPzdkrveBYMC48aZ
	h/Kv2gBmNNtmLyS1V3oq/CZcHMY3+yYC/9vyxIVMswQ0NChv/Zy1wgmgEAm3lNcCJr3xZr89ql4qP
	XAnds+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPmD-000000030aJ-0wPn;
	Wed, 05 Aug 2026 00:46:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPmC-000000030ZV-0WVd;
	Wed, 05 Aug 2026 00:46:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D869C41A8E;
	Wed,  5 Aug 2026 00:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A021F000E9;
	Wed,  5 Aug 2026 00:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785890790;
	bh=Dlhi0OIvG0DzAmOHlpvJY0BTYkHJaLUzOYnoAusTIMY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=XSIrpGwDO6P/rsSqg7qHue/roYgmoqB2ziS6+kgRfFK73ME6zNKl6703uHTbtAG89
	 dgZxvL6X0JyqJRan0Y9QZbksFI7Q1bPSl+xkcDgm//bWeXHuJgfWpMHz4/Y3Qllhxg
	 Wg5wF0fSB1IJx/sPZnLSjpN0V6Yasbhq6izC+zG3Tk45IAFp1C62+qGErYaK/BecaA
	 2kF4UDWEcNT4EF9lElsQRtTOEgOXPrEsid3dW4ce3XCTl7Rt18/slMhZDZNZP1ic4e
	 DTWs9DjKES9Ibe6u+w9kHNOm5lB/G9tug9PiXVozdbiqKl0GiXwj/VgRZ7qiR1epwW
	 nLZmSXBPctXkw==
Date: Tue, 4 Aug 2026 18:46:29 -0600 (MDT)
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
Subject: Re: [PATCH v8 09/22] RISC-V: Add Ssccfg/Smcdeleg ISA extension
 definition and parsing
In-Reply-To: <20260701-counter_delegation-v8-9-7909f863a645@meta.com>
Message-ID: <38d6a081-e05e-f5ea-6e71-540bd1c22761@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-9-7909f863a645@meta.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1958216248-1785890790=:1383527"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1958216248-1785890790=:1383527
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 1 Jul 2026, Atish Patra wrote:

> From: Atish Patra <atishp@rivosinc.com>
> 
> Smcdeleg extension allows the M-mode to delegate selected counters
> to S-mode so that it can access those counters and correpsonding
> hpmevent CSRs without M-mode.
> 
> Ssccfg (‘Ss’ for Privileged architecture and Supervisor-level
> extension, ‘ccfg’ for Counter Configuration) provides access to
> delegated counters and new supervisor-level state.
> 
> This patch just enables these definitions and enable parsing.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Thanks, queued for v7.3.


- Paul
--8323329-1958216248-1785890790=:1383527--

