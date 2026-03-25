Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D77109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PetZC3qxgw91I7G4PL1kgiG97oaIIgIA0g2FQ1jwb8M=; b=iiSAeIelqsfJiZdyJ3/XcZ7XG5
	rMgKT0hL97WMF6ZKrqQK4kikYMcOVz3xgBFrS8EY7+sSWfYHWOft+9px/pGCVKg1OoY9lUk+Y3fLI
	iGxzqrr39+/bgf2wl3a3x+BQCsaLlnVzyFDOvueiKf69CFR/lAa39avb1kIA6TDmt5Aq6WlDAzQRH
	vFyXi9WGQnvjJtg6Vf8yu/z7a/GpB49cR5eMGh3IsrfJQAfxJLyac2Fa99OANmVQ6ITxYqiW61G7f
	dB8f/ZPXhskkWrPAVnrqQCTkx7KATRKh1U0x31ksjRmwR/aOdjJkLdHjcPrSZn/9CmeUoPQQscSyK
	Vz2yDnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QUO-00000003p3k-2sCV;
	Wed, 25 Mar 2026 15:49:48 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QUL-00000003p0c-0Etm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:49:47 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-66a33f61d80so4392964a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 08:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774453782; cv=none;
        d=google.com; s=arc-20240605;
        b=HSWzHeSu8efLWS7sZtkyx54KU5U43WJSmrCxEfpxe4cHWKJ49yCV/Wyjkvp8Q+0DpW
         nyPOQDJIZf+AneAq0WfxNesb8mYaBttPbiJhoUvgGFduozsVghvVxmqo8/vAu2H+Mwpx
         HGqR1cwEhYZd0oWUMvxoGxkrPmv6ERWb1cmNbzZFNcj1bH9khQ4bUN0bujFPjCy5bxot
         krkq7XJPEbuASOJJhhfRYERwV7WvKrNvuLtFOTuVWoUq2y86k+9nLL59Ro3rQLALwpNX
         j6a0D7l1W8QlWe9dwnsHsVI10OFmOGJ3GjTaWQ3kohtq+AFZde/PF+rkM0Xaku+R9Cxy
         ofUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PetZC3qxgw91I7G4PL1kgiG97oaIIgIA0g2FQ1jwb8M=;
        fh=LmkJyOrHsbKagUDTPwyHPzA5CsK/mSDiQs0XA4rzEYk=;
        b=lZDti9tO4ZemntZ+IB5tZaknYlebvLyaiC66BHEikKkOo5Mk3V1VKr3bRy14GWEMwi
         GGym4fXjMetiju+FM8wUbSkx3V+BnsDBEhH5B77qIw4JalIvDLGzlb96X/s5aVXaayz9
         r7YN4Wv3vLFMGM9sKSrTTHwp+HTwSiRzFC9g87eEjfEe6WZzcMU/b2QQNBpOSU2ETmOp
         6jqDCQ+yh/ymaL5QAQbVnbtBzpSPLBijq4uEcPbXOYCEeYRGt9Kdq1R6VJ30Hz9e3omy
         UewedmDtq5zU0Bko75tLoLTE9OGqA4dA2xgTeUq2fDIlI7jOAtW+MecDjPI4B0Me0vxL
         Wjtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774453782; x=1775058582; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PetZC3qxgw91I7G4PL1kgiG97oaIIgIA0g2FQ1jwb8M=;
        b=acAg8qgl7XNua6VQKmQhCsba7H34a8Dd24QgdH/kKHnIhSm+eycud0zHD3vWA4BIA9
         MI4mXGoaEk1AQddkJqKiZydJ50tOAxQFkb4QGsw+ya/RRkv7KWdsZ62q6s6gduvjo3Cq
         Ln0+k3BDZYRgnDVzxxJx0Ug6/UAcsMIVfu2BGZSDjffVQ9YJH82/h8JO10xnEFJWDIfD
         mYyN+ty/Ikws7nf+kMKziiFtP3SuGB7RdilkDPsRYixrSU+W7U9v3wT2p74whg7jC5fB
         JRL7QA40ErZlJEclg1+9bRE0Kiqq77lgEgHx0wy1Dk5otmwNVVY4cLIAK45k3Cynxhia
         smGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774453782; x=1775058582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PetZC3qxgw91I7G4PL1kgiG97oaIIgIA0g2FQ1jwb8M=;
        b=Q5acLURv7UJv5vAtRy/X5BdPgw8vLR97TyYo52bOYQBOgiICJ2Lhpz511Nl0P4Qvxx
         RLgcXnriSg068R6QMCMqRzvQqGr2SBvbqwwWGa2zccndR35S1qjSAsnXEO9hOUzJoElI
         F7VlTH69ZLr0YKUtT9HR/7aCZtJRMmpDf4rTUk4cSI/nuJb80xg0unaNkZFCU7Wyx0Rn
         WytKdQTA6T3MsET4kOSVlBof7EGUDL8F2vcPE50H6GIvCtxoCXo+iYlpvjGgV6z023/q
         Gl2c0Rd3Qha8+EfV+ZlvesNRbf9KUcncc6h7Cih9Z8xT9xrWE3Kpp8HT4J3qEG+Wx3Ym
         cp3w==
X-Forwarded-Encrypted: i=1; AJvYcCVW4EVBPDltlsjS098MgdaE74qtVg9xWjNgjAyWpgpDzzDayhPB/dxMBtCDq8kX9Gycm+bMmYfZAPAEF1NqyucU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3AZPXh9O2vRXTqVPp6ZQrMRBfLu8zCQ3MgIL9U8E5ExuPoOMI
	230CsFZDToVIBv1iD5M4L7MK36M3g6L2ThdJTChihIY7ot9KN1tGTC63wuL9DoJ3AbjuPvdilng
	RWXof7COr37dwICSVgverE5e46XosEq4eKuNqMMM55A==
X-Gm-Gg: ATEYQzxbPB8N8xGGbApOwRIxJNEHvSD1tTacWmJ6GLcgqi+ovBWqhQiwXegJ7/xUe1s
	XmBJiO96Z4MtdxLd2Lh+HxL2cvpj3wnQgVeYs1efdFNbqJI5da1kZvxrmTGd6EiTrGug/N7C/Ia
	tP44yM6hMHYYyDRT9lItrhjr5zrWe4yJgzEL26hKqv9APJtU+/1oxZRDq9JZ0imH6KMO6SyAGrA
	UjBhf3trZWkYFYV/KeCB/HTGDiwrIWo30hldlENAdRzX8/7UYxKnrVFwzqeIZn4dkNFYgpmR+ze
	OCfVQyj483rGnJkpLMDfdmVBWnZiZwC3rncGpw7Ttg==
X-Received: by 2002:a05:6402:3251:b0:668:368b:38d3 with SMTP id
 4fb4d7f45d1cf-66a82634560mr2196905a12.12.1774453782373; Wed, 25 Mar 2026
 08:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260324005919.2408620-1-dakr@kernel.org> <20260324005919.2408620-8-dakr@kernel.org>
In-Reply-To: <20260324005919.2408620-8-dakr@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 25 Mar 2026 09:49:31 -0600
X-Gm-Features: AQROBzDaUkN0ZNcFR8HLoPUZ0UwwRolGugOyW2ifJVz-O5YTothUc8ZwonnT9P8
Message-ID: <CANLsYkyNx+e=QrSc=ZOqgMcOpwqdpCWsuhrvByJYcXLHPSHMUw@mail.gmail.com>
Subject: Re: [PATCH 07/12] rpmsg: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Armin Wolf <W_Armin@gmx.de>, 
	Bjorn Andersson <andersson@kernel.org>, Vineeth Vijayan <vneethv@linux.ibm.com>, 
	Peter Oberparleiter <oberpar@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>, 
	Mark Brown <broonie@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Alex Williamson <alex@shazbot.org>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-spi@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-arm-kernel@lists.infradead.org, Gui-Dong Han <hanguidong02@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_084945_188212_49059213 
X-CRM114-Status: GOOD (  30.19  )
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

On Mon, 23 Mar 2026 at 19:00, Danilo Krummrich <dakr@kernel.org> wrote:
>
> When a driver is probed through __driver_attach(), the bus' match()
> callback is called without the device lock held, thus accessing the
> driver_override field without a lock, which can cause a UAF.
>
> Fix this by using the driver-core driver_override infrastructure taking
> care of proper locking internally.
>
> Note that calling match() from __driver_attach() without the device lock
> held is intentional. [1]
>
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [1]
> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220789
> Fixes: e95060478244 ("rpmsg: Introduce a driver override mechanism")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c |  2 --

For the below files:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  drivers/rpmsg/rpmsg_core.c        | 43 +++++--------------------------
>  drivers/rpmsg/virtio_rpmsg_bus.c  |  1 -
>  include/linux/rpmsg.h             |  4 ---
>  4 files changed, 7 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 9ef17c2e45b0..e9d1b2082477 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1623,7 +1623,6 @@ static void qcom_glink_rpdev_release(struct device *dev)
>  {
>         struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>
> -       kfree(rpdev->driver_override);
>         kfree(rpdev);
>  }
>
> @@ -1859,7 +1858,6 @@ static void qcom_glink_device_release(struct device *dev)
>
>         /* Release qcom_glink_alloc_channel() reference */
>         kref_put(&channel->refcount, qcom_glink_channel_release);
> -       kfree(rpdev->driver_override);
>         kfree(rpdev);
>  }
>
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 96964745065b..2b9f6d5a9a4f 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -358,33 +358,6 @@ rpmsg_show_attr(src, src, "0x%x\n");
>  rpmsg_show_attr(dst, dst, "0x%x\n");
>  rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
>
> -static ssize_t driver_override_store(struct device *dev,
> -                                    struct device_attribute *attr,
> -                                    const char *buf, size_t count)
> -{
> -       struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> -       int ret;
> -
> -       ret = driver_set_override(dev, &rpdev->driver_override, buf, count);
> -       if (ret)
> -               return ret;
> -
> -       return count;
> -}
> -
> -static ssize_t driver_override_show(struct device *dev,
> -                                   struct device_attribute *attr, char *buf)
> -{
> -       struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> -       ssize_t len;
> -
> -       device_lock(dev);
> -       len = sysfs_emit(buf, "%s\n", rpdev->driver_override);
> -       device_unlock(dev);
> -       return len;
> -}
> -static DEVICE_ATTR_RW(driver_override);
> -
>  static ssize_t modalias_show(struct device *dev,
>                              struct device_attribute *attr, char *buf)
>  {
> @@ -405,7 +378,6 @@ static struct attribute *rpmsg_dev_attrs[] = {
>         &dev_attr_dst.attr,
>         &dev_attr_src.attr,
>         &dev_attr_announce.attr,
> -       &dev_attr_driver_override.attr,
>         NULL,
>  };
>  ATTRIBUTE_GROUPS(rpmsg_dev);
> @@ -424,9 +396,11 @@ static int rpmsg_dev_match(struct device *dev, const struct device_driver *drv)
>         const struct rpmsg_driver *rpdrv = to_rpmsg_driver(drv);
>         const struct rpmsg_device_id *ids = rpdrv->id_table;
>         unsigned int i;
> +       int ret;
>
> -       if (rpdev->driver_override)
> -               return !strcmp(rpdev->driver_override, drv->name);
> +       ret = device_match_driver_override(dev, drv);
> +       if (ret >= 0)
> +               return ret;
>
>         if (ids)
>                 for (i = 0; ids[i].name[0]; i++)
> @@ -535,6 +509,7 @@ static const struct bus_type rpmsg_bus = {
>         .name           = "rpmsg",
>         .match          = rpmsg_dev_match,
>         .dev_groups     = rpmsg_dev_groups,
> +       .driver_override = true,
>         .uevent         = rpmsg_uevent,
>         .probe          = rpmsg_dev_probe,
>         .remove         = rpmsg_dev_remove,
> @@ -560,11 +535,9 @@ int rpmsg_register_device_override(struct rpmsg_device *rpdev,
>
>         device_initialize(dev);
>         if (driver_override) {
> -               ret = driver_set_override(dev, &rpdev->driver_override,
> -                                         driver_override,
> -                                         strlen(driver_override));
> +               ret = device_set_driver_override(dev, driver_override);
>                 if (ret) {
> -                       dev_err(dev, "device_set_override failed: %d\n", ret);
> +                       dev_err(dev, "device_set_driver_override() failed: %d\n", ret);
>                         put_device(dev);
>                         return ret;
>                 }
> @@ -573,8 +546,6 @@ int rpmsg_register_device_override(struct rpmsg_device *rpdev,
>         ret = device_add(dev);
>         if (ret) {
>                 dev_err(dev, "device_add failed: %d\n", ret);
> -               kfree(rpdev->driver_override);
> -               rpdev->driver_override = NULL;
>                 put_device(dev);
>         }
>
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 8d9e2b4dc7c1..e0dacb736ef9 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -373,7 +373,6 @@ static void virtio_rpmsg_release_device(struct device *dev)
>         struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>         struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>
> -       kfree(rpdev->driver_override);
>         kfree(vch);
>  }
>
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index fb7ab9165645..c2e3ef8480d5 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -41,9 +41,6 @@ struct rpmsg_channel_info {
>   * rpmsg_device - device that belong to the rpmsg bus
>   * @dev: the device struct
>   * @id: device id (used to match between rpmsg drivers and devices)
> - * @driver_override: driver name to force a match; do not set directly,
> - *                   because core frees it; use driver_set_override() to
> - *                   set or clear it.
>   * @src: local address
>   * @dst: destination address
>   * @ept: the rpmsg endpoint of this channel
> @@ -53,7 +50,6 @@ struct rpmsg_channel_info {
>  struct rpmsg_device {
>         struct device dev;
>         struct rpmsg_device_id id;
> -       const char *driver_override;
>         u32 src;
>         u32 dst;
>         struct rpmsg_endpoint *ept;
> --
> 2.53.0
>

