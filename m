Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAD1CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 04:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xl82Otcai0y60jQ/O2jr10UdDoE6TM4ftxxvpBCLJQM=; b=vPXoB0wsS/3h/ShDxzf9SDtYfe
	B8rCS4W830Ak2FuMLm6cgDmBHeP8+fUBDWZ/xjFthvNSg4wIJgFpp8gSECacQZkkXbg9ToOzCSuWf
	wcUZa5/5q+Y13MROOZRn0rySoLOh9KHpAccJUy0tr2X+Sq7kOtZU9Dd1cgRf29ITvMPWfPug59qVR
	eJwEN9df27v1BZyFGs3ABy0caPJRkPzFhlJBYJ/pMi5EpIcUN4WmNoaKUhXlMkJCeH+kG1bdOE6ZL
	vwSMGtxnWLw+Af7PKBjgWzL0trbVc8TkQLVZGj+PWy8j8+xUy+MxSvwPTURpr5seMqAa6Jtz63Bfq
	JHRQONXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrfC-00000006Tva-3x3c;
	Mon, 18 Aug 2025 04:40:06 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrcb-00000006TZi-0iQr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:37:27 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250818043719epoutp017ed4e6f51fec821b7d80601a58aebc3e~cwocAWd8B0358403584epoutp01V
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:37:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250818043719epoutp017ed4e6f51fec821b7d80601a58aebc3e~cwocAWd8B0358403584epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491839;
	bh=xl82Otcai0y60jQ/O2jr10UdDoE6TM4ftxxvpBCLJQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jYemU/V/NSIjwx2P2zVz9QHeHiLPzTGKU2zfEGt5cM3QJ98lu1YulWakYgzC4fqaF
	 /DqnWCrvI/dYcihH0SF2zLDz2TJj+hO73tSW8MkpwsrkmcER3U5HKa5zpDK40ztgJh
	 ao1k7ANX4H9tXiS9fefTxWHjCrNltBMyc7oQ03uI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818043719epcas5p4910c652177a448bc6bad489f6c7e881a~cwobik0sO1032010320epcas5p4g;
	Mon, 18 Aug 2025 04:37:19 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c50LQ2Nhjz6B9m4; Mon, 18 Aug
	2025 04:37:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a~bp3W8Nc0d0355303553epcas5p1H;
	Thu, 14 Aug 2025 14:10:03 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814140959epsmtip2c60bd3f2bed42df98c8f3e5a092a9a7a~bp3THPJDQ1586615866epsmtip2A;
	Thu, 14 Aug 2025 14:09:59 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 01/12] dt-bindings: clock: Add CAM_CSI clock macro for
 FSD
Date: Thu, 14 Aug 2025 19:39:32 +0530
Message-ID: <20250814140943.22531-2-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_213726_651253_B812D0E2 
X-CRM114-Status: GOOD (  13.88  )
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

CAM_CSI block has ACLK, PCLK and PLL clocks. PCLK id is already
assigned. To use PCLK and PLL clock in driver add id macro for CAM_CSI_PLL
and CAM_CSI_PCLK.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 include/dt-bindings/clock/fsd-clk.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/dt-bindings/clock/fsd-clk.h b/include/dt-bindings/clock/fsd-clk.h
index 3f7b64d93558..58fdec8f4c2a 100644
--- a/include/dt-bindings/clock/fsd-clk.h
+++ b/include/dt-bindings/clock/fsd-clk.h
@@ -139,5 +139,18 @@
 #define CAM_CSI2_1_IPCLKPORT_I_ACLK		10
 #define CAM_CSI2_2_IPCLKPORT_I_ACLK		11
 #define CAM_CSI2_3_IPCLKPORT_I_ACLK		12
+#define CAM_CSI_PLL				13
+#define CAM_CSI0_0_IPCLKPORT_I_PCLK		14
+#define CAM_CSI0_1_IPCLKPORT_I_PCLK		15
+#define CAM_CSI0_2_IPCLKPORT_I_PCLK		16
+#define CAM_CSI0_3_IPCLKPORT_I_PCLK		17
+#define CAM_CSI1_0_IPCLKPORT_I_PCLK		18
+#define CAM_CSI1_1_IPCLKPORT_I_PCLK		19
+#define CAM_CSI1_2_IPCLKPORT_I_PCLK		20
+#define CAM_CSI1_3_IPCLKPORT_I_PCLK		21
+#define CAM_CSI2_0_IPCLKPORT_I_PCLK		22
+#define CAM_CSI2_1_IPCLKPORT_I_PCLK		23
+#define CAM_CSI2_2_IPCLKPORT_I_PCLK		24
+#define CAM_CSI2_3_IPCLKPORT_I_PCLK		25
 
 #endif /*_DT_BINDINGS_CLOCK_FSD_H */
-- 
2.49.0


