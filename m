Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8308CC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0GaSqrZjtJqni0HehADXGcZDJyuXMD/e6cLg2mh/9A=; b=Vo7T0mwK1jrQ7VGK3+GxrtsaXM
	82/5mbLSDhpITkpBoBuxw2UW8ZhsTzyi8m/3G75bBcuPiaD1tenz/l68jZE1ZoUFDb2FIM5CQ9O//
	AgYMgp5K7MfFCx5Y+LNuC5bDSJDy+azOwrvcXKqX15hlvyuLAsnJPwd/zOUOgZcx16sYp0Bg3fqTA
	mx05p0bt3JcUKvh+iv5r80r4fDx252zkpALZ4I5YKFZcW5BsoCG1uSfyrx2RxcX2IwWe6WR4HvBi6
	kZuyB7aV3930RGS2plUIdVBWDhoOJhpE/jNc/LZaAw2/0Jtil6pK1HBY71gu+Xc7nnSaKwcboR+In
	To/kMpbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkil-0000000Dw8z-26Xd;
	Tue, 11 Aug 2026 11:32:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkik-0000000Dw8p-1VWR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 11:32:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76A63600AE;
	Tue, 11 Aug 2026 11:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C891B1F000E9;
	Tue, 11 Aug 2026 11:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786447957;
	bh=X0GaSqrZjtJqni0HehADXGcZDJyuXMD/e6cLg2mh/9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FtZ0oRpTL48XZfZhHGIv1UGjYWqM7t8ZFXbwi+t04l/Ngs9bTm4Sce5R5RXkFBzxf
	 NGjiSH1xC3S+505KU0Rj/TaF3P/YYKWJL+kr4PEYTcCiy3XujX8IzNEC7I5oXMad1r
	 Dzemzunpf9jz4kg4Ju5iNHtrEYQpxZvWlL8e3LBzPvS2xyWIIR3c2msUbt3lhQgM7n
	 YslsI0550zUp9fsfdb5NU5WVuPP0Ce+3e9u3QjgkMnoHPuQ13s9Tl1AI5UN+Gvescz
	 GY2r8XSrgQNyegodcJ4PH7oV53TUBp8xPvuLWY0hv9Y6zMc0TabXOrzPh20scRZvBD
	 sYdV8sWKbX2zA==
Date: Tue, 11 Aug 2026 12:32:31 +0100
From: Will Deacon <will@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH RFC] arm64: entry: PSTATE_I_SET is leaking on pseudo NMI
 mode
Message-ID: <ansIT2PCHq_EKuTE@willie-the-truck>
References: <20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org>
 <anXkO8YpoadRzm07@J2N7QTR9R3>
 <anXqMsJ14r3BAbMG@gmail.com>
 <anYHjvJ1_4dDjuzw@gmail.com>
 <anm5T9FazACqOWXF@willie-the-truck>
 <2a97f777-d33a-4b3d-8c8c-6f6894f04c29@arm.com>
 <annoxlkkq1NpujsP@willie-the-truck>
 <9b06f274-8db1-48e4-839e-e387c050d328@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b06f274-8db1-48e4-839e-e387c050d328@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, rmikey@meta.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, Breno Leitao <leitao@debian.org>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Aug 10, 2026 at 05:39:52PM +0100, Vladimir Murzin wrote:
> On 8/10/26 16:05, Will Deacon wrote:
>  > So we could probably hack something as you suggest, but maybe the best
> > option is to take patches 8 and 9 from your FEAT_NMI series? WDYT?
> > 
> 
> Whatever you prefer, tbh :)
> 
> Patch 9 codifies my understanding of how things are expected to
> work. That said, I accept that I could be missing something, hence the
> RFC tag.

Those two look fine to me and I already took the preceding changes.

> In case you decide to take it, we probably need to:
> 
> - extend the commit message to cover Breno's report (right now, the
>   commit message makes it look like a refactoring)
> 
> - add Fixes tags if we want it to be backported
> 
> Alternatively, I can respin the patch separately with the suggestions
> above applied - just let me know ;)

Lemme have a go at picking them up... I'll yell if it all goes horribly
wrong!

Will

