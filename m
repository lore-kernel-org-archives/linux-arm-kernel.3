Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBCAC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=312sLNrqEv63+Mv44pzQbo4rdknipAPccCqJcSeXheU=; b=i01aB4U/dOgjqJhmQ/XFlGJ5Y3
	+I2DJtBa+mkds55xtI9zNrcEsN0uiXs8KieM0/+a4OKStfsCgidKVYDwjlJUqXZQcCWzRejn0hdZ/
	mPV49pXSKGOHhkeipTdII+2+ALCj4b04Hyquu2tj3/ttLh2nBAb4Yv3frzMGh/PefnSBB/CzvASKW
	xcH3CkdHOkL/XAGd/GQ3EbsSzNjx9BQUB2rbl7V1bjogljQsyjjWuOcEmNmp2rR1IwZeV2h2HiPY9
	G6OsJWB3YjYxqmTj2YHwU7Z6ja7eTthKQG36o/kJt8leIrFNWtUj2UNRI3YpV9pRuJYDuJwA8+mUI
	1UI9h31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyJV-0000000AiSe-2zYH;
	Fri, 28 Feb 2025 11:13:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxmq-0000000AdFk-11mp;
	Fri, 28 Feb 2025 10:40:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-439a4dec9d5so20418775e9.0;
        Fri, 28 Feb 2025 02:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740739206; x=1741344006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=312sLNrqEv63+Mv44pzQbo4rdknipAPccCqJcSeXheU=;
        b=BrqwN7qu4C8mYO29ujguHWzShWAhIo525U2SQTyetDRERrBjCcQkh6ZppSEQ1pOsAK
         FhcTrDZmV2hA5AUeSIiMDsPN6tklJNldJXcPpIYj+5bmul9v1U7rYG+Q08AsTK5x0TXs
         V30eR99RohTHvNp7Yj3OuHbJPPaLLKFMMbtruwcQAu/LZIW1wbBL5Ljsr/8g2aBAiFhu
         0qWI/qGE9Cidb5cU032ynHLzqIfLiQUFWrYlsj1jIY5/XAZaytxXS0QDdVWyKi5f487c
         o7CdfLLhm5PpG5TcwuKu24Bw0sxTMnmr3u0QwEGpJyzZNToeKLFBj4ysMtBd0d1Lr4xN
         2+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740739206; x=1741344006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=312sLNrqEv63+Mv44pzQbo4rdknipAPccCqJcSeXheU=;
        b=nFb89C1/uhYp5F8OEdKyQkOuEyPPZ7bBt8SQSnTvaqKcvQeeyeNqTj50irNXA5Ug/A
         3RbmS8lnxZEl0WAqW1ubL/K0pQ+fmOw75vZ+nHV9hIc7s7yOvRkQ2jUWgEuZLS6zdlis
         Lb0Qb0sySs/+nGlvl7ZqhRNqc+T2ZzLX+s0J0mkxwHFxajpllRtGiR7UD37CYmjUwN5J
         24TcBR78Kl9wPySrFzICfeTP6RAG8KqkjuK7N6NfWUPLjFK/iYuS7N/PZlSECm5FRW86
         h9TCsB27Cp2qvj2x5BxMXxpDtAF3KS0YZNDSO85BPqU+ZCC6npkAJ+MrgJoVENPntYxe
         2A5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXGeCvpa51nIp3SNWVgVS9w2+w0vpqhX6VsvkKyPupEMTd+LSF7LQ2RhoQ7xE6xq9l3b/vmrkGRjvwb7v24AcX@lists.infradead.org
X-Gm-Message-State: AOJu0YwpFYlc9ZsnXQDLS8v0VtqEbcSia4bVq7FENI8Fko9qaK2ERLw6
	yh/xufJoqxHi/N8m9kTgGE0hivRGor9g7TqmsAdrKZRf+hmVIML4
X-Gm-Gg: ASbGncunTDzu6QHVYVAklcNhrXrLAEHbP9g5dsyOa/P4HCwEfSBhrzuDBmE2a6hWtVl
	4I0cfm0pBuTDp4ID25AZcnlXecK0sESYWwVr+Yn8xGuSeBwlN5hLCbf+fqGG5GzpZKVx3bcS0Sl
	oqOLJeTFRbAtwhkgkigY5ftQXWDUHS9p7dkK2EpmB8IUv6Wldou7qujwR9+W/5dy74f/hwzSCc1
	N08bw3U88oN/tua9NvbKznXOMcaeMDRHc0JDhnA7hCxiYB3siUFWksHIkOph2fj8s+fRoiH5L/T
	xOX4dz7V5rvVBJwWxyYzunzirEm/kFHfqGHWKATsag==
X-Google-Smtp-Source: AGHT+IFncYfQLZzLO9PxJRHTbcQAlKTjUNCZ0jwHv2Xpg6+UDCdisti3XOyvr9rdDHjH0Z4kclaw5A==
X-Received: by 2002:a05:600c:4685:b0:439:a0a3:a15 with SMTP id 5b1f17b1804b1-43ba67045camr27125335e9.14.1740739206381;
        Fri, 28 Feb 2025 02:40:06 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:31d5:4145:8035:cb68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b73703caesm52078855e9.12.2025.02.28.02.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:40:06 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	tharvey@gateworks.com,
	hongxing.zhu@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 1/2] phy: freescale: imx8m-pcie: cleanup reset logic
Date: Fri, 28 Feb 2025 11:38:33 +0100
Message-ID: <20250228103959.47419-2-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250228103959.47419-1-eichest@gmail.com>
References: <20250228103959.47419-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_024008_282834_28B5DE72 
X-CRM114-Status: GOOD (  12.05  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Remove the switch statement and base perst release on whether it is
found in the device tree. The probe function fails without the reset
property, making it mandatory. Therefore, always release reset
independent of the variant.

This does not change the behavior of the driver but reduces driver
complexity and allows for easier future modifications.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index e98361dcdeadf..00f957a42d9dc 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -141,15 +141,11 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
 			   IMX8MM_GPR_PCIE_REF_CLK_PLL);
 	usleep_range(100, 200);
 
-	switch (imx8_phy->drvdata->variant) {
-	case IMX8MP:
+	if (imx8_phy->perst)
 		reset_control_deassert(imx8_phy->perst);
-		fallthrough;
-	case IMX8MM:
-		reset_control_deassert(imx8_phy->reset);
-		usleep_range(200, 500);
-		break;
-	}
+
+	reset_control_deassert(imx8_phy->reset);
+	usleep_range(200, 500);
 
 	/* Do the PHY common block reset */
 	regmap_update_bits(imx8_phy->iomuxc_gpr, IOMUXC_GPR14,
-- 
2.45.2


