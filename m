Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0938C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbhBstTf/rpGE79fQcNaD6V+9Y2DvcY3tvSTTq6IewU=; b=zO4/mm77obQmN+LvX8tRv/HWMj
	uVkhd+9b2+cscbC6DTbg9HJm9UQFEEdIiY7LLVs/4ZAvABjx4AcHl2UodvhkcEk8ih6kNPIZDNDWB
	4F+C+xY46XWhOT6kQj8Mq4cxwElbo9t67Um0GvzjBmHJ4NEPIOcJABb3Z/6wXD8iM6QrWK2e+Bg5H
	YvmVqk5fVf37cseq3xttxXF8y1VyIJpelb9B0Tk7howOTqBPcZyIZa+6hET2hgZRxUzQR1ibB/Exh
	gmjlp3BRy9B6JlFbnPvXkU/TDhn/3vHtjmcAy3+RvT1ZbubXCDeEJNUr90/ZihjLozI7Nun510UPx
	6frzfnYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvX64-0000000E9Hh-1TQk;
	Fri, 21 Mar 2025 07:47:16 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWoH-0000000E67U-1G2j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:28:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2254e0b4b79so3792095ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542132; x=1743146932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbhBstTf/rpGE79fQcNaD6V+9Y2DvcY3tvSTTq6IewU=;
        b=CFykKr4l0/NU1paHlKVzv77EWrJG9NSTXMvg2lFGm2WpdVGwGutwdXdmh6wvNu7xB6
         gTjYl7ffZ2tzkCJiwL41UEquR/5jpjN6fel7AFgpr4dXkS/23MPmaGuEie0K7Ti7vVYy
         ZDzpobLCXm8ouajAqeByrCAD85vobyjEUrYwS+z3YH8/jLUOTSxJUQ0HTMAcMlzkq9HG
         T5LthMmvoEtF6EtQFGye0gi/F3qsW/NOfgHvxV4iMpz41bmUI7Z9iCxQ0UQXPciCN8qy
         CGz9/WDL1wxFdjQUWd/PoDNAsy2FHd0HTBApl8xTBmQhUvD8fD3Oa0PuTn7vgl8LJ/Ss
         J1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542132; x=1743146932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbhBstTf/rpGE79fQcNaD6V+9Y2DvcY3tvSTTq6IewU=;
        b=kBMKoVoq1QsXoCvTwvWdMJfZFyLusbs/aiCTjMJNRXj+6LMszne8jIsjF4d3u3j5zw
         z/MrRiXKy91CvlNmJmsMm8U++QKTnQSRE7rk3JP/EcAKPypl6OI5YgAxPsV9NgFNS0SR
         uXjVn3zYJJM1V/sS4HzjsgLXQVmccpTGk3m7sHBPeC/IdLDU0fqJSsd/I5AM/A3ujyGD
         wljMdesxtGj9taFKUr1qawpKf8cJLiCX3yZ8uO5KjKTnXxr6boYmAOX5n32eORF2+CL5
         h3D6FmVhJUUm5foSbHXouMlRFgDC5q4Wm2ssNrsiv60KfKFp1KfjOb23lwKwe+ZMpyYV
         /KDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFVq7jstSLBQ0+l4ywtjbNqpfyD+VjDB7to1BH/Z2C5XJbXem7K9OMEgG/PrWp+T2SCK8tQUplHO6+QVre/Que@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl9S3JhIt4X/9ZpV7cvuP1vHiVvgdHAHmUuGddc72ujfixqhQJ
	xQCgVlJDwETqAitQ0G6qEU559WgtMXmZBVZZ5N4ZSeQQTDN21tibsnhxug==
X-Gm-Gg: ASbGnctjskmfv3RKVsG0FGSPKoh7Zw1CxNb8yPfGeIBS3u+e2lwCLoLnMiBF9TO3L+Y
	45FRMkVit2dELJoi/NbyOKunkfVlUsp4ABtK26CZs/3f8800wKCXnm5Mic+IdkoGXW8ooEN4+jt
	oEcwy5tIVVw7/BVsr6qukyXKu8bvx+g55heMhFcs72HdgfjqePvjmXz55nNwO+qD+ePSWoRmeYv
	rofl1yOVN+uEJh+pi2fvKe8Cjbw9SulCSK8ort4tBbOlGZsi9ytn1xHSyIqNLJXyN62gkH0Q9Vb
	L+trm3Oq9VD5/kFoZ7/RwLbDjSACC5KbQ3BG2RI4iBjVjK2733uqSwu5zqafaUWh/BrvI5Tg1Ka
	DBpSfBxsH0pwWvzZzmnw0LA==
X-Google-Smtp-Source: AGHT+IEfn10cVp0MmL9KAA7HT1bbZ8SZCvI7q9K72uD16FVBGG7ET0Q39wXEka05fFezPLWLFC4AYA==
X-Received: by 2002:a17:902:cec8:b0:223:668d:eba9 with SMTP id d9443c01a7336-22780c5587bmr48813795ad.10.1742542132085;
        Fri, 21 Mar 2025 00:28:52 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm9862265ad.27.2025.03.21.00.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:28:51 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Mar 2025 15:26:11 +0800
Subject: [PATCH v6 10/10] ARM: dts: aspeed: catalina: Enable MCTP support
 for NIC management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-potin-catalina-dts-update-20250102-v6-10-4bd85efeb9b4@gmail.com>
References: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
In-Reply-To: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742542103; l=1803;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=bwpQIFwpZpzyzjai+JYBYfCrfZUWdhbKBq8cHgvMUjA=;
 b=oDGqxJIBbfZ7/afAwIsvVjkBfZM66AC4NAU3Nl/DKHdHlrLPNSwK60RC1citbXPc1kcm284Lf
 OCMuUPbPXxPBrXRXK9WJqB0/QIZT3wAgnO+MLqFtqts/SAYDRTGtqX1
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_002853_344987_6D2046BF 
X-CRM114-Status: GOOD (  10.89  )
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

Add the `mctp-controller` property and MCTP nodes to enable support for
backend NIC management via PLDM over MCTP.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index a6a2dd725266..5fb67ad2d777 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -186,18 +186,23 @@ flash@1 {
 
 &i2c0 {
 	status = "okay";
+	multi-master;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c0mux0ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 
 			// IOB0 NIC0 TEMP
 			temperature-sensor@1f {
@@ -214,6 +219,7 @@ i2c0mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 
 			// IOB0 NIC1 TEMP
 			temperature-sensor@1f {
@@ -305,12 +311,12 @@ i2c-mux@75 {
 		reg = <0x75>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c0mux3ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 
 			// IOB1 NIC0 TEMP
 			temperature-sensor@1f {
@@ -327,6 +333,7 @@ i2c0mux3ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 
 			// IOB1 NIC1 TEMP
 			temperature-sensor@1f {

-- 
2.31.1


