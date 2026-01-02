Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F913FA374B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+Y4tZlmMOhjlcOrMF+gAjQhfVMW14x1bbX35EdHZ1g=; b=Ouy7Vs1GUGVCm5lf08k24xEqjR
	PwowERjy8otKFf+N9wK5lPzaZ2eupa/kZPzeEH13OoU3mbwRN2gscmfklXsx4e/tIfreeWQ0QyUPa
	/QIe3i9vMvkwMbZefFRzzZuI2p9LLRx0Jggr9t9LZQmG0DegPG8F1n+QbWPk3bp4vxo3aoRm9Jzc8
	lkeMU3x3mb/pFLM2kl1xLuctxRFyj/ObK8cMuMLdT2IZI/M+ammAuZFf8JjO2Um32v1wsXYJWWO9i
	Vy/Fmh+QCQ4Z1TAHfwoCilmrx5S0tb3ZsNHIdPH4OixecDho4K8ZaR/1pRkxYS1Va0zwfLZVM73xX
	Qr7wuntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbguE-00000008QAM-05Nt;
	Fri, 02 Jan 2026 15:17:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbguB-00000008Q9x-1KjR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 15:17:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9812140ACE;
	Fri,  2 Jan 2026 15:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B16C116B1;
	Fri,  2 Jan 2026 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767367050;
	bh=rulx+EHiKkHIaxqey/GNbl30vR/k8uss/CMSgWMUHm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aPeRyB/lM7PAZuJCMi+rKby9A+HuQ77O2vNTC3Ol0XMi5XQ+Rhd4pkGt1QPBgf8KQ
	 SP2QE2foTsYOsSCDdMjDFjky/LyEWHcKJan95zSANSFjC0Xz2RfHKB3SORZU7Ya7aw
	 H29TUFNJH3gcAY7/AfKvG7koaaBgCixokzfQSopcJA6XFQZu5woAueFMhd3CrVkhjp
	 iG1OSIKex6QGytqHHHJYDq/p8iyVR0x3z9nx4ZYDu97xEG8+AunALoiXIUAjqUUwyd
	 Y0q7hTK7Vn9dk2HmPAAE1JN6i1VKOVqZpqJ33oLhkGHXmCYnFlNGVrxmBpBkbA6MCx
	 9nwRSvSseJMuw==
Date: Fri, 2 Jan 2026 15:17:25 +0000
From: Will Deacon <will@kernel.org>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: SMP boot issue during system resume
Message-ID: <aVfhhXHfFE6lzlzp@willie-the-truck>
References: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_071731_376380_296BBDB1 
X-CRM114-Status: GOOD (  19.48  )
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

On Mon, Dec 22, 2025 at 11:30:19AM +0530, Pavan Kondeti wrote:
> We are seeing a SMP boot issue during system resume when CPUs are brought 
> online via pm_sleep_enable_secondary_cpus()->thaw_secondary_cpus()->_cpu_up() 
> on ARM64.
> 
> The _cpu_up() sets a global variable
> 
> secondary_data.task = idle;
> 
> and wait for the secondary CPU to come online. A 5 second timeout is
> used here. If at all, the secondary CPU comes online after this timeout,
> we expect it to loop in kernel via __secondary_too_slow(). However, this
> depends on secondary_data.task value. Since we are bringing all disabled
> cores, after timeout, we set this global variable to the next CPU idle
> task and the late secondary CPU thinks the value is its idle task and
> does not enter __secondary_too_slow().
> 
> An earlier attempt [1] to fix similar issue incrased the timout to 5
> seconds. We could reproduce this issue in Linux guest where vCPU
> scheduling latency can be higher under heavy load on the host.
> 
> I would like to seek your inputs on how we can improve the current
> situation. We would like to avoid __secondary_too_slow() spin even when
> the CPU comes late. This is probably not a desired behavior for other cases like 
> Linux running bare metal or some guests. Having a Kconfig option or
> kernel param might help here.

You probably want to use the parallel hotplug machinery (or one of the
interim steps) for this, as it avoids the global state entirely. I spoke
about it at KVM forum [1] and I have some old hacks at [2]. I can dust
those off and post them to the list if you like?

Will

[1] https://www.youtube.com/watch?v=Q6kOshnnQuE
[2] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug

