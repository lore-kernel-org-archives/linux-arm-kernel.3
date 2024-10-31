Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99B4E68969
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnGraNEP/rz5O8q33kitqbhHCgnpJ/YmvKLNCF0vYpQ=; b=H19jNGMHmUbz7l3BO4jutWV4GB
	QU0I19rn3DgTTCAeyiAjqQcp1IFWXrYwfMdgyvmDWMCr7KdnGqyfJChULJQdxIAEME1YfHRbOcy79
	foCLPs/L+fTFnGbRzSGSmyR9NUNqgK0x3zxquAA5kwmnEcwzCpmAwEeCeUXBSLGT1Trvoiy6fwgAh
	GrIbDJ6Mnng/hWknJNa2+L/Gp7ftfzsvQZ/e8aapHaL5cVmKtW0NI1etfkEHHaRsF7p/N7HqbxTBb
	jBD7RoAh/y/RudwTa10AQxRkwR79GcfJuhi0qSH5YqwP9zIBqL8QXFr9MpGAVqA/kGd0ZwZ9dNkpe
	PyEEDQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RjG-000000037lF-2fkR;
	Thu, 31 Oct 2024 09:44:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RhZ-000000037Qz-438t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 09:42:53 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730367766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hnGraNEP/rz5O8q33kitqbhHCgnpJ/YmvKLNCF0vYpQ=;
	b=s83G6styN8bgmTOKXbhnhzTwe1neMnP/IpGepXQT7lX+qFFWLfa1JAALy/5s/UDFw+e9Is
	bWN4An2XBNJf//s8S3rU7M4QZ9tW/s8n+d7qe0IPa0PFV8uXRDQ8jpz4smkRquwI9563H0
	BWZUZC50qQ/7deg/5m9O7B7x+bsRXd2dJT6dhYvot1HbXtcdOglrUjODmchKNiWY88aERW
	B7S8QXHIXqKfzHg5PRrTnoSWpxONFzCX2ZxU7STM06NHPwu2lFHbE1Rp031323f8dF81Dz
	n3nE+LRcrLXQI8Yx/DHg0s/otWtPbd4IJbK4+YnBKMtk4IFTCSpO3tFOm+TjeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730367766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hnGraNEP/rz5O8q33kitqbhHCgnpJ/YmvKLNCF0vYpQ=;
	b=oyyTImzdRYppbqXbvspmSJ48xaqRz2JgQX5pq2j23MXY1W3SVMnYhCx5MHCGxCTDOE6EGH
	cn8sejRYV+V+e6CA==
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, Linux
 Regressions <regressions@lists.linux.dev>, rcu <rcu@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Mark Brown <broonie@kernel.org>, Alex =?utf-8?Q?Be?=
 =?utf-8?Q?nn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Anders Roxell <anders.roxell@linaro.org>,
 Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: Re: next-20241031: kernel/time/clockevents.c:455
 clockevents_register_device
In-Reply-To: <CA+G9fYtb5vAnEiHupwsnaeZ7uzdko_WAcjw9ZAFkHNXBVhi1EA@mail.gmail.com>
References: <CA+G9fYtb5vAnEiHupwsnaeZ7uzdko_WAcjw9ZAFkHNXBVhi1EA@mail.gmail.com>
Date: Thu, 31 Oct 2024 10:42:45 +0100
Message-ID: <87zfmkwqui.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_024250_168181_8D65B3C9 
X-CRM114-Status: GOOD (  11.61  )
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

On Thu, Oct 31 2024 at 14:10, Naresh Kamboju wrote:
> The QEMU-ARM64 boot has failed with the Linux next-20241031 tag.
> The boot log shows warnings at clockevents_register_device and followed
> by rcu_preempt detected stalls.
>
> However, the system did not proceed far enough to reach the login prompt.
> The fvp-aemva, Qemu-arm64, Qemu-armv7 and Qemu-riscv64 boot failed.
>
> Please find the incomplete boot log links below for your reference.
> The Qemu version is 9.0.2.
> <4>[ 0.220657] WARNING: CPU: 1 PID: 0 at kernel/time/clockevents.c:455
> clockevents_register_device (kernel/time/clockevents.c:455
> <4>[ 0.225218] clockevents_register_device+0x170/0x188 P
> <4>[ 0.225367] clockevents_config_and_register+0x34/0x50 L
> <4>[ 0.225487] clockevents_config_and_register (kernel/time/clockevents.c:523)
> <4>[ 0.225553] arch_timer_starting_cpu
> (drivers/clocksource/arm_arch_timer.c:1034)
> <4>[ 0.225602] cpuhp_invoke_callback (kernel/cpu.c:194)
> <4>[ 0.225649] __cpuhp_invoke_callback_range (kernel/cpu.c:965)
> <4>[ 0.225691] notify_cpu_starting (kernel/cpu.c:1604)

That's obvious what happens here. notify_cpu_starting() is invoked
before the CPU is marked online, which triggers the new check in
clockevents_register_device().

I removed the warning and force pushed the fixed up branch, so that
should be gone by tomorrow.

Thanks,

        tglx

