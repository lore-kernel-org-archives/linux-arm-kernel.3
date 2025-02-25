Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBA5C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 22:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rho56qg4TR4Cq4O2wW8EYWxL1NMCYzqNG7mQAgo67Mg=; b=SbtYLCdM7IZFo7cQBLXJYQomxt
	W+dZiOeqtWRNTbvDlH7NodyVJxkNxhMS+3/rr8uHI5phUmq2ThcuxMIsGbJDz9+24vMO/CSBusZm8
	ICkvfEHGl/MwdwlyKR9tFFGnmU6nQllz8aQ1hXX3XW6rD0GTvkjN31RQPwH3wOBV0FKbdW3pAbXjy
	O/CO5FNo2PR2HYYsakZl8UvMnj0SlhekTxEcn55apauAxGKfuQyo2HgrP/d80qVaI4ETDZJT8V45g
	fePoBK6UXx8UyYrpx304li6Lj23OfVUT3F/yn/M3d2KvKBL+UP0y46G5eS41o1aQ0k9taaOOdZGzS
	bUWwbxgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2z2-00000001czW-04IB;
	Tue, 25 Feb 2025 22:00:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2xW-00000001ckv-007b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 21:59:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5745861209;
	Tue, 25 Feb 2025 21:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2B9C4CEDD;
	Tue, 25 Feb 2025 21:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740520761;
	bh=k3ncfrBzSzEk4e3l0PwPp8uuDaQQnMOGnDx+adJQiso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNJREjHrwh1OskgVIKX5DsQWTc2CXp6wLiWAdnrSNnPC4jgZ3S4U2kfx4GL3GoiBu
	 U08JQWiNQQfoz7nedqt56zZvW3fnEJkmjVkwjNMRO3Omr+ogO1W6JtYk4Ns69uOwNQ
	 5D2RPkMXPA/biKIQub67KAZ9Zki/jusGxOE/yOJx9wBpO3YtSVmKxFca5T+X8kvcLv
	 5QJKZp/ByrPDLpivh4XMPonqYuJu+4u4yop+L9iEOdGlHfstQ5fQH1+nGVNfJ3sDOt
	 utZt0Fagif/KlfefjW7jEpElrpTy0FzekyUbmlKIJaZR41pVDaJHDBDpWjjzRUazxK
	 79pH2sMJzTeaA==
Date: Tue, 25 Feb 2025 22:59:06 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Luo Gengkun <luogengkun@huaweicloud.com>, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	will@kernel.org, jmorris@namei.org, serge@hallyn.com,
	rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, stephen.smalley.work@gmail.com,
	omosnace@redhat.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH linux-next 1/2] perf: Remove unnecessary parameter of
 security check
Message-ID: <Z749KuWROxQMsbnu@gmail.com>
References: <20241223070650.2810747-1-luogengkun@huaweicloud.com>
 <20241223070650.2810747-2-luogengkun@huaweicloud.com>
 <CAHC9VhRRu-UYEV_-0-QgOZ3ByVwp-ZdEphmsvy4NcdqynH_tDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhRRu-UYEV_-0-QgOZ3ByVwp-ZdEphmsvy4NcdqynH_tDg@mail.gmail.com>
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


* Paul Moore <paul@paul-moore.com> wrote:

> On Mon, Dec 23, 2024 at 1:57 AM Luo Gengkun <luogengkun@huaweicloud.com> wrote:
> >
> > It seems that the attr parameter was never been used in security
> > checks since it was first introduced by:
> >
> > commit da97e18458fb ("perf_event: Add support for LSM and SELinux checks")
> >
> > so remove it.
> >
> > Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
> > ---
> >  arch/x86/events/intel/bts.c     |  2 +-
> >  arch/x86/events/intel/core.c    |  2 +-
> >  arch/x86/events/intel/p4.c      |  2 +-
> >  drivers/perf/arm_spe_pmu.c      |  4 ++--
> >  include/linux/lsm_hook_defs.h   |  2 +-
> >  include/linux/perf_event.h      | 10 +++++-----
> >  include/linux/security.h        |  5 ++---
> >  kernel/events/core.c            | 14 +++++++-------
> >  kernel/trace/trace_event_perf.c |  4 ++--
> >  security/security.c             |  5 ++---
> >  security/selinux/hooks.c        |  2 +-
> >  11 files changed, 25 insertions(+), 27 deletions(-)
> 
> This patch seems fine to me from a LSM and SELinux perspective, but
> I'd want to see an ACK from the perf folks before I merge this.

A belated:

  Reviewed-by: Ingo Molnar <mingo@kernel.org>

Patch still seems to apply fine.

Thanks,

	Ingo

