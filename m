Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0965FE73153
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=FwFqYqYfD15PAdwyyngrCMvzCO2FQbIKwm0H2nGhazc=; b=VI1LaFHLt3wo8X30a8vlGinuUW
	Gy+gX3EafHHmWukTJtxc45Fx2XM3LNMYae3qyQiTY5FmymxZYWS4itJJRyoH44FaAPGqhkKPsALf+
	BsG9zye+peVcwJos29eMQBHai+/z542kAKtekoH0pi/oYvLH621z7VAYNJjlR86NaLwTlUtiiNwYe
	D2TyEnahvRZ2KOiGb7VpqekbCFW1qQKyKhXWqZihaCCDwFHgszfRUYt0tUGvqpp9uBRCCdW0e0I+3
	a60tO7Trfnd0dZFPQzyNmLDeyJgiafP6p5zSzV6Iv1v4zLq7030UTSufv0V2oErCOc8d1zfSyvlzA
	6pbPSjjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr2O-00000004nmv-3B8z;
	Mon, 02 Feb 2026 10:20:08 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr2K-00000004nkt-1QSg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:20:07 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260202101954epoutp04ca958e1fc9bfede651f605a26ee3742c~QZrgBHVB71801918019epoutp041
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Feb 2026 10:19:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260202101954epoutp04ca958e1fc9bfede651f605a26ee3742c~QZrgBHVB71801918019epoutp041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770027594;
	bh=FwFqYqYfD15PAdwyyngrCMvzCO2FQbIKwm0H2nGhazc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=G7e7tKyKPr5aobWH5L10YT6N2ZSmWQ8gM1VEwEHERz6/xRmv9nrvHYUmURD4RIknM
	 2NCfImvJvqSbq+ukcisEb1axJIvflwCf4Jm6ofLd63yCP4jk0Nx0c1Vkp2AJAnzOrJ
	 83ta1cTVPDaiL7QhRVx9zHEN4PckBwyRbcO4WhqM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260202101953epcas5p276fc3ec430574a19245421b56232efbd~QZrfadcfL0758407584epcas5p2x;
	Mon,  2 Feb 2026 10:19:53 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4f4N084nqWz6B9m5; Mon,  2 Feb
	2026 10:19:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260202101952epcas5p37eb879d5f55e7bdc8a90b86abe34eb4a~QZreJ_-_G2979829798epcas5p3_;
	Mon,  2 Feb 2026 10:19:52 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260202101949epsmtip1d80c1ee20aa6ed9ccba1120809826f39~QZrbwpLJ31774317743epsmtip1L;
	Mon,  2 Feb 2026 10:19:49 +0000 (GMT)
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
Subject: [PATCH 0/3] Add clock support for CMU_G3D
Date: Mon,  2 Feb 2026 16:05:52 +0530
Message-Id: <20260202103555.2089376-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260202101952epcas5p37eb879d5f55e7bdc8a90b86abe34eb4a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260202101952epcas5p37eb879d5f55e7bdc8a90b86abe34eb4a
References: <CGME20260202101952epcas5p37eb879d5f55e7bdc8a90b86abe34eb4a@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_022004_904157_93CBEC74 
X-CRM114-Status: GOOD (  11.55  )
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

This series adds clock support for the CMU_G3D block.
G3D block is for Graphics

Patch[1/3]: dt-bindings: clock: exynosautov920: add g3d clock definitions
        - Adds DT binding for CMU_G3D and clock definitions

Patch[2/3]: clk: samsung: exynosautov920: add block g3d clock support
        - Adds CMU_G3D clock driver support

Patch[3/3]: arm64: dts: exynosautov920: add CMU_G3D clock DT nodes
        - Adds dt node for CMU_G3D

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---

Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add g3d clock definitions
  clk: samsung: exynosautov920: add block g3d clock support
  arm64: dts: exynosautov920: add cmu_g3d clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 21 ++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 13 +++++
 drivers/clk/samsung/clk-exynosautov920.c      | 52 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  6 +++
 4 files changed, 92 insertions(+)


base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
-- 
2.34.1


