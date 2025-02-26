Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD7EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ia5D1StmV4CnXYyEpke0sKKPWzBMRVegEo2c54oP3lM=; b=dzgtpjLAXyGN4ejCZHUjmUvwca
	SNFvO2X3xKmP7cxPzCQ3XMvDcxSG6vh1MjHlUbTjiAKDIbubf+gj7fj/11r/P73KSHyTrkt89b81i
	vkpHVI4Gk/pVtFisq0fP/KMH+CA1WKBQZ0SWBBXL0w3nU0wFYJpg4JPjK3KxlW8ZLge/GHg2CmgBc
	qhnaIPpBFHABPBFY9Hpbv03fHYViGfS0FFlCCg+ftp5vx9F0cPbGGMXNr8m+zYvhSN9KhaUQHmVWp
	/By9xVpII4um1DIHhPqT7UDfATAPrtlLRNB6Yl1n7yMFvoTjJ9M7JzHNVExfhJGtSywISqB+TpwyV
	AtBRuZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKeU-00000004axn-0jEz;
	Wed, 26 Feb 2025 16:52:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKYW-00000004Zq3-3JFS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:46:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so344875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588403; x=1741193203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia5D1StmV4CnXYyEpke0sKKPWzBMRVegEo2c54oP3lM=;
        b=Ngo1VaKhJcP1CXOFaXNm3NXfVTJn8ZaDkdPJzvcubIic+o+qOxQFfpWs6cDFGmEIKa
         P5FCYOcOJdb8auh4SoV9gsyqOomH3eghHMKVVfBcK2PnUjQsGTBxdLoOxaaLtu3+j/MN
         FhhzgTZSsbGjmQnTrjA2AfFkGG+e93xBFrIz/hXO18LxdT9/3R2+hUqnBYImsObngW+k
         fOimp8YjPrF5oyBs0jH77mg4LASkxiRSiramqwZGROLXzX5+54LuYDWe8hlikTMTTZ4y
         9b4jm7HpvCf9FOrBQleDxfIxP5VOu7ZvOrXxzSXkGYS28AV4WtiNWqyAASYhfaoqZmoG
         r8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588403; x=1741193203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ia5D1StmV4CnXYyEpke0sKKPWzBMRVegEo2c54oP3lM=;
        b=c+8c6f6iJOssusXPyB33KV4bUVd6SCwSvFx8Thl/BBcJF9KpEijSr6nq++jixFCEHd
         NVHGHMOg84t9//OduGjBZ0/4ZK+USKuicQvHYfi50Z/Vp9uRfGbO6/DA30Hc0CM9cXDF
         wrdhPdS7Eq76OjjmD7Arul3RFDal0Jsv2gUEXaV9gNr8u7hwBueNT14D4dTi34zZ42oM
         kyDeH3nqwTAbUhUDKyrGfoCaVE8Vo/iu78McCop4/FJtyPz9fPSuHh3INFpQpkcOi5Nf
         Rx1xGOr4rusEIP7CyvhCMb8aC3FuPebCqVUsB4StTUYxsS8BC1vr1iYZg24Gc+U34Xvd
         CBAA==
X-Forwarded-Encrypted: i=1; AJvYcCXQxduhxqIgY83LoOCmNuP+1sOS+NB8LgxgW38tpGy/D1LR+WHFeYjON1y4SlixhfUxYteARqEWU1oYy1va102A@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7zPrqAHZulDdBMzd2+2NgyT5+uUsM1tVItg8iQMddjC19yhoB
	moDC/8xBX3/Ccmqzh/fINeIfVfgsfYJjAK+JcNUiOrUyz9St2koK
X-Gm-Gg: ASbGncuEJfoxwa/zxbJrpjpT2D9PLiFSysq1rN1yDX2blfgFzbiYXIA2HzGg4/iMZaQ
	d0AxmebckBGu+wzZg01xsfpJZg6bD1t1qwh/AUP+83xt1+TgJ5nCI/rDqODk/b9E97E7JRyPlCw
	nlvVWQUxk1Jano50CY46sY28QuSH5YTIRjjq5TDTSALQri6tB4ayiPrEFZD0QNT4q/H8LXaovxT
	SCF4cIfukZ2ycvky9ujh5Liuz/drxyJLNugMnnQ9MBG8i+y/mKoDLb+b73OzAGj7lcnZhf1+qFc
	6m++jQOEN0eEzgG3hzGv662bP8XIybpTMKRUhwhxifuLFdLekYc7wg9f1RMxuTPE
X-Google-Smtp-Source: AGHT+IGWZHwSsvPWIGZD7v0lzUemtXIqVysf29/KMNwus1o2RKo13ASNNOWiAsEb7Vjp9//75b552g==
X-Received: by 2002:a05:6000:1789:b0:38f:28dc:ec23 with SMTP id ffacd0b85a97d-38f7079aa1bmr17417528f8f.19.1740588403302;
        Wed, 26 Feb 2025 08:46:43 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7165sm6200215f8f.73.2025.02.26.08.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:46:43 -0800 (PST)
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
Subject: [PATCH v3 3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
Date: Wed, 26 Feb 2025 11:45:12 -0500
Message-Id: <20250226164513.33822-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_084644_827938_EA7EB798 
X-CRM114-Status: GOOD (  11.53  )
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

Needed because the DSP and OCRAM_A components from AUDIOMIX are clocked
by AUDIO_AXI_CLK_ROOT instead of AUDIO_AHB_CLK_ROOT.

Fixes: b86c3afabb4f ("arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..86c3055789ba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1619,10 +1619,11 @@ audio_blk_ctrl: clock-controller@30e20000 {
 					 <&clk IMX8MP_CLK_SAI3>,
 					 <&clk IMX8MP_CLK_SAI5>,
 					 <&clk IMX8MP_CLK_SAI6>,
-					 <&clk IMX8MP_CLK_SAI7>;
+					 <&clk IMX8MP_CLK_SAI7>,
+					 <&clk IMX8MP_CLK_AUDIO_AXI_ROOT>;
 				clock-names = "ahb",
 					      "sai1", "sai2", "sai3",
-					      "sai5", "sai6", "sai7";
+					      "sai5", "sai6", "sai7", "axi";
 				power-domains = <&pgc_audio>;
 				assigned-clocks = <&clk IMX8MP_AUDIO_PLL1>,
 						  <&clk IMX8MP_AUDIO_PLL2>;
-- 
2.34.1


