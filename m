Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F51C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSx084TFnzGFnpguxyZxDPEBlEGv6khf3RChBzg4a7A=; b=z7cmAR5zKyIqRuCBznCorVLnYw
	3PmdttM/lyzQu+Q7lnm7/wRBUEI2KNF7S2oPYld5XDuc1FUh/6GhP41RWwkSzaGu9wQSpl/Yq1wzR
	GhKyxTNaRq+mAvaYW2YJ0O9o4bXXxvo3SuC4yh63OnN6X8OYhteaNe+aU5pCHUIQU0QQhJOKeXz+U
	h08vgxhkkI30HYWsC0SSIlk0MIJTFCED+2JiSCiD6phSNcEDPc9wnT5CYr6dR4VZ4madpyaCChbNA
	vfM42BrbPEdBww1wvj3vvixCIdC/0u2IqLBDklVAA4jRr6fthGk4VhOuYG035h0PCrXcGXeoiAabI
	AjEzRtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme47-0000000Cm6z-4AmS;
	Wed, 22 Jul 2026 21:01:20 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme45-0000000Cm5a-0tQI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:01:18 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-472326ca506so9988578f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 14:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784754076; x=1785358876; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xSx084TFnzGFnpguxyZxDPEBlEGv6khf3RChBzg4a7A=;
        b=Gt6xNOTxD0RSWMd+lXRUOVcQSbVwul/ehnRXgW109rGYJkKPiygpBYb0FrYIYucD7k
         KelfpWAzby3MPX2UUr9Q8TJXJDzy2UpEsDHK7TF4V3TnbbWEtQFJDzEHbCovK+ISkBct
         rxtJOloIyG5vFv3xBpwpoARHYr1QPCNRlp2Ss1LFGxnOCRFBHd93taoFnsAum91T/iKO
         D6bZzcBv4BC+5B0Dlml38+UQ+0gweZLR1oDq4B9C7JGZL82aDB8Aeg3qDmhGiCiy3EqE
         nU9gmhcKbSkfuAbayBEZV2BcSavMyqBlH9rPBQaaL770f1KHm9GZWWpf7on/6Yey5BN7
         UZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754076; x=1785358876;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSx084TFnzGFnpguxyZxDPEBlEGv6khf3RChBzg4a7A=;
        b=WP9Pq87Rh28fxX3whAqHCHl7jf8R6DvD/LBq+r4Kkr7sQUcLSHmpCIBGK/LDVsYiVa
         IwiJbmCg0FMDDayfPp6xxJtE8W5ZkD6QuUg5QaX1lKYrmFiuoE6Vz7+2u+0eRveIjaU0
         SAC/GZQtsLDg189aMfj7LdC2fFskFVocf5snk9jHCW6oll+JLTZNgY4IR5O623oso44C
         pXH/qmug2AVquaRci2MzkwYYceaMWyzNIvesuTEnL47Lim1AQs6Ue8l/h52fQkWoXhso
         80OGIz9YeZYhDdZKVpJAh2uqrypLVvWJJ1kHHHQN9cciDfgNKFYuLjTBlsexWUKmd55M
         hlTw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/17si7qayzRJ6KES7WhfymS+rMx/uQYvRDd8gr7U4Ena5E5t48B53fy4bJUNKf5fdEsa1Drn/GG9LKxlLoik+@lists.infradead.org
X-Gm-Message-State: AOJu0YyoJLUt7hPwFpIms6KWszvEzxN+gX5wl+qcdRN1Bwi2fg1uLs2u
	W2DigMs28hS9scXu0/XOAltr8d3VdFkRLx/ZgC6+KvPKpRToTRlpjYdt
X-Gm-Gg: AR+sD13Bfi3lvQqIdMctRpOhnmWHWlyiCByJx+PaLwilkq+ITWvKJUU5zFrHluimHZZ
	+lnuqk+IgE4Ae4yCwiX9rj3wMK96k48UETOcyyGSFGNEL8A0wTROUZaZX5StCXCUu59fvGRnWme
	28Vam44ofGuqnyNStaSBw4BEE+PW7xKYU5qJE58akuIImNRAuTUuBQu8doeQlIjyVjWNmLIenKQ
	ybP4Hga9hGOG9kZyB7IMbLTIi0D7PpPGgdj/W1myO+SlGV5/m36VARmONSLIzaTVFX+Wob3+aTC
	wYLRKtoxVJlU+hTsHi/5855FHIhCC2mOpmCBCMc8WowpEqIVOPBBdkITNQh292GNkP+DXjeLNBL
	hVipZ9JFRWEx9yf6TZqt7mcmMPuAv/HkrawI7k5+EO0ayHpzTwtswIQ/Oj+QP+vAvHW+e4GOrAL
	ghJqEpOfS8c5pstKKreo14lZXx
X-Received: by 2002:a05:6000:4282:b0:462:ce05:c5e4 with SMTP id ffacd0b85a97d-47f8d755525mr573989f8f.37.1784754075574;
        Wed, 22 Jul 2026 14:01:15 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm8610812f8f.29.2026.07.22.14.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:01:15 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH v2 1/3] dt-bindings: thermal: sun8i: Add binding for the A80 THS controller
Date: Wed, 22 Jul 2026 23:00:44 +0200
Message-ID: <20260722210046.2932498-2-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722210046.2932498-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
 <20260722210046.2932498-1-fugininsane@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_140117_263201_AB947816 
X-CRM114-Status: GOOD (  12.20  )
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

The Allwinner A80 has a thermal sensor with four channels which shares
its MMIO block, bus gate, module clock and reset line with the GPADC.
Register-wise it is an early version of the THS found in the A83T and
later SoCs, with the THS registers starting at offset 0x40 of the
shared block.

Add the compatible to the sun8i THS binding. The A80 takes a bus and a
module clock plus a reset line, so the existing conditionals already
describe it correctly.

Co-authored-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Sören Hantel <fugininsane@googlemail.com>
---
 .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689..718c44d 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -18,6 +18,7 @@ properties:
       - allwinner,sun8i-a83t-ths
       - allwinner,sun8i-h3-ths
       - allwinner,sun8i-r40-ths
+      - allwinner,sun9i-a80-ths
       - allwinner,sun20i-d1-ths
       - allwinner,sun50i-a64-ths
       - allwinner,sun50i-a100-ths
-- 
2.43.0


