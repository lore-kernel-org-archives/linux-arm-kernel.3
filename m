Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1653C79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugflClFkZ1mAZBFtZ4wBnCFO1LiuWwMD26DC0ofVkuw=; b=kBJgsgK4TIyOvN+nET1ipvP1VD
	N5xLu8BhuR00OJ0sm9bHft0vyEy0brHbuqPSCR6jLY1m26MRN/uct3ci46z3oq6qtoB4Xj4x0fKAm
	qliILUY53b70Z82EuGEx4WeCiY5mbp8hLfdUQvwNqmmiO7ZEsJlAsAj1eF8nEUVh7wUvmtt9RlJEb
	mtw8P7rVfEI6OJanTdN3OwFoADf3Js7U9vvUNAla09jIkqaYLzJ9dDGWm4e9kK2KOBsAvgtnJg3l0
	2uB/3w337bzp6on9v2lSgU3NtKgkQrhk52SFbGuKNMGcOyDgNTncDM3mkf2Gqgx94dTpv//riQ23y
	/vhTubOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckF6-0000000BNjE-21ZT;
	Mon, 05 Jan 2026 13:03:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckF4-0000000BNiK-1a3M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:03:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0279544034;
	Mon,  5 Jan 2026 13:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31BEC116D0;
	Mon,  5 Jan 2026 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767618204;
	bh=hC1uV+95Tl2qc7sflCQpdulQ3kTuQer5LRR4vuk0b8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHqnu5dUw+v3TuJu2saXeC3PPCAoc2XsGsS6VWJT9Kfx+2cQpEnQpobcyY7PEm968
	 eElqWuB3EOx0ksbNUUCsnibYmj9b+spf4AgQuvmynTMgX8/pa+4+/U8sV50xF11vgE
	 It0IoSRIgWL+5gRhGCjSsA5kLG3GuCLKrTTqDVNusicIIMV0vhq6BBzZxo2OixA90c
	 uGXLBK2aX2smbadNHVCdgox0h37xX5Y7ACcHIZbIjoyUOyTYYwNxtmQY+mQfMHpAme
	 1upDAeBxlgz90BT9UjM0sLK010Ee17jLprgr7uU2nOibcxUdXW5Imm5kWj4ygcbjyx
	 9FrZ31FwuXTKg==
Date: Mon, 5 Jan 2026 13:03:20 +0000
From: Will Deacon <will@kernel.org>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: SMP boot issue during system resume
Message-ID: <aVu2mEldTlpMK0hh@willie-the-truck>
References: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>
 <aVfhhXHfFE6lzlzp@willie-the-truck>
 <e71b9bc5-42c1-4295-998e-4a9d71d84b25@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e71b9bc5-42c1-4295-998e-4a9d71d84b25@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_050326_458540_83FD1941 
X-CRM114-Status: GOOD (  31.87  )
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

On Mon, Jan 05, 2026 at 04:24:44PM +0530, Pavan Kondeti wrote:
> On Fri, Jan 02, 2026 at 03:17:25PM +0000, Will Deacon wrote:
> > On Mon, Dec 22, 2025 at 11:30:19AM +0530, Pavan Kondeti wrote:
> > > We are seeing a SMP boot issue during system resume when CPUs are brought 
> > > online via pm_sleep_enable_secondary_cpus()->thaw_secondary_cpus()->_cpu_up() 
> > > on ARM64.
> > > 
> > > The _cpu_up() sets a global variable
> > > 
> > > secondary_data.task = idle;
> > > 
> > > and wait for the secondary CPU to come online. A 5 second timeout is
> > > used here. If at all, the secondary CPU comes online after this timeout,
> > > we expect it to loop in kernel via __secondary_too_slow(). However, this
> > > depends on secondary_data.task value. Since we are bringing all disabled
> > > cores, after timeout, we set this global variable to the next CPU idle
> > > task and the late secondary CPU thinks the value is its idle task and
> > > does not enter __secondary_too_slow().
> > > 
> > > An earlier attempt [1] to fix similar issue incrased the timout to 5
> > > seconds. We could reproduce this issue in Linux guest where vCPU
> > > scheduling latency can be higher under heavy load on the host.
> > > 
> > > I would like to seek your inputs on how we can improve the current
> > > situation. We would like to avoid __secondary_too_slow() spin even when
> > > the CPU comes late. This is probably not a desired behavior for other cases like 
> > > Linux running bare metal or some guests. Having a Kconfig option or
> > > kernel param might help here.
> > 
> > You probably want to use the parallel hotplug machinery (or one of the
> > interim steps) for this, as it avoids the global state entirely. I spoke
> > about it at KVM forum [1] and I have some old hacks at [2]. I can dust
> > those off and post them to the list if you like?
> 
> Thanks Will for pointing to your informative talk. I see that your patch
> depends on PSCIv0.2 extension to CPU_ON (context argument) [1]. I am not
> sure if this suit our immediate needs, but it is good to know that we
> have a plan for parallel vCPU hotplug.
> 
> I am happy to test if you have any other patches that address /
> workaround this problem w/o depending on backend/firmware.

Surely you're not using PSCI v0.1 in 2026?

Will

