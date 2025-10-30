Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA10CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQrnZtKYkTmoOqZMGCIOD6/kHXaWhNyn+TUU1owbG/U=; b=EZPckiv0Unj35fAl02brpTDn0L
	l4/0AyciGjlHahFaDtI5mfK9MdzQdVK2PESVvbxDc3XBBKE6KlAQNf4OtPCPwyflgmR4PozHIs/mC
	x3G3uNR+1NRFp2vN25P8pgIMv32PdtLS1Pmc+kEq9piYP/1B63ygYgR1UWd+7r5eOq3pr8Zn/IjAS
	bc6Uz82z1F5wenoQQP3TMHMl4Z5c2PMYqBbRTAGx78BYYlUfMtXVDotq2L/BKNv28zdzveVOxgSrI
	kYwM5DTVIcNx5G1t5INpyZxMkOHU/Z1jh7LzFKcw5g50JY/3MikDdUSgMpzVOlZdtVscvbWSnfuFI
	G0i0i2rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6h-0000000494S-3n4k;
	Thu, 30 Oct 2025 12:50:23 +0000
Received: from mx-relay172-hz1.antispameurope.com ([94.100.132.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6b-0000000492L-3L4P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:19 +0000
ARC-Authentication-Results: i=1; mx-gate172-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yQrnZtKYkTmoOqZMGCIOD6/kHXaWhNyn+TUU1owbG/U=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828608;
 b=FOm+IZfpXUQDWlvDoNaiXuid43asLPVgW4HEGDrXiMgMNCtvNxJDxNKCLCTb8QP31U9AAm4a
 EeULW2Q1LYQOszDNRTNRXms15CsMKpVv5jyRqRqoJWJXltOl7ilC6DdkG3aZGnBtLyLyxJZqcDT
 VdeKX4oHcLDe4YbFdLSPrqC9ZdNMxeCXHmNd1R130hjPVPZQTvZ975nou7qiRAQ8EBQguTZQ7m8
 Jwui2MVYIgLHPIIp3WmxBPEXsPDaeB22Cr9S57KT4WMeCzdNhqdsBybKfEO8mHgvE+XThBC5eci
 LQf3Ll/P+EJsJbwwDdqFTSI5z8SPOESrqg/fX6ZRdEUtw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828608;
 b=j+3IMRfzswYgkL5xklRzsMO9b/U9kl6yRhb60MMPIwY7FXnoY2HgmHhzMtVaE7GCoPJymU/g
 cNet+FzbUTYSSMcZgorCx7KZiv+zjyyflW/873OAL1wfe4gxYOlLksOlETNM0Rg+J4xs1Sxqwz+
 gg2+eO3QpwCUhbh+nv4YPPYCb8WONLkjMlgLiQbEKNsjVd5IgWVgQHTXk+CbXjusWWRJsouhFpJ
 QN4njbfy/+HhqaQZPRlv789NfPdhoOOXETAIuUEIfrWbRAfTuyNHgDGZwkBdHgeP+apOSGcutOE
 pJSHqvadYRySJwWIQFk/VaCbez0yFrfQmN2i9Tc2WcCXQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay172-hz1.antispameurope.com;
 Thu, 30 Oct 2025 13:50:07 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9E58A220D24;
	Thu, 30 Oct 2025 13:49:52 +0100 (CET)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/19] arm64: dts: imx95-tqma9596sa: reduce maximum FlexSPI frequency to 66MHz
Date: Thu, 30 Oct 2025 13:49:09 +0100
Message-ID: <20251030124936.1408152-3-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay172-hz1.antispameurope.com with 4cy3q51zVyz1Z1pc
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 22167396eefe238fc1584f087a1c054f
X-cloud-security: scantime:2.247
DKIM-Signature: a=rsa-sha256;
 bh=yQrnZtKYkTmoOqZMGCIOD6/kHXaWhNyn+TUU1owbG/U=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828607; v=1;
 b=FjI3F1bE/1M1PkH3mmQVl9ve1JDpsI8/OeNAvfrffxls3554uslasA5XhJoY6LwAU3syNwB4
 1BY3iHzEg6HZRT9Lnggw2JrIlopzlhQkmaC/Pmc52JFLORgQ3kOCjxeOucpAaPeBS23eFov/eeM
 XUJOzBbNFyz7F3+1Ab0RT9KNPCaG++nhOMO/ebXymYuSRa5gLQLGyoAkHccWOfl8S2sNbEp6M4G
 tjrIpKSBttAsn8oVsHsjMck+1++/sr4uC1sArBzFj/fYU4x8L12Ov8ZANGuOsKQf1OdKebMTSpB
 shAApFvsJ0DPGjKBXkgGcj1/bPxEVU4Gyb6u63l3CKlaQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055017_992274_E2622AB5 
X-CRM114-Status: GOOD (  13.00  )
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

66 MHz is the maximum FlexPI clock frequency in normal/overdrive mode
when RXCLKSRC = 0 (Default)

Fixes: d2c4d71b6cde ("arm64: dt: imx95: Add TQMa95xxSA")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index c3bb61ea67961..16c40d11d3b5d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -115,7 +115,7 @@ &flexspi1 {
 	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <80000000>;
+		spi-max-frequency = <66000000>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		vcc-supply = <&reg_1v8>;
-- 
2.43.0


