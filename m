Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C45ECA0FEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnmAPrcDCYbR1J1LfBH1PHR8aqxWFYZaUH5QmVjWvUc=; b=sqbfamv3bxDBUMd2yCAGqi1VuC
	cUdnH7MOMgIayD/IhPla//guxzL4ITNNNNYGmdEwvYYUXhKN5WnVYDBElVWx9QR8bhNGWUr78cuNh
	coYWP+DrZQe83/uTzipKt2c62yh7JcEuWo9YFYls/P9sWsYWiHZeS9gAzOhjhCYavbrXonSOohQvl
	eXngt9U03K1fwq2ee21y2rCwpSLLXR6t8tfvOzo0GsrD8G16EI/4YBeDhUdleiq7e5NUVA8SRaSZn
	+qmSTte4tteDr4uKsyNj0aJtlSnOJxCOr3Wspf8N9+KFa1EdIoxH0ZiLLkeXMvpLbV/0yX+Wcbxex
	wi/3WAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYeq-00000008L3d-1afd;
	Mon, 25 Aug 2025 14:58:52 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVzK-00000007sFg-4ACR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:07:52 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250825120749epoutp03ed35e8f3c992d5025d95b09500bc2415~fASw5zy4R0361603616epoutp03G
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 12:07:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250825120749epoutp03ed35e8f3c992d5025d95b09500bc2415~fASw5zy4R0361603616epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123669;
	bh=AnmAPrcDCYbR1J1LfBH1PHR8aqxWFYZaUH5QmVjWvUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r4cGUTpoApKczt3GjXArsmCp4QaqUun1y7MmKSl/EybKKfiE0ZD8ec3wIvDMagerK
	 8aZk7cuX+LkLBO5R37+TS0vXI9Dn+n3ObPBcOiiKeM44XemlQjxvOreQQxpRbiX4pC
	 lWhdJIKZcBTPSt17Yssp3hb0ApBLVtG7oRwjY/zs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250825120747epcas5p483e7f344784066315a172cdcf464e69b~fASvrZITq1478414784epcas5p4u;
	Mon, 25 Aug 2025 12:07:47 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9V0y6HNgz6B9m6; Mon, 25 Aug
	2025 12:07:46 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250825120746epcas5p42d5fdba608b004e1f2c1c45eda5cac5f~fASuCju4O1478414784epcas5p4t;
	Mon, 25 Aug 2025 12:07:46 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120741epsmtip24d882255f849d5c4b7962bcc0ff37751~fASphoe9a0172101721epsmtip28;
	Mon, 25 Aug 2025 12:07:41 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v3 10/10] arm64: defconfig: Enable Axis ARTPEC SoC
Date: Mon, 25 Aug 2025 17:14:36 +0530
Message-Id: <20250825114436.46882-11-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250825114436.46882-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250825120746epcas5p42d5fdba608b004e1f2c1c45eda5cac5f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120746epcas5p42d5fdba608b004e1f2c1c45eda5cac5f
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120746epcas5p42d5fdba608b004e1f2c1c45eda5cac5f@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_050751_193431_2DA61952 
X-CRM114-Status: GOOD (  10.11  )
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

From: SungMin Park <smn1196@coasia.com>

Enable the Axis ARTPEC-8 SoC in arm64 defconfig.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..6660d3ee6f99 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -38,6 +38,7 @@ CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
+CONFIG_ARCH_ARTPEC=y
 CONFIG_ARCH_AXIADO=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
-- 
2.49.0


