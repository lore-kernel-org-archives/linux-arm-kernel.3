Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C2210F284E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOuRJlmmqD4Xl6AKwZIJqCij8drZ2YSxq5ghkTBikxg=; b=JlAWUEIStjwVrGliIa66/lTihQ
	aSRT0cA+eTa7c3/qAjiuP6CgEkTca0WDkSdbE9GqteUridHLM3GlPiKVhXv7QVPbDi2YRQhArpgS7
	5vB11RsHhwGDkAkkE7B+L4YUFkllGOQ9B2Hp+1kvQY4+1rHLrzUt2Yi3zd8DbY/U236b5JE3lNKP+
	/6xPYAfGfINlvFl9v1xpO+aGvEmK2qKV2dNaGF4VZhKkclqU4EpXFedlX7A+1CswGAW16SgtPsCll
	nrFSgJw2uIYrd+Wm+FcnBlAlBXtCbl0znj2PXk/E1B/lL41ynS0/nFL6BbGLIS6Zrl9r5rzZJDPvN
	Pb46C3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ALr-00000007naN-34gg;
	Fri, 27 Mar 2026 16:48:03 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ALm-00000007nZF-0lkI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:48:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b0c30b517aso8754515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630077; x=1775234877; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOuRJlmmqD4Xl6AKwZIJqCij8drZ2YSxq5ghkTBikxg=;
        b=EinDqHNU45mgXu/wkHiHtXIII7+WlN93/3Mv/dntA5N1d662CYoxEdP763TVIvvErj
         3YeozqJ7qKCzcxnVxUO5P3EwqBz/o3UFwY6NpQJ664/uHHJWvHLLnVF1rKO8PM5lN5FI
         tAyrtBh8UZ6Bz2osFDU0v4PhU5LfwoE5PgDkb/tS6STC3OzfKVyx0HPkuUfquFMzt4hq
         i2sCIU9y069MyLnpTh7VzL1/dkDo1RdlLJCa6c04yHP+FDBdGQbqAfRpXJ3X3XF++VBi
         awLaJ/SLQwZMwOuH4lQKSL09vAVqEPTPvVSr+5T72iMYRMGv7GFbOqNw71QhxIB8vaV1
         g2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630077; x=1775234877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UOuRJlmmqD4Xl6AKwZIJqCij8drZ2YSxq5ghkTBikxg=;
        b=ARKpmuZ99JQXL3IVcE55OXXCpIpouD8VrPjxd8sW3R1nJBwTZr9ScwWz908idJdaVL
         CBYrUBvrXIjItPxHRaPK1VXB6M6Qu069evRUWwm7NYV6nkf8A0ht4OhVdCu6m9nbGu1K
         dI+oPn5QKuv6f01elTeW/ZvEKr8HLWEPlqJ1xL/itq75L0XwGvuHml1TJsxWhp1HTjg1
         cpKIR1q6PO7nrRNJr4+NVlB2NymoFt46tQmu9p3QjaUXhgFdlMYU9H1C2azb7br81/4i
         j0cONUtJ7CBaVH4VurT4kUfTHgnk9wE2UCWXMl0ZnxUG+WClRUqnj4cjjmcw/RavE9FS
         EIGw==
X-Forwarded-Encrypted: i=1; AJvYcCUCOqbYp2wdbnR5ztYaPBWSE807p/167wb6UE6uiQVw359hrvYUrC+H6FTRyle6dOjiWJmk/TnveronXeogB8KV@lists.infradead.org
X-Gm-Message-State: AOJu0YyhchqVHp53YeIX0Bs7ag0F+sY9EMoPnfWW3PlZidCDyk30A732
	0Yb0hoD+pnNj40O78ayGtUybAgI/Lh5+FisFsGO3ljg5Zhval5lSRxSW
X-Gm-Gg: ATEYQzyQefdRSm7t3VDWKDnJnLj+Th/zPNTrptB1LKlFP+kkco7KKvB5RLpVYs+eObZ
	BZ1TrcryefrzgbkvkEcZtAMeocbY+Yc82nXgx/ytyRR9iS3nvfPVI6mOeu4JPXZADh8lO2gM9mN
	IOsMRHXmxWwNH+LqPh1WqeruxXMTKiG1aYH1VOHOMxrBlxFRE1PEh+ZmUff1V8jPCqPwJCrvTK4
	1X3e99/mLZy9H0hE/Sos3qn1Pmq/WxW30eitjip3zj0YZ5e82enju8sgve8d+FkVBoLBnA94c/7
	rI+/HmRNILOJ+3GY+4X22BZdHrIl+bsH3lxmuLnKGXZ9Zi5kTXfOvCiN6e0HQeOs10TK8qEh+by
	GMTXyuBFNqvrcOOUsPTHFpSGqGF/jHwpKRsGNgd8NHzZaMghY5HqvGwwjpNBxv2YNykggZxTHst
	VEmmEx5S4XDByKMJjLMUHu38mTNKlwM6NXMzHvWp+S1IejsgxnclBzrrI=
X-Received: by 2002:a17:903:37ce:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2b0cdcc8106mr35196945ad.23.1774630077337;
        Fri, 27 Mar 2026 09:47:57 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:47:56 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:42 +0000
Subject: [PATCH v4 1/5] arm: dts: at91: remove unused
 #address-cells/#size-cells from sam9x60 udc node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-1-eb8b6e49b29d@gmail.com>
References: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
In-Reply-To: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_094758_232553_10CE46A9 
X-CRM114-Status: GOOD (  10.71  )
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

The UDC node does not define any child nodes, so the "#address-cells" and
"#size-cells" properties are unnecessary. Remove these unused properties
to simplify the devicetree node and keep it consistent with DT conventions.

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/microchip/sam9x60.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index b075865e6a76..e708b3df4ccd 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -75,8 +75,6 @@ ahb {
 		ranges;
 
 		usb0: gadget@500000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "microchip,sam9x60-udc";
 			reg = <0x00500000 0x100000
 				0xf803c000 0x400>;

-- 
2.53.0


