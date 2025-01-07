Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F004DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nl2Wc4zXUTbFhL3xUOlfZV6Tk0P84aqkDxVPBN8GdpI=; b=woilh87IxEUUFSRz7cx3WaoWSH
	h5NRWm7SyUsVmpCLcDY1qngP//N253I1IMFdx7tNBJmc06pRXYcjfyPZ8x1AZ8SXe8UUqyuUekjJK
	yBvB1k/lFucO1BhiiZmFNxexgHxvObSd2RoIcl/HMH7fZClgWUM2xXICn8fgnL1dQ5+04sH6o57mz
	rfe+C0aZUQxh0/53uB5IEhJT/NzdfcflBsXRsGSHPLo0BE/iI2cgJnf4NBW4KwoP4Pc8SjbIC+EN/
	Vu/3IhxtRIl9fhONY93nUU+XAq3uE5WzFxijDX6OsX7xi8koeJWDyBXIc3aDE+iap9+M7suJao1pV
	n9dc/DWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVACW-000000056MK-1a00;
	Tue, 07 Jan 2025 14:04:56 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVA99-000000055Sx-2RRY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736258487; x=1767794487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nl2Wc4zXUTbFhL3xUOlfZV6Tk0P84aqkDxVPBN8GdpI=;
  b=JIZi7GeuDrnieqV7KORjLtp58PAp6uKTJTiSYhvULAmZ3yuMfp20n0CR
   KybeUHrEhItgWA+qe5+hmwrroHce1AC9ue8dZxkleNNmyboIoXkEWUYoE
   k1uQZ55AjQS6ABwYBAxC+/Y/T6IP+punXlSeo0N7I9KzQNLJWhv7gWfMg
   fKVmSNjSrg70Vfxo3oOfnipHx+u0KdGEaFJO8zdyrXavF+0oTBXgrO/1o
   3C5PRSFMzfBiZE8q+qbkiVt0x2hM/8V26mIyS0+Rz2aMe9hibJYtsfDEN
   rm2sl8z/ic6SutQBpuXFU7NcK65xMHjE5JYQWwrlKlbSmOe81QH37q8mz
   g==;
X-CSE-ConnectionGUID: 1IK2yk7QSOqvaaM0iR1QwA==
X-CSE-MsgGUID: AQhxRHawSISrFnO0xIS4dQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896217"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:01:26 +0100
X-CheckPoint: {677D33B6-8-C6D8D88D-F91F9E6B}
X-MAIL-CPID: D7D2787E713A3DACCFD60F87EDE56897_2
X-Control-Analysis: str=0001.0A682F15.677D33B6.004B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CD2D164EE1;
	Tue,  7 Jan 2025 15:01:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736258481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nl2Wc4zXUTbFhL3xUOlfZV6Tk0P84aqkDxVPBN8GdpI=;
	b=Yxdx8cijniKdkyEuN+R2sxLiK3xugzxbK4keySoct4rTSGF4qyoJZUD7rE00B+17joOJm+
	/m133xHM+8oXgwonSSXzhYsAqE1YSWJMBvRslbSySNjqAN4WLKYt7nzU+VIisYVDDIflha
	QfD6L8r9jCajXs1ogWwEgYVH3i6iVhUPzV16oH0vAzYbCqFZP1ok5Dr0Yqbk+wNBSuvtsv
	F4bVR/qpd3hKmYiTjgENqsVAD0eErR2+5GDnWV/UFrw4fzvzRHwAeMmBZB2u/cQM1oehsZ
	tF5Jm82dk29g1ukfip/ZFdFtU602rQ9+creNskUAsYMgpP57MVWmWBK7glkW6w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/5] arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
Date: Tue,  7 Jan 2025 15:01:06 +0100
Message-Id: <20250107140110.982215-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060127_927933_6F378B34 
X-CRM114-Status: GOOD (  10.95  )
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

IRQ mapping is already present. Add the missing DMA interrupt.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
index 70a8aa1a67911..4bdfc15487cbc 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
@@ -57,8 +57,9 @@ pcieb: pcie@5f010000 {
 		ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
 			 <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
 		#interrupt-cells = <1>;
-		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi";
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi", "dma";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		clocks = <&pcieb_lpcg IMX_LPCG_CLK_6>,
-- 
2.34.1


