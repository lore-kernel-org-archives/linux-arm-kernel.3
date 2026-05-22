Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289D5CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 06:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYjGb1GFi1JFw4GuG/m60phb4+uBryv0UJN+GFgd2FE=; b=PlL0KPN9ROM7anvHXuEQXU/WkR
	QMtYUa3FhhbqIOgdVjpIa0o/ZadPbY5ZfYk6+ofX8TqiLanOvdHdwWxTSFpT96EjLlqJMJ6wDmNt+
	jvnI58aGfwiXUBP0+V2zrCTxeO0vDCHDb6EmbWDwgtbrCWOeOMEdKDBoy+w8jqQV8YHjItM6jMwyP
	F3zaC9tkvYDTdtYTo7plpyBt8kxBe79KWDeTp6RAdxMKrhNcmhB/LIENRr6vwFTv2O0KIG5bsKYh6
	bfpZLOHJy/tN6zRTM2q5PGMD1d1JIbQp5BsvoAT50o42IkDKjq8VVfv/Ya1KedNdboYvcbyaBeO0f
	LdqhXQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJMJ-00000009y3w-3wvG;
	Fri, 22 May 2026 06:27:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJMG-00000009y3G-3NB8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 06:27:46 +0000
Date: Fri, 22 May 2026 08:27:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779431260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qYjGb1GFi1JFw4GuG/m60phb4+uBryv0UJN+GFgd2FE=;
	b=jKoK0RYzZjyEUQj6U1jE9jhVA6FPU1ARQ5sSDuyg9lcZ+SySV/5BQ/+lmT+6GqV4c5FEHd
	BbnMPiWfytacAEoIqu9GkCfz0JolyW9Nh4f1SMjS51EZrOr5KoxAjPo9OCzThL/MTjkoQ3
	R8tnAXApd4EH5ZyHvCHR8/tT03angWS/IehQkTVrUX+8bmlqupgvUavO0qf7aRHCOWUVfq
	YgfZea9ZHQMBiLGEoU0biV2ch+Iex8e77LOn6CXcIAn8kf7zW6ngdgxfxPtDU1Fuw9IJ3P
	132joHsqf0oHvEHvcx2Jh70A5x5JiwB2M2z4xCNrIDTugRMSGu7WltwDkhKN+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779431260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qYjGb1GFi1JFw4GuG/m60phb4+uBryv0UJN+GFgd2FE=;
	b=5KRNGD8eTk/9zrBFONVNp3MRxC9xKrjsLwwgbQnzFv3ngkzD+L3lu1Yic95qvelzHmtYES
	bixGFkKnprZxN/CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] irqchip/exynos-combiner: remove useless spinlock
Message-ID: <20260522062739.5-YngA7K@linutronix.de>
References: <CGME20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662@eucas1p1.samsung.com>
 <20260522061012.2687122-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522061012.2687122-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_232744_985818_92E0272A 
X-CRM114-Status: UNSURE (   5.95  )
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

On 2026-05-22 08:10:12 [+0200], Marek Szyprowski wrote:
> irq_controller_lock doesn't protect anything, it must be some leftover
> from early development or copy/paste. Remove it completely.
> 
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Link: https://lore.kernel.org/all/20260520220422.3522908-1-m.szyprowski@samsung.com/
> Fixes: 96031b31a4b3 ("irqchip/exynos-combiner: Switch to raw_spinlock")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

There is a bit of reserch in 20260521090453.bbUZ00tS@linutronix.de why
it is a leftover.

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

