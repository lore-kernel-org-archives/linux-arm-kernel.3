Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55541D339B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 18:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UGG5X0yybapnwgmSNjPP2ZTIazkkUBze7cfeSlPaqKw=; b=06T/UVDI06tMF/2+CM9i6g9oC/
	1EWBOlABjtWtq4Fd6yL6zhsTT6dzJxwNjG86YD01DfGvhG2aHtJz9JSB4G9UuPI0yMXIQ8UtX+P4Z
	fFu+SLw0df61VSjlNsQwsu9W7LeH+0UE8To5BlvrnJkjJSbR9OXNHUvk93QYMoB/ihNw1AgSjCSgw
	hfIwInTg1OS1P1rZQtBqS4KqVpU1UDbJPW7N3H3v6R45FNHkehmqNY0nklKFIUxEB0nlTAJBMZJvt
	/ScuG2xzgSYXUv2LPU6cPNEQtJ8gqH/ZCkxZE79tyYxpuwn38PLvZmtb4yr87fiJPXaVXfLZCX+8T
	x4kpOV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UGJ-0000000BmHL-32aG;
	Mon, 28 Oct 2024 18:14:43 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UB9-0000000BlAV-1Keh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 18:09:25 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7ed9c16f687so3608173a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 11:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138962; x=1730743762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGG5X0yybapnwgmSNjPP2ZTIazkkUBze7cfeSlPaqKw=;
        b=j5IPzDomLT+vzcOhzvcob5UHkEFtXOZV7JXc4JcgvxOe2H5OPzMpP6xprfPmZhwIGJ
         rqqQKcgNMDVrK5QUsqt9pPNBFHze85ZCodTST3N3pyCw5fG/Aqk2XRUDW1K00KPH3T9x
         ZB/Y0XWHE/zzPClgpaJZUCDu8H3vUfcWlvNqpSX0JlLuA6hS+E5l9iJKXIEQcUUcniIs
         cYCx/0FORF9DqQt/5ZKv0sPkp6+tIKhdxKljjn53OwqRrrdXseVLsXYceUWMllBrf1Wp
         lf/cPw1FqnySS2qHGXvTkA+uaqNnenK/3NvsnEI8g2VB71sQXhZzY8KLV7JHa3fk39jJ
         5a7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138962; x=1730743762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGG5X0yybapnwgmSNjPP2ZTIazkkUBze7cfeSlPaqKw=;
        b=SuduFOfs4Q0avFQ2L2Wx3z5LzeGbctjAuPseslSe4ksdCMIIkE1RTYAmfzOTHmjZHO
         4qzF5WEtqWAWl4lPV0pqrZ819j7IdMsV1S13DXDh9G9wrbRgW+kzFalomUYvpuI1ku/i
         T13WihSlzNRMItF+3t3HriizA6JgP51kfWJTBbBjXQXA0BbquowRNZ6kGzAHI2a9Gkod
         LYZ05OKlrLBjl9VfDZQdAQZlemEKrO4jroSoINx7Nnwb0JQRqmAU7npSN+clqF5HGQFD
         GvDfj8O0uPxNn9hwmqK7MWU8IOBJEYoFX8jEQcBK0sBIJ6ebRgq4jFEKmVjMvA7iizHn
         JgNA==
X-Forwarded-Encrypted: i=1; AJvYcCWgQ4fQnNnGDb6ZgVKPl212luOMhcilYlHeHwYwW4d7ThKyVWcjffZoCyKkX4vkAtvYU9EVwtGnqtXMhU5874EP@lists.infradead.org
X-Gm-Message-State: AOJu0YxkkpBJmbzb5e8F/9NyoY5VV3Za7xiiCr1wuoZ7OBbazXI26Wh7
	Ksz4LHnJchBMJv42cuRJQ/7x9O2jc7eJZgRJhrjdKKqCTSIdlaDjDF5uNQ==
X-Google-Smtp-Source: AGHT+IFwLZKrhb4CCtfrwaROp/UzNVA+c8FepE7KZrzTAdYxYuZwqx98BKpaRPPTEhyUAxG8NTFaTA==
X-Received: by 2002:a17:90a:4b08:b0:2e2:bad3:e393 with SMTP id 98e67ed59e1d1-2e8f104f1d4mr10710044a91.3.1730138961890;
        Mon, 28 Oct 2024 11:09:21 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:325c:8d87:ee5c:f04e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3572efbsm7690441a91.22.2024.10.28.11.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:09:21 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	andreas@kemnade.info,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] ARM: dts: imx6sl: Fix lcdif compatible fallback
Date: Mon, 28 Oct 2024 15:08:43 -0300
Message-Id: <20241028180844.154349-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_110923_381850_7E06B511 
X-CRM114-Status: GOOD (  11.59  )
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

From: Fabio Estevam <festevam@denx.de>

According to fsl,lcdif.yaml, the correct imx6sl and imx6sll lcdif
compatible fallback is 'fsl,imx6sx-lcdif'.

Change it accordingly to fix the following dt-schema warnings:

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..c213f48382d5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -773,7 +773,7 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index d219c2b67294..156cba79268b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -660,7 +660,7 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.34.1


