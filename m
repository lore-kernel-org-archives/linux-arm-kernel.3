Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DC3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVBUvk2HeOdPMHJi8L6s75rK4fBnEyioWJyfx3jmr2c=; b=jqoRKD5K1oiMiQ1t7BYMOjV1Nv
	pfscyBMrBm4vtAmb4CJ8ltJgClPY3j/qmJ5QcTJAL6hzOkcaNh7RQ5B+oHJoWccow95qNEGi6esEY
	f7a70oj7uKoSKBxo/0Wt9cfMfCsI0OUD4/Ve9vUAweOn1uFUX2nKpbWeJN5u9hJxS2mn9UbXiUDTr
	7L5kvjIyKhugVTPPkJu/CrR7dRp4pBelVbOncELN6p+d89dO1yHqs6mP+g/3T2ygaEMPR3x4lBikE
	6y7rYmCtceiyLNjiQwjCxMmmUAc+vROz/K/eAh5uPCWrU1KARoJtT6d4HlWxD5FviAB7We4BdSHfG
	SendT2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0KS-0000000EKOp-0HjX;
	Tue, 07 Jul 2026 07:34:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0KO-0000000EKNW-32x7;
	Tue, 07 Jul 2026 07:34:50 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783409683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eVBUvk2HeOdPMHJi8L6s75rK4fBnEyioWJyfx3jmr2c=;
	b=U9cHDJFcF1QpvYrDFUD6MqCUvemr+Vje2i+DqqGv8xd1Ki00vd+KACHvdJonZln3Y49Pz3
	N7hRQaLAhFMw7x1Kn7M1bn/dtJg0ZqWS69im5CzdzGj2ZbbVul1g/nYdsHxNH37+WYYyX/
	X+XPudfWgBgb50E5wXdHcDJa4sCxj2WDUMozF95EjzdniSlxWJuELbZIKdD0lNoCNMa8hS
	I5u0jVESiyqMdSVp0f1Qi9Q3PyJ5ahWkyEWUCUCwMI4ATJXKLPXTuF+YqGGLc4AnQP0jI9
	sdRpMRRXiIYWJTAALV9I1srv6/Rof1vkytGh8cQPpcSAI07EPis7hEEEiMW5rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783409683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eVBUvk2HeOdPMHJi8L6s75rK4fBnEyioWJyfx3jmr2c=;
	b=JfyuvjvxrT3XGYd9kFjwL0uQCJrx4fD2DoLY893ymiqgCImR5kcUVOWwHct8QND/ZJ697g
	bHGL2lka2Vdmb2Dg==
To: Andrew Murray <amurray@thegoodpenguin.co.uk>, Benedikt Spranger
 <b.spranger@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
In-Reply-To: <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
Date: Tue, 07 Jul 2026 09:40:42 +0206
Message-ID: <87v7aruub1.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_003448_925067_AE3B7E4E 
X-CRM114-Status: UNSURE (   6.97  )
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

On 2026-07-06, Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
> If you want to ensure printk is synchronous, perhaps you could call
> nbcon_cpu_emergency_enter() prior to your printk, or perhaps there are
> already printk wrappers that do somthing similar whilst debugging?
> Would that provide a more reliable way to guarantee output?

Note that it is planned (at least on my TODO list) to introduce a "sync"
option for consoles for exactly this purpose. I talked about it here
[0].

John

[0] https://lore.kernel.org/lkml/87a6wez9s4.fsf@jogness.linutronix.de

