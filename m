Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00566C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=Zti1wjO1UjlveyU0dr46ymgnEgQrPxfFkW7q08MyKpY=; b=WVMxGbfQUgUKupG9ZnHVRML8eL
	6Nz7IyE2e0qnNl/7oiw4SOlC9EaxrZFDLl9Gb9m30WZYHwfy6Ufv/5M3aWTJMk/WubBJb/nO7lp5V
	mNnbz0k3lEwj5as6dYwHO0Fv46k0oaCOoHlk8oXoJgAFQHRY1+eDvgwrO+3lW4mblJW/Sp09MxZVT
	GuFOXbW3/xzaes1yQiUQQqs/WTZxErZfiwkljED+gwerBe1IFQgdVO/7H/bMKKceHQqnRwkAk9OcA
	AXSVYsPSlmBpJDaoay86BBMBXNvF1lcmEWPCpovyspSALaCoLztQyOtlxXfNKEipKmBMwO9GT1Hd+
	U/jdQyDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullWx-0000000APle-3AyK;
	Tue, 12 Aug 2025 09:42:57 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljuY-0000000AAu0-1Lvv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 07:59:12 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250812075903epoutp04b971c59a82c9dcf773e32a21c4f528f3~a9g282ych0525005250epoutp04k
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 07:59:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250812075903epoutp04b971c59a82c9dcf773e32a21c4f528f3~a9g282ych0525005250epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754985543;
	bh=Zti1wjO1UjlveyU0dr46ymgnEgQrPxfFkW7q08MyKpY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=r7yb3X2/8+SPzA6B4rLauW2+VJaqMO3XutcJmH4tY0Ja8Yd+/NemxjLIGnI1fAcgV
	 FFwqVnwnj+39mBHd9izfHWiC7Af7nLGOYZsmyJh2ynLWOw473jvGabKTQywG/QkMyC
	 fZj0PLcPzf0VWhLPa7uMZgX0aPwhZq1qTSmksC60=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250812075903epcas5p278fb107a87ca7067f6c307eca48d83b9~a9g2kA0502927829278epcas5p24;
	Tue, 12 Aug 2025 07:59:03 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c1P5x6lpPz2SSKm; Tue, 12 Aug
	2025 07:59:01 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250812075350epcas5p1cc4533582704978ec3a4a8b73dc1535c~a9cTo56871942019420epcas5p1h;
	Tue, 12 Aug 2025 07:53:50 +0000 (GMT)
Received: from asg29.. (unknown [109.105.129.29]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250812075349epsmtip29897c66a9d79b3d305ada139381f8afe~a9cSEItUW1933319333epsmtip2I;
	Tue, 12 Aug 2025 07:53:49 +0000 (GMT)
From: Junnan Wu <junnan01.wu@samsung.com>
To: sudeep.holla@arm.com, cristian.marussi@arm.com
Cc: florian.fainelli@broadcom.com, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lei19.wang@samsung.com, q1.huang@samsung.com, Junnan Wu
	<junnan01.wu@samsung.com>
Subject: [PATCH] firmware: arm_scmi: Set device ready before register
 scmi_virtio_driver
Date: Tue, 12 Aug 2025 15:53:43 +0800
Message-Id: <20250812075343.3201365-1-junnan01.wu@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250812075350epcas5p1cc4533582704978ec3a4a8b73dc1535c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-505,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250812075350epcas5p1cc4533582704978ec3a4a8b73dc1535c
References: <CGME20250812075350epcas5p1cc4533582704978ec3a4a8b73dc1535c@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_005911_014476_8E363F7B 
X-CRM114-Status: GOOD (  14.35  )
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

Fix irregularities in scmi driver probe.

After 'commit 20bda12a0ea0 ("firmware: arm_scmi: Make VirtIO transport a standalone driver")'
making SCMI VirtIO transport a standalone driver,
`scmi_virtio_probe` will follow `scmi_vio_probe`,
and during `scmi_virtio_probe`, it will do `scmi_probe` which will invoke
function `scmi_protocol_acquire(handle, SCMI_PROTOCOL_BASE)`,
and this function will send message via virtqueue and wait device's reply

Before this patch, only after `scmi_vio_probe`,
frontend will mark device DRIVER_OK by function `virtio_dev_probe`
in 'drivers/virtio/virtio.c' itself.

Accroding to chapter '3.1 Device Initialization' in virtio-spec,
```
The driver MUST NOT send any buffer available notifications
to the device before setting DRIVER_OK.
```

In some type1-hypervisor, available buffer notifications
will be intercepted until virtio driver is okay. In this case,
`scmi_vio_probe` will be blocked at `scmi_wait_for_reply`
and probe can never complete.

Therefore, the operation to set DRIVER_OK must follow
perform device-specific setup immediately,
then available buffer notifications can be sent in function `scmi_probe`.

Fixes: 20bda12a0ea0 ("firmware: arm_scmi: Make VirtIO transport a standalone driver")
Signed-off-by: Junnan Wu <junnan01.wu@samsung.com>
---
 drivers/firmware/arm_scmi/transports/virtio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index cb934db9b2b4..326c4a93e44b 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -871,6 +871,9 @@ static int scmi_vio_probe(struct virtio_device *vdev)
 	/* Ensure initialized scmi_vdev is visible */
 	smp_store_mb(scmi_vdev, vdev);
 
+	/* Set device ready */
+	virtio_device_ready(vdev);
+
 	ret = platform_driver_register(&scmi_virtio_driver);
 	if (ret) {
 		vdev->priv = NULL;
-- 
2.34.1


