Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC49D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdQDOqyfil+DNkwzLkg7VF450RbTdgCc8NqtMW6uRW4=; b=1byT7OAvvkm0CIUlIu1pooMvGU
	HKCozU8Cex4KvSypt8qZBtU9TotiOuWHxN9SN60KHbkP2jJjEwk9H8yn9OeueUaXuD31D5BVe8w65
	owvHHOTYV6PUS2mJHvjUbZYN2SsL6mXv7M64M7mGeuI3QU/vcDLrJqpve6rWjivfF7OitiqFSAIr8
	PiCrMrXZoFuSbexTou+xbH0Qrr0ogPUwyJ0xzHtsFjyM0IvI/7q3WtUl/RV0qXJCQwLh0xpZ8qLki
	0rPEOQssGm+R2vfOugOAq+/QZimCrymSmpN7EG5EtULEzpPT39LTwG9SfrFG7HUUBAY5yKH5vYKkN
	2zOgoaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2BF-00000000jM5-3ZRv;
	Fri, 28 Nov 2025 17:22:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2BD-00000000jL8-3Fvz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:22:49 +0000
Date: Fri, 28 Nov 2025 18:22:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764350564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gdQDOqyfil+DNkwzLkg7VF450RbTdgCc8NqtMW6uRW4=;
	b=exD/y7j999jCv6bS9IMXmr8sD3f5ooPKDx0FbXkjx8Zj/4jZp0LGdf83r48cRlz7csM4Ga
	774RSGWxq23m0i77jv/+q1WYKBFSNoHeK0SHXnAycfz20MDDwCsouqDKIt0UomOqQW2JEt
	Ifm/vEMXWcO7DbLtSF415CnpmUT2oDJIBZ9e17a+9JOTcn0g0uIN9m0bLfNklQ8Xln2Xu6
	LvEijg/kINBpfKtj9Zr2zSHXizNpjkYvM1MVykXCXlUGgNkpllZmDS64AXJTlju+wuK9M6
	r6QIBEfXSaR7tiPshZakf/KZ37DzfOetx999jxpGfk44srLtQmtiUsi98BQykQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764350564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gdQDOqyfil+DNkwzLkg7VF450RbTdgCc8NqtMW6uRW4=;
	b=M4CSl6gqnCuJP+oILiEsB+RMaQsPNdVWA8BsfnJdgpZXuMRB31+BAQu7VwjE/LRYhROu4e
	95a+J06qa8kBsGCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, akpm@linux-foundation.org,
	arnd@arndb.de, brauner@kernel.org, david.laight@runbox.com,
	hch@lst.de, jack@suse.com, kuninori.morimoto.gx@renesas.com,
	liaohua4@huawei.com, lilinjie8@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com, marc.zyngier@arm.com, nico@fluxnic.net,
	pangliyuan1@huawei.com, pfalcato@suse.de, punitagrawal@gmail.com,
	rjw@rjwysocki.net, rppt@kernel.org, tony@atomide.com,
	vbabka@suse.cz, viro@zeniv.linux.org.uk, wangkefeng.wang@huawei.com,
	will@kernel.org, wozizhi@huaweicloud.com
Subject: Re: [RFC PATCH v2 1/2] ARM/mm/fault: always goto bad_area when
 handling with page faults of kernel address
Message-ID: <20251128172242.cCNBVf7H@linutronix.de>
References: <20251127145127.qUXs_UAE@linutronix.de>
 <20251128022756.9973-1-xieyuanbin1@huawei.com>
 <20251128120359.Xc09qn1W@linutronix.de>
 <aSnVXrnuY9QKjTKg@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aSnVXrnuY9QKjTKg@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_092247_954445_0772CCBF 
X-CRM114-Status: GOOD (  13.47  )
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

On 2025-11-28 17:01:18 [+0000], Russell King (Oracle) wrote:
> > I hope Russell will add them once he gets to it. They got reviewed, I
> > added them to the patch system.
> 
> I'm not sure which patches you're talking about, but discussion is
> still ongoing, so it would be greatly premature to merge anything.

This thread
	https://lore.kernel.org/all/20251110145555.2555055-1-bigeasy@linutronix.de/

and the patches are 9459/1 to 9463/1 in your patch system. They address
other issues, not this one.

> https://lore.kernel.org/r/aSmUnZZATTn3JD7m@willie-the-truck
> 
> There are now many threads each with their own discussion, which
> makes it more difficult to work out which is the implementation that
> should be merged. Clearly, not everyone knows about the other
> discussion threads.

So Will suggested to let change the handler and handle this case. The
other patch is avoiding handling addr > TASK_SIZE.
Any preferences from your side?

Sebastian

