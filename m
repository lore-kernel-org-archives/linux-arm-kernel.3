Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B47CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UHUfn8CsP06uZW2KYcWPd/uEBbB2UBx7qyNJnvj6SOA=; b=THoTOclyYB3CLxWGnLbDmJyfU4
	JtqC06wSvSma+Sb09z4TSgJ0JaNjkbcGjBXHJnHLEuCj9jewARNp731Bl5qoDbyz43J1L2T8CfCPO
	AftgHzl8FSpa9JQNTcaW3BnrWGNDlvWYWdVjDMw8Gr1cZC5RaS1rrL+2yb3/iR+++JOFhE0RkKyqw
	i3WUl96tBFaBagqLJzGBMg1WvmUvdHRS7PJY96A57EvCXF+CAlCLzsdl15nmtOc/y4GGm2uT8qP3p
	aZCwHHIAow3rYb+M7d+v/1vs3jCfmyiz2FlDXlvCN3qIW/l+NS2z2PhwEWTOoSu7rTE42nmN1VQfB
	tYLinE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBif-00000003wYh-4AfJ;
	Wed, 27 May 2026 10:42:37 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBid-00000003wXm-3W2k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:42:37 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-3699cdeec05so5027438a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 03:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779878555; x=1780483355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UHUfn8CsP06uZW2KYcWPd/uEBbB2UBx7qyNJnvj6SOA=;
        b=IcFYC6ayB/KcELyCPSQvlWd7J5ct524sqdlxKnX/w0TzEMQCVRz9grDj9BoEpy9DLm
         mHwm7UZjpdhXnhMHJvH56mCLJxe2qgh+lvi7uLBy85x3Z3Fgmdn9G2gAcXVFSpsZE5Ux
         /3ODYUi1ThkM/mRrRBxxxTOlZvBRw0xR8erAleZUghlver2M2N72bXOEwc3oEcOMR//K
         OTdUMib95lUzyXW1L/b1B3GNywlS8CRrr3p1lpUutn5CWEM1+El3mdwgaop9VyAmOhJE
         XFMTz4kl1RiPXpk2P0sFfAasaCtGEGK3ML9vkVGzszdyOS7UnQ+bR9NmZDiYn4PcE5lQ
         gTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878555; x=1780483355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHUfn8CsP06uZW2KYcWPd/uEBbB2UBx7qyNJnvj6SOA=;
        b=SSKEdebhKP0SDZZDqXZKLjsUAO1W26s6pugLCgPBA0YOBQpGwlSI6NzPBvAs4wlrXF
         79OLx7l/U2ZTb9XKhgdX1pCQ+fYo4s/8uCfHVKI8JcCJ2X+by3paNHaDSuEW/hGyhzsO
         DFIG5LYwz9h0EYlpUxoYFJWVt4sODHA0j4MCKTHmlXyOLzSBgOb/hON0ono0ZE/q8YZE
         fCYoXgaxUyh9ZPkMigtx6fj2zR45fqXH66blnJYTBeVopSqDBE9QdMvb3xO3qF10lO96
         UDfKFyn+8kn+EiM04Q80C9nTDzuu/Rfuw2ESfwlJmCxVnFDSijAdNo20efJcVJfLE4cd
         yFjw==
X-Forwarded-Encrypted: i=1; AFNElJ/pGJCaGgC0P5DXzZKKXiiwzgtAH3xSdzUTamEMBopM2X2986UDU+r54uvBPgpbT/q//RneasNDMPNNrnytbJy5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6GVycA10V8c9ggm4em5xaazasVVGKDbgDP4PZtAnzc8bsO+7R
	sIG9sZ7YGPeosz52VfX4PQ4ipOE5MP1dFYrJdKFBlhW/TbWlLKIUvU8=
X-Gm-Gg: Acq92OGRdzP4rBe44+wAP7sKUsSxX5hVg+0zqgKmiC17htLGUiX/+SNHxdw9VL9+vsk
	s7+KtRX4RB4ZH4sdmnCdK2I5O+WFN4pTjgOj3B8/vBz/I5WgdUFrW2B08ZxQOJdor9qdm4ZVGD5
	cTSxyV0y2nFT1AEq4+5zJi5Ieuh+p2K6Ta6FET/uYlLGtNb3CjDzE41nvQS19iSR4YIj/l6O27X
	hDyD8hrAJ8/juzD0hm6ixpKzeftuCbQuhTDuvRFt2iyo/w+ROms/FXzdPrl2tN331IxdCGEj7rH
	3ZUNJIy5HvUd2Wd3VinoA/IO57MA7yhypO65YQWUUeHCoYf/yZIBVZ+yvr4KQnsC2vOXxBfpjmM
	kg+qgb08F3cJF3rZkFGsosd8oNgXYss9UkAAcWKAQ+pPvDiQkYxFNa5tZFGIvUpcy9fKXm3Y9o2
	9CL+Q2AIc8NiRiWxJ0fMGe6wof1wwzN2yupUnNS2n7s4+N
X-Received: by 2002:a17:902:d48e:b0:2ba:5a20:1d94 with SMTP id d9443c01a7336-2beb059944cmr252757165ad.13.1779878554858;
        Wed, 27 May 2026 03:42:34 -0700 (PDT)
Received: from localhost.localdomain ([211.196.223.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58ff106sm141099865ad.74.2026.05.27.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:42:34 -0700 (PDT)
From: Jinseok Kim <always.starving0@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm: dts: bcm2711: Fix typo in gpio-line-names
Date: Wed, 27 May 2026 19:39:26 +0900
Message-ID: <20260527103930.2973-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_034235_880393_8FBE2453 
X-CRM114-Status: GOOD (  13.12  )
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

Replace "RGMIO_MDC" with "RGMII_MDC" in gpio-line-names.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
Changes in v2:
- Fix the same typo in bcm2711-rpi-cm4-io.dts
- Link to v1: https://lore.kernel.org/all/20260527100439.2507-1-always.starving0@gmail.com
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts    | 2 +-
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
index 353bb50ce542..5469fa663526 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -110,7 +110,7 @@ &gpio {
 			  "GPIO26",
 			  "GPIO27",
 			  "RGMII_MDIO",
-			  "RGMIO_MDC",
+			  "RGMII_MDC",
 			  /* Used by BT module */
 			  "CTS0",		/* 30 */
 			  "RTS0",
diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
index 6bc77dd48c0d..1f4ebec68370 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
@@ -56,7 +56,7 @@ &gpio {
 			  "GPIO26",
 			  "GPIO27",
 			  "RGMII_MDIO",
-			  "RGMIO_MDC",
+			  "RGMII_MDC",
 			  /* Used by BT module */
 			  "CTS0",
 			  "RTS0",
--
2.43.0

