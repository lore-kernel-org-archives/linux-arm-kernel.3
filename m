Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D534E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jyxZIT7hjcGmYBbGvCunP4BvQnpd8I0TAlvuGu43Q8=; b=Afv7+qwGhWbuWJUfqQ2puE7O2K
	rb3mBbegFPf1f8jtCKfY0ihx4iClFCTMxr/8RHKeZb0jJm0YXXQezyKpyvQ8CsFc9tiuzsaEY25KY
	UjhjGLB1EiYqk1U7QdgF6IaVgM1QOv6ZMds9sqa93Mt+zNnsiyQ9dM4QT+feR1oOCm90hOVouKlfG
	IqPHCetwGQEu1WyLHVWIrLX10ljH/tXG4Ntkis78hAbtvyekt1tzAHubFFAJShR3csXOHzW0VaFjg
	B8vCg2dNR/rT8dWBnlwc/6QelAUyJiXO17VhlurOXIFVLjsotw3kr1/pvBzpSs+dorgIWlKfa8jDA
	U+NpxKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tND3S-0000000APiJ-44av;
	Mon, 16 Dec 2024 15:30:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tND2K-0000000APWu-1ZEr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:29:33 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734362967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jyxZIT7hjcGmYBbGvCunP4BvQnpd8I0TAlvuGu43Q8=;
	b=to0flyVGfWlzOZWr3Z6Tb8o0KM9VZYaYTMoWk1PyFqyVqeIDLY8fObSndBOcgUfBXaKNeb
	vP2Vyq/J8Wj9JHL6+t0NUjA5f1fxGik9NFWG/kamlnAduJ9JV8pZoBNYwzexQzLNzsnieM
	TH3VEl9Pv4cqaNuW+V68OpMdrYo/gqY+CoYmVqO1n83UujpkpdXQBNC5ObnaQGJNilgXj5
	TQP7zRs3oW9N7zzjcQ3Nbj9dEJNNvdeXBlg5Iu6QiM5M00c9igDkpLJtsjciwmaz6WCVL1
	kkIKgRczHsF7Uuj3qYBNrXy24Gg1SvHB/HWWSLgj8XmIJsRiGG1tiLqm8xCflw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734362967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jyxZIT7hjcGmYBbGvCunP4BvQnpd8I0TAlvuGu43Q8=;
	b=+e/NOM79ib7YYesHijkeiPijn+iT/nNF9l4lyNo83zLlfRsY57oIayxU55KSgHDNsmPEgr
	zFhHEOzAUjAx/mDA==
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: Re: [PATCH] serial: stm32: use port lock wrappers for break control
In-Reply-To: <20241216145323.111612-1-ben.wolsieffer@hefring.com>
References: <20241216145323.111612-1-ben.wolsieffer@hefring.com>
Date: Mon, 16 Dec 2024 16:35:26 +0106
Message-ID: <84cyhrk5nt.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_072932_572750_1C63D54B 
X-CRM114-Status: UNSURE (   6.63  )
X-CRM114-Notice: Please train this message.
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

On 2024-12-16, Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:
> Commit 30e945861f3b ("serial: stm32: add support for break control")
> added another usage of the port lock, but was merged on the same day as
> c5d06662551c ("serial: stm32: Use port lock wrappers"), therefore the
> latter did not update this usage to use the port lock wrappers.
>
> Fixes: c5d06662551c ("serial: stm32: Use port lock wrappers")
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>

Thanks for catching this!

Reviewed-by: John Ogness <john.ogness@linutronix.de>

