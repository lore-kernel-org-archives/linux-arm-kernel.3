Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7D2C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLcbKMhYk8uxEh3mrmQXm9xuYwIoSY7sWCRiQyf3y4g=; b=2qUYlLRSK43GEjeWcbOYay6uOp
	AjpGLXGZ9yugJxIGUJeTTz4qKxzBINTwgwNId7iEzjOTtFuz5A0Z2W9tbodhBLwQYfAgHhw1eu+mX
	rSI047km/wvrUlzfkI1zaPuiN5d6PfjdH3GEQBkAARkTYJKSLqJTNawf4lMISTBXfBWQuYN2/OKBW
	4/u9WF+DBNsgTWSOv1mYiEwweav3fp+9f9iC25V83TRegVcVUyeK0cdMUM5ddZ3c2xZI1pBUcEygw
	UsobeOwqVyjyUTclYTXNJhF94ODZnIyIOfpaLg/UcOTd7eSMks5YGZOpJN3tkjX+fkGjbNIRPS/X3
	H2IE3NkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvX16-0000000E8EW-402X;
	Fri, 21 Mar 2025 07:42:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWoE-0000000E66s-47Vm
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Mar 2025 07:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZLcbKMhYk8uxEh3mrmQXm9xuYwIoSY7sWCRiQyf3y4g=; b=i1vNhM51wXbECBZEqs53EaeVVt
	BkI68wcIVMp4XK8OuiUpdrCxWryzifkBXT0JOhKwnRTp0RDjop0aVouAxij86HKfVzc+KdmMW7YO3
	bYdnu6FQmKxofrKt2svPkJzIVsUtFDqaYfSet2L5NwHNBoMU9yUPDaVA+COr7wVic8zwNO5OjPjmk
	At87eVS7VHfbCNBld0QPXvs+EN9y1cIcad2s6z42JzNdVpOFta4LK/KeWMHc4i2nBCIzoGXRdhylq
	n4cuuDCs94EPAmOoDn3zep9R3teZIui+FADj0Suzx8DbvqMrlRprrlzgz3sKTGD8CAtoTEivhoz/W
	KBfEheSg==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWoC-00000004Jsi-047a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:28:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2264aefc45dso3695895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542125; x=1743146925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLcbKMhYk8uxEh3mrmQXm9xuYwIoSY7sWCRiQyf3y4g=;
        b=hAUKYyLWHgDCCZpAUZdKOoWXUKnvjoqqDTGYmAgUNUZMfzJjjvleD8nnlqgci+tWzB
         U8Qcaux3jLicYU5fRR/EdLDUWSooV0ZNl/3Am5ypZfuMQoqkChepLqr0+LepkefxnmJg
         3C0f9rcferJO6coxUjudDqflwBRqNUiUy/5eyvrv57OVTg+H1JGwvkcAb0J4bRVwzTxI
         QQHLbQGgHt7w/CYMldsVV/v0smeJoictsjDnQSB9o1jtlqs5liv/w+JrISxIbSFsmYWd
         500/9atvB9xJfhjy1ZQbcQo9cDPVkHduhPoJGMpAxroiglEkaYZK9RoBuY8nm1IHX/VC
         IECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542125; x=1743146925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLcbKMhYk8uxEh3mrmQXm9xuYwIoSY7sWCRiQyf3y4g=;
        b=Fhh+2/7ZGZ3CFxFoasLRuiha5iBSmm52sEdkshn8bhBlR+xnxNgeZbXTPYmtNvnBSI
         rDApwoB3cA7m6omL5+NGiXU3TE4CvL4Vg+VWsVNDiaAwvRCEnqqke8/goFIZP+rXdMAI
         L/AOpsFGryOEGtHoJesVR3tftHMsqFOcEWyH292g6TygaKjOJX8NKVeIkRp3jXmqdVb8
         oz8h6H/MNWqUWxZrVRY+l0nTR44K2iaBnqUbb6WTeJ3HL9PcHH6to5bWEFhZGGX8KMq5
         a51xgtL2EMhGXUDpRML2S2sBPvaflBO7TWSCrwSsreXcHEHmW8lg1saDRIlAfVdkktU2
         vbTw==
X-Forwarded-Encrypted: i=1; AJvYcCXrrCwPEhRSdUu8BsVwp9sZUdBO3wn2Oxh9jdXcpOOVQ28lZ1l7Utg4wE2WAjrFwTWyD17N/NvqXcFUvTc3StQA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr4c76ceHWDeVPdDHhGDxzBdMupTlqLiIVOR09AFDaWj+wkx18
	peW1PPaMOGFmtEirT1bQCdrfZmZzm0M0NBOrRBimwLdHBYV6TUNCNuVifA==
X-Gm-Gg: ASbGncsjCsXgb9woffKiiHK7rv40VInwLCLO8beDnXc7R04FbQqsN8TgZW3JOeJMS4+
	oAua/MVNl9pEue6xkKLA9OqmckDaa7D1bLM2CfZlInqLsteSRU01VE66NMUuEo23wD/KEFhOXAO
	6O6WaaVXRcXGuLJ50YnsYBosYGIR1KPz6gJ4d/K77Mlr0o/2r+vFah5WSwimR8evjJOP7Tq5c/3
	6B4PbtzahidNDsFvf+4JM4AXDHYx41sf/84Z5QK1Zytl6+v1HOR3NgKHEeTL99ivFI3/kvwMrpY
	rF5P5Bga/zdV05K9XoNY7UA6H5G+FgyfitAB5Av8B6Nvh8nwpm4b7e9dYiEhxX4CkAyXM09tqgU
	+6A9hLWzEUIP4+32/8wulOA==
X-Google-Smtp-Source: AGHT+IF4SxgsnT3zZvci0/PSg+6Xigby8O/vjqm4K8plyaDY1Gq1sOSCHgwXKkuKrYcIMeMR2ARBvQ==
X-Received: by 2002:a17:902:ce08:b0:220:e5be:29c8 with SMTP id d9443c01a7336-22780e08cebmr41057985ad.32.1742542124465;
        Fri, 21 Mar 2025 00:28:44 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm9862265ad.27.2025.03.21.00.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:28:44 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Mar 2025 15:26:08 +0800
Subject: [PATCH v6 07/10] ARM: dts: aspeed: catalina: Remove INA238 and
 INA230 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-potin-catalina-dts-update-20250102-v6-7-4bd85efeb9b4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742542103; l=2083;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=sycCkrcM+LJ9UbAjzsXD//ULjcrkdN+dexyZS9F+cjc=;
 b=y0hZDVQSCXSdKICSxhMEFFSAzXsUl1jHR1wnRdOkOfCt4z606ExaBcSEhg3Tzf+RlwFrf4eTv
 +ipSBlhcpZkCH4nIMLqR08XgykEPCqDxbSAwtV/ri+dxAQqz/obeh+/
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_072848_215414_6159576C 
X-CRM114-Status: UNSURE (   9.97  )
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

Remove INA238 and INA230 power sensor nodes from the device tree (DTS) due
to incompatibility with the second-source ISL28022, which shares the same
I2C address.

Move the driver probe to userspace to handle sensor dynamically.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 45 ----------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 306931c08cb0..6702be32918e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -432,35 +432,11 @@ power-sensor@22 {
 				compatible = "mps,mp5990";
 				reg = <0x22>;
 			};
-			power-sensor@41 {
-				compatible = "ti,ina238";
-				reg = <0x41>;
-				shunt-resistor = <500>;
-			};
-			power-sensor@42 {
-				compatible = "ti,ina238";
-				reg = <0x42>;
-				shunt-resistor = <500>;
-			};
-			power-sensor@44 {
-				compatible = "ti,ina238";
-				reg = <0x44>;
-				shunt-resistor = <500>;
-			};
 		};
 		i2c1mux0ch1: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x1>;
-
-			power-sensor@41 {
-				compatible = "ti,ina238";
-				reg = <0x41>;
-			};
-			power-sensor@43 {
-				compatible = "ti,ina238";
-				reg = <0x43>;
-			};
 		};
 		i2c1mux0ch2: i2c@2 {
 			#address-cells = <1>;
@@ -753,27 +729,6 @@ i2c5mux0ch7: i2c@7 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <7>;
-
-			power-sensor@40 {
-				compatible = "ti,ina230";
-				reg = <0x40>;
-				shunt-resistor = <2000>;
-			};
-			power-sensor@41 {
-				compatible = "ti,ina230";
-				reg = <0x41>;
-				shunt-resistor = <2000>;
-			};
-			power-sensor@44 {
-				compatible = "ti,ina230";
-				reg = <0x44>;
-				shunt-resistor = <2000>;
-			};
-			power-sensor@45 {
-				compatible = "ti,ina230";
-				reg = <0x45>;
-				shunt-resistor = <2000>;
-			};
 		};
 	};
 };

-- 
2.31.1


