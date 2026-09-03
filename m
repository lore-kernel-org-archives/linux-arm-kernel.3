Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B78C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCdLJlrIN03j/CIVgPnvOgdBX8wfdcDBNztR/gGl+Rc=; b=ztn5csMalRlDpGTVr6hI1Z33YF
	5uJLWMBWGQps2dZ3WOu7KhHmclXNEesKTvH8aNC45tmTXenTEXdN4yuHTgWimxE/eFKOwRk4lFmCr
	rAU49qmkws1CNv8C7XiAvz9A8otMASfzFHsGr0hsLAaPvcMQ8P4hx1/wIOxcvwAelvQqYebTIAqdB
	jeFgASP8nilqtZZKLySq/N0azUk00UhTY/oetrpE7p/Y/lafRj5fvitXphJHCCUj3R4GIgQPew00J
	1QGQJP4RQRMd/aRlnmbgx7XcRUG57+ZvucmW2e/+YuuMcZdcYVS6+a/SrhVNKh53kSqPN1FdLkoYA
	9HFaM07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21dc-0000000GXvu-11QS;
	Thu, 03 Sep 2026 07:13:32 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21dZ-0000000GXu4-34oM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:13:31 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260903071324epoutp038c68916b60092de5008c847821b8ed92~RvievrrLq0619806198epoutp03C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Sep 2026 07:13:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260903071324epoutp038c68916b60092de5008c847821b8ed92~RvievrrLq0619806198epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788419604;
	bh=JCdLJlrIN03j/CIVgPnvOgdBX8wfdcDBNztR/gGl+Rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iKp/zBNAPEtFpQzwtekQioLghsMa0ShivUjfhAqOFHMwohrmxGxpUp4W4boZF2Cbw
	 AZ4F6v2NQF0lcZAbiLfvuk7ZZF2c9hPQcQN/oUJdQltnVJZoHoe1a91xiWctmgsT9h
	 6jhtnJolwN2iBjdl6wK29FB5p/4SGXqBrVafbc2A=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260903071324epcas5p1bb7f15cc70b6ddd46137c030baa76192~RvieN8LMu2007920079epcas5p1V;
	Thu,  3 Sep 2026 07:13:24 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hb9mg0PWGz6B9mC; Thu,  3 Sep
	2026 07:13:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c~RvicuXxpj0076700767epcas5p2S;
	Thu,  3 Sep 2026 07:13:22 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260903071318epsmtip182ee7ec0ffa77001464110471004fe89~RviZYp3Gd2579025790epsmtip1W;
	Thu,  3 Sep 2026 07:13:18 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH 3/3] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Date: Thu,  3 Sep 2026 12:42:50 +0530
Message-Id: <20260903071250.3421499-4-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260903071250.3421499-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
	<CGME20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_001330_105530_6B13746B 
X-CRM114-Status: GOOD (  13.87  )
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
platform glue.

The "samsung,snps-dwc3" string is used as a generic fallback to support
any Exynos SoC that utilizes a flattened model instantiation. This
fallback allows multiple Exynos SoCs to be supported by the generic
platform driver simply by adding the fallback compatible to their
respective device tree nodes.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..33a76c37d15d 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "samsung,snps-dwc3", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.17.1


