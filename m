Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6936EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 19:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JT9zssUDGV6CpUI0MvgzBquflB1UwL+gHIgjI41RUjM=; b=PjvQEomRYhyQl2FEwXSzjjlASz
	1ZeFlM/XKLA1JmEFdSoIWc+ySKqkpv7JHdZMwKMBd4dKJy+uB5xwSEAk6dHmwzT0Q3G51qwM2oqZC
	0UGnjmbFmW2vJZAsWijhC5dGxeyfwDMm4iGqf5Hz97XA+yZmY7IlP+/EVL+EPcp4GbmhvyWN9MaEl
	WFD/xwyIMIq9WVG5kMGMhRhe+J04XKHaXIletD7EKGEjDi+4iPgjjvqF3H5WaZ/IbZ+XVQUtaIvVK
	4cCy5lgPBZPqQnkUD7UBUrqoKFUZXpiKDiU6qiDeIvkVnRvkEuMwCrchfTniNhWwV5J4ZbScH4HUo
	QEhT4AMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnpQ-000000028n9-3EGa;
	Tue, 28 Apr 2026 19:10:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnpO-000000028mm-1216
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 19:10:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso98469445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 12:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777403436; x=1778008236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JT9zssUDGV6CpUI0MvgzBquflB1UwL+gHIgjI41RUjM=;
        b=S8V7uqSppd1rS91YOYDrsKVTFGF9yM1Q78CBOKpEWInibIIiAes5F1h0IY3RyUXOZi
         8e48XgAKzBjsIaC6nZyUDUuvh2/NYS88ifqNx+qlI/2sY05fZjAANJXsxUNlhhtFYdK7
         lAwMMmyZ3QX95svwXdUxBAzXO6vuKELMy9oLdfpzJz7bhikCEfBbz8CBlfr3Cg8uXM9x
         RFqhhd3a+l7PFrfes6tYtNb6sp8uE01+mnGv8mzuK9gs8Jmii/vF01lscx0qeCNqBrIi
         DEGT9UE7h8u4CSwxm1jHpH66fDIyCcg2pfKXHnICWyhq7ZVd6rDfi6ZuRV+J2a2501Fu
         FdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777403436; x=1778008236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JT9zssUDGV6CpUI0MvgzBquflB1UwL+gHIgjI41RUjM=;
        b=aE25GMEWDGRgoUZURcDf7M6/YGgn/o24H9rmZaUgJ48lT2xZ8CxSGeHz3ceiAJWGi0
         IFLEdQn84nJPMbh/Y/ZQK61YOi++ilbQvBBsAoBErlVjdfqRR85FMDBlYaLb6hdV/dZH
         q3KTFXozDZ/QjBBuabnvZVgApPy/yvRF7Dk0DlTtCbzYOlrCNdTDaDit7ySuOKByknjX
         ktwrsxsqcbCd4APBQ1I7HO/N/4FYUTUo8v1VqnGgE79jDpxCunBneC4MYaTkFKbBm0OP
         UnckwirmS3QJuxaOu1E0/SU36KDfD6quh3LRBQJ3BjmJ3rNPk2HfMGdXqLw+BfgLHrU5
         cLsg==
X-Forwarded-Encrypted: i=1; AFNElJ9yE/1Omdgiac0RkCts7AVJ0qwXTtMekrCRlAiDaJxTdpmX9Yt+3qKQD7PDeOB0XbGWA85S9HHe04Bc0KJOE57+@lists.infradead.org
X-Gm-Message-State: AOJu0YwWqxPbNo8rphGucLnWGKkT8pSO5jo7knFBEVAwsacySmNe4Wcu
	6PVpV3Sr9zidt84vERZmhbID2YsyyQGQujnE4shm/l/s/6Ajq2f3h/RYHmO2PQu9jkA=
X-Gm-Gg: AeBDiev8+im/iHFA8lxtO1rqrNTfLUnk8XgwCgzOW5GW1VZ9YZ0fO/qcd6WhX6j9DP2
	dATsjfnldCS76tDN2yIgqGd+pmqhgualV512gRWQbPXdpEp3SdeCTVm1Znp4RLAVQCKjL0+wEGR
	uIJLOz0C4vNYIsUw8eYuht0MN9zHxeXeXIxF+C43AtI/aPB0N9M1Nr/qbzsFCkCdNEE5aWKtFEW
	k31QTjMTU3mqkQvBrnRI5VR7vsBZR3bbeKBd4505cfzKQl2wLIlxqpoJydvjM4rgmFCctrlsqPH
	APmSazYFwwhmBZ04fS90XC8y8dNY2Up+tZgfTaII9ojsZwTpdSI2yLYjFYMZRXIIwLIml/gsmli
	Sc7t2mmPY1aRwnk6Xxs1k87RTjLk9VPn4/SSBnKjBW5UOvW7XdEWBR4Q7HaMSIJge50lzYmBPrB
	4YgE5w8EHi/ZqYnNDbRjj/zuZEAGcUg5AmvLYyZMPttIPXocXdC19/feiECn+5oMFuNXF+8O7+g
	u6utm87PZQ=
X-Received: by 2002:a05:600c:c109:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-48a77b179ebmr53953095e9.19.1777403435793;
        Tue, 28 Apr 2026 12:10:35 -0700 (PDT)
Received: from ST.. ([102.187.193.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc23f4asm6218615e9.7.2026.04.28.12.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 12:10:35 -0700 (PDT)
From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr
Date: Tue, 28 Apr 2026 22:10:28 +0300
Message-Id: <20260428191029.809462-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_121038_324078_4A9FBC72 
X-CRM114-Status: GOOD (  11.01  )
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

Convert remaining legacy integer GPIO specifiers to phandle-based
descriptors in intel-ixp42x-actiontec-mi424wr.dtsi.

All other GPIOs in this file already use &gpio0/&gpio1. These are the
last remaining legacy users in the IXP4xx DTS files.

Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
---
 .../boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
index 9b54e3c01a34..3043ae7232dd 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
@@ -195,19 +195,19 @@ gpio1: gpio@1,0 {
 
 				pci-reset-hog {
 					gpio-hog;
-					gpios = <7 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
 					output-high;
 					line-name = "PCI reset";
 				};
 				pstn-relay-hog-1 {
 					gpio-hog;
-					gpios = <11 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
 					output-low;
 					line-name = "PSTN relay control 1";
 				};
 				pstn-relay-hog-2 {
 					gpio-hog;
-					gpios = <12 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
 					output-low;
 					line-name = "PSTN relay control 2";
 				};
-- 
2.34.1


