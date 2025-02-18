Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24ECC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oxxr8v6dQPdqFFYCSvenNWpV2FIRbTpUVj2QUe9HjOM=; b=YsF/SrgEGsqbnb2RylubWN8xKZ
	bPwPnyLKX4EkL4fKNdZoMbTdN4KZJPvZDkPkOrn5gR6taGFJz++tHPetrVIPs2zQ6MgKuo8J3Bt3t
	UfKJNK6PsTZYsZxZoXElh8Et7o4sghib22+q8F6QntZ4Q28eFPhfuUCs+RwsTUg1yhxVySfKxPY8D
	pYs8qI99MgxJFeVqzyQyzLHrbOUgHvq5VYb7O+f/0sQuk+0Mx3Dy3CyZy3puIHM7F411cLBacrKot
	F+0A2valRpmqkAtA3CAZoPpysXXLO4HW3fcOMOWd0fAqF+LLWLdawGcmlOoElzrpl0UB0n/gioay6
	vpeEdglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkShe-00000009RLg-2QSq;
	Tue, 18 Feb 2025 18:52:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSWk-00000009Oic-0BrY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:41:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49DF95C61AB;
	Tue, 18 Feb 2025 18:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D09C4CEE2;
	Tue, 18 Feb 2025 18:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739904061;
	bh=iSn5qlkSLrvY9fduNUiNVom2UONzE20CK92zMJiRyX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BsAtfCe3TAKsKWVtlrXywIPoIXoilqgNSNTs7nYiJc7ox+cXZyshjoUv90wT0Osem
	 gKt4dti+h3LbR+hjEVOSXF7DiCIUmTSBgEf3brOEfXA+gBYKnfp9lAHfcjIqppqwNt
	 O5iJVnxAaW2giwyDCoTCa9J6qAIjM/78Mf9KEXnbHmNtRjFQJlDkwRmqVWBmvInh9W
	 gOgfC4YJKTDkZQCamXcn2rQd2ZGzCemGdD3+fRrh1A8cslNK2eJQAq5fYaKg/lVd1P
	 /An9oyr5gEw/rirR+v1fnVuI/KKCf5++5RsZhyZBnRErWxl5d3wj7xTVZYK0ET9teO
	 nEMH/LLtJf9gw==
Date: Tue, 18 Feb 2025 10:40:59 -0800
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
Message-ID: <20250218184059.iysrvtaoah6e4bu4@jpoimboe>
References: <mb61py0yaz3qq.fsf@kernel.org>
 <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
 <20250214080848.5xpi2y2omk4vxyoj@jpoimboe>
 <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
 <20250214193400.j4hp45jlufihv5eh@jpoimboe>
 <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
 <20250214232342.5m3hveygqb2qafpp@jpoimboe>
 <CAPhsuW48h11yLuU7uHuPgYNCzwaxVKG+TaGOZeT7fR60+brTwA@mail.gmail.com>
 <20250218063702.e2qrpjk4ylhnk5s7@jpoimboe>
 <CAPhsuW5ZauBrSz11cvVtG5qQBfNmbcwPgMf=BScHtyZfHvK4FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW5ZauBrSz11cvVtG5qQBfNmbcwPgMf=BScHtyZfHvK4FQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_104102_126209_72F10B6A 
X-CRM114-Status: GOOD (  20.77  )
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

On Tue, Feb 18, 2025 at 10:20:10AM -0800, Song Liu wrote:
> Hi Josh,
> 
> On Mon, Feb 17, 2025 at 10:37 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > On Mon, Feb 17, 2025 at 08:38:22PM -0800, Song Liu wrote:
> > > On Fri, Feb 14, 2025 at 3:23 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > > > Poking around the arm64 module code, arch/arm64/kernel/module-plts.c
> > > > is looking at all the relocations in order to set up the PLT.  That also
> > > > needs to be done for klp relas, or are your patches already doing that?
> > >
> > > I don't think either version (this set and my RFC) added logic for PLT.
> > > There is some rela logic on the kpatch-build side. But I am not sure
> > > whether it is sufficient.
> >
> > The klp relas looked ok.  I didn't see any signs of kpatch-build doing
> > anything wrong.  AFAICT the problem is that module-plts.c creates PLT
> > entries for regular relas but not klp relas.
> 
> In my tests (with printk) module-plts.c processes the .
> klp.rela.vmlinux..text.copy_process section just like any other .rela.*
> sections. Do we need special handling of the klp.rela.* sections?

Ok, I see how it works now:

klp_write_section_relocs()
	apply_relocate_add()
		module_emit_plt_entry()
  
If that code is working correctly then I'm fresh out of ideas...

-- 
Josh

