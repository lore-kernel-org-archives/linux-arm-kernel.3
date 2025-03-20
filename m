Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D172EC36006
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2C2x2YqAzE+wgdoLnExW9swbh2264Dz3KcOzm8hz2vw=; b=ay7/EY98D7rDdAzAraY6jTSSaz
	UWgZP3okibZTtYKZzBdX9LFr8fVcLz3zSA5yEtrM0//wrmBsQ8o5XdCb1xlvy/yRYSrlEVxuW9mlO
	VO4f/mQgFupMdX+ksnkXnweIyus88ZgpnwLGXyEY/vQqyQb+eABA7ZIoZMtYXwYjm6LnxRMR7gbA2
	vaikjHLAP/CrWn97v6ZJJm87wnEcB5vr+ZqlFC3lN2+ezskONaxksaxF4VA5qg1uHlAC43KQRkulb
	PgN9Ny9vER30TMZBpaZVEh+fFwIn9GB9ZXsgYxnNVu/TLsjkFj8UhWOFf55WHNGzZB3eRM+FIkgMy
	Ceho1PUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIM9-0000000CbtF-2rA4;
	Thu, 20 Mar 2025 16:02:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHlK-0000000CX4x-2n2F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:24:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2260c915749so12861225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742484290; x=1743089090; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2C2x2YqAzE+wgdoLnExW9swbh2264Dz3KcOzm8hz2vw=;
        b=G4BGCBIQfThkzAe2MjIKaUumQxxwGl3sFC2/3Y9qSBwvPsBiaxcA3JzTgXGdPkg8Of
         kx1MxU/iy3BKnt4ZjTC7cfrB2nulpi62Vf/rDGJFJWrohl5Id69mWtUWn0y8hFx5ka2f
         39RLv73TyDgP4Di9XXpyfMzZIo2MA32feHMomy2fvIrvrxGdR1xGv6/5V/rJVO0HR71a
         TyaqCciGEc+OX8coS6mSbyQ9QFfpoc/yMbV27ux5oRr2i27lFwMrbRBMiaW9hx2DIhjI
         rEqcdObHOBp1acgpyTu4f4MzwXICL1SqBHFRHtqrCWxDcilhVr6KbVXV7oBLBg0ZwpS7
         MrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484290; x=1743089090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2C2x2YqAzE+wgdoLnExW9swbh2264Dz3KcOzm8hz2vw=;
        b=K5vryBeV5clu1zXwYoVkbBLvISA1wMmFAU205csctRrE8vkse3C6gOJvKyOCJbW8oC
         XGo9dLa2XJ4TQaa7Bxmix36qrqGKAZEI9UAbKenUx+j+WDk7RsawwhgoZa12ydhndyus
         iSnArZcpMmsGz+amO7lISNT2y0JaDCup1NDEhKnVCkd1ylPAsZa+YTbOEAg1S62gytxs
         N5nNO2YrAh1sIeB44B7UlYMCLG5NDgFTrDAdcY+VtOhTt779KVqKUyoeG5C05+ArWBBi
         XL6rSR1qUJqlslWHeZnPqQwzFQ9gIQOoiJ2X8/Q5uWhYnfHR/78u88UJFNcgtABv+lYW
         P0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVrQdIOV32FCe5TtHIIqtKWsTgvlvPT54fFtJTAKl8G5Akr/Icgf/u5LGKmWeG3GDdCGKaDgJnMwKVSftHhdjuw@lists.infradead.org
X-Gm-Message-State: AOJu0YxV8Q7Nx+M7dcTkIG0ZqyYXCCxGKy7tXaqjyRhlFEDCLzwV26h1
	TbsvhGZQCmsaV6u+meM8T3Ewkj9dtCarP/Hx6u3Rum8jkY1BhmNQ
X-Gm-Gg: ASbGncvNhz2Y9cOqfGosqwBtxUqRcL0jYDmqWqvselT3EHRC5zsYyMDinOwccXK1n3z
	NbSAqfwr2o87q6ByxBojgQAFGI4ymFe+OKT5Usl6KpgCr6r/tc7OQ/EHh8mqsEhYLIMxYVivAme
	okKNsVY/4lAhh9PXOtT+eHTeQ6j7Azwf8mCCIDADpLaj84fOuLLzGb8GIhH+/RMsX11Ue9VSVs3
	ik4wWpwGUn23vWJhlhKIYw9Obgi+Vq63U6tIt8uPLX0MLMJhtgzkFvxsFY/tUJy1qVpxxTvL3qg
	7lC81LH8OdDFCxUFvDi517TOgEomewkrXsCaONNPgbWAWDVXfJkta2asHAsgiPXokdnBuS+P1Sc
	iLYWs78rXVPMxZHEf5m+r/w==
X-Google-Smtp-Source: AGHT+IElDPX6u20sc4jGPjSUZZw3qo1ZEYivqxwtIPDdkwEzTDmmDNvT5Nl4muFEx+julDo++r1G7g==
X-Received: by 2002:a17:902:ce07:b0:223:5e54:c521 with SMTP id d9443c01a7336-2265ea35407mr58249745ad.0.1742484289793;
        Thu, 20 Mar 2025 08:24:49 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a8fsm136905515ad.234.2025.03.20.08.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:24:49 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 23:21:58 +0800
Subject: [PATCH v5 08/10] ARM: dts: aspeed: catalina: Enable multi-master
 on additional I2C buses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v5-8-e161be6583a7@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742484265; l=1008;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=EUweIVFlYiMF8bhCySW4H9ia8wPetO4bJ+6FKYLTF4U=;
 b=kSwteKt/arVVylSZep8fMc7WzfoOs3oC1D9o+m9HYvsgOQiQth90tnxsRf2VTGYVDfLpsy4mP
 dIl4AtyZ4hDAbZWkIA0376ck9AuceRHGOiZ5GZ3b6BUT8stH+r6v5DK
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082450_705682_82E0F54B 
X-CRM114-Status: GOOD (  10.79  )
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

Update the device tree to enable `multi-master` mode on I2C buses shared
between the host BMC and the NV module with HMC. This ensures proper bus
arbitration and coordination in multi-master environments, preventing
communication conflicts and improving reliability.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 1e1bcc9ac2f0..abf15d322605 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -815,6 +815,7 @@ ssif-bmc@10 {
 
 &i2c12 {
 	status = "okay";
+	multi-master;
 
 	// Module 1 FRU EEPROM
 	eeprom@50 {
@@ -825,6 +826,7 @@ eeprom@50 {
 
 &i2c13 {
 	status = "okay";
+	multi-master;
 
 	// Module 0 FRU EEPROM
 	eeprom@50 {

-- 
2.31.1


