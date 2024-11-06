Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE98D59F75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 21:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FCqhcREoWezk1bptt5InwAGRjoq8AME0oZulSzRglA0=; b=UcMBazjAoTBRg6W5bCeH8aNoc3
	c4VFWBEGdqoMoVTlgPjM4wyDDKqMqfwOJLJhIXBzKGJZJ79/Rt5vfzDYG3mFX0euFSe6sUyWjfZ0S
	i+h3updD5eE9Rd9D01M6WfEGp07/JQlxT+znX37pP/jNUekTZjxTfsDHnkJrRkbsmAmPIiXVaDc5d
	aMaLWw5N+laTRrGB+3+HaERK/IDydYV7tfKxKN4liYgTEBqzETT2I6gslGOQYT+IFAr1KhXb+WwkT
	4JBWm+Y70cBzLmiuw2x4/e4leFSPamXyaZUje4N+ZjUIHfLtpMjlx0AWOC6klqPmzAtEffNIJg6zJ
	iHi/Rzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8nCF-00000004kzX-1zkD;
	Wed, 06 Nov 2024 21:04:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8nAW-00000004ko0-03XE;
	Wed, 06 Nov 2024 21:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730926940;
	bh=DLZ+xT7FS54/kaVDeqPCFh6lOCpCqzZIMMnQ9XE6XMs=;
	h=From:Date:Subject:To:Cc:From;
	b=ocOJjefKZmTy6knNbSNW/ZiMuNCvnESs2KF1Q1Py5pKtFGxtABGwYk6Y+Z9Tm0ryo
	 qa/efwBBYcmCLhThgvifgngBCqjbq1zQfool60Cv8Wz/6/KH0FioQVNgWLLjDp8U7h
	 /brvxEiCvZQQWA7QcTHPAsBqluJsBOU34CWWj2tXPfinx+iXyae9QJzoZmj1q2hRW6
	 34eJnXd1UWSzEUDFE4h4NcCXD0QcQR95y3Volpk7dF8tViwftbBMRwfelUM9XdgZ4J
	 z2zXaETUFgJVR2MHr2RjxOHPE1Z/M0QPNe6ZDQnxy9MaT0Uejoh4aep9+4MGalBtEk
	 vLT+fIFkuoy6Q==
Received: from [192.168.1.51] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 529FF17E3786;
	Wed,  6 Nov 2024 22:02:18 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 06 Nov 2024 16:01:45 -0500
Subject: [PATCH] arm64: dts: mediatek: mt8186: Move wakeup to MTU3 to get
 working suspend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241106-mt8186-suspend-with-usb-wakeup-v1-1-07734a4c8236@collabora.com>
X-B4-Tracking: v=1; b=H4sIADjZK2cC/x3NwQqDMAyA4VeRnBdo6nTiq4wd4owzjNXS2CmI7
 76y43f5/wNMkopBXx2Q5KumSyigSwXPmcNLUMdi8M5fiVyLn7WjrkXLFiWMuOk6Y7YBN35Ljsg
 1i3Dj6eYGKJGYZNL9P7g/zvMHw+83JHAAAAA=
X-Change-ID: 20241106-mt8186-suspend-with-usb-wakeup-a3aeea52170b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Wojciech Macek <wmacek@google.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_130224_258159_98FB88C9 
X-CRM114-Status: GOOD (  11.31  )
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

The current DT has the wakeup-source and mediatek,syscon-wakeup
properties in the XHCI nodes, which configures USB wakeup after powering
down the XHCI hardware block. However, since the XHCI controller is
behind an MTU3 (USB3 DRD controller), the MTU3 only gets powered down
after USB wakeup has been configured, causing the system to detect a
wakeup, and results in broken suspend support as the system resumes
immediately.

Move the wakeup properties to the MTU3 nodes so that USB wakeup is only
enabled after the MTU3 has powered down.

With this change in place, it is possible to suspend and resume, and
also to wakeup through USB, as tested on the Google Steelix (Lenovo 300e
Yoga Chromebook Gen 4).

Fixes: f6c3e61c5486 ("arm64: dts: mediatek: mt8186: Add MTU3 nodes")
Reported-by: Wojciech Macek <wmacek@google.com>
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index d3c3c2a40adcdf439a1c74586c35cf63a1c7cb30..b91f88ffae0e8b81b70269ea2d058b016a50232b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1577,6 +1577,8 @@ ssusb0: usb@11201000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			wakeup-source;
+			mediatek,syscon-wakeup = <&pericfg 0x420 2>;
 			status = "disabled";
 
 			usb_host0: usb@11200000 {
@@ -1590,8 +1592,6 @@ usb_host0: usb@11200000 {
 					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>;
 				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 				interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>;
-				mediatek,syscon-wakeup = <&pericfg 0x420 2>;
-				wakeup-source;
 				status = "disabled";
 			};
 		};
@@ -1643,6 +1643,8 @@ ssusb1: usb@11281000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			wakeup-source;
+			mediatek,syscon-wakeup = <&pericfg 0x424 2>;
 			status = "disabled";
 
 			usb_host1: usb@11280000 {
@@ -1656,8 +1658,6 @@ usb_host1: usb@11280000 {
 					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_XHCI>;
 				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck","xhci_ck";
 				interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH 0>;
-				mediatek,syscon-wakeup = <&pericfg 0x424 2>;
-				wakeup-source;
 				status = "disabled";
 			};
 		};

---
base-commit: 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
change-id: 20241106-mt8186-suspend-with-usb-wakeup-a3aeea52170b

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


