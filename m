Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE11CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kx/Vc9v/6c/HsuODqHtrzRVp+1SNqALEPtEmraNOycU=; b=X+E5QOpCfqG3nIeotNJQ10SUvW
	4GPeLeuaAknEjyLhXv++OUt4osHL+468e2oNvEDV8XdfLxB4bSP3+7jf4yTpho1mKQw7S30j1AMEV
	hizL3kjHeUQFoSouxgTLBftZfWzW7QZ6ePQWu3OOgN7gInk4zt7X7AaWVdtkknkw+zq20T28KzYqq
	pQYK2Wpsg/OC6WqAe+tJQdfjS3XPeTmRgTZqhe/H7E/peJrK3kdq+MLA8omTzFsP9jlZ1xJq0Nta6
	vB2a/WmaI9oRbWbpSPYgxKc3pdYz6YlwDVZU7vX1JT5pWhToyGQ2FwP0W7GquGAUlza8b8M2X7z+w
	fZ3aMxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloEm-0000000Ahtw-2fH9;
	Tue, 12 Aug 2025 12:36:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulk2i-0000000ACTf-33p7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 08:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kx/Vc9v/6c/HsuODqHtrzRVp+1SNqALEPtEmraNOycU=; b=J2iZcBw0KeRjR72H0haTwA+Ys+
	e6FKgQW9c9uKxsEaOaNl8i5i8uo0G6bFTKMi+y0iOnc/arC5AlSt9J8li7kj3FJimYuBhoMVH8NoF
	srncjU21NL6LB4YwcnlH2W1tFJCgtxw6Qa1bASFwCqw7fANq+GxN/2CFpxddpeYDP53B4TbxjwjIR
	Zk0FAj9XE7j+6BGCaevUwgHmJ1SZeBZh5M4xjvES4K0Zt9ZMr3kt6VtuxcUrJ7Af2o0/sJYrrM3V8
	q4h/e/Dc2/HnY2L1bPXYiLe2amrgDbYsHpo6df/Ugjq9bKxrZ+9PRDXZe+mzvkN1EQnZoFwZoobih
	kTucSYng==;
Received: from m16.mail.163.com ([117.135.210.4])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulk2e-0000000Fk7H-2BN2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=kx/Vc9v/6c/HsuODqHtrzRVp+1SNqALEPtEmraNOycU=;
	b=bRhnPduqk3tFtRBIiU1PApXQCsCKdFzT50kUKYpZgox2EF9B0gI5cR58IkH11k
	fu2W2nCPS94gjrF246BM4WXff7De5+JE2FKB1RnCcobGviP6thGq7PASNZJY11XY
	6O6O+NZRTCeAE2qJZ+fysovaBhGhiLAZr2nlmcgU2kUAc=
Received: from root (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBHZSQZ9ppoCK65Aw--.24679S3;
	Tue, 12 Aug 2025 16:06:52 +0800 (CST)
From: <yizhijiao2025@163.com>
To: "'Junnan Wu'" <junnan01.wu@samsung.com>,
	<sudeep.holla@arm.com>,
	<cristian.marussi@arm.com>
Cc: <florian.fainelli@broadcom.com>,
	<arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<lei19.wang@samsung.com>,
	<q1.huang@samsung.com>
References: <CGME20250812075350epcas5p1cc4533582704978ec3a4a8b73dc1535c@epcas5p1.samsung.com> <20250812075343.3201365-1-junnan01.wu@samsung.com>
In-Reply-To: <20250812075343.3201365-1-junnan01.wu@samsung.com>
Subject: =?utf-8?Q?=E5=9B=9E=E5=A4=8D:_=5BPATCH=5D_firmware:_arm=5Fscmi:_?=
	=?utf-8?Q?Set_device_ready_before_register?=
	=?utf-8?Q?_scmi=5Fvirtio=5Fdriver?=
Date: Tue, 12 Aug 2025 16:06:51 +0800
Message-ID: <00e501dc0b60$0f965a70$2ec30f50$@163.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHpA3ghvbQLx5bOGmQsVb61YIAsWwIYH9intDP4LmA=
Content-Language: zh-cn
X-CM-TRANSID: _____wBHZSQZ9ppoCK65Aw--.24679S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr48Ww1DZrW3ur4kKFW8tFb_yoW5Xry7pF
	4qga98A34UGr4fJ3WUXa1xuFyY9aykWr93WryUWasYgr1DAF95XwsrtrWqg347Jr1Uta4f
	t3Z2qryv9a4DurJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bU5rcUUUUU=
X-Originating-IP: [119.130.132.108]
X-CM-SenderInfo: x1l2xxpmld0jqqsvqiywtou0bp/xtbBaxmnbGia8wVZrAAAsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_090733_202518_117FC026 
X-CRM114-Status: GOOD (  10.54  )
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



-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: =
arm-scmi+bounces-2017-yizhijiao2025=3D163.com@vger.kernel.org =
<arm-scmi+bounces-2017-yizhijiao2025=3D163.com@vger.kernel.org> =
=E4=BB=A3=E8=A1=A8 Junnan Wu
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B48=E6=9C=8812=E6=97=A5 =
15:54
=E6=94=B6=E4=BB=B6=E4=BA=BA: sudeep.holla@arm.com; =
cristian.marussi@arm.com
=E6=8A=84=E9=80=81: florian.fainelli@broadcom.com; =
arm-scmi@vger.kernel.org; linux-arm-kernel@lists.infradead.org; =
linux-kernel@vger.kernel.org; lei19.wang@samsung.com; =
q1.huang@samsung.com; Junnan Wu <junnan01.wu@samsung.com>
=E4=B8=BB=E9=A2=98: [PATCH] firmware: arm_scmi: Set device ready before =
register scmi_virtio_driver

Fix irregularities in scmi driver probe.

After 'commit 20bda12a0ea0 ("firmware: arm_scmi: Make VirtIO transport a =
standalone driver")'
making SCMI VirtIO transport a standalone driver, `scmi_virtio_probe` =
will follow `scmi_vio_probe`, and during `scmi_virtio_probe`, it will do =
`scmi_probe` which will invoke function `scmi_protocol_acquire(handle, =
SCMI_PROTOCOL_BASE)`, and this function will send message via virtqueue =
and wait device's reply

Before this patch, only after `scmi_vio_probe`, frontend will mark =
device DRIVER_OK by function `virtio_dev_probe` in =
'drivers/virtio/virtio.c' itself.

Accroding to chapter '3.1 Device Initialization' in virtio-spec, ``` The =
driver MUST NOT send any buffer available notifications to the device =
before setting DRIVER_OK.
```

In some type1-hypervisor, available buffer notifications will be =
intercepted until virtio driver is okay. In this case, `scmi_vio_probe` =
will be blocked at `scmi_wait_for_reply` and probe can never complete.

Therefore, the operation to set DRIVER_OK must follow perform =
device-specific setup immediately, then available buffer notifications =
can be sent in function `scmi_probe`.

Fixes: 20bda12a0ea0 ("firmware: arm_scmi: Make VirtIO transport a =
standalone driver")
Signed-off-by: Junnan Wu <junnan01.wu@samsung.com>
---
 drivers/firmware/arm_scmi/transports/virtio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/transports/virtio.c =
b/drivers/firmware/arm_scmi/transports/virtio.c
index cb934db9b2b4..326c4a93e44b 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -871,6 +871,9 @@ static int scmi_vio_probe(struct virtio_device =
*vdev)
 	/* Ensure initialized scmi_vdev is visible */
 	smp_store_mb(scmi_vdev, vdev);
=20
+	/* Set device ready */
+	virtio_device_ready(vdev);
+
 	ret =3D platform_driver_register(&scmi_virtio_driver);
 	if (ret) {
 		vdev->priv =3D NULL;
--
2.34.1



