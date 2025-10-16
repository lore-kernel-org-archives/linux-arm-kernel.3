Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9F7CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 18:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cw3pW5LiVDOcN8pDOG3T4cobF3AN3EhzWUWIZj4Jfn0=; b=jZs5jhuHV2DNvotFIbfdbI1eof
	ypUzJjh3QafZ/REh90wh5j8S7G0i28IJXp6QQ8YL9EgrAqo4DOqpiS4KWqv42vFc3r4lWJI5+Zu1Z
	M1LWCcaxTDcJOwPdXz/0AiKELIjhJLj+8S1Law148JYmGOfnnxdX6mDQBGc76F2ygFiMIkUVC6FDn
	WggCZaM0qBcvGh3HAl9EOKIWYW85lca2QxlZsfiBdTDvGQXyQTg+Dt64SbdiDFrKjvq7u7X2VfKkG
	jwAZsXW5sAj8/sX5ylgTPm2wpXa/O8+A+CuLXEuKqI5uyGNTiEe34MjJ+XTAHXo5qkARFo1vfzzH9
	2Qm1DOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9T6y-00000005jpZ-3tcc;
	Thu, 16 Oct 2025 18:54:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9T6w-00000005joF-3bsH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 18:54:04 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760640841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cw3pW5LiVDOcN8pDOG3T4cobF3AN3EhzWUWIZj4Jfn0=;
	b=nGQVX2QkQPTCRrQ3BVNkCItQ8edVCSCv+T5F2Qf/zP2coTUp9sAt8aAxm4Ht2INwayVIV8
	RADP6UycoswqT4A6oeZQpAB+bsa27Eg5IvIjszqJB89aSsB19pXQxg+Kz9kH0dm/ueVy+G
	6tdpH8WNg9IsLC7dnL0CMx03hTmlc/pPtdR18iD0yytSPE8627j4MyWKJQEGXrCYpVMhfq
	Jr4KM++28o5bwAeNoKWu6cFIMb3JnAd+gZUE/opBDKWnkoMlAeuK8Bub6mRnWh3JMr92Ra
	GUUxWv69KXu+PQq1M6Bg72OhVgc9LbkOXS3SE7b1mzWVs/txkfKRe2k2eWtFVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760640841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cw3pW5LiVDOcN8pDOG3T4cobF3AN3EhzWUWIZj4Jfn0=;
	b=VfN0Q0lmGJs/KvetSfYA7RgYqToXfCulGzUCe3r/4KAEMiWwRd1TmbHapQ9XlNL4Jtbzfr
	Fe/1qgwaEUvjpyAQ==
To: Thierry Reding <thierry.reding@gmail.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
In-Reply-To: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
Date: Thu, 16 Oct 2025 20:53:59 +0200
Message-ID: <87cy6m1xvc.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_115403_039676_F5124DD4 
X-CRM114-Status: GOOD (  22.47  )
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

On Thu, Oct 09 2025 at 13:38, Thierry Reding wrote:
> We've been running into an issue on some systems (NVIDIA Grace chips)
> where either during boot or at runtime, CPU 0 can be under very high
> load and cause some IRQ thread functions to be delayed to a point where
> we encounter the timeout in the work submission parts of the driver.
>
> Specifically this happens for the Tegra QSPI controller driver found
> in drivers/spi/spi-tegra210-quad.c. This driver uses an IRQ thread to
> wait for and process "transfer ready" interrupts (which need to run
> DMA transfers or copy from the hardware FIFOs using PIO to get the
> SPI transfer data). Under heavy load, we've seen the IRQ thread run
> with up to multiple seconds of delay.

If the interrupt thread which runs with SCHED_FIFO is delayed for
multiple seconds, then there is something seriously wrong to begin with.

You fail to explain how that happens in the first place. Heavy load is
not really a good explanation for that.

> Alternatively, would it be possible (and make sense) to make the IRQ
> core code schedule threads across more CPUs? Is there a particular
> reason that the IRQ thread runs on the same CPU that services the IRQ?

Locality. Also remote wakeups are way more expensive than local wakeups.

Though there is no actual hard requirement to force it onto the same
CPU. What could be done is to have a flag which binds the thread to the
real affinity mask instead of the effective affinity mask so it can be
scheduled freely. Needs some thoughts, but should work.

> Maybe another way would be to "reserve" CPU 0 for the type of core OS
> driver like QSPI (the TPM is connected to this controller) and make sure
> all CPU intensive tasks do not run on that CPU?
>
> I know that things like irqbalance and taskset exist to solve some of
> these problems, but they do not work when we hit these cases at boot
> time.

I'm still completely failing to see how you end up with multiple seconds
delay of that thread especially during boot. What exactly keeps it from
getting scheduled?

Thanks,

        tglx
 

