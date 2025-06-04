Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61262C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 12:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuJsBEQO3vOHs70HHUYSLQfGS4A7b1VGRI3y13ObEFA=; b=pk7o45NwYiYkE7L3NWdNWCCKMq
	QG3FSzA1oYHi9x1YiMu4l8wJm9GoV8U14KyUMlPlugFfxhar30Xvf79ES/hpz/2cx0Jni8HWmuX/I
	z4jgU8+pb8JRZvvUJXyz93cVN/srTbeSi8/YSSUKEsW5kaLc/pZTudEr2lpzznAt1CT3IoA8Pngqq
	8i1AvgCI7CLrmW1/s6lqRJD7HuiHirmC0xU3s5+8NTuqheFLemsc9d9nM12DrTbuAXH16WMWR7es4
	MY5IZS1Mjy5byqI5e4cYYAYaWWgtAOe6R43E4TDnb0KflrJ/63fIP7YV+e8221Yd8R9y7ooXScFnD
	JOqDVOlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmtJ-0000000DHOV-2DKu;
	Wed, 04 Jun 2025 12:06:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmdj-0000000DFM5-1cOS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 11:50:40 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749037835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WuJsBEQO3vOHs70HHUYSLQfGS4A7b1VGRI3y13ObEFA=;
	b=oLegIJNmlkhOaetnuHLnch2mHHI+88mIOb3Y0cYl7lskKBYEEzGVCM1wsH1KXlak8ffUBR
	nZUMyHq+WVjSRiI+J5d+zSeEV6tTJpcCuHO6QGXQvXnS7EHGCqDLEy3X8CWDi4ijbAKM2F
	Px3eU6Ao/vZiGBWf6Ty5mCa1tRsEJ+KjayDZD6WJmYQVW52RS4Jbi+JJi3em83Lj9LfVQC
	p969a8IZOgd9cM9f5pzgSRNX6OLiL9uc5gVFSdgA4gntA1s/mCv+UU/ctr6r/wI0WzBmj6
	r8nyemYWNPFPNtWON1uz44w64Ej3ZByT/sIkP1z23H2cRcIHzjIA+LfcceOBvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749037835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WuJsBEQO3vOHs70HHUYSLQfGS4A7b1VGRI3y13ObEFA=;
	b=SmWCssRSGTRTgB2qp0+RPYebju8bTkPSVINOn6Di4Y+SjIWdqd2It7SNMy+NVWjVCDXVWa
	TpYNl84Bb9OtHzCw==
To: Petr Mladek <pmladek@suse.com>, "Toshiyuki Sato (Fujitsu)"
 <fj6611ie@fujitsu.com>
Cc: 'Michael Kelley' <mhklinux@outlook.com>, 'Ryo Takakura'
 <ryotkkr98@gmail.com>, Russell King <linux@armlinux.org.uk>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: Problem with nbcon console and amba-pl011 serial port
In-Reply-To: <aEApOPTqbVOR35F_@pathway.suse.cz>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84plfl5bf1.fsf@jogness.linutronix.de>
 <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <aEApOPTqbVOR35F_@pathway.suse.cz>
Date: Wed, 04 Jun 2025 13:56:34 +0206
Message-ID: <84o6v3ohdh.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_045039_560996_95BA7C63 
X-CRM114-Status: GOOD (  12.56  )
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

On 2025-06-04, Petr Mladek <pmladek@suse.com> wrote:
> On Wed 2025-06-04 04:11:10, Toshiyuki Sato (Fujitsu) wrote:
>> > On 2025-06-03, John Ogness <john.ogness@linutronix.de> wrote:
>> > > On 2025-06-03, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
>> > >>> 4. pr_emerg() has a high logging level, and it effectively steals the console
>> > >>> from the "pr/ttyAMA0" task, which I believe is intentional in the nbcon
>> > design.
>> > >>> Down in pl011_console_write_thread(), the "pr/ttyAMA0" task is doing
>> > >>> nbcon_enter_unsafe() and nbcon_exit_unsafe() around each character
>> > >>> that it outputs.  When pr_emerg() steals the console, nbcon_exit_unsafe()
>> > >>> returns 0, so the "for" loop exits. pl011_console_write_thread() then
>> > >>> enters a busy "while" loop waiting to reclaim the console. It's doing this
>> > >>> busy "while" loop with interrupts disabled, and because of the panic,
>> > >>> it never succeeds.
>
> I am a bit surprised that it never succeeds. The panic CPU takes over
> the ownership but it releases it when the messages are flushed. And
> the original owner should be able to reacquire it in this case.

The problem is that other_cpu_in_panic() will return true forever, which
will cause _all_ acquires to fail forever. Originally we did allow
non-panic to take over again after panic releases ownership. But IIRC we
removed that capability because it allowed us to reduce a lot of
complexity. And now nbcon_waiter_matches() relies on "Lower priorities
are ignored during panic() until reboot."

John Ogness

