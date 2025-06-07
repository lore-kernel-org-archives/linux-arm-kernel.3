Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AC9C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 19:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMRfokKzKXH1ZLU+7tVQpEyn332oudckXH5+iv7xEkE=; b=qFrqXF1ImD3XBd5hkjmckm8SWB
	X/zHnn6lrV9K8/AYuzDhzpAY9JKYOSp58W2t+IPoAYxcoHq4LtkNPLTWpS8Ti5LmkONF9G2OiKUQ7
	wnjzd42PBXRFXR79Ku0AflErrtGN7+O0hzCzeI+vXYWyRYziCCoY3kh0gkNvHoOTlp+9xKzP28nIK
	lFTQCMa69G276a+B0ojj4Q+Q420vRUyfidNO7Ox6aeToeTsq7xrGPzTeV67flDLITdnv26EOXnqwk
	Gfm8XstS8FfVCaYxE6TpzsIrde3CvBRBeH4INlT8LnlKFmzL2b8+fRi3EwfEFBlcs3V5jkSHw5H2w
	FeA77qKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzX0-000000020il-3MpV;
	Sat, 07 Jun 2025 19:48:42 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzUk-000000020Rs-3kaJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 19:46:24 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bF7wV079wz9srM;
	Sat,  7 Jun 2025 21:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749325578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMRfokKzKXH1ZLU+7tVQpEyn332oudckXH5+iv7xEkE=;
	b=geA2P0Drbx6sta3rzcEF4JSJW4o5voDpuSAT1PKcMI74Qy0RuRNDjlWoto8pKARGo5ZN6L
	ZvmYW4o7qPo0WWuhoj6JXfYw6Rc9cLwdCuVV+ulfQjQkre/QLc0bQWe+h1b/b0k6GPOpz0
	h3uLsPil7MAlRkmDY2F32evAKJOVALKGrBOXniXNaPLqWAfZyqUZeYL4RICTakyR7Oys22
	tLJxXtn/IjDZL2q91iAKZtlTfmdtXf2UwjoMQS86pA28C9hMzBvBgGaFcSc/Z6swk2oOgp
	gyHzcTLkLI6ucIKDs5YJVPwKqrFF915aqET3UPAwRePQ0HS0ljRTHudrkCF75A==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749325576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMRfokKzKXH1ZLU+7tVQpEyn332oudckXH5+iv7xEkE=;
	b=sl5HztyVIAk/JSbwtvaEP7CBIy1/QGFR7Bmj4Gjs1nUwHmCbVLrPQ7Q+i3lwC76vjjCk3g
	yZvpMv2woGqQ8vpcsCQes6ZOd4yK68hOuI+SfDxWlLcSrSXygydgV9gjokoMNFifrCT5j3
	0UV1heb3bgOZAugmJ283tEWWzB5jkFhcHLlN4xm5KMVgDlAi62EGNYpGEDjj1+7lPIKJSB
	EZDND72+w+wtJftOUbgstSG766ZNV3hbl2n5AGNLnERcGRsWb9nmDVheB3ibmF03kiS+9q
	NVC9XaqQ6B1UC/mv3DnMfLnWsaJ2G+5cJAcacuHsWhJOMpZWT5gRaPMr6EQimA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: dts: renesas: r8a779g0: Describe root port on R-Car V4H
Date: Sat,  7 Jun 2025 21:44:38 +0200
Message-ID: <20250607194541.79176-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250607194541.79176-1-marek.vasut+renesas@mailbox.org>
References: <20250607194541.79176-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tkzfd66x1madga448z9i7q6q5475nyqu
X-MBO-RS-ID: 33f608aa3f148c713dc
X-Rspamd-Queue-Id: 4bF7wV079wz9srM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_124623_073753_91FE316F 
X-CRM114-Status: UNSURE (   9.88  )
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

Add node which describes the root port into PCIe controller DT node.
This can be used together with pwrctrl driver to control clock and
power supply to a PCIe slot. For example usage, refer to V4H Sparrow
Hawk board.

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
V3: - Add AB from Manivannan
    - Add RB from Geert
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


