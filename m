Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8D3C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d16+YUiPtl7EZ7Mi65I1uv3nQbRaVfEJUXPyBM0BQrQ=; b=yO0eW42qeEOcPpPzXrA07lo/BH
	muPJA6c43qzE+mGbHaTko0818JHDzmIZulDMdNCduUOrWAeu+U/7kfPifA44tMChryP8hZyVsDi8e
	4sWqjijFCDeywCsnZ3WPxHYdvBrNMyGWf+MMgRMd8rtWzfkf2HQJXDnyuy8F3JtIEwUXUtxp313hn
	TARKGGf0aDJuFq1qKlU1CTZqZHHFEmUi9pisLaNlNPIAIlCeYRQKUek9RqIRmdcfXINazjGirCG82
	uft3og/3uuOpFSbL9oq7OZ6TpUYsSmOgM4/DMD1tYE/fX9St98FVUElbBmj8MvpyZ6+mxGjNvxAyM
	OGZfMlkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNS-000000082rX-1LJO;
	Thu, 24 Jul 2025 17:05:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewea-00000007hfU-1VNg;
	Thu, 24 Jul 2025 14:10:37 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71877C79;
	Thu, 24 Jul 2025 16:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366196;
	bh=V29a6qX8KA0ELmVzRolMfVBPPzH85sU33AYkFGGSdRI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QwlwWrx9/bXH6s6L686gbmUSCanbKpOJt0Rv2wgRpyNVXfVpIhnj0jsfAQhzbSmVQ
	 qgszdOGLzxyg6BONkbJWnBR52Vby5KQwlNPaE+S3ZsrTuCk0RiKuWR6gpwKfLzy3dM
	 RThkXLiKp7KEwHcVbreBzOaGvNQHbt/T69t4nRCg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:14 +0200
Subject: [PATCH v2 07/27] media: Documentation: Add VIDIOC_BIND_CONTEXT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-7-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4469;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=V29a6qX8KA0ELmVzRolMfVBPPzH85sU33AYkFGGSdRI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7OHWG882uXaFEbSbt0Hr5/yWbNirgfhlDO1
 fH9BACuQ0GJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zgAKCRByNAaPFqFW
 PMiXD/9ptjYvK6OodJsJm6frucZmguwClByRCBQIzmoIHod2NI+aXnplxYiBs004EFI+isBYOf2
 ofXGV85huvYTG8eBx/S7ocknJu/aU3fLMOsO+EDpLKJ3nzhz6eUp3yWo/pdv3MKQpNSu0vurBeq
 oVDbfgWZFi1K/HrVDfMVLptskMYg6FyAvrd9bNrAjaLO8Um8/GA1cv+xjhiq3ZY5XKgtE4/4MDU
 x11OIj9KnUfa0jHl9YwIThbaENit1LsIXtBoNUTUNZPBKKL9cqKLOfHfr3i5qr55rsH4opPaMsn
 gbvBwtxjggqTbqoZAi/nss8gvck/3VtS8FfB7LooadDdrWNA6yWhWcvEMdxEd4DWbiFpvxPyWiF
 TzBoePhTZjBd/FVrSDklaRJ36Gl6zq+5y7FLcvUyDfvCkMZZyYSrxOrcCdlN2sspyXtVnsWwGRv
 f1od1+T1q+UDQ/Xp1S6rfiHKbq9KURLqgSaarSkjjfRsUQ5xfbSBUjjcanix4U0Dilux9DOW8aF
 W3zHtE1JAUbNhv2auXcMpC+nOv7nizoQxUItCutHDFvjd4J2cPp74zgtRcMZ84FU9gA6XijuTd9
 T4pdogp3UHtV39jF0c7B8PrhnCICx7FZBd9sf6++rODg56jYiUYG2b5QVCJHBtWLM7OSpPHBjRG
 dFjZ4mFhvDKCdtw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071036_571784_F1F528D0 
X-CRM114-Status: GOOD (  17.98  )
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

Document the newly introduced VIDIOC_BIND_CONTEXT ioctl.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/user-func.rst          |  1 +
 .../media/v4l/vidioc-bind-context.rst              | 80 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
index 6f661138801cde2810997740ee8305085fe73a43..0d9aff56ab653b2a4f6afe4828f88bc5637addf1 100644
--- a/Documentation/userspace-api/media/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -12,6 +12,7 @@ Function Reference
 
     func-close
     func-ioctl
+    vidioc-bind-context
     vidioc-create-bufs
     vidioc-cropcap
     vidioc-dbg-g-chip-info
diff --git a/Documentation/userspace-api/media/v4l/vidioc-bind-context.rst b/Documentation/userspace-api/media/v4l/vidioc-bind-context.rst
new file mode 100644
index 0000000000000000000000000000000000000000..74c885169e22c495056a9364e722e2140d8f21c5
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-bind-context.rst
@@ -0,0 +1,80 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _vidioc_bind_context:
+
+*************************
+ioctl VIDIOC_BIND_CONTEXT
+*************************
+
+Name
+====
+
+VIDIOC_BIND_CONTEXT - Bind a video device file handle to a media device context
+
+Synopsis
+========
+
+.. c:macro:: VIDIOC_BIND_CONTEXT
+
+``int ioctl(int fd, VIDIOC_BIND_CONTEXT, struct v4l2_context *argp)``
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :c:func:`open()`.
+
+``argp``
+    Pointer to struct :c:type:`v4l2_context`.
+
+Description
+===========
+
+Applications call the ``VIDIOC_BIND_CONTEXT`` ioctl to bind a video device file
+handle to a media device  context. Binding a video device file handle to a media
+device context creates an isolated execution context which allows to multiplex
+the usage of a video device. This means, in practice, that the video device
+configuration (format, sizes etc) applied on a file handle bound to a media
+device context won't be visible on file handles bound to a different media
+device context (or not bound at all).
+
+By opening a media device applications create a media device context to which
+video devices and subdevices file handles can be bound to. The file descriptor
+returned by a call to :c:func:`open()` on the media device identifies uniquely
+the media device context. Application populates the ``context_fd`` field of
+:c:type:`v4l2_context` with the file descriptor of an open media device to
+identify the media context to which they want to bind a video device to.
+
+Applications can open a video device node multiple times, and call
+``VIDIOC_BIND_CONTEXT`` on each file handle returned by a successful call to
+:c:func:`open()` to isolate the operations performed on that file handle from
+any operation performed on other file handles bound to different contexts. This
+means, in example, that the video device format, sizes and the buffers are
+isolated from the ones associated with a file descriptor, obtained by opening
+the same video device but bound to a different media device context (or not
+bound at all).
+
+The bounding operation realizes a permanent association valid until the video
+device context is released by closing the file handle.
+
+A video device file handle can be bound to the same media device context once
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
+    video device file handle is already bound to a context.

-- 
2.49.0


