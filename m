Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242F1CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1a7P+yEOUQIyn71XO8cqMUBzF8Nlrusg9Qd44W2Mwlg=; b=0fMYUpST0cDQLZI7tWIzinRAkG
	lLhZTJUtx57dcOjt7u9outQMRG2Z+80Yt9BMcztOsU9JpJ1PXttieJ4vHxht9BbjXxsDbei9nP1sR
	emjeYySmzKZYhb8TsMmhBs9ZW7I+C7LnquDqZ+kHvxfggNZwQmCAgL3iSLISyr8hbo+PTRr5/MPX4
	zFz4SKVlUHWkttiC4/pfDud5Z9uqG9iOTAnMiI5QZgcqlLiFDZ0w9+RkkVhXFjrBw9s8mD1U51Xfv
	q6muhRX2Wymp5EXTy/FjwrgduyipATAQhGT4Oboz6p99fTkRzKoZ2sUf+KZiMhDE1IAdCfJaE8MG/
	ELn27faA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYm5-00000002AZX-3BIZ;
	Tue, 02 Sep 2025 21:42:45 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRjt-00000000HKC-0h8u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 14:12:03 +0000
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 38965B6B60;
	Tue,  2 Sep 2025 14:11:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 404B720025;
	Tue,  2 Sep 2025 14:11:52 +0000 (UTC)
Date: Tue, 2 Sep 2025 10:11:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Luo Gengkun
 <luogengkun@huaweicloud.com>, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-ID: <20250902101151.7b6bfabb@batman.local.home>
In-Reply-To: <aLVqyEGoHKVCFGFR@J2N7QTR9R3>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
	<20250819135008.5f1ba00e@gandalf.local.home>
	<436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
	<20250829082604.1e3fd06e@gandalf.local.home>
	<20250829083655.3d38d02b@gandalf.local.home>
	<aLIFRHcsEo2e2GE7@arm.com>
	<20250829181311.079f33bf@gandalf.local.home>
	<aLVqyEGoHKVCFGFR@J2N7QTR9R3>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: yfdqd1rqmcrdaxngseijdutusixhu8z3
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 404B720025
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/3a4ZlCJqnzjOJTHcJTR8oy/SOfj8p6YY=
X-HE-Tag: 1756822312-777584
X-HE-Meta: U2FsdGVkX1//P+0V3cvSYifPjfQTtkjYA3kwKM05QyUhd38/lHcPSo2h/lta995pbi6WwAdjmyuSvNRcAQsD+hL5ESmOEB5mv/qd53yLYb1p6qvs0wiQYvakljuWB/zDPPzSBmB8oUJlf4gQ3Y41+2g7armRU8zyjPg3RdFnYs87QO4MYtihj2V+61TAZk8OPbCCi0IiCH42iaRK2MY7PWspIgcDxkfFj8gpYMhkqzHYKTNOpAMp4LZv2duSryOYi7OlaXm31KgYo0WBZxl8YClJNNLoaTJg3WHoaSNDZP3P2qUPcfiQBuHUlS0za9z0BOM7c6V0RNjIYwm1tIHYYzPk6Gqunk0cY4xhbjUaUxQpVC/DmJcnV9K7jnlg3dLD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_071201_267932_3E809F08 
X-CRM114-Status: GOOD (  22.23  )
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

On Mon, 1 Sep 2025 10:43:36 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> > So, __copy_from_user_inatomic() is supposed to be called if
> > pagefault_disable() has already been called? If this is the case, can we
> > add more comments to this code?  
> 
> Just to check, you're asking for better comments in <linux/uaccess.h>,
> right?

Yes.

> 
> > I've been using the inatomic() version this
> > way in preempt disabled locations since 2016.
> > 
> > Looks like it needs to be converted to copy_from_user_nofault().
> > 
> > Luo, this version of the patch looks legit, no need for a v2.
> > 
> > I just wanted to figure out why __copy_from_user_inatomic() wasn't atomic.
> > If anything, it needs to be better documented.  
> 
> If that had roughly the same kerneldoc comment as for
> __copy_to_user_inatomic(), would that be sufficient, or do you think
> both need to be made more explicit?

Yeah, it would have been very helpful to have that. Note, my use of
__copy_from_user_inatomic() was added before copy_from_user_nofault()
existed. So it would likely not have been helpful back then ;-)

I think even adding a comment to the kerneldoc of these functions with
something like:

  You probably want to use copy_from/to_user_nofault(). These are more
  for internal handling, and should be avoided unless you really know
  what you are doing.

-- Steve


