Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB58CC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASF/WpIYGZkEbpolc/F3Wi3P1TTRk1E6xzIEUVemjeI=; b=Hpx1PNaShMnf46ARb0cii/JsMx
	j2laKbWFx7DL2jU8eiSf8DR40RmgqfaNi67Q48EkKYufuGFm5ecvJyHctqd3NgR5zrFCxzVZdqL3S
	hdS+3QT+kDh8jMao4HnIlE7pEz53e2GDrJemeh6VpdlmGlFikW+Le6rN7LPB+Q/PtrhMiDc9L8/0Z
	aV0DjQMmZRO/BUKwyIUDyLf7UnvH4U3KPY3M710v6ekMY8oerMa2HOLXfxG15BI6+UO5Vv8XAdsW0
	maxVYz8rkGS/URQJc+dTPu129K28Wt5WDUV70Tk7uhGj96dxZVeh5rnDsk5frU4016SWzlviBsej5
	az+sez0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lFT-00000008kJO-1URE;
	Wed, 16 Sep 2026 08:44:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lFQ-00000008kHe-1n2g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:44:09 +0000
Date: Wed, 16 Sep 2026 10:44:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789548245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ASF/WpIYGZkEbpolc/F3Wi3P1TTRk1E6xzIEUVemjeI=;
	b=x0XjFA0+VS6BEKMMEdfX7q5Mr7EzX5vKE1y8qLI28gVtUd4fqQ0gJZvoX1zIdSzgBweSvZ
	DHJ0iNK3IgVzJ3ASqIH1f1M1R33T0DszXC4siJCzMIu9Wpd9xZXhqSSCUJzXU/0/9JHfaR
	yyCZVH64c8Wc9x3iXPCsKGtZful+hF2cMgASgIlNe7Rt9VdQSBdHTtD/DO0q8f6XoSKQRS
	1KVnPvm8tihat2j8M+RtsbcfExXVE++fWc0GBhT2xR/jsT6Fx9ftzEbs+H8Ha6UFa5458f
	lU2j+Q3iAb6TfbdBU0OXUbqddMY8RkwC3PJNM9HR2ffX/J1Llv7WItTKPSed6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789548245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ASF/WpIYGZkEbpolc/F3Wi3P1TTRk1E6xzIEUVemjeI=;
	b=1ptiGNVr4mlsFj9znayV4gv6dZ4sSq/SvRX/Iy9R4YOr4p6vIgSVu9BW8La9EtFdlCrxcy
	ouInbmvfiVhXKVBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>, Radu Rendec <rrendec@redhat.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/4] ARM: allocate the cacheinfo early to fix the
 PREEMPT_RT boot warning
Message-ID: <20260916084404.fjkCQKUK@linutronix.de>
References: <20260912195552.76673-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260912195552.76673-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_014408_674273_A783DF16 
X-CRM114-Status: GOOD (  10.82  )
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

On 2026-09-12 21:55:48 [+0200], Karl Mehltretter wrote:
> This series moves ARM cacheinfo allocation to the boot CPU to avoid
> sleeping-lock warnings during PREEMPT_RT secondary-CPU startup. It is
> based on 5225b8eec4c9 (7.3-rc2 plus one day).
> 
> Patches 1-3 prepare for early allocation: bound cache-leaf writes,
> include external caches in the allocation size, and guard CLIDR reads
> on older CPUs. Patch 4 enables early allocation. Please take all four
> patches together for stable.
> 
> Tested on QEMU virt (Cortex-A15), vexpress-a9 (Cortex-A9 with PL310),
> and realview-eb-mpcore (ARM11 MPCore) with PREEMPT_RT, plus non-RT
> virt and vexpress-a9 builds. Cache sysfs output is unchanged for the
> normal platform DTs, and CPU hotplug passes where supported. Additional
> checks cover DT leaf undercounting with KASAN and ARM11 DT cache
> descriptions.
> 
> The full series also passes on a Raspberry Pi 400 with a 32-bit
> PREEMPT_RT 7.2.6-rc1 kernel: the boot warning is absent and all 12 cache
> sysfs entries match the baseline. CPU hotplug is unavailable there.

This makes sense.

Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

