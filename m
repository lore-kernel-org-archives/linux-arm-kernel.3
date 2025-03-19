Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5680EC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 17:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ngZTefyBGyxy77j50qn1xy3c/VWYHIJSa1eOUcrG18=; b=RtebLx8rVXZcfFqqSX6KzE884+
	lMq/Dbo6EY4quMS7SlwGlWy+sMz8yxO3PNcsEAcHFneJLomc4QJ8JtruQwTAtDMrKNvWbvZrMb08i
	Wek45UunGi4hIk6YXfz5fa9pYoYzHfJC7Zk/OrQemLP824gpzQf7/WXSLyG29UwlOwrlAKnspAX0x
	JfEIIXfzPCyvLDbDkUs7iY/mOM+Hf89qx/3jb6TuxHq9aiu9FkjC5pzDRfYbKRomKsP780bO1CE6t
	TvlCcvsXrVIfeGJltCXA5DxMF+c/FySipH0txqfcBsGoGdsgm3I6gaZek8wj+NWRGk21JmkkfvrkP
	HYTVzgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwpV-00000009d4T-3Y4d;
	Wed, 19 Mar 2025 17:03:45 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwcM-00000009av1-0ul9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 16:50:11 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ff65d88103so9908854a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742403010; x=1743007810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ngZTefyBGyxy77j50qn1xy3c/VWYHIJSa1eOUcrG18=;
        b=MLzS9Kf9DRwT3fnXuvJmj6KMYHlmgvPmqrJUPTkA+ggQk0pkADs5C7TTvA49AGI3Au
         44l+lL5kBNFTNtLXgsWVqYNK9Ki73TTR9EygNgONlAeNkLiIqtAVAx1CbfH/RCyfNfU+
         YnoxLAxE+TWsFbjurRXC67VXt75AashI0e3IaZQX8pzIUJMhz1GXkFAEF8LtR6UZQZZd
         l/9bTgkgfrYLu2uLsSlN0XZ1TWf/edgbwo3pSSiUAB43D/ltX7r0Bp0ONQtPSHxJPUfm
         kYB0uVNpfRAiK3vVi8GvywqCsHi/dp6MJ8QDxMHAMq6OoekachESgL42/3/QwAQLOzFA
         826g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742403010; x=1743007810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ngZTefyBGyxy77j50qn1xy3c/VWYHIJSa1eOUcrG18=;
        b=PT/chTX4weCOUPEV7C9zGkqI7kX+qk004D3dTUxY5VLAXs/qEspyTRngbq86JHhihB
         hrs04LTLeCBaT2wmsU1Zx3033zv2RL7/jyj0eJt2dqCNm0Iwn6cAOmUK9bxUeenO6JDL
         kS1sCsUsiPieknv5Rrkc285MRWmis6huFjhRcDWrbpGuSK+rTuEOVCws9otYycTpRSAg
         oH5RXfw7HFJsjIWpcVjPfaIoe2CNvka3fbzw47ipZuwDVHF+BpF3FqMalYg5VM11InoS
         wJ5klN+adoW5FNpDXxv64c2Kz5Zrg2aKWVYL1zhxNVR9HUwmtKDa3EBv2BcEVJUGSzSE
         ZS5g==
X-Forwarded-Encrypted: i=1; AJvYcCUaYIyPRx16mt+lWmims7tcZ9uoGF0ZrIgk6Jg76ODdaYfnbvhpBrEVyD81EvhKOAB7NtzofLg1VsxOciYCdYB6@lists.infradead.org
X-Gm-Message-State: AOJu0YyduawzKlEKQkmVFl8jXFTMhrOlLP1OTLazEhH7NyDajeP7j5Ta
	MDZZB1psSOrCUz9Wh1kflXGMPG4n/k8BQishe7PXCMjas827sWzV
X-Gm-Gg: ASbGnctU9gfTfh6UDACaiMiHvUTItF+8xvDU1IyUe5dXdLrRs0JYx7O3yr2oAfTd5Pm
	RDh7vFgvohF0XsDmQHK+ind/Q1+DQe/koo+2qNH75jHeIv7Njav/1MMHhSZqtAagTY+FPVT/+7o
	lLZ0xqTdP61VPkOBbqMe2YMWcns5l3/qyvCTjn7Ilm2p7wYkhvBsV4tjRlqUGzlpFB0t7XdR0Et
	vurdcGZdwdodHQnqqE+fsd011gDWV5a/VaENuouqOGcjcPdOkHuavLTaMhpo1CIPpl6QO8L9jtZ
	U5s3jjdmSBQwWyUDZNGyWWaOtcjJZsl59RJrGsbGasVwJCcNTdHWBQ87UnJcQsoDyDua6dAXQ6y
	ji+h2YjyjkePdZRK6F1shlA==
X-Google-Smtp-Source: AGHT+IFGwL1CO1u75jugTjFaP80dxgbnUNCsFmdXJEhQH78p4+pXb4ZaZeDBowc1bD7HnapyTqrUtg==
X-Received: by 2002:a17:90b:1f8d:b0:2fe:e0a9:49d4 with SMTP id 98e67ed59e1d1-301bde5c92fmr5660572a91.2.1742403009662;
        Wed, 19 Mar 2025 09:50:09 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576bc2sm1863641a91.5.2025.03.19.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:50:09 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 00:47:28 +0800
Subject: [PATCH v4 7/8] ARM: dts: aspeed: catalina: Remove INA238 and
 INA230 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v4-7-7c34b8139014@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742402988; l=2136;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=VwzUdaWLbo+jZAMlNm4WzSN7aYJ6nvuUMBx/RwUbPbs=;
 b=1PduDxVu6+2Hiajen7lyNzA2t/FUX66kkW39JkHz63PwJ6LEGPels3iXGsQqpTf6xSzmpoQo5
 dl6tas3CgarAn6iRvsJtEz9rFVlpmEKtZZjQMzQLy4qMpn7KMHhZtKO
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_095010_259406_9F5B5FA1 
X-CRM114-Status: GOOD (  10.67  )
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
index fb4b236d36c0..573701bb7fee 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -304,27 +304,6 @@ i2c30mux0ch7: i2c@7 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <7>;
-
-					power-sensor@40 {
-						compatible = "ti,ina230";
-						reg = <0x40>;
-						shunt-resistor = <2000>;
-					};
-					power-sensor@41 {
-						compatible = "ti,ina230";
-						reg = <0x41>;
-						shunt-resistor = <2000>;
-					};
-					power-sensor@44 {
-						compatible = "ti,ina230";
-						reg = <0x44>;
-						shunt-resistor = <2000>;
-					};
-					power-sensor@45 {
-						compatible = "ti,ina230";
-						reg = <0x45>;
-						shunt-resistor = <2000>;
-					};
 				};
 			};
 		};
@@ -492,35 +471,11 @@ power-sensor@22 {
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

-- 
2.31.1


