Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3306C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2gx8+1v2YG2nXZ5rZ43ZGOVbgNWYwB+4lHcBSPfXX4=; b=w3JBLNqjG0z4LBBLqrC/sX/gzQ
	1kkMWZJQygP8qNOFzUd3DSvv8t/1iWoq1RmgCwyKIvISAVxr4Xo4aKrpA3K0i8qomLjEwrxcjFjeN
	Z23IU7JGCs9JA/hZUE77GG3+t74YlOfFGc7GbkWSK8GKgpMJ0EX1rPEBewKaRzIzJJUnuUvQ2SJwQ
	/fz/C/vSdgFBrgnYLIhHFv0iSzWbaweAed3Lfnb1c1yKosG8KWtjn0AUlpdNzPrwnfiAHK0S98S00
	lJoNW9nNxyy/lrx99M/pPIhdyVD/tCZtz+tIwGh1IyZca1Cer+adbVlO5O/0XQuIAhWnted+se5wX
	Uq8hH+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jmG-00000008Yyq-1Qsb;
	Wed, 16 Sep 2026 07:09:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jmE-00000008YyS-1T8t;
	Wed, 16 Sep 2026 07:09:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADAFF6053A;
	Wed, 16 Sep 2026 07:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165081F000FF;
	Wed, 16 Sep 2026 07:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789542593;
	bh=p2gx8+1v2YG2nXZ5rZ43ZGOVbgNWYwB+4lHcBSPfXX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K7SwAZ5TQox94KhnzDZgdWak9JeascnEJT6tgsdFitx13oH/yvHVurs3emFIQIidi
	 xcR0gIE20GLza50nMYtjBg//0e7WD22sTKu3OHciVTO0Egw6dpfNvS97BoC4LpWgvN
	 ZD0aZmUahuws0zfu0FGKie6dskhpn2wDFZH1gLvxR0Y/XLP3PDKD59Q3XEFPNj3iGd
	 l3nMpo+kKycUGKylVUc5DFObZlUBNTgMifgw32kRkszA3iFJ9ppTn7CES9cJYrH1JE
	 XD/gyr3hXov/6xjsaqqL1FGY+8ZmWmmW0Gqlh80XrHJbwZzvXyNf+hmB3sQ+DilGUR
	 S0XyD3cx8I3Gw==
Date: Wed, 16 Sep 2026 09:09:41 +0200
From: Christian Brauner <brauner@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, 
	Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, 
	io-uring@vger.kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	bpf@vger.kernel.org, David Airlie <airlied@redhat.com>, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, kexec@lists.infradead.org, 
	linux-hyperv@vger.kernel.org
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
Message-ID: <20260916-seilbahn-heimvorteil-edelmut-bad3637b3a95@brauner>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
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

On Tue, Sep 15, 2026 at 09:02:31AM -0700, Linus Torvalds wrote:
> On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wrote:
> >
> > TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> > allocates a descriptor like get_unused_fd_flags() does and records it in
> > a slot on the task. fd_stage() attaches the file to that slot and
> > returns the number.
> 
> Honestly, I am *not* a fan. At all.

I'm really glad that you don't like it! I hate it too.

To quote back from the cover letter:

> The idea in this series is old-ish and really never let go of me and so
> I wanted to at least dump it onto the list once even if it's just for
> illustrative purposes.

I think the cleanup-based solution we've added a couple of releases ago
is the better appraoch. Which is why I chose it over this.

But this install-on-the-way-out idea has been brought up quite a few
times as the "better approach". I never really believed it would work
nicely. Now we have an implementation on the list that we can point to
and we can move on from this.

