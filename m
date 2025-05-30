Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CBBC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 23:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDVWNwdVtG1KZhnutJdWeLg3yjHz2NQpZ8yUV0l1SDI=; b=P89ZEGUFm+0w3AWYLGyRLkL+K/
	1iRcMT+Y/+Gqe5EZmTSYqaBWIuBJacRKAlmYZ7i7MDyWJXEn32nqPDYCBesx24wSQTacz5pgkjzrd
	fqfewca4YIYIyMF/bayzzzVujOCKsbsmoE1oIUHePDa1zn7877oSlX/pHa/du1M9+EibLspeTaJoU
	jisD4DUksGpB68AkY1KASX9FGG1tPFpJQR8XSUKd0aJx4k2uDqw+Kz3ZEWVCRyL8WmlzsXmKLyv3d
	pKjH5v59g9UJMoNKygFTsRkrMPzYFNrsGvIw6dAxIUiKw9iiUUnORXmo+58cGYOZjpwV57MwdjJKi
	Hg4vTyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8kQ-00000002Cra-2Rn7;
	Fri, 30 May 2025 23:02:46 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8do-000000029jc-0TZ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 22:55:58 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4b8JVs3HsFz9t27;
	Sat, 31 May 2025 00:55:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748645749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDVWNwdVtG1KZhnutJdWeLg3yjHz2NQpZ8yUV0l1SDI=;
	b=TuvIHkAd4CYFNKwS7j6IyBdIMdjkJtm1d/DR2TwkRythVPTgrWsoqUc/azn4lwb+XKTDLd
	/bFAZZTdpKJQfvCCrUqtIbqONgaWg/dT9IZeVagvvyx+ksNDEGqf51D65f5avhh/gsLndL
	39yt1waZ561I2pKseLC2/KhNNdmD0a7ssFSHrhGTfptB/d+Gu8aIJY8sqKNy+6SF/o5ELA
	Yw2FSTJaGAnNLM66CudnC26QWUg4uxecfWrhWhBWogVch42dx2LKZMBKHRmtdGzoU51C5k
	9sIRaavuxVfRazMAeqVtaxCCtmsR/BtG6hxg34D0PrKZd4YTjrJrdnhlaD+eeA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748645747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDVWNwdVtG1KZhnutJdWeLg3yjHz2NQpZ8yUV0l1SDI=;
	b=DWS0EUCHpxOq/PXIS6Lk8FBPzX1MHT0uvXTxst/lN9954kFb3KTTdamT47y2ANt76tA8Qr
	g+queoPd4gK5FKbrWLhmeWiS2FNLpWQifedWeeYA9wq0R29H7MinTH6uB+W4Q3NE4UWKRj
	0zk3kDlIwseiaIxSpdwdPdekmSSMlVdErRdHOy9+1zyFr0t31hYI6AcWF9KVYyggxTkpBl
	unc+VAImPEEcICVQIqEsJtDImypky97OxnKE64rD4H9/AXs2m5dZogJTuvVwzuYPz63DLD
	2c4O6Kc5P82b3z6yHBvgKreujutZMi82TFPS9EMKVYeeye9eR2DQ1Tthtzkjew==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: renesas: r8a779g0: Describe root port on R-Car V4H
Date: Sat, 31 May 2025 00:53:20 +0200
Message-ID: <20250530225504.55042-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c1f4a7b45a214c9f739
X-MBO-RS-META: p36aga13zprur5pijcq3q7ogtmuqeksh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_155556_301152_657C4231 
X-CRM114-Status: GOOD (  10.02  )
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

Add node which describes the root port into PCIe controller DT node.
This can be used together with pwrctrl driver to control clock and
power supply to a PCIe slot. For example usage, refer to V4H Sparrow
Hawk board.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: New patch
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 6dbf05a559357..8d9ca30c299c9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -798,6 +798,16 @@ pciec0: pcie@e65d0000 {
 					<0 0 0 4 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
 			snps,enable-cdm-check;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec0_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		pciec1: pcie@e65d8000 {
@@ -835,6 +845,16 @@ pciec1: pcie@e65d8000 {
 					<0 0 0 4 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 			snps,enable-cdm-check;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec1_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		pciec0_ep: pcie-ep@e65d0000 {
-- 
2.47.2


