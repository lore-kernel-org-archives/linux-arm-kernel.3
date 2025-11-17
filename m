Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07807CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 15:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Xhol2A/kgX9etCHuPJm5LXqyxoK9jR1M8sz8dG0EFY=; b=MQCbjSUVoYIGa6uB4WsADuD6+W
	gKijqIyncsXioCSKPuoIyYWhh+pyK6PTs433V32C5VZx6RW2jEa/rEkKYOsW5Vuo5kSTUFgXNAMq0
	7MudhRRR8lZi/RLeJ3NavD0CzHyuij6k6Wi5DSKR6N8tei9IX1SOMex9z9vjSeJaEgJftYE0S/RjH
	x1ofeVKGBCWciiXoN3qFkJ73mJGyUO0cKjfQRdbveWZBxMaFX1iVlFoX6g1D+IKhigkt4gLGmPBtZ
	RMJMlsdq5eAc80JT85NtWe6LflYvl5QMti8PQrTDLrv3xfBsSH3Q7sWnMAjcPB6fpNzsu6sJMVNAe
	vDJYRV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0xm-0000000GJf6-2xej;
	Mon, 17 Nov 2025 15:16:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0xk-0000000GJeh-1BwK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 15:16:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA086FEC;
	Mon, 17 Nov 2025 07:16:06 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21BF93F66E;
	Mon, 17 Nov 2025 07:16:14 -0800 (PST)
Date: Mon, 17 Nov 2025 15:16:12 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 09/15] coresight: Save activated path into source
 device
Message-ID: <20251117151612.GP3568724@e132581.arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-9-3d4bba674709@arm.com>
 <24baf1ba-f3a1-4cbe-a942-c5dae7318047@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24baf1ba-f3a1-4cbe-a942-c5dae7318047@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_071616_363255_B26C00D0 
X-CRM114-Status: GOOD (  22.51  )
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

On Tue, Nov 11, 2025 at 02:10:10PM +0000, Suzuki Kuruppassery Poulose wrote:

[...]

> > @@ -399,13 +399,50 @@ int coresight_enable_source(struct coresight_device *csdev,
> >   			    struct perf_event *event, enum cs_mode mode,
> >   			    struct coresight_path *path)
> >   {
> > -	return source_ops(csdev)->enable(csdev, event, mode, path);
> > +	int ret;
> > +
> > +	/*
> > +	 * Record the path in the source device. The path pointer is first
> > +	 * assigned, followed by transitioning from DISABLED mode to an enabled
> > +	 * state on the target CPU. Conversely, during the disable flow, the
> > +	 * device mode is set to DISABLED before the path pointer is cleared.
> > +	 *
> > +	 * This ordering ensures the path pointer to be safely access under the
> > +	 * following race condition:
> > +	 *
> > +	 *  CPU(a)                          CPU(b)
> > +	 *
> > +	 *  coresight_enable_source()
> > +	 *    STORE source->path;
> > +	 *    smp_mb();
> > +	 *    source_ops(csdev)->enable();
> > +	 *                              `-> etm4_enable_sysfs_smp_call()
> > +	 *                                    STORE source->mode;
> > +	 *
> > +	 * This sequence ensures that accessing the path pointer is safe when
> > +	 * the device is in enabled mode.
> > +	 */
> > +	csdev->path = path;
> > +
> > +	/* Synchronization between csdev->path and csdev->mode */
> > +	smp_mb();
> > +
> > +	ret = source_ops(csdev)->enable(csdev, event, mode, path);
> 
> What happens if the csdev is already enabled ? We corrupt the csdev->path ?
> Can we not move this into the source devices and let them
> handle it gracefully, as they do for the "mode" ?

Indeed.  I will move the path setting on the target CPU, along with
setting mode.

> To address James' comment on reusing the sysfs path, I think we could
> make this a global thing for all types of source/mode.

In the previous version, I used a global variable to store path pointer,
but in this version I moved back the path pointer into csdev for two
reasons:

- Except we need to store (per-CPU) ETM's path pointer, we also need
  extra data structure for storing system source.

- For both perf and sysfs sessions, we need to retrieve path pointer
  based on the given source's csdev.  And we need to use the source
  device's mode to decide if the path poiter is valid.

For above reasons, I prefer to store the path pointer into the source
device's csdev - based on the csdev, it is easy to retrieve path pointer,
and it is easy to access the other associated info (mode).

Thanks,
Leo

