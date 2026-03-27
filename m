Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B0D10F284D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2KhTUAjw0jRKl8iCMNRp2pUaoEv3AvLCHL0xg/y+1U=; b=M0ESRWcqWLuzA/a4AevhS+KsKx
	q9gG4k+EpL3vUoQ0IhoDo+M9Bd5xwmqrwqIdbaEzGoo/gX4Gx9epRR3Fls1t5DTmWcuMxwu397cBz
	J6qRfP6t/oGicepRknw8eRAcrLmZce0fxwKYmrqmvzwmWvwmv+nEPnv68oe1XD/tfZRwBtk0o2EYG
	jCECV0dfXC9KPmIZWq2zWIVOEi7af/u6N/D5jteWSsOGhPLkSv4qZ2/h87HQpti/WdwAZyc4yyxyh
	ffAKe88+nVZfjpqSsvoaWOhLLiz0mMoPCfzEeYebEQHz7pj5W2CPpwGD0qrfDCBndrf4nRXYD1Fyr
	XfgUdDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69ho-00000007jpg-1j3o;
	Fri, 27 Mar 2026 16:06:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69hl-00000007jp6-4Bbs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:06:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0380635DA;
	Fri, 27 Mar 2026 09:06:29 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 501B53F905;
	Fri, 27 Mar 2026 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774627594; bh=rP5Us1gXdwPg7GyTIgDBgSFYYiyK72XcZqUZNsRJd7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=euB7uvj6sPvllCzscsJiWjfu2yQKubt0UwiyzR70XCV7OQY28kY7MGRijQb7Rj/ww
	 g5Jnk+yKB7WIdQKX0sZMjkOG8Lh6yX18HV9LbxuG0Qx9gTebYXJ4nvfTqJnMBxiUjW
	 Tep1yK+UIiWrTDxl7aHcASnUCM2R72F1NxjKzw+g=
Date: Fri, 27 Mar 2026 16:06:27 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Andrei Vagin <avagin@google.com>
Cc: Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, criu@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Chen Ridong <chenridong@huawei.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Koutny <mkoutny@suse.com>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Subject: Re: [PATCH 1/4] exec: inherit HWCAPs from the parent process
Message-ID: <acarA3sGKY4Acozw@J2N7QTR9R3.cambridge.arm.com>
References: <20260323175340.3361311-1-avagin@google.com>
 <20260323175340.3361311-2-avagin@google.com>
 <acGEonF9I6sPA42B@J2N7QTR9R3.cambridge.arm.com>
 <acJnOB-rlyt-3jU4@willie-the-truck>
 <CAEWA0a7iR8YHooqXJfhersV6YhAXGMZDUhib3QQH5XGn=KNowA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEWA0a7iR8YHooqXJfhersV6YhAXGMZDUhib3QQH5XGn=KNowA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_090638_208706_31931887 
X-CRM114-Status: GOOD (  53.48  )
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

On Tue, Mar 24, 2026 at 03:19:49PM -0700, Andrei Vagin wrote:
> Hi Mark and Will,
> 
> Thanks for the feedback. Please read the inline comments.
> 
> On Tue, Mar 24, 2026 at 3:28 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Mon, Mar 23, 2026 at 06:21:22PM +0000, Mark Rutland wrote:
> > > On Mon, Mar 23, 2026 at 05:53:37PM +0000, Andrei Vagin wrote:
> > > > Introduces a mechanism to inherit hardware capabilities (AT_HWCAP,
> > > > AT_HWCAP2, etc.) from a parent process when they have been modified via
> > > > prctl.
> > > >
> > > > To support C/R operations (snapshots, live migration) in heterogeneous
> > > > clusters, we must ensure that processes utilize CPU features available
> > > > on all potential target nodes. To solve this, we need to advertise a
> > > > common feature set across the cluster.
> > > >
> > > > This patch adds a new mm flag MMF_USER_HWCAP, which is set when the
> > > > auxiliary vector is modified via prctl(PR_SET_MM, PR_SET_MM_AUXV).  When
> > > > execve() is called, if the current process has MMF_USER_HWCAP set, the
> > > > HWCAP values are extracted from the current auxiliary vector and stored
> > > > in the linux_binprm structure. These values are then used to populate
> > > > the auxiliary vector of the new process, effectively inheriting the
> > > > hardware capabilities.
> > > >
> > > > The inherited HWCAPs are masked with the hardware capabilities supported
> > > > by the current kernel to ensure that we don't report more features than
> > > > actually supported. This is important to avoid unexpected behavior,
> > > > especially for processes with additional privileges.
> > >
> > > At a high level, I don't think that's going to be sufficient:
> > >
> > > * On an architecture with other userspace accessible feature
> > >   identification mechanism registers (e.g. ID registers), userspace
> > >   might read those. So you might need to hide stuff there too, and
> > >   that's going to require architecture-specific interfaces to manage.
> > >
> > >   It's possible that some code checks HWCAPs and others check ID
> > >   registers, and mismatch between the two could be problematic.
> > >
> > > * If the HWCAPs can be inherited by a more privileged task, then a
> > >   malicious user could use this to hide security features (e.g. shadow
> > >   stack or pointer authentication on arm64), and make it easier to
> > >   attack that task. While not a direct attack, it would undermine those
> > >   features.
> 
> I agree with Mark that only a privileged process have to be able to mask
> certain hardware features. Currently, PR_SET_MM_AUXV is guarded by
> CAP_SYS_RESOURCE, but PR_SET_MM_MAP allows changing the auxiliary vector
> without specific capabilities. This is definitely the issue. To address
> this, I think we can consider to introduce a new prctl command to enable
> HWCAP inheritance explicitly.
> 
> > Yeah, this looks like a non-starter to me on arm64. Even if it was
> > extended to apply the same treatment to the idregs, many of the hwcap
> > features can't actually be disabled by the kernel and so you still run
> > the risk of a task that probes for the presence of a feature using
> > something like a SIGILL handler or, perhaps more likely, assumes that
> > the presence of one hwcap implies the presence of another. And then
> > there are the applications that just base everything off the MIDR...
> 
> The goal of this mechanism is not to provide strict architectural
> enforcement or to trap the use of hardware features; rather, it is to
> provide a consistent discovery interface for applications. I chose the
> HWCAP vector because it mirrors the existing behavior of running an
> older kernel on newer hardware: while ID registers might report a
> feature as physically present, the HWCAPs will omit it if the kernel
> lacks support. 

On arm64, the view of the ID registers that userspace gets *only*
exposes features that the kernel knows about, as userspace reads of
those registers are trapped+emulated by the kernel. On arm64 it's 
not true to say that something appears in those but not the HWCAPs.

I understand that might be different on other architectures, and so
maybe this approach is sufficient on other architectures, but it is not
sufficient on arm64.

> Applications are generally expected to treat HWCAPs as
> the source of truth for which features are safe to use, even if the
> underlying hardware is technically capable of more.

I'm fairly certain that there are arm64 applications (and libraries)
which check only the ID register values, and not the HWCAPs.

Architecturally, there are features which are detected via other
mechanisms (e.g. CHKFEAT), for which HWCAPs are also irrelevant. Even if
that happens to be ok today, there are almost certainly future uses that
will not be compatible with the scheme you propose.

I don't think we can say "applications must check the HWCAPs", when we
know that applications and libraries legitimately don't always do that.

> Another significant advantage of using HWCAPs is that many
> applications already rely on them for feature detection. This interface
> allows these applications to work correctly "out-of-the-box" in a
> migrated environment without requiring any userspace modifications.  I
> understand that some apps may use other detection methods; however, there
> it no gurantee that these applications will work correctly after
> migration to another machine.

I think the existince of applications that detect features by other
(legitimate!) means implies that there's no guarantee that this feature
is useful and will remain useful going forwards.

For example, what do you plan to do if an application or library starts
doing something legitimate that causes it to become incompatible with
this scheme?

I don't want to be in a position where userspace is asked to steer clear
of legitimate mechanisms, or where architecture code suddently has to
pick up a lot of complexity to make this work.

> > There's also kvm, which provides a roundabout way to query some features
> > of the underlying hardware.
> >
> > You're probably better off using/extending the idreg overrides we have
> > in arch/arm64/kernel/pi/idreg-override.c so that you can make your
> > cluster of heterogeneous machines look alike.
> 
> IIRC, idreg-override/cpuid-masking usually works for an entire machine.
> We actually need to have a mechanism that will work on a per-container
> basis. Workloads inside one cluster can have different
> migration/snapshot requirements. Some are pinned to a specific node,
> others are never migrated, while others need to be migratable across a
> cluster or even between clusters. We need a mechanism that can be
> tunable on a per-container/per-process basis.

I think that's theoretically possible, BUT it will require substantially
more complexity, to address the issues that Will and I have mentioned. I
don't think people are very happy to pick up that complexity.

There are many other aspects that are going to be problematic for
heterogeneous migration. Even if you hide the HWCAP for a stateful
feature (e.g. SME), it might appear in one machine's signal frames (and
be mandatory there), but might not appear in anothers, and so migration
might not work either way. Likewise, that state can appear via ptrace.

Thanks,
Mark.

