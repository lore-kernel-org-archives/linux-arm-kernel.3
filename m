Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68DBD10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BZZZwz0qurP9at0y9Iwkn9okEEYxxIWrTa7jOw0qqL8=; b=3h00Pe9reRvYdIILIWFt1e7F4f
	/1KyJdwNs5bc38O4ZCS3ouxhQmcj6rYlXZdbvlBWrBuXW1T+EPh2qb8N3GbJtpmWLm55ulzzTV19Q
	r17Tff5TvGceuaXsH2/g55mQYxDMepsSSmPv5CpJXOTmTkZ3xlosPyVnZr9HPjtXy/Wdc79glbL1T
	ZV5RtKlJcUqntzPK4WBlLQs1SLuccN2ly3KEtsyY4TPyg4qNUMKP5044AIqp06POZKNDCmqdgc7EL
	8VApzi8+8KOQXl3/o3upCXqHaXaxKy1QrUmPAZugGrzR2953SykcihYyNMx3x65n/ajBkDHImrlgd
	SXbCVahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t48sI-000000028tt-2nir;
	Fri, 25 Oct 2024 01:12:22 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t48pR-000000028KE-2OG5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 01:09:26 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71e7086c231so1102474b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 18:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729818564; x=1730423364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZZZwz0qurP9at0y9Iwkn9okEEYxxIWrTa7jOw0qqL8=;
        b=MWgIAnvw9gRPbXVR7qBEV0adAmqoqwZI+A+eD3f4smOgOMf5EE3dB+SvzpCzuOef6y
         r9SHzugwWjN/MmgPrLsqyAVWNOHtkoWF+Gu/6XL6wPw3dEe6yerZ2E1Mlgqu3gnM1fLP
         FdFXQVLzNZTsUybAqc0x5Y7q5rwI69xMcov8h8BEsUPQ5O4BZWbL/nTBRgOxMm9k6DxZ
         +hWlQeCvEp+j5GMXNv/F71GaBjlkTQ1Ax4kVRfbTrsq98ssxFcE7FWGTlWVgPKm7r1Ik
         X02PbvGo0IO1aAahO+rlsDziyyo2/IJ9omOjWyzw1Q3JyZPB0i9bL9cFdw+xVQ69ID6I
         +UAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729818564; x=1730423364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZZZwz0qurP9at0y9Iwkn9okEEYxxIWrTa7jOw0qqL8=;
        b=msrj1WgalSGvLOzktteI5M/ju3GvcahGfgcuyu2lrPxYfVCQ5BXawLI9078ErRpxcu
         PwBcvTGnM/mWS23QeFa19pixEPe9XKGzcHj8BiZzWUkWTwzgtkPJBeewKLh1m4nCLFcT
         LDY4Z5xX/vNe1W8m2L0P+qAgqGcTNw9L5LyrqVAUsejYk+YLTNABRX30caJr+R5qlAOy
         HKjYWiMmAsSX0mrjOnBu5VOn1PooQ19EsmN9IaOWXZlRzY2HqIQMex5ouzXl81CtamXA
         cypKrwe/UX4r4+EqzlKEs2OyJ0LEEE1dHOLqztDu1iah3/Z0YT+am6sMxQ/n0/i6iWxv
         y8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWwcawv4M9VLcvIvtQvygKf0fwXXmTWrQIhR/M/st3qIOYvcqN2LsK/bpvxiFOk+P1f6mtgV6bG5sMwV1zJI5sS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9UXVhlDHy+HyGHs/wWv3oNkS0640+4PqFi65kbGuGOH0AlgwI
	ZaLOF6yFWa5dq1uZ6u/SZjAVV8YIUxEQYa+oEoUjRSThM2kGC30e
X-Google-Smtp-Source: AGHT+IGSKlwpc9RSgZd1gLwMZJwlxrL+8JK1LO1Y3wo3SThclhiafbQHvDrAqcRAj0ItBTgz5ukhLQ==
X-Received: by 2002:a05:6a00:8d4:b0:71e:617:63c1 with SMTP id d2e1a72fcca58-72045fe2578mr4463593b3a.27.1729818564114;
        Thu, 24 Oct 2024 18:09:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b93csm52875b3a.137.2024.10.24.18.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:09:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] ARM: dts: imx6sll: Remove regulator-3p0 unit address
Date: Thu, 24 Oct 2024 22:08:53 -0300
Message-Id: <20241025010855.1593365-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_180925_631135_DF7955B5 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

According to imx-thermal.yaml, the anatop regulators should not
contain unit-address/reg entries.

Change it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..0fc22c03ccea 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -507,12 +507,9 @@ anatop: anatop@20c8000 {
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 
-				reg_3p0: regulator-3p0@20c8120 {
+				reg_3p0: regulator-3p0 {
 					compatible = "fsl,anatop-regulator";
-					reg = <0x20c8120>;
 					regulator-name = "vdd3p0";
 					regulator-min-microvolt = <2625000>;
 					regulator-max-microvolt = <3400000>;
-- 
2.34.1


