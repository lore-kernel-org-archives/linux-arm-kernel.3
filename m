Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC199C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVVDUXMgIvl3qGuqG7Y9JWon05wMZyYxnJ2zr2Ehlos=; b=gB/1a8/WnF2adXSOn+KsrhrOgw
	aHnMc/64lb/sMAPb6vUPO/jQLcau0TYmf9xv2xB/4nZ+twNvttJNSgn5mPlHlI12++3QYID6/H9b5
	TBXswBHH8ea0aL11nH4UtYNq/HcPdMXw+k9J0xsXNTMYRVr39cRIiPzUCVdDWFa/SaK1tZjXGojB8
	tjW9syOkh+LvP3VPQ7IUarpJDdQiiOhafDxzu9SO2xs/sjI2F2VHCVxCIdfNNPbHDI16dsweOBP4p
	UoHV1a+Vw/0mwicoW8JhAqEY/GV6yAMamzSwfigUP2ibY09RSstOffnrVEHwHWJKlPg8u/vEJuLdY
	1Ff9oNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32eP-0000000CAlQ-2RdM;
	Fri, 11 Apr 2025 00:53:45 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32S8-0000000C9Uw-003A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:41:05 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30bfca745c7so12475171fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 17:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332062; x=1744936862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVVDUXMgIvl3qGuqG7Y9JWon05wMZyYxnJ2zr2Ehlos=;
        b=YR/oRDnAthuCshxTT4SRkc5bW2Qzq2EOTnvLswLyZgnS0421qH7p+d2jIVmjC6kKyk
         F1EMV3lrrZoc6V/5pmoQaVO4e6uCvI8ISJZlrB0e7YEUEgPj4yRfnk9AqqN50G9s1RJI
         JeUpWi3hwnCvm+o4p3du8OBtgtdVMii2Ow6uLpzLzGuLDViyZzgkzefIthxt8N2OFENp
         j/edLZp/q6kNCodATfqPfjPtQL/EfiaHUf79O65XxgDezZo5wj3iG+CuySJsPlSkkQtw
         9YDAYbeG+45nAvhyeGfDY0oXMQXgNayjyuxt74zYg/M77jZO+wUhC08g5e+7HYk55ewf
         hGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332062; x=1744936862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVVDUXMgIvl3qGuqG7Y9JWon05wMZyYxnJ2zr2Ehlos=;
        b=M6djfzaLNlNJIsXNZj1S+rTzwfE52F1C+Ip/liOceCgmyJUFNS6rs/5vXdKbg973SE
         jqKH9DW+njpmhWFmsatsc20mlJtRAOeD8tzWyVZ/f6Bpy4yChjQwuLwBqYiLXkLZSwg/
         gLiQWHFnB/JlzLh5NbQyWi71gwyjMzuKphNVo6VbXUHlCWPHuZF0TiTHjaMlnypXDB56
         KH0Wu57J/DBtXMHnHSWCYlQ83XhqH5Ug44Qu+zeK6uMmunSCxY5FdN+XmKDKAXApQPAq
         tRkv4u3QjOldV9q+9vF9iZAo9OREStG77OB0lCI3zBBbGbZdiI0bdb3MN97ACZGjJKHB
         5lPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh308hYNuQQMo1lfymqcH594Hu+ejQKFpuEXBoXRmQxgdc5tFHovfRtRsizLmfUp8dtIZP7mbEjlkLhxxiuZp1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8d8TvZ1HZd8mViiv90CsnRDdlRKDNvkEpXKxhsP1vsOr3JsN2
	mSV/r9TixOQCO6ygHsCkf04cn7MS9DcRQgSSh3HovpyP6qj5FcCD
X-Gm-Gg: ASbGncttzOJdeK78V+N5gyumPPF8H1x4jG5jNpdctjz+m9fSfhRUTUwJwp09wfN5i/W
	yvBL46knlNEStyLtqnN3E6+ae8Dea5Nqsbr+j1EPJZtWGCFCnGgZNit1zZPZYugdh7XG2HLi5Tc
	MbzF4d+WUd5OjKEL8CDzbt2cQR8jxGhddiqLSSI05yfE8s4ONsA//OJoqyrdOjzwpxJMQI6/8vQ
	pr+djKe5wmKJjsFdeWpYloDXDNJL31nCJF4ct3cM9qoy2RpLItmu5SRaIkYKLGXKiweS/XF02XI
	xjJav5u4wiEIMnendPeXxDfQ5z7EEpCOZyaYZ8ZgrHylDaq1cg==
X-Google-Smtp-Source: AGHT+IGiJdnH2bwA47CyELRWVzejAMbjmYQFTtee9XHHNai4Q7kPWpY1iiYd/YOYoOt9vN/NRllLgg==
X-Received: by 2002:a2e:b8cc:0:b0:30b:b987:b6a7 with SMTP id 38308e7fff4ca-31049518235mr2053581fa.0.1744332062006;
        Thu, 10 Apr 2025 17:41:02 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:41:01 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 6/6] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Fri, 11 Apr 2025 08:38:26 +0800
Message-ID: <20250411003827.782544-7-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_174104_037319_00CA5EDA 
X-CRM114-Status: GOOD (  10.09  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Add dt-bindings description of the thermal sensors in the A523 processor.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..70ac395ef 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -24,17 +24,21 @@ properties:
       - allwinner,sun50i-h5-ths
       - allwinner,sun50i-h6-ths
       - allwinner,sun50i-h616-ths
+      - allwinner,sun55i-a523-ths0
+      - allwinner,sun55i-a523-ths1
 
   clocks:
     minItems: 1
     items:
       - description: Bus Clock
+      - description: GPADC Clock
       - description: Module Clock
 
   clock-names:
     minItems: 1
     items:
       - const: bus
+      - const: gpadc
       - const: mod
 
   reg:
@@ -107,6 +111,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun20i-d1-ths
+              - allwinner,sun55i-a523-ths0
 
     then:
       properties:
-- 
2.49.0


