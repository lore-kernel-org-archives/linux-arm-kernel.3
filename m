Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7F8C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqAYBDAVCYCQi9MMMbeyCHhhscUCDXvB1ISPevufvf0=; b=OcgNUvaEWorfAgcrqcc/SxfF9p
	sNv56XtIsfn8M0LZRexIZQhTLH2wRiKiqj/XUhpkTeuWQTATssa3iM6lQJQjEYP4WG6N83cuQgt9N
	FfEsOOqnP0w+pJfzVrp5eqaqahlL1SuFHYr4Vhr1YnF2e4ejH4oIcjURgA1y9ijgRO3WeTFsWAcvk
	OMH0Gwhc1SwT6mzmGygFb6lDjhV5oET1xqlk5lm1Oh+nV+CIs3Lt/dnYg6ElJT/rLxF8OqvD8DxLN
	GX/xKWh3q1zeBpuThogB/ZCWS6UvZYFmA63RTJroZx1R0dm49a7+ytztc0l3fyJ80V2IFyBJMR5kb
	BTYMQenw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmso2-0000000Gy4T-16jq;
	Tue, 25 Feb 2025 11:08:54 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsAM-0000000GpCY-0F44
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740479274; x=1772015274;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fqAYBDAVCYCQi9MMMbeyCHhhscUCDXvB1ISPevufvf0=;
  b=gXJOMJzs8kdTGf2Gyetjs1P5r/7LYLBHCtX5QWkklJ3OMTCxmwxJSx2N
   IAyAIIDQpPdPqveQyPqghOrNrECdAETDkSdHCVXDYanK+A41YZgLGMBMo
   +Gtu3g6+9HlEksu6zsfiorOiS8R4voHB3Ro4zdGyw84hGjbZC3NZp9PPu
   orZXkMuORhCKGAQ44/gjs3tDkH/tEyt1o6oKs7hgQKF1s7XN1KKMjtsTC
   cMBA3zbjdKzGPiEgGH2jQLGKUAESuvkDidMRt2aDqzUqPt0F8OOmOoivo
   lPdJyWvZ++vzy6H9A5MuohF1PkS2ab8dHqEAaywHipz3fh+5vt6dcox/C
   w==;
X-CSE-ConnectionGUID: b7gwE+2dQ3io9DJjdqHNgA==
X-CSE-MsgGUID: /yDPvrG9T0Wv3Xt0KwMUNQ==
X-IronPort-AV: E=Sophos;i="6.13,314,1732575600"; 
   d="scan'208";a="42067836"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Feb 2025 11:27:53 +0100
X-CheckPoint: {67BD9B29-C-28232521-C0C2250B}
X-MAIL-CPID: 498C7020E3CB29D871E592514CF28AC0_4
X-Control-Analysis: str=0001.0A00211A.67BD9B28.005D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AA071686BB;
	Tue, 25 Feb 2025 11:27:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740479269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqAYBDAVCYCQi9MMMbeyCHhhscUCDXvB1ISPevufvf0=;
	b=eNqu3TvP8uyJl7sLxEQ/ahL7dSqnuRZO2267pF8q42Tjb0trgN6q++9Jh6NfTQPH2UuqPx
	+iVs/E0O4zuK9HvLCxylypzT++uq4x0H/Wh2N7F0ckZbigC40iVAC05SFA+OpiGbg81+n/
	bmGtXjgQMkIJsRDxeK+xgYR3YucIV8t34HpmFt5+m67rmCxyK2IufsP72WQ2qeADg0f0ix
	dolfZLytlwFt5j3A9Z8jfce85F8PPOyeo6Ik7Qd6aLQnE13jIG+ywNCSFjdONC4wk6rGX9
	MkCLJ9/gYCr667DKhRyWM7VHftTDE7OBwnfVysdssP9092f58FqTk9eIVFv1Yw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 2/3] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Tue, 25 Feb 2025 11:27:22 +0100
Message-ID: <20250225102726.654070-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
References: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022754_392373_4E5CEA7E 
X-CRM114-Status: GOOD (  11.02  )
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

IRQ mapping is already present. Add the missing DMA interrupt. This is
similar to commit 9d9c56025e429 ("arm64: dts: imx8-ss-hsio: Wire up DMA
IRQ for PCIe")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index d52609e4fc455..e80f722dbe65f 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -69,8 +69,9 @@ pcieb: pcie@5f010000 {
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
2.43.0


