Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D62FC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R478x+VsQssRpU/U+H9eTTLOJEK424oXp8O1P95M0Gk=; b=2sU2p+zxOKg9uD6z2faPi/qUQN
	TIS5R5ZxnvuoZzvqkzKq92ns0w9Q080R8zAGESg3tZi8lKEdtXBUbTx05qkqQsqjf4286GJ87Qczj
	wpHV5M3YyWky/HaQ6nd96oO6ZdYw8frIPaExIz1CiyVZqW5mXWoyLSmDXzXPyfLgbxYh5sMSth7iX
	GcllIA/ojbfVTqnegUSgx8U0DGybmRNO0O44azhLPtTvV29VRy62Of5Nr6XNVTOegCB0AWLXPUp1R
	dK7zsIXiNv05cwLyd2gu+UNooKAlVLPUkhd0UzVr+FOTk1XShe8gFPlsTbSSgCBo/prdQxbtvRK5J
	k0OdHhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrac6-00000003tFZ-2h5N;
	Wed, 05 Aug 2026 12:20:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrac4-00000003tCv-12ya
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:20:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so5570975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932446; x=1786537246; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R478x+VsQssRpU/U+H9eTTLOJEK424oXp8O1P95M0Gk=;
        b=L9G/TgvuGG1Y8Ux2YBL/rOrSJwvcvzfrm8awBglqwexkH7HgVPhGXhPKWB3k+3iXMZ
         jr0tarJ0qt2BDPpm45P4WA8oewL1mZItACmMZNo8Xkl4RLeXMpZ/s4YQanxDY7ORWFM/
         IN2uEydNs9cmLluEnakyvjTCiAZ0/b1Si/qsKe19mC2arGCjaGicXvRMJclVT92K2v5w
         4OJSFzQaaKW6b7gGIkkh9+O8jdchY5iaG5aQ3hV5bs3E4HI45OWjtyTDhuvS2y/3CFxd
         vSL2tIXpiltK/PLnpHBRnloRO1OVL8u/nxsEdSQXm4INyQ+zcdlM36orEjYBksVfUCpf
         YV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932446; x=1786537246;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R478x+VsQssRpU/U+H9eTTLOJEK424oXp8O1P95M0Gk=;
        b=DPSCwqFufmBd88h+LjMryoVK05FRLO/Uvrc0mj4ha8+EF0qiPzK1GI8xra0pPah2Fy
         DVMRTP5Ffea8UDxE/QBGOdmQPXtDf7cv3QcWTLoJ2ENaTAYWar2a68H+GTzqqAY7I01r
         ufhgcplvpvVC/kPBYn04PLT56XW5dwLBqH/wO9j676CIsnEZM2FDbD9kSL/SWZqINvU5
         chjzydpDHHxq3q8sTQ9BUViv4UQb3ibGpPTpqhO6dq5REHjjryujBtiAvY07McEDjeVF
         Pxxi/zywkoq1sszcuyUB5iOhqKy17d+os6ZFi64+ttvjTsBAf26fmmJTgZe0e+uZ18/x
         I6Mg==
X-Forwarded-Encrypted: i=1; AHgh+RrsVmlTn2/nnwubrJOh1a1YVUKqCL3sE3krO7x5fZzMDTpQ3hahewGexRaBa3UlrT9cqUdVFxfD0zwhqrAo3aWE@lists.infradead.org
X-Gm-Message-State: AOJu0YysM1cYbuWJrGBGAqcnrPcVL8eJSIYPsGX1ZF7cwbIBgV2HTssy
	lRgfU+5CfMkMmWnvmAVyZ8dyZ/Vhav4thTQ5GDEcYDBNdhfVHSea8uEOZJDR2vkKOJ8=
X-Gm-Gg: AR+sD11scon7almRiz7z4tqagA7yYqBHdCfMXG3hN+mKQASJ+6W3Ye0jFs8EpwLD1ep
	6Vzf+qHTtQSTB4lVaBOdpru5L1s0+JUGvYcJYo50gPigfqsxKIiplpX7LpUag9rrV5kgUVNPbW+
	kRMwCGirTXWsVyt4PPaFt7tujJlzaJbK3PBCWy9ByZOdst9TrEFpwyCydjYPjR3vNTOC3Ybv1LB
	WZphnd5C8yYSuVJJz4z/EDN1YU8eSdhMwcWnHEGsN2V92qbfqn2qUcumNT2L5VMi40fCsjVSpfk
	WaqhH4rtewXm7Qanzj9UPRNmcqg9NeGrHuP0yXHx3eBsHGQA8mznOG2605MzmKr/OhDVUuIjhx5
	n+IANgpoBH9ljLawTwDhhbnxCHRFJWN4tZzrvs6TrEqFIq94oz9PegOnYyd+5W9oMnqR11Xc6QS
	iuLzxCZI/jsfyjp8i4KG7l7eKlyXvsf94wnwi//hbRIR2LwSbi1ylS/w47qsXcNuKtxhBS0U883
	0sLmXdjbEAAm5kCXs4jUZkHROnFDQTlVMeZY9lFVWHruPcpsN943TYgBaY3/ZwNBPx1tLKL+QJW
X-Received: by 2002:a7b:cb95:0:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4994e7c118fmr56108875e9.11.1785932446337;
        Wed, 05 Aug 2026 05:20:46 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:46 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 5/6] ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
Date: Wed,  5 Aug 2026 14:19:52 +0200
Message-ID: <d54bfe689e6a0f318961588ab6b72fc2b09ebb47.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_052048_315733_16A67DDF 
X-CRM114-Status: GOOD (  10.42  )
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

Use the ast2600 compatible string.
Make it more precise and enable specific ast2600 properties.
Still use the ast2500 compatible string as a fallback.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..7c02633f2bd6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
 			};
 
 			vuart1: serial@1e787000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
@@ -717,7 +717,7 @@ vuart1: serial@1e787000 {
 			};
 
 			vuart3: serial@1e787800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
@@ -727,7 +727,7 @@ vuart3: serial@1e787800 {
 			};
 
 			vuart2: serial@1e788000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
@@ -737,7 +737,7 @@ vuart2: serial@1e788000 {
 			};
 
 			vuart4: serial@1e788800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.54.0


