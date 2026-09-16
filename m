Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA49C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=BZnyq9Veye6+ufVVuEqP6BfT4hxNX17wkGGrO1drTUY=; b=FQzTQwL5CDJzWt
	cNk0FH0WJNw4BopJ6LxGf3pipttoV0OMHNNuV0rxHqcaf9m4SSaf7bGGrkkQu8PQUvjfGwWkakDdj
	7FTtr+Lao3d3zp8okhJtXcLfY/vi48A0A5jB62ysWOKAKSPEr8QMQ6ulT4DRJv/fRAL3JkhRq2pZE
	bcOseeROkmgVgSD+4jjHsVheiiGhccmR7Yv53CD5s4DcjONqVUWLdUJQb88p8MXJcDflM/buFsIYv
	xYzgLxykhzGGJKvDERMFNGpdS6TZNkbG2rQ11tKjc5scj0GqtJYZAgR7MWStv/z1pUATRDvc1U7BL
	8mhw2Tb1HFpUpVMbt7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ogE-00000009A7e-0fqd;
	Wed, 16 Sep 2026 12:24:02 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6og9-00000009A6f-1XtE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:24:00 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260916122349epoutp022a207b59d0e4ab594a80e55d3c243273~VzKODy1EO1976519765epoutp02G
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 12:23:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260916122349epoutp022a207b59d0e4ab594a80e55d3c243273~VzKODy1EO1976519765epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789561429;
	bh=BZnyq9Veye6+ufVVuEqP6BfT4hxNX17wkGGrO1drTUY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=A71J4W9hLJQNpjok+1HwdX4sRCyCWwBXguzo/PQZFRa6kXY1PzdXRk9Y1watHkKah
	 9Vjmfzwn6hcap0xD3rVxWALhb+QVaNtqFoL9mWGWQ4Us4bRup491IZk6dvAqy8bFK5
	 0BpefsEbU9bXUOv9K6vCPyuZUoJHugEzzM07zoik=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260916122348epcas5p31c4318d2b535edd2096b90a9bb79abdb~VzKNYvzaX1679016790epcas5p3c;
	Wed, 16 Sep 2026 12:23:48 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hlJ2r1NXQz6B9m7; Wed, 16 Sep
	2026 12:23:48 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260916122346epcas5p376bd1f05910537d3e0025aac2a62ddf2~VzKLmJUH92587525875epcas5p34;
	Wed, 16 Sep 2026 12:23:46 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260916122343epsmtip238d3a5d0068aef2b1b5d55f5177ced2d~VzKIxlwz41938919389epsmtip2f;
	Wed, 16 Sep 2026 12:23:43 +0000 (GMT)
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
Subject: [PATCH v2 0/3] Add USB DWC3 support for Samsung Exynos8855
Date: Wed, 16 Sep 2026 17:52:26 +0530
Message-Id: <20260916122229.2604003-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20260916122346epcas5p376bd1f05910537d3e0025aac2a62ddf2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122346epcas5p376bd1f05910537d3e0025aac2a62ddf2
References: <CGME20260916122346epcas5p376bd1f05910537d3e0025aac2a62ddf2@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_052358_140545_52B91162 
X-CRM114-Status: GOOD (  14.59  )
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

The Samsung Exynos8855 SoC implements a Synopsys DesignWare USB3 DRD
controller. The DWC3 core on the Exynos8855 is instantiated with the
generic DWC3 platform driver using a flattened model, where the
controller is directly addressable without a separate glue layer.

This is the first Samsung Exynos binding using the flattened
representation and this series adds the device tree binding and platform
driver support for this configuration. The binding follows
qcom,snps-dwc3 pattern, a single node referencing snps,dwc3-common.yaml
for shared DWC3 properties, with per-SoC constraints enforced via
if-then conditionals.

The MAINTAINERS entry is updated first so that the new binding falls
under the existing ARM/Samsung SoC maintainership.

Changes in v2:
- Commit 2/3: Clarify this is the first Samsung Exynos binding using
  the flattened node representation.
- Commit 3/3: Add the compatible entry in alphabetical order in the
  of_match_table.
- Link to v1:
  https://lore.kernel.org/all/20260903071250.3421499-1-selvarasu.g@samsung.com/

Selvarasu Ganesan (3):
  MAINTAINERS: add Samsung USB DT binding to ARM/SAMSUNG entry
  dt-bindings: usb: Introduce samsung,snps-dwc3
  usb: dwc3: Add Exynos8855 to the generic platform driver

 .../bindings/usb/samsung,snps-dwc3.yaml       | 98 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 drivers/usb/dwc3/dwc3-generic-plat.c          |  5 +-
 3 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml

-- 
2.17.1


