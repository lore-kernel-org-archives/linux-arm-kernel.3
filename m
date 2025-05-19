Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF64C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4HrioBoIX7nIyaKUGc9hwTLw2XDvzbEycVJsaLc24U=; b=yPcIaQcPJkmDwUyonz+aWQs0fX
	8wF/lbhbGdMHNGbjgddt0gNYoP1oB4z4wy3UtvW2A5OKTt1D5+LoeCZweo1Gph6S/JHv3q9IgfaY6
	N+NlL7KzoE9EEqJP7OINkPwsNd2k+tbQett30rmqVSvIauWet6BbnQ5rzMGA/CtouJzfwx3tjecm8
	HJfdBhomZr9rCrH30tIeu+DJoG34PXfppJ8jXTb5LJ7UWNuhWuQr2Mn0mGJwCZaNr4Yeg86fWo1Vt
	V4LnQujS1G++ZlwRVLALMgbx6vE2E7FemlUjaFx1ARZLnft4HR9NtK+wTZmn+kJKPC5RnyASFvtOP
	sXacduxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29S-00000009XXc-0Nl5;
	Mon, 19 May 2025 15:11:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1Na-00000009QnL-1UrR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:22:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81721629C4;
	Mon, 19 May 2025 14:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C429C4CEE4;
	Mon, 19 May 2025 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747664529;
	bh=rwYuCyW7EYGc7OitizTfiKDPCb/T39R026WxPZkwQM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5Xj6nrfuCj5Ihu0HSp/hyuNFZjqhkmvCxUBGOJRY6X4GDuLfpfVz+Ter7WXX0rLn
	 MY7JcML+KD/q9MWRnw0vP1KOk12uX0bg9WBY6fv1DpiKbnhUQWt2EEwSuciUunCikX
	 tOT3pbTQEbtygWX9E3SGdZQFXj6duB9Y20hACsVZt6tSY+35WecfS0F6lixmtmN3rB
	 PKFda22fylwc0ZxSIV9X27bhaDY+mtv/fne3lGt3reYIUJ+ZDn7Pq559o0/m8AHjDq
	 s4K63IUc01DKyJj2JGhAzggEj6YN/PQ4WhaGDPYhpnq7ZN4c+Nw//pf57YXBI/QNPr
	 ZJ75iVorAOjNw==
Date: Mon, 19 May 2025 15:22:03 +0100
From: Will Deacon <will@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com,
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	peterz@infradead.org, roman.gushchin@linux.dev, rostedt@goodmis.org,
	kernel-team@meta.com
Subject: Re: [PATCH v3 0/2] arm64: livepatch: Enable livepatch without sframe
Message-ID: <20250519142202.GD16991@willie-the-truck>
References: <20250320171559.3423224-1-song@kernel.org>
 <Z_fhAyzPLNtPf5fG@pathway.suse.cz>
 <CAPhsuW4MAcVpXmZVQauoaYe0o3tDvvZfgmCrYFFyFojYpNiWWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW4MAcVpXmZVQauoaYe0o3tDvvZfgmCrYFFyFojYpNiWWg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Fri, May 16, 2025 at 09:53:36AM -0700, Song Liu wrote:
> On Thu, Apr 10, 2025 at 8:17 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> [...]
> > >
> > > [1] https://lore.kernel.org/live-patching/20250127213310.2496133-1-wnliu@google.com/
> > > [2] https://lore.kernel.org/live-patching/20250129232936.1795412-1-song@kernel.org/
> > > [3] https://sourceware.org/bugzilla/show_bug.cgi?id=32589
> > > [4] https://lore.kernel.org/linux-arm-kernel/20241017092538.1859841-1-mark.rutland@arm.com/
> > >
> > > Changes v2 => v3:
> > > 1. Remove a redundant check for -ENOENT. (Josh Poimboeuf)
> > > 2. Add Tested-by and Acked-by on v1. (I forgot to add them in v2.)
> >
> > The approach and both patches look reasonable:
> >
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> >
> > Is anyone, Arm people, Mark, against pushing this into linux-next,
> > please?
> 
> Ping.
> 
> ARM folks, please share your thoughts on this work. To fully support
> livepatching of kernel modules, we also need [1]. We hope we can
> land this in the 6.16 kernel.
> 
> Thanks,
> Song
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20250412010940.1686376-1-dylanbhatch@google.com/


FWIW: I reviewed the patch above ([1]) already but didn't hear anything
back.

Will

