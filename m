Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0EDD75BB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 04:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UevInCocN2jLKEDjfdowPnnjzWJX7MTz3LcpvW+drFw=; b=uS9P8w7lXRCm0N7yyhW2kljiVY
	OOOHy4PvKPW4NsymgjOuNxnhaBzZvoaF+vTurgnt3P/cqb/BZIs9tROcl+xSPi610d0S5bhgqDrs3
	wp7wlaXOlAf8pmQt1Pr12iOqxJ+4dW9RgF5wLzy2w8QQlNyh5jOksS48f6+UpgatONniRPXdsMush
	ZiNQ6d1TNi+LMZ0TQeutk2FdzaNLElk2I4yW4uUvVaciqTSENxSzUUGec5sz3NSnLG8Z559KrFsus
	WYzX2lp9v7kewEl5Us9syvbUgy01MJ1AL3FFiDG0g/uMMAzt86Ve2j67ksE+jP1VwUxkvnN3C2fNH
	iUi5rUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyyv-0000000GoZd-3kR4;
	Thu, 21 Nov 2024 04:39:53 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyve-0000000Go7b-10wR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 04:36:31 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7181a8af549so220985a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 20:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732163789; x=1732768589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UevInCocN2jLKEDjfdowPnnjzWJX7MTz3LcpvW+drFw=;
        b=mefvFw1MFS3ZE3BlFk8p7wHx6GE/MSatRTy3A1jiPPDofb2enw6LVPCSGNXiQ4nyC+
         S+UwkJ6TB9utGP+wgMTIM9zSy7VDNeZvvg+p9x3FAM7tt0jNzQmpKZa5O83DFZjw6TeY
         d00wGwEdJXfJQ5H/t/QanedAI9HfvsG8NzzM9HfDyB6uP4l5WBRFmCVAgWLimQ74m/Fv
         K+h22eDbG4t1sarsiVSB3aW8/kZBDqmMv1hr6WdZ4UaUb2UcJfILNqOm5TCV5GE7AWX3
         pff8S7NxGe32OOn7BeLx3FVkA/USxK5IGO5s+4Ga4gVU+uiHbttsugsGpNSMiEkS8oPE
         7sPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732163789; x=1732768589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UevInCocN2jLKEDjfdowPnnjzWJX7MTz3LcpvW+drFw=;
        b=VYz0OXr1y+AD5dpTiqoBVQvWivTQHVzA6pWvT1PnStdPBYpV0GuzRuk5C7AVEvM0T7
         MCXdlq84bUGsSf7cqTJsNGP4L6dcwdLtEKZLnxhxd6sXPMnYMAEteCZYlixYyq+X5RVT
         reI9dGFnBqOoFvLIobWoVSBfRePgyJOJPBwrO6L9eVbWbwPOvPG2qq9V3fcFvX1wwZ8w
         gQnnaXjncb8tsonUfP1hDwukUFl4xiV8rnnJqffpMSisiSCq8KoGVDmoh2VDLyhwbJy9
         1zAwjC093UD+LxUl6K8uBsoA+2kqfIVH7vta3tzGpCo0U5AbIthBBQGDExD/gw+jAQII
         tEfA==
X-Forwarded-Encrypted: i=1; AJvYcCVbEUEGfTkJnKhw08zKsDChLq3ICKlYsQLB5FUMQdjkuqZp5voDcnsRkbdwSIIWwol23KVoHl2ApFbtBuAHai87@lists.infradead.org
X-Gm-Message-State: AOJu0YzZlBeyDJdCj/zGRPGZJOTHB/Xylgc8Y0Kver/DY28DFDQA6SES
	UutmpwhP4u+6uWRzd1kVfsiP9W+H9Wqy7RsDv0+jEs/X8wOdD8Fm
X-Gm-Gg: ASbGnct4ksAWx3fSaJwEXXCLrG0G8Np7QWd1SzDW2QWUl0j2mziSPG/ejs5OTfmbWWr
	eRo50DxC/AYf1Dvw9uJBF0vSaDfPQ5FGj/QavVCD2avWCtYaxgXI83/b0xoDfd8Q8/IJCeCu+Ri
	eADsYpUQZ0Mv1zrWF9swt4pi7GByzT7XCtnALNV+4OwboDrF6Le8b7DLdmBJeXsBZrTnotkW1FD
	I6duJty8CMD19A8kstGwOcus9OA5nfGIeS5mUKcfsIwEQi73gQGGI0RAslJV3+Z2nsow6WYooOv
	jUr73DkxBeINRPyDlVtRf9yzxtQ=
X-Google-Smtp-Source: AGHT+IFYTyomNdCSLziTz63F7jtI4CB0+d1D5UH4XVfUDTPgCy5dwnmNsWJzd0JPw6TAiKDObmCxpw==
X-Received: by 2002:a05:6830:1d9b:b0:718:9cc8:21db with SMTP id 46e09a7af769-71ab30c4f0amr5652274a34.2.1732163789165;
        Wed, 20 Nov 2024 20:36:29 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64e11fcsm402013a12.15.2024.11.20.20.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:36:28 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 21 Nov 2024 12:34:05 +0800
Subject: [PATCH 2/2] ARM: dts: aspeed: catalina: remove interrupt of GPIOB4
 form all IOEXP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-catalina-dts-20241120-v1-2-e4212502624b@gmail.com>
References: <20241121-catalina-dts-20241120-v1-0-e4212502624b@gmail.com>
In-Reply-To: <20241121-catalina-dts-20241120-v1-0-e4212502624b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732163781; l=1368;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=I2TP3r7v3bLpFaASEk3sitwyGaaE/KErFzQTxqzcCSo=;
 b=1yz+R+1F2tRf1pVQwB6b7UeGDBov/eQD2XeNyCVW4Aclu7N2Co//7rjd8jIyruIhsTFPDzw8z
 z76ouhV+ffXA2njqam7obRW7ftWNKN7mOYdL3UeH1CCZx0L1vuDxXCO
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_203630_281846_20368410 
X-CRM114-Status: UNSURE (   9.61  )
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

We notice this interrupt pin always keep low, it cause BMC stuck at boot
up until kernel disabling IRQ of this GPIO pin.

Remove the interrupt of GPIOB4 pin from all IOEXP for now to avoid BMC
get stuck.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 417c0d12635c..3822bb3c9243 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -593,8 +593,6 @@ io_expander0: gpio@20 {
 		reg = <0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 4) IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	// Module 1 IOEXP
@@ -603,8 +601,6 @@ io_expander1: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 4) IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	// HMC IOEXP
@@ -613,8 +609,6 @@ io_expander2: gpio@27 {
 		reg = <0x27>;
 		gpio-controller;
 		#gpio-cells = <2>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 4) IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	// Module 0 EEPROM

-- 
2.31.1


