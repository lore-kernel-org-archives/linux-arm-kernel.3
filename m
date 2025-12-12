Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A8FD44149
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 09:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84P47lxHC3BLIWqL12zvfUpIKwtTk6oo/ph1IGpKWdI=; b=q51ppUUUwEtAfJRMArJqdsps/L
	06ha9O6TKPFdGLT5nWJbtsP0ugmAM9P1SwaMWmq2YSpX3f/5oUVaRylWOv64uYJOWEpXaj2DHFfmu
	kHtBQ+nOG/xraDR44mWQImNh0W/kql2i3KtJAK7tWk+8roZHa53A2zZzrNBf8fjiRjvAs1smp3sjM
	JivUeWmTAJ3GKpQF0AHds65Yf07sWzJIYgIHIerUCxGO3PV3CoYvW9PvwzEFfjchw9rm8WAcsMbBO
	CwmB9jMGmrw+Fs39cafcyMSXecbDmuXjI1Nyasd6CetQyda2NGSLq09jAoQ4grQbvPLxSySBR2DPI
	Bt4ZMU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz0H-00000000IFK-2a6r;
	Fri, 12 Dec 2025 08:59:57 +0000
Received: from mx-relay10-hz2.antispameurope.com ([83.246.65.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz0E-00000000IEG-2TXk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 08:59:55 +0000
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=84P47lxHC3BLIWqL12zvfUpIKwtTk6oo/ph1IGpKWdI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765529976;
 b=czDGDF3JF+E5hXngrqtTuFfOXG1bjIH4Cy8/ncdDE+G7uEgQoVMcY6M4dPBuuyoFDOvGlthw
 Iklyz42xZzRcJkEd+0RrULglHnXwQm8hf5MX1vbQj202w3Sz23xclZIHhqF6cfSk2Q062FHf1BD
 oRQ8KUnuI+05zJks3b9VAaa8Lq2Tyhzww/9NXr1IijIMS5vT9S0dGReXKNMJF9SqqcnO1mEUrXI
 lpHs4nlradLmdlN/OqTPcsCKcWilGpRTbSjbiq0esFWmCFJ+X0KUBlChhk6S9WkTCoZJTkpGA1E
 mavrVe38LQaBlmJiAZMtrDx9HY7Pzac2+cU3RjfdRRDIw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765529976;
 b=M5fcGje2mz5BVQ7aBa4nbKTKLlTqm/nGH7XsAOYy0BT5JyknhZMoDzqZ8y7w64K5OgqFIuhi
 e0LPwDHzYVT4HMiG0kj8/tPGnxq8LEAV5/m9kb8TpvPuXDOiL4R0KmcjkHLHadqImiD+9ypNVrY
 A/FLmm8+xw54h/5p9fZWUVmyVcefZ+vOkgjcSYVFXDxgnk+eLloANbldhDFYs4tyQLZH7eCHzxP
 ahf4Sh+S4aYSleW/YzxcvNGsd3HBlHfsFfxF/rdAByKUmSt1/mAnucGvzxuLcGoG1YtdU3Khl1m
 0j2/q2DkT0heSiXajAJj7t8p5NjPlc9Sy9Q9+x3xpwMUA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Fri, 12 Dec 2025 09:59:36 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 69CACCC0CCB;
	Fri, 12 Dec 2025 09:59:11 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: imx6qdl: Add default GIC address cells
Date: Fri, 12 Dec 2025 09:59:00 +0100
Message-ID: <20251212085902.103507-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
References: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4dSNg41V2Cz4FKLF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: bb4a7dffaef21819fc1d7783b77528b3
X-cloud-security: scantime:3.879
DKIM-Signature: a=rsa-sha256;
 bh=84P47lxHC3BLIWqL12zvfUpIKwtTk6oo/ph1IGpKWdI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765529975; v=1;
 b=OMqynqqB2HyRiq4p29kKt9EaFxjNzrTa65PlNc2e7uu9ok8+7mGsHrhutHweBWCbYK48lVny
 /hlZVHBf4scV684AwT+2743z7DIPcrkbm5XiFZKZzrDabtQA9LAdATUwYB94JKvaf6uLSTaO3ur
 +JnCgWKYmUk7iPcGUAn7hKuJghl0qKYWB0iqCYqyyhVWwuqUpYWO68b26ntj2AfTMI8CqX7wIXX
 AX0EcGS2yXGYUz7tzJk/n8LsvWqTY5M1z/6FyPfBpH7Mi6fbP6mp4h7fDH0C0eKiUphr8KiopAY
 cCIOEDhzWfqnWddraYddx3kQv2iEZz6ngBo43wMDoFK2w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_005954_773012_EBEF5335 
X-CRM114-Status: GOOD (  11.90  )
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

Add missing address-cells 0 to GPC interrupt node to silence W=1
warning:

  imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map:
    Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback

Value '0' is correct because:
1. GPC interrupt controller children are only power domains,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This is based on commit faf183a02ed6b ("arm64: dts: imx8mp: Add default GIC
address cells")

 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index 45bcfd7faf9db..9793feee63947 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -875,6 +875,7 @@ src: reset-controller@20d8000 {
 			gpc: gpc@20dc000 {
 				compatible = "fsl,imx6q-gpc";
 				reg = <0x020dc000 0x4000>;
+				#address-cells = <0>;
 				interrupt-controller;
 				#interrupt-cells = <3>;
 				interrupts = <0 89 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0


