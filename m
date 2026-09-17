Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C066C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZTHVF5d2BHEGYh8wWAhHMVlO8LgEUkq4aZ2zQxWQOk=; b=0yznxcbIFy38w54kxmkNuuRHdP
	Zf7iqAN/P/aXGOy7FcqDtPPBa7obzYYc65STi27Z78NFU6huJXyepN50KZTSCs0+c6BhMpXrYYDJt
	KTaIUS54pFJfTtrUyExu3SR6XAN0zzj1ZdGknqmEYTRc3P4GFvnFZE70iGV0RDqIHycbZ6YyIWoMG
	NLbouajS92fg4Bp74h37HC8Nb1swMCq+BQGfuUa+4iC3H8ju0aKiKn92epBNhO0glig1hLNlp1Aly
	06ScJpDxtw0GPl+fgzd06uvdgn83J1XBcjE5s2cgAZAF+c6ooYWPnZnGcWtgUMrPbipnEfDn72yoI
	ltYCaCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EFC-0000000BjB5-2Pkd;
	Thu, 17 Sep 2026 15:41:50 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EF6-0000000Bj8H-0HIO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:41:45 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso10014195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659702; x=1790264502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZTHVF5d2BHEGYh8wWAhHMVlO8LgEUkq4aZ2zQxWQOk=;
        b=ApObsCNdNTcuIqhFCr/dRsSBDjyS/TVPLLQBD9Cr2lATJ0hTaMTSB+U2jcesPfY2/W
         OmHKqUwXjxt6VozPGgjCElxXbHNdPcqb+GAhD2QHVT6lFf1XqQTEpfmMzj7ZrruJmk82
         InTdf68RYxi0L+0bMzplUOfIjjeMGNpxr6ZZF6x03TCap7eAxTR318EdXF8U5rE1HXQj
         3WlWr9/BB1WmKV28CMm9IY2udmep7eqOj7yn7AOMzENkUYqemX/A+LdPyI8NNwaPt1uN
         ManoEM94VW3CYzKfITs89+uWbK25NLbx0WZryW5/W086FbuQY4lUGJ6IHL05qiDxslSQ
         jNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659702; x=1790264502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZTHVF5d2BHEGYh8wWAhHMVlO8LgEUkq4aZ2zQxWQOk=;
        b=PYm6wXTwFy2hKGQHza5Wqd9I8ZsNtF98vOvOx24n+AwS1T4cYrqft0ER7flj9C+t2m
         IFy975tnaKtECU6fnHQ147PGihE0qQBbypSYkNwRkJk5JlG6ggwt8d5Kxh+tD+81DMbj
         xGEZW5//p29HzXQFTXUcvLLbenj4unJ+42lRC+ak8EoZblE5u3FfxVT8blc5Ijpz1UeX
         7AT3oUDAlZIveFKqNQTeJaPT+/8LgZ4udBfpB1WNJpHb9R29ppnbjh19zINg/NxZ3qo1
         RzM78OP2wvsnWLoLjoPjMUeT70MgvlmBBGAGQIY+xDtUZf/IPt5Oj6+bnBb9xftT5vUR
         TRSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUfCcr8sjLfblD7+cE50BXpwmb+2+cZKh5T4m2ffSlpq4CmPWIUuZ1GQLy+3gDM2seLlnrKdu3Ecf79VH0MVD+@lists.infradead.org
X-Gm-Message-State: AFuF++mT8aPUzdY2z7UfMiBwkN7U85WLy9J64G2XwPBqdTi3Lxohhi4z
	me/yC7mi30XiyMkrNl6nbVuY+BK8e70I57Sig+3B06cfqeCg8k6Hp3iV
X-Gm-Gg: AYBFou38RBvIGOJHOijLXqLbx/B4rmnj2XQbVFEf13VWCirsSOE+vvMiYsbFQGZ4xLi
	BCCG0+KxtAyyrew297mY3posRCwNGEG+wo0QfNwouWX3knlEaTefnbcMxHYj7wo8Jh+vTLyZ1A2
	qJt7Mplf8LzcqomQ4uC750c22Naf/aT7UbV5Z+anqSwhT6YU3hgXIOhjQcwiTxUAerbaCH7H7VB
	wcGMjv2+fLIfrVU6g/aVcmJVzQl/C/lnCpM3QJb/ieLHqwjXJLQJNzOGrvYrC2Ocn7sdkjq3Tnk
	1UAJZs8X2KRqzMP6TgbdINcOkSPx+N1YTasmVlC95a8d5G9bhKq5eASvYJ7E0ffU7FBsLmKKvnK
	07yni6qx8RVv3/0TYzNP7T38GBH/+AFhv9+yeR8vfCxHVFnARbNBetzumiBJw1LLEEVhCNy7+gE
	chteGxSt+V6ZFWN1IddIb2xEDoGwhbbF28vXA+bPrLNkSSC2NoVArLeoBir9pXypQuv4/ydMOS5
	aHpR/udLZV71MJo1892Q/dxGRe1fNWxeMtJui1aultyqY/AmZ6UJ+S1vt30NcVGVoPPe279FZ61
	wHgH8Go3PmZqLZlLeYNyNidmt1J0m1Ek
X-Received: by 2002:a05:600c:3b20:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49eb733ba12mr88495725e9.33.1789659701524;
        Thu, 17 Sep 2026 08:41:41 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Ferraro <francesco.f@variscite.com>
Subject: [PATCH v2 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Thu, 17 Sep 2026 17:41:28 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084144_138068_ABA255F3 
X-CRM114-Status: GOOD (  11.71  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Configure SAI3 to operate in synchronous RX mode, so that the trasmit
path uses the receive bit clock and frame sync signals.

Remove the TX_SYNC and TX_BCLK pinmux entries, as these signals are not
used in this configuration.

Co-developed-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 2324063f8fd9..c7a9eb23e5e8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -305,6 +305,7 @@ &sai3 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <1536000>;
 	fsl,sai-mclk-direction-output;
+	fsl,sai-synchronous-rx;
 	status = "okay";
 };
 
@@ -446,8 +447,6 @@ pinctrl_sai3: sai3grp {
 			MX8MM_IOMUXC_SAI3_RXFS_SAI3_RX_SYNC		0xd6
 			MX8MM_IOMUXC_SAI3_RXC_SAI3_RX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_RXD_SAI3_RX_DATA0		0xd6
-			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
-			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
 			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
-- 
2.47.3


