Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11955CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 00:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6uhRUiW+eldhh1YclRaJ4cIYTKdwtUso/LSw+v9Ygg=; b=YBoWu9EiS/9tmPVVDVDtbxS6TR
	MpS1WX+l0bOF+sO4bdPnx71TM8y3FIB4adysAIw8E7NVP9f9lOrRH8mQkXSyJfdlCwvTG45qyZxG+
	Nq20fJx92/SaW4JAViPPAfcFLQa/DzucZuM7fcSONjn+b4CMufcK49RKdF550Gc1/JvzJhucUsohy
	ucnRIDwZ5+hOVvnHlA4OAGwSCzjW4MsrJfVW45MEOUXcl7izawzeFvbMsH00J+Vx7p69vnxLdv1yk
	RwESvD/NHmMBJUpEnhv/nMRzZiWaXs6D6KYh2su3g8h+13JAb/Nrcf8ZoHe/SkkhoDP+gGSp43TXv
	rfuvR3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfzW-00000006s37-1Yar;
	Fri, 15 May 2026 00:01:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfzU-00000006s2k-0J4O;
	Fri, 15 May 2026 00:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6B6860008;
	Fri, 15 May 2026 00:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D03C2BCB3;
	Fri, 15 May 2026 00:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778803278;
	bh=qcyh1k6oDWxzqMUIRNWfJA2lNDX2xIYpO4RsFgvB/Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORTs2e47LDfXtxpftrsgmc0BBJfhsGWPf3S7imib3v4dWSmqlGKYQTWNchK/6tqqv
	 28zSEFcawoJf5V5dMaouJ/OjkKLtq1W+p1dESsernOwMwK7viKW4dlettM9fHGZJ/g
	 GUI/V3HUvr+ResYK5Wo+/EnZVSefKesf7+hwdq5+G5er6JKBevdLzivjuiELJUBEww
	 BBRyyBE1t8374ptrmuPzDNmNofdZC8dRo2ivwgc/FhQ4blzhzcWxfDchMnGEL3jS2K
	 vMhmTj6OBA4dBHPhOVFmkR66JiCZSaodo3uE/UB6rBNz3FPqlkz2ZY0XPM4GiMfpiH
	 Rwch+YpztSmpw==
Date: Thu, 14 May 2026 21:01:15 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com,
	james.clark@linaro.org, namhyung@kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Li Guan <guanli.oerv@isrc.iscas.ac.cn>, 9erthalion6@gmail.com,
	alex@ghiti.fr, alexander.shishkin@linux.intel.com,
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
	atrajeev@linux.ibm.com, howardchu95@gmail.com,
	john.g.garry@oracle.com, jolsa@kernel.org, leo.yan@linux.dev,
	libunwind-devel@nongnu.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org, mingo@redhat.com,
	palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org,
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com,
	will@kernel.org
Subject: Re: [PATCH v5 0/7] perf libunwind multiple remote support
Message-ID: <agZiS2-fY49MjsY6@x1>
References: <20260413024805.1316480-1-irogers@google.com>
 <20260513233151.572332-1-irogers@google.com>
 <CAP-5=fW6S1XzZvq=kWj6ma=O1UCDrVV3ZNbzK0fMS_ho6e1qVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fW6S1XzZvq=kWj6ma=O1UCDrVV3ZNbzK0fMS_ho6e1qVg@mail.gmail.com>
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

On Thu, May 14, 2026 at 09:51:09AM -0700, Ian Rogers wrote:
> On Wed, May 13, 2026 at 4:32 PM Ian Rogers <irogers@google.com> wrote:
> > Fix the libunwind build for when libdw and libunwind are feature
> > detected, currently failing with a duplicate symbol.
> >
> > Refactor the libunwind support so that whenever a remote target is
> > available, perf functions using the ELF machine can use that remote
> > target regardless of what the host/local machine is. Migrate existing
> > libunwind supported architectures like powerpc, arm64 and loongarch so
> > that they can work in a cross-architecture way. Add support for
> > RISC-V. Make the code more regular in function names, etc. and avoid
> > including a C-file. This increases the lines of code. It is similar in
> > style to the unwind-libdw implementation. It is hoped that the more
> > uniform nature of the code will help with refactoring the perf
> > registers for SIMD/APX support.
> >
> > Aside from local host testing these patches are under tested, in part
> > as I'm failing to see how to build libunwind with support for multiple
> > remote targets. Please could I get help in testing.
> 
> So the patches failed to apply in Sashiko:
> https://sashiko.dev/#/patchset/20260513233151.572332-1-irogers%40google.com
> The baseline logs show perf-tools-next was at commit 8c8f20936143
> ("perf build: Remove NO_GTK2 build test") which is 6 patches
> out-of-date compared to the current tip these patches are against. I
> ran Sashiko locally, so I don't expect a huge amount from the reviews.
> Currently Sashiko is catching up with a backlog because its tokens
> have a lower priority and there was high load earlier in the week.
> Anyway, I could repost the patches for Sashiko review but given the
> backlog I think that would just create noise at the moment. Hopefully
> I can get human review so we can move forward with merging these
> improvements.

Trying to apply it now, will also run sashiko locally.

- Arnaldo

