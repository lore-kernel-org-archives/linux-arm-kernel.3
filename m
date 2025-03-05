Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9267DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adw/wXG4xAXtVNNpVBpZ7rOz/ozzGq1WFDZ6AcGQFEg=; b=Ae8+WFZ9jx4yhPU4T3SXHrYVBE
	yFwpvNBlWCzodGqg35jCXGCGCY8r7EOAjuSgFJNrCfUCkzOpqMB7dFvl/DTpOoDdifO+O7vQNBHl2
	oGPQyYeiVjJzRwf36ICQpORv2sYjD9UCtSNZjkI/PepbSgCHX+fIvcSAudXSqKtbQoE4MM8hwIB6C
	ZtXBe7tXj8CKqZvUVeDNNX3va1X8YLpilox1YZxzwccSFxait+mAtWCgIIqsQs1b3+yBg+iRajte9
	Rz8Cu3BsL2PRdA8KWu84LzBr9DugvyE9IQXHVrmPjudoj8LhZbR0z/WbhvHkHQvcH2xglg0V/0C70
	fHQMdieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqzH-00000008Yg6-2RJT;
	Wed, 05 Mar 2025 15:48:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppyl-00000008OUZ-0rGX;
	Wed, 05 Mar 2025 14:44:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-390f5556579so3070201f8f.1;
        Wed, 05 Mar 2025 06:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741185849; x=1741790649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adw/wXG4xAXtVNNpVBpZ7rOz/ozzGq1WFDZ6AcGQFEg=;
        b=i3OWqoirVmifUsgzEbZLb9bVjMEZMY3woSydlOm4FqRGyTEQIh6bQ8DXmgJZUg+vwL
         hCS7IeQ873rFwmWnrKALPG4QSGUvdnC/lFgaUZIE7rivs21f9ImspGAu4bp2gpQgUF9c
         vIGtQxXKgZI0ev4M+J8vYuX25J/eIEmAKivUBJqka9ys/UnGqwPDJESj6wE8vj72OLvS
         pJzrEqZHeqndWO8kLzAmyoe2Wkqj5e9IGXAvvfb1O8+9KCcuglbTBfXqYVVXe3royhzp
         4tb84GTz+2ybibbiXMFvboyxN6WFHPV1AYrcCpkspcu3w0j+WBHzRJZrDNt7jXDNEWlg
         R9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741185849; x=1741790649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adw/wXG4xAXtVNNpVBpZ7rOz/ozzGq1WFDZ6AcGQFEg=;
        b=jpc6W8UKmONStLbqQ/+VJyFkKPTx6A1BfI9wcfZ6hjg9x5Zmbkeh604LiI5sPqM01b
         IAy86gSumbUe+qSmS92qrxLCBV9iksc//S/vJKnGsLzIWdHRBeRYNBDhX6qpwr43zfC2
         oXpn/b/aRhsTc1bPhcIdsJ6XDoon5XKfy/fZkSX8FgPM06iN0f0ldCfbI+oNt3XXBC3c
         cxS/SVuYbJoGOJtpNOHxrio5+QmfcDVH9wXN2BUM2B8qbcAF4HEt7+Uzn10m/FuO22IX
         jVOIxl1UJJnwLDruxpEheIWs1almjWJJ1XNyUD6XNZZaZc/mYxKn9G75Ft9CKbw4AMF/
         SdWA==
X-Forwarded-Encrypted: i=1; AJvYcCWNnAU23+xdVAEFNOfWE6QC0gmb/hJ3aGM5tgFwcoiwWrnYdIlxlZ9r6SNPDoFcRCSLa2rv7XU7DqJV1Sc6a7Pa@lists.infradead.org
X-Gm-Message-State: AOJu0YytB8OnBTMWXtvymIyV/TUH+pH1BENBMsUrq4VIBrAJPeFH/2yV
	bPeEWQkIxL1cfG81fpWuyEymy8rY79uZTJQ6KoXYobl3AoQQa/d/TLQCmh+N
X-Gm-Gg: ASbGncsmysD3ucNNm82xFn7L9qWf/NntR2LKbcdo4Leh1fAK/eLAFwcFza8ZYLOb565
	2M5Cd0BdZleB963czzfn0akXUSvzB/CH8wGz4QLYjwQy8VkHlw5RB5ef0glLoejcJPmnoB1P/BB
	DyaIqVWi9mure8NEzEzYJPjAZiCn5Va+jKNUtybs39suczPszVQA4Vjg7SOQj8x7yIxgDUZ8xuw
	Y0wbD1xp2jCaFJ2s3tU6EdqucFiBAobHEMLQebklOnDj3KPGqNS7Lkd6AIfxsWaNTQgiaDuzbPD
	ned4Bj4vmsC/qPrJOdKhHlvez6dItrLbRMhIO0+cyodnpS9C
X-Google-Smtp-Source: AGHT+IFbsaX9wmtUFug2h6kZAAYC0Hb0y6lxNl62FVu79knUqZWExgLI4s21uIXSphigDaJmEpgWiw==
X-Received: by 2002:a05:6000:2cd:b0:390:ea34:7d83 with SMTP id ffacd0b85a97d-3911f76f519mr3393536f8f.31.1741185849295;
        Wed, 05 Mar 2025 06:44:09 -0800 (PST)
Received: from eichest-laptop.. ([178.197.169.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435cd8csm19314375e9.40.2025.03.05.06.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:44:09 -0800 (PST)
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
Subject: [PATCH v2 1/2] phy: freescale: imx8m-pcie: cleanup reset logic
Date: Wed,  5 Mar 2025 15:43:15 +0100
Message-ID: <20250305144355.20364-2-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250305144355.20364-1-eichest@gmail.com>
References: <20250305144355.20364-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_064411_246059_7B25DCA6 
X-CRM114-Status: GOOD (  12.10  )
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
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index e98361dcdeadf..5b505e34ca364 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -141,15 +141,9 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
 			   IMX8MM_GPR_PCIE_REF_CLK_PLL);
 	usleep_range(100, 200);
 
-	switch (imx8_phy->drvdata->variant) {
-	case IMX8MP:
-		reset_control_deassert(imx8_phy->perst);
-		fallthrough;
-	case IMX8MM:
-		reset_control_deassert(imx8_phy->reset);
-		usleep_range(200, 500);
-		break;
-	}
+	reset_control_deassert(imx8_phy->perst);
+	reset_control_deassert(imx8_phy->reset);
+	usleep_range(200, 500);
 
 	/* Do the PHY common block reset */
 	regmap_update_bits(imx8_phy->iomuxc_gpr, IOMUXC_GPR14,
-- 
2.45.2


