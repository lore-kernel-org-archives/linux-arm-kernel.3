Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7081BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 22:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYgSXYoxLM00aOyWXvUIDH2ECy0jZwwoRHPTqVPqBfY=; b=NqVLVCKa4CsGZXHwGw9EeBqD9F
	EOHgtH8SCTwVbxSWKpPf6zLZiM4MEEQtQS4EzBFDwWXImxI7njGNIkrpv/jF/YdaRYUO4DUE9Qg5v
	gMAI9MoLDE4q+8YCcsytN6kLgke6cAyDBnB/PNWoF/zzoXR74zpKzsNitLoxvQWlRp5keqnr8pgCj
	WefM59OAkg2r+Fi+RaFJeVaoT1iWeVj7b+ogy9P7SmgyQBWysqS83c55nMM454P0kqq1k+TokbKQc
	7buv1j7MPHGOId1DdEoxok6TL7ukMt2bzsEjof823pmkdLQs/2t5vhGfD/MygnZ3S0LcqZkpvT6KO
	sneNgrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8B0-000000023iA-1Lqy;
	Fri, 30 May 2025 22:26:10 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL82b-000000021ZD-0UPR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 22:17:30 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6facacf521eso20627496d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 15:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643447; x=1749248247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYgSXYoxLM00aOyWXvUIDH2ECy0jZwwoRHPTqVPqBfY=;
        b=TFBsxhmpgtVrttDNCkkE448gt9y8Kw+pFcvhmrytb1OW5kaKV8meDsAU9IRxQqH+gF
         DZKr/JWsRzA1Rj9u9u4ZpT+lnfOySVojibYgdQXXpt+/JXV1hyhI/Zk9PCEOJdX1qKZi
         sf0zoU80vN0L4VPQ1wDGgquMG2kz3SBemk5S0eahi/4Q6yCce4O6aVPQueH8n7g/ipul
         xQ0NgW8BkydwgHti7YPAXrlSTQkzryknWuKW78zf4nrUsRJmCC+BYSHiosLAEG3NkVrE
         xfUJxRAN3iNAH1afzUV3pzXFBXHJxUr5HQUf8vM/M3luygSDkx/SzjS69Mqr8aHYfDN4
         mp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643447; x=1749248247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYgSXYoxLM00aOyWXvUIDH2ECy0jZwwoRHPTqVPqBfY=;
        b=mtaeSg/Lh9iO23CiQEy5d/sGo9Olskj5TsRoUg99RV1ad9BcHImVtB3erwO0aQxxu4
         rRlIPVru5IiPx7MDUrGVbfOXuzua/BZ4RPd2fgwBiVOV53QKW1CFqSBi8x8Hkxu7ipy7
         Naq/L+IUl820d6yzjxM7UUsHapfSkfNQlXT/0d6W9bqNjV8kgCQDpnId9yox5HegEpDe
         TXVY3SeyTZtmBvL6F0X6Ry3LkQShRm7Ea4hqfQQYxrpK+96zESgaRaN2j/WaYkhEAF21
         r2Qr8FgKrFC6hxPAnQPFHNy/J4dkKmhqLJdl2zoLrOkGQwOkLDU/s4GI8Ot/mWvySrRf
         w09A==
X-Gm-Message-State: AOJu0YzwB3I0vfzBVheuBmM7BlEsp8lSKm4ARC4ZSOEsmWgRJ68+CumY
	SSB/oWX8rSnUPcw7TXafeQjAyS3tE3x2z6TA2JXLBEq4EruoFA73kBlsO7Qutw==
X-Gm-Gg: ASbGncsDpBu8uuVu0HyLe68BX4gwx6fQn7vgQ+FZBR8sQZ7T6TVb1W4zRyEtOqM5bgR
	p41TuM0lxWGG15+wMW0442FD0IW7PAD/P9sb07fkrqGT688a4ZnZWckyLnqG+2EeHmgM4Dl/v4m
	SZ31xP6MkDt5Ul+f9sFkHVJljawlkLWjAJV4PZoZXuydGRqwg/90xnMxyC4sA0R5Lhv4eVQbtfq
	8H15rEma7g1/TRQY+mG9bF8g1mLsZ3AOm8y+v7wxO2CkTg2rMbKg2rWyusOKsqtO42Pb3SKXYix
	oY/R18BE4kWEEfp63hYuXY4y7OjbsDEEc/eIJi71V6T9Kw5T/8JhduVc2NpwsJP6re8ZZUbcgum
	hcaW7msmbW91qtJ+EzavPb0WsKgVGUWyMFlR2
X-Google-Smtp-Source: AGHT+IHVMoarSqMhD1xuUWKY4a33bFNL62O9B28e7MoyTtfr7/Zp5UT6kyBFKWJTYEphHxoEKF6rQw==
X-Received: by 2002:a05:6214:4119:b0:6fa:c0c8:4666 with SMTP id 6a1803df08f44-6faceba8590mr72186116d6.11.1748643447544;
        Fri, 30 May 2025 15:17:27 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:27 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
Date: Fri, 30 May 2025 17:17:10 -0500
Message-ID: <20250530221713.54804-4-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250530221713.54804-1-aford173@gmail.com>
References: <20250530221713.54804-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_151729_153074_D84F118B 
X-CRM114-Status: GOOD (  11.35  )
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

In preparation for increasing the default VPU clocks to overdrive,
configure the nominal values first to avoid running the nominal
devices out of spec when imx8mp.dtsi is changed.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../boot/dts/freescale/imx8mp-nominal.dtsi     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
index 2ce1860b244d..f269f7a004fc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
@@ -89,4 +89,22 @@ &media_blk_ctrl {
 			       <1039500000>;
 };
 
+&vpu_g1 {
+	assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
+	assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+	assigned-clock-rates = <600000000>;
+};
+
+&vpu_g2 {
+	assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
+	assigned-clock-rates = <500000000>;
+};
+
+&vpumix_blk_ctrl {
+	assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
+	assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
+	assigned-clock-rates = <600000000>, <600000000>;
+};
+
 /delete-node/ &{noc_opp_table/opp-1000000000};
-- 
2.48.1


