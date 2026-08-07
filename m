Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAF7C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEuxmQTnVjhJU7Df2L3KNy3dMjT4Vz37tWHsKItKJRY=; b=cxkDUVZRX7KWz2C23UqMWimogP
	SeF6TXiPG+pP4jwRuaBuWkFAdpO4AwroP++4LHhQ2i1HSKo74UFN+TO5fd5Pfb4C4I0iMCl8mVDg9
	VkiCSDRDOsmp3LrFPNZqyN636qp+PLIew+541x3hCWzK4SZBgIpzGv7RxY4ogTn05Tmh/U3pq4TNA
	tOYjmIKNHGEmJ/riMWqoer/9GXD6R0YB2MUNvnqeKaTxJp3Mee517rKCiljdxHrWq9w8ffToAi6el
	RjfCfmdqEi+3QsF5v0vPdU2ateUTmdUMUds2NKYZ1sttJWA1RIfQgwzsKGv6ZxEh74DcNdNgxjph5
	DRMbHjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGFp-00000007SUX-1ikd;
	Fri, 07 Aug 2026 08:48:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGFn-00000007SUQ-3pcC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dEuxmQTnVjhJU7Df2L3KNy3dMjT4Vz37tWHsKItKJRY=; b=a1FcnngQ+XMrbZXLK7IM/vXkmC
	daJiTvOb8zr5UbnurfDJnizJWVIyvTvv+IrMcabaYYXN0GndM5JqrYqXZ9oI5b9+ZNo94NcpmmFVO
	w67YpANVKIuo/3NIiEFP/0pvN3waqZKAdEHvjh+ILEkVvpwJ5i5yQJRjvABtnFyxFUAC6OcATxMdE
	9vm07fkg2RUyOxwJ8UoJHL1Z4qAqWvMdp6HVqOR49Y81jbQfOpbRji6g+e52L8R1ZK4Ar8O4UjfRN
	0XgYwmlBUTqwNpWXd0c+gp/sPMa9qdcVXOb6+xDCOJZfyyksw2aQJR5Iel8oB2R41VVb2/sL83FY3
	Dt709OEQ==;
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsGFk-0000000CDV1-3Bey
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:48:34 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1786092510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dEuxmQTnVjhJU7Df2L3KNy3dMjT4Vz37tWHsKItKJRY=;
	b=Gv7mV7zB4H3/CeFdDP5fwigh1QVtNacIjYIxlxwC8eAqjAIa8JoG8AcEZU6ACbHkEm5BMw
	5cUvU+Z2mVReQamxY5Zb+390VEXHW+NFu9eGPUtRmv+lBhLrzRLU9sr5pLb0aiVlGT5yd5
	596rol5/tIgzkpV7vF6NsPa+paUbTgmWMXN/DfwFIRy+Gx0M18jcnmQZZ91aLJyLCFM2AD
	0jyCCG0NJHZeXh5nkxquuoPETUe3s6L2QJ3ULAsNQbqdJH4xUOZd+1/eUty1KvvWxCyLae
	3WdpzHI7R0R7+g2D79kTI/WEIqEPSQHjgJxHadmyLPVh3mL9eD8Ynl6feh0tZg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 10:48:00 +0200
Message-Id: <DKIKXY8XZVPF.3RFR4ISK6Y4QX@cknow-tech.com>
Cc: <royalnet026@gmail.com>, <alchark@flipper.net>,
 <chaoyi.chen@rock-chips.com>, <diederik@cknow-tech.com>,
 <dri-devel@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <iommu@lists.linux.dev>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v6 7/9] accel/rocket: add RK3576 NPU (RKNN) support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Jiaxing Hu" <gahing@gahingwoo.com>, <tomeu@tomeuvizoso.net>,
 <heiko@sntech.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <joro@8bytes.org>, <will@kernel.org>,
 <robin.murphy@arm.com>, <ulfh@kernel.org>, <p.zabel@pengutronix.de>,
 <ogabbay@kernel.org>, <zhangqing@rock-chips.com>
References: <20260806063413.350184-1-gahing@gahingwoo.com>
 <20260806063413.350184-8-gahing@gahingwoo.com>
In-Reply-To: <20260806063413.350184-8-gahing@gahingwoo.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094833_266750_3E0BE488 
X-CRM114-Status: GOOD (  43.58  )
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

Hi Jiaxing,

On Thu Aug 6, 2026 at 8:34 AM CEST, Jiaxing Hu wrote:
> The RK3576 has two cores of the same RKNN block and a few platform
> differences:
>
>  - the CBUF (convolution buffer) has its own clock domain, so the core
>    needs six clocks rather than four;
>  - the BIU reset moved into the power domain, leaving one reset here;
>  - the NPU spans two power domains, and a device with more than one is
>    skipped by the driver-core single-domain auto-attach, so the list has
>    to be attached explicitly;
>  - the DPU completion interrupt is armed exactly as on RK3588 but never
>    reaches the GIC. The completion is visible in INTERRUPT_RAW_STATUS,

I don't know if it's relevant, so just a data point:
- RK3588 has Cortex A-76 + A-55, which have an External GICv4
- RK3576 has Cortex A-72 + A-53, which have an External GICv3

>    so sample that from an hrtimer rather than wait for an interrupt that
>    does not come. The interrupt stays armed, and if it ever does arrive
>    the two paths agree on which submit each completion belongs to.
>
> All of it hangs off the soc_data added earlier, so the RK3588 path keeps
> its existing counts and behaviour.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  drivers/accel/rocket/rocket_core.c   |  18 ++++
>  drivers/accel/rocket/rocket_core.h   |  15 ++-
>  drivers/accel/rocket/rocket_device.c |   4 +
>  drivers/accel/rocket/rocket_drv.c    |  10 ++
>  drivers/accel/rocket/rocket_job.c    | 142 ++++++++++++++++++++++++---
>  5 files changed, 174 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/ro=
cket_core.c
> index b202d1581..1c865e247 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -8,6 +8,7 @@
>  #include <linux/err.h>
>  #include <linux/iommu.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> =20
> @@ -21,6 +22,7 @@ int rocket_core_init(struct rocket_core *core)
>  	u32 version;
>  	int err =3D 0;
> =20
> +	/* RK3576 moves the BIU reset into its power domain and takes only srst=
_a. */
>  	core->resets[0].id =3D "srst_a";
>  	core->resets[1].id =3D "srst_h";
>  	err =3D devm_reset_control_bulk_get_exclusive(&pdev->dev, core->soc->nu=
m_resets,
> @@ -32,6 +34,9 @@ int rocket_core_init(struct rocket_core *core)
>  	core->clks[1].id =3D "hclk";
>  	core->clks[2].id =3D "npu";
>  	core->clks[3].id =3D "pclk";
> +	/* RK3576 clocks the CBUF separately; the compute path stalls without t=
hese. */
> +	core->clks[4].id =3D "aclk_cbuf";
> +	core->clks[5].id =3D "hclk_cbuf";
>  	err =3D devm_clk_bulk_get(dev, core->soc->num_clks, core->clks);
>  	if (err)
>  		return dev_err_probe(dev, err, "failed to get clocks for core %d\n", c=
ore->index);
> @@ -69,6 +74,19 @@ int rocket_core_init(struct rocket_core *core)
>  		return err;
>  	}
> =20
> +	/*
> +	 * RK3576 spans two power domains, and a multi-domain device is skipped
> +	 * by the driver-core single-domain auto-attach, so attach the list her=
e.
> +	 */
> +	if (core->soc->multi_power_domain) {
> +		struct dev_pm_domain_list *pd_list;
> +
> +		err =3D devm_pm_domain_attach_list(dev, NULL, &pd_list);
> +		if (err < 0)
> +			return dev_err_probe(dev, err,
> +					     "failed to attach NPU power domains\n");
> +	}
> +
>  	pm_runtime_use_autosuspend(dev);
> =20
>  	/*
> diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/ro=
cket_core.h
> index 0f424bb86..205ff070d 100644
> --- a/drivers/accel/rocket/rocket_core.h
> +++ b/drivers/accel/rocket/rocket_core.h
> @@ -6,6 +6,7 @@
> =20
>  #include <drm/gpu_scheduler.h>
>  #include <linux/clk.h>
> +#include <linux/hrtimer.h>
>  #include <linux/io.h>
>  #include <linux/mutex_types.h>
>  #include <linux/reset.h>
> @@ -29,8 +30,10 @@
> =20
>  /* Per-SoC differences, selected by the of_device_id match data. */
>  struct rocket_soc_data {
> -	unsigned int num_clks;		/* clk_bulk count */
> -	unsigned int num_resets;	/* reset_bulk count */
> +	unsigned int num_clks;		/* clk_bulk count: 4 base, 6 with CBUF */
> +	unsigned int num_resets;	/* reset_bulk count: 2 base, 1 on RK3576 */
> +	bool multi_power_domain;	/* device spans more than one PM domain */
> +	bool poll_completion;		/* completion IRQ never reaches the GIC */
>  };
> =20
>  struct rocket_core {
> @@ -59,6 +62,14 @@ struct rocket_core {
>  		atomic_t pending;
>  	} reset;
> =20
> +	struct hrtimer poll_timer;
> +	struct work_struct poll_work;
> +	atomic_t poll_active;
> +	unsigned int poll_ticks;
> +	unsigned int poll_seq;
> +	unsigned int poll_work_seq;
> +	bool poll_dying;
> +
>  	struct drm_gpu_scheduler sched;
>  	u64 fence_context;
>  	u64 emit_seqno;
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/=
rocket_device.c
> index 46e6ee1e7..bfb00f967 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -31,6 +31,10 @@ struct rocket_device *rocket_device_init(struct platfo=
rm_device *pdev,
>  		if (of_device_is_available(core_node))
>  			num_cores++;
> =20
> +	for_each_compatible_node(core_node, NULL, "rockchip,rk3576-rknn-core")
> +		if (of_device_is_available(core_node))
> +			num_cores++;
> +
>  	rdev->cores =3D devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_=
KERNEL);
>  	if (!rdev->cores)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/roc=
ket_drv.c
> index 6e7dc91c5..7f7dfa374 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -217,10 +217,20 @@ static void rocket_remove(struct platform_device *p=
dev)
>  static const struct rocket_soc_data rk3588_soc_data =3D {
>  	.num_clks =3D 4,
>  	.num_resets =3D 2,
> +	.multi_power_domain =3D false,
> +	.poll_completion =3D false,
> +};
> +
> +static const struct rocket_soc_data rk3576_soc_data =3D {
> +	.num_clks =3D 6,
> +	.num_resets =3D 1,
> +	.multi_power_domain =3D true,
> +	.poll_completion =3D true,
>  };

You should not modify the rk3588_soc_data while adding rk3576_soc_data in
the same commit. Extending the _soc_data should be done on its own.

> =20
>  static const struct of_device_id dt_match[] =3D {
>  	{ .compatible =3D "rockchip,rk3588-rknn-core", .data =3D &rk3588_soc_da=
ta },
> +	{ .compatible =3D "rockchip,rk3576-rknn-core", .data =3D &rk3576_soc_da=
ta },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index aa26e2977..c5f91f4c5 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/rocket_accel.h>
> +#include <linux/hrtimer.h>
>  #include <linux/interrupt.h>
>  #include <linux/overflow.h>
>  #include <linux/iommu.h>
> @@ -21,6 +22,15 @@
> =20
>  #define JOB_TIMEOUT_MS 500
> =20
> +/*
> + * RK3576 arms the same DPU completion as RK3588, but the interrupt neve=
r
> + * reaches the GIC. The completion itself is visible in INTERRUPT_RAW_ST=
ATUS,
> + * so sample that instead. The tick cap bounds jobs that never raise it =
at all,
> + * which is the same open problem as the wrong inference results.
> + */
> +#define RK3576_POLL_INTERVAL_NS	1000000LL	/* 1 ms */
> +#define RK3576_POLL_MAX_TICKS	8
> +
>  static struct rocket_job *
>  to_rocket_job(struct drm_sched_job *sched_job)
>  {
> @@ -151,6 +161,14 @@ static void rocket_job_hw_submit(struct rocket_core =
*core, struct rocket_job *jo
> =20
>  	rocket_pc_writel(core, OPERATION_ENABLE, PC_OPERATION_ENABLE_OP_EN(1));
> =20
> +	if (core->soc->poll_completion) {
> +		core->poll_ticks =3D 0;
> +		WRITE_ONCE(core->poll_seq, core->poll_seq + 1);
> +		atomic_set(&core->poll_active, 1);
> +		hrtimer_start(&core->poll_timer, ns_to_ktime(RK3576_POLL_INTERVAL_NS),
> +			      HRTIMER_MODE_REL);
> +	}
> +
>  	dev_dbg(core->dev, "Submitted regcmd at 0x%llx to core %d", task->regcm=
d, core->index);
>  }
> =20
> @@ -341,30 +359,108 @@ static struct dma_fence *rocket_job_run(struct drm=
_sched_job *sched_job)
>  	return ERR_PTR(ret);
>  }
> =20
> +static enum hrtimer_restart rocket_poll_timer_fn(struct hrtimer *timer)
> +{
> +	struct rocket_core *core =3D container_of(timer, struct rocket_core, po=
ll_timer);
> +	u32 raw;
> +
> +	if (!atomic_read(&core->poll_active))
> +		return HRTIMER_NORESTART;
> +
> +	WRITE_ONCE(core->poll_work_seq, READ_ONCE(core->poll_seq));
> +
> +	raw =3D rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
> +	if ((raw & (PC_INTERRUPT_RAW_STATUS_DPU_0 | PC_INTERRUPT_RAW_STATUS_DPU=
_1)) ||
> +	    ++core->poll_ticks >=3D RK3576_POLL_MAX_TICKS) {
> +		atomic_set(&core->poll_active, 0);
> +		schedule_work(&core->poll_work);
> +		return HRTIMER_NORESTART;
> +	}
> +
> +	hrtimer_forward_now(timer, ns_to_ktime(RK3576_POLL_INTERVAL_NS));
> +	return HRTIMER_RESTART;
> +}
> +
> +/* Start the job's next task, or retire it. Caller holds job_lock. */
> +static void rocket_job_next_locked(struct rocket_core *core)
> +{
> +	lockdep_assert_held(&core->job_lock);
> +
> +	if (!core->in_flight_job)
> +		return;
> +
> +	if (core->in_flight_job->next_task_idx < core->in_flight_job->task_coun=
t) {
> +		rocket_job_hw_submit(core, core->in_flight_job);
> +		return;
> +	}
> +
> +	iommu_detach_group(NULL, iommu_group_get(core->dev));
> +	dma_fence_signal(core->in_flight_job->done_fence);
> +	pm_runtime_put_autosuspend(core->dev);
> +	core->in_flight_job =3D NULL;
> +}
> +
> +static void rocket_poll_work_fn(struct work_struct *work)
> +{
> +	struct rocket_core *core =3D container_of(work, struct rocket_core, pol=
l_work);
> +
> +	pm_runtime_mark_last_busy(core->dev);
> +
> +	scoped_guard(mutex, &core->job_lock) {
> +		/*
> +		 * The interrupt can land while this work is queued, retire the job
> +		 * and start the next task. poll_seq only advances under job_lock,
> +		 * in hw_submit, so comparing it here says whether that happened.
> +		 */
> +		if (READ_ONCE(core->poll_dying) ||
> +		    READ_ONCE(core->poll_work_seq) !=3D core->poll_seq)
> +			return;
> +
> +		/*
> +		 * Unlike an interrupt there is no hardware condition to ack here,
> +		 * so with no job in flight there is nothing to write, and the
> +		 * device may have autosuspended underneath this work already.
> +		 */
> +		if (!core->in_flight_job)
> +			return;
> +
> +		rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
> +		rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
> +
> +		rocket_job_next_locked(core);
> +	}
> +}
> +
>  static void rocket_job_handle_irq(struct rocket_core *core)
>  {
> +	unsigned int seq =3D 0;
> +
> +	if (core->soc->poll_completion) {
> +		seq =3D READ_ONCE(core->poll_seq);
> +		atomic_set(&core->poll_active, 0);
> +		hrtimer_cancel(&core->poll_timer);
> +	}
> +
>  	pm_runtime_mark_last_busy(core->dev);
> =20
>  	scoped_guard(mutex, &core->job_lock) {
>  		/*
> -		 * Stopping the block belongs under the lock. hw_submit() writes
> -		 * OPERATION_ENABLE too, and outside the lock this zero can land
> -		 * after that one and kill a task that has only just started.
> +		 * Stopping the block belongs under the lock. A submit from the
> +		 * other completion path writes OPERATION_ENABLE too, and outside
> +		 * the lock this zero can land after that one and kill a task that
> +		 * has only just started.
>  		 */

You're modifying a comment which you added in patch 6/9 ...

>  		rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
>  		rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
> =20
> -		if (core->in_flight_job) {
> -			if (core->in_flight_job->next_task_idx < core->in_flight_job->task_co=
unt) {
> -				rocket_job_hw_submit(core, core->in_flight_job);
> -				return;
> -			}
> +		/*
> +		 * Where both completion paths are live, one whose submit the other
> +		 * has already retired must not go on to start a further task.
> +		 */
> +		if (core->soc->poll_completion && seq !=3D core->poll_seq)
> +			return;
> =20
> -			iommu_detach_group(NULL, iommu_group_get(core->dev));
> -			dma_fence_signal(core->in_flight_job->done_fence);
> -			pm_runtime_put_autosuspend(core->dev);
> -			core->in_flight_job =3D NULL;
> -		}
> +		rocket_job_next_locked(core);

... while also changing its implementation ... in a commit which should
'just' add support for RK3576's NPU. Don't combine separate things in one
commit which do not belong together (in a single commit).

Cheers,
  Diederik

>  	}
>  }
> =20
> @@ -466,6 +562,11 @@ int rocket_job_init(struct rocket_core *core)
>  	int ret;
> =20
>  	INIT_WORK(&core->reset.work, rocket_reset_work);
> +	INIT_WORK(&core->poll_work, rocket_poll_work_fn);
> +	hrtimer_setup(&core->poll_timer, rocket_poll_timer_fn, CLOCK_MONOTONIC,
> +		      HRTIMER_MODE_REL);
> +	atomic_set(&core->poll_active, 0);
> +	core->poll_dying =3D false;
>  	spin_lock_init(&core->fence_lock);
>  	mutex_init(&core->job_lock);
> =20
> @@ -507,8 +608,23 @@ int rocket_job_init(struct rocket_core *core)
> =20
>  void rocket_job_fini(struct rocket_core *core)
>  {
> +	/*
> +	 * Stop the poll from starting hardware work before tearing anything
> +	 * down: it submits the next task, and drm_sched_fini() does not wait
> +	 * for work already queued. Cancel after the scheduler is gone, so a
> +	 * job running now cannot re-arm the timer behind the cancel.
> +	 */
> +	if (core->soc->poll_completion)
> +		WRITE_ONCE(core->poll_dying, true);
> +
>  	drm_sched_fini(&core->sched);
> =20
> +	if (core->soc->poll_completion) {
> +		atomic_set(&core->poll_active, 0);
> +		hrtimer_cancel(&core->poll_timer);
> +		cancel_work_sync(&core->poll_work);
> +	}
> +
>  	cancel_work_sync(&core->reset.work);
>  	destroy_workqueue(core->reset.wq);
>  }



