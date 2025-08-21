Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DE0CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSW64KWlEWguGEP5S6aHwmfVaZSZlb36SUEt3aN4gtI=; b=x5XRaIAzkYK8EQuShpjVXEI9Sh
	4dMeStxW/SBZ22NaXY8ln8C9vI138MM5aDnV+4QmLsC0GQRZtFfgsl8lNiGvrVsXTqXF0zjsuyWKP
	Iv0jdeCTa3eylQGSZO2c45Tr5oGy7OHqhrgh8ICpp5y00Oar2La+Vmn9yPnhggBKcr3Z2jLXZ8ABG
	VA2OBQBLyQU4Oo1L9hHoT/HqByKZ07/8e8kCMRoXx6//iszb8cr0/9ghMIizlWLVSN0q/Ne/ksS/C
	tRsUAxCnzrvLshQ7MD37QPOmHCtpLGWau0eS6UTAdIcecromxsHRWOTQdl9w+gIxlwiKrjx2FgIU2
	AcjFz//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7KJ-0000000HPgc-2S5j;
	Thu, 21 Aug 2025 15:35:43 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4bO-0000000GvhH-0VGo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:41:11 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250821124108epoutp0334758daf5c62ac1ddfd1ede9b4a1c01c~dyKt0INnm1135811358epoutp03j
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 12:41:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250821124108epoutp0334758daf5c62ac1ddfd1ede9b4a1c01c~dyKt0INnm1135811358epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780068;
	bh=YSW64KWlEWguGEP5S6aHwmfVaZSZlb36SUEt3aN4gtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QWXx8Tb211F14jUMSrcwT07DY7tg/o+idoGrQraXOqpAfx+TwGAeM9Y8kBjDv+4Ox
	 4YDHdVWNmCKBzze9otwaUXMP8wH8BEAlYTNhm4ENoecs6qsA0141K6a97exhYIgwd+
	 uZFv1gmF08usf6AqhXs0eeQlC3tr4Wt7o80yXL7M=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250821124107epcas5p3d0165e6d8c4fefbe9990d4ed54b437af~dyKtBAz0d1592915929epcas5p37;
	Thu, 21 Aug 2025 12:41:07 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c72xG4gNtz3hhT3; Thu, 21 Aug
	2025 12:41:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250821124105epcas5p402a0f6ec6a893d0e5e305547976e4c80~dyKrZpFEa1534115341epcas5p41;
	Thu, 21 Aug 2025 12:41:05 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124100epsmtip24bf607fee6cda2466f7f16b0c3a40894~dyKmvfG7k2624826248epsmtip2b;
	Thu, 21 Aug 2025 12:41:00 +0000 (GMT)
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
Subject: [PATCH v2 10/10] arm64: defconfig: Enable Axis ARTPEC SoC
Date: Thu, 21 Aug 2025 18:02:54 +0530
Message-ID: <20250821123310.94089-11-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821123310.94089-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124105epcas5p402a0f6ec6a893d0e5e305547976e4c80
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124105epcas5p402a0f6ec6a893d0e5e305547976e4c80
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124105epcas5p402a0f6ec6a893d0e5e305547976e4c80@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_054110_471817_A471CE8F 
X-CRM114-Status: GOOD (  10.41  )
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
index 5bb8f09422a2..f94c1357d6f5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -38,6 +38,7 @@ CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
+CONFIG_ARCH_ARTPEC=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
 CONFIG_ARCH_BCM_IPROC=y
-- 
2.49.0


