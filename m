Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6C1CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNMhC/w9+dlx3LytOIIwxfD8dJ7TkUSzEbtTuk3C9y4=; b=x4hFiZbBTG6LPZz6SCDDZLg4tc
	//kEFrwP0jcPBpYa1Oq6bDjz3i1LolNRKa5uoXFq0DV7vOlxF/lxHB14kFsmTG9s7Q9soheAdgYh5
	Ue/TJPr23r6vz8tzWHjfLBj8TLSLvZ8VvU+iNlo6rjjshwPHdURr5DMTTorGP5GE/ux/aNpdHW4fz
	ZKvbyZi4q7Y/q5G3sG5Wa5BEneTlk6y1Ofk1FzT2akOZIoZG9vOFE+4Rsr2kTsNpPAzGdtDbMAews
	mT0EJ7aYjj6Pm03VtzBLXR5zmMfX9ZAaYyIY+Lyix54n53sd4wyH5tdkCHUWnS0mh2gdtk4ZSpf5s
	fgWuNbog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut25G-0000000BxFz-0RmB;
	Mon, 01 Sep 2025 10:48:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut14m-0000000BnZY-09tO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 09:43:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 793791A25;
	Mon,  1 Sep 2025 02:43:37 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7F953F694;
	Mon,  1 Sep 2025 02:43:43 -0700 (PDT)
Date: Mon, 1 Sep 2025 10:43:36 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Luo Gengkun <luogengkun@huaweicloud.com>, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-ID: <aLVqyEGoHKVCFGFR@J2N7QTR9R3>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_024348_115014_0BFB3C4F 
X-CRM114-Status: GOOD (  19.09  )
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
> > 
> > BTW, arm64 also bails out early in do_page_fault() if in_atomic() but I
> > suspect that's not the case here.
> > 
> > Adding Al Viro since since he wrote a large part of uaccess.h.
> > 
> 
> So, __copy_from_user_inatomic() is supposed to be called if
> pagefault_disable() has already been called? If this is the case, can we
> add more comments to this code?

Just to check, you're asking for better comments in <linux/uaccess.h>,
right?

> I've been using the inatomic() version this
> way in preempt disabled locations since 2016.
> 
> Looks like it needs to be converted to copy_from_user_nofault().
> 
> Luo, this version of the patch looks legit, no need for a v2.
> 
> I just wanted to figure out why __copy_from_user_inatomic() wasn't atomic.
> If anything, it needs to be better documented.

If that had roughly the same kerneldoc comment as for
__copy_to_user_inatomic(), would that be sufficient, or do you think
both need to be made more explicit?

Mark.

