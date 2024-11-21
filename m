Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE94D75BA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 02:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh0sbGLe3R9T6iLNooRlLszG+yIe2rtAwnz37rl7QI0=; b=a+u5zYdEGIV0iHr34Kjy57q8B7
	G1RKd5XFub3XGte7Dx1bKEtzzMUdgrLE0a59yTPU6HOZeG2cYnPzkk6Uf5PE0PHj8tGEo6pX2mH8O
	HFC0wcFboeuBO/f1TO/ScxRABxO8bKBf45tEcuaCC+BAQMr3+cRvXlZY+ruHcy/yrH68V+paVotMh
	BCYo1LC4ma4tUaB++CQh1EL0UV27SAvGoB2yLYtCaGcqrMF1DgvIbM/FQThOXRPqfDKBP6qJu4U+1
	edBvIje/Jml4X8PkvE9oWZUr6k8bfxaENWZudfPf3BXnguFtipbHPZz6Hte25Nu6M0i6V/dvyH2wK
	RGz6gpog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxMk-0000000Gdhv-3KKS;
	Thu, 21 Nov 2024 02:56:22 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxK3-0000000GdA0-3ybx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 02:53:37 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7187e0041d5so189155a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 18:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732157615; x=1732762415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qh0sbGLe3R9T6iLNooRlLszG+yIe2rtAwnz37rl7QI0=;
        b=Y8VKhvqdgMRii0gJmJdKHXWwofs1ACblPcZhv0wmcyAighLpIFHCgNRWKJi0ACQ5+r
         VoIWC7Tnt2IXbVFjOPzT+cr/c5Sjakw/JJOr2hB1l7SLLBbQmdMBllwEAqb39wu/cZUz
         pOLpSu5z28Nq8HknX6Kva2p8ZH8dNslehyG8vZbWrnQKoXK+adDoJ0vm7tFDPEvTS0qL
         9i2S+ZeHCMXiI7mrbdo4fkaT1TFuwzHuPNdhOC8Qr8u3obuxchixhS87XGpRVgrW03is
         OSZGUT9CNttH/xebEAkz6OWMFdWWMQQDYy7v+rGO4HypqOkVtkE6kx2kgsJHAb0Sm/Pb
         rHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732157615; x=1732762415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qh0sbGLe3R9T6iLNooRlLszG+yIe2rtAwnz37rl7QI0=;
        b=BlCKNk5Y/fp2WqrCjHdbtjXC4JhqsLImACeqG1iQiqE4bWcRuDk191RrKZd1rHl8RY
         Hc4JlmLVIGbSzx5q9shv74BSDm14lLvehOxrgLCrR5OavLhMJzgm54PVKnA97FpGB2d+
         svrkiGNHiLJhv7zwr2O8b02tce9qfN0pj74rsyemyfz8R2o6OevujpZMwG5wW46r31aj
         hQzyWgQ2e7izVqM4To2yLg05zZGUVT3UPZiQScsgJ9OrUzifML+k+kPNrMhn918qZAH+
         OuFSRU5M59Uqx1nDZo6YKH6lUibS2j6bdfuOENBd8KAlW9MyzpgYwMjJMBZ+2iR+ukfE
         xIyA==
X-Forwarded-Encrypted: i=1; AJvYcCVpEt9r0RETkf+O19Y7wHm/g5LVRdHj+DYCK/344FJ+eQoor+ghaONj49Fea2TG/e58UrmEceumPDIPvYzxlL5M@lists.infradead.org
X-Gm-Message-State: AOJu0Yw69wjFp1REC4E5OKCE2+nIL0ddnYyoK9oQhJmtCsJVCF58nIsY
	eK1rYEOhQnd4IirF8xWPfZv7g9jDY+2SPCLR530eLDICfSvClvhm
X-Google-Smtp-Source: AGHT+IFA5UwjT3Bz4C/L6hFLi+1S8wr3VskYBXFhSYkypjXSN3g0a4vpxOgETQNmIQ+Tu9bYoG+89g==
X-Received: by 2002:a05:6830:441f:b0:718:6da0:72b with SMTP id 46e09a7af769-71ab3131e00mr5128365a34.7.1732157614993;
        Wed, 20 Nov 2024 18:53:34 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e309-7a4e-e779-1177-8427-3602.emome-ip6.hinet.net. [2001:b400:e309:7a4e:e779:1177:8427:3602])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64f5514sm285513a12.34.2024.11.20.18.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:53:34 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] ARM: dts: aspeed: Harma: Add retimer device
Date: Thu, 21 Nov 2024 10:53:19 +0800
Message-Id: <20241121025323.1403409-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
References: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_185335_987863_BA86E08F 
X-CRM114-Status: GOOD (  10.63  )
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

Add pt5161l device in i2c bus12 and bus21.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index ccb45ca840cd..fd85d5e34a55 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -299,6 +299,10 @@ imux21: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			retimer@24 {
+				compatible = "asteralabs,pt5161l";
+				reg = <0x24>;
+			};
 		};
 	};
 };
@@ -429,6 +433,10 @@ eeprom@52 {
 
 &i2c12 {
 	status = "okay";
+	retimer@24 {
+		compatible = "asteralabs,pt5161l";
+		reg = <0x24>;
+	};
 };
 
 &i2c13 {
-- 
2.25.1


