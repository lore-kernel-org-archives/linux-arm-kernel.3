Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B1AFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CKv4W/JoMnGa2IT1tfwDfZQZp49D12KO1oxnjPxBw3Q=; b=AgFdHJfq/rLOKLfZjogCc7pqjC
	uuZZY+Nf4cZarLtelqQHsGdPdtcizwAT0sJlh/DOX/LrHhIvO+iUVUiY/oPT5us5GL/6k+2V1ZayJ
	GQXfmEktZq4wKU0aTQTLk3PYaPvivnm2lG4EA/Ln6FYIgOEyltW9yGm0EK+NHnNkSABL3ic7XDT1j
	1udeEmGPLb4/7Sprk6B8/8xJFfT4zAU2Wt82mbDRIyvn8zih7NIoLz+97EdC55g9u/UhAD3jO226e
	fQ6a8C7mlkcCGzr/JRwNwDqilCmROeG30/D1GmXVtRszmDL98JwoMHOi54i/Q+FWRl2kM7zMmY+rB
	tJ1VZwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQBD-00000005Qj4-1wVM;
	Thu, 30 Apr 2026 12:07:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQBC-00000005QiG-2OQ8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 12:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CKv4W/JoMnGa2IT1tfwDfZQZp49D12KO1oxnjPxBw3Q=; b=VPEb9y3XLma1wI+JVMYBy+iXXK
	PSa86abnz3aLt69g4IxSWwuC1TJ6cnTcO3YPelc9h4N4txhK6OCqM8JvYTw+2no+U15imDXiM01ey
	93nx/WMe4njZvn4snym82eFXzYEHvckviw5l/qPp3E0tjof/qUO2ygctl9JiqX9hMeKHrGU45pTk+
	r+FBv08vSyfyogCj5MnfDncNIR+hvWOosum3LvHIIPBsCfAj5dgGghMl+GisaB9UBTDNJzhpnb9Tk
	de+x7hHQcDWWuQ/TkYW9wU8FNFG8IhFLikLYFwBzoAUZwh56/pFrx3kATLifFW0/qErOrSLYT87gk
	EsChTKbg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQB9-00000007KOP-1WbG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:07:41 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so7337735ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777550857; x=1778155657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CKv4W/JoMnGa2IT1tfwDfZQZp49D12KO1oxnjPxBw3Q=;
        b=Z19+VKORQkdIQR9UwWNFy/IxVvSkCilsVnJZJHbmT85ezZtlmpk4qyetOsev81eJEt
         hp9SMeHg+tvH3+XmNrKtl1KSNe5WpY7hOwT1uFUmiJm9U7pViHtTSzY9a4558n/4iyQ9
         6E3xxACZU/fdExc/AlGhowTnxqv/dJd3dcnck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550857; x=1778155657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKv4W/JoMnGa2IT1tfwDfZQZp49D12KO1oxnjPxBw3Q=;
        b=sUl0ZziuR6sGlVX/L+2Na7v9yuy3wxslPb9LOfW2FdzEVEiMS1aqv//YbSsKn3zcjC
         OBmBANl4BpaFqYXaLhtR4QiTU79ABi1iyUR5DdwPETJKciYz5d1EBxPizwnMQUYNUpp8
         5N0NlBT/Eqh+Mj6YOf5lHL0wtxlfXfwvTaeStkX2TEQDRsxFDVaMp25Yy2+PPG+c6FnG
         bduKWehUvF4eJecL754lZ5pjbaljaoup7+tc6tkJAurOy7WhTkr11Qdo/pxMNoKySYNt
         5u/fdLVZFE/whwrNAs2YD5ZN1bDwu6IlW/6TasJ7luJk1UYJBFT9ndJwxmStsMGFUOAz
         jYKw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZdQJG6c3V7do6k/X4sfA6HF7gcRIMe7lymEnLdMcaZMTe7PQFLYK9myZG/8SUv4XKWtj13SDC9MhQEbJhOLt/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe9+OUB1ZKML7vI7BhwH9oC7WTr0NcK6ekfb5JD4uyKJBtShaR
	R+eWLNrSQRlmpDUCII+YnbkyE7GG+pTkzkYp+6XAwHykLQxim7mYrf4+jxWP79wmLzCLrUQtnB1
	klHc=
X-Gm-Gg: AeBDiesWLojMnwcha15KoMiueNmhpEaG/lrBMrDkJE0RrBDvBL8q8jdvsR2I6XkLL1D
	vn6urKpAPh0Lk1Tvyv+2LzwkL1+yCAaDGOsQmPLuSvEEy0ymFfg8hq3I4CRcm5uDFN7pAM8yvZD
	eTn5bXrHoyXuJzpNBhg8g0WjBbKG+1QlkfoH+vO64kBS5thGs6F1ZDTFGWzq87Y48cpOOA33oMY
	ohHpajQJNz+0+B7lDAL5Db9qrVhDa5S22Xpn86Ls55VqJwu/kUJpCcAp8SIWCtC3xyI7Bg/34j/
	txD14V/nk3zi86fUnu7MWFaZgQ/BD6F1Tl/2BMCnm5Ze9Hmd1eYoduURgKPmoM80cvsv+69192v
	OzQ22/WuBKpQNFx0HxvrLy+3Ank4HsmfadICHsbLlS/O9/hwO+dcPhhdD4ORR5BTrqTz81ep3qS
	fvtUgdclkCRvyJFDrKmYZ4uzJ4Ugt4m2QdfOo1l/S2JSprm1Fxe+RyBFmlc1uLk75NOW+bwiAJ0
	WjVfZWd70K4Dp5BMI4=
X-Received: by 2002:a17:902:ebc2:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b9a234e8c0mr28352745ad.16.1777550856708;
        Thu, 30 Apr 2026 05:07:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7c53:8aef:3f8c:bb04])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b99835a796sm34576285ad.59.2026.04.30.05.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:07:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer to host
Date: Thu, 30 Apr 2026 20:07:24 +0800
Message-ID: <20260430120725.241779-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_130739_569655_41E3868E 
X-CRM114-Status: GOOD (  13.94  )
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

The DMA bounce buffer is attached to the PCIe host controller, i.e. all
PCIe DMA transfers should use it.

Move it from the PCIe (WiFi) device node down to the PCIe host
controller node.

Fixes: 0dca9f0b3e63 ("arm64: dts: mediatek: asurada: Enable PCIe and add WiFi")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 217c9bd5e9a1..eebcc4068e28 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -645,6 +645,7 @@ flash@0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
+	memory-region = <&wifi_restricted_dma_region>;
 
 	pcie0: pcie@0,0 {
 		device_type = "pci";
@@ -659,7 +660,6 @@ pcie0: pcie@0,0 {
 		wifi: wifi@0,0 {
 			reg = <0x10000 0 0 0 0x100000>,
 			      <0x10000 0 0x100000 0 0x100000>;
-			memory-region = <&wifi_restricted_dma_region>;
 		};
 	};
 };
-- 
2.54.0.545.g6539524ca2-goog


