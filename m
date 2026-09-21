Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB78C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLQVaPaIz4Oo4ECfSXhlQRNeQ/Xty59vDImusrSG7WE=; b=zdUSf0Zvp4tOdrUVFENiylZIhz
	zQTS8ML1pQlyJ7ZWkrK5036/4PhuUuUYItQd6oi3XeDUZoEoxMgUDJLAri6tBh5aH0pM27Mev5V8q
	k9NDMj3qs/HRPk1FDOR3IMowpT8JRfaHh2XOOhV8iR7ehf62eG5CbHPQJ5uFeJrcaLuxdLkFamhRb
	SUIe5T6o1FQS3yvAR8QH6/e5lYpsxdte2dDOOzwuaQ+JUOq59hO25W8UhJIKoRrfOdlTYYi8IPzuR
	rG3rBOfHCBGfZvlTIG8jMZc7LSJnrvTuGgKpAsTdWPeFmdMr14YvCmMjNZIjT+YqeY89Q2NgcYu1q
	N+adUkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k5T-00000003H7J-3SCF;
	Mon, 21 Sep 2026 19:54:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k5S-00000003H73-3Mnz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:54:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C6F1860008;
	Mon, 21 Sep 2026 19:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F731F000FF;
	Mon, 21 Sep 2026 19:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020441;
	bh=VLQVaPaIz4Oo4ECfSXhlQRNeQ/Xty59vDImusrSG7WE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PrqXoQT9JUH+Mt5DFo6jb5wNRcLao0KYZs4UJcMxZxkt4Mb/I6kA/cLCJ0Z4eaKo8
	 QV1DK5ofiscj7r2qd6/WWmuWxwzuSd7lpodpOJczVDJ6aqpdJtKqlgnGJy42tXSNpW
	 aOG3E1Sfr9uRcYZOcuf8JXEw11WqTYa9fgjYb0U7tME2kreOUZTHEWqmUenZEvgMqt
	 +Elk1cUTempX8d359+DG1J5/V8f7URIutfbo/I6klwDxLP8ikFF0c57d5jDGviLwRl
	 sxMv/Vm8blNpy6V/NvKXVlDMGIrRoGbvRnisjrRLGXeLErGUU/sO0LvFrCWNZE6SfN
	 DvFbfWp9XtIbQ==
Subject: Re: [PATCH net] net: ti: icss-iep: Cancel compare work before
 releasing device resources
From: netdev-bot+sashiko@kernel.org
To: mhun512@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, diogo.ivo@siemens.com, stable@vger.kernel.org,
 ae878000@gmail.com
Date: Mon, 21 Sep 2026 19:54:00 +0000
Message-ID: <179002044036.2160803.17680070427629412173@kernel.org>
In-Reply-To: <20260917193847.63849-1-mhun512@gmail.com>
References: <20260917193847.63849-1-mhun512@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 (2) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Incomplete fix: the compare work is still not drained before the
  PTP clock it uses is torn down.

Pre-existing issues:
- [High] Deadlock: `icss_iep_pps_enable()`
  (drivers/net/ethernet/ti/icssg/icss_iep.c:579-618) calls…
- [High] Fix scope is narrower than the commit message implies: detach of
  the icss-iep device remains fundamentally unsafe.

--

net: ti: icss-iep: Cancel compare work before releasing device resources

The patch moves the iep_cap_cmp IRQ request in icss_iep_probe() to after the
platform data and regmap are set up, and switches the compare work from
INIT_WORK() to devm_work_autocancel() so that devres frees the IRQ, then
cancels the work, before the rest of the devm resources are released.

No Link: tags in the commit header.

> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
> index ec085897edf09..fa45538f1faa6 100644
> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c

[ ... ]

> @@ -895,9 +884,24 @@ static int icss_iep_probe(struct platform_device *pdev)
>  
>  	iep->ptp_info = icss_iep_ptp_info;
>  	mutex_init(&iep->ptp_clk_mutex);
> -	dev_set_drvdata(dev, iep);
>  	icss_iep_disable(iep);
>  
> +	if (irq > 0) {
> +		ret = devm_work_autocancel(dev, &iep->work, icss_iep_cap_cmp_work);
> +		if (ret)
> +			return ret;

[Severity: High]

Does this cover the teardown path that actually releases the resource the
worker touches?  devm_work_autocancel() only drains the work when devres
runs, i.e. at icss-iep driver detach.  The resource the worker dereferences,
iep->ptp_clock, is released much earlier by icss_iep_exit(), which the
consumer calls on interface stop while the icss-iep device stays bound:

drivers/net/ethernet/ti/icssg/icssg_prueth.c:prueth_emac_common_stop() {
	...
	icss_iep_exit(emac->iep);
	...
}

icss_iep_exit() drops the clock first and only then looks at the enable
state:

int icss_iep_exit(struct icss_iep *iep)
{
	if (iep->ptp_clock) {
		ptp_clock_unregister(iep->ptp_clock);
		iep->ptp_clock = NULL;
	}
	icss_iep_disable(iep);

	if (iep->pps_enabled)
		icss_iep_pps_enable(iep, false);
	else if (iep->perout_enabled)
		icss_iep_perout_enable(iep, NULL, false);

	return 0;
}

icss_iep_perout_enable() has no cancel_work_sync(), so on the perout branch
the work is never drained here at all.

Meanwhile icss_iep_cap_cmp_irq() keeps queueing while either flag is set:

	if (iep->pps_enabled || iep->perout_enabled)
		schedule_work(&iep->work);

and icss_iep_cap_cmp_work() uses the pointer unconditionally:

	pevent.pps_times.ts_real = ns_to_timespec64(ns);
	pevent.type = PTP_CLOCK_PPSUSR;
	pevent.index = 0;
	ptp_clock_event(iep->ptp_clock, &pevent);

For PTP_CLOCK_PPSUSR, ptp_clock_event() reads ptp->pps_source and hands it
to pps_event(), which dereferences it without a NULL check.

So with PEROUT enabled on /dev/ptpN and a CMP1 interrupt already having
queued the work, can an ifdown reach ptp_clock_event() with iep->ptp_clock
already NULL (or pointing at the just-unregistered clock)?  Would stopping
event production, synchronizing the IRQ and draining the work before
ptp_clock_unregister() in icss_iep_exit() be the placement that closes the
window described in the commit message?

> +
> +		ret = devm_request_irq(dev, irq, icss_iep_cap_cmp_irq,
> +				       IRQF_TRIGGER_HIGH, "iep_cap_cmp", iep);
> +		if (ret)
> +			dev_info(iep->dev, "cap_cmp irq request failed: %x\n",
> +				 ret);
> +		else
> +			iep->cap_cmp_irq = irq;
> +	}
> +
> +	dev_set_drvdata(dev, iep);
> +
>  	return 0;
>  }

[Severity: High]

This is a pre-existing issue and not introduced by this patch, but since the
patch adds a second cancel site for the same work, it may be worth looking
at the existing one in icss_iep_pps_enable().

The disable branch calls cancel_work_sync() with ptp_clk_mutex still held,
as the mutex is only dropped at the exit label:

static int icss_iep_pps_enable(struct icss_iep *iep, int on)
{
	...
	mutex_lock(&iep->ptp_clk_mutex);
	...
	} else {
		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
		if (iep->cap_cmp_irq)
			cancel_work_sync(&iep->work);
	}
	...
exit:
	mutex_unlock(&iep->ptp_clk_mutex);

and the work handler takes the same mutex as its first action:

static void icss_iep_cap_cmp_work(struct work_struct *work)
{
	...
	mutex_lock(&iep->ptp_clk_mutex);

If the work was already queued by an earlier CMP1 interrupt and is blocked
on mutex_lock(&iep->ptp_clk_mutex), can cancel_work_sync() then wait
forever for a worker that is waiting for the lock the canceller holds?

Disabling the compare hardware just before the cancel narrows the window,
but does it close it for a work item that is already queued or running?

[Severity: High]

This is also a pre-existing gap rather than something this patch introduces,
but the commit message frames the change as making driver detach safe, so
the scope may be worth clarifying for stable backporters.

icss_iep_driver has no .remove callback:

static struct platform_driver icss_iep_driver = {
	.driver = {
		.name = "icss-iep",
		.of_match_table = icss_iep_of_match,
	},
	.probe = icss_iep_probe,
};

and icss_iep_get_idx() hands the devm-allocated iep out to the consumer
while only taking a device reference:

	pdev = of_find_device_by_node(iep_np);
	...
	iep = platform_get_drvdata(pdev);
	...
	iep->client_np = np;

Nothing there pins the icss-iep driver, so on a sysfs unbind while prueth is
still bound, devres frees iep and unmaps iep->base while the PTP clock
registered from &iep->ptp_info in icss_iep_init() is still registered, and
while prueth still calls icss_iep_exit()/icss_iep_get_count_*() on that
pointer.  After unbind, does a PHC ioctl such as icss_iep_ptp_gettimeex()
still reach container_of(ptp_info) on freed memory and readl() on the
unmapped window?

Should the commit message say that the change drains the work item only, and
that unbind of the icss-iep device remains unsafe for other reasons?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917193847.63849-1-mhun512%40gmail.com

