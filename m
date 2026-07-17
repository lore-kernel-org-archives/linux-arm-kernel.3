Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9E4C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CT3sAMi03LI/yWSvgArOf94yJC1J8CsoBt+7YSQ6uiU=; b=VxuDOkarycjXDs
	PF/bwa3nsupcGsnrAfkHi+kmoBlr8F7kngRjVcj/0Y1F80TXUaaqeaSSFmm1UOW0U1EOBA5ALJ4pL
	FF4u7xdrR3VfIaBy09E0SwQ6oKAM33VHNhibCloQ83symkrZqoz++UgulYTjX2g8saJYom7AM9tkb
	O7tx1lQAmDf/aAMZ+Ytc2dVcH3QMnO/p/hmJuaVIiU3CfOt00Dt+2hTRiU91g6SDG8W9RmTWA7IBc
	324OZl4IaMRdi/tjSDSi7J5X4ke/Yctrzw5ncbhJD1Pw+0U3NZ30Zd8Db0ahN+yOtyzDmqI4d/kRn
	z644KddCp0e3uIyxJB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgJY-000000025nl-27yi;
	Fri, 17 Jul 2026 11:01:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgJT-000000025il-2pxb;
	Fri, 17 Jul 2026 11:01:06 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABC87664;
	Fri, 17 Jul 2026 13:00:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286002;
	bh=VHbZI+GEQPLH3kCpxle96m7loSEA/fgokgnq68qE1a8=;
	h=From:Subject:Date:To:Cc:From;
	b=APtjRdaWGCF+LAOaUoaIKJk5OwlDvrvzq5KrgVuz6l/VGM2SzG1JbN75OEhfA1jcO
	 GeKYuHKaUBw26A8U5sm+Mi5acOCj5yrvYANjmUjHHO5UbTj+5QQfK6hIAmTvq2YNxR
	 8oWphkxV//ZCTcycd8zLBm7cA+TTBIntS/LFGpJs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 0/6] platform/raspberrypi: Add Broadcom Videocore shared
 memory support
Date: Fri, 17 Jul 2026 16:30:11 +0530
Message-Id: <20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OwQ6CMAwG4FchO1uyDQbBk+9hPIyuyA4w3XDRE
 N7dCXrQePybv187s0DeUmD7bGaeog3WjSkUu4xhr8czgTUpM8mlErzg0JYQEcIAOGjoqlrWWDR
 opGJp5eKps/eVO5627Ol6S+q0DVmrAwG6YbDTPot1LsGjYK9ub8Pk/GP9JIq1/D4qvo9GARy4M
 Qo5YdEpPFhDOrixddqbPOGrF+XHqLjg6seQySiNJl2XDZJp/hjLsjwBAuIH+h8BAAA=
X-Change-ID: 20251030-b4-vc-sm-cma-f6727c39cd25
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org, 
 Dom Cobley <popcornmix@gmail.com>, 
 Alexander Winkowski <dereference23@outlook.com>, 
 Juerg Haefliger <juerg.haefliger@canonical.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3647;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=VHbZI+GEQPLH3kCpxle96m7loSEA/fgokgnq68qE1a8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgtdDKR/6BMZI1OKg4GJv2m+gNB0CqG2ycVgY
 6YgpQbN0NqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloLXQAKCRBD3pH5JJpx
 Rf5AD/9/ivRsGkR9h8ZFHuOAOPC8JlgmZiCpkqLbcDS9EBFhX18U7ilpkfSqk6jSR/NiBhY33RK
 XnLQGN4ZMrXxXFw6o6dRCajj/q94C8X3Jdh5cvqb067DKP/RMr1czJhW/GbifOD8UXdp5srtWdW
 tcKM4ZER9FHquOxjGPtK4lvBf1fnPwpAjo7w+5aBwjnrAunvGRwkCvD6tfWa8yS1Wz+X7wGPxNz
 CmRrbyzvDICCIwAy0QVCKgxo1ZAfBoYYZJF030ErKGsCiZ4riuUxucy3M8gkWYz0oppjPHvnI8l
 vMMHCNiHJi00nL8Jxer/6UPT8wgXQ+F0tw+j3970eEp81PbKvwhlhjfFxqGKzvNmYUmoRodLHxI
 62yZz/WR6hg0rv13gXTSVroUFRPAZ02PFyt7KeT4JhjTD5hzVdPhPu07nLsBh/ZJyfwpy4Oe4S1
 DLnjPICDhexOtM659Gm+RWHEo2VvMriNc6AioFd50fq2zvYWdsOeN85r8C7c1f/6tYYe6L6gJuS
 Ym1JxsrsD8TQ+XrFAvz3jEC5p+7yupsSV4esla+/ujoOeeOpZ1BSc4nsUHj1H1rY8LOF9ZTS1VV
 4VGSgwFMk66q2XUdsimJnUPkAhpFmB79NMtIsNVzwHji8SPYn9NxAgWxqFUj1dhY8efzdQq6RKD
 LehmwmywOQD+lcQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_040104_190613_88B8C5BE 
X-CRM114-Status: GOOD (  13.06  )
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
Changes in v3:
- Rebase on v7.2-rc1
- Fix lkp bot errors with Kconfig dependencies
- Switch from kzalloc with sizeof to kzalloc_obj
- Link to v2: https://lore.kernel.org/r/20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com

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
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20251030-b4-vc-sm-cma-f6727c39cd25

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


