Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B0BCF5368
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOY/HkOxNB50xnp7x+ajUwUdjdbWxkY0M0g4fo6JzFc=; b=M6aUsubD7KYvfeVSEarZHcjRQ/
	t11TxgMEuMy+lt8H/WgIYckjFaKqr2287vnl609hFkJo/Kms6N6d3F6wbwoVtePfBtoLhs/l6t8Cq
	oJS8mM5t9MRQoafIODH0W/IiPuT9bwIVFry/ztCJdfZ2C4fNIbt7QnvEUfxdjvC1/K2ZvDdNJa5RD
	wfNrmen+dFU6kGhTORFO1L9ctcLY7CqJXsTW0kYKcjnY4wldxUE0d2wxGp0HUmcOvgAn6fD+j/v83
	9fDqj4OzDlmNMhPGuOY3viyNvgp+b/w2YDmzlmVYaCjsQ4tMA7E/B99gBEH+qAsJn/Rrqgwm72RYo
	YSZOHlHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLP-0000000EIMi-1NFa;
	Wed, 23 Oct 2024 12:20:07 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3a2d-0000000EFSQ-3nC9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 12:00:45 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20ca388d242so48230245ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 05:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729684842; x=1730289642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOY/HkOxNB50xnp7x+ajUwUdjdbWxkY0M0g4fo6JzFc=;
        b=PENSaqIazAL15oeoEAzsFD+TKKjlBkAu2DvvJ8VRuynrqzisTtNg8YqpKAzVeznRku
         bxeB6dbIxOqqAZYm4Qzh05V/hniGlSIHd1ghQk21i7w2Scboc/G8QVSPdxr72/SWZ64C
         I1yLqDifx7fduSvxZP0PphHffnrYTj3RHO1r1e+NTycv6HLjooGiHR0VkLsggm/raFvf
         BOfKsXaIUM1cnuZvObGvV1AmeasJDDJgehaCTdlDgxSpaSXTa2mMzxwZv4HPFd0rWPCr
         RyR5jgqOq0mWw3BqzsRMl3f6bWaR8hgwg9j+L3wQFBwXFPc9dOuZOdgTPIXPUs/2Acnu
         WGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729684842; x=1730289642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOY/HkOxNB50xnp7x+ajUwUdjdbWxkY0M0g4fo6JzFc=;
        b=DMf8YEy9eyobDLlAnX1krbhbJLuQxSJVaIutuXa0BqYEUNu7GZI21gPmF2zy4VFZeC
         Og7E4wSs2qchLBuGqjzZWIS/61i5s5ZBfhMqmRKpJs2wIdBOloI8YIHojKb9j51wphmY
         51YrdeAx4KoYDi3r3xqVEu3u7nvaahmT8b2D5oLJ5MHblbKDRu/tZn35z9r2coJW+hcR
         UlcQrjSk1gus4fXsS2VMss31Km3nuigBqaeL3ynbU2q0zH4OoGB1WS9e0CGbR8w6LMIR
         pBbUDHZKYN+9lMRVCIMscZzfN77xrcPwtMNIsVSFmZBmdCEKHlNXdOE4gpAXZNIpbIch
         KoMA==
X-Forwarded-Encrypted: i=1; AJvYcCXTedex9RejCwoNRVSX7qEXcDWRlvgilE4ah0JVx3nudZz3IVAnOG/2SLkJrpokaG+T/SfW3q3hp8oJpndAKuAa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1I99hAUTwF47siVUHkcnEtUrAjLfJ13XfljQFXyw/UM9NSnhT
	zqG6OjpsYqkxdJZlT/oz7HBrae+iptjw4sVFC4vwbjdzePtY4G0P
X-Google-Smtp-Source: AGHT+IE2z2rgTDRpyrkYQWHG68gvu+DxblmY0KnUfOWDVVdfkdenFstPYhh6CgdIUqvmZsVyx1Do9g==
X-Received: by 2002:a17:902:f550:b0:20c:a122:e6c4 with SMTP id d9443c01a7336-20fa9e09ad8mr30838995ad.14.1729684842256;
        Wed, 23 Oct 2024 05:00:42 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3468:366c:e529:6d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f3665sm56598825ad.271.2024.10.23.05.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:00:41 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	linux-spi@vger.kernel.org,
	shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	lukma@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/3] ARM: dts: vf610-bk4: Use the more specific "lwn,bk4-spi"
Date: Wed, 23 Oct 2024 09:00:15 -0300
Message-Id: <20241023120015.1049008-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023120015.1049008-1-festevam@gmail.com>
References: <20241023120015.1049008-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_050043_971841_D9D4B8FA 
X-CRM114-Status: GOOD (  13.73  )
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

Currently, the compatible string used for the spidev device is "lwn,bk4",
which is the same as the board compatible string documented at fsl.yaml.

This causes several dt-schema warnings:

make dtbs_check DT_SCHEMA_FILES=fsl.yaml
...

['lwn,bk4'] is too short
'lwn,bk4' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
'lwn,bk4' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
'lwn,bk4' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
...

Use a more specific "lwn,bk4-spi" compatible string to fix the problem.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/vf/vf610-bk4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts b/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts
index 722182f5fd17..2492fb99956c 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts
@@ -119,7 +119,7 @@ &dspi0 {
 	status = "okay";
 
 	spidev0@0 {
-		compatible = "lwn,bk4";
+		compatible = "lwn,bk4-spi";
 		spi-max-frequency = <30000000>;
 		reg = <0>;
 		fsl,spi-cs-sck-delay = <200>;
@@ -136,7 +136,7 @@ &dspi3 {
 	#address-cells = <0>;
 
 	slave {
-		compatible = "lwn,bk4";
+		compatible = "lwn,bk4-spi";
 		spi-max-frequency = <30000000>;
 	};
 };
-- 
2.34.1


