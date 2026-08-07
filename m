Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF18C5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2h7TFpNtHGZoQbDMXlxnaziePvR8kZuJ/KZ00xUctY=; b=F3uw6xzGtQOe4wZ/VHRWlwFeaR
	G4X2mj96XEw/rv3uaLq/a9RnHmcYRk55rrOGGH/SjXqsf4TcPBm/eTTlfPyQuYtgBDO5HP88ZMDbm
	ddpGn303DI1nZSLD8+n5WQ6OWXC7yafZ2k0RqbGg+e+I3GfWNDahAuG3AdBpxH0KChTdyim1JBgQc
	324w7EpCab69nWO8CyidvwiLE3ZQhq2FlvMLSHauckFAUTMDR1LVZ9wKRuaJxQHK4KE7mRdT2swwE
	8KNN7LpMT1W9Ao/Nd5/a2n45fJCVMmkJpw5fmxtwghgHgR2Oth1hvol2M02wKLgGpCiXwI6snHIUB
	9W03gMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTU6-00000008pxZ-34r0;
	Fri, 07 Aug 2026 22:56:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTU6-00000008pxT-0LrK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 22:56:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C096E42E38;
	Fri,  7 Aug 2026 22:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80101F00A3A;
	Fri,  7 Aug 2026 22:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786143373;
	bh=k2h7TFpNtHGZoQbDMXlxnaziePvR8kZuJ/KZ00xUctY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OzkQm4sIh98Wqq9Rgzi8nNRRs5cOR5UONHibRZ6i/HgWrIQkMs3L4ma4sRMTQsRkr
	 rYUC3o4jxH+IhxRUpzUXY42thV+sWlmDR95ynufsP+qFFiMVS/N2tRawqnt1eyIKiq
	 GPlLxNB+iVZHZygXL1bmxO+YJfPjbdsGidN8+TtsErKTB+wQ3ENy/niqQGt8oucBx4
	 dAy5uN8aJTjrvyyVuNxFg+OS4rMUMzJKbPKaDiWiTz9/HHZM8w8KAzeZ9LkUMHplnP
	 XEx7ZiRcNYKUkPBDiiPaXAPOFu226wm7iBdPcjMbdso4KnvRnMYJh9VKsMgJx3rESQ
	 IcZ7lULkttxZw==
Date: Fri, 7 Aug 2026 15:56:11 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Joe Lawrence <joe.lawrence@redhat.com>, 
	Song Liu <song@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v3 10/21] objtool: Ignore jumps to the end of the
 function for checksum runs
Message-ID: <rcfhf5sutcqvl4bwhn7neuwv7di7opbkwy754sfgtwmce7mpte@vbtw77bs3khg>
References: <cover.1778642120.git.jpoimboe@kernel.org>
 <b3b58101e15e1bb5266e57134f0b65f7d8efdd4b.1778642120.git.jpoimboe@kernel.org>
 <20260513073617.GH1889694@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513073617.GH1889694@noisy.programming.kicks-ass.net>
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

On Wed, May 13, 2026 at 09:36:17AM +0200, Peter Zijlstra wrote:
> On Tue, May 12, 2026 at 08:33:44PM -0700, Josh Poimboeuf wrote:
> > Sometimes Clang arm64 code jumps to the end of the function for UB.
> > No need to make that an error for checksum runs.
> 
> I'm not sure I understand the rationale. If the compiler trips UB, we
> want to be complaining about that no?
> 
> Same as when clang just stops code-gen, also something we commonly see
> when it hits UB.

Right, but I guess the question is, should we always warn about that, or
should we only warn about it when doing stack validation or ORC or some
other CFG-traversing thing?

The checksum thing is only used when manually enabled by klp-build
(never for normal kernel builds), so it would be a weird spot to report
the Clang "jumping to the end of the function" UB.

If we care about that for arm64 then the UB check probably belongs in a
new standalone objtool command that would get used during a regular
kernel build.

-- 
Josh

