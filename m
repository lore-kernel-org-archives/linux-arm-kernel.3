Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E420CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLLHlgU1kgOKOY9uazP3g/sgaaBJysCOurDX7bu2Hg8=; b=g0sA1KQp5q/4ZsOEKITBnwRhX+
	ECVqw0eT4w456KRqCqE+7J7I1jn+8XazVRHSafoDwQlSC++R3ubcqyprHwIqSuk4e+FXmrF5pNOGs
	OE+F8FWYyJJz4ZZ1S9D7bal0xCJ5bPL/Es0TqrgspeEclzrfyH1WyyleeP+Z/Ciu03CUw08M9JGVw
	bbENuPfyNycV2RvDDbClpg9S3LS3+MAsZGi0udGAc+mJ6t+svvrw+HKYKT1cKu8nEhzDVpkGJe4/T
	gOCNEpkVljGkn9RxWY+d56W0cN66tdblSwUUTnmTSgEfbJuOLbe5J+57bfE4nN6g2u35b9ggwlwfK
	tdg/1k4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6r-000000049Aj-2V7C;
	Thu, 30 Oct 2025 12:50:33 +0000
Received: from mx-relay24-hz1.antispameurope.com ([94.100.132.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6g-0000000493o-2dBn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:23 +0000
ARC-Authentication-Results: i=1; mx-gate24-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=MLLHlgU1kgOKOY9uazP3g/sgaaBJysCOurDX7bu2Hg8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828611;
 b=pV3YyG0/rLaeZ4qxP7oW/WEGy6lhvrtNkdGxnemKS9DZSR+MfIAjJJPeoWbedT2Tbr6Fup0j
 Fav6ClkMyLQ4+hPkNoqA123vi8qkZweoHjfOHQSCUu0Esp4N7oFLqfabO2VzLRNzodphFWLfWYA
 3BfrR5DYqx8RyfsPTf/AcckUXxG1anIQzDpx36Hd+Wy0dtl8y0hwI9kRkliBM3QOWcS1VSBBODS
 0y/KmuMgaeWduGIsrU7RGk6URl2Fo5L3rasX7lDimKO/Mo+RkHUfziGPHz9dqt+fHCfG9DPN30o
 pfO/WOYnGnyuBXmij7c7a1NThnYriLc/xP2MtBze1BCKw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828611;
 b=mv/wzgONWfbSEwO60Re1hxQgYj6PLnagUiQ2O71g6XSXekKqXH8uhyOgY78i9NfjAcsrlnXp
 CkZcFTcfYN8Zc+8gN+6H4kq9CypbYNZFXGutq6WsXu2B6j2yaxsU2BtGTRKD/tQPfuDqZejxHTG
 ltITWHYy4EkE5D0ScRZd7ivOSUWFuuF1xjtWSjy+BeXnSNW5JACyMHe+NYL37kVA4mCQR3/syrO
 W6ZL7hksdvQ6fYLw65cWn+bQYum6xE89tpAaoJW1m0r+mvENUv0kzRfqRSBWjXg/wdvsCfVCn7C
 rXyAjO3ensf/xPsPu6dlo4gY8ccVsiDVCm8rUVsau89Sw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay24-hz1.antispameurope.com;
 Thu, 30 Oct 2025 13:50:10 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 62C05220D34;
	Thu, 30 Oct 2025 13:49:56 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH 05/19] arm64: dts: imx95-tqma9596sa: move lpspi3 pinctrl to SOM
Date: Thu, 30 Oct 2025 13:49:12 +0100
Message-ID: <20251030124936.1408152-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay24-hz1.antispameurope.com with 4cy3q90T5vz2fdgJ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 6a48f4ba851c95ecc7e4057f5ee77018
X-cloud-security: scantime:1.826
DKIM-Signature: a=rsa-sha256;
 bh=MLLHlgU1kgOKOY9uazP3g/sgaaBJysCOurDX7bu2Hg8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828610; v=1;
 b=A+oplIB1ZArbGcU5RBfPxteZtPEtMBFpSmbCXVYbVvAs9HB2+fJE2BOyPs1U2LW4Xt+jrQeI
 OZXRs8m/rNtUv5tETUG9z7gdpVdYgDu8j/qBJLUDz63NMda/LRki5VwuYvAiX3DqVPMeeZ2rsFg
 8gpzzQzMaXKyVCo3BTdEXnL1wuF6pGCKkqiRo91E38NeJw4gTUt+fxcSAIa04lgr2mPckNu7Bbq
 ZILIIe5Ju4zwHqwNvhzlRvqp0hAelmiTC5F0uCA1GUkYNZGHajOoReOJfniNRg8Uq0mri8TKuG3
 4vCVMkim/Y9glC9v8SHyXb+UDshzzWn1vI4K7AcJoyLzQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055022_810106_439E81DB 
X-CRM114-Status: GOOD (  12.59  )
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

The muxing is determined by SOM, so add it at this level.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts      | 3 ---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi         | 6 ++++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index e3c7554b7f709..43ed55e57d2a3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -200,9 +200,6 @@ eeprom2: eeprom@57 {
 };
 
 &lpspi3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lpspi3>;
-	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>, <&gpio2 7 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 759a09a912be1..8da9e368c1f4d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -317,6 +317,12 @@ &lpi2c6 {
 	status = "okay";
 };
 
+&lpspi3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi3>;
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>, <&gpio2 7 GPIO_ACTIVE_LOW>;
+};
+
 /* SER0 */
 &lpuart1 {
 	pinctrl-names = "default";
-- 
2.43.0


