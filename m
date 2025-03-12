Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1430C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYwUjaR6v1q5/fQ/hypQGLb8gy+5OfN5YPZ0I1ZBiRY=; b=R/DkZ3aMErijsGbUHnwg4Q1Zji
	+zKLq0abgo+0ohvy4R1hxjCsSFUvtH86JRyWL/nlmRp6FuwVOiYiLWBK6kdx/xBU1nekw+Khx2KBx
	4RtCY+ipqQPeXkw1wIIuM/q52o9uAiYWSgBDe/puUCmnxI8FquSGVDT/1IIxapbLzYGfp0mLEMSmZ
	QYOTXOthM65iyNEIbK0y9DdQlF6vUOx4Lms7KESrMQVuyz9RmQkEJigHB9t2CGW4xXVtRoPNSDJ4L
	8DaJDi3lvYh5MtPoroQK0jcJg9cLeZ1JuSepzII18a1TSKHvdspseKfTe3fVPk3+cavOX7BjiQWuQ
	njN6pcpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKB4-00000008F39-28Xo;
	Wed, 12 Mar 2025 11:23:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK1n-00000008Dpo-3O0F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:13:37 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741778012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UYwUjaR6v1q5/fQ/hypQGLb8gy+5OfN5YPZ0I1ZBiRY=;
	b=gxmrM4/m2Wt5JxPlKmgnKRLZRmBCBhcnTiN1uFdwuaQH030fM0iTodcR3mwiSwUwYlbHsm
	iR9Nn7JjkUBCR0K9Hta/OkoXomkdkS36havPDroloZuuLAb7LcLcNXXUKYebOydppcz6Kp
	sDSjVJdC2kAm58jGCmk/uNNLr3+UhcOAR3SNqdi2UFFYW/YNzB8L2Tt2zlrkbXmF45fFTw
	oXrEtszEXSR91P9pwJMxTiNgtBIwHe0BYUTW/6GSkgT0jhXzeEuH1sPd0HSEKIVLyWS/Dr
	gqaO2KgnusML2AAcdrrcx3iyuAvGZo7ZHf582gSfpLBqgBpR13Yxg3iWAfGolg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741778012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UYwUjaR6v1q5/fQ/hypQGLb8gy+5OfN5YPZ0I1ZBiRY=;
	b=Qcr4dsqJiy327DE7wJ6oI0CAzPdppIEwqEJmnCx/6TzoobWgsGgXmWZgQ1h/nzjVvRdxCd
	6zE2N6gjr8DmTOCg==
To: Linus Walleij <linus.walleij@linaro.org>, Russell King
 <rmk+kernel@armlinux.org.uk>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann
 <arnd@arndb.de>, linux-kernel <linux-kernel@vger.kernel.org>, "Paul E.
 McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL] Generic entry for ARM
In-Reply-To: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
References: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
Date: Wed, 12 Mar 2025 12:13:32 +0100
Message-ID: <87ecz2zelf.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041335_992294_5B7A961B 
X-CRM114-Status: GOOD (  15.22  )
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

On Fri, Feb 28 2025 at 13:49, Linus Walleij wrote:
> please consider pulling the following git branch for generic entry,
> see below.
>
> This branch was just harvested from my own v5 patch series on
> lore with b4 am -t 20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org
> then git am on top of v6.14-rc1, so you can do the same if you
> prefer.
>
> It's possible to squash patches, even all of them into one
> big all-or-nothing patch, given the not very gradual nature generic
> entry conversion seems to have.
>
> Main upsides and downsides are in the signed tag.
>
> I don't know who the most important stakeholders are, but I guess
> the context tracker maintainer (Paul McKenney) and the people working
> on generic entry (tglx) could have a say on how important this is, or isn't.
>
> I think it's pretty neat.

It's valuable to consolidate these common functionalities across
architectures as it reduces maintainence costs.

I read through the patches and did not find anything offending there.

Thanks for doing that!

Acked-by: Thomas Gleixner <tglx@linutronix.de>

