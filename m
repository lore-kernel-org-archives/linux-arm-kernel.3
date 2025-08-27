Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CA8CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 05:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=WUXp9lG7X26uP7murNUm5kgTEUw+iAz/NoMGgwgkXEI=; b=Ek74/3Q1nD7puQowHbkjNFjhby
	Lo/NCHYxIp3XssnzK/5r9h1WIEd1FbVig9ggyb5zZ17TC2WSHX5tVD0+RNS3oxgu5nMS1GPLx1X4W
	DxkqH2tqlvUaMDsLvb5xAamkvWVB2Xov+t1Rd8naJVN+KezwXzOqk3OpsRj9d0wZeA1RnUqK3eJoT
	GJ5JeQwtkE+X3n2RMJHLfxWFjkpF35gvau9ajdZeSbPrJDbhgcO2hQahTfVMSiYeK5Pd8f+gXXL5V
	Bb6Y8ySwCdPbqs5AfqFVwxM5BiPB1rJii6vVxQQCGV3HdBLjc6TxMjyKSoy7vtQBuAI2FLiY7HrZ/
	sDAOaezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8QK-0000000E59y-3L9n;
	Wed, 27 Aug 2025 05:10:17 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8Fe-0000000E2yl-04fV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 04:59:17 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250827045907epoutp0285c36a2fca5e722609a2c5796273310a~fhvCFu5rs3032030320epoutp02c
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250827045907epoutp0285c36a2fca5e722609a2c5796273310a~fhvCFu5rs3032030320epoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756270747;
	bh=WUXp9lG7X26uP7murNUm5kgTEUw+iAz/NoMGgwgkXEI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=PFozBq2PABiLrMMGdNDfnYS0qeUAZ4gQ/TyGCL4iVM/2raVzLyTDmHy9iKyTQvr2I
	 VLjPrOhuXNlcB794I9/ucdisI+ZpeE4DZTYQw1THeWQzNtgsuv+x35C3mlrDw2hUU+
	 hr46S6zlLBPy9iBVAAsHikc/8YunaH5vbuV0iPzA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250827045906epcas2p40026048003f6d8216bc9caba963b5182~fhvBe0NlJ3229232292epcas2p4z;
	Wed, 27 Aug 2025 04:59:06 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.102]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cBXPP70F0z6B9mK; Wed, 27 Aug
	2025 04:59:05 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7~fhvARTiXQ1734917349epcas2p2u;
	Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
Received: from mclaren.dsn.sec.samsung.com (unknown [10.229.9.108]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250827045905epsmtip2fc5355cf5088afd226e12a4f77c10640~fhvAK8HCh1766017660epsmtip2D;
	Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
From: Kisung Lee <kiisung.lee@samsung.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Mauro Carvalho
	Chehab <mchehab@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Kisung Lee <kiisung.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 0/4] Add DT bindings and driver code for Scaler
Date: Wed, 27 Aug 2025 04:47:16 +0000
Message-ID: <20250827044720.3751272-1-kiisung.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7
References: <CGME20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_215914_546828_5A9BD509 
X-CRM114-Status: GOOD (  13.89  )
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

This patch series adds device tree bindings and driver support
for the ExynosAuto scaler hardware. It adds YAML binding docs,
updates Kconfig and Makefile, and provides initial driver
code to register the Scaler device as a V4L2 video node for
video processing.

Kisung Lee (4):
  dt-bindings: soc: samsung: scaler: exynos: Add ExynosAutov920
    compatible
  media: samsung: scaler: add scaler driver code
  arm64: dts: exynosautov920: enable support for scaler device
  media: samsung: scaler: Add Kconfig and Makefile

 .../bindings/gpu/samsung-scaler.yaml          |    1 +
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   22 +
 drivers/media/platform/samsung/Kconfig        |    1 +
 drivers/media/platform/samsung/Makefile       |    1 +
 .../platform/samsung/v920-scaler/Kconfig      |   17 +
 .../platform/samsung/v920-scaler/Makefile     |    9 +
 .../samsung/v920-scaler/scaler-core.c         | 3640 +++++++++++++++++
 .../samsung/v920-scaler/scaler-regs.c         |  744 ++++
 .../samsung/v920-scaler/scaler-regs.h         |  406 ++
 .../platform/samsung/v920-scaler/scaler.h     |  621 +++
 .../v920-scaler/videodev2_exynos_media.h      |  162 +
 11 files changed, 5624 insertions(+)
 create mode 100644 drivers/media/platform/samsung/v920-scaler/Kconfig
 create mode 100644 drivers/media/platform/samsung/v920-scaler/Makefile
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-core.c
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.c
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.h
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler.h
 create mode 100644 drivers/media/platform/samsung/v920-scaler/videodev2_exynos_media.h

-- 
2.25.1


