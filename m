Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242E9CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 05:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OaX8SYxIlvnIjTkW++dFL0U3/EmZSsNqRJJF3Co8hI=; b=Nt7k69fJdc54DS81ASi5O04csC
	otG08/3ro2NBtfKcX2SoHZUmXN/WTeZpU5+X3gLdWUOAXsYY/zzGFTrmmLGSvaacxsdkqm6AER6MB
	MTwfkmvEIJUpSKY2BOYSVPAogPco2YbDFgh4+QUtYX2Q5vcbWDVCi9lz+uxK3GNs8tcJ/NTegKbFs
	/O6mQ8+60l3xeXWUbdS0n8KUBVYQEzm8PgAVqTstYQ0fiXYmETFqGxbCvf+BtA2mHvI8XfnjUNybs
	8YFZLNIrX9cWjj6ln+RNWoLO8saA0yR7Dd2ZuixofIjKf2Vu6JPyjntkvvFNnslWrktL2rs9Esm3z
	TUc0pxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8L1-0000000E4OO-3nZV;
	Wed, 27 Aug 2025 05:04:48 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8Fe-0000000E2ys-04eZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 04:59:16 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250827045907epoutp0169dba223cf75c96a9f41377df948a0ab~fhvCYFnSp0285602856epoutp01R
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250827045907epoutp0169dba223cf75c96a9f41377df948a0ab~fhvCYFnSp0285602856epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756270747;
	bh=4OaX8SYxIlvnIjTkW++dFL0U3/EmZSsNqRJJF3Co8hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FTX85omXfrgSzUmKDRyWP3+NX1JgnQV87XUHKwsChnIDBwL2m8HzAyqMDuSCZVBaD
	 UX4mOQ3eo1HEpJ8ALuY4/32IKdV9PRQ+TA/4Gl20v7lW8BR5mOFN1P8v9Nt0F3f2Yv
	 GQg/RA3sfpp0aVbZxEWu9J0eFDBsQMDbcjL6hVNM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250827045907epcas2p2330c46b8a707ebf26928786595989d76~fhvB7xaPP1733617336epcas2p2C;
	Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cBXPQ5GpDz3hhTQ; Wed, 27 Aug
	2025 04:59:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250827045906epcas2p2198037517886df0714e24d8d908a6c57~fhvA-1I341733217332epcas2p2Z;
	Wed, 27 Aug 2025 04:59:06 +0000 (GMT)
Received: from mclaren.dsn.sec.samsung.com (unknown [10.229.9.108]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250827045905epsmtip2928268d367150f1c7d2d0e8b4493e7bb~fhvA3r_Mm1856618566epsmtip2d;
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
Subject: [PATCH 4/4] media: samsung: scaler: Add Kconfig and Makefile
Date: Wed, 27 Aug 2025 04:47:20 +0000
Message-ID: <20250827044720.3751272-5-kiisung.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827044720.3751272-1-kiisung.lee@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827045906epcas2p2198037517886df0714e24d8d908a6c57
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250827045906epcas2p2198037517886df0714e24d8d908a6c57
References: <20250827044720.3751272-1-kiisung.lee@samsung.com>
	<CGME20250827045906epcas2p2198037517886df0714e24d8d908a6c57@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_215914_547841_6DD3F1EB 
X-CRM114-Status: GOOD (  15.19  )
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

Add Kconfig and Makefile for Scaler driver directory.
This will serve as the entry point for enabling and building
Exynosautov920 specific device drivers.

Signed-off-by: Kisung Lee <kiisung.lee@samsung.com>
---
 drivers/media/platform/samsung/Kconfig  | 1 +
 drivers/media/platform/samsung/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/samsung/Kconfig b/drivers/media/platform/samsung/Kconfig
index 0e34c5fc1dfc..baff5f7b9c3a 100644
--- a/drivers/media/platform/samsung/Kconfig
+++ b/drivers/media/platform/samsung/Kconfig
@@ -8,3 +8,4 @@ source "drivers/media/platform/samsung/s3c-camif/Kconfig"
 source "drivers/media/platform/samsung/s5p-g2d/Kconfig"
 source "drivers/media/platform/samsung/s5p-jpeg/Kconfig"
 source "drivers/media/platform/samsung/s5p-mfc/Kconfig"
+source "drivers/media/platform/samsung/v920-scaler/Kconfig"
diff --git a/drivers/media/platform/samsung/Makefile b/drivers/media/platform/samsung/Makefile
index 21fea3330e4b..7a9e6f126628 100644
--- a/drivers/media/platform/samsung/Makefile
+++ b/drivers/media/platform/samsung/Makefile
@@ -5,3 +5,4 @@ obj-y += s3c-camif/
 obj-y += s5p-g2d/
 obj-y += s5p-jpeg/
 obj-y += s5p-mfc/
+obj-y += v920-scaler/
-- 
2.25.1


