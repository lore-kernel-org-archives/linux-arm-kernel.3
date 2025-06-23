Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53BCC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEMnrs9w8mOFa54cCrRyf8ZEUg7MiaTXwVSJG82m6gc=; b=UXx7Mpj2Z20TI4CX3F8osu5V/G
	Wpcc3n54kowCXqf3XO5cQcp2H2qnGDzcx4PMHbVmCQncbZDUknH2omtZEOKbICx6Y+SmgW5aH51kN
	Q7npS6d5O+xEVgK2D9sAUa40T2XVSXKzPW54AFRh6goR6Et+bPR24RUdd3l9c+81n/VuZtMxZ0kUp
	DZLOTvSpCv6G17pW6iRfmH2chpiiiHHyuWFAQP0687Whv8yjMihtPcjhBxp2G8nF/ukG8B12fm2+2
	MpRXp/bxVMf5bIuU1UvnytvpfQW0bqlIFOrA+NOvw4kVFd7pn9k6SLoho8Tvr/zKv0BlULh395Nwf
	zil8EvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrbi-00000004IUl-0H8k;
	Tue, 24 Jun 2025 00:33:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTqcR-00000004AnH-01iu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 23:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC8E45C611A;
	Mon, 23 Jun 2025 23:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B876C4CEEA;
	Mon, 23 Jun 2025 23:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750721429;
	bh=+pzksmTU21a14H+AoU855eBMzjvNfwKGmzqegPCUfz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TVwvL7+CH+emFOPEcbSmexDp/bxZo2WpXF5IM4MfNkGpXDwP605gweI/1ro7UCa1c
	 t/pom6YA4zRP6ewjo5XoW4mwESp6bzj9oABc5VQsNe0EaH5chClFNnipA0F/fNs+/L
	 DDZfxz+HnvEKeEq+ndtaRhHGHPXXO2JcQiq5uPyk=
Date: Mon, 23 Jun 2025 16:30:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <dianders@chromium.org>,
 <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
 <lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
 <zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>,
 <yangyicong@hisilicon.com>, <linuxarm@huawei.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-pm@vger.kernel.org
Subject: Re: [RESEND PATCH v2 0/2] Update the watchdog period according to
 real CPU frequency
Message-Id: <20250623163028.1914d7ec909eb9bfc1daa666@linux-foundation.org>
In-Reply-To: <20250619114805.16968-1-yangyicong@huawei.com>
References: <20250619114805.16968-1-yangyicong@huawei.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_163031_112019_83D205CD 
X-CRM114-Status: GOOD (  13.11  )
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

On Thu, 19 Jun 2025 19:48:03 +0800 Yicong Yang <yangyicong@huawei.com> wrote:

> watchdog perf needs architecture to provide method for converting the watchdog
> thresh to counter period. For arm64 we're using the max CPU frequency for
> doing the conversion which is from cpufreq driver. But some cpufreq driver
> are registered lately, for example cppc_cpufreq will be registered at late
> initcall which is after the initialization of watchdog perf (initialized in
> armv8_pmuv3 of device initcall). In such case the period of watchdog will not
> be accurate enough. Fix this by registering a cpufreq notifier and update the
> watchdog period once the cpufreq driver is initialized.

Great, thanks.  I'll add these to mm.git for testing.

> arch/arm64/kernel/watchdog_hld.c | 58 ++++++++++++++++++++++++++++++++
> include/linux/nmi.h              |  2 ++
> kernel/watchdog_perf.c           | 23 +++++++++++++

This is not exactly my comfort zone so additional review would be
appreciated, please.  Even though it doesn't touch drivers/cpufreq,
perhaps the developers over there could take a look?

