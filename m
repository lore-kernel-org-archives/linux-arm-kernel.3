Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE3CCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcKeHPyKL+a7NSEHR3Dxu6EbaAzxWVsXveyS5MKgZH8=; b=s2o/6vu8RFN4biRdI1qaHfinGR
	lN0+/w5EE5rA8XVe+y1tOTgR82yMzi0wPWYvX5G5F7lQBabq/52ywQ2wPLxBuEqwKu5UyTp+OjG56
	LfAbRXazbXElDcuyre2Ify5ywDsjFdJQpEQ6UpxBjdqVk3HHo9IunJqa3S89hfiEgnV92sl62mPmT
	Eady+OlAkd59H6tdhTkVWB/VQvzEthRYXKoirFXblgxy92LRxBLx71hX73vdNvVyxiK7q5kU+s9NZ
	VgUVCb5Uzmc96J8WHDEfChFxmBV5Nv3dHfsJLS1t/RXPd4fPm68abgFeut+5uZAJzAdJAK4O4s97e
	8nfp62rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOK8-0000000AtrO-2QtV;
	Tue, 19 Aug 2025 15:32:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLWk-0000000ARl8-0BqP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:33:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFC0116A3;
	Tue, 19 Aug 2025 05:33:12 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15C753F63F;
	Tue, 19 Aug 2025 05:33:18 -0700 (PDT)
Date: Tue, 19 Aug 2025 13:33:10 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Junnan Wu <junnan01.wu@samsung.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	florian.fainelli@broadcom.com, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lei19.wang@samsung.com, q1.huang@samsung.com
Subject: Re: [PATCH] firmware: arm_scmi: Set device ready before register
 scmi_virtio_driver
Message-ID: <aKRvBrRstEFDu93g@pluto>
References: <CGME20250812075350epcas5p1cc4533582704978ec3a4a8b73dc1535c@epcas5p1.samsung.com>
 <20250812075343.3201365-1-junnan01.wu@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812075343.3201365-1-junnan01.wu@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_053322_160983_477C0A53 
X-CRM114-Status: GOOD (  24.12  )
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

On Tue, Aug 12, 2025 at 03:53:43PM +0800, Junnan Wu wrote:
> Fix irregularities in scmi driver probe.
> 

Good catch, thanks for this: indeed after the transports have been
converted to modules the probe sequence changed a bit and we cannot
leverage anymore the virtio_device_ready() called by the core in
virtio_dev_probe() since the scmi_vio_probe() does not complete until
the core SCMI stack has probed with scmi_probe() which in turn transmits
the first BASE protocol exchanges.

I did not know about this behaviour of type_1 hyp..

> After 'commit 20bda12a0ea0 ("firmware: arm_scmi: Make VirtIO transport a standalone driver")'
> making SCMI VirtIO transport a standalone driver,
> `scmi_virtio_probe` will follow `scmi_vio_probe`,
> and during `scmi_virtio_probe`, it will do `scmi_probe` which will invoke
> function `scmi_protocol_acquire(handle, SCMI_PROTOCOL_BASE)`,
> and this function will send message via virtqueue and wait device's reply
> 
> Before this patch, only after `scmi_vio_probe`,
> frontend will mark device DRIVER_OK by function `virtio_dev_probe`
> in 'drivers/virtio/virtio.c' itself.
> 
> Accroding to chapter '3.1 Device Initialization' in virtio-spec,
> ```
> The driver MUST NOT send any buffer available notifications
> to the device before setting DRIVER_OK.
> ```
> 
> In some type1-hypervisor, available buffer notifications
> will be intercepted until virtio driver is okay. In this case,
> `scmi_vio_probe` will be blocked at `scmi_wait_for_reply`
> and probe can never complete.
> 
> Therefore, the operation to set DRIVER_OK must follow
> perform device-specific setup immediately,
> then available buffer notifications can be sent in function `scmi_probe`.
> 
> Fixes: 20bda12a0ea0 ("firmware: arm_scmi: Make VirtIO transport a standalone driver")
> Signed-off-by: Junnan Wu <junnan01.wu@samsung.com>
> ---
>  drivers/firmware/arm_scmi/transports/virtio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
> index cb934db9b2b4..326c4a93e44b 100644
> --- a/drivers/firmware/arm_scmi/transports/virtio.c
> +++ b/drivers/firmware/arm_scmi/transports/virtio.c
> @@ -871,6 +871,9 @@ static int scmi_vio_probe(struct virtio_device *vdev)
>  	/* Ensure initialized scmi_vdev is visible */
>  	smp_store_mb(scmi_vdev, vdev);
>  
> +	/* Set device ready */
> +	virtio_device_ready(vdev);
> +
>  	ret = platform_driver_register(&scmi_virtio_driver);
>  	if (ret) {
>  		vdev->priv = NULL;

...also, I suppose, that here nothing is to be done on the error path
regarding the vdedv status, becasue is already taken care in the error
path of virtio_dev_probe()...am I right ? (just confirming..)

Maybe you could simplify a bit the commit message but other than this

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

