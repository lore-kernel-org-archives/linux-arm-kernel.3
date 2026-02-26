Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A35FC5918
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLPqE0j6hp14YDJfWRRlBQ9s7sIP3JqSbJujXTK94MY=; b=2QONU/sbUYFyNu6QiIxgrD5SsW
	bjermWq1YG/6/dbN0X2IIq4XBRKIgK7C35uTIsL5CY/rb0+DHUqZhzIj8ubSwZSkVN9ca1VLPTkkT
	iOJiazNg62eoErLsmmXypy3DvoxM6NYMFimlLAACQBbCRAknvD8Fh5HKygXmfEa17j0b8azNvE2CQ
	Rr6I7344KtDe2/O6R9BS/t9qIxnD/g/dONarPWiH/xHyaMpCzvZhOk0LnJlhtoEOS7Ovtbuzl/YuM
	rzaS62zaOAoGpja2PRCA8FcFMdZqHXvjLzOun1lnC5wm0an2Rj9fL2O1zGwvzlcBLBJpmlsXH127S
	z1kYGseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAa-00000005j4i-0AdO;
	Thu, 26 Feb 2026 08:56:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAG-00000005iui-3ta4;
	Thu, 26 Feb 2026 08:56:14 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772096164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLPqE0j6hp14YDJfWRRlBQ9s7sIP3JqSbJujXTK94MY=;
	b=QQkVUKFf+GnE5OnlECGNuAz5CmGJ2fdqGToowYQvLhheozd1Qvq/116NPVHZGyPzWdZB/F
	OCjuXSIrg5OocxOSGRbl3Acc0h0MCoJtrvUhggFY9xfTMWHl6v7Aof8bvnYc7J8bVl4J12
	Hnk76OoBkje2VSu3chE4LSHswzGBBiX0pLpKOl1OjPU573A8WYHHDcUpEmiGIoHzaMcSVw
	KE3nxS8Ka5KW+QZTGN7uFOMLTd0RnQg5UWt1Ud/0HCOl0DwyrGXstDR49Bii5JR2EA4Mo8
	5lYgRvPkXsP9mV50jtaXpoaY2D29bPVMqnyBQT8kVHTv/OAD4IVS2cDqR4F8Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772096164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLPqE0j6hp14YDJfWRRlBQ9s7sIP3JqSbJujXTK94MY=;
	b=W/6z7IE8a+EU5+PLedv/uBfvNOCezZBjNAdgwNlSStx8clkxM06PZgtRycvuu6Iii+IzrU
	foCkPjLH1/XH48Bw==
Date: Thu, 26 Feb 2026 09:55:56 +0100
Subject: [PATCH 3/6] arm64: dts: broadcom: bcm2712: add camera backend node
 pispbe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-raspi-dts-updates-v1-3-60832d20ff04@linutronix.de>
References: <20260226-raspi-dts-updates-v1-0-60832d20ff04@linutronix.de>
In-Reply-To: <20260226-raspi-dts-updates-v1-0-60832d20ff04@linutronix.de>
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772096163; l=1063;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=4yhwJHqJ8mRGZwRqgzheUigdPtyQBU400qjbkzPeQbg=;
 b=lltfORfUj39o0ujhdEIHlUztFsoa2ypY1+8DsqBODq2uz8ckKO+H/vdA1uDUONvHpfOzfsSyN
 Ktaf0n9pGQqCPV6B6Mxx/Cj0Mpv/SQC2w0a1ePAtjDy4PRCHebKQKpZ
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_005609_114189_98DA438A 
X-CRM114-Status: UNSURE (   7.49  )
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

The bcm2712 found in the Raspberry Pi 5 has a PiSP Image Signal
Processor back end image processor.

Add the relevant node to the devicetree.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 69bd2934b93b34fef27989f9ddcd8a860979ab5f..98cb2173137ecda89d7f7ca1456598ff27231196 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -648,6 +648,13 @@ mip1: msi-controller@1000131000 {
 			brcm,msi-offset = <8>;
 		};
 
+		isp: isp@1000880000  {
+		     compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
+		     reg = <0x10 0x00880000 0x0 0x4000>;
+		     interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		     clocks = <&firmware_clocks 7>;
+		};
+
 		v3d: gpu@1002000000 {
 			compatible = "brcm,2712-v3d";
 			reg = <0x10 0x02000000 0x00 0x4000>,

-- 
2.47.3


