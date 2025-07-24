Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF3BC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbV46p1jfsmTuEmVKg9pzBeff6UW0mEjtUgJ004R7es=; b=QuIcVeCgp7+voScLsKcMp0jOoy
	kFUsGji+C5aPG1YOKidWzTRoiGwL0C8h08FikEo1STer/vklQ8B2ZTO0bEuyCKVjKygRLpZJBzEKi
	zxGEKCzyVRGtswv9ZU403MVfOLWBs6cqmkDlLeUz6fUe2GaxuTU/Xv3Io174SjOcigeErSR5+UvsR
	l+RGn24jk8joc0uU/CrETRXLCg0MMDOxxkbtFzmlXyWaiKK1aEFksM/pMlbejtKIaZN368vefyOeS
	/uAu9lm18OeeGDRJZmJREzAIACXYA6wnRbfyIMF4IPwZYAi8H+ORtJzCGBs6kg7BN4PQCcVLaCTqQ
	ZcKpSxbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNV-000000082uT-0tZ1;
	Thu, 24 Jul 2025 17:05:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewej-00000007hl4-1VBw;
	Thu, 24 Jul 2025 14:10:46 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 667371A04;
	Thu, 24 Jul 2025 16:10:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366205;
	bh=u88FSqcsc0N2ZFvrgby11vKsM4ytR+rXokZ729cwq9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fagt0BE+diV9+AbBlekTOJdiPNc9GafAg6df8urVTH54TtuiOuc+JsvT6NYdgjLXN
	 bKddHDJe8MFsWKz+fFdcy+kZhBK/DoO/FgptKqeFRblUI4DR9zFzAkC9LNDR+A/o3A
	 /gB+AseHNs27lfHnjM6zMkhQM1uHUeA54TfOS0JA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:21 +0200
Subject: [PATCH v2 14/27] media: Documentation: Add
 VIDIOC_SUBDEV_BIND_CONTEXT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-14-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4626;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=u88FSqcsc0N2ZFvrgby11vKsM4ytR+rXokZ729cwq9o=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7PW7QjD8qMwTZWuNE7c3zeDKhIIFd1UylOr
 B9O82Ilv2eJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zwAKCRByNAaPFqFW
 PE5eD/0buLR1LLpJcJn9kC4eWv+0KZur9zub9kI1BX9gWa1EIB8n+0lF9Z67+hSsSxR9dXZmgvW
 WtKuLlkcMG9/NmXE68PdkQwi1DlaJOcE4EurwMVNclTQ7SBwSIlP1RC6lA0d6PPHQKNE82foEg4
 aolXSHns/6BrZSWgKLYXi8mx/KJpQuilfJPCwdGcR7HYhw01ypp14n1NaOtFIaa4EnWACNX4Gxv
 CssDizDXc0oHSjmLrSUoWWtawSlONG6cZkq9r76Uhf3EefgtFxKCG4+oAFKVO2rc6HQfA1nXDvn
 KSZNNnm1anSksyTAQm3VYh3YT5d0XaW+DcFJ0OIzJc9gbKJKBoRVoPRnvqrLNQOqjKCh5ERgtkP
 ztF2L1UcGkErdKlAKOZnejnomjVTk2XVaXy1QUtjQJD4caxkzTvMZ3LPufJtSkIBCU/BC3ENKi7
 ZkzyZttc4ji5CMX4C11CobV6+OjCxdgCNVrwhQDVcIGQXRoAiD5TzYhiUZkMkIpWtKFnWJ02Zfn
 sQJpi/Axm/DAR0xgZfal7cuvjdMXGKhzAudiHvF5H+iPwX0QvEk67NQxzKL0yak2XyyQIcJVj9X
 rD6Izu5650bFcxtR5mssVGKJH4wUiA8PnpYhG7/MEqyxB0PSoxdL2duP98Cf4lT6P3j5RvpOI/6
 wFcuenFV9OXNInQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071045_683233_F8230178 
X-CRM114-Status: GOOD (  17.45  )
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

Document the newly introduced VIDIOC_SUBDEV_BIND_CONTEXT ioctl.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/user-func.rst          |  1 +
 .../media/v4l/vidioc-subdev-bind-context.rst       | 81 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
index 0d9aff56ab653b2a4f6afe4828f88bc5637addf1..236847a1d6cb2a266bea30ecf7583979099b0343 100644
--- a/Documentation/userspace-api/media/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -66,6 +66,7 @@ Function Reference
     vidioc-remove-bufs
     vidioc-s-hw-freq-seek
     vidioc-streamon
+    vidioc-subdev-bind-context
     vidioc-subdev-enum-frame-interval
     vidioc-subdev-enum-frame-size
     vidioc-subdev-enum-mbus-code
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-bind-context.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-bind-context.rst
new file mode 100644
index 0000000000000000000000000000000000000000..5cba529a3cdcb63c7257f871d667fa792c0ca382
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-bind-context.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _vidioc_subdev_bind_context:
+
+********************************
+ioctl VIDIOC_SUBDEV_BIND_CONTEXT
+********************************
+
+Name
+====
+
+VIDIOC_SUBDEV_BIND_CONTEXT - Bind a subdevice file handle to a media device
+context
+
+Synopsis
+========
+
+.. c:macro:: VIDIOC_SUBDEV_BIND_CONTEXT
+
+``int ioctl(int fd, VIDIOC_SUBDEV_BIND_CONTEXT, struct v4l2_subdev_bind_context *argp)``
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :c:func:`open()`.
+
+``argp``
+    Pointer to struct :c:type:`v4l2_subdev_bind_context`.
+
+Description
+===========
+
+Applications call the ``VIDIOC_SUBDEV_BIND_CONTEXT`` ioctl to bind a subdevice
+file handle to a media device  context. Binding a subdevice file handle to a
+media device context creates an isolated execution context which allows to
+multiplex the usage of a video device. This means, in practice, that the
+subdevice configuration (format, sizes etc) applied on a file handle bound to a
+media device context won't be visible on file handles bound to a different media
+device context (or not bound at all).
+
+By opening a media device applications create a media device context to which
+video devices and subdevices file handles can be bound to. The file descriptor
+returned by a call to :c:func:`open()` on the media device identifies uniquely
+the media device context. Application populates the ``context_fd`` field of
+:c:type:`v4l2_subdev_bind_context` with the file descriptor of an open media
+device to identify the media context to which they want to bind a subdevice
+to.
+
+Applications can open a subdevice node multiple times, and call
+``VIDIOC_BIND_CONTEXT`` on each file handle returned by a successful call to
+:c:func:`open()` to isolate the operations performed on that file handle from
+any operation performed on other file handles bound to different contexts. This
+means, in example, that the subdevice format and sizes are isolated from the
+ones associated with a file descriptor, obtained by opening the same subdevice
+but bound to a different media device context (or not bound at all).
+
+The bounding operation realizes a permanent association valid until the
+subdevice context is released by closing the file handle.
+
+A subdevice file handle can be bound to the same media device context once
+only. Trying to bind the same file handle to the same media device context a
+second time, without releasing the already established context by closing the
+bound file descriptor first, will result in an error.
+
+Bounding is an opt-in feature that applications are free to ignore. Any
+operation directed to a non bound file handle will continue to work as it used
+to, and the video device configuration (formats, sizes etc) will be visible
+across all the other non-bound file handles.
+
+Return Value
+============
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+EINVAL
+    The media device context file handle ``context_fd`` is not valid or the
+    subdevice file handle is already bound to a context.

-- 
2.49.0


