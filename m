Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A84C021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 18:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgtGSdqBANC5sTmLJ1PkHCo8fVQkG15TwN1atvXCByo=; b=kvVMgNlK6I683L3grwM68+SBa5
	gL+B1bqpnaoIhddHAF9GnYXevunQucpui3FaDq6X0pWe1xC/QgqkqO1xYNfOPETzV7KJpQqhCgR+S
	VPojNMxXGl7PoXjel+EmexlIqryKt5+sngVAVq0GNhcin9swPS/JXW1HgSX8hkrx3p5dwZBuMhKlL
	8oasNzPkIM7nyZ6/mh2jL1tP/7/JQ0d/U1i7IYiPmY4MfdZ9Jz3EivECQPQEXQI13Ilx5731ShqV7
	+KbpvwVPHusJzGwzBdDCgHQqVufwTx6Qtd8oNbYD9AOXWU9uqX+wSB0KzHDGOtiJ34nprtX0Yuo3/
	VOkDONyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5lF-00000005aXa-0Jfu;
	Mon, 17 Feb 2025 18:22:29 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4UG-00000005NPg-0MKa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 17:00:53 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so8056066a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811650; x=1740416450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgtGSdqBANC5sTmLJ1PkHCo8fVQkG15TwN1atvXCByo=;
        b=msA2cft5H8jTydKn9xQDqNGLJur3zNNugv2vYwwu1j4efewogImA1ub5OVQ9EniCm4
         hTF21ebTjvBqSE+eMxDgeQpO3VnuiZKraX96w229kHfC9En18RPY4WThC92UK0BBUEuO
         p0Okh9+KuvdEJaVMQHygilikxHdlj+a/8VDIHyFQaJvsumluH/BwXS10kIYfMs9vRvTV
         FkaZ+0Mhodyn2kXldDhP/LFZntqFROZMIclHBf8S6VZfRLUqmUs5zkCu4V4rUdi5STEl
         j8NJ/BOUYr+uvK4YtVlMip/dLFTHkVNez2JkpDIORnh6NSrLQo/XxZvm3bAnIvg6f1Al
         6TQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811650; x=1740416450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgtGSdqBANC5sTmLJ1PkHCo8fVQkG15TwN1atvXCByo=;
        b=EVrdpVmGkTPkV8krmxIto4rSu+7WG9OqrsJYgA35YD0scoSqrLcSDwEfXYmMumxoS5
         qSoEvxQwA7+ZUt5KDzA4lzg0IPxD0hg031xHTeQfZa9Dg4ElkjG4d2QprXnSQOrGDnNh
         lRY8r/3oqLF2wyd6S2KrBCayjRDCOQlv5NVwXTnllddnCAxgvRvjUK/o4pG3D1dvB3u1
         4i+74e50a2i31blTJzTNqGNG9min2abI1PU8FZs2EClf5THCCdEfBi2vQ9ucVTEJV+LS
         JGRTxGLdGiS0ZIlmJvLz74ms08g6LvC5dRAJuDZAf7IngyzULQ+2rQi32w4NbPaBztAh
         ZjBg==
X-Forwarded-Encrypted: i=1; AJvYcCU0PgdAGaq20+RzBTHuomXjv9IyK63uiBdfz9ANtl4h5sLjcBEYwufjs3ATinles1jevGq/2ta6k1ImroxAATc9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9GDNIBoBaMduLiIRNOkvmN3HAlPHCme7Yd5bCDb2xKYEJqkA3
	9iZL/YoHOKnHqQ58UEhT/PuR8xzsmP+v1jLLGCB4KLb/gRKkrUEa
X-Gm-Gg: ASbGnctCEtn5dK1cyxgOF6vXSb0NHLrzQ9l1ZCddiCZoYwAooLF7Dd/fuXC/rucI0SV
	Q0hz9L6QmQQdAxg+pGgvRrQPov+dHjw3ZMdNYa6/qzTOCHrwWOSuyjrFGFh049YoqcjBc2RNq7/
	EpWcKU4BphzV5kEph74woH9onMkMy/x6FjOqeUFF/OzCNLLplZ8Ph3fC1Qd5vbdZIT1N2FN67J7
	WaUJk3+7LykHeLmnKeYoD2PokJg3Y5OtiMTGYyWEkdAUPMlVBbm+2NvV3vxuiwCND41jE9pquXV
	EnPUS/9ml8G9R8yFVe8RPhGVYectIqByjVTNOcny6w7p38jbO7NXjw==
X-Google-Smtp-Source: AGHT+IFdMA0w4kBmGqa/9HtjcxpzNaH63DP3PJYieRpyn4W6ybrBgVCEnM5tX1Pgqn/wqOOzj45jOA==
X-Received: by 2002:a17:906:f0c9:b0:abb:a88d:ddaf with SMTP id a640c23a62f3a-abba88dde9cmr269033066b.55.1739811650253;
        Mon, 17 Feb 2025 09:00:50 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376aa2sm920570766b.103.2025.02.17.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:00:49 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
Date: Mon, 17 Feb 2025 11:57:17 -0500
Message-Id: <20250217165718.74619-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
References: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_090052_123137_C0601F44 
X-CRM114-Status: GOOD (  11.56  )
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

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
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


