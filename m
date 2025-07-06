Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02DDC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5hvQYwSO1DDyOFBRxzz4gXM+LbX6JZNHrIcl99wJbw=; b=tfWH92Q3AKWTJO67mKJJuNp7Kg
	eDZYwjmMHffunsKgdnyl1AKcueh3g9Kt4RAgOmyvaipn/umzlUEgUpCkjv3vT6Xs7yMkEvkzSMc2N
	x1qv6Kt7B9Dj7lcg2q82NtOry6YJ4bWA/loFgT22JGaHPzOy4ooBEhTQvl199RRKuN9wx6vtqO+Ly
	Qc+2fHny/wrEFBUrajeo9++2EdS/uPutbNI5CkgHLqLSAwf9Smd3z77cMWycz0jgQTtZbEdHedR76
	LmAqmWo3R5dc4pKI6/xC1rUN8isRcoeey5wH4IxkYaHhsa80YI6mTj1aG5N5AO7OBh9czEATx7q9M
	gWE2Lanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYH98-0000000HNHA-2VVS;
	Sun, 06 Jul 2025 04:38:34 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGvJ-0000000HLiS-3n6N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:24:19 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-73c17c770a7so2669845b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775857; x=1752380657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5hvQYwSO1DDyOFBRxzz4gXM+LbX6JZNHrIcl99wJbw=;
        b=Ud8rMuMsQIGqVw5SnAHncElrZsAkOayQPsHo/CS3d965Q+iww6IoYamr8CdNJfGOyn
         VYCdVgyC6r0x+w2WHUUb233SnsHtZfFWo6bY9y7XmQ6T4RvEWui43uG0EYdsqP6avDmG
         clcEEZ+GM/yh4GTqmR7PTItSLPfYYBtFuRd2vffbPt5MqH1+0p8V+G8Fl/98Eh/l4kPA
         rUGQWQlYz5DMc+ttrHKL45O0sOBrVCuHFCLOM9iOtnFBTe8Nz/E3ZgEWe5ItfjFEPMJo
         kuCjd/gLNFe/UtN6vFcgRL37ma/+4TIpIemxhdTUlQ634CrH5+7//92X63xY9ndrjBdJ
         RrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775857; x=1752380657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5hvQYwSO1DDyOFBRxzz4gXM+LbX6JZNHrIcl99wJbw=;
        b=jhQGiGvilcvIwIHluclVOGykake9jSWv1SMxYicaqH5u/CzRbmI5JIPGS9cgegs99U
         4OPv2ukbXUII1pyMYCPSz080B+1Fs7DngdG6p6pfanMUZ//1eMAOEmkiUjuMUnk8GaRn
         nEGIazDAj/rIMxUFb6VpFYYWngkqKTYKzfpeYyIwUL+6QUmu+vBVUI2i6vWp8vY4qfNn
         03y4NeAHEMR9jondVCPEaYKSVdEqqHS/NWgJESjfVH6tqY2SovwdYAP6pt90kBtjjakj
         V72KNVqwuztItHF5va8nlIT9ONh4whoKT7vycTUBe5GpS2rUd0eBlWVrzs5nrPV6EbuR
         y07w==
X-Forwarded-Encrypted: i=1; AJvYcCU2bqgTvNi8g06f0+NA3NtOoWBe0zL2eS/TijGw84A2Ilf/PeyvEE0fuYKLs+9iyoy/uEIiI5tUVYOVdweQLWFf@lists.infradead.org
X-Gm-Message-State: AOJu0YwRs0c/O2F3wcRuiPVHpL0Brisur3IRkXVPL0dXmDnOjU4hvaEX
	Fj1mVVK8FSTjfJ8+dQkQ8CbdreVZedfPEDTzv5kT9sfdvf9Rn2lbnwXW
X-Gm-Gg: ASbGncv8vMePCGh7SLO6FRQXwfh1uuzswpxW3gIbdP35V7Tc4zPaoVjr7LDM5h9y5dU
	1hV8/EJdVN3tfX+2hibR3XZR/AdTXS+TgBt8d0PER2ViPG7g0WZtZVOWCBNqAqtg01cllmjLFbS
	KhfZbLzoP7/UqDh5ekdPzoJ0cNbA5cznsU+ggpf1OCJLzvWcdxFl3WBdAkq4rNhsoC5NnejDuoa
	BDRZnlPnwCR7wUJ7mR0ODSMkUxKohRs7YHfYLGF36nuFIiNa6EV3MOG9mofC2FZltvR3BQUwxl9
	EhSO+rHeq9W6AXQELKT2h0qmRTLzIEQK42qnOLWkD2ftnhebVzFN5BpdppNlH0s1QzmUtb+Tgbd
	eiJxMUL3cQyW6RSMppF+BAWI915hYmTs/9n4UhSkpg9AMTmyxfQ==
X-Google-Smtp-Source: AGHT+IEDh07y4O5UrpWhHEn8NMy7TKn3Wcl/ge+wEXWwvw6/1ARreXKO3us1HCxZEGHLcjY9QbNDfQ==
X-Received: by 2002:a05:6a00:6ca6:b0:74c:f1d8:c42a with SMTP id d2e1a72fcca58-74cf1d90239mr7504338b3a.13.1751775857389;
        Sat, 05 Jul 2025 21:24:17 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:16 -0700 (PDT)
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
Subject: [PATCH v2 5/9] ARM: dts: aspeed: wedge400: Extend data0 partition to 64MB
Date: Sat,  5 Jul 2025 21:23:55 -0700
Message-ID: <20250706042404.138128-6-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_212417_942824_3B3A414C 
X-CRM114-Status: GOOD (  11.69  )
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

Extend wedge400 BMC flash's data0 partition to 64MB for larger
persistent storage.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2).

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
index 3e4d30f0884d..cf6c768cbad5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
@@ -92,7 +92,7 @@ tpm@0 {
  * Both firmware flashes are 128MB on Wedge400 BMC.
  */
 &fmc_flash0 {
-#include "facebook-bmc-flash-layout-128.dtsi"
+#include "facebook-bmc-flash-layout-128-data64.dtsi"
 };
 
 &fmc_flash1 {
-- 
2.47.1


