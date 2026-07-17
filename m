Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFFDC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxn8Lsn3d4qePsulTs4i5GyggLvnEEsEUWj0jhm1nk8=; b=LjQkO3OU1xSnjfy6kn/fw1DEZD
	OSr+1r0pc711xhkgXVKjNOO8wZ+unSnOw6he8gE2WkyNZqiHaNOV7EAgYU75yE+vfRD/b9h/S70oZ
	soJaYxaJv6J70Vjo1EOSdaKGcnWwvjm9CKUL6LIUbsBZmAjY4FymtV5EOUnFvXBDuBZjQ5r25u8Im
	FI9GzNB5MFAFXM8OgpASPyC1ul8P1uD7oD7h1ngcSnWRGYyPHYBmHjubxVKghNmadyUqxb7FWiDE3
	QcfMxvb0HikHvQzxsRt/GCSDF6cN0WjIe84RHZPRdwZSS0SxAplVZUDU3HNEY9SzJlkclmLYOdLoX
	SPE26/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkg80-000000022cu-2SLK;
	Fri, 17 Jul 2026 10:49:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkg7y-000000022ba-2gMx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 10:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cxn8Lsn3d4qePsulTs4i5GyggLvnEEsEUWj0jhm1nk8=; b=cwFgJ5DVApSe4wQn8i1vaGgCIW
	XsWquc+56hB2cKsWOQYLuYC2PRQq80Lf3zQ5xq6sPIwoovRhIGJ1L88vL7A4dWLJLZ8YAtDTjIo4v
	2AnLCe5Za1Y/RQqPnQ6HgIvs79QsVSKFWRAaFgNciZ139mkr3hDNfAs7Fu27gWoYd0WhkT3/FKNc6
	yjqiTr9/IieajEuFbbO2J1KidkN2R/rMmQK0JkHk9Sj5kh65QSKZLFA853be3EIUdZ4YGFkM9ZIVT
	fp1Qou5kc5RgWkS2la4TVg0mjFrhSzGfkdYU7vNTN8dfsOonotUAAfhbf9eYgNHeIwE5FrxRr7FG1
	H9vtXm3Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkg7u-0000000En9n-0bGp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:49:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C16A61476;
	Fri, 17 Jul 2026 03:48:58 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A01F3F7D8;
	Fri, 17 Jul 2026 03:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784285342; bh=cxn8Lsn3d4qePsulTs4i5GyggLvnEEsEUWj0jhm1nk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vgp1fR29s+j3ynvwGZVFscWPT3WAh2dHTtjsQX/0bF5/dCExwMImZV3mR26InoRfd
	 n7yQ/C7FisXOKK1rJpXcxoDo8vMmlLqrQPciVBK18Pqpnhl7heHFlIA7Q+4tyDWPUB
	 arxhrqh+zubBqJ4Qk6E6GeVoranTyZRiI2SMi+h4=
Date: Fri, 17 Jul 2026 11:49:00 +0100
From: Leo Yan <leo.yan@arm.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <coresight@lists.linaro.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT" <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH v3] coresight: Fix scheduling while atomic in
 coresight_cpu_pm_notify()
Message-ID: <20260717104900.GA3998092@e132581.arm.com>
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
 <20260716214155.2049564-1-mohamedaymanworkspace@gmail.com>
 <20260717081453.pSDTUQQW@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717081453.pSDTUQQW@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_114906_426213_6FC2BA21 
X-CRM114-Status: GOOD (  12.02  )
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

Hi Mohamed & Sebastian,

On Fri, Jul 17, 2026 at 10:14:53AM +0200, Sebastian Andrzej Siewior wrote:

[...]

> There is coresight_put_percpu_source_ref() with holds coresight_dev_lock
> during a put_cpu. I don't know why the lock is held, it is not obvious
> to me. But it will lead to a similar problem if the put actually invokes
> the release callback.

Sorry I am a bit late to join the discussion.

Essentially, this is about how to manage a module's lifetime correctly
so that the CPU PM notifier can safely access a device. There is an edge
case where the CPU PM notifier is accessing the device while, at the
same time, the module is being unloaded and the device's resources are
being released.

For now, I'd suggest please hold on this patch. Give me a bit time to
study this thread, I will share back more details.

Thanks,
Leo

