Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1406BC02190
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 18:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emEvaD0snb1I+KoYe1hZsB1kdYm9ngN1ujNXHazy8iA=; b=D0fYKL1NcakGZAd9GO0dc9qTGu
	qB2ep8mAuyyOkbZrjwyWmhGo20qEm8dlG+LnQLzPD3cDUGRP1DQcFiXloJLAhyH2BCxReAH+ecAVi
	MKEP1VZ93bE+GRwN3FI/06FYqR/H3Cf+44aXlbHpjyW397oqmq1YfbtIxDqKLI73qheUtq7/CzinN
	+bx6t1NNdvReSAbKf70Fk3AWF3bdb8oSJIQF+HMeK6FPdnb6Xs/B/po4GoDx18RUs0ySEf9bzWagj
	nMfAgo9deHeYGToQsLP9/FPlYieEYIWGjp7Z51QzkOWhV+utMmq2LaTIpQfUeww1H6WXLdj8fHLju
	eYsJALGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZOB-00000009Ogy-3HHJ;
	Thu, 30 Jan 2025 18:35:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZMr-00000009OVd-3D9k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 18:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 290BD5C6092
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 18:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D559FC4CED2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 18:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738262060;
	bh=emEvaD0snb1I+KoYe1hZsB1kdYm9ngN1ujNXHazy8iA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tZUzzL1jUp1E7FGpQagx8FdojhUGQyuEH6KOAsfR/mG//dLbRGgHQDZn8nN1qFBWd
	 URoVjGklO8ilwqgoGnyKGox3b5I3d4J4k90f56jkBEwlgko1IRVZn2Wf05s0wa+SiJ
	 VCJ8p7Z7k+KLMBmeHA5rnow100NREGlxsO7cKw9Fhc1MvGy4GLO8tLtfJc9Ts8sJ3x
	 YOQZ/7tq3HyS5P/9q2ch0uVmhujpif2mKFBo84Qylvq4QuNUQXx3fZR7peCrv04z7Q
	 0yTut/NE1tzsh6zIjfK4fA78VjSWXWA7PCz4FHim4VNy4MCSL8sXLw8YS+N0KTlwva
	 sPtWfywdYqBhQ==
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3cfc1ff581dso3553285ab.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 10:34:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXd/zsmKtajV1V1Zkurw+0Q2eu51fTtFDzABVBe96h2zGOMCPTMDq2keCpv2E7SUF62mTmskD/8gfWhbiNXasQF@lists.infradead.org
X-Gm-Message-State: AOJu0YxncGGN0/Z13t1usen/0k6IyCDzx5VidPLSbgV4IQkqpbaKpqWn
	K+hmfe7JlcE9veSLFPhPNznqRypbmXAY5SrPhlHXtLLI5EabZS5oNwlOEX7nwSI4qzp+GTtG+X2
	5Li6qypuiqVJSRohPMjVGPorcSiI=
X-Google-Smtp-Source: AGHT+IHl4N25m7zqeEajPKatIGe0RodI8SLfJYlOUjqTeDPQzguZ3bn4VqrsIlE3PttoRvEJMKnh0jCIKWwufPy29H4=
X-Received: by 2002:a05:6e02:20e2:b0:3cf:fe1f:f5c5 with SMTP id
 e9e14a558f8ab-3cffe423925mr70175235ab.9.1738262060209; Thu, 30 Jan 2025
 10:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW4UrhaYKj6pbAC9Cq1ZW+igFrA284nnCFsVdKdOfRpi6w@mail.gmail.com>
In-Reply-To: <CAPhsuW4UrhaYKj6pbAC9Cq1ZW+igFrA284nnCFsVdKdOfRpi6w@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Thu, 30 Jan 2025 10:34:09 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7f5--hzr0Y3eb1JNpfNqepJuE92yq3y8dzaL_mQF+U5w@mail.gmail.com>
X-Gm-Features: AWEUYZmxfzPagOrcjlEC0Ts_lMB8rPrmxz6AOan_ZzpkJ7g-5LcRVOD6FqJcZw4
Message-ID: <CAPhsuW7f5--hzr0Y3eb1JNpfNqepJuE92yq3y8dzaL_mQF+U5w@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Weinan Liu <wnliu@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_103421_856969_22EE6E19 
X-CRM114-Status: GOOD (  10.31  )
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

On Thu, Jan 30, 2025 at 9:59=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> I missed this set before sending my RFC set. If this set works well, we
> won't need the other set. I will give this one a try.

I just realized that llvm doesn't support sframe yet. So we (Meta) still
need some sframe-less approach before llvm supports sframe.

IIRC, Google also uses llvm to compile the kernel. Weinan, would
you mind share your thoughts on how we can adopt this before
llvm supports sframe? (compile arm64 kernel with gcc?)

Thanks,
Song

