Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAA3FD8FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcFCnv0cKdWyH49bkY0HloB9Tdx8I3uW4jqI9l2KHIQ=; b=ae5GGlxGi4k9+N8nfcnqHc3FVj
	/J88QG0M35GosDxNyNn00PkeF+RrO4Q3qIZLMrqlr2rUkZoVfMArxW5jiOu/nYgXm3s/KrbgewVNq
	GMN+hSpKbLc/cwmNAYw0PPg8NfN7GJgkKWXhyoMkIrhOp1VHrRJXcGavt3AJnYo8x6/cNScWLdd4y
	WNbb+P1PT4BFp0uDIou3QLvDwjXHVXDZhOaEFH6AJUb99Gft5jOFVesbGkvq81Agqf5KCTYSLhRRn
	9NewCznih5L1GWoqXnx9plSLhnI6BUxSn81s+kDgjQvfzZmM6thoYTlCNGIyPsDQM+36KM81NyYm7
	HVSMpO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdV9-00000006XSo-0rSB;
	Thu, 26 Feb 2026 15:42:07 +0000
Received: from mx-relay128-hz1.antispameurope.com ([94.100.132.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdV6-00000006XS7-25pi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:42:05 +0000
ARC-Authentication-Results: i=1; mx-gate128-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=pcFCnv0cKdWyH49bkY0HloB9Tdx8I3uW4jqI9l2KHIQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120359;
 b=XUnLv8hHdm+q0C8gVXoSLsqxN/cWSgoxc3nxHpfHic4NkrLQdTgubNLsVqJvj3oAqe8fDUU6
 SWpSoIBb9HpBnun+/zoL1gk/XFpTXBbhM9ZKEFfYoRMHvruPcCuLoxwpAuKPSTsAhyzZH8HiTWW
 sOWaI5z1HNeYYaxBhLVlU0TMBqPFrDMzW6bqw3xHAL5KVqHgBRxHmrYdmchAXAqZvXH/hW96egv
 9FWyMdVMaXNLM/gYFUEtYV9IOZ/xauCCh/PUoN+ZGfBdPUPKYoIikgVdjoravHUQMxrDnUAy9GQ
 vyP46xWHY6khKPgdvVk5Nc1/pe9h8zrGT7Vlznmd1EaQg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120359;
 b=FYcyTWV8Ypdi1mHe9VclNQTD+dUrSL+N9pbE1kxT7WaYbhySfH8XZzbqDXZGD0JD6Sb9WZTi
 2ENcyZmduzBrQ2qbnCqz5bt5u6L01mxRsoFySFNHxaq5e5LZ7zuCd0S64zVcSHwBg0xXq4Q1Izq
 JIS9G2qkgQvkWx15UCC29sEax4yTjGmTFMmsx7jGPJ5x5Pg8q85I9nlXymFijeaozWoDJXuJvQI
 s6VM6UD24qeJBV98bD45ijc1QVgVSp4mxuymLqqJZXcD49/WIPM3pit7d3xZie+kol/NOhpZdaH
 xr5a2JfGY0ykkbBib5TMqXSnVt7U447YfLOxUKlS62+RQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay128-hz1.antispameurope.com;
 Thu, 26 Feb 2026 16:39:19 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 92AA8A40AB4;
	Thu, 26 Feb 2026 16:39:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v3 2/5] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Thu, 26 Feb 2026 16:38:51 +0100
Message-ID: <20260226153859.665901-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay128-hz1.antispameurope.com with 4fMFxP5yjMzvRJq
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 1fde6229671282bda88180e09167ed21
X-cloud-security: scantime:1.821
DKIM-Signature: a=rsa-sha256;
 bh=pcFCnv0cKdWyH49bkY0HloB9Tdx8I3uW4jqI9l2KHIQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120358; v=1;
 b=NRLqTKrn5Xyy9HJmPaa7UiQCy184eHddY1mPEyRU6CIesBN8HRV7foefEjTK+o66R/TWgJnC
 GjmI4kB6xJ+FuBxE1pupLBOKLbk2JlHuuRTbzxIhwwADDMzI+LQlBefCdPjL+Cjzo52sxs9w7bF
 lKqSLihqlS3dpNVFrSEiRnkCjfETbF+nUHjE1u3IlCVac6L+/TTqkagIrd8TpGPVw4h7KHwcqk1
 XxxRVgni6d5OSOVYVydboskU+iUvF8ViCNO/MAk/80I+6kluVgqSvWSl1iD4B90ta0Pu4e2XJ5b
 mhvO2Uo1D9SCScPFNP8UJXLPlU9slCT2efA48z2MBly/A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_074204_705753_6E40E342 
X-CRM114-Status: GOOD (  12.48  )
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
similar to commit 0b4c46f9ad79c ("arm64: dts: imx8qm-ss-hsio: Wire up
DMA IRQ for PCIe")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* None

 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index bd6e0aa27efe9..f2c94cdb682b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -20,8 +20,9 @@ pcie0: pciea: pcie@5f000000 {
 		ranges = <0x81000000 0 0x00000000 0x4ff80000 0 0x00010000>,
 			 <0x82000000 0 0x40000000 0x40000000 0 0x0ff00000>;
 		#interrupt-cells = <1>;
-		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi";
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi", "dma";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		clocks = <&pciea_lpcg IMX_LPCG_CLK_6>,
-- 
2.43.0


