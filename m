Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59547CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J/jaEYpwmJ9NSunpOqHO0ghGzvko3qC7QKhCLtjAdM=; b=TnNhtmF8rDGY5Mi6Si+cxOPwdE
	nyDPYTjjHa+oyQUrbyPk/UUBh4u0bGAgHUjsAC2wVeSYhnfNDFbAphXVp/x1HNXjvwmBUkRBZHZZQ
	nKQspAT5tqKr9ThX0lSe+tVVE4p0bhY4qRE7ufy0TWZ2+WcD48LHZpLbaIKOz143sZcHxdCDX+Zd1
	nJudpF2XvGCP+FwWdsHXJz5zmRFxLfq1svGRCgxwhzx51k90yItkUjeca1CuMAAWow2SZA+ljEFDK
	1wJtDE4IPgYxkYn0VIAVeqpdNmVkhgmeKsC4UVm0rKk7ac6tfdbtALTRSvBRi7hVQrgJavSMf0XsW
	88d39SaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIys-00000007koZ-0k6p;
	Sat, 30 Aug 2025 10:38:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIjY-00000007je2-3a2Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:22:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA8EA601AB;
	Sat, 30 Aug 2025 10:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05E4C4CEEB;
	Sat, 30 Aug 2025 10:22:53 +0000 (UTC)
Date: Sat, 30 Aug 2025 11:22:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Luo Gengkun <luogengkun@huaweicloud.com>, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-ID: <aLLQ-43Ll8rF7kon@arm.com>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
 <20250819135008.5f1ba00e@gandalf.local.home>
 <436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
 <20250829082604.1e3fd06e@gandalf.local.home>
 <20250829083655.3d38d02b@gandalf.local.home>
 <aLIFRHcsEo2e2GE7@arm.com>
 <20250829181311.079f33bf@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829181311.079f33bf@gandalf.local.home>
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

On Fri, Aug 29, 2025 at 06:13:11PM -0400, Steven Rostedt wrote:
> On Fri, 29 Aug 2025 20:53:40 +0100
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> valid user address.
> > BTW, arm64 also bails out early in do_page_fault() if in_atomic() but I
> > suspect that's not the case here.
> > 
> > Adding Al Viro since since he wrote a large part of uaccess.h.
> 
> So, __copy_from_user_inatomic() is supposed to be called if
> pagefault_disable() has already been called? If this is the case, can we
> add more comments to this code? I've been using the inatomic() version this
> way in preempt disabled locations since 2016.

This should work as long as in_atomic() returns true as it's checked in
the arm64 fault code. With PREEMPT_NONE, however, I don't think this
works. __copy_from_user_inatomic() could be changed to call
pagefault_disable() if !in_atomic() but you might as well call
copy_from_user_nofault() in the trace code directly as per Luo's patch.

> I just wanted to figure out why __copy_from_user_inatomic() wasn't atomic.
> If anything, it needs to be better documented.

Yeah, I had no idea until I looked at the code. I guess it means it can
be safely used if in_atomic() == true (well, making it up, not sure what
the intention was).

-- 
Catalin

