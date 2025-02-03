Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5371C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U+3jIvZnmKA6FZPn3NDJLwBHo+QpViaEYNsBITnjd8w=; b=ThUFH1R1KjJKsGCMay6ce+t9cI
	IN1AdAXyEEqVpEMPkYJmBwCq8/aBL910CYOi4S/q+7mRDDS7QfnEWViEaXuKqtw4pAtZYMGtlwsiB
	71ahWBvYkLomzktH9kyVrm8MOKHMwM1Supgm32DsaiBQrrAHY32fdoANQqsBEdpO44oIKxm+0K8Ql
	1QTQYzb2p01k2dFdxPB1iu3vnpyDkbf+oplI4kiFFVYFtSiN0J91MDPy3F/xfNkdYqy0OfXw1ahHO
	4M4qS0rMr3LPSCCzDpU1CbrmjnOvSt2dmtUb2cXo2rNg01O2JPBXTQbuADSoz1I4Omd5W73XNm0UD
	IEi0Ws2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0Ic-0000000G9AS-0RiT;
	Mon, 03 Feb 2025 17:31:54 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0HH-0000000G8yB-0GeZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 17:30:32 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21619108a6bso78594605ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 09:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738603829; x=1739208629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+3jIvZnmKA6FZPn3NDJLwBHo+QpViaEYNsBITnjd8w=;
        b=QbJkeJuqz1qBLc3nNSw3/7KDiAs4Xp27o1JTcft3T3ZWrYA/F2+XHWDAhgvqbyi1Vo
         nKLbLAzHzjYwXpcv8hYsA/tAtP6GzSFaX8LqaYx7NXqAReUIpL8aKw7MfJs23FyV1Rts
         SDJd1pApJinjQb2G/Y8uBRXlv/mcmE/XLiyDQrBcrnnp9NvWuObXWF0l1eHMWBj2rk9k
         sAaSTfa1A7+29ZnrMg/nhBOZEtJhUT/OhJSaQ1CHHQEAweFEupdzldRfu+DWf3HYcdI7
         78itbU0Sdwj3aODsTJEfnVJaiLdvwl5cHSBPg3DnwJGCqMCfRyWe8lbJpxqHyhgyY17s
         kr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603829; x=1739208629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+3jIvZnmKA6FZPn3NDJLwBHo+QpViaEYNsBITnjd8w=;
        b=t1iJ0i5/8UHIzswMKE6/n9DYSXj1i2ogCMMGVeR8yLNrzlcMbbbdYCHLRT4hROnshx
         znJLwqKpFRa87HAdv355bYag5mXwidEsFht/xXZCehI3cUvQNZjPyvmSlVEDfDMahDLn
         u4YEkzsioKnUXYEXLNyJQbJesbSLbo8mMiLSnKtUX5QvYS601NTVq0QnN5yvdZFbiOh9
         C91Ln7Su3T6tvU/pm7qO7RnqIykGXL5cqadvOj1CQbbOaAJgBRtrsaZT7VKky/9SsNQK
         8JXzi1dF8rUxgEBBFSTDTk8N80b2csngeM95k8SwyaaycrWmYFd9oqESp4vYuSPY9FE3
         NbJg==
X-Forwarded-Encrypted: i=1; AJvYcCXDNrOyhIP/X0CxIUHdtM34Ayu8ylQ7A+ViNG5T8o4vF/OxhlPleS6U3qAEMi/2qi03/fTIAJ2MyIXZisivQN8o@lists.infradead.org
X-Gm-Message-State: AOJu0YwiUyBdiUJpS3qVMPe6rjNbnHJM7lMXtF8AS/U2GfFjevQ4oi9b
	geR8u8M4EtvczUPevI94qy43l96hEHPqXl12zLJaUuga7yC7dp++deSCpw==
X-Gm-Gg: ASbGnct1WWMA3hOBWatzyoj2u2vutYvKzeSCDmIzKq7iSEi3MDqeGCzMUDUr3fPLoay
	euNuS1bNYpMPmjhL4K4m+j0X5d8niXZde4d1AzK6m7fSO5WpYAnLWlnhR9OYHjWN1w99O0YpR+Q
	30sBcyJZPGOZBvrvlzUfYDYTTCZjRIfHa7fMFoW6N+58e4t6L2Bq8fJXT04F+h2v1TCCk9rym2t
	HJtXPQkrsfkciCyZlHkU9K8xG7z4wamx3zKrApOtAZTa1AVEfql1j5779Q6O4vk0JbJQIyDZ0zq
	BjJm248oB7ywOwvl27LIb9jnwGKs
X-Google-Smtp-Source: AGHT+IE8nNjdmDUBWWzeT2S1Qot1ZFFEd8cLym1Jv/D9+lSJXgZUh9NGk6KW9hQBaAEr8zUWODiSLg==
X-Received: by 2002:a17:902:eb54:b0:215:a2f2:cfbf with SMTP id d9443c01a7336-21dd7c66954mr227001515ad.18.1738603829496;
        Mon, 03 Feb 2025 09:30:29 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:dbf:9aeb:2ad1:3bf9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300880sm79896195ad.168.2025.02.03.09.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:30:28 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx28-sps1: Fix GPIO LEDs description
Date: Mon,  3 Feb 2025 14:30:20 -0300
Message-Id: <20250203173020.39830-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_093031_103991_9FE5F29E 
X-CRM114-Status: GOOD (  11.48  )
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

According to leds-gpio.yaml, the LED nodes should not contain
unit addresses. Remove them.

Also, 'default-trigger' is not a valid property. Change it to
'linux,default-trigger'.

These changes fix the following dt-schema warnings: 

led@1: Unevaluated properties are not allowed ('reg' was unexpected)
led@2: Unevaluated properties are not allowed ('reg' was unexpected)
led@3: Unevaluated properties are not allowed ('default-trigger', 'reg' were unexpected)
leds: '#address-cells', '#size-cells' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts b/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
index 0f01dded4e3d..ca62e7933116 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
@@ -24,30 +24,25 @@ reg_usb0_vbus: regulator-0 {
 	};
 
 	leds {
-		#address-cells = <1>;
-		#size-cells = <0>;
 		compatible = "gpio-leds";
 		status = "okay";
 
-		led@1 {
+		led-1 {
 			label = "sps1-1:yellow:user";
 			gpios = <&gpio0 6 0>;
 			linux,default-trigger = "heartbeat";
-			reg = <0>;
 		};
 
-		led@2 {
+		led-2 {
 			label = "sps1-2:red:user";
 			gpios = <&gpio0 3 0>;
 			linux,default-trigger = "heartbeat";
-			reg = <1>;
 		};
 
-		led@3 {
+		led-3 {
 			label = "sps1-3:red:user";
 			gpios = <&gpio0 0 0>;
-			default-trigger = "heartbeat";
-			reg = <2>;
+			linux,default-trigger = "heartbeat";
 		};
 
 	};
-- 
2.34.1


