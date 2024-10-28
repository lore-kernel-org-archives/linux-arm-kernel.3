Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ECED339AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 18:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eoe5fq9cwx8Acx4SnxJBzM/rUpD7RA4Aod7FbAKZ16A=; b=YiXHbVmc2VBod5Bi7GW7OrCJXc
	JrY60YmjZcsyg9GDGYLO7FnzcqntnV2KY9EDIaKaFmaFt/ErTeXUosT/3CSRtAzTSprCF1XBsDLOZ
	GIxGYEaWDTNVayP5Q7xxoci5b8IMFqssMLGHX0uQJlHLUlwJ/DU4G0RjG4L7U7ovYyzMPGM7GPcvi
	oZqZmTx0atgSFMWmz1xOC4FTslAIRPrz0mBn+KVn9JCmUvTqRIJTZLUruStLCmCn0yr1BvQwOSWHz
	UYOib1JcrmUD/OiV+PQclg8sk5cQUokx7a/7bAJcVTSvqxzCB2HriT/ipGzK0TsuegsiJA7ev+keW
	vpGUYVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UGK-0000000BmIW-1gRY;
	Mon, 28 Oct 2024 18:14:44 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UBC-0000000BlCR-1S8O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 18:09:27 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7d916b6a73aso2844841a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 11:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138965; x=1730743765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eoe5fq9cwx8Acx4SnxJBzM/rUpD7RA4Aod7FbAKZ16A=;
        b=jSnyLrMRisVxpAejL/efaOipl+MYFUjfjU8IVpGnt7bsgxG7b2izcbSgZG0V0wEDV5
         D5jrYH9PuES3mkq+Jj+ZJMzACwficH59J3PVB7eBBeatsMrFLEK60hEze7p7Fmw2Z4JF
         4jW0zjpnBJFv3egG03vpYS3I5c4swCdJm4KrOlQv/xtK2oCbr7Ky+pRR4b06Lu7SyZ/M
         d0hDer71agfE+6xFwt/PjY+DOwlo0AEPrUSSwtQTqiEgvsJx8TmsIywfpp05gvHV206b
         F55DLLle2mmC+rvaJtkxdMTwtH9MoclZMaibKT/9iMl56ujGhnCVbr65aezuWEmohxUS
         5fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138965; x=1730743765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eoe5fq9cwx8Acx4SnxJBzM/rUpD7RA4Aod7FbAKZ16A=;
        b=PF4SC9P6UcTd5+Ha7OwYQV7yo/xKiU9Dopx4aValGucrXpdQJNFS5SCV5f9543XMJK
         H/VsOoZMp/IscD610RPJJYT0ZGiES2KuFw2rz6KpIdmCzaN/stQJMvhNYqIECPgUocKs
         sa4Lvf0tAG0G9Lh72rQHGKMOHxK5ni6UJABkyN65sYl6l3ysFKvBihBAU8dUUwCo1F52
         skdmC7ZkXEEXngfxUgawndu5xlVybyLssjyGn3PrW9jh7y8g4WTLWtxHWC7QMW5CRwE5
         LqQRMtzZsNHhwT+tecK2kUYefn5wXdovszPQA6wBLC9ixpVdrjnGydD09WC8ZfCHvf7D
         X7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhAnCQGaTstoLN1oUyO9fZdNAxE1zKa1fjC9sl9f3uwdB23WuVz1eRHTxWbpp7HMIgX+gwGseIb10VZS5pg3M/@lists.infradead.org
X-Gm-Message-State: AOJu0YxkxZTj76vOzTAEfHqGe0ZWRw0/zGmxlJiFRV7EEi5++2KcCs3/
	1nxhYGKJIQ27RxzPMIfGeAaaGUJdqGr5YFCNKlOJMNNGCBkKtBCk
X-Google-Smtp-Source: AGHT+IHSVF2TnOsPfO2+2FQhmWlLkKWH1RrgNcPWEjH8nM80YwzMmdGX1r3fDq6rR7zvn3hmH2wXaw==
X-Received: by 2002:a17:90a:6d26:b0:2e2:bf7f:3363 with SMTP id 98e67ed59e1d1-2e8f104c90amr9424883a91.6.1730138965152;
        Mon, 28 Oct 2024 11:09:25 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:325c:8d87:ee5c:f04e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3572efbsm7690441a91.22.2024.10.28.11.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:09:24 -0700 (PDT)
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
Subject: [PATCH 2/2] ARM: dts: imx6sx: Remove fsl,imx6sx-lcdif fallback
Date: Mon, 28 Oct 2024 15:08:44 -0300
Message-Id: <20241028180844.154349-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028180844.154349-1-festevam@gmail.com>
References: <20241028180844.154349-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_110926_409957_51DFC0ED 
X-CRM114-Status: GOOD (  11.79  )
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

According to fsl,lcdif.yaml, "fsl,imx6sx-lcdif" does not have any fallback.

Change it accordingly to fix the following dt-schema warnings:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index b386448486df..e56fcd9ee6f9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -1301,7 +1301,7 @@ csi2: csi@221c000 {
 				};
 
 				lcdif1: lcdif@2220000 {
-					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
+					compatible = "fsl,imx6sx-lcdif";
 					reg = <0x02220000 0x4000>;
 					interrupts = <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>;
 					clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
@@ -1322,7 +1322,7 @@ lcdif1_to_ldb: endpoint {
 				};
 
 				lcdif2: lcdif@2224000 {
-					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
+					compatible = "fsl,imx6sx-lcdif";
 					reg = <0x02224000 0x4000>;
 					interrupts = <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>;
 					clocks = <&clks IMX6SX_CLK_LCDIF2_PIX>,
-- 
2.34.1


