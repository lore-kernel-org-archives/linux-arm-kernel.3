Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30CBC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mDFWeFiBnggM0q33dy7QHU1iHnKTw37iAO5Rp5b8ck=; b=sN65Enb1bGEKJ7Pao1Nk9Az52T
	u2VRsFgEvpXHom7dy/w4QecXTrOrtFlPreau7C1q1W4jWprFSYUL+Up5oKqfEPXOp3mO/l9i6eFn2
	/4W5W7CZVakgtsFkuvDgvr8vNUDJgS3PbCruSiMHleRWIiBKDbZzvhqKolzsVH6GndhuvBFvXe2ju
	BveY/feZAVU3ki8ppPazvdqZ/JkvwWPMN47BbvsgUfHlMushfu47ee3oLsP76CLMa+JX+g//wp1tq
	rWR9IlXXE8WHTUY5QGTGXuWJ2EknMEveZC9K7a9jWUcvjbKdKZgGrwquepGqwbc2NTR5rGSoId4RX
	dR4yQ/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBEh-00000002Lvc-06OV;
	Thu, 20 Feb 2025 18:25:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBBp-00000002LEY-0x3J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:22:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 710455C5DC0;
	Thu, 20 Feb 2025 18:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B6FC4CEE2;
	Thu, 20 Feb 2025 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740075743;
	bh=qfyPCheNrKkjIY1NJs7HY2hFww1UAkOPsdSQgC6ryyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ConAiYNJs/H+eqN0mjIKdukO5HQikG3jpBnEA92mtahA1koFY9XlNX1AlO5+0sBQM
	 iVKA7sqDYVhXNF8keZpoysRAwqUywv55Lh3TmYDw0JrlVrGq+lj38UOVFAd1AWiH2O
	 rNew6H9Yy4Kb2cigj6gxch7tgilcLPmLMSYtSnZ5k7KfheKEJgq6v//b9KlGON0KJr
	 wBWmXWpTJd+gsrKJOHOwx7EKHv/ulA+JtRMIH+9U7z0KLEWHigggw4K7rOR4tyRke1
	 9Ll4WOTKelBT1hzyLcAjW4wXxAQ8KiKXeVeqpHFL1LXs6H9tz0jseV+5eTrdRST/DH
	 XF302k9wjkfZg==
Date: Thu, 20 Feb 2025 10:22:21 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>, Weinan Liu <wnliu@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Indu Bhagat <indu.bhagat@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250220182221.vdmmnoyvc2do5mnn@jpoimboe>
References: <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
 <20250214193400.j4hp45jlufihv5eh@jpoimboe>
 <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
 <20250214232342.5m3hveygqb2qafpp@jpoimboe>
 <CAPhsuW48h11yLuU7uHuPgYNCzwaxVKG+TaGOZeT7fR60+brTwA@mail.gmail.com>
 <20250218063702.e2qrpjk4ylhnk5s7@jpoimboe>
 <CAPhsuW5ZauBrSz11cvVtG5qQBfNmbcwPgMf=BScHtyZfHvK4FQ@mail.gmail.com>
 <20250218184059.iysrvtaoah6e4bu4@jpoimboe>
 <CAPhsuW4pd8gEiRNj920kO8c4JuEWoXT=MhFK-nWvJZ9QseefaQ@mail.gmail.com>
 <CAPhsuW57xpR1YZqENvDr0vNZGVrq4+LUzPRA-wZipurTTy7MmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPhsuW57xpR1YZqENvDr0vNZGVrq4+LUzPRA-wZipurTTy7MmA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_102225_309797_64092EFA 
X-CRM114-Status: GOOD (  13.58  )
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

On Wed, Feb 19, 2025 at 08:50:09PM -0800, Song Liu wrote:
> Indu, is this behavior (symbols with same name are not in
> sorted order from readelf -s) expected? Or is this a bug?
> I am using this gcc:
> 
> $ gcc --version
> gcc (GCC) 14.2.1 20240801 (Red Hat 14.2.1-1)
> Copyright (C) 2024 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Are you using different binutils versions as well?

It sounds like a linker "issue" to me.  I'm not sure if it qualifies as
a bug, the linker might be free to layout symbols how it wishes.

-- 
Josh

