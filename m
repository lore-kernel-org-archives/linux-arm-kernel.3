Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0707E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rn8lW3rSjrE0IbZU9Bqj+QdiQSzSCSOuzYtblSrGwYk=; b=rv/Rys5Wc2mZTC1xSHx49Cnm6x
	kyYdKRKs3xzQdsZZMP3U+RPbwoaJbN3SPgLungwMq2NIirpDUYEg4mfduBgiKBXqwpcEqTdn9NYD9
	BMVu5ylf8XDpv5/gQYlTiJEAOs/1x7BNIp9FFlvFZU4zqCNDxFdcVoLCF+9QFqxJCqjurMNzl0kTl
	v17GZJ+HxEmcQKf1ipwD9UVWN7ewiVxAljnrd3M6y5zmtElvhiva9/KJftu0nPtdWy7IQGAw+uWD8
	SSfP2XVuGRv462PrlswGeSHgxOylqLSMxsIk9prGTGy37XEAe6U6bSMC8LJKb6KBBcDLyyEc2/mJX
	XXzwyUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqNG-0000000229S-2aSd;
	Mon, 06 Jan 2025 16:54:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqKH-000000021EX-494W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:51:39 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21680814d42so178895975ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 08:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736182297; x=1736787097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn8lW3rSjrE0IbZU9Bqj+QdiQSzSCSOuzYtblSrGwYk=;
        b=mRdqYBSG/cSE93QzHlG6rf5YWiLAn63U+ovno92k1YqCxU1qTmNzifxeAe0U1hTn9L
         pu01v/Uk7nWASF7rxAcx9JCBnj6kehlYreKU5llYIn8Rn+LDHXOVNwwN6an6Mdq6YtIK
         CVTQY9sRJZbfJkbJJ1kdVLzO0BbPGoE2pSoQR/AtXIntipEfS+jsQkjSkQyusNO2y1Bi
         7S9c5zE+f9f5g3RT62AQ7V8cNXWQiCvEiYwd03RxbXgvkt/Dtz2Ol8vl4SEDeCwDDt4d
         9mdiSb3Ko0evp+uZdCtfYpLdZVyWTtlEpMEAuQGSO+arMBiG06TqdXkNWE0rPhgD6Nlz
         wPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736182297; x=1736787097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rn8lW3rSjrE0IbZU9Bqj+QdiQSzSCSOuzYtblSrGwYk=;
        b=W6RsTdTD/GhUyhGnnE0+MvgbC+xm+TsVGbcxJ4T+5CZVC4T/XvQ7aGN61A/yXFSuOE
         j0tMbvvTBMfcSlqzwsM+xTs6WNVq7qX/dNvWwEnjI5v8YOXG51pYFt+jBKEL+aAX8vxt
         wJRvuH4kG/nw3AnClBAbe/vo8Tq4aruoiD0s3zw0ERmxRhs+cmKC2k6Z4XmSyGNtnCw6
         QcnZuCBEpyj0H/52AOLagHMCitTDHeuWuA8Qn8ggsykf5JXoS/awTu6EDmUyzvUcnZHB
         2EMnUbP6vR3dLZLLg0c/sZEjVhue3F25o/h8j69NvO7VIu/bbBOuVJvDlsJpPnWcZmGX
         8eMw==
X-Forwarded-Encrypted: i=1; AJvYcCU9FsNToM8s9cp12nL4ipvFmZhpslaEYxpBadKIy3Mw7Nm7HRLG6UHwNsxRgJkNs/EKFP4hOCURe8VcqRxmaO8u@lists.infradead.org
X-Gm-Message-State: AOJu0YzVix1mRFE7AFsKKQW65cqrXK9mvGO1Y4M56fZyR/IDmbRSFxRq
	ijuVw57YPydQfhaeXR0JgLEmJ+tbtEVUJwbBbOjRmp11Ci9fUoBj
X-Gm-Gg: ASbGncsJY+ka5vTAgM4G9aAUJ16TYjTBbAIfHbOlYM8q01mx45COrmVWMNpqvw+JMi7
	5vr9npaYyi5mCGyoJR532Y36jGD9B+O7t6ETJNAJ/6opYgonnEi6hwFBl5U5Mo1EW6Of2XsIcGD
	xwX5X+Hds0sp3cOMdXYQdARty1HoAxb24JFNwElqaIHONYOhETtKZdxjoXNcSzst+EBRifg95Yh
	d1E8tR/WIHbkKw5QBWu5YO4DhmD6czYOUZQqcfA1kU1NrTkhhCQQoq/3CSGfv4DLc4zhwE=
X-Google-Smtp-Source: AGHT+IFVvYCt8+BTJHJ1mknobyE1ZxiRL3Mcv5E3U8+JCS2CU6ZpTr6xHnJwoc4XnMvuTpEwJF//Qw==
X-Received: by 2002:a05:6a21:1519:b0:1e1:cdff:5f18 with SMTP id adf61e73a8af0-1e5e044ef7fmr82312567637.4.1736182296711;
        Mon, 06 Jan 2025 08:51:36 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d4cb:2a53:2696:85ea])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb9fcsm31785334b3a.164.2025.01.06.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:51:36 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] arm64: dts: imx8mn-bsh-smm-s2pro: Remove invalid audio codec clock
Date: Mon,  6 Jan 2025 13:51:16 -0300
Message-Id: <20250106165116.2093458-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_085138_025846_1A74C992 
X-CRM114-Status: GOOD (  10.27  )
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

According to ti,tlv320dac3100.yaml, 'clocks' is not a valid property.

Remove it to fix the following dt-schema warning:

Unevaluated properties are not allowed ('clocks' was unexpected)

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes since v1:
- Wrap at 75 chars (Frank).

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
index c6ad65becc97..475cbf9e0d1e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
@@ -64,7 +64,6 @@ tlv320dac3101: audio-codec@18 {
 		DVDD-supply = <&buck5_reg>;
 		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 		ai31xx-micbias-vg = <MICBIAS_AVDDV>;
-		clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
 	};
 };
 
-- 
2.34.1


