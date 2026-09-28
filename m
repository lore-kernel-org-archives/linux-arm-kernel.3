Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DCBCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Hlk6LB+jMpn63Ohia0apz9+abNxcQqx8sIdV/gr2JI=; b=mcT5lKO3KPMdwrcNajvwky8zG1
	UNnTGxeYEnDrScjS+yrdEiDmB+6Mhs7Onn8gJ0AAzQPMNUTwsML2sTqpPKN1PN/qC33E74X7xPB8u
	tsO+HUqSF5srJg+liG0tun4PREaMIONiYq0jl87909Cg24qDSWEbGFpZwqcuuNvKhjWtlDi+LnX3d
	JG85E1mmzechA2lJdh0tsuNxwPjsEDy8RTJS7s0grc0Mxkps14VKmwdOvf3K2tPwGrpRaAJlgwkaw
	EkIlMxGHSt3EcCuZVSi4YlhpHVkKv3CQyTP62ZlWXBPjjD0l8qxSNmPeGsvkOx/5xmCy2Hsgn4TXL
	ujJJpucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBSN-00000000eqM-3Z0a;
	Mon, 28 Sep 2026 13:31:47 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBS6-00000000ehN-0xIm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:31:32 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485ac898fa4so2548657f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602288; x=1791207088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Hlk6LB+jMpn63Ohia0apz9+abNxcQqx8sIdV/gr2JI=;
        b=kHO8j4X4dQOrkvJA1giFL73DDl5GeT+KgBS9pznD17Gka9Jdb/jklFywACd+GqxjUm
         SYv3/tgNwQvbqbhARmvRYlDfEqYXspZmhHJuBaSRrEJDKAEk6LHuHiYdnnCMq3YFQnG1
         D/ujh+NkdNWEQCyyPshuNSTjfj9TD8wfoSsIK0lyuivY/8rfhNkfMWkuCAGBSYjpuiDV
         UmNRdaaGSgp7b5MLZ5HKjMiV0ii0UH16HfbpgB1lLL76OP3YfOXLp+/XQUAg5mkim8ky
         KZSKnSsnzHJ+ZEM5AFEEz60Pu5wmfrZOVujErghDGnkA9M40fBAuIEPoXNFL8GwqmPSY
         zlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602288; x=1791207088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Hlk6LB+jMpn63Ohia0apz9+abNxcQqx8sIdV/gr2JI=;
        b=XTb4uSXsM5d3JFE4zwia2pZji0g3qVRA7wqfFJIVUlm9VnvDz5A92V8gkP5SlnAhKV
         xIE1vzeKiuFlTcUp39jSLB+x5xWbcE4eHiXJ46EuptA5LqkeHZaWxNHDkeRpaKezrsdX
         P5EJGzb+cK+23FV9ZKoUHnpIPULq7u1nCLyYaHe0Q50/TXVK8NNI5z2WB4+s0pdn6Vy0
         vgyS5IMhp5K5qlqSnmKRuEgktu3OMAGzLhNgcS9y2YRpGYKSzvZSVFi1JZuSh/7Z22Ht
         zwryMGjyRX3GV5UyxjwUle6kuhTB4SotNzonRdBu6skFLVGpAWqH6nhy2Fos/I2M1yro
         hhnw==
X-Forwarded-Encrypted: i=1; AKwUvBzU+voVWBlROpKnrkAooZJ48As6aWySUiALWdI0NLF98hUxWKe/DY+V2yPrIjDussIZIJO8q1SL5lfmGXW83LeR@lists.infradead.org
X-Gm-Message-State: AFq9FYIXarIGKQ5D7aO3C51JBHfIKvXP66KAOaUSXXQDa/8ys0ku///l
	Kh672jGCBMnsWuVo9fzN7vtnZDZ+sux0fTEaaEW5PoiGcK3MA8IMIkzV
X-Gm-Gg: AYBFou3hty1N4/pvQAD3eCLOXxNmxu15mEu5bWXSh4JQDEqn/INzH/j8jLVWmGvbLvb
	8SFFqvlhGKOTWhve1WIRIiaP0yj1V/Deo9rLkaibGyG9SllOJ7YV4GKnuOGO0NJjAT27afTuKOq
	htGd6MiT2dfXlCLiS6G5fna+Fbz0Fup2NHEznARXEy9YSjLdsUyT8f1cwctalX43lb4tQVaK0SI
	O99D6d24usmHQGxPcwwLfsf9oX1H3cW9wlqmw0JLNqQuaYkgJVJPO9rN9MvYUv9RWiAlLnk7loI
	x7uwMDzQ9yHCEevihN4u86Y6iw9MrPZOvBoKev0jgfJ7mKr4Ss/vrGNAOLiAI0uGAmrxIKuFoZs
	BR5FmPmdSs8pa7P0nVl99aUslnUyuGOGoeorLVa3Eyl4klQSpU3C+QJxFeikdQQP6VzVtFKZnAZ
	pmJwZcYcvMFEcAk1EoJFyM90HVRwhsPO5TTQHRzTHPBgQlFkUHvBGYD1ZpuejIISOBialjCBgPL
	8qe7wVK4Y/X8IOJ32ql0yqct8BXXlm2oqnS79i+EqXa4kCb478Hzb/pcgxWhLNsEI1wvbIArq1t
	X4eKWsqLJNTxaZRGo+nfnNtQBJQgTUeCR7tr+Q9N7MQ=
X-Received: by 2002:a05:6000:2510:b0:487:c99:9020 with SMTP id ffacd0b85a97d-48871714226mr24139494f8f.2.1790602287523;
        Mon, 28 Sep 2026 06:31:27 -0700 (PDT)
Received: from cypher.local ([212.187.182.165])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm27746276f8f.28.2026.09.28.06.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:31:25 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Add missing audio codec supplies to Pinebook Pro
Date: Mon, 28 Sep 2026 14:31:15 +0100
Message-ID: <20260928133122.45765-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_063130_283636_7C8F4D81 
X-CRM114-Status: GOOD (  13.03  )
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

The DT binding for the es8316 got 4 power supplies added in commit
e9966d450b46 ("ASoC: dt-bindings: es8316: Add regulator supplies")

Page 16 of the schematic for the Pinebook Pro describes these
supplies so update the dts.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

I noticed this was missing when Diederik sent the equivilent patch
for the RockPro64 devices:
https://lore.kernel.org/linux-arm-kernel/20260922133643.2730265-1-diederik@cknow-tech.com/T/#u

 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index f21fcdc1b49a5..f728e6f64c2ea 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -656,6 +656,10 @@ es8316: audio-codec@11 {
 		reg = <0x11>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
+		avdd-supply = <&vcca3v0_codec>;
+		cpvdd-supply = <&vcca1v8_codec>;
+		dvdd-supply = <&vcca1v8_codec>;
+		pvdd-supply = <&vcc_3v0>;
 		#sound-dai-cells = <0>;
 	};
 };
-- 
2.55.0


