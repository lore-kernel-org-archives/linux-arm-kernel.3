Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49117C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3oJX0NNej/zcXG8s4cxQRhfNdLEwQ8bXLo+d66KAIA=; b=u2S6bP1N4O1wfnHMEXbX5wjyoU
	CjQ0nuBDMtFkl6UqkDW6S4uv91leKFGPmsv7xFTsV8dBbckCRiub5Uvk9UQgH/DK/QHZA9RkM/YX3
	WpcL/+yo8MVsJohixVLwUH8O6EdxwZblITVQQ4v5jPw4dfOEGHkusf4ma6+eQZQnjzMtidlDIz43E
	RO4SnCQETOjvGbNtulSPuun8LlFtk1/JovBtQTq0Gg9NyIFSja9zdz1c4qhgxxXWvoq+Rj1Y0VTrV
	UzfBVYtVVw4dvgOVGfA4aPjESxKczd5VdmneC9YRQgXbZG7A4vndQaW3CyiBpgCUeQV9DMmxjweMT
	7SlqCf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKfz-00000004bJO-3lvU;
	Wed, 26 Feb 2025 16:54:27 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKYb-00000004ZqX-1eP4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:46:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so5090092f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588408; x=1741193208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3oJX0NNej/zcXG8s4cxQRhfNdLEwQ8bXLo+d66KAIA=;
        b=m9jBlBESX9IcsHSBCRX1r6xaHz8AG3e7awRYpIirfz0cnUmwPIBkGRiCvFMm/fkkU5
         FXU45RAyLupjFwBpR9YD8NYlwE83zcbHrLX3BCV/mM/AfzzrSnZFM8BdBnBzOphys3CF
         ePFPpS6bbF8Svy0xb6nYMOTB11GWTCBdnDvHWSzli4dkUg+ZRT/Pcq8hkDnqsTYwLF62
         c1QPiQHP4J8uG7HEupfEYg1mbj9G2Ogg3j2dhaxIiPelvwTxj88YjTGFYgngRObh7tpR
         ZcdP77MhNfvq89k/G5VZnGJGATIpYL3LNEO9v5dut7uE1Ew13ckCa6T/2NysgwTek7Sm
         yjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588408; x=1741193208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3oJX0NNej/zcXG8s4cxQRhfNdLEwQ8bXLo+d66KAIA=;
        b=GULzArvu0mGVrE81rxSD6XY0vpIDvHfLKuf+09IDFcXv6gAwQmGPNDn0tqsgEkzoJW
         fCVylwpaJWgIinPKbxyU97FskxWxXsOGo8JpfAQFWOuiNIL17kPRYf6feQDMlt8HTecE
         3ezTQv8nV1OyyT1lGEpGiN7dZVtGebUNXi26rvY3pZeEPH5lHJhV13FFwPBG00yySgv1
         M1iFwKnTu2DbvtH6OIeR9zwCWLf74rFHOQsExnrj6va8E3EFWaKyRIjniVl7UZofm4Xg
         QOXPPImOJOXMZkJpQ49zSnwNPXaKaGQxXe0rInCgoNDVJc7z4U8oe+HOy5M4Al6tQT66
         TWdw==
X-Forwarded-Encrypted: i=1; AJvYcCWz5RInG7mbMH/IT+evuXJpwU4Yrp9QhOvNMmPOQAwkGUAfnNdxsv1+qP39dfFJOJ5TqGDfStj+9Rs5BjM70wde@lists.infradead.org
X-Gm-Message-State: AOJu0YylZq7J5c2teSXx/lZawC/ap8VF5BTFrLHwssvHgJ0eNcwCF/94
	wOZuQNakgh+57TnLnAE3nVyHeZ8KVGFrnj5p1N0v/qXd4ztaNav7
X-Gm-Gg: ASbGncv1Njj2hXo+2cf1rlraVDvvgaHTT759cLEDnULAqbtSyZEFPfZmOtkZK34K5DC
	jj3VJVixK08a97xYkq3/h/A2EqlBInIc0HtUtFQhJPQ3G1blQdX/0qLPnF/M2FhrTJmHtE3x2CF
	eKElUbZXdnR+jAclA+e6yxN7aU8c9m1dwsMGO/u7pjrw6Seia87JYnNX3hG73xKzl+E9Bk2/Rvm
	2kRBXYDKsV6sHuIzxI15XeF4pFecweRHGgo+n6z4lfRAaZUGYNOPDaanSfc+xG74Z3rs3yxWHJ8
	/w/BXy8jgw+30HHQpjb9+nlMc3mTZzSkoORMYt+EFJjDr18NXw4iNefacFlUQlMb
X-Google-Smtp-Source: AGHT+IH9PirezPUvo0SDYj6S58hBwzBVZ6Rl2C7V0n1gZp808ZMU/3QJOgAnoayYRlZbNnJBn4E/gQ==
X-Received: by 2002:a5d:6c61:0:b0:390:d76b:fbbf with SMTP id ffacd0b85a97d-390d76bfef9mr1679150f8f.4.1740588407321;
        Wed, 26 Feb 2025 08:46:47 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7165sm6200215f8f.73.2025.02.26.08.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:46:47 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
Date: Wed, 26 Feb 2025 11:45:13 -0500
Message-Id: <20250226164513.33822-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_084649_429964_482E19C6 
X-CRM114-Status: GOOD (  12.94  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
applications running on the DSP expect the core to run at this frequency
anyways. This change also affects the AUDIOMIX NoC.

Fixes: b739681b3f8b ("arm64: dts: imx8mp: Fix SDMA2/3 clocks")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 86c3055789ba..54147bce3b83 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -834,7 +834,7 @@ pgc_audio: power-domain@5 {
 						assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
 									 <&clk IMX8MP_SYS_PLL1_800M>;
 						assigned-clock-rates = <400000000>,
-								       <600000000>;
+								       <800000000>;
 					};
 
 					pgc_gpu2d: power-domain@6 {
-- 
2.34.1


