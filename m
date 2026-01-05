Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C58C2A075
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZNcpna94jzFmMzIerQ6T3iKrCjtFrzjHdWYqyE4vCAI=; b=sclrha1rebnr8B
	EvKEtAKsSfLfMXBS+OlMYSCYk+v+pSTNe4dl6xdwCBC72yTIf7whYWA27L8MZV8x9T6165RMBv1SL
	owuYI/ALc4weIjfUEOYaeW0yruEDIOHdNlRnVblngegWDugPurbch4C3a828p+O3rSMUQJv/QnNfZ
	idxr5gOJPn2XF8gKhDK/MfW2U95RfzeDd6UXdZwwAe+DAL92Gpvq7dfbiQ9EHENNVr0+xgmNDzJmr
	YGkzz/ftE3sos6xtbl6RcXsKCn4IutdY6bwGPdO5uvqXJ987jr6RkrJzvr10Tv3O/fMqp6qwHhVxt
	RWe+l/n9f7w2v0675yBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgPi-0000000B1Ap-3LbT;
	Mon, 05 Jan 2026 08:58:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgPe-0000000B1AG-2OyJ;
	Mon, 05 Jan 2026 08:58:09 +0000
Received: from mail.ideasonboard.com (unknown [223.190.87.50])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC25D22A;
	Mon,  5 Jan 2026 09:57:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767603461;
	bh=jHMFZIB7V4nDrQJqsv9i8my+B6RetE4z6/2vdXRrBQ4=;
	h=From:Subject:Date:To:Cc:From;
	b=PIJyXs7gvYtToG0eNzYdDiLnzMVss31oBH/wAqSta2Z/WMdEPx/rKQnRRMwnOZ9s5
	 rCv7cDcR8Pd+cYFuogB63MUBT4511jk8hJ5H1D81EwZlM7dHWDtCfSAipWX/E+WU/P
	 Zf4JfvykLnTmMIxgYLljBiSdv8rm3boAvpfnH0wY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/6] platform/raspberrypi: Add Broadcom Videocore shared
 memory support
Date: Mon, 05 Jan 2026 14:26:46 +0530
Message-Id: <20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM58W2kC/1WOQQ6CMBBFr0Jm7ZC2CARW3sOwKNNBuoBqi42Gc
 HcruHH5Jv+/PysE9pYDtNkKnqMN1s0J1CkDGvV8Y7QmMSihSikKgf0ZI2GYkCaNQ1WrmoqGjCo
 hVe6eB/vaddfuYM+PZ7IuxxF6HRjJTZNd2ixWuWzQk4RveLRhcf69vxLlnv6tyv/VKFGgMKYkw
 VQMJV2sYR3c3DvtTZ7s0G3b9gGWDMzp3AAAAA==
X-Change-ID: 20251030-b4-vc-sm-cma-f6727c39cd25
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org, 
 Dom Cobley <popcornmix@gmail.com>, 
 Alexander Winkowski <dereference23@outlook.com>, 
 Juerg Haefliger <juerg.haefliger@canonical.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3411;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=jHMFZIB7V4nDrQJqsv9i8my+B6RetE4z6/2vdXRrBQ4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpW3zwRSzQXJvSrAUCW3rFlIU3ZtkmbPYWpi5cA
 xD29mfWX9+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaVt88AAKCRBD3pH5JJpx
 Rf/6D/98VtLcR+A1sa+r/58XBa3u5UXKNp9oJo794cG3q1UlHLb95zM2bFZeMS4qOxU5Pdjf4Xv
 VejL+smpxlbme1Jvn7iP1HMHrGH+6R0tWWdAwTYvwLQ5mTHuzRWWijH1oZpO8a5VjxchfS1uNg2
 AgrWyHMKUthVLx+mIdzq3zErZwE3U4svnDN/yw/h/Z9ZUXkvWxTOmConvSIrf0wUmt0reYUl9h0
 ohTtenBNkFcJRu3bsFFFqZjYlCvh6zis0CCCHDkAamR2UjvgJoVJ0qtRE9HJs77QtOJXZcKBgxO
 MPe0bttFJa1c8SPKKLAi9Y0NeI4f5lThvaRp6nsW+QFpN8htIs/xXudxR6mu774PuSssIuwaMUJ
 F9biS/nU2+gDmxRLX20iwpL8orB62/UZEJGgC8RYaEuyjBmuqoRkG8XRAnolyzkbum0TxM1jPe8
 9p7PTse0KpSoel/WW35hUu2FW7FFNh3pM7LVAbwfrjlw1iXYPe1XVxoME7CjVEExKCteCrW4gBn
 5sAuvq2Sb40UnrWJNc4PwBE7Vag+EBTswk8xZBVWiCGXZmN5UafCWe24lgVOr+/3vj2ax6ncrYg
 bSSocYKqC7bIMjXMQYTkWz3OiZ9BGdSiXGTnqQRtR3cCPg0/NwE/qWw9KXTLhHt0x7kpeac6oms
 UeHxxqktb5MwWfg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_005806_762209_F5DD34C8 
X-CRM114-Status: GOOD (  13.62  )
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

Hi,

The vc-sm-cma driver allows contiguous memory blocks to be imported into
the VideoCore VPU memory map. This series adds support for this driver
and changes to VCHIQ MMAL layer required to get it functional.

These changes have lived in the staging directory of the downstream
Raspberry Pi tree since quite some time, but are necessary for getting
the VCHIQ based peripherals like the ISP and codec functional in
mainline.

Thanks,
	Jai

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Drop patches that are not related to vc-sm-cma, or used for codec and
  not ISP, so that is v1 PATCH 1, 2, 4, 5, 6, 7, 8, 12
- Move v1 PATCH 11 to the top, adding a Fixes tag
- Don't use global singletons for storing `struct vchiq_device` in
  VCHIQ, instead converting the existing device drivers (audio) to be
  stored inside `struct vchiq_drv_mgmt`
- Update the vc-sm-cma driver to latest standards, like:
    - Replace MODULE_ALIAS call with a proper device id_table
    - Add kernel-doc comments for exported functions
    - Move exported functions to a header under include/linux for use in
      MMAL (and later V4L2 ISP and codec drivers)
    - Use xarray instead of deprecated idr to map an integer ID to
      imported/allocated buffer pointers
    - Drop unnecessary pr_debug calls
    - Replacing pr_xxx use with dev_xxx wherever possible
    - Clean up stray comments
- Link to v1: https://lore.kernel.org/r/20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com

---
Dave Stevenson (5):
      platform/raspberrypi: vchiq-mmal: Reset buffers_with_vpu on port_enable
      platform/raspberrypi: Add VideoCore shared memory support
      platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to support zero copy
      platform/raspberrypi: vchiq-mmal: Support sending data to MMAL ports
      platform/raspberrypi: vchiq: Register vc-sm-cma as a platform driver

Jai Luthra (1):
      platform/raspberrypi: vchiq: Store audio device in driver management struct

 MAINTAINERS                                        |    7 +
 drivers/platform/raspberrypi/Kconfig               |    2 +
 drivers/platform/raspberrypi/Makefile              |    1 +
 drivers/platform/raspberrypi/vc-sm-cma/Kconfig     |    9 +
 drivers/platform/raspberrypi/vc-sm-cma/Makefile    |    5 +
 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c     | 1571 ++++++++++++++++++++
 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.h     |   83 ++
 .../raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c         |  507 +++++++
 .../raspberrypi/vc-sm-cma/vc_sm_cma_vchi.h         |   63 +
 .../platform/raspberrypi/vc-sm-cma/vc_sm_defs.h    |  298 ++++
 .../raspberrypi/vchiq-interface/vchiq_arm.c        |   13 +-
 drivers/platform/raspberrypi/vchiq-mmal/Kconfig    |    3 +-
 .../platform/raspberrypi/vchiq-mmal/mmal-common.h  |    4 +
 .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.c   |   85 +-
 .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.h   |    1 +
 include/linux/raspberrypi/vc_sm_cma_ioctl.h        |  110 ++
 include/linux/raspberrypi/vc_sm_knl.h              |   75 +
 include/linux/raspberrypi/vchiq_arm.h              |    9 +
 18 files changed, 2827 insertions(+), 19 deletions(-)
---
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20251030-b4-vc-sm-cma-f6727c39cd25

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


