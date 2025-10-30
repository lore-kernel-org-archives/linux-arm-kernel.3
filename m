Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0754CCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fa0W+DLjU6OOWbYOutYrRj99tl16LW0xzYOEJzrNODs=; b=uCeazMFh6iY96/XRL9WBmEfQ6C
	W+shNXBMoZ4diu1W3i36+Hr4yD0cw3EclNf2Kt7ccFMcCwrRb8maVTh0LW5e0sdyfJJtW/C6iz539
	05mTE88AUgd7ZRpRazI0N5snJKi1Wr/xWWfjYIPZefVVNm7v1eMaLA12saN9WTfSeRoGUXYawEo4c
	wJVlaDp4OWyP7SsEymtjpvaeKV8tMViIeRCgNRYBzYmvjxGPRyee95hPWh4+jUas+tuVhiFAuj9d9
	C3XX9qvBWwbhJhDNLj2IwUpw9Ml5OwHkJbFp3j1nFwonbHrGj0iRz+jxBDsiJP/6UUiFL0MPjwjBG
	UoGbADtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6s-000000049Bs-1xFZ;
	Thu, 30 Oct 2025 12:50:35 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6j-0000000494R-0NVF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:26 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=fa0W+DLjU6OOWbYOutYrRj99tl16LW0xzYOEJzrNODs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828613;
 b=Y6vYtEI9dI5sBt9WjsH+TjH2/W+ULBh3Clg9xTqx4XS2Eb+a23fPB0q8QV/O15YuqU+OeKNE
 pK796FMvLaKpv6fOz2ZWYtDSbYfT58Y/8euNFe0CwMaQQ2EkQEXrpxXVigroP73HI0SI0gZMvzN
 wB63E8APkitvSNcP2aiMopTY1Puq80Df8Uq+oS+WcCWhbFRPEB9EJ69K9j9wJGMMhwM9QYakxrd
 PO3g4ii9PhJ4AoHoDyQEhj96kfV+1Ao/5FwLqNtzePcouKPhRjA1EbU3lI+0726cVUffiy/9NTa
 0eFQph+UAsE5N6ZNysZsWx0awzTvKoa8PJFOBSBa40gUg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828613;
 b=AO2ZXyfT1KYG2uNYsn59QMsI+UlXQIUwrqt9eebTvl0jrEp8NtdclcgT3FTA7LBnbu/Q3bQj
 kI4PKNlScOIIwQfj243jSPzl4phTRDkl5H2Ay2NGM4k3u6nnTqB/9sI7z0Z5w8XJ/V1TBffxnYj
 XZyLWoQXS3iGfmFohdk697vAGDqQ3x/bwOUPrlriGYYke5NauvcAvqZ8i5PWYJJHyLHGVgKsOPW
 gMErQsPABt2FfGu89sOkyPgg5JYPNXBWFVESZLQiUEQRVj4N2goPH8cEsoqMgHqWBpdThbE48oj
 PGNfUOgWBOgPrJRxKCdMMDXZSK27pIfG2u3KdN3WG7gkA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Thu, 30 Oct 2025 13:50:12 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 00EF9220D32;
	Thu, 30 Oct 2025 13:49:54 +0100 (CET)
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
Subject: [PATCH 04/19] arm64: dts: imx95-tqma9596sa: move flexcan pinctrl to SOM
Date: Thu, 30 Oct 2025 13:49:11 +0100
Message-ID: <20251030124936.1408152-5-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4cy3q7583Vz4Mb31
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 690fe049c6c3fd8ba19a2c0a294a5505
X-cloud-security: scantime:2.329
DKIM-Signature: a=rsa-sha256;
 bh=fa0W+DLjU6OOWbYOutYrRj99tl16LW0xzYOEJzrNODs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828612; v=1;
 b=D6ET8ROEttrHttF4miL3tChB88zy7GSNW4PDSS13rm2vquiRTWR8yhPBNRog6c7ELGzVYY6O
 wSQ/2ku2/8ZUPnPizP1CIQew00mGtIzohEcWV1dLUNEURnmgqXjL2ISCVfx/OogyZyvY7AdCzSg
 1zphwjxRTEBpfc9HJWzUKCZRAr2T4zM3bfhOXrwlG8sIfGKTuXwR9sr6vCr8accsjJijLlfMpku
 T10XA53eB7znZ+OYLz4XlzjgKjzaVSVs1mhUrwJPT7l0Il10vMPhy3pwbuoD3I/g+GGnk8UmakP
 fBbNnhL5tjUbBHuP5a7sjcpdOH23nltOfMWsU1WTwFXFg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055025_272363_47778536 
X-CRM114-Status: GOOD (  12.44  )
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

The muxing for flexcan is determined by SOM, so add it at this level.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts |  4 ----
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi    | 10 ++++++++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 5b6b2bb80b288..e3c7554b7f709 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -172,15 +172,11 @@ pcie2-clk-en-hog {
 };
 
 &flexcan1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan1>;
 	xceiver-supply = <&reg_3v3>;
 	status = "okay";
 };
 
 &flexcan3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan3>;
 	xceiver-supply = <&reg_3v3>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 52355a65a62da..759a09a912be1 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -106,6 +106,16 @@ &netc_timer {
 	status = "okay";
 };
 
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+};
+
+&flexcan3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan3>;
+};
+
 &flexspi1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_flexspi1>;
-- 
2.43.0


