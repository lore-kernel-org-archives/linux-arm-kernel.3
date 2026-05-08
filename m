Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12142CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0MPf4GQzrmetXU3ob6poQBX+t98+v3GIwAwDsS98W0=; b=jJyMd1nnuHozEgGkMpgQj48Bcr
	82JK9158SKVdr/H93DRnZyuNw8/zHDQ2MNQFqiLfnLK8NWrKfwdrB+J6Pf3nsvO9Ej/o1VcXVCM/O
	9oSLWcZjwZkCYTeHr5Jurvxf+tZ+vZKN+xqDCaJxmfWMdJu8kfY/INR/gDmx47EI4yvz2j1VDvcMa
	MuQlKav+KYracXxCla0KM52JwyMxJNaHn8a3DMJ56mu6Nulsg3DZX9UtJKIKUZZpgBG3qp2hVA4FA
	dw6LW0zXD4yrrUehVlwLJWZ+aFUlkqUZnVhSMIGH1QJNsMJK3l/D0h3ClRdx8LNRSANc5QcTypGAu
	etctqZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPrD-00000007Fdb-3w1f;
	Fri, 08 May 2026 18:23:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPrA-00000007Fck-3w5g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 18:23:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 856464437D;
	Fri,  8 May 2026 18:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5C2C2BCB0;
	Fri,  8 May 2026 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778264603;
	bh=PT33hPVUf3Z1XzPwnKsjfQUflnA93EQa7d+QeZmaP5Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=qpeBLG1TYeibesM13Z5pX3y8bJ4F7lEefoKDKJ4p4ivXV9zAHRU8316aYlrMSo2wS
	 X0RcaKa62KqRQbclf7DUgo5ktHnBasfQ//QtgMlYyVfbeW9xGZY1NgB6taZhGyBTRd
	 X0XvKUG+gwEOLlVuWqjiKoAr1x+u1qZB2IkOZc7yidJIGQa2NL1BmkHuJ71hEUZw57
	 6xwdy3h7Ei19mYCoElxRmfcOw18cTley7QSnipUiQL9Ij0E0WTeHWHUy51tLfkwkDr
	 sBGjJ0xby4ddnQAkxfwrLhy+qC7qKxgRjGhabzAKhPNHs3+pHea3umsqWjiOUJf4fe
	 g7o1Ng220ox/Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 20:23:17 +0200
Message-Id: <DIDI6UCUFTWA.3GANQE923DAP9@kernel.org>
Subject: Re: [PATCH v3 02/13] driver core: Enable suppliers to implement
 fine grained sync_state support
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <driver-core@lists.linux.dev>, <linux-pm@vger.kernel.org>, "Sudeep Holla"
 <sudeep.holla@kernel.org>, "Cristian Marussi" <cristian.marussi@arm.com>,
 "Kevin Hilman" <khilman@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Abel Vesa" <abel.vesa@oss.qualcomm.com>, "Peng
 Fan" <peng.fan@oss.nxp.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maulik Shah"
 <maulik.shah@oss.qualcomm.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
 <20260508123910.114273-3-ulf.hansson@linaro.org>
In-Reply-To: <20260508123910.114273-3-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_112325_029594_FCAE5927 
X-CRM114-Status: GOOD (  15.88  )
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

On Fri May 8, 2026 at 2:38 PM CEST, Ulf Hansson wrote:
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 30b416588617..c8be24af92c3 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -196,6 +196,24 @@ static inline void dev_sync_state(struct device *dev=
)
>  		dev->driver->sync_state(dev);
>  }
> =20
> +static inline bool dev_has_queue_sync_state(struct device *dev)
> +{
> +	struct device_driver *drv;
> +
> +	if (!dev)
> +		return false;
> +	drv =3D READ_ONCE(dev->driver);
> +	if (drv && drv->queue_sync_state)
> +		return true;
> +	return false;
> +}
> +
> +static inline void dev_queue_sync_state(struct device *dev)
> +{

Let's add device_lock_assert(dev), as this function requires it to be held.

> +	if (dev->driver && dev->driver->queue_sync_state)
> +		dev->driver->queue_sync_state(dev);
> +}

<snip>

> @@ -1175,6 +1188,25 @@ static void device_links_flush_sync_list(struct li=
st_head *list,
> =20
>  		put_device(dev);
>  	}
> +
> +	if (!q_list)
> +		return;
> +
> +	list_for_each_entry_safe(dev, tmp, q_list, links.queue_sync) {
> +		list_del_init(&dev->links.queue_sync);

Hm...this is called without the device_links_write_lock() held, so this loo=
ks
like this could this race with the list_del_init() from
device_links_driver_cleanup() and create an infinite loop.

(The other list iterator above might have the same issue.)

> +
> +		if (dev !=3D dont_lock_dev)

This is pre-existing, but I think it would be good to add a device_lock_ass=
ert()
call for this as well.

> +			device_lock(dev);
> +
> +		device_links_write_lock();
> +		dev_queue_sync_state(dev);
> +		device_links_write_unlock();
> +
> +		if (dev !=3D dont_lock_dev)
> +			device_unlock(dev);
> +
> +		put_device(dev);
> +	}
>  }

