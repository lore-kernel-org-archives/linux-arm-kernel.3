Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7948DCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqfTJX5InbWhiiUNx7CvmTYnKCwVMCkElNQR+jqrwwU=; b=Je/7lTX7U+hK+HfSMXxNn8WVhb
	OH6i7arOb6vVIdtHnoTmy2B62LzcAAXjVtVqCP0B20C6thQ7zpMj16hpwYEFMPPaiPmnbLE+W8Vhz
	vIR1zXQ2a0L5S/9npJOuuUcMFc05zaDqNuj1xpBXoSoacFgvh63xjyItPTZOcG0uWiao4PqyyyvK0
	UKzc8vecy592K22D69kdRIVDfh38wRoPiY1Ei6rF2UPXs7JVeNLAbG6utcsnWpDDtdaJNDiFKf1r8
	M684LGbp31ETlWEXe3bbMRnfrGvnj9edArKsHQnPF35wo+kIkE+ngeGkaHeq0vCpFSM3FB88O156M
	IVDJQMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFFf-0000000EXjk-1rYQ;
	Tue, 02 Sep 2025 00:51:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6y9-0000000DCte-2RFz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 16:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90BBD60010;
	Mon,  1 Sep 2025 16:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8BEC4CEF0;
	Mon,  1 Sep 2025 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756742480;
	bh=fQrRra8bEfuqcrTWzDBgXbZl6usAWaGI/BYxHkcaEX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RN8JwpVpmStxLHZa6f+4Buk+WRFPunyEzr4bt7PRE+cOGMbx8hwdtvpjTIko9mhqJ
	 xHnYCYG0ohHVf5B7VyWz5VXZ2jVZp+80P7CYhkqRuQxCMRe3XM2/s5mRyiAFu01SUZ
	 qpZpJq2gCcVQu20f35por/+EgC7JqmDUlu0x6dQG9CVJUpRr7tDU1uF7nOD9sAAVft
	 hMr3C2FxyG1TWOjTIVDZorlWLe6VOCdyCQHzF7WMBDisPFA03g4I+Y2ncCD3Tq0pf6
	 yHouBlFpSCnm6auYHEnX+JSMl675akoy+8QvXWzDQf5rj+U3R2ZfFS58/24HFZvg5J
	 yVxG5WdbOR0rQ==
Date: Tue, 2 Sep 2025 01:01:15 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Luo Gengkun
 <luogengkun@huaweicloud.com>, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-Id: <20250902010115.e20bb3beb9341aa5cb651009@kernel.org>
In-Reply-To: <20250829181311.079f33bf@gandalf.local.home>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
	<20250819135008.5f1ba00e@gandalf.local.home>
	<436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
	<20250829082604.1e3fd06e@gandalf.local.home>
	<20250829083655.3d38d02b@gandalf.local.home>
	<aLIFRHcsEo2e2GE7@arm.com>
	<20250829181311.079f33bf@gandalf.local.home>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 29 Aug 2025 18:13:11 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 29 Aug 2025 20:53:40 +0100
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> valid user address.
> > 
> > BTW, arm64 also bails out early in do_page_fault() if in_atomic() but I
> > suspect that's not the case here.
> > 
> > Adding Al Viro since since he wrote a large part of uaccess.h.
> > 
> 
> So, __copy_from_user_inatomic() is supposed to be called if
> pagefault_disable() has already been called? If this is the case, can we
> add more comments to this code? I've been using the inatomic() version this
> way in preempt disabled locations since 2016.

Ah, OK. it is internal version... plz ignore my previous mail.

Thanks,

> 
> Looks like it needs to be converted to copy_from_user_nofault().
> 
> Luo, this version of the patch looks legit, no need for a v2.
> 
> I just wanted to figure out why __copy_from_user_inatomic() wasn't atomic.
> If anything, it needs to be better documented.
> 
> -- Steve


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

