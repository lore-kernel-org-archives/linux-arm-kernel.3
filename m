Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DE3D767E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 11:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtDQIZA8lFIOcawM9Mtl32utrKuPTWRX873bVctErJE=; b=3REtv3vuwBJiUwC2JjKN5pe7xD
	BzYjJgSKh0sIeYWNxAuP1Kz2UbbIvxpqmsHeFm+c4oOu79FHPtve34Ymx6HwtGSEIIaDsO0U/8Lk5
	CSRhItEo94jrVwVCiHFkhdXJu7nS7ZgwM5K+UyXesjgeUD3i8jvl8ZQZ345+gp/2mS4OjNy5wN4fB
	+o5CbOZLSDN5FXcnBobo8mxX2tZewkvMfkzGP3kGKVDuJOxRB+uwutzjcbXI9Qk/DrMtD1gapXpQY
	I40mEjZb4Zy+iZYA+o0QIpcog451A25HnPNW0Rjp8fPVI+u0L3fp171MX1EBN9kgsdqbAMiBTDb2D
	UCV9o8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYoE-0000000ACTf-3uMx;
	Fri, 19 Dec 2025 11:38:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYoC-0000000ACTJ-16qd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 11:38:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CC65FEC;
	Fri, 19 Dec 2025 03:37:59 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA68B3F73F;
	Fri, 19 Dec 2025 03:38:05 -0800 (PST)
Date: Fri, 19 Dec 2025 11:38:03 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Ma Ke <make24@iscas.ac.cn>, jie.gan@oss.qualcomm.com,
	james.clark@linaro.org, akpm@linux-foundation.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mathieu.poirier@linaro.org, mike.leach@linaro.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] coresight: etm-perf: Fix reference count leak
 in etm_setup_aux
Message-ID: <20251219113803.GC9788@e132581.arm.com>
References: <f85c7d37-4980-46f0-9136-353a35a8f0ed@oss.qualcomm.com>
 <20251219023949.12699-1-make24@iscas.ac.cn>
 <20251219094141.GA9788@e132581.arm.com>
 <d4946831-fc8c-4727-abec-3edd92e357d1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4946831-fc8c-4727-abec-3edd92e357d1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_033808_361077_6142B0F6 
X-CRM114-Status: GOOD (  16.91  )
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

On Fri, Dec 19, 2025 at 09:59:54AM +0000, Suzuki K Poulose wrote:

[...]

> > diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> > index 0db64c5f4995..2b34f818ba88 100644
> > --- a/drivers/hwtracing/coresight/coresight-platform.c
> > +++ b/drivers/hwtracing/coresight/coresight-platform.c
> > @@ -107,14 +107,16 @@ coresight_find_device_by_fwnode(struct fwnode_handle *fwnode)
> >   	 * platform bus.
> >   	 */
> >   	dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
> > -	if (dev)
> > -		return dev;
> >   	/*
> >   	 * We have a configurable component - circle through the AMBA bus
> >   	 * looking for the device that matches the endpoint node.
> >   	 */
> > -	return bus_find_device_by_fwnode(&amba_bustype, fwnode);
> > +	if (!dev)
> > +		dev = bus_find_device_by_fwnode(&amba_bustype, fwnode);
> > +
> > +	put_device(dev);
> 
> ^^ NAK, see below.
> 
> > +	return dev;
> >   }
> >   /*
> > @@ -274,7 +276,6 @@ static int of_coresight_parse_endpoint(struct device *dev,
> >   	of_node_put(rparent);
> >   	of_node_put(rep);
> > -	put_device(rdev);
> 
> This doesn't look good. We can't use the "dev" reliably without the
> reference count. We are opening up use-after-free.

My understanding is we don't grab a device from
coresight_find_device_by_fwnode().  The callers only check whether the
device is present on the bus; if it isn't, the driver defers probe.

This is similiar to coresight_find_csdev_by_fwnode(), which calls
put_device(dev) to release refcnt immediately.  This is why I
suggested the change, so the two functions behave consistently.

Thanks,
Leo

