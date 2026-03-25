Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083B8FEA83B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/X6OQFIMMVlzQpHVcxvz5zk00vazKEddYu1a8TXBALA=; b=kTPBYyJTZRIomkLwtt7g4h2Fgw
	n+mVMHC4cN5Z7wPovsgxCm9JJ4WfEJaX/IbGAhB+D65hQ0MFlwWSAhtH/iib+tmHPzpvsueT1klF3
	AU9zfgJbvqhOtEJiyQa9qz5tpHcbqoQ0d1eO5cOlikjMrBNTWnmq5WvT7//aQDfe1QnhbDOSsBpQ/
	1NhbJO9lpfkKhnmd2Ds3VWrt9Eh0c8bfOoFBsqhKKqYaYC8l1cOkqgiDZoVZdKQg3l/nPAQg5NZFl
	ip+O+brQd1q1L85sfJJI3h751WqX16NsX5BokpcDhRH8Cr8Ow2gjnmW6y6V/awS/saSxc/JBNxx7M
	LgwfDRzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KaN-000000033gp-1pjP;
	Wed, 25 Mar 2026 09:31:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KaK-000000033gO-3LY7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 09:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774431091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/X6OQFIMMVlzQpHVcxvz5zk00vazKEddYu1a8TXBALA=;
	b=gaDI3sumEOGp2rP7pZMmxbZTCF4V3cV8Ur8Odv3JcuK1LfCmgFNWUJXyA2So4zBRhQuiFJ
	2UrZdeGs75Ghe/6vK7Eo7/a+nqgcc3eNGjCNkj0FG6FzalUMQL8wjaUE8R6QlzRMvGNa3s
	gfIRqXFRDXj80/0q8F+T5SFKNGorwyA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-Lr-spSozN8CIRnLGA6eysQ-1; Wed, 25 Mar 2026 05:29:55 -0400
X-MC-Unique: Lr-spSozN8CIRnLGA6eysQ-1
X-Mimecast-MFC-AGG-ID: Lr-spSozN8CIRnLGA6eysQ_1774430994
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43b47c19ed8so2443158f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 02:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430994; x=1775035794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/X6OQFIMMVlzQpHVcxvz5zk00vazKEddYu1a8TXBALA=;
        b=N10THTb/Fc9Zjeq4RYfFtoAk4puXDlwK/Pr/VgeV9yhebEIa4L/ZnmqThrCX8tiSh/
         hoABkkzu3wCB4XqODV6aJdtZ5dpS6QotULTDgLrigu7M6XoS2jMR1mI9snviaUUpI+Bm
         mDIBQ2MDbz5kPgoVjb8EOPltT41bG3KZA+HljZAxmAmFWw/EQUdkG0Zi1CaI4uqtSGqM
         rSpx5BxlSOwTGSC5WvUSmhmSRI6yT/TYWU3RztByu3ciC+ERWKlyKJ2wzUxYxmrBzzki
         y0Gdpdlg8pjZes3SLtMg3R3ohunK3znyy03BfUoPpn73MNDwdGoFcP1lHcGVuUZYC2AG
         w01w==
X-Forwarded-Encrypted: i=1; AJvYcCVVT5GoarJ5NVt5sUreXtthx6R+cTKRg2KW26ZjrtbBdEl9li52l/sis+TGoQK6a+Fzhb7OkqLD5wHc3vBKGMPb@lists.infradead.org
X-Gm-Message-State: AOJu0YyDVrmicBpgrITI3bbIC3BkBh8t+X9K/OHZSzj6OX8C8PekAycY
	lON7cadjGlZ+oDlXEVzepfij6bmoTsgLPXAEbxxGjSaO4RMcET4PZCho8TQn9sGrSBH89HYfuy8
	LgA+uGLbfN7KgX8jGB02M5SO9TWWiRgL6Vw6DBirpDCv+cX9xSFKJ2+lJYgl0Vx6iEcYRK8BSFv
	hP
X-Gm-Gg: ATEYQzzVql6hkrbDmh7IpzHV+kzAJcM76gaFI+Aix4cPFeh+d8xN1tIVdWECfJ4EgFb
	iZWdg0EmGigVbXk84FHuvFlB4l3ShbZNpxYfHmBnVk26E7E4R1aWg0RqPH7rXRwOUoTfvqWxCZc
	7RyXjs49c21iBITbLobp14CZiQ+eE3S5Jb3Tm8aiyQ9sBVYxaqWDzWSe5zK3qrdCzJjqtSiN7kR
	qAT4lszBkJ2Z5RBrgVTCdP0cCYqaTwxf1qpGzxaCOdZEbEQE9zgPeviDIjjlT+qKf33bZNHGOzY
	8HywLrqFZ1hoQwpurEMqBjOsvyTYfn7okWXoL156MgpbLd4o0zOl/Q6K6AVHcRWRWJGEDaadR7e
	RZ8l4+vB0Zze2BhPk
X-Received: by 2002:a05:6000:400c:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-43b88a3d3cdmr3692810f8f.14.1774430993585;
        Wed, 25 Mar 2026 02:29:53 -0700 (PDT)
X-Received: by 2002:a05:6000:400c:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-43b88a3d3cdmr3692727f8f.14.1774430992928;
        Wed, 25 Mar 2026 02:29:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1525:da00:3ac2:1a22:72ff:4256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470380asm44280922f8f.24.2026.03.25.02.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:29:52 -0700 (PDT)
Date: Wed, 25 Mar 2026 05:29:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Armin Wolf <W_Armin@gmx.de>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Alex Williamson <alex@shazbot.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-spi@vger.kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] treewide: Convert buses to use generic
 driver_override
Message-ID: <20260325052919-mutt-send-email-mst@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9utDYrtPnKlbZlezS4tyFqiJOGaV5RB9qoG42ecbVjc_1774430994
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_023132_933937_28378B02 
X-CRM114-Status: GOOD (  24.46  )
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

On Tue, Mar 24, 2026 at 01:59:04AM +0100, Danilo Krummrich wrote:
> This is the follow-up of the driver_override generalization in [1], converting
> the remaining 11 busses and removing the now-unused driver_set_override()
> helper.
> 
> All of them (except AP, which has a different race condition) are prone to the
> potential UAF described in [2], caused by accessing the driver_override field
> from their corresponding match() callback.
> 
> In order to address this, the generalized driver_override field in struct device
> is protected with a spinlock. The driver-core provides accessors, such as
> device_match_driver_override(), device_has_driver_override() and
> device_set_driver_override(), which all ensure proper locking internally.
> 
> Additionally, the driver-core provides a driver_override flag in struct
> bus_type, which, once enabled, automatically registers generic sysfs callbacks,
> allowing userspace to modify the driver_override field.
> 
> SPI and AP are a bit special; both print "\n" when driver_override is not set,
> whereas all other buses (and thus the driver-core) produce "(null)\n" in this
> case.
> 
> Hence, SPI and AP do not take advantage of the driver_override flag in struct
> bus_type; AP additionally maintains a counter in its custom sysfs store().
> 
> Technically, we could support a custom fallback string when driver_override is
> unset in struct bus_type, but only SPI would benefit from this, since AP has
> additional custom logic in store() anyways.
> 
> (I'm not sure if there are userspace programs that strictly rely on this;
> driverctl seems to check for both, but I rather not break some userspace tool
> I'm not aware of. :)
> 
> This series is based on v7.0-rc5 with no additional dependencies, hence those
> patches can be picked up by subsystems individually.
> 
> [1] https://lore.kernel.org/driver-core/20260303115720.48783-1-dakr@kernel.org/
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=220789
> [3] https://gitlab.com/driverctl/driverctl/-/blob/0.121/driverctl?ref_type=tags#L99

vdpa bits:

Acked-by: Michael S. Tsirkin <mst@redhat.com>

I assume it'll all be merged together?

> Danilo Krummrich (12):
>   amba: use generic driver_override infrastructure
>   bus: fsl-mc: use generic driver_override infrastructure
>   cdx: use generic driver_override infrastructure
>   hv: vmbus: use generic driver_override infrastructure
>   PCI: use generic driver_override infrastructure
>   platform/wmi: use generic driver_override infrastructure
>   rpmsg: use generic driver_override infrastructure
>   vdpa: use generic driver_override infrastructure
>   s390/cio: use generic driver_override infrastructure
>   s390/ap: use generic driver_override infrastructure
>   spi: use generic driver_override infrastructure
>   driver core: remove driver_set_override()
> 
>  drivers/amba/bus.c                 | 37 +++------------
>  drivers/base/driver.c              | 75 ------------------------------
>  drivers/bus/fsl-mc/fsl-mc-bus.c    | 43 +++--------------
>  drivers/cdx/cdx.c                  | 40 ++--------------
>  drivers/hv/vmbus_drv.c             | 36 ++------------
>  drivers/pci/pci-driver.c           | 11 +++--
>  drivers/pci/pci-sysfs.c            | 28 -----------
>  drivers/pci/probe.c                |  1 -
>  drivers/platform/wmi/core.c        | 36 ++------------
>  drivers/rpmsg/qcom_glink_native.c  |  2 -
>  drivers/rpmsg/rpmsg_core.c         | 43 +++--------------
>  drivers/rpmsg/virtio_rpmsg_bus.c   |  1 -
>  drivers/s390/cio/cio.h             |  5 --
>  drivers/s390/cio/css.c             | 34 ++------------
>  drivers/s390/crypto/ap_bus.c       | 34 +++++++-------
>  drivers/s390/crypto/ap_bus.h       |  1 -
>  drivers/s390/crypto/ap_queue.c     | 24 +++-------
>  drivers/spi/spi.c                  | 19 +++-----
>  drivers/vdpa/vdpa.c                | 48 ++-----------------
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c  |  4 +-
>  drivers/vfio/pci/vfio_pci_core.c   |  5 +-
>  drivers/xen/xen-pciback/pci_stub.c |  6 ++-
>  include/linux/amba/bus.h           |  5 --
>  include/linux/cdx/cdx_bus.h        |  4 --
>  include/linux/device/driver.h      |  2 -
>  include/linux/fsl/mc.h             |  4 --
>  include/linux/hyperv.h             |  5 --
>  include/linux/pci.h                |  6 ---
>  include/linux/rpmsg.h              |  4 --
>  include/linux/spi/spi.h            |  5 --
>  include/linux/vdpa.h               |  4 --
>  include/linux/wmi.h                |  4 --
>  32 files changed, 88 insertions(+), 488 deletions(-)
> 
> 
> base-commit: c369299895a591d96745d6492d4888259b004a9e
> -- 
> 2.53.0


