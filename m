Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FC8D3B7F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kVGi9Au9Uz5ORlrVMH38Ub4yk0pQ7Et8gPNNcxfepQA=; b=GodtrJPHe6CrKDHh5+LE2sfzy3
	gmpo98kPj1Pj3S2y7f5nhtVbWhL5GcWOhBigyfx/lTTtMO4zmWl3VGEJzQF+oQABE4+nGDV8hk2hy
	jIucRDbNGPYl3hBF6WTBqsBeAvnh2i8WmIKjbeVS0jj+C+6roswJawDPD6a84cTt4Jx5il0zgfdFj
	WtM+snkSvBKdEM6vprXt9VFRuxCZIhy1d75pGlqBe7t+CrreG4JCFOvLb54eo8F6FP5aPU6l1cj7a
	7CoKLjpUWkxV72YuRbhzmM4b7nphK8PxOA/Kxdt+ns4ZX3TBx1wRVnlXu2A7pFMo0jhOFIt5QWbrM
	nOdwluvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVQO-00000007ZEb-12OC;
	Mon, 25 Nov 2024 09:30:32 +0000
Received: from mo-csw1800.securemx.jp ([210.130.202.134] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVNZ-00000007Yiq-2D17
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:27:39 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;i=
	yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=1732526828;x=1733736428;bh=J2JxfeCO
	jqWHc8RRd68kvxXRP6VkGcPsYbMJuqwTRAc=;b=HvBldsvKFIOFqmZQ65k/ykonui0qynNcaG8cbv
	QInAIhjvPGjJk17i7JgFlYk1q5YCqKyayN+2LO4NFgt9wiwzgWYgsJ5xQDzHP/gtPYbiFc9gE4Vs2
	DC5iBVaqdfnQ+Cmo/j8zXhpcO0dC2Pr158hb2ezKlF3fcueiq3Cnf4RJu23RtIET9TZgdaXaYGs1o
	NxRUE2TypTAfQX5m/qtMGrkgXPvSec8Mms/quUVkwuf4Qsb7PO2s/ltmESMOp8WWUq+Mqtsf/K3gt
	lDIQChkHavxyMiddDuzrdElvFbRgWuGPtFUmVIO19mibpU46aDoxC6HP8lK6EEpCQEuyBJMhA==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 4AP9R4Y0023547; Mon, 25 Nov 2024 18:27:05 +0900
X-Iguazu-Qid: 2yAaSvINfcyMh2D8CX
X-Iguazu-QSIG: v=2; s=0; t=1732526824; q=2yAaSvINfcyMh2D8CX; m=c1NCZEUx5oqiIehvz80KAJebifWoh5TbqT0krcQVLjU=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1802) id 4AP9R2b44128819
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 18:27:02 +0900
X-SA-MID: 35004168
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v12 0/8] Add Toshiba Visconti Video Input Interface driver
Date: Mon, 25 Nov 2024 18:21:38 +0900
X-TSB-HOP2: ON
Message-Id: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_012737_763524_C7D3F62B 
X-CRM114-Status: GOOD (  18.80  )
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

This series is the Video Input Interface driver
for Toshiba's ARM SoC, Visconti.
This provides DT binding documentation,
device driver, documentation and MAINTAINER files.

A visconti VIIF driver instance exposes
1 media control device file, 3 video device files for capture
and 2 video device files for controlling image signal processor.
Detailed HW/SW are described in documentation directory.
The VIIF hardware has CSI2 receiver,
image signal processor and video DMAC.

The device driver depends on two other drivers under development;
clock framework driver and IOMMU driver.
Corresponding features will be added later.

Best regards,
Yuji

Changelog v2:
- Resend v1 because a patch exceeds size limit.

Changelog v3:
- Add documentation to describe SW and HW
- Adapted to media control framework
- Introduced ISP subdevice, capture device
- Remove private IOCTLs and add vendor specific V4L2 controls
- Change function name avoiding camelcase and uppercase letters

Changelog v4:
- Split patches because a patch exceeds size limit
- fix dt-bindings document
- stop specifying ID numbers for driver instance explicitly at device tree
- use pm_runtime to trigger initialization of HW
  along with open/close of device files.
- add a entry for a header file at MAINTAINERS file

Changelog v5:
- Fix coding style problem in viif.c (patch 2/6)

Changelog v6:
- add register definition of BUS-IF and MPU in dt-bindings
- add CSI2RX subdevice (separated from ISP subdevice)
- change directory layout (moved to media/platform/toshiba/visconti)
- change source file layout (removed hwd_xxxx.c)
- pointer to userland memory is removed from uAPI parameters
- change register access (from struct style to macro style)
- remove unused macros

Changelog v7:
- remove redundant "bindings" from header and description text
- fix multiline text of "description"
- change "compatible" to "visconti5-viif"
- explicitly define allowed properties for port::endpoint
- remove unused variables
- update kerneldoc comments
- update references to headers

Changelog v8:
- rename bindings description file
- remove/simplify items in bindings
- update operations around v4l2_async_notifier
- use v4l2_async_connection instead of v4l2_async_subdev
- use dev_err_probe()
- better error handling at probe
- remove redundant mutex
- add V4L2_CTRL_TYPE_VISCONTI_ISP constant

Changelog v9:
- dictionary ordering of dt-bindings properties
- applied sparse checker
- call div64_u64 for 64bit division
- rebase to media_staging tree
- fix warning for cast between ptr and dma_addr_t

Changelog v10:
- add an independent entry in MAINTAINERS
- add paddings to uAPI structs
- use parameter buffer to control ISP (instead of vendor specific controls)

Changelog v11:
- stop merging sensor's controls and capture device's
- fix strange indents at initializations
- remove feature VB2_USERPTR from viif_params and viif_stats
- fix usage in the document

Changelog v12:
- Separated CSI2RX driver and made it independent driver
- Add a bindings for CSI2RX driver
- Add description of parameter/statistics interface to v4l2-ioctl.c
- use PM_RUNTIME_OPS macro for power management routines
- use v4l2_subdev_enable_streams() to start streaming
- implement callback enable_streams and disable_streams,
  instead of s_stream
- add spinlocks for variables shared among interrupt handlers
- use guard(spinlock)(locked_variable) macros
- call pm_runtime APIs at start/stop streaming,
  instead of file handle callbacks
- add new "resizer" subdevice between ISP and Capture devices.
- update capability of sub path capture: capture only RAW8 or RAW16
- document: add description of CSI2RX driver
- document: add description of resizer subdevice
- document: add block diagrams of VIIF and ISP
- document: update usage of the driver

Yuji Ishikawa (8):
  dt-bindings: media: platform: visconti: Add Toshiba Visconti MIPI
    CSI-2 Receiver
  dt-bindings: media: platform: visconti: Add Toshiba Visconti Video
    Input Interface
  media: uapi: add visconti viif meta buffer format
  media: platform: visconti: Add Toshiba Visconti CSI-2 Receiver driver
  media: platform: visconti: Add Toshiba Visconti Video Input Interface
    driver
  media: platform: visconti: Add streaming interface for ISP parameters
    and status
  documentation: media: add documentation for Toshiba Visconti Video
    Input Interface driver
  MAINTAINERS: Add entries for Toshiba Visconti Video Input Interface

 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../admin-guide/media/visconti-viif.dot       |   22 +
 .../admin-guide/media/visconti-viif.rst       |  435 ++++
 .../media/toshiba,visconti5-csi2rx.yaml       |  104 +
 .../media/toshiba,visconti5-viif.yaml         |   95 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-visconti-viif.rst       |   48 +
 MAINTAINERS                                   |   12 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/toshiba/Kconfig        |    6 +
 drivers/media/platform/toshiba/Makefile       |    2 +
 .../media/platform/toshiba/visconti/Kconfig   |   34 +
 .../media/platform/toshiba/visconti/Makefile  |   10 +
 .../platform/toshiba/visconti/csi2rx_drv.c    |  791 +++++++
 .../media/platform/toshiba/visconti/viif.c    |  598 +++++
 .../media/platform/toshiba/visconti/viif.h    |  379 +++
 .../platform/toshiba/visconti/viif_capture.c  | 1285 +++++++++++
 .../platform/toshiba/visconti/viif_capture.h  |   21 +
 .../platform/toshiba/visconti/viif_common.c   |  239 ++
 .../platform/toshiba/visconti/viif_common.h   |   45 +
 .../platform/toshiba/visconti/viif_isp.c      |  911 ++++++++
 .../platform/toshiba/visconti/viif_isp.h      |   19 +
 .../platform/toshiba/visconti/viif_params.c   | 2034 +++++++++++++++++
 .../platform/toshiba/visconti/viif_params.h   |   24 +
 .../platform/toshiba/visconti/viif_regs.h     |  717 ++++++
 .../platform/toshiba/visconti/viif_resizer.c  |  491 ++++
 .../platform/toshiba/visconti/viif_resizer.h  |   18 +
 .../platform/toshiba/visconti/viif_stats.c    |  301 +++
 .../platform/toshiba/visconti/viif_stats.h    |   14 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/videodev2.h                |    4 +
 include/uapi/linux/visconti_viif.h            | 1921 ++++++++++++++++
 33 files changed, 10586 insertions(+)
 create mode 100644 Documentation/admin-guide/media/visconti-viif.dot
 create mode 100644 Documentation/admin-guide/media/visconti-viif.rst
 create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
 create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
 create mode 100644 drivers/media/platform/toshiba/Kconfig
 create mode 100644 drivers/media/platform/toshiba/Makefile
 create mode 100644 drivers/media/platform/toshiba/visconti/Kconfig
 create mode 100644 drivers/media/platform/toshiba/visconti/Makefile
 create mode 100644 drivers/media/platform/toshiba/visconti/csi2rx_drv.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_capture.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_capture.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_common.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_common.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_isp.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_isp.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_params.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_params.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_regs.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_resizer.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_resizer.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_stats.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_stats.h
 create mode 100644 include/uapi/linux/visconti_viif.h

-- 
2.25.1



