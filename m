Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198FDC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMF3mmtUwmD4khm3oKxn+aJ/nnA528F+Soa/iVE6C0c=; b=hxSBE0rkjWJN/eiCIDf83B1myr
	6thX3xDyXO8ZNUMWXIP6xpyiiibxUpdnIM/u85iSWo4MEcbP/45HfU60Pga1LTDEuEFwtHpc5gw4g
	x2tNrXtAghEqMKbKLdABoDJ3yTh3feLb8JT+XI0GN5as54FfttiJBtcobVFIPaCTA17a76SJ4xSHy
	nYxZZN+agQxMXGcoducEhH2gOrKh14LHkWA5lDKTfvuhCxToKqJh7JuV0jva1RFzzWoa545NSLCcV
	6jL8yelhEIgmH8RofJ13T6rDjXzGn/r9zK3M1U96xoSNspt7GQiucP/c43cEjwkR75FmvUYAMwN9G
	mOEGgbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwir-00000009c7X-02Fn;
	Wed, 19 Mar 2025 16:56:53 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwcB-00000009arP-2XjG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 16:50:00 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so7496919a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 09:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742402999; x=1743007799; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMF3mmtUwmD4khm3oKxn+aJ/nnA528F+Soa/iVE6C0c=;
        b=jrfCTSDzJ0/211yocno2zbeUsRfz7GKBQXPjMVsNBwZivI1G6N0FwyzmLJKfPbzJl7
         Z4HjU9gXDuXBdh58j2dlR5fbeYkCAHyCX9r+rT4GgDNdCQISVLjcXn/G5QuFuF8GBgDH
         vQpiqqfCi65lmacAtZxXt1q5XGst36/4Z8wU9erseOE7eIMO+HoL1QvbZAo0wffMxmdt
         woFAOse5nG9WrcQk9HJuBeTaog/Utsc/gKbB80rLWPwRNKFwNWC5CGTuCOpecjqRU/M5
         tXCkAA8dc7durne6FEF9PNoPIq6isAFvPTn1wsL/CXixrkBto5neOUTkHgPpvX54kGdz
         YZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742402999; x=1743007799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMF3mmtUwmD4khm3oKxn+aJ/nnA528F+Soa/iVE6C0c=;
        b=fKFkg+J3IbrTBSmVcm+yOjXTJjJu/AL16XHnNBDPtmfLYTtNj3CBKZcPq/S6MO8qml
         tdeEZb/v6BPmbCgmDG8FIsduUc/ZLu7Tgzm21JD9ZrsaYyFd7YGso3NI/1qbI71tiF1h
         YdlnOm54SAxLdyaNRVpat7ADUOz25Oc9yUkzJLzuLZl3aHMlto0tDr+RAbkyYAg/VmJ/
         7MfzG21zd2wItVfWvKl8a8ykmMwHd+3FBIV5ZxpqBXsXEfKvYaaQa5vRzYlL1u4I3BG+
         NYWUFuXqrMTrEPq2U4UPt51+KHonso7YkU03vCYdTyfkVBZVKzJYoeJGikVVskQkdWnK
         VTlw==
X-Forwarded-Encrypted: i=1; AJvYcCWIAyBjaQjV5oRlo2CbOVoD6wwtdCoEEP0GZHmnfXQ866HJaSUfH/ovCesNUyGzlx9Xwv0YH7MUmQ2tD/IrWtC8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt9uhyLIU7LQzESv6rAW6W3tLAGpBnbGirh5V5CZIzNY1wQnB7
	wFAeZFIDR5StA2Mv4e2f/6srjDPRxvCmoGpnjviUrLaPjbaEXS5B
X-Gm-Gg: ASbGncs4QKM/vrlWg5OjLlL0tB59F8gJ4IlPcqc4PFej8oHr4qaGJdopiqvuwgGykVH
	M6CUFswdVsdo7UZDECqe3wN+BA4oTo9tZ0+I02nIfKZswcBDcs4Sem5yCwPd1kFCHuBIDCPkC+t
	Hm5sUyfLgC50j2VrGs41Thb2KsJFXYY8fvNEWSZf9TcFwMZTsO8ngY2cBmSxtMc0csRMG9hYBBQ
	8GHpeIfIa46Lyd4LKwNEhtBw/p6PSzt57r/kwX/KZEOTP1Mnuja84p7RFQ/rDecWP8SDCeyeF+0
	2AD/eN58cPELdKEDjVkcpmOWVIvuXiekHDfrl6NOP5zMp0aZkcqsPHY1+zLmLhYZ6VDpLjnYZ+k
	ia0V1u550GCDsROo/8jfUKQ==
X-Google-Smtp-Source: AGHT+IGjgiVPyA5L8/7CTCtOk0Zz6PfpxKffD6G4wKCNeDm6lFH0aMgXYouj2+uALNgBvpYJUDjDpQ==
X-Received: by 2002:a17:90b:3e48:b0:2fe:dd2c:f8e7 with SMTP id 98e67ed59e1d1-301bde580ecmr5237088a91.10.1742402998676;
        Wed, 19 Mar 2025 09:49:58 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576bc2sm1863641a91.5.2025.03.19.09.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:49:58 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 00:47:24 +0800
Subject: [PATCH v4 3/8] ARM: dts: aspeed: catalina: Add MP5990 power sensor
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v4-3-7c34b8139014@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742402988; l=843;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=fRj+HqS0/z/8bGgHjoodt0B9Ir0h5V8r9zzaAzc3/NA=;
 b=w7NllEGYLAQNI5dy6Ou6SwtDdfHSy9epo01/OneSo4p26+sdl2YvSaKvr8R1wFWhXByeuM1GA
 lbAyblEy76eDZeJyGe1BTHfH1zULojNUw5W6S1DW1z7zIy5h6FzNTrA
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_094959_649314_6DD29388 
X-CRM114-Status: GOOD (  11.27  )
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

Add a device tree node for the MP5990 power sensor to enable monitoring of
the P12V supplying power to the fans.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index b9a7654325f0..db999408e397 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -488,6 +488,10 @@ i2c1mux0ch0: i2c@0 {
 			#size-cells = <0>;
 			reg = <0x0>;
 
+			power-sensor@22 {
+				compatible = "mps,mp5990";
+				reg = <0x22>;
+			};
 			power-sensor@41 {
 				compatible = "ti,ina238";
 				reg = <0x41>;

-- 
2.31.1


