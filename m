Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB29DCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 05:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWDW22d1KEEhzhYCQi/m5g5KGiHWCtagl6QTEa0SdVU=; b=32lMX31Zz7eY3RGHoS0EFI8S1w
	/yP9rIZpdQcrbZ/DMk1R7JPA0UZuRIa/UbcfYfxeb4IjI3jZeMJgGeJ+dtqd/ULGMFZQ79T34VL1c
	OledCZaGgYqiINmESUB6GHjp0ty56mWheQfXm0FgDu47pKyTaCmNc5y6l2dn3qPFXo/TgSn6SlSB4
	YXuMvfFurq0XcbZGJZV5WDt7Lh9dqUI1DRLKvrroAVG28Z7DAtz6gJADYTTd8ss4TiyvMkV2HOjqI
	ESHy9mG9ZjwnFWIboHJl/hG9WMcPOLrf4oKHJFVZlQ7uLc3GGOUjt9Vnj9t/9+hO4u/TOEvXvZRps
	glPV8FHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TGa-00000004Hzy-0Hwh;
	Tue, 30 Sep 2025 05:51:12 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TG8-00000004Hgn-40Rm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 05:50:47 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4e0302e2b69so17538311cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 22:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759211444; x=1759816244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWDW22d1KEEhzhYCQi/m5g5KGiHWCtagl6QTEa0SdVU=;
        b=myZhII/q4j6jWHCI/DvCJjhnVE5AnqJEbhN2i1YkgwGv8xnppcbAfEN/D1HFZ2oZmh
         namAKJcSmlldwaplrqDhWXSOeRKMf/1slVi6NAVj5S+6v66h8558FMiqLq9g4TZHw+L+
         DFThFQ3eGiY6FnAF+9J6MxOw2KsBGPPrMO8R/2DDutuTxmVdg1+0ehnukr5ABU/5/qur
         ca31UqefvF/aE41aAuXHM3XtSS9moOYdyegCO2mBQ/zIlu/x529xoHdiuvLRW9Le16ac
         lpY6us3Ot8+HsVgal6yv/vB9U68EMPFAayKEbs+Nd+T/3WrDcOTIPdbO2/9qBq1/puAB
         78Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211444; x=1759816244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWDW22d1KEEhzhYCQi/m5g5KGiHWCtagl6QTEa0SdVU=;
        b=JPu1BDg7mJjdzpMx8w/R/nmaWiAg5roZ2pQMTyMdO7bUaL7qkiGblCpIkLz5K8I59u
         T0zvN8U4po9E5/7UGLZchCG+McErc/OZAJW/9/KEESszaAxhowuZwwYVCb1rcS1lKP2V
         w8Q/2rUIwonpMkEJ5B3+OH1GaFNHFx5aDQNkfrNV0QBjAr+Q33DGzpw7OaEk97j+BHMJ
         WpkqbcmpPl/jsCc566OvjwEQ+QKjodWOu25D+OqtpGgZQryXI6xKJOv/nJW+kdYwHFo9
         RdhKKtNYYIp/hH8BxggOZ8fRNWMl1psbp2dlkIW6opx+Ma/drvKOJEJ2UWzbW7/tJqGX
         Ebow==
X-Forwarded-Encrypted: i=1; AJvYcCWzLqOwV+G0fj0KOu8neTH1GMT3sdh9Gx16hf484XwnjAKTLdcFsUDHX8K8G0x7tRtdmgC8tJbdHB6D1XyilANP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzkyr3A0G27pHCyQbJGjj6vWVJToP4rFS77E9Px4KCW/aEWSi7
	zYYL5UhohLADhOHktVO+6kP+nyFuwD/wkBuCjHRo3HUpBRqilnglkZ1z
X-Gm-Gg: ASbGnctEY6YnJBn5bdO+L9Dy57xiYHkfhaGjYVN2x6wE7BoaNhvFMI/0lnKfT/6lVaU
	2kGSwsI1vJU3ODsmi/x7yAadZ4vyw5hq4TUp0aYtcvD9wu65dGuFOeU5G0xfTcBeBp5myNID9fE
	8yxHKsSOxSSE+7w+XIYIT2qy/pt7qzkNUhpGB1g1bPEeXSY8XMvll8aEOfeiesIiNmfMEajNpll
	ZD2S0PMWccklj6m9oCR9WtOftlY5708UcsoNHB+unusfbbGsuInh+1PxVWQAdlZV447PmsxbzID
	jbixStVWEkO5t1O/VNaKjhCztMwdu0B/XnSnmawHKH1ZwjSwOXyqccbWDUe/5NNg/hmzxN7Q+F7
	yJd0HR+Hh11m/JGT+cgUBD/4oI44tAttVWyW4IgC0mOJ6
X-Google-Smtp-Source: AGHT+IE8TjM82ov8xrxnZMK/gXEPncLjzJMtiR+2bILyr0672r34V2+xjWe2oOQ5Pcx9lnrmFBdBDA==
X-Received: by 2002:a05:622a:1893:b0:4de:515e:61f2 with SMTP id d75a77b69052e-4de515e792amr151619881cf.83.1759211443594;
        Mon, 29 Sep 2025 22:50:43 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:3981:263c::3cf:53])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c306b5f64sm971990985a.32.2025.09.29.22.50.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Sep 2025 22:50:43 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jjm2473@gmail.com,
	jbx6244@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: rockchip: Add LinkEase EasePi R1
Date: Tue, 30 Sep 2025 13:50:16 +0800
Message-ID: <20250930055017.67610-3-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930055017.67610-1-jjm2473@gmail.com>
References: <20250930055017.67610-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_225045_078715_D16C21AC 
X-CRM114-Status: UNSURE (   9.45  )
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

LinkEase EasePi R1 is a high-performance mini router based on RK3568.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 28db6bd6aa5b..ec2271cfb7e1 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -726,6 +726,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: LinkEase EasePi R1
+        items:
+          - const: linkease,easepi-r1
+          - const: rockchip,rk3568
+
       - description: Luckfox Core3576 Module based boards
         items:
           - enum:
-- 
2.51.0


