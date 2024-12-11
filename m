Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB335E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOYpxZqhqq/1CTP1KVnyG6EjZzQVJC8nCc0zAYnT2Ps=; b=22dW/TbD+Hp8BR4Fm5+x8s9f4b
	xd39lAF6jQNHeI+/a8YzTGHTiqXwTL/DTfCGYVhYJA+Tdj+Tqg/LwWJFutTNLjaxwKH5VU68AKeqy
	G1XkLK38seeRG+rsbIun5vi+R5CAwSJ3XkkIHREX/+QzJmYrUzyyJPOgoTWgBgFfzghpHHPazxuMN
	OifyV5v7NrOy+qW3X5AaconUsVw1IF0ur9TQOpUa4dj077gEgqjDRzk2h3EzXZWpPZLaUhKBnKZGC
	0q3+QFtTqgSc5RGq19+YCHD8Hn1TDbCRCn9Ckob21ig/+JQW7en7nTgXj9QBPKAb49jYgRErRs3Ti
	8866R4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNjo-0000000F8yy-1eFt;
	Wed, 11 Dec 2024 14:30:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNik-0000000F8mk-0p8c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 14:29:47 +0000
Date: Wed, 11 Dec 2024 15:29:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733927384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VOYpxZqhqq/1CTP1KVnyG6EjZzQVJC8nCc0zAYnT2Ps=;
	b=oaorEDpZ5pd/zIm5/szMN1cUc953JQSng7kwU3JeVF8zP9wfx/dfGjVKrqAYgCpYOA3LYv
	+VmluxpmYYG2DYuK44a13pjzQ0w4wH68F4v1juE/Vy0sb4S5U0MkSRimdlecca2Afh31Zf
	wzRGzagYDThICL3GF6836nP0YQbKMyq94EeEfmKSMvZ8/0gIJYIkL9jIM01t6nAh5Z5YRG
	uu/9J+/R663w+MBQqVVTLbCpYETvho0i91WGOCEKnt/xaKMjVLyqutG8W0oBZXUuoolEr7
	Aj7igL5KExaO10gulUVR7UxAvoez8118eazQwB5vdSus5OAYy/ytygrgjMllsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733927384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VOYpxZqhqq/1CTP1KVnyG6EjZzQVJC8nCc0zAYnT2Ps=;
	b=BFwD8ZtmoJb0Q7PAOBgonmnOLnsQK4bfFGatcd76wYSBrZPXGpwZB45nz6+f+aH2Bxs4lD
	HibuAKfKRRMPIrDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 4/4] mm: drop HIGHPTE support altogether
Message-ID: <20241211142943.cp0Wcuxk@linutronix.de>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210160556.2341497-5-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_062946_376233_1D916538 
X-CRM114-Status: UNSURE (   9.09  )
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

On 2024-12-10 17:05:56 [+0100], Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With both x86 and arm having dropped CONFIG_HIGHPTE support, no
> architecture is left using it, so remove the remnants in common code.
> 
> It is likely that further cleanups are possible in the page table
> code but those are not obvious from the config options.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

