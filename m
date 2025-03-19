Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBE8C36000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 16:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKG4u8A4SwXbQSgAOY6y+lFBx/PwI+3PG5TQ/aiiLzs=; b=qn+2l1/TziA3GWga6vY7cz1xCi
	esTpCE0+HmGjMH2OorDgT/Qtbw6rNYg1X+2mOCbVqUXI+6sOSgXZsQK3G7IhrnSsAaL5FGHKdZjTb
	pIhhn63F4HQYsttKF5lmjfhzBMY1MpxYpDwhHW3V8o8CcXi6rpBk0hz8O3JDbOzSs+xnbV70sJ0aU
	at/zm6tL58qi+rVbTJEJuwmqmYOTf/D7+CUsbMby0E6emutshFytbFPnBxCcPAs/snz+qbx52YfBa
	3BDx/4Kpa613JR/LP9dM65EQ27SKo2BFk3rmtz80PIZtBLTcNTTdFqHhGJvG6U4dkKNjSR0jok7KK
	rXIl/Uhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwhB-00000009boi-14Lu;
	Wed, 19 Mar 2025 16:55:09 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwc8-00000009aqz-2dRo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 16:49:57 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso2328837a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 09:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742402996; x=1743007796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKG4u8A4SwXbQSgAOY6y+lFBx/PwI+3PG5TQ/aiiLzs=;
        b=O9SLCRgT2Sb4ioj2SHblLXCtP45OuK+HUjrL/lLbrBkjVHsE9/OzajVqu6G83hbFJS
         ckcGPCYbraApEgDW9ya2MdJnBuusP9Ylv5lGLo/kYTAW4l+eY7jsPGBQXs72SwsEoZ9c
         xzGTJCA9eqY1VlSuwL1bHbaOeZ2KgAjLs0R/tvBdUkd1lzYDev84m3eYbUtQfFO1urtf
         PFdUazdX5lwl0BBnGu7fodjBB3yRCZ2Wx3Jf6OaQLrJG2JLIoPYkSeCfAjz6nlmtgNhl
         Qx66P9sNXLd4d63p64nPKP5ewUn+UtTt+Nqy4kvHifzRVC19o1wfMqC5xki8GSYyXkG4
         98VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742402996; x=1743007796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKG4u8A4SwXbQSgAOY6y+lFBx/PwI+3PG5TQ/aiiLzs=;
        b=c2TooTWbZjdDXx4Je0x1pJj8EZtmLJK5SBV7D2pUiCvRXe8e9WLxv47mAHEV5ldPci
         3wlcpXMMF/1lhYZe45Xt2CUuwGHPu/8IYK9ndTjzVFo5ZQsHrBd7MRURiZ/PP01QXJra
         rgyMAbSUAhxagKHPl44IeH5U6HHLC/AKpo/twJ/t7LE/X0W0/Woe5cuen8OhzJStULXs
         cvpy3/Yp7BRAIynkbKIGJLVD3Acv7T6U0VlrSwj/hjDg8TYshtO14BKSauS8hOA0I7RD
         +IafosEHYOoBhe0aRe7bcCkUGlZT1R8nFbaqBZK5TYK3TL/MuB+gu8ewqxtiItXVAEp5
         AIjA==
X-Forwarded-Encrypted: i=1; AJvYcCVKPNvh86+gwe44juV5oQ28SndxQfNK8znFjGVNcYaxJZ0NDR73dN/8jG5ZFhZAjYhvDbFFNf83rIDGYryIP4iv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4EqYoFL9RCa9f0Uqc/odhlyNZXLdjmuG0JZ4wljIEm5Lq9l7T
	jhZuBxeZ+c2k+THBa5dLKQmTA/MBaF61swEy7Xn4IjyKAykED/77
X-Gm-Gg: ASbGncuAXGbhDZ73fdvaeFSj95/3LeonXrwiUcGQAiseWpoHS5vdQC8rQYk6zuu4NHU
	z1dweuawMEUDFtpJITkXJtnBaNUWNhdZS6EO7LhxXS3e9PnpBJrQ8D711Hk0s54e5zQzSqu65Hc
	AARXwJlSkWe9qNtETIn9qC6WjvFkQbTPxtQRYyzulTCdUKAdmObmqsYaroj9KfnTEGNXPEBPufD
	9omqBe/o0vqo2kx8I02BFadlNbfmemJ11IlOG2ZE+n8t8pDbAeNUOT09hD5f5KmpcySrGKiS7Ef
	rTNtiIOx5pKMCNqV/qtHCdn31eqBKXOutzfSZMSRvV3QWUUvQ9OU6e0tHdIBOMbHVmnjQNZ2jXg
	TvNH0ZGiFqfXR0+RKeM9xeQ==
X-Google-Smtp-Source: AGHT+IHXOOKStoICqG32yq4k+0zjuAzQYQG0OOTXhcrihQzKdjTydmDVvm5dRZt9HcYJZxFVF2KMew==
X-Received: by 2002:a17:90b:3b85:b0:2f9:d0cd:3403 with SMTP id 98e67ed59e1d1-301d4347069mr260059a91.16.1742402996048;
        Wed, 19 Mar 2025 09:49:56 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576bc2sm1863641a91.5.2025.03.19.09.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:49:55 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 00:47:23 +0800
Subject: [PATCH v4 2/8] ARM: dts: aspeed: catalina: Add Front IO board
 remote thermal sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v4-2-7c34b8139014@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742402988; l=882;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=zCunrY7p7KNDC0DPGI2jLsy48dXqjOJ/Du+Sxdf5cv4=;
 b=9D0KNCjX8ehQysgIdjsN16NEt0i08PbfBxhgEMOjbhQ+DTyazPtj/x3cGXMaPtIG56s+SGB6y
 7DEKQ5ZIodiCYC2wfTjMv7QnfQvCsYrZHHlrymllNEmwjsOTT53W2fh
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_094956_670296_E594CE7C 
X-CRM114-Status: GOOD (  10.77  )
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

Add a remote thermal sensor node for the Front IO board in the Catalina
platform device tree. This sensor enables monitoring of the inlet
temperature.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 75c3906d9654..b9a7654325f0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -604,6 +604,12 @@ temperature-sensor@4b {
 				compatible = "ti,tmp75";
 				reg = <0x4b>;
 			};
+
+			// FIO REMOTE TEMP SENSOR
+			temperature-sensor@4f {
+				compatible = "ti,tmp75";
+				reg = <0x4f>;
+			};
 		};
 	};
 };

-- 
2.31.1


