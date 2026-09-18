Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E52C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0I1AhUNKzG51+TWGohbwBR1dV+eHiubIuZUP0T9QuA=; b=h4ygEeS8jlBYy5IRmGrKzE3YHo
	pp63YpyCnY2Ekx+1AGYjbnQoXDek8Cb0OPSyFurlSenaWVJYf5K9hj6ncniWjAbg5fvfWPBQ/tm1T
	FzGOIhFDwjc/8IKr2vnI6vvczN8nQsoAIpgdTxWp7MzGkBYoWjCz1uCz1sg0SCo3F8sIH47iwCeGh
	OY0bMFjLF89SKMFMs3Y4artEe1dPr7wiiT/Jm3ZiDZLUrkZEAwCz1QKMNHhpYPoQBB/YaQymJqygT
	iYa/D4WvJx0uBD8zfB451RgTyqBJu4FN51MhWfe+DAVMjE+EUb/PfQk7mQ8UJhwhb6XjcO46tVYJH
	YOnezetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aM7-0000000Er7u-1YVW;
	Fri, 18 Sep 2026 15:18:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aM5-0000000Er7D-2h7Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:18:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07504411C9;
	Fri, 18 Sep 2026 15:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1B31F00898;
	Fri, 18 Sep 2026 15:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789744704;
	bh=P0I1AhUNKzG51+TWGohbwBR1dV+eHiubIuZUP0T9QuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KS/Wr/88cMvOPFT/dQw7sQ4fvLO3WOqyoE5aRm88waNxe1Q12I2/Y7sB8Bl6YY2na
	 XfGTPdRbiJTgxU65CBNXcJnAzMptTdfhZRhi+uZMj6yd96v32nKqF8nj57fy4GfBOY
	 bsbosqFSKsGQyW5nO6NtSs8MM+lRFZd+QdvdJrNpSG6eGawH1GVoG+YsJRgdFKkgVR
	 TJ5ce+kgi/LvQRYBHTqYO+wDhXTa8YX9k75y5Ox7/Rm3mzi/E8mFqXd1Wxu8CcxWZz
	 Ct+nNq0vcPG5qyw5fIz/JQAqC9p/cq5KUlQsF9FsLATvm0GBFHfpsO2Q7h4P5TjnKg
	 8cJJBgC+Pq9Bw==
Date: Fri, 18 Sep 2026 16:18:19 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 18/19] arm64: smp: Use generic HOTPLUG_PARALLEL machinery
 for CPU onlining
Message-ID: <aq1WO-t5T6NGUUjY@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-19-will@kernel.org>
 <23be2187-4618-400d-b817-023e6bc8f4bc@huawei.com>
 <aqP6kv9ZfNRWmngj@willie-the-truck>
 <18e3c3d9-562d-42c6-80f6-7744adfad79d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18e3c3d9-562d-42c6-80f6-7744adfad79d@huawei.com>
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

On Wed, Sep 16, 2026 at 10:34:10AM +0800, Jinjie Ruan wrote:
> 在 2026/9/11 20:56, Will Deacon 写道:
> >>> +	pr_crit_once("CPUs may be stuck in kernel\n");
> >>
> >> Need we print the "cpu"
> > 
> > You should already get something like:
> > 
> >   CPUn: will not boot
> 
> "will not boot" is only for "cpu_died_early_mask" case, I meant the
> "unknown state" case in the original default branch of the switch.

Oh, in that case the core code should now print:

	"CPU%u failed to report alive state\n"

Will

