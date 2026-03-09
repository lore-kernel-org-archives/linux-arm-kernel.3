Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFE5FCA16A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 18:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SK0O0QG/EC/tK5NkBJ2Mw/XSALNyyYRp9uLd2Au15Pc=; b=PwROSLe7AemZWLCLlAQrydfPao
	2NTJ4oDtD908uSeE33ECZoC+u3R7XiFBI+83N3QSkSK5R69YyjCxazy07ZiIIZw6Z4n/0XzAfbKq3
	mQmcgSlBxy3IJbTeIJDFN6OaS7P2OpOzvoid3IgVnMlYKSVGGqMROP/CarHwhv8LPR9Jd5vm/slBK
	0WYedEn80tzmyka2yIXZfYbiEkhgv3zNNj4+es9/DyKh7c1SSCGhMz0doSJAYoRS9iw5kAWBYQQiQ
	Ujx8qlm6MkYR0B4SAqw7wTKUMJ+xep102Qb1BrmOctn1FGX9o9iL0JZcGKhyHDQPRVhqXOcq61QIf
	d4f8QX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfAc-00000007tO9-0D5V;
	Mon, 09 Mar 2026 18:17:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfAZ-00000007tNV-3HQb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 18:17:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-485409ab264so4813175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 11:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080249; x=1773685049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SK0O0QG/EC/tK5NkBJ2Mw/XSALNyyYRp9uLd2Au15Pc=;
        b=JYr288XulSTo3FnQhYOTm1smvxfooJTzHe0UwJLNbCvPY5DEeDH7G/Sy4ho7xdVgG4
         VbivPC+wC8ji4r0x6bATI74ExuvWdLTZ4XFH3WxQBnYTT5VuPOQ3qdSSjocmL9ffdPgW
         FPixuAH0DweonU7L0vKbrq3p7zc4CsAbECTyqvIr53o7q+KNNMoIhkecOBxlQsvWpA0w
         +FG5+lWJuW51RJmsk62KuOgLHn1RhseN1nVwQDlxVon1SXXhsCod0Ph5EvjwZ/uRO0N9
         VkLeC5V/U70HH2cY9IADe6htW8t7LMJe+TuWkuKpd03pQ0q3jMlYuhiYyoUKeYMzmSau
         W84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080249; x=1773685049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SK0O0QG/EC/tK5NkBJ2Mw/XSALNyyYRp9uLd2Au15Pc=;
        b=sVWlH/hTvedMOeQngXNvxt7kg5ubaDRN1yLdOwekBDCcjCIqro/uxc5fIpBkxY06BM
         au95he6UIc2UvNGf/alaBqBysE3XMyQb9EeRx7zcGv1pFAcc3VXpdC70CXTLpR9XZvI1
         SedrdprGM7rin4N8gWRDc3I5vtyJMqAIsCcJsKCo5NntyT3+ciJZGo/0VBTUDT+gYev+
         09hDPnCv4n4mAC25hdJ5sVMo/uHfZMycmr388hs/fqe0cpr7daRMyab/bZ/hxY+03fvl
         QUdNsJosJYBUEsC3aA+bUoc7HmVPaL9cJs1CZniT3AxsvHlSEcTqt/Qq6lsu/IwdO3a0
         5TXw==
X-Forwarded-Encrypted: i=1; AJvYcCXbJQUmO6JsoMeQ/sNzI3BIyihvS8UcXmcDccsynNijkIpyupd2ROjM6wqu3JpyoZcewbNOea0TAuv5HyXkpzTe@lists.infradead.org
X-Gm-Message-State: AOJu0Yxup2Mx5ZdXVaVW7he329DNres0PSaQwRgxDx0q8hrGWRirrPui
	MRQPQk/18389lS5CbOUwkWicciieNOOyFEKekVFnNVjyXqqEHyjw7AEy
X-Gm-Gg: ATEYQzxa1Km903IhiwBGHe83iIsbLlihJt3uiM6iKfazjjFjG995Wb4WsRT1eORaQcY
	VsUU4w80J5nCVjI8DLWBqDVNmaMgU2eI/lTFubs+802hp1BHFVan/cz4dAnNJgWArMVMU7LGrcg
	oG4UGeelyEwNDXCx1FKy8b8WYif9zIfCpzsLUYDwzWPQno0CM3VQReRJZNc7nl/Tsw8FGMreXDR
	aFnJCQ3nVZy9kr/KAAGPtD7UDbHKhH5/lJ0mSN0wcOg2ZZttBz/FAplLfiStRGGCUMWyESUHstf
	uUEyoL60Nyco2ahrt3jMmaGgZ39lYvFh+DUs98kMQbnR7HO8bHb1C9O4BffoqRc7jhFo6vICW8P
	sk0JiCV22GYb4yJFHeokBVQ3Mo4Bdi/O4P7mWehekdKLwzQLq5inguM15dBpah2f9lB78Kirs7V
	xECTvR7tJALPW0Xw==
X-Received: by 2002:a05:600c:6488:b0:485:38f1:5cec with SMTP id 5b1f17b1804b1-485419c24a8mr10040535e9.7.1773080248529;
        Mon, 09 Mar 2026 11:17:28 -0700 (PDT)
Received: from fedora ([82.137.32.29])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541b7f3cdsm8866965e9.14.2026.03.09.11.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:17:28 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-dhcom-pdk3: Use symbolic macro for IOMUXC_SAI2_TXC__GPIO4_IO25
Date: Mon,  9 Mar 2026 20:15:23 +0200
Message-ID: <20260309181524.39423-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_111731_960327_53AC6AEF 
X-CRM114-Status: GOOD (  12.95  )
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

Currently, in order to configure IOMUXC_SAI2_TXC__GPIO4_IO25 a magic
raw value is written in this register. This makes the code not obvious
to read and modify.

Use the MX8MP_SION symbolic macro instead of the magic value to improve
code readability.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
index ef012e8365b1f..6ad824a7e07e0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
@@ -345,7 +345,7 @@ &pinctrl_dhcom_l
 
 	pinctrl_ptn5150: ptn5150grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25		0x40000000
+			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25		MX8MP_SION
 		>;
 	};
 };
-- 
2.43.0


