Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A23EC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Q7LJMY8xVzffKNJ4NYk1OAivwG9rzCLSSHWqEjhDJY=; b=W1tcSh6xbcsDHJSF3P4Fio9mod
	8pzQwc4gv8K/PO1OJq8XIASB2XneHH+uFLW6Vk+NKJn7fi+WpshfS+DnId+uXYOZIW5Vcg++0cmnA
	rLdNSokTZV8AFwrc7lspO6DF58egJcqGIx2TMsS5gIJTAlFQfdE11sJlHhr6NXjBHxc5AFIdRHQPl
	yktUkUNBTC3ALSgNR8S/yy/ohE19LVMuP3AAEZ4/iEp7wqBHTnJi3YVV/yohvVa2gBG6TarlNnVbi
	b2YRUNnnuE2RRK7cQQmC0EmgiOQSGEGAngnCiAzkZPKIfiozt9WRFhPNBS6LAP60EDLYS9vfBJyWY
	GmNF+gBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYH2E-0000000HMQ5-1UrU;
	Sun, 06 Jul 2025 04:31:26 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGvF-0000000HLh3-0Yeg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:24:14 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so2416642b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775852; x=1752380652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Q7LJMY8xVzffKNJ4NYk1OAivwG9rzCLSSHWqEjhDJY=;
        b=L15VFL08R5x3I+nChFclmukQjRjR5KqLo3NdHxTIIVCWEdNcDlHrd2+c5wp6zRPcM6
         4x+4J84Bwl0GxYMcx08p3UYPmvIUG0mjoVQmHf4uVFebXS6WMPQtAig14uGWDDhxp+Xf
         Dqef2qCSZsNN8Uk5PuwHTGmwMYgmS0GoLmx3F4ckDuYMl7qJ+aP8Bhul7FM8H30ngsoM
         UD1ulGqzJXLEmewAlzQNa21hu4FDs9CyDfZucDJWsliPGzHcIDGKdmPpybVlBqK7ItoL
         V/coRqhlIJB2VJT1WZnIKZPFja4IfLIPXavnRzSYOXNIFC4aUDrRVSG1V8pw+7/2W5BG
         CI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775852; x=1752380652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Q7LJMY8xVzffKNJ4NYk1OAivwG9rzCLSSHWqEjhDJY=;
        b=Eh/my+Qc3hvx3YxyKdiPlLULNxsdhmg7dSBCuLZ4fkKZ5pvTOMgxnRrdWzv6HEunky
         QUBRReV/prCL0rysGZ79RHf5h9//Ygo7NkyxrbEui48EDfqpN/jFaH/pla0UjFfvVVL+
         jVf5WHJLpze6FYXzZFu5tiyhLWEgWxrYzcx4rBy4TQ06E1WkQ3tItto0DXFO5IeZXXf3
         CfgjwI/FK93AEXq394sIZDI0p/NPKO7pGJdh3A+s6t09KpRP7SKl1yl5XcMmSmD12WCw
         5fYbJXeQwaUE0iIJondYWQ6r5NW7ECPfJP7Yv7/NR+4kD7Mgdd/yuHPG5yRDrKr0/q9s
         ssvQ==
X-Forwarded-Encrypted: i=1; AJvYcCURyd79S0jlJ+9KScn9kDkranYwS1aJGunm0i3mXF0lm71AGUegGTDioqytWKCrxf0EAAtko338pJ3ebHiAtx+l@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6tzuLdZ7w9tcUA7d4Y4rsMgQvQRwRTJ/ahf+sSU9ioYiTJ8u5
	dhyLBlbmkbuP6nMg61zREGNLeifBShFz1efBBqqxI4NeO6fROFE1jhix
X-Gm-Gg: ASbGnctRFp5B3NklhyfZOf9I+6GALFn/7rLD3zwi1MCCg3By5ZRJeTW6Moh146GO4kV
	0wz7I4gdswmDkiFF+U1B+TT0lRCtaFK8IH++cZTMr8121plHsF/ASxRX4OhLn00RtH2sL9wKV9T
	HjNHQopwtud9DF3Za3XS0MRxzekBJjY3YHbyiiUjM2L/xYvAgrEKrlccfYuIP+gCn/8+Hvz8zrJ
	JTain6Hop4RmNhnxOEEgCsUimfs49ots7kiCifoOI2bSO4fLUj5kcdMV8088Fh7EuY55dnvmYoM
	Ls34c1oVqy4KYs7NSE3YfGg5CUmS/VnYlLAUkAmCfrkUgBx2br7B8tH1XNNFH4/2ECThHPQHl/l
	4qQgE3oDzwiI2QKnqNJa7JcWAibNf6XihJpPL900=
X-Google-Smtp-Source: AGHT+IHGJwxyT4BPTriGCEWBu4qPg2RzIh4iiJwsvscWuncu9KiKAXa2wtlgAnq/C6Jh5T4u29QO6w==
X-Received: by 2002:a05:6a21:207:b0:228:6699:87ef with SMTP id adf61e73a8af0-22866998812mr1264529637.13.1751775852509;
        Sat, 05 Jul 2025 21:24:12 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:12 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 2/9] ARM: dts: aspeed: fuji: Fix DTB warnings
Date: Sat,  5 Jul 2025 21:23:52 -0700
Message-ID: <20250706042404.138128-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_212413_170797_B9D5C237 
X-CRM114-Status: GOOD (  10.10  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Remove redundant adm1278 properties from fuji dts.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2).

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
index f23c26a3441d..840d19d6b1d4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -248,8 +248,6 @@ imux16: i2c@0 {
 			adm1278@10 {
 				compatible = "adi,adm1278";
 				reg = <0x10>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				shunt-resistor-micro-ohms = <1500>;
 			};
 		};
@@ -577,8 +575,6 @@ imux67: i2c@3 {
 					adm1278@10 {
 						compatible = "adi,adm1278";
 						reg = <0x10>;
-						#address-cells = <1>;
-						#size-cells = <0>;
 						shunt-resistor-micro-ohms = <250>;
 					};
 				};
@@ -648,8 +644,6 @@ imux75: i2c@3 {
 					adm1278@10 {
 						compatible = "adi,adm1278";
 						reg = <0x10>;
-						#address-cells = <1>;
-						#size-cells = <0>;
 						shunt-resistor-micro-ohms = <250>;
 					};
 				};
-- 
2.47.1


