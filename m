Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CEACA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ke6oRiLVjqDMwEDoh2gVhgxONFWefFB+M016sliLWUM=; b=PK8BoT5NT08aEKdM/SItYjN1d1
	Wg9qn/USofQG3788yApA4AvPPVNPXmHbgsGLUObD54pbh/+xw/wHpkgMLJX2nA/CWY8GPkHaIReyE
	sFU906WPNIu1+7ksQlDhts+XJ3NNr3LVTY3JDt211LjVt8eYy8BjKtL5PmNoHFrp/H9O9NOGpPltA
	lowA1I4OieTVhKfxMioMNdjKo4hmVmvJ8mqy6c/THXXUXNzR96e8MALgW1wPV9gmFOZvuVl/hK2JU
	z8VSKn1GLJ6gyqGSWpZVln8nBZJwNDAhMTEFdvU9r6upfJMPGOda18RIGICPw+e8WxbvK0YE17EYx
	OLVZezmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1ON-00000006Igx-337q;
	Fri, 29 Aug 2025 15:51:55 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryLN-00000005gN7-305Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 12:36:39 +0000
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 2F7641199C8;
	Fri, 29 Aug 2025 12:36:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 15AEE2002B;
	Fri, 29 Aug 2025 12:36:32 +0000 (UTC)
Date: Fri, 29 Aug 2025 08:36:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Luo Gengkun <luogengkun@huaweicloud.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-ID: <20250829083655.3d38d02b@gandalf.local.home>
In-Reply-To: <20250829082604.1e3fd06e@gandalf.local.home>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
	<20250819135008.5f1ba00e@gandalf.local.home>
	<436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
	<20250829082604.1e3fd06e@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 15AEE2002B
X-Stat-Signature: i77fizctsna1z8euc6knaq8nkx9ineo3
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+yQ+YsxWmh2Lo5DjJW2xbGjyvMyvcjQ9o=
X-HE-Tag: 1756470992-991028
X-HE-Meta: U2FsdGVkX19SLfoVFSBRHC5XJMpeUKVqAKL8kXAIkL+7CAoQKp+2El+NQ/7+vcj5oMfGwtPnUyvD5tEbLt7f0dutbohqYFdTVxrZ4UEdZMKYSskXAVaIpjhkQgQPkcJN807ruTwTGcc9mB8xMR2iGY+qEKd9GP0rmHA7SiQHpUy95ayfWGzIO+c2syZS9ZSNustpBfbojDh5Ri8adNPBHlW8ct+qjK5cXDWVANMCBWncGhaJinXcHsVymqUoUsO3R9to8PnAepQyI7mBDLqn/l5uSXNKYFltwUmPshGo3pg14KNqASBwcyA3M3q8d5tEe9btR5sqnqo3iumhXFgUYurIyBAFhSW1oFx9TTLpK54q0B8AJ+44VBM7S4Br8zTw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_053637_814487_3E130EBB 
X-CRM114-Status: GOOD (  13.71  )
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

On Fri, 29 Aug 2025 08:26:04 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> BTW, the reason not to fault is because this might be called in code that is
> already doing a fault and could cause deadlocks. The no sleeping part is a
> side effect.

The difference between __copy_from_user_inatomic() and
copy_from_user_nofault() is the above. It is possible to fault in memory
without sleeping. For instance, the memory is already in the page cache,
but not the user space page tables. Where that would be OK for
__copy_from_user_inatomic() but not OK with copy_from_user_nofault(), due
to the mentioned locking.

For things like trace events and kprobes, copy_from_user_nofault() must be
used because they can be added to code that is doing a fault, and this version
must be used to prevent deadlocks.

But here, the __copy_from_user_inatomic() is in the code to handle writing
to the trace_marker file. It is directly called from a user space system
call, and will never be called within code that faults. Thus,
__copy_from_user_inatomic() *is* the correct operation, as there's no
problem if it needs to fault. It just can't sleep when doing so.

-- Steve

