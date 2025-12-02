Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F64ED11702
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vgz9yq/L+yG5wR+0sBWMMC8Af7WF7LKgi9Ddt3OC+Ws=; b=RjaN9MOze4t74hP3h+7J8FK1jG
	owO+Nhy2sa/0gLDItn3r+BG1SRnaJwTJEMo2ouAhz4hTATHLYu77niNprsIHgCpLfVIrCaWSSEbb/
	RKqKQEK/yDu9cMHPtu8n0QXMqhMHa7sLDLK1skF0t2UeOtGMgHuH+RqkwCcNXWvlAbvCroLQcBEDr
	+ix+2dIL4ADfhYCXYh55fGv7OQZ5UJ+Gf2wqh6C4I1hntbU83X7zyC2gml3fj5m0Zl5BopKz0Zjh6
	Evg7BCmcuR1p65NyMt6uMUQDNsmFjqbElIUfdraStJFCbZIYc3reMOfNa9krjkw/hxjBe9dDStQZ0
	QCvFjQnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQSsP-00000005bBH-2RHe;
	Tue, 02 Dec 2025 16:05:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQSsN-00000005bAH-2n7z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 16:05:16 +0000
Date: Tue, 2 Dec 2025 17:05:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764691512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vgz9yq/L+yG5wR+0sBWMMC8Af7WF7LKgi9Ddt3OC+Ws=;
	b=osUsKHItN3B+FdLAGJouZCnRBe1omUSHY5b2VU+xMMcwuK52Xk+6+Fyp1n1gwox5SmDgqF
	35HpFhzr30nY7M2RjpqCmCOLTueTTYpBhR6ieue16K168k1pu5Zb92QXL7LpBe8TUeigGc
	nPnzUWWess8YBMbOXRqQWD43vp2lQ+oZRL6aKd7L3lKQeEnVP9+YY2Gntnga0tqAR8Zj8g
	6EXrxGBL1GgDIJXCFogzGfkKlU1FHUhG2qdRDrOMzvrJT3Jt+49ibBOrPvEjiDTD+k4DF6
	NuZtnAmsXARWFBUUELICjXJ2wkNFW3XboC9m9KqM2ctyF1xAB0eHdDxxILNrNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764691512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vgz9yq/L+yG5wR+0sBWMMC8Af7WF7LKgi9Ddt3OC+Ws=;
	b=0HZTzH+1RKr9vOW7Gj0+XJWoUwekYi5hx9kHzAQPUQLwWPpZA1xBr30MUxRU0j+lGkTjXU
	8YMV6hXkln+9mQBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Xie Yuanbin <xieyuanbin1@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>
Subject: Re: [PATCH v3 2/5] ARM: mm: fault: Enable interrupts before invoking
 __do_user_fault()
Message-ID: <20251202160510.eUVnCuRx@linutronix.de>
References: <20251110145555.2555055-1-bigeasy@linutronix.de>
 <20251110145555.2555055-3-bigeasy@linutronix.de>
 <20251202141816.wfHNUMFK@linutronix.de>
 <aS8J0WrmmH01L3K1@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aS8J0WrmmH01L3K1@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_080515_844585_85BAD392 
X-CRM114-Status: GOOD (  11.82  )
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

On 2025-12-02 15:46:25 [+0000], Russell King (Oracle) wrote:
> If I apply 9460/1 without 9462/1 first, then it makes the problems
> with the branch predictor hardening worse. I'm not prepared to do that.
> 
> However, 9462/1 is tied up in the discussions that are ongoing, and I'm
> not going to short-circuit the still-ongoing discussions that touch
> this area by applying this patch - which would screw up everyone's
> proposals to fix the various many problems that are being discovered in
> the 32-bit ARM fault handling.
> 
> This means I can't apply 9462/1 nor 9460/1.
> 
> Since 9463/1 likely requires these, I can't apply that one either.
> 
> Sorry.

Understood. So you just want to get the other bug fixed first and then
we get back to this if it still remains open.
Please let me know if you need some testing or applied the fix and want
me to rebase these changes on top.

Sebastian

