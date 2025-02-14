Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E54BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 23:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KC1u8OHpHuRkWEyJ1LCe7pKnnb5ndbSs4kEdZQ256U=; b=AkrQD0mBnQUu6Ejq1rU8PsDuLk
	77Bn9koHg5FMRqVDGP5YOHHM7WmgDYU163/s4EOiRXZpEfzkKKe3tJ7rZ0utp8vdL3YBD7WGMh5q9
	op+9yHfL4PQdmS/WJu18Dh4gxe29WG+GdM3p2nI2TgSYt6tizgrRksEMpHn3xy97jis7b3GfIZ9uv
	KVD8ECA/qdP1lr5d7xQzJUwBebw9sY4T2lbPTf0Pf4eEFgOAHeb6WedMJDuBM3ADSX6fknsGKYD68
	8TyaH2LrfSgZ+vq7cKHhH8+DGEmswmZhrTf8JZN4MRaSgtd82ZkmeMgciLaFK+KIL5pNInsF2iZAD
	axm7e8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj53d-0000000GUJX-1lqd;
	Fri, 14 Feb 2025 23:25:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj529-0000000GU5V-40kz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 23:23:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0245AA44C2B;
	Fri, 14 Feb 2025 23:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BDDC4CED1;
	Fri, 14 Feb 2025 23:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739575424;
	bh=Yhq/C5gSgJ6cl34cEwCBrIztG271Bks4WJzIFA5Zmhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Etk1v6vOaAAIg0XO1g/wK0jfLEDXElXxYj3ZBqwfuPAz+9rwu0xxKsmGQ9K8mAoy5
	 PLyLEnl/GMAPJrcLzop5aBOWv0OHv5OCVh0Vyv/pxVCJI3gANGzSBV6MsQL5b8XLVP
	 A4sYC4V/LEa30v66Qv3lG0Kr3eLRPqpGrjo4GZVY/sezZJYD17cE5nzRUZP/nHMgWC
	 Zc/q2h7f55E9XsASOacUgTBF4zQE/p66H4WwvckNTrL1WUNb8/Cepgg3i5eKEzKtJ1
	 C5m1lbBEzNhDBmIv97u9MNL+oc7fQ26OMxAfPo3rf9YXPwGuyX6IhrpS90JkLIiOLE
	 wYDr5RBTBH0aQ==
Date: Fri, 14 Feb 2025 15:23:42 -0800
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
Message-ID: <20250214232342.5m3hveygqb2qafpp@jpoimboe>
References: <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
 <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe>
 <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <mb61py0yaz3qq.fsf@kernel.org>
 <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
 <20250214080848.5xpi2y2omk4vxyoj@jpoimboe>
 <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
 <20250214193400.j4hp45jlufihv5eh@jpoimboe>
 <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_152346_059652_77B5A641 
X-CRM114-Status: GOOD (  16.49  )
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

On Fri, Feb 14, 2025 at 02:04:17PM -0800, Song Liu wrote:
> Hi Josh,
> 
> On Fri, Feb 14, 2025 at 11:34 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > On Fri, Feb 14, 2025 at 09:51:41AM -0800, Song Liu wrote:
> > > > Ignorant arm64 question: is the module's text further away from slab
> > > > memory than vmlinux text, thus requiring a different instruction (or
> > > > GOT/TOC) to access memory further away in the address space?
> > >
> > > It appears to me the module text is very close to vmlinux text:
> > >
> > > vmlinux: ffff8000800b4b68 T copy_process
> > > module: ffff80007b0f06d0 t copy_process [livepatch_always_inline_special_static]
> >
> > Hm... the only other thing I can think of is that the klp relas might be
> > wrong somewhere.  If you share patched.o and .ko files from the same
> > build I could take a look.
> 
> A tarball with these files is available here:
> 
> https://drive.google.com/file/d/1ONB1tC9oK-Z5ShmSXneqWLTjJgC5Xq-C/view?usp=drive_link

Poking around the arm64 module code, arch/arm64/kernel/module-plts.c
is looking at all the relocations in order to set up the PLT.  That also
needs to be done for klp relas, or are your patches already doing that?

-- 
Josh

