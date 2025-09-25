Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08005CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 12:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=v5cH9LES7CXkOL+qaPhX/B3bxNvyiZkJjrfEZit5rpI=; b=SFX8Jjc0uDZe9KITUPLNan0Iho
	pJe4+AJMbZqQjas52gHKRh1jmki91GBEmJe/XPLYKlQ6jd8MMbN489Y3vHv5bEbN1zL1724TgS/s+
	Ageg7OATWhHWstEAZEj6vNi2/vJaq9Nfnnzj10Jbi6+Vd3dWoes+vrdhY5WOiaptwUqznJdpVVm8q
	S9FxJFDnjdkiPIS0eg80RJiminxxDDpUCE3K2lMsyYILmEhPGTbzRNWgT+Gof+Nyh878bG9DG+Au8
	CrnL5NQIHCcFXhFqtguEB/3mX37FLhpyyskVbV0GBnDjyZxqeRgd/3/MQKdq/UAJef/zRuUpEIje7
	OnWRbxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lWV-00000009ASw-42pa;
	Thu, 25 Sep 2025 12:56:35 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lWL-00000009AQE-1UsN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 12:56:29 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250925125615epoutp02184902ec90d0f857f2b63c51d225c843~oh85oCaz42292322923epoutp02L
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 12:56:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250925125615epoutp02184902ec90d0f857f2b63c51d225c843~oh85oCaz42292322923epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758804975;
	bh=v5cH9LES7CXkOL+qaPhX/B3bxNvyiZkJjrfEZit5rpI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=O8rYNWpMxFP/cm/PjjKgktqBRxE/aLnp4vP9DJPBLC/5+oQ7JOo3OmCGnenx8GB8L
	 APWa+fUC4Vlc5K0/SD2OBkpmHBmLXllA74wKiWDe6MswGUltlrelgDSlkP8DveRW4i
	 Oalp5TRpiZrCbkaswT/scaplIvouBcICXvyxWnAo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250925125613epcas5p254231a146bfd35bc25fe4b5a9d068153~oh84jUPFq1889718897epcas5p23;
	Thu, 25 Sep 2025 12:56:13 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cXYcY1cm3z6B9m9; Thu, 25 Sep
	2025 12:56:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250925125612epcas5p3c8ae07ba60294f861aaaa79b1a1d7613~oh83T6-vM0858208582epcas5p3k;
	Thu, 25 Sep 2025 12:56:12 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250925125606epsmtip247b2865e7da971a49bf7e81841bbf39d~oh8x4J7r41150411504epsmtip2A;
	Thu, 25 Sep 2025 12:56:06 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH 0/3] Add clock support for CMU_MFC
Date: Thu, 25 Sep 2025 18:34:54 +0530
Message-Id: <20250925130457.3476803-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925125612epcas5p3c8ae07ba60294f861aaaa79b1a1d7613
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250925125612epcas5p3c8ae07ba60294f861aaaa79b1a1d7613
References: <CGME20250925125612epcas5p3c8ae07ba60294f861aaaa79b1a1d7613@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_055627_656109_3248116C 
X-CRM114-Status: GOOD (  11.84  )
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

This series adds clock support for the CMU_MFC block.

Patch[1/3]: dt-bindings: clock: exynosautov920: add mfc clock definitions
        - Adds DT binding for CMU_MFC and clock definitions

Patch[2/3]: clk: samsung: exynosautov920: add block mfc clock support
        - Adds CMU_MFC clock driver support

Patch[3/3]: arm64: dts: exynosautov920: add CMU_MFC clock DT nodes
        - Adds dt node for CMU_MFC

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
This patchlist is dependent on patches to add clock support for CMU_M2M
Link to M2M patches: https://lore.kernel.org/all/20250915095401.3699849-1-raghav.s@samsung.com/

Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add mfc clock definitions
  clk: samsung: exynosautov920: add block mfc clock support
  arm64: dts: exynosautov920: add cmu_mfc clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 13 ++++++
 drivers/clk/samsung/clk-exynosautov920.c      | 45 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  5 +++
 4 files changed, 84 insertions(+)


base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781 
-- 
2.34.1


