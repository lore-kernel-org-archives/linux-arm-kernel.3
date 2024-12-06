Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1682E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgMFn6VL5GFx5RytU/0EGmFMlUt3Qngt2zSqkoPE5/Y=; b=vV4KB4FkqWclV5In0qdNBGEpf6
	6f4iR93G3DVKwgXjE/Wq27Ac94q04Y1bySNZpZI9aQXevOlKCud99JH7xAHC1J1r/xfUftYTvfZVn
	zy4NjKFuWbf5en1wBlAjkbeErSilWawkPXiIlUgo7bCW/ZAzyYLoJjqSc7zn/W4oZASp8RTP/wH+r
	SddNEMT0Ml+EmPB4JlfUKUZw7RxOX4cBwv6ez9o41mM4McxAxtxaSUnO2S9iodyIW/k/FYZTUEzdJ
	9XsHadxwpPVdJmL88qjedv51Q7UTIC3WEJ+2cFaTznM7xxu2ME5pe3yBoshZQ3+8JA8XEogsSgek7
	KA0U9GXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJb81-000000029PJ-0Vse;
	Fri, 06 Dec 2024 16:24:29 +0000
Received: from mx.ssi.bg ([193.238.174.39])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJb6y-000000029Fl-1c5n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:23:26 +0000
Received: from mx.ssi.bg (localhost [127.0.0.1])
	by mx.ssi.bg (Potsfix) with ESMTP id 1BDA221D95;
	Fri,  6 Dec 2024 18:23:21 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ssi.bg; h=cc:cc
	:content-type:content-type:date:from:from:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=ssi;
	 bh=CgMFn6VL5GFx5RytU/0EGmFMlUt3Qngt2zSqkoPE5/Y=; b=HQUi70o4FvhS
	cYB/jbDWZNy7y7Y0wnXFbM1qfSackMkaIsrqnXlO16IINMJ9dRw5sYmPWzR9fXnC
	KPGqmxFi/Ym9rQagN9p6nMghefF9h7/8ZAhKu5GNOlC2QxdLuvYrstPODqkXfc6u
	gXhAukX9GrZdptE4etIdKq4l1PB2nk3/28QZdDczn8vleamPQfevWNnyfZcNwgAz
	II4GU5JFSVJUwKpG+aJ7fPr3lLYuC5xJmwhvDtPXiAxnCnMqLbfEaNpGIvKIUSDT
	DIir0w4RQWAIL4flwzjupJ7meqHkbz7ZIuhDyyMFHdHZ+wWpXZywJvGnAzIXitmR
	7ck2B6tjrUg99kF9vTtbzHcaIh9HvY0juJxHuPcuzZCMy77v/Ifa6Sqdc9Ga9bkP
	yPR45NwSwtIxFNLuo4Wlm4Z9ACLqzA2kYk0pt/W5/hq1drwzCiggnBY6bBizYRts
	sKt3/GcJxgEmlBadj752x52QKgCg1+Spe++dmaobPxFk2BRxzNkmqZz6meaypWKU
	XKZ9T0kSaqOLA+dIN4/kLEZvZ08DYHAEZ/8jwRntDOqQ+48BcOqf/XCooU8WV7a/
	ubwQHoZvsceIMXOJVDxhY7ZYKNrGPpVJWmscWMFxYa6ZlR4VzPNeypmAFPDDkaH3
	WFEOG3Snd9faZJsMbczS5ClYFm94/v0=
Received: from ink.ssi.bg (ink.ssi.bg [193.238.174.40])
	by mx.ssi.bg (Potsfix) with ESMTPS;
	Fri,  6 Dec 2024 18:23:20 +0200 (EET)
Received: from ja.ssi.bg (unknown [213.16.62.126])
	by ink.ssi.bg (Postfix) with ESMTPSA id E617B15F19;
	Fri,  6 Dec 2024 18:23:14 +0200 (EET)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by ja.ssi.bg (8.18.1/8.17.1) with ESMTP id 4B6GNBkf041510;
	Fri, 6 Dec 2024 18:23:12 +0200
Date: Fri, 6 Dec 2024 18:23:11 +0200 (EET)
From: Julian Anastasov <ja@ssi.bg>
To: David Laight <David.Laight@ACULAB.COM>
cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "'Naresh Kamboju'" <naresh.kamboju@linaro.org>,
        "'Dan Carpenter'" <dan.carpenter@linaro.org>,
        "'pablo@netfilter.org'" <pablo@netfilter.org>,
        "'open list'" <linux-kernel@vger.kernel.org>,
        "'lkft-triage@lists.linaro.org'" <lkft-triage@lists.linaro.org>,
        "'Linux Regressions'" <regressions@lists.linux.dev>,
        "'Linux ARM'" <linux-arm-kernel@lists.infradead.org>,
        "'netfilter-devel@vger.kernel.org'" <netfilter-devel@vger.kernel.org>,
        "'Arnd Bergmann'" <arnd@arndb.de>,
        "'Anders Roxell'" <anders.roxell@linaro.org>,
        "'Johannes Berg'" <johannes.berg@intel.com>,
        "'toke@kernel.org'" <toke@kernel.org>,
        "'Al Viro'" <viro@zeniv.linux.org.uk>,
        "'kernel@jfarr.cc'" <kernel@jfarr.cc>,
        "'kees@kernel.org'" <kees@kernel.org>
Subject: RE: [PATCH net] Fix clamp() of ip_vs_conn_tab on small memory
 systems.
In-Reply-To: <2a91ee407ed64d24b82e5fc665971add@AcuMS.aculab.com>
Message-ID: <c0a2ee53-f6ff-f4d4-e9ab-6a3bf850bec5@ssi.bg>
References: <33893212b1cc4a418cec09aeeed0a9fc@AcuMS.aculab.com> <5ec10e7c-d050-dab8-1f1b-d0ca2d922eef@ssi.bg> <2a91ee407ed64d24b82e5fc665971add@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_082324_924658_ADBF99E8 
X-CRM114-Status: GOOD (  29.34  )
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


	Hello,

On Fri, 6 Dec 2024, David Laight wrote:

> From: Julian Anastasov
> > Sent: 06 December 2024 12:19
> > 
> > On Fri, 6 Dec 2024, David Laight wrote:
> > 
> > > The intention of the code seems to be that the minimum table
> > > size should be 256 (1 << min).
> > > However the code uses max = clamp(20, 5, max_avail) which implies
> > 
> > 	Actually, it tries to reduce max=20 (max possible) below
> > max_avail: [8 .. max_avail]. Not sure what 5 is here...
> 
> Me mistyping values between two windows :-)
> 
> Well min(max, max_avail) would be the reduced upper limit.
> But you'd still fall foul of the compiler propagating the 'n > 1'
> check in order_base_2() further down the function.
> 
> > > the author thought max_avail could be less than 5.
> > > But clamp(val, min, max) is only well defined for max >= min.
> > > If max < min whether is returns min or max depends on the order of
> > > the comparisons.
> > 
> > 	Looks like max_avail goes below 8 ? What value you see
> > for such small system?
> 
> I'm not, but clearly you thought the value could be small otherwise
> the code would only have a 'max' limit.
> (Apart from a 'sanity' min of maybe 2 to stop the code breaking.)

	I'm not sure how much memory we can see in small system,
IMHO, problem should not be possible in practice:

- nobody expects 0 from totalram_pages() in the code

- order_base_2(sizeof(struct ip_vs_conn)) is probably 8 on 32-bit

- PAGE_SHIFT: 12 (for 4KB) or more?

	So, if totalram_pages() returns below 128 pages (4KB each)
max_avail will be below 19 (7 + 12), then 19 is reduced with 2 + 1
and becomes 16, finally with 8 (from the 2nd order_base_2) to reach
16-8=8. You need a system with less than 512KB (19 bits) to trigger 
problem in clamp() that will lead to max below 8. Further, without
checks, for ip_vs_conn_tab_bits=1 we need totalram_pages() to return 0
pages.

> > > Detected by compile time checks added to clamp(), specifically:
> > > minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
> > 
> > 	Existing or new check? Does it happen that max_avail
> > is a constant, so that a compile check triggers?
> 
> Is all stems from order_base_2(totalram_pages()).
> order_base_2(n) is 'n > 1 ? ilog2(n - 1) + 1 : 0'.
> And the compiler generates two copies of the code that follows
> for the 'constant zero' and ilog2() values.
> And the 'zero' case compiles clamp(20, 8, 0) which is errored.
> Note that it is only executed if totalram_pages() is zero,
> but it is always compiled 'just in case'.

	I'm confused with these compiler issues, if you
think we should go with the patch just decide if it is a
net or net-next material. Your change is safer for bad
max_avail values but I don't expect to see problem while
running without the change, except the building bugs.

	Also, please use nf/nf-next tag to avoid any
confusion with upstreaming...

Regards

--
Julian Anastasov <ja@ssi.bg>


