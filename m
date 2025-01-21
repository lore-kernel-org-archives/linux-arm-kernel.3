Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2BCC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8Io2FVm8ksYxt/jYkMsqo3Fs1cQ+iTHjGXr/XIuer4=; b=nPN+36TyVyxs1KLPbAUuOzVPym
	u+EGlrQCxHiY/Q1qCr7o7UtdzsZtzntApP0CAhzn7MTXiAz3nUfwfTcvj/uyskNGLezWuSRDJnO9B
	6aGbhu11Fjd2cHTYG6qPCEV4UN2+xKiB/K3ldiN+OuA2X4PHXJAzZ4h+fd1vG/v30A/MpVYTLtTaT
	yPgun2N+VOdDsa9Gbd43OwuXhr0zrGXofuKT8XHLHTY39Ja6ejQyHo1VDnyNCMlnTJqCsG2bJ/pxw
	jxF68GgSIT6XwKPaku7UoT2m2SiIt8NqMyRsqxmf0/9ELTqF2C1uBb1Xabp+DDmYSuLOqtSxz2EAS
	0fS5Dn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBas-00000007bQN-2uGa;
	Tue, 21 Jan 2025 10:34:50 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBX3-00000007aJ6-1M1Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737455453; x=1768991453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K8Io2FVm8ksYxt/jYkMsqo3Fs1cQ+iTHjGXr/XIuer4=;
  b=CRw7vZ5lK50IRJ9j/UlfKFV9pOufbs3dAg+iGlrXxN5Q4ScfAz7qSpqZ
   3jAHtgtGUi6Uk0K+4JRxdsTVA7tuGqC2anCpxzk2bYtCHjzDLm3HSRCFA
   lgaIWgEc8yOoBA4zc4I/DIrqeovFWGXe3myiF2DhKIVHRXdrBnXPJkZ7o
   I4klazBpEJHI3qDEm7IACXia2iNu84bYdPm+58xQk3LAHjNUk8rPUSVkK
   h1fYZz98Z9RZh8g5bjx3Xzgg2+FR7LbU2vDmKCLwS1kXs16zS0e6bMcsS
   IH48/LFigGHXy4fiKTpwPXDz5t+M6cnL2/Tblwkuccoy+G+lFtBluRF50
   w==;
X-CSE-ConnectionGUID: lHRgaHtbSzq4R9L+1fLhFA==
X-CSE-MsgGUID: ECk7eBBnQyyZdp3zZMWYaw==
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; 
   d="scan'208";a="41196382"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jan 2025 11:30:52 +0100
X-CheckPoint: {678F775C-46-1D00F64B-E6C57517}
X-MAIL-CPID: 75279A3BF38464E7B5BB908EE17BFC21_3
X-Control-Analysis: str=0001.0A682F22.678F775C.00BB,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B757C163693;
	Tue, 21 Jan 2025 11:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737455448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8Io2FVm8ksYxt/jYkMsqo3Fs1cQ+iTHjGXr/XIuer4=;
	b=QjOqyfbd6NNHlvVZA4iOB/P6NzkcI7rZaG0n4Hr57foRvXX/g1SFZv6DUVnvT5gc6HqatB
	q5vtCn0wVV8RES4UNFhyt6g/cQjV4dwWSnA4ONKvtwygCWVjPaorTzPmZhnBLtABoVXw2G
	uRM6EjxhvQLX7CXV+9u7SvfsCK3taZMBRYG/UoMSEP6G9vgM7P+bzezBBoWPgHUn5U0n7u
	c+pnw5GxiYpSAvJUah6EW/zLKXy/tIJLtRlh2WfVp9oF1yOaOHQUAYb1aggP4bxk2P5GgX
	xqPKTew5SSkM+85hADshXJMmH47xB2e3RX9oKvf5LuKbV96CTPiBoleInQa7+A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: freescale: tqma8mqml: Add vcc-supply for spi-nor
Date: Tue, 21 Jan 2025 11:30:24 +0100
Message-Id: <20250121103026.1404856-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
References: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_023053_663036_0C75F4CF 
X-CRM114-Status: GOOD (  10.28  )
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

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index 8f58c84e14c8e..b82e9790ea205 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -65,6 +65,7 @@ flash0: flash@0 {
 		spi-max-frequency = <84000000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+		vcc-supply = <&buck5_reg>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.34.1


