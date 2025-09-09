Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D5DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kbI7aMD7wPXrBWktWN9VeWJRPpUA8XmzxBytsEbLis=; b=pJdBKB4cn58DGmSJ2GPhI80b5p
	oS8OF/EdpLokPTk2sgSIwd/amB77chOLiExXj/78du96zax1/a3Fw//v2fCgMtqOlQBKlYGKXYzX5
	RdUF/PItU0mtL77rbxs5Bup/TzRanpkxTdA7Bs2/ZNKjvDGDO6GMyPRllW96KeLwCrBovl3pM1IyU
	OEP2WAQLIRvgwoMsY+CL/YL5ZCEoZBl3qpf5easyW5rA53s74h5w/1piDeTEHGSZ1HPO2mR+KYTl5
	kxMEBO+M3fAU/AtBml8Ec9lsig9OK7hO6VRfezjBqQ8PdujzxlQfBjB4c1t5BiBGGGv/yacldUtMR
	pEwhUfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3FF-00000009U34-3POh;
	Tue, 09 Sep 2025 18:39:09 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3FD-00000009U1f-1jzQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:39:08 +0000
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 69E5A14069C;
	Tue,  9 Sep 2025 18:39:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id B2FDE20025;
	Tue,  9 Sep 2025 18:39:00 +0000 (UTC)
Date: Tue, 9 Sep 2025 14:39:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/24] tracing: Add reset to trace remotes
Message-ID: <20250909143948.420bfb1c@gandalf.local.home>
In-Reply-To: <aMBSa29ev0BNgr5R@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-5-vdonnefort@google.com>
	<20250908193757.079aae76@gandalf.local.home>
	<aMAZMaZJ1_Eny5Ku@google.com>
	<20250909094028.3265b751@gandalf.local.home>
	<aMBSa29ev0BNgr5R@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B2FDE20025
X-Stat-Signature: 88rpahm4umjmmcjmrz9w7j3z6z8cjawb
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Dfb0F/ok0yMi6rVU9qwiXjkJqxDcdMLk=
X-HE-Tag: 1757443140-354827
X-HE-Meta: U2FsdGVkX1/dFMJGRD+C6O+Za+iRGR7QlQeUizfNtukq1m6fiS7yJXJxYQxG9yxfVWgqP1DYfzB0aOk3vcc97HywbUnaMvNe17yZQK7V0szWK1Xn6Fl1E/CQyXQAKRnkuCgAc7SuJp0V/GjwyvI52PlbVs4xIb6J5bfiz08Jgs1BYuK2BxX9Q4cDppfKLQ5O3V9K0Fdd3muKjQcb4613ryQc1TiRocoDXYvOIhxEJ3hsZTAKZllg5vzY8IgoDRAIEVes+/4idN+hXi8UaE6BF780N6C1bIYBKIOoWDOENiR/Vg6w8f57zdLTvf6x0jOhYSOnHsTZAQiFGZjiGXvDuz1xkAnD1qwI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_113907_515177_FB09BE8A 
X-CRM114-Status: GOOD (  27.17  )
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

On Tue, 9 Sep 2025 17:14:35 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> On Tue, Sep 09, 2025 at 09:40:28AM -0400, Steven Rostedt wrote:
> > On Tue, 9 Sep 2025 13:10:25 +0100
> > Vincent Donnefort <vdonnefort@google.com> wrote:
> >   
> > > > I wonder if we should name the file "reset" to not be confusing to users
> > > > when they cat the file and it doesn't produce any output.    
> > > 
> > > My idea was to keep the exact same interface as the rest of the tracing. I could
> > > keep that /trace file for compatibility and add /reset?
> > > 
> > > "cat trace" could also just returns a text like *** not supported *** ?  
> > 
> > If it's never going to be supported, I rather not add it. It not being
> > there is a sure way of knowing it's not supported. Just adding it because
> > the normal system has it is actually worse if it doesn't behave the same.  
> 
> If later we extend the meta-page to support non-consuming read, /trace would
> then become useful.
> 
> Another argument for non-consuming read would be to enable dump on panic.
> 
> But I understand your point, it might be wishful thinking at this point.
>

It may be possible to still do a trace file. Basically, it would work the
same way the normal iterator works. Today it reads the trace while the
writer could be modifying it.

Actually, I think there's a bug in the iterator code today :-p

It needs to be modified to copy the event, as it currently passes the event
as is and that event could be written over by the writer.

But anyway, I think it should work for the remote buffers too. Let me go
and fix the current iterator.

-- Steve

