Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29226E68973
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQ2852SIBLZ55jYpM8pe/ulD60t0c9GE/dvFw1Spiq0=; b=4lBwvSYuagPcRpLlu3lzKqrsjd
	hUtFT3PhXjKSbPBMU4uwDJ5r35Uyw2iptBrLegCCwb+w8eY7kgvTodO371BaHb7QDcfRC71prqPGM
	12HHXfhY7YTq7hhOnYhuHiZZ+hrSvX40swOJG8VZpPPgYkmNh8U7CYgyqCkOVcSsTpZmnO6dEwKOD
	aXKCmHLD2ISNMUDjMD/aLQhQO+d06NF9A7zfpTEOryTVlv7pOBd1lI+2Hzr0bSbWZiXHi74Vf4Vf2
	V2NEMvbPbM48rbZf0Er/cnrkFd5n4R08slO/bi1I35yxsUtfR1M03y+CalnAUH6nzqDrS264mcG0O
	phVd5Dpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Sf6-00000003I8I-2PZU;
	Thu, 31 Oct 2024 10:44:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SdM-00000003HbM-1OAm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 10:42:36 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730371350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uQ2852SIBLZ55jYpM8pe/ulD60t0c9GE/dvFw1Spiq0=;
	b=cFRIpANtDdtqy4wVeyUftYfX+3K6iAeHLYHbrhbjQDewDLfFxiTRAWBpLABLpSV/D1nKoX
	Wk+NfWIT0Th1PtumMMsKOGceAYI86AU0/eVQLUo/JdueUDK6mTO8gndDcQDwWpAlcdvlKx
	3zlURNVKNzYwkTYSrZRVKvVgFFut9pePG7Yi5sFUHmPtz3zgeow/cfVwkC8cRC0tvK2N9z
	ZsOM8KSjcuq8lrbqaUoAOLSAuiq9ZYBNBlgIDzTTV0RHjTq4n0OgJF3AWotNwFtUwQt0x/
	TtHrpm1PFM2JE0s/CeuRo8/9ib3uTQh9uz5XOUAcz8j8fO7LVAj3x7+k91hMLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730371350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uQ2852SIBLZ55jYpM8pe/ulD60t0c9GE/dvFw1Spiq0=;
	b=PrbjYQaHayM1BR2KDeqfwmwwH+YaLRQVslv5TNNxy548ptz/ne1W/M0I8ZbloOONg2kQs5
	KJsCwHYidFFwoQCw==
To: Frederic Weisbecker <frederic@kernel.org>, Naresh Kamboju
 <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, Linux
 Regressions <regressions@lists.linux.dev>, rcu <rcu@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Dan
 Carpenter <dan.carpenter@linaro.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Mark Brown <broonie@kernel.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Anders Roxell <anders.roxell@linaro.org>,
 Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: Re: next-20241031: kernel/time/clockevents.c:455
 clockevents_register_device
In-Reply-To: <ZyNUR4oi8TXeEpYi@lothringen>
References: <CA+G9fYtb5vAnEiHupwsnaeZ7uzdko_WAcjw9ZAFkHNXBVhi1EA@mail.gmail.com>
 <ZyNUR4oi8TXeEpYi@lothringen>
Date: Thu, 31 Oct 2024 11:42:30 +0100
Message-ID: <87r07wwo2x.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_034232_534772_4FD1F39B 
X-CRM114-Status: GOOD (  10.63  )
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

On Thu, Oct 31 2024 at 10:56, Frederic Weisbecker wrote:
> On Thu, Oct 31, 2024 at 02:10:14PM +0530, Naresh Kamboju wrote:
>> <4>[ 0.220657] WARNING: CPU: 1 PID: 0 at kernel/time/clockevents.c:455
>> clockevents_register_device (kernel/time/clockevents.c:455
>
> It's possible that I messed up something with clockevents.

Yes. You added the warning :)

> Can you try to reproduce with:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
> 	timers/core

I force pushed the branch with the warning removed.

> I wish I could reproduce on my own but I don't have easy
> access to such hardware.

apt-get install qemu-system

gives you access to all supported architectures :)




