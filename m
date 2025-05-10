Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55252C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfgoqF4fmlCMJRtRpMw4PLypxYm7hoZN/eCQsv6g8z0=; b=TgZhl7nilNz5lecN+uqlyHhvHM
	/tc7GM0aTV1+Bn1v5SP+q16m20Oq8+khlhpppgV8sJum3z6v0xv7wJEuCa9WpXQMrxsHyhQKh6csA
	AqB/X/igXD2CSB48pc4oj2zVGKAh42zBw8YIB2eFGc0kI8Xkn/hw/oHmwrfpO92JHpDbTR3WezYSj
	4W0dFBnMjpH7b0qdmyL7v0d30WSHESeyUE5N2Q+CqCNX0R5g5AZgwt0xL+AK84btVudWa72kNkY0c
	JOfCsRH7uKWub+mUBTjsmvIgB9EjGCAo5c7srsbapmIZGCmvblMwSOFohugqZF19vB/UL5aRHHVI0
	ENEm6ErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDf8l-00000005bME-1Gsf;
	Sat, 10 May 2025 08:00:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDetS-00000005ZPC-2pbg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 07:45:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53D335C3A7C;
	Sat, 10 May 2025 07:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 360ECC4CEF4;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863109;
	bh=Afd3RO2nfFYN2a+qQQXWV+L5ZRayLatiKPqnV/vRG1M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AN4YOVeM6uXYZcrnv8Nex1WOsRpZQqAXdwNm7StiE99mXbKaOmgcqAfhpoxKkEHOh
	 78NyvUtOtblAImTUM1ROaYZNCqHQXOYOwLWm1yrE9tj4M/Eacxs7W2/ZZJGm3xkRIf
	 KbNdZjYNFuqR91ShB7jNNd3Rb+3evdxUzkjYpFEfg40Q/QZeCDkXrCLXOC+FDeLFbt
	 s+0bszXNNp1pWkqWM3Gk9PuiPy9gYMtDkdveWtONs48vA/VZwjTGetSBVjypsiJFo/
	 0vsJjrBpEQ3muNokPii73ms/SSo5iaTg9mvgZN/4kk7lAa5ZbzqjvmdDSLXAF3NJ3o
	 va2CPIM2C9xaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C221C3ABCB;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 10 May 2025 07:44:45 +0000
Subject: [PATCH 5/7] arm64: dts: apple: t8103: Add eFuses node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-nvmem-dt-v1-5-eccfa6e33f6a@svenpeter.dev>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
In-Reply-To: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2966; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=hvAqTufzhOojxJ9ZjRR62jKrJGngJmyVl4diuLr5gAM=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4Y8C6PszTcHJsasFHb3y2r5eUBXdZ3l+biMmvdXn/NGr
 A526FTuKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEzEz4GRYXPxw/MHpnEdzz83
 xXvuhzVvCiLf954QmCH2um/q4dmLarIY/sfzVcZsXxx79s9Pww0MTHvv3Cmp3rMgY9vq/X7bTJe
 n2zMCAA==
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_004510_815449_B7E6ECA6 
X-CRM114-Status: UNSURE (   7.81  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sven Peter <sven@svenpeter.dev>

Add the eFuse controller and the nvmem cells required for both Type-C
PHYs.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 102 +++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 97b6a067394e311ed19392a34237c74936dbb7d7..e7ca9204a9a2fedc70111fdd8ed3f7e8e4f8d266 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -854,6 +854,108 @@ nvme@27bcc0000 {
 			resets = <&ps_ans2>;
 		};
 
+		efuse@23d2bc000 {
+			compatible = "apple,t8103-efuses", "apple,efuses";
+			reg = <0x2 0x3d2bc000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			atcphy0_auspll_rodco_bias_adjust: efuse@430,26 {
+				reg = <0x430 4>;
+				bits = <26 3>;
+			};
+
+			atcphy0_auspll_rodco_encap: efuse@430,29 {
+				reg = <0x430 4>;
+				bits = <29 2>;
+			};
+
+			atcphy0_auspll_dtc_vreg_adjust: efuse@430,31 {
+				reg = <0x430 8>;
+				bits = <31 3>;
+			};
+
+			atcphy0_auspll_fracn_dll_start_capcode: efuse@434,2 {
+				reg = <0x434 4>;
+				bits = <2 2>;
+			};
+
+			atcphy0_aus_cmn_shm_vreg_trim: efuse@434,4 {
+				reg = <0x434 4>;
+				bits = <4 5>;
+			};
+
+			atcphy0_cio3pll_dco_coarsebin0: efuse@434,9 {
+				reg = <0x434 4>;
+				bits = <9 6>;
+			};
+
+			atcphy0_cio3pll_dco_coarsebin1: efuse@434,15 {
+				reg = <0x434 4>;
+				bits = <15 6>;
+			};
+
+			atcphy0_cio3pll_dll_start_capcode: efuse@434,21 {
+				reg = <0x434 4>;
+				bits = <21 2>;
+			};
+
+			atcphy0_cio3pll_dtc_vreg_adjust: efuse@434,23 {
+				reg = <0x434 0x4>;
+				bits = <23 3>;
+			};
+
+			atcphy1_auspll_rodco_bias_adjust: efuse@438,4 {
+				reg = <0x438 4>;
+				bits = <4 3>;
+			};
+
+			atcphy1_auspll_rodco_encap: efuse@438,7 {
+				reg = <0x438 4>;
+				bits = <7 2>;
+			};
+
+			atcphy1_auspll_dtc_vreg_adjust: efuse@438,9 {
+				reg = <0x438 4>;
+				bits = <9 3>;
+			};
+
+			atcphy1_auspll_fracn_dll_start_capcode: efuse@438,12 {
+				reg = <0x438 4>;
+				bits = <12 2>;
+			};
+
+			atcphy1_aus_cmn_shm_vreg_trim: efuse@438,14 {
+				reg = <0x438 4>;
+				bits = <14 5>;
+			};
+
+			atcphy1_cio3pll_dco_coarsebin0: efuse@438,19 {
+				reg = <0x438 4>;
+				bits = <19 6>;
+			};
+
+			atcphy1_cio3pll_dco_coarsebin1: efuse@438,25 {
+				reg = <0x438 4>;
+				bits = <25 6>;
+			};
+
+			atcphy1_cio3pll_dll_start_capcode: efuse@438,31 {
+				reg = <0x438 4>;
+				bits = <31 1>;
+			};
+
+			atcphy1_cio3pll_dll_start_capcode_workaround: efuse@43c,0 {
+				reg = <0x43c 0x4>;
+				bits = <0 1>;
+			};
+
+			atcphy1_cio3pll_dtc_vreg_adjust: efuse@43c,1 {
+				reg = <0x43c 0x4>;
+				bits = <1 3>;
+			};
+		};
+
 		pcie0_dart_0: iommu@681008000 {
 			compatible = "apple,t8103-dart";
 			reg = <0x6 0x81008000 0x0 0x4000>;

-- 
2.34.1



