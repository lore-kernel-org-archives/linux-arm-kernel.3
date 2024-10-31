Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A69CE6F062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5Cd/TflRpujDL3PlrygXnsmVQV3fCzWhX2KR6nbj3s=; b=4ia5XxM7EdB7QjVDdY6ojGPm8z
	hW91SfF8KQ3P/za6zqGLDL+SXZgZgQIk7ecQpjI5z4SKJZpN7MXUJAZ4/4AVtRt/XZQLjdtTfY3Ti
	dSupaxf3UYK8H+f7f++/+22nMqeyHQVjJwv8/9XhXmR8W1b5ZJRu3K0pb1aW7mRRSxkUcbeQMIgee
	4zAIXwqSqabGMA97B7hLSo+JuPxmeaW6W+v/1pK8GAajF7vOzjrfQOBrN0ktjBbUYU5L9tUMF1B7w
	3a4+Nsc8WkMG+LFZ3mlnObHYnk9U/wk+AEUGQRv7FSi5JyUu4H+d2DRp/RSjH0m7/obO9lWzMPxiS
	oQUlO/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sbj-00000007Kiz-2FZh;
	Fri, 01 Nov 2024 14:26:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s9j-00000007Frz-2TmA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB7005C9798;
	Thu, 31 Oct 2024 09:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00914C4CEC3;
	Thu, 31 Oct 2024 09:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730368586;
	bh=zKzNSTsm9kZsx8FTdXvTTYjRggtiZqQ7IKKtRbWzyUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iXu3YziHhfNpjfKIXLX3ZQ/RQ0/85sbUzIQGjhnmYqKZ9gh6SMD2lY9MOawxNRCgB
	 hihTd5j5rGilUCeiWtV5s5cLiYSFCUY34CBxpaurAvy/dF0KFH5NLUVK7N+lRwh7a8
	 UlUXUYECecWkVhC8X732LX0p6Yar5JiEoUYcSQwCyIXMBd6j3qnNkz2QTfc3D2UdZN
	 l7JRGd/sUYg32GMlp9gqA2hyqHklc/xeF2Vi7ttGq4G6hQtotOcX0+gNQzTS1l60RQ
	 /abRnv4fkheiH9lgCWEYmBIz9f3QufRVrom5PfavZfwmiprXtsv8SB64wFx+hRnBWW
	 aZs/c3AFLJc2g==
Date: Thu, 31 Oct 2024 10:56:23 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	rcu <rcu@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Brown <broonie@kernel.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: Re: next-20241031: kernel/time/clockevents.c:455
 clockevents_register_device
Message-ID: <ZyNUR4oi8TXeEpYi@lothringen>
References: <CA+G9fYtb5vAnEiHupwsnaeZ7uzdko_WAcjw9ZAFkHNXBVhi1EA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtb5vAnEiHupwsnaeZ7uzdko_WAcjw9ZAFkHNXBVhi1EA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_065739_819630_4C2A99D4 
X-CRM114-Status: GOOD (  16.09  )
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

Hi,

On Thu, Oct 31, 2024 at 02:10:14PM +0530, Naresh Kamboju wrote:
> The QEMU-ARM64 boot has failed with the Linux next-20241031 tag.
> The boot log shows warnings at clockevents_register_device and followed
> by rcu_preempt detected stalls.
> 
> However, the system did not proceed far enough to reach the login prompt.
> The fvp-aemva, Qemu-arm64, Qemu-armv7 and Qemu-riscv64 boot failed.
> 
> Please find the incomplete boot log links below for your reference.
> The Qemu version is 9.0.2.
> 
> This is always reproducible.
> First seen on Linux next-20241031 tag.
>   Good: next-20241030
>   Good: next-20241031
> 
> qemu-arm64:
>   boot:
>     * clang-19-lkftconfig
>     * gcc-13-lkftconfig
>     * clang-nightly-lkftconfig
> 
> qemu-armv7:
>   boot:
>     * clang-19-lkftconfig
>     * gcc-13-lkftconfig
>     * clang-nightly-lkftconfig
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Boot log:
> -------
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
>     0.000000] Linux version 6.12.0-rc5-next-20241031 (tuxmake@tuxmake)
> (aarch64-linux-gnu-gcc (Debian 13.3.0-5) 13.3.0, GNU ld (GNU Binutils
> for Debian) 2.43.1) #1 SMP PREEMPT @1730356841
> [    0.000000] KASLR enabled
> [    0.000000] random: crng init done
> [    0.000000] Machine model: linux,dummy-virt
> <trim>
> <6>[    0.216503] GICv3: CPU1: found redistributor 1 region 0:0x00000000080c0000
> <6>[    0.218511] GICv3: CPU1: using allocated LPI pending table
> @0x0000000100250000
> <4>[    0.220528] ------------[ cut here ]------------
> <4>[ 0.220657] WARNING: CPU: 1 PID: 0 at kernel/time/clockevents.c:455
> clockevents_register_device (kernel/time/clockevents.c:455

It's possible that I messed up something with clockevents.

Can you try to reproduce with:

git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
	timers/core

And if so it's possible that the bad commit is somewhere between:

    17a8945f369c (clockevents: Improve clockevents_notify_released() comment)

and

    bf9a001fb8e4 (clocksource/drivers/timer-tegra: Remove clockevents shutdown call on offlining)

I wish I could reproduce on my own but I don't have easy
access to such hardware.

Thanks.

