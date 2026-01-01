Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE10EEE25E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 20:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnCDI/zTe02LYmrbiI1lP2x1HisucV9/vjfmKK3PvNI=; b=5AAzHYKcfPhlIWddfqIG/bVnDp
	kys+T99e3YEyo1QRaTN+CdK2W0iR6o2RjMnlLzAWyfOM2azgeU9v0de7MqvBLJJodp7PcEMMq6VHb
	dBGM3GU0kjoxhDPnfGWNRe1MCA+nifkB1X7Nlx01OR8+5+yr557l5cWY8ZjjE4WutM3q8jTGLbpIJ
	thHkmr28ki9g7Id7O+f9Ltaq/5uJhsBvrClqYoUsUTCvrs9XIBTrgJwFm7Yzd+ecrcrutjQMeEUoo
	GDwCtLIac0UTU/hQRQaUKOSYZRWi584+O1VLtUTxppjNI+TAdPOt4zzMTy/N35vH4qAkayqPGyxqU
	GHXsWp+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPSz-00000007UDX-3ANb;
	Thu, 01 Jan 2026 20:40:17 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPSx-00000007UBd-0K35;
	Thu, 01 Jan 2026 20:40:16 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhzGh6pbnz9sl4;
	Thu,  1 Jan 2026 21:40:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GnCDI/zTe02LYmrbiI1lP2x1HisucV9/vjfmKK3PvNI=;
	b=KQIE+KkWoO++fCPXn3VZoeJ21j95P3XZ/hEkIRXiFIb3bcoVjo/TSpmTttENj0h8YZwNGE
	CUaH35vTOjJ1wj8PaxUXBwKhUXXgVQDxDez3uI1ANIANp6lW+otpyw6G7vGdfxbNQvmr9J
	Mw2SfxH/v8tfdasyfRSEeLBCGxX82zfbWfKS6/IVOCk2/Nvq21GX00GdwWIPiufCzyYpQ5
	RRKwGtZx96OpME/HMCEbmvi8CoebaiT7sqCnPHAvN+c0JYjtb2lrpFUIbPksy1YwOeIJ63
	nsfiSUvE5133GJ4iIM2fWUGA/SPSNyo1gxZBrf3Q2ROVVHu9lYl9s5xTF36W0Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GnCDI/zTe02LYmrbiI1lP2x1HisucV9/vjfmKK3PvNI=;
	b=tUxLiTHjcv6LvFAqOgS8TXTsNAMcgyhDxuqTCfDf9uuQMSWLVPgf2E1DoAIx1aV6ceB/cW
	bJFO4THLeekbHq+icLjecy8FHdChnmpXoSSv7O28TpoWpCl4nEIYdD0q+l3dWROt0k+stU
	dnl3Z01UVVfowtYiQJSjrtjkJ7iSgwxE57fg6AIkX6NKpq5nCHlxnmA32Ga/R8rPnmS0TA
	KMEM+cW8tnP1dA74gWZxEl0abnQ76HQhWfVOA4W73SwMLexMutfi3KjBjHlKYZEaVZCVNb
	Lbo0pqHFtK1XK0LDvlux+obEH9IaKUs081YtLiwViChMJQ7Nf+Le7bllvB1X6w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 04/11] arm64: dts: renesas: r8a77951: Describe PCIe root ports
Date: Thu,  1 Jan 2026 21:35:51 +0100
Message-ID: <20260101203938.159161-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: h5g7kbidsiaj7ufgb145wizedd7etbqj
X-MBO-RS-ID: fcbd0409e30c99e4e16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_124015_267001_C67782D9 
X-CRM114-Status: GOOD (  10.59  )
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

Add nodes which describe the root ports in the PCIe controller DT nodes.
This can be used together with the pwrctrl driver to control clock and
power supply to a PCIe slot.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 1ac24e614aa9d..466794eac4d3a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -2826,6 +2826,16 @@ pciec0: pcie@fe000000 {
 			iommu-map = <0 &ipmmu_hc 0 1>;
 			iommu-map-mask = <0>;
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
 
 		pciec1: pcie@ee800000 {
@@ -2855,6 +2865,16 @@ pciec1: pcie@ee800000 {
 			iommu-map = <0 &ipmmu_hc 1 1>;
 			iommu-map-mask = <0>;
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
 
 		pciec0_ep: pcie-ep@fe000000 {
-- 
2.51.0


