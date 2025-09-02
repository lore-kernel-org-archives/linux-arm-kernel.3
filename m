Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7502ACA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 01:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLFZuz30dpa79lpxVcrr60HQRnKxDWtLmNqx3vgx7b8=; b=Yey2X1P5LUf8eCSOnfmM7mwmyl
	xKEwuSXTTWm4E+1MZiQR6LprLJWoonBHxzfc0uc/J1RTFfPSA5emfVnFLz5FSj4g8u4u6YwHaUuQb
	aRAv7/5hMkUibWmj276ItrFFiVgInZIBrPpx6/Xfm42ZPGQybszWDZgcmmbNJ2/fvnPt658QanczX
	FFOU1RkdRhhhxtU+tdOj/6stctaSum9805xevpItD6rpfRriyjlTk+dN/J4G9qU8nv+eOEzBscq06
	UVc6GDVBfNW3XRAQfpMYcnirwAn+gosgiJ5frUZqhmagIzC2feYImsevqgJ2m1gzulTrE8BJTsUiO
	SJmKOiaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcj0-000000038mx-0mgt;
	Wed, 03 Sep 2025 01:55:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYbm-0000000285U-1dbs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 21:32:08 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756848722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VLFZuz30dpa79lpxVcrr60HQRnKxDWtLmNqx3vgx7b8=;
	b=Zv6yiOduGnjJ0WqWe1gJI2sWO+xJHM+9mryM69iWW/x9MXGRG/dmEb5UMxHnC0JqY7VHbE
	KHHbicPwJ7Jq+GBYMNhx1UG9Nui11BSuiZYMotWMCO6Lf3HZDuAb3aBdE65zUQ/pqYp8Gh
	p5TEv1Fmq1cT3aK0QLqnBbeyOAoU5IJaYX31xSxyDjM58hA+mAkC2cQPhJCnd+yXyQLYT9
	5Md5GZD+H8oGJp7oKWW2osJh9jxuBb0x9qh+a48CX6e5jplWDwb0iw3YR8rHXKmxb5wJN/
	4vhdlNw4TVY3QM6qFT4PM8krLwBR5BBbvCNBPeco85AWY4MqK+XjyZ8kYkdUsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756848722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VLFZuz30dpa79lpxVcrr60HQRnKxDWtLmNqx3vgx7b8=;
	b=4OFLyBKpb+jH1AHqeowtFzp2dzv/hj3blRLlcme50Ikav16eZnJDUc4Tv0o2ZpyVNoJoLl
	aEJEG+qy8oSMuzCA==
To: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
Cc: Llillian@star-ark.net, agordeev@linux.ibm.com,
 akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
 anna-maria@linutronix.de, bigeasy@linutronix.de, catalin.marinas@arm.com,
 chenhuacai@kernel.org, francesco@valla.it, frederic@kernel.org,
 guoweikang.kernel@gmail.com, jstultz@google.com, kpsingh@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, maz@kernel.org, mingo@kernel.org, pmladek@suse.com,
 rrangel@chromium.org, sboyd@kernel.org, urezki@gmail.com, v-singh1@ti.com,
 will@kernel.org, peterz@infradead.org, elver@google.com,
 namcao@linutronix.de
Subject: Re: [RFC PATCH] time: introduce BOOT_TIME_TRACKER and minimal boot
 timestamp
In-Reply-To: <20250902133920.973210-1-kaiwan.billimoria@gmail.com>
References: <871pp14pkr.ffs@tglx>
 <20250902133920.973210-1-kaiwan.billimoria@gmail.com>
Date: Tue, 02 Sep 2025 23:32:01 +0200
Message-ID: <87frd4zgku.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_143206_566512_FBB32561 
X-CRM114-Status: UNSURE (   9.06  )
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

On Tue, Sep 02 2025 at 19:09, Kaiwan N. Billimoria wrote:
> Subject: Re: [RFC PATCH] time: introduce BOOT_TIME_TRACKER and minimal boot timestamp
>> Under the assumption that nothing on the way resets the counter.
> Ah. Is there any known component - within ROM/BL stages/kernel code - that does
> this?

How should I know? I'm not playing with this boot timing muck and yes,
some hardware counters can be reset by software...

> Forgive my asking, but if fine, will this (above-mentioned) patch be taken? So,
> knowing that, we can proceed forward..

Just send a patch with a proper justification and we take from there.

Thanks,

        tglx

