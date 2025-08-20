Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C67CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 01:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCYIQyAJiOuaJphtdWGWzF82otRQ8kALPJ+EqpjWN7Q=; b=mxQwBuxMpE2AAyo9g9QsJ7sX7y
	YEHvuypl6dMGCg7G0/t6+JfOL3hly2ng343St4o9gRNMVNJne+J43bdEtbFZ7+ZIM3UYCxBpS2w3q
	PueDyzVgpEBGPbcauLeQcA8ddvDyeEJjoD9shemIEoTuiqWxTdbt+07oj2wbYeZqDWIqlonjr0Sw3
	Pio4b+MX/QHLaDrqswjYxJvXOzhTM4ElNtsHypYsjxLItrRCHm7gw41wdH2UzNZfYt5pc8faa/Thb
	UFM9aXgXaIxZDEiJpaDs7b4Ly6vTJlHvh6yiPnT60eVlynswe5u8r5wuSNgB8fMRF8eUuvu7igKmM
	PXG3rElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXIB-0000000C28K-2xXb;
	Wed, 20 Aug 2025 01:07:07 +0000
Received: from [203.254.224.24] (helo=mailout1.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXFU-0000000C1Li-14vD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 01:04:23 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250820010415epoutp01853614603abe42eca11a235d59f394b3~dVA9xQMK80613206132epoutp01C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 01:04:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250820010415epoutp01853614603abe42eca11a235d59f394b3~dVA9xQMK80613206132epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755651855;
	bh=wCYIQyAJiOuaJphtdWGWzF82otRQ8kALPJ+EqpjWN7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NaSh+1mHnQJ7DQvMWUa6/oP8gJoltp4WjdmSBC1Nf7PqxkFgQW3QtUGkkRzTKGPNb
	 wYxzB0US4UkynuSuawqw2QQ3dbqkPgs311SQFyNcYd/dwTyLAHBJf/hTMJ21RsxwR+
	 JtuM1YEts1G+TwP+B5iXdPTxNY8xiNlwcJozeVZ4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250820010414epcas5p356a261c56c6abec8b7ad1a7da685b96c~dVA9SoAza3019030190epcas5p3l;
	Wed, 20 Aug 2025 01:04:14 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c67Wd2V4Lz6B9m8; Wed, 20 Aug
	2025 01:04:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250820010117epcas5p462384377e138058d135512d8ba7438b8~dU_X-HyQC2623726237epcas5p4q;
	Wed, 20 Aug 2025 01:01:17 +0000 (GMT)
Received: from asg29.. (unknown [109.105.129.29]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250820010116epsmtip29c2f7588133ceb28a37e6f9572b5de6a~dU_XDNn6x2090820908epsmtip2f;
	Wed, 20 Aug 2025 01:01:15 +0000 (GMT)
From: Junnan Wu <junnan01.wu@samsung.com>
To: cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org, florian.fainelli@broadcom.com,
	junnan01.wu@samsung.com, lei19.wang@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	q1.huang@samsung.com, sudeep.holla@arm.com
Subject: Re: [PATCH] firmware: arm_scmi: Set device ready before register
 scmi_virtio_driver
Date: Wed, 20 Aug 2025 09:01:23 +0800
Message-Id: <20250820010123.64603-1-junnan01.wu@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aKRvBrRstEFDu93g@pluto>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250820010117epcas5p462384377e138058d135512d8ba7438b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-505,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250820010117epcas5p462384377e138058d135512d8ba7438b8
References: <aKRvBrRstEFDu93g@pluto>
	<CGME20250820010117epcas5p462384377e138058d135512d8ba7438b8@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_180420_960762_2D09C552 
X-CRM114-Status: GOOD (  34.84  )
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

On Tue, 19 Aug 2025 13:33:10 +0100, Cristian Marussi wrote:
> On Tue, Aug 12, 2025 at 03:53:43PM +0800, Junnan Wu wrote:
> > Fix irregularities in scmi driver probe.
> > 
> 
> Good catch, thanks for this: indeed after the transports have been
> converted to modules the probe sequence changed a bit and we cannot
> leverage anymore the virtio_device_ready() called by the core in
> virtio_dev_probe() since the scmi_vio_probe() does not complete until
> the core SCMI stack has probed with scmi_probe() which in turn transmits
> the first BASE protocol exchanges.
> 
> I did not know about this behaviour of type_1 hyp..

It's our local hyp, which intercepts notification until driver is ready.
That helps us to find this irregularity. I think you can ignore this.

> 
> > After 'commit 20bda12a0ea0 ("firmware: arm_scmi: Make VirtIO transport a standalone driver")'
> > making SCMI VirtIO transport a standalone driver,
> > `scmi_virtio_probe` will follow `scmi_vio_probe`,
> > and during `scmi_virtio_probe`, it will do `scmi_probe` which will invoke
> > function `scmi_protocol_acquire(handle, SCMI_PROTOCOL_BASE)`,
> > and this function will send message via virtqueue and wait device's reply
> > 
> > Before this patch, only after `scmi_vio_probe`,
> > frontend will mark device DRIVER_OK by function `virtio_dev_probe`
> > in 'drivers/virtio/virtio.c' itself.
> > 
> > Accroding to chapter '3.1 Device Initialization' in virtio-spec,
> > ```
> > The driver MUST NOT send any buffer available notifications
> > to the device before setting DRIVER_OK.
> > ```
> > 
> > In some type1-hypervisor, available buffer notifications
> > will be intercepted until virtio driver is okay. In this case,
> > `scmi_vio_probe` will be blocked at `scmi_wait_for_reply`
> > and probe can never complete.
> > 
> > Therefore, the operation to set DRIVER_OK must follow
> > perform device-specific setup immediately,
> > then available buffer notifications can be sent in function `scmi_probe`.
> > 
> > Fixes: 20bda12a0ea0 ("firmware: arm_scmi: Make VirtIO transport a standalone driver")
> > Signed-off-by: Junnan Wu <junnan01.wu@samsung.com>
> > ---
> >  drivers/firmware/arm_scmi/transports/virtio.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
> > index cb934db9b2b4..326c4a93e44b 100644
> > --- a/drivers/firmware/arm_scmi/transports/virtio.c
> > +++ b/drivers/firmware/arm_scmi/transports/virtio.c
> > @@ -871,6 +871,9 @@ static int scmi_vio_probe(struct virtio_device *vdev)
> >  	/* Ensure initialized scmi_vdev is visible */
> >  	smp_store_mb(scmi_vdev, vdev);
> >  
> > +	/* Set device ready */
> > +	virtio_device_ready(vdev);
> > +
> >  	ret = platform_driver_register(&scmi_virtio_driver);
> >  	if (ret) {
> >  		vdev->priv = NULL;
> 
> ...also, I suppose, that here nothing is to be done on the error path
> regarding the vdedv status, becasue is already taken care in the error
> path of virtio_dev_probe()...am I right ? (just confirming..)
> 

Yes you are right, I also checked it, error is handled by `virtio_dev_probe`

> Maybe you could simplify a bit the commit message but other than this
> 
> LGTM.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Tested-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Thanks,
> Cristian

Thanks for your kindly review!
BRs
Junnan Wu

