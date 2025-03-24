Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3008CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WicwLy8Ia4IgEGPwRCubgPpXY8Bf4XQ7rwKIuQhB4mU=; b=d1tRTssNmM9q5Z/dGl3WyTwWaD
	9GY5wfNXkkKf9E73pAON/Ukg3VBpm0H0EG07Wd5MdXnw/RShcMwWj4gEY9bUw4jNbYkYEJSw/WfWY
	WTJ9rqNrC3FfFBHbvEtrwfnWd5n1Wbj23lvhSFtLZVIH6bGjGvfOpx/JWA/+k97pSdInWTVo5CfAN
	m0B3Yt0ayDPxNWL33Xd774fIS1HI1fWpxAce+l/jAQnfxVt+MTLuu+t4w/jLqfFX0Jl5JX7cJDPwd
	NDCO7k4BiWna1C3QYqFUQwsRJGTuzVkCJwtGxEavdzzKtzVH6kZwpeA4Cd4w4cBUapAePwPblQ8D8
	3pb/BB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twc31-00000002QYV-3ygF;
	Mon, 24 Mar 2025 07:16:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbxq-00000002PWx-2hTE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742800274; x=1774336274;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WicwLy8Ia4IgEGPwRCubgPpXY8Bf4XQ7rwKIuQhB4mU=;
  b=X3ZhijCM/RKkf16igLVq1BIaZDlwGdnSUuO3s4aEI1BSyay43l+n+C+G
   +FCLOw43xxj8UNLE1vetPexfj1UCfqJS15kFEuLIPLBsjE3k895v2l5L3
   YFnmz2ThsppSTFlwjHZktdDN7taYuLKfO+8bQsW9Uu1ziEinRow7S2UHm
   mRxBVr/afx2eY7fd2PR9deI6NT0PkZSoal2snbFY4TO1cXZmeB/aFmE3f
   gPyTmWynnR9gz8ejUxXtQne6jFEp1cxGPq7eqdqJHuNBM+azj9S+iNZsP
   DvBaQwhhdehKexc3wg2xMILhcIQBkQn+alqGQAgD1+oRmzSffFic8fNjq
   w==;
X-CSE-ConnectionGUID: waMxGU0qSR+ZyXVE3a9JbQ==
X-CSE-MsgGUID: uaNuE4RPReuhCNIaFbgCuQ==
X-IronPort-AV: E=Sophos;i="6.14,271,1736809200"; 
   d="scan'208";a="43112353"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Mar 2025 08:11:12 +0100
X-CheckPoint: {67E10590-4-DC4DC9A0-F4F29281}
X-MAIL-CPID: D351269095FE72D618E19934B7466377_0
X-Control-Analysis: str=0001.0A006376.67E1058B.002F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0412516531A;
	Mon, 24 Mar 2025 08:11:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742800267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WicwLy8Ia4IgEGPwRCubgPpXY8Bf4XQ7rwKIuQhB4mU=;
	b=aCq86mTlGFfY1qsXJwvQxCt/uMBelhsIwKkcWOgU8bq5mdYmHofCeFfIe7dji1+XIF/b4R
	4ryHu3MMU9VqmXNxGyYVHddx3LRRUCHXcEqBlM3ikDxDL5YCgWuULWugLmQx5WLZ5qAuh1
	3s+NM6iEWtBIOqukJwXpIr+lngDafogzRBmRa6UOE/HNoEonafdMTW/8FOxcfGJVHMNsoy
	TT6yAYtcZDVVtUl4Jmdvl50eZU9TAFUoWnm7hR6p3F9xe1/fwS0Wr3EsyOw8RuxcUaox+2
	GanXLb/NAiLL1+xM9fiXgFCs952qmv/6WPe/zGDoq9FLIob+iTmzrtfUsVpCTA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add LVDS device tree overlay
Date: Mon, 24 Mar 2025 08:10:59 +0100
Message-ID: <20250324071102.23765-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_001115_020559_C6F47A3B 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>

This adds an overlay for the supported LVDS display tianma tm070jvhg33.
The LVDS interface is the same as for MBa8MPxL so the already existing
overlay can be reused on this platform.

Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d6212..d7ac8dda4bde5 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -247,8 +247,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
+imx8mp-tqma8mpql-mba8mp-ras314-lvds-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
-- 
2.43.0


