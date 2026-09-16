Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897C5C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKL6HImdTiqBULRthcBWF6Nv0t3+2obCrlxnJAI24Vo=; b=aOQCKnM+8dR6q2BaVvvQUX9S8o
	r3gK8Gb/Lelu1qupC/zC7Un20TI/22ApMNp3qa0bKKsPiB9BTBIPXDZsG+D1OVyw9KFcpYERUf1sU
	/8ljlq3wi66L7dpIEeoqsoSX6EKA0FypuMX9WncqmKQOSe1efqiDjCurMo5YoDSgvBgTQ4EPcXdpP
	rZaYRowA6kVhUG8ndQzI1b7KLdc8Q2qPNruH8X1AEKwgd3YVtQ1/T1nV2NXd8P9Wy2CielL2sI6pV
	B5aWeI7VOvKdye2gMf4gTtEretrPoIj00xr8ectk86r77tAbKAVtyCJ5+Z8wwcOpxrUdm0sAPST1V
	FIekW73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ogO-00000009AAU-1MzX;
	Wed, 16 Sep 2026 12:24:12 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ogI-00000009A8n-1SWn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:24:08 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260916122359epoutp02b9a4b937f4125221ce7b4ad6ced71c99~VzKXtGHCF1976519765epoutp02M
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 12:23:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260916122359epoutp02b9a4b937f4125221ce7b4ad6ced71c99~VzKXtGHCF1976519765epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789561440;
	bh=fKL6HImdTiqBULRthcBWF6Nv0t3+2obCrlxnJAI24Vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RUu6s6C1rO3r03Ron2UQrDWMzfW4zswX+fH56Yv6sXAlsj5s7250UDMScV2X0IZR6
	 V9fCYpdjJE2bYEgs7bJvWS+lqgXw8iPQ8wTTF2iybXq1EWtdFql7WukjqMr4n3HNV7
	 MsIOudhtDT7TsvWGaaOnCIIiW3InnsdVmv1wmBsk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260916122359epcas5p4d7652fb157b69e8523d96d7139a526d4~VzKXLNoit2123921239epcas5p47;
	Wed, 16 Sep 2026 12:23:59 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hlJ322qQlz3hhT8; Wed, 16 Sep
	2026 12:23:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883~VzKVr2h4q1679016790epcas5p32;
	Wed, 16 Sep 2026 12:23:57 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260916122354epsmtip23a7f3a74468b642496b307c223b4c8c2~VzKS51nxf2261622616epsmtip2_;
	Wed, 16 Sep 2026 12:23:54 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, mani@kernel.org, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v2 3/3] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Date: Wed, 16 Sep 2026 17:52:29 +0530
Message-Id: <20260916122229.2604003-4-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260916122229.2604003-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_052406_727714_19D9BD59 
X-CRM114-Status: GOOD (  15.77  )
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

Add the "samsung,snps-dwc3" compatible string to dwc3-generic-plat so
the Exynos8855 USB3 DWC3 controller can probe through the generic DWC3
platform glue. While at it, alphabetically reorder the existing entries.

The "samsung,snps-dwc3" string is used as a generic fallback to support
any Exynos SoC that utilizes a flattened model instantiation. This
fallback allows multiple Exynos SoCs to be supported by the generic
platform driver simply by adding the fallback compatible to their
respective device tree nodes.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..10c1146564b7 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -232,10 +232,11 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
+	{ .compatible = "samsung,snps-dwc3", },
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
-	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
-	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
 	{ /* sentinel */ }
 };
-- 
2.17.1


