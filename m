Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99940C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1maNytsNrFfdpTum88xw+NswdNpJC9Ilgb2oQoAs8w=; b=LEVsdf7WZFpY2EusRX6wPICd/Y
	7bWi+74tj7qAJG9fzhOHfDuzpT9gggIRQSS+gbXuDpYNZV6p/YNsOl8AC8cGIQRpr579shW0CLv+N
	4qgPMcW9UUGxrPvW96J9zXZn6wouIFSQuZb26Li5GN1NU4+2nO7QZtgt6G55SSD/c4oCFLS2Tzgpn
	kFpUcDK5XXQQocaQWdGIZ7C5xBb+u12NTP+/3WOWtnhoiCBWxliKK6GS+JovCoCCZHlsxU96K4KyC
	57xqUfcReRHJM5JMIOnb3qeNWcuAFQwnHoK/Cvi9UPyP6a/4dXEEFDIMcKNyICg6bGiMpZ2x1mOOI
	qviN4Itg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueyBT-00000007vAz-3P3k;
	Thu, 24 Jul 2025 15:48:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewes-00000007hqL-0LzC;
	Thu, 24 Jul 2025 14:10:55 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23FFB19E7;
	Thu, 24 Jul 2025 16:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366214;
	bh=V0WqgKr/zEfw+asoSaJEdqWVxbY1tSCJAuE38B6yIuk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tDF8ihNFzRturUk5ExkYHvqM//6DNG0tnFhewVa9QkTR95TLsa8g0W1Cde/D66EyB
	 82+ld9IZSD0BGF2qppIjZoja8jY3k+IIiPz2ck02E2kFR2dRMaf2R1hiJyCaMGYbRK
	 BVr/46+dwE58ZvUeHbCDWa7tfCEuA4sMYhIKi128=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:28 +0200
Subject: [PATCH v2 21/27] media: uapi: Add 'flags' to media_device_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-21-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5051;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=V0WqgKr/zEfw+asoSaJEdqWVxbY1tSCJAuE38B6yIuk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7Q0UTep6lSZUTnL+csNpJBbJvZqx7bNQXb+
 a9RSvGGif2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PEJED/9eZYnxIRsTYgasIOWfgqMLm8sHX8coaxImLs+Vu0fI8Gb3H0dNKMAvYwBME4TmDRF49wQ
 659iKLTU4vmTOaqi443lCYObLjhUNpCim9PWkd1GFZKn+lCyyJU77aP+RfSSPjCkjb8x1mvi4AF
 uc3QfKiN4EJ8634LMwHxLPfW4aFmSLQhCTmDyLhgJ3+MQkSu+LSOG0fqVAYC3XemKLzvKR2HgvV
 lEUxihLaqSs8Ygc+99rWOLK7Dssj9LH7Yjfz2h5FhbiXX2HfZP3SV4hBq0fJh29PxOaO5t4CWij
 j+0Iba4iMDem78CH1a/wmYNTMai73ZpiFc+3xR0pc8/Cg0atvJmSimSYysbp3AVoFkCTsGid0FN
 5rbPx3lMkWE2+DBzwoI9ndIgOgvp3Y/z1FnEqB5rmPF2jNi8M1ZYp8PIsLW/k19lOaFLEynpiG5
 nNMA7a0QcetRQ1+u/OAv1rLYWsght7oBZ1hByN95Igsbbm9TNqDZz5djXAmNh9U/JPsNWN7lc/5
 wkDkc2cUZQ0apUV3zaONtXv7Nk2WRiGbRXf8dD2SE3RNK7R5eAcIHq9xVpB9Y8zsPei6UYavo2P
 hxtnXap39xuYInNuA75LxQKeMbx6RGVcVWwhjLJWk2Fy0FIT+/cltAlfpDo2m/is0qHpyfY85TM
 4fKe2htFb2ZL4oA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071054_276457_37DC784B 
X-CRM114-Status: GOOD (  16.48  )
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

The 'struct media_device_info' type is used to return information
on the media device using the MEDIA_IOC_DEVICE_INFO ioctl.

Add a 'flags' field to the structure by using a 32-bit integers from
the reserved space to report the media device flags to userspace.

Introduce a new flag MEDIA_DEVICE_FL_CONTEXT that allows drivers to
report support for multi-context operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/mediactl/media-ioc-device-info.rst  |  6 +++++-
 Documentation/userspace-api/media/mediactl/media-types.rst  | 13 +++++++++++++
 drivers/media/mc/mc-device.c                                |  1 +
 include/media/media-device.h                                |  7 +++++++
 include/uapi/linux/media.h                                  |  6 +++++-
 5 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst b/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
index d56ee6669ab9eb17a77f3714ecd5e3ef9ad65358..f2ff7a2b860cb848683a31d5731a06c782c70316 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
@@ -87,7 +87,11 @@ ioctl never fails.
 	  this identifies a particular driver.
 
     *  -  __u32
-       -  ``reserved``\ [31]
+       -  ``flags``
+       -  Media device flags, see :ref:`media-device-flag` for more details.
+
+    *  -  __u32
+       -  ``reserved``\ [30]
        -  Reserved for future extensions. Drivers and applications must set
 	  this array to zero.
 
diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263b04935758d42a17adfe690fcd042..40e943af37c08339af928ff89e937740a48893a8 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -235,6 +235,19 @@ Types and flags used to represent the media graph elements
 
 ..  tabularcolumns:: |p{5.5cm}|p{12.0cm}|
 
+.. _media-device-flag:
+.. _MEDIA-DEVICE-FL-CONTEXT:
+
+.. flat-table:: Media device flags
+    :header-rows:  0
+    :stub-columns: 0
+
+    *  -  ``MEDIA_DEVICE_FL_CONTEXT``
+       -  The media device supports multi-context operations
+
+
+..  tabularcolumns:: |p{5.5cm}|p{12.0cm}|
+
 .. _media-entity-flag:
 .. _MEDIA-ENT-FL-DEFAULT:
 .. _MEDIA-ENT-FL-CONNECTOR:
diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index e1f34f884fee2e8c3750f9c1e85142ff2f6b7bf0..a5cdc679a4ef11c7ec35dd69ac9987eb5718069f 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -121,6 +121,7 @@ static long media_device_get_info(struct media_device *dev, void *arg)
 	info->media_version = LINUX_VERSION_CODE;
 	info->driver_version = info->media_version;
 	info->hw_revision = dev->hw_revision;
+	info->flags = dev->flags;
 
 	return 0;
 }
diff --git a/include/media/media-device.h b/include/media/media-device.h
index b3cc6793a8b5eff4c26e57b01e1a62ab71e8195b..e53334fc21fa353cb3e0e7948b08739855dd07ca 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -157,6 +157,7 @@ struct media_device_ops {
  * @serial:	Device serial number (optional)
  * @bus_info:	Unique and stable device location identifier
  * @hw_revision: Hardware device revision
+ * @flags:	Media device flags
  * @topology_version: Monotonic counter for storing the version of the graph
  *		topology. Should be incremented each time the topology changes.
  * @id:		Unique ID used on the last registered graph object
@@ -221,6 +222,11 @@ struct media_device_ops {
  *    necessary to run @enable_source and @disable_source handlers.
  *    Callers should hold graph_mutex to access and call @enable_source
  *    and @disable_source handlers.
+ *
+ * The @flags field reports the media device capabilities:
+ *
+ * %MEDIA_DEVICE_FL_CONTEXT
+ *    indicates that the media device supports multi-context operations.
  */
 struct media_device {
 	/* dev->driver_data points to this struct. */
@@ -232,6 +238,7 @@ struct media_device {
 	char serial[40];
 	char bus_info[32];
 	u32 hw_revision;
+	u32 flags;
 
 	u64 topology_version;
 
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf36b76aaf1363dec50751469d8fed..f711bdda595718092a294336d4d364ba8296e08d 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -23,6 +23,9 @@
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
+/* Media device flags. */
+#define MEDIA_DEVICE_FL_CONTEXT			0x00000001
+
 struct media_device_info {
 	char driver[16];
 	char model[32];
@@ -31,7 +34,8 @@ struct media_device_info {
 	__u32 media_version;
 	__u32 hw_revision;
 	__u32 driver_version;
-	__u32 reserved[31];
+	__u32 flags;
+	__u32 reserved[30];
 };
 
 /*

-- 
2.49.0


