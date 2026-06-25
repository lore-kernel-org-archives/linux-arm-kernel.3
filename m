Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2559CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 15:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhk31X59jGlwpV3n9u1wFAXzkVVHxC5YGpn2MFlFHLY=; b=UdyllH6c9frQZgKnX6U3FpmaY6
	z0iSseqeIr3ggRSUrYr/tBZg1MMH8EoG3/MGmCp2cOGbGVgQhr1IxXWmuIT8pKCppzqscs4cyRAWS
	ouCXq9PgzVoB1TZLkBCVP8HOAl9N71QR4QvxXu3h2WTtQl9S4jTsIOTzkzPUdgAO95WFGnMJ88ek/
	oTssOD9kbrUirqEddRnjj6arjDaPLsQE0g5Alc6VZrPpx/Y5u/raRgWLFH1j0rKudVfDxqSd1unoG
	GqacWReTDWn6eD7ti5vHWNDJ+K50ewWaO48zf4hEipKv57pHVvMXpLg6Zg5u8XqYQ2dxkGN84FXFn
	BK7hFOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wclu2-00000009OME-10Sg;
	Thu, 25 Jun 2026 15:22:06 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wclu0-00000009OLn-02qX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 15:22:05 +0000
Date: Thu, 25 Jun 2026 17:21:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782400921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hhk31X59jGlwpV3n9u1wFAXzkVVHxC5YGpn2MFlFHLY=;
	b=wdr6LBaSrc6/cZA6cLZtB5pVzF1GA/PqBASb6CDpNB/Nu/LzwciFL2xWrAnK7pP7CawBbj
	ciEWOWtovG41x9TEPSbUOzfqzt5Sd3FLnt9Sx4GPZ3qJFsQl0sNXXuFm8bTe05LeUhlpz2
	AQpr/fyHDqSTlkYRogJ7KdEyWDvndk3BIEapgxy9jKLI9mvZ3KXtepsSkwQtFBIF16l/6Q
	BT9jDY40MBvg6aXEntL1cCv3thzdCi5tWTscMnsyDqRheghh8AGTdPsuLzVLQs2BJaxHA9
	KgxuHJ+8ibiAjv+kId7vTiEGvplM3hnqQ6Vw+58JhKF4ZI00zjo1XYZlekejJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782400921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hhk31X59jGlwpV3n9u1wFAXzkVVHxC5YGpn2MFlFHLY=;
	b=7K3nlttqc5EEzWofyJOS/pgw2pz+WrZmUjAQRP6zMP7rPQMCTibC2HivO17r9kapZDs+If
	PsZQPM5tnQR+HPCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk, clrkwllms@kernel.org,
	rostedt@goodmis.org, linusw@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, liaohua4@huawei.com,
	lilinjie8@huawei.com
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling
 user mode errors
Message-ID: <20260625152159.WtO_S3i7@linutronix.de>
References: <aj0BpqlaCh3cVw8Q@shell.armlinux.org.uk>
 <20260625122612.43501-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625122612.43501-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_082204_568410_B79397AB 
X-CRM114-Status: GOOD (  10.34  )
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

On 2026-06-25 20:26:12 [+0800], Xie Yuanbin wrote:
> ```c
> 	if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
> 		return;
> 
> 	if (likely(user_mode(regs)))
> 		local_irq_enable();
> 
> 	pr_alert("8<--- cut here ---\n");
> ```
> or
> ```c
> 	if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
> 		return;
> 
> 	if (likely(interrupts_enabled(regs)))
> 		local_irq_enable();
> 
> 	pr_alert("8<--- cut here ---\n");
> ```
> 
> Which one do you prefer? I prefer the first one, because for kernel
> fault, kernel may have encountered a serious issue,
> and enabling interrupts may be not appropriate.

Why would the latter be not appropriate?. 
Anyway, in the kernel case you do die() which disables interrupts as of
oops_begin(). It does later restore the state in oops_end() and invokes
make_task_dead(). This one will complain if either preemption or
interrupts are disabled and reset both.

Should you get that far and not panic() earlier (due to in_interrupt()
for instance) then interrupts will be later enabled before that kernel
thread is killed. So it could be done earlier or not, at this point the
system is pretty much done.

Sebastian

