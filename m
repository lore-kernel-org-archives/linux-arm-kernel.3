Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D998C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 10:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxbCFy+YVAok7lkWS9hgSHArZDCzdlEOMBm9HS++e8M=; b=MOSYVn3S8Cc5rueaYROfw3DuxY
	axY5zjRtH29zvcyoy4RZQtoZ2F7HfY0Kf+uApOqn5ydwtRe5GmIb42iXPHn6HHILyUb84vXsz5b0J
	+HvaBIfZSnI+BdgHENZMkEkl7e3BxWSRaqWIrZxDBLELyipCgSFjxU4iMAR5X33WLjU6GdOHBQX1M
	zZgRFlv+YRnKRCLtTdwf+Oqva4Nm0TX9AKnk1ZDHA3IuGgMKOsq0ff0ARvtRRLPRk99ly484jz1It
	ep3Vfc3xE5T/A5cJZeQwUKQUMawxPrrb3m8bZpq+1hyk56L4r1At9pCpOH9Kai9eF4zfiQ7GdmmU3
	wdpGMwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hx0-00000009GGM-0Ppz;
	Tue, 29 Apr 2025 10:12:30 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hqf-00000009Esx-2CQS;
	Tue, 29 Apr 2025 10:05:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745921137; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jpSzhwxlzOAiAzYn1qgSNGg8hpGzpfBH9ZSCGDbaaQWaYBf+YTPl5HH5Y2t2me7v9d7Nqt9ShWyU/To8C5dpiQKL2aiNXBunoimO6cOc0f0dvRz6hN2jaAvgLenXRYp4rx0zkLJ8StgkMH3sI7h+Ow2hlEgQezjW5j4OGT9aIVM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745921137; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JxbCFy+YVAok7lkWS9hgSHArZDCzdlEOMBm9HS++e8M=; 
	b=GKpj86eYoSeNFysHu2RMVKHTLtlZZzBLvMvKoBNr7LcpO+Z4Znm7AnG7AuZ9MdQ/qdj2qKDpK/fAs72EzucerpNxuxBl4dFmgoONR6L/FT/KtbHbAadNOUR9IX3AM8qy0kWUq0YhI+kJvAHyoCKKbHcuyuWTBB3vkzeCzRrUEvs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745921137;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=JxbCFy+YVAok7lkWS9hgSHArZDCzdlEOMBm9HS++e8M=;
	b=ScUGTsBQeOdzXPal+jTXkQH/TtCHyCJS3xVRpl0+uUm5bDvVOrABlUbBHKOKQNex
	CpvEWt235HdE+Hb2sFR6N01jaBy52WClbaN3+ye+vb+cQLyL8dRzGH84JXN/SQnxi/3
	gj/y5VEPmR225Abunl34QxehV4TCifdRWstIpdhI=
Received: by mx.zohomail.com with SMTPS id 1745921136083931.6736324937333;
	Tue, 29 Apr 2025 03:05:36 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-rockchip@lists.infradead.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH v2 6/7] accel/rocket: Add job submission IOCTL
Date: Tue, 29 Apr 2025 12:05:28 +0200
Message-ID: <2365360.ElGaqSPkdT@workhorse>
In-Reply-To: <20250225-6-10-rocket-v2-6-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-6-d4dbcfafc141@tomeuvizoso.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_030557_660544_2581D089 
X-CRM114-Status: GOOD (  30.06  )
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

On Tuesday, 25 February 2025 08:55:52 Central European Summer Time Tomeu Vizoso wrote:
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
> 
> Userspace can decide for a series of tasks to be executed sequentially
> in the same core, so SRAM locality can be taken advantage of.
> 
> The job submission code was initially based on Panfrost.
> 
> v2:
> - Remove hardcoded number of cores
> - Misc. style fixes (Jeffrey Hugo)
> - Repack IOCTL struct (Jeffrey Hugo)
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  drivers/accel/rocket/Makefile        |   3 +-
>  drivers/accel/rocket/rocket_core.c   |   6 +
>  drivers/accel/rocket/rocket_core.h   |  14 +
>  drivers/accel/rocket/rocket_device.c |   2 +
>  drivers/accel/rocket/rocket_device.h |   2 +
>  drivers/accel/rocket/rocket_drv.c    |  15 +
>  drivers/accel/rocket/rocket_drv.h    |   4 +
>  drivers/accel/rocket/rocket_job.c    | 710 +++++++++++++++++++++++++++++++++++
>  drivers/accel/rocket/rocket_job.h    |  50 +++
>  include/uapi/drm/rocket_accel.h      |  55 +++
>  10 files changed, 860 insertions(+), 1 deletion(-)

Hi Tomeu,

some more power management things I've noticed here.

>
> [...]
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..25b31f28e932aaee86173b9a0962932c9c640c03
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_job.c
>
> [...]
>
> +static void
> +rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
> +{
> +	bool cookie;
> +
> +	if (!atomic_read(&core->reset.pending))
> +		return;
> +
> +	/*
> +	 * Stop the scheduler.
> +	 *
> +	 * FIXME: We temporarily get out of the dma_fence_signalling section
> +	 * because the cleanup path generate lockdep splats when taking locks
> +	 * to release job resources. We should rework the code to follow this
> +	 * pattern:
> +	 *
> +	 *	try_lock
> +	 *	if (locked)
> +	 *		release
> +	 *	else
> +	 *		schedule_work_to_release_later
> +	 */
> +	drm_sched_stop(&core->sched, bad);
> +
> +	cookie = dma_fence_begin_signalling();
> +
> +	if (bad)
> +		drm_sched_increase_karma(bad);
> +
> +	/*
> +	 * Mask job interrupts and synchronize to make sure we won't be
> +	 * interrupted during our reset.
> +	 */
> +	rocket_write(core, REG_PC_INTERRUPT_MASK, 0x0);
> +	synchronize_irq(core->irq);
> +
> +	/* Handle the remaining interrupts before we reset. */
> +	rocket_job_handle_irq(core);
> +
> +	/*
> +	 * Remaining interrupts have been handled, but we might still have
> +	 * stuck jobs. Let's make sure the PM counters stay balanced by
> +	 * manually calling pm_runtime_put_noidle() and
> +	 * rocket_devfreq_record_idle() for each stuck job.
> +	 * Let's also make sure the cycle counting register's refcnt is
> +	 * kept balanced to prevent it from running forever
> +	 */
> +	spin_lock(&core->job_lock);
> +	if (core->in_flight_job)
> +		pm_runtime_put_noidle(core->dev);

This particular line of code caused me issues when I was experimenting with the
driver on RK3576. My current situation is that every job that gets submitted
times out because of some IRQs never arriving, which is besides the point, but
it did expose a power management bug here that I suspect may affect RK3588 as
well. After like 3 timeouts, we reset again and hang in the interrupt mask write
just a few lines above. This is because we somehow managed to get into a
situation where this function is called with pclk disabled, and this manual
balancing act may be part of it. Not doing the manual balancing at all here
doesn't fix it, I had to explicitly wrap the reset function in
pm_runtime_get_sync and pm_runtime_put_noidle to avoid having this function
execute with disabled clocks. That seems like the "wrong solution" though
because it means something already powered off our hardware too eagerly before
we got the reset done.

My gut instinct tells me that there's a bug here with multiple timed out jobs
being in flight, but I'm not 100% on it. Maybe you'll be able to reproduce it
on an RK3588 by artificially forcing all your jobs to time out with some very
low timeout value or by masking the interrupts.

> +
> +	core->in_flight_job = NULL;
> +	spin_unlock(&core->job_lock);
> +
> +	/* Proceed with reset now. */
> +	pm_runtime_force_suspend(core->dev);
> +	pm_runtime_force_resume(core->dev);

Do we need to guarantee some sort of exclusivity here so that nothing tries to
concurrently use the device while we're forcing it off and back on again? I'm
unfamiliar with the drm fence stuff, so I may be overthinking this.

> +
> +	/* GPU has been reset, we can clear the reset pending bit. */
> +	atomic_set(&core->reset.pending, 0);

Nitpick: should probably be "NPU" ;)

> +
> +	/*
> +	 * Now resubmit jobs that were previously queued but didn't have a
> +	 * chance to finish.
> +	 * FIXME: We temporarily get out of the DMA fence signalling section
> +	 * while resubmitting jobs because the job submission logic will
> +	 * allocate memory with the GFP_KERNEL flag which can trigger memory
> +	 * reclaim and exposes a lock ordering issue.
> +	 */
> +	dma_fence_end_signalling(cookie);
> +	drm_sched_resubmit_jobs(&core->sched);
> +	cookie = dma_fence_begin_signalling();
> +
> +	/* Restart the scheduler */
> +	drm_sched_start(&core->sched, 0);
> +
> +	dma_fence_end_signalling(cookie);
> +}
>
> [...]
>

Kind regards,
Nicolas Frattaroli



