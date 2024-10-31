Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A98AE68974
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6RrESpk4DuiFuA8FQu7bFWYRqaOtox3Ncu15dz32HM=; b=S9Da3D/Dp9HraZO3LfzpwFxg6S
	UuXByEVaiwqcs8YwefdgqEBRJuTlyUtGCC7w/2ko24UqRH4Hzyg4RGTdLwYgFXy3QYUWL4h84XLOQ
	AVjUyDCHXIOIRFn/YNQw47PNdwQBqt4ZXHUoNjOKE7RXa7+H4WdJTxPO+nxkWkL6KgOpi0Yq+5Ok8
	sz7mzAVewqMJNQ7Bz9IwBcz7tERuxI70M09uWkyZ3tFmEZVUBrM/rkdq5T+yfoBkrDqK3dGvq99Gl
	zQSJ+TlooHap2pn/GxZyrZAn0L+y6WVeNxdYqj2dXn0sbBkKOVRmMbdX7UF5Qynsp3mpW3fhcrtds
	OteEylPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SvE-00000003Kim-0MZp;
	Thu, 31 Oct 2024 11:01:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Rvu-00000003A52-0cPR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 31 Oct 2024 09:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l6RrESpk4DuiFuA8FQu7bFWYRqaOtox3Ncu15dz32HM=; b=pdejbnPNd+ry1fv2Q+mbQJyLa/
	Ajj7nYjSdxivFn7ecgv6ZUWhGFUwZuLXz+90cv3EXki8VF2livu6KZeJKOS9F9sgiaIwtBrphhHa9
	kS8AZfzz5zwLtCOgdGgF0OzdaC6Cocya8B8np46GgM8IcmwnjLebabpP6cQC9OAwqacfTujd+LYtQ
	H9PVYUdlctreW3xaz5kuP5nwWShecK7rzImGPDzo1KMpivr2MsDgqhA/LdCIH61f1QbXkK3PSl5qu
	5Ja25sX4o9OR1AHo4hIsPeB77RNxuJ9VsLJlKzvTJHGXdnbhbVbhF79sQp+gfYVcb7v/FLThX7FOE
	DC3O+KvA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Rvr-0000000AQoy-1GEk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 09:57:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6A248A43E7B;
	Thu, 31 Oct 2024 09:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983B5C4CED5;
	Thu, 31 Oct 2024 09:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730368653;
	bh=Y/ZKdGs9HB+eMN46LQEMN2crILjud+xOTPZjCMfvnbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G58e/nrB469sgVmF0ZG3dxQLcv+W1uDFu/FILhXfCLoJCoj/5k4VoyFTbNpZaA6uf
	 i+B4YT0rcIjWmzT/+f1HVjm+iwSZNelh/bgrflRm4IBECGl9hN2odDSmu792hsR7Z8
	 bY7jzfHc3H6ZhAlNdXLEimDrPw86vil0VEndvwRCPVvnygr7DN6Mq9+9KD8rSk+Zir
	 0c7TnXcYAX3tKBKOqlJJGuoAYYu9GC075Ki4VpLu4BRSGf4Ua0VjatKXc8ldILkPF1
	 5OSIdvCI9y6kbLKpZE6XIMron+uMCYRUWz0GkX5st4dnKSgs3SOWVeTndhpslO+/de
	 3Z8LVQ3W2uU1w==
Date: Thu, 31 Oct 2024 10:57:31 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	rcu <rcu@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Mark Brown <broonie@kernel.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: Re: next-20241031: kernel/time/clockevents.c:455
 clockevents_register_device
Message-ID: <ZyNUi/DmVi8P21TA@lothringen>
References: <CA+G9fYtb5vAnEiHupwsnaeZ7uzdko_WAcjw9ZAFkHNXBVhi1EA@mail.gmail.com>
 <87zfmkwqui.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfmkwqui.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_095735_621091_A7F31AD0 
X-CRM114-Status: GOOD (  16.20  )
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

On Thu, Oct 31, 2024 at 10:42:45AM +0100, Thomas Gleixner wrote:
> On Thu, Oct 31 2024 at 14:10, Naresh Kamboju wrote:
> > The QEMU-ARM64 boot has failed with the Linux next-20241031 tag.
> > The boot log shows warnings at clockevents_register_device and followed
> > by rcu_preempt detected stalls.
> >
> > However, the system did not proceed far enough to reach the login prompt.
> > The fvp-aemva, Qemu-arm64, Qemu-armv7 and Qemu-riscv64 boot failed.
> >
> > Please find the incomplete boot log links below for your reference.
> > The Qemu version is 9.0.2.
> > <4>[ 0.220657] WARNING: CPU: 1 PID: 0 at kernel/time/clockevents.c:455
> > clockevents_register_device (kernel/time/clockevents.c:455
> > <4>[ 0.225218] clockevents_register_device+0x170/0x188 P
> > <4>[ 0.225367] clockevents_config_and_register+0x34/0x50 L
> > <4>[ 0.225487] clockevents_config_and_register (kernel/time/clockevents.c:523)
> > <4>[ 0.225553] arch_timer_starting_cpu
> > (drivers/clocksource/arm_arch_timer.c:1034)
> > <4>[ 0.225602] cpuhp_invoke_callback (kernel/cpu.c:194)
> > <4>[ 0.225649] __cpuhp_invoke_callback_range (kernel/cpu.c:965)
> > <4>[ 0.225691] notify_cpu_starting (kernel/cpu.c:1604)
> 
> That's obvious what happens here. notify_cpu_starting() is invoked
> before the CPU is marked online, which triggers the new check in
> clockevents_register_device().
> 
> I removed the warning and force pushed the fixed up branch, so that
> should be gone by tomorrow.

Ah, phew!

Thanks.

> 
> Thanks,
> 
>         tglx
> 

