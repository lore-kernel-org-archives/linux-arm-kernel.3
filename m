Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA89C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 23:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vWeV1W6gcuI/MozGquhzyefyDY1CKq1VISFtq6ltYNM=; b=hX3f+yCB0tcjkLFozoNZKXO07t
	yNHqO4zMEce44dWAP6/lz92kj9li1NiCMC1KaBIohthaY5624+0fttTZ0AQHryNbeRzpoTpUMGHOH
	29U4VEw1kGt72uG1OuO5n8wpgwdHl3rgQQ788ihuFu6EI/FI56hhMGH3DsaJiU8TAvKM+G7WP9SBA
	2ZxUiLSrse5gUtnRiseOCHfQQOS8B8NbucQk+kAJ9oCElvpOi9g9Z9BHikwAv3US9j3DOYgvT7Dq9
	a8c3mBCVsa12RiEX3HDlzyaHtVrUBh5Y4PLLQgvIxQD6DxZgIuWzuiI0BHkvudJbzuVOz6YpjDF3/
	0FvOeLrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45i0-0000000AT80-2mK2;
	Tue, 08 Sep 2026 23:58:36 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45hx-0000000AT7A-2wSD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 23:58:35 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5b523efb0bfso3902411e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 16:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788911911; x=1789516711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vWeV1W6gcuI/MozGquhzyefyDY1CKq1VISFtq6ltYNM=;
        b=BQjfu0uHUyhmUFFdTF7Ev9WnkG4ZHp9IhvDPDP4FsAK8T9BKWIiRn9ust88s1TQnwF
         ekEWbVg+oKUCYm4jBsKkwp8/Ta/RZnCjcmgtXXp8nrNGt8yOZmD3nqOBZ8NbAQqRW4SQ
         dBoUtDdShQaKgwSc4qLKLnTaVCcIxjWYahX3UdL4Qr/txzkoOxuaxQm2sUqqq4HHqquQ
         0yOkMbLIixK/4Vvm9jLtsIqz+Ce3AfyvJDwcGhnCe/lkhrlXYXf5IQuEY6Rv/9EBHRnO
         b49rVJwWU2vIHKHsCTQmeA4V5ux0SVutCfBBDmojxjWLD6Yv6aN6gwCOI/ATT+yxPjOQ
         mTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788911911; x=1789516711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWeV1W6gcuI/MozGquhzyefyDY1CKq1VISFtq6ltYNM=;
        b=LSY3knQLICkDR6teLlZaiAeQNYT4+s7mZvOoyggPRdUAyzQg1XKd+Q1J62HqHeOy32
         sp7BFvTczPX4nZZUjvftG286Wm3baPK4yKimXYvYRSiZHmsbGlFB+lNcFLZjt/VG1a4n
         Xixbafat2dj9l0TdrjhWVU4coXh+HeMz4rbdSgNLnRBDskGQLZ/cVk+PhITiBVv9gHt+
         NasDmjtm4Y5fE+PYlHnQcEV7f0BT1K58Jr6JypLZosM1YfRxSi+XHP9P96VdVqcDRNk/
         DPgQsllLCKq9CCCghBIh2PJYOQrLULcw/3SaEZgL5gdCeDotp5o4SdnSjGS5Yermr6X0
         d8vg==
X-Forwarded-Encrypted: i=1; AKwUvBy+OQYWR7AAgxQl/Fxz13dNsEjrizWfUVFVGOIQ1VR5Iz+dZO4qrr+rkbTwxU7yXMSGeE8ZCWQ6Z3MfgFqdT3L5@lists.infradead.org
X-Gm-Message-State: AFuF++lgqXmxxFjufjnrq9F0ozPJdkc1ZkHOyB2JEStNq4lBF8DALSdV
	4XNQU8Wozr6qrhaFmqxFzdedlVLCgoIbidrClvOT2CsoTqC2arVK18ir
X-Gm-Gg: AYBFou0W4cAEEOqmYPGuENJfp3EKicb0ngNbp4p0ZA964lV7T7/WL43VIaNm26l+Xff
	+z4fiOBQsJl+FPQFTNlokanGgkuDwOqGbDwuyY4jAFgSX9/2Ngsebn6ETk7M2Gh86Cp3NTeqsZE
	ujupQCIWDzeGE2CGGxu1IYRr4CrVOfSA7U/s2Otj7oVPKzWbVD3ufv/ydjpPseARu/duLuLOCOY
	XtwyClPtEXNxfZM9KD9OJB+Pb37etlNEwxfMnnB8TACbgEjqxp/jy85oEfD/BEmZShTdT7KEJCg
	mivnqz4qviOk32Xh2m81M5TQt9Kl0wDDibeMesEnSL+MfwqqqgowXyH2e0/C5bs/SKN0wzZjuCJ
	p5WWvH/g+2l85Opa5f6cVxKiUVTK5EsYHMOJkkTyXxuiKgYN7Orm4qPv8RYQh/B2/QWOvCu7ULt
	whCl8MYbq+Gu+hjMx8+7ZKBvYGInzVtu9w67ju+nLsC6okka+Qi+e6w73h9eGqvtr2ifqhO1auv
	iI=
X-Received: by 2002:a05:6512:3e27:b0:5b6:424:2b08 with SMTP id 2adb3069b0e04-5b616f5875dmr10045629e87.33.1788911910601;
        Tue, 08 Sep 2026 16:58:30 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b765652d3esm127328e87.59.2026.09.08.16.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:58:30 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
Date: Wed,  9 Sep 2026 02:58:22 +0300
Message-ID: <20260908235824.665-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_165833_793102_656437BC 
X-CRM114-Status: UNSURE (   9.90  )
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

The NanoPi R28S is a router board from FriendlyElec with the Rockchip
RK3528A SoC.

Signed-off-by: Andrey Korshunov <razor1702@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843..1d937795a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -340,6 +340,11 @@ properties:
               - friendlyarm,nanopi-r2s-plus
           - const: rockchip,rk3328
 
+      - description: FriendlyElec NanoPi R28S
+        items:
+          - const: friendlyarm,nanopi-r28s
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPi R3S
         items:
           - const: friendlyarm,nanopi-r3s

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.54.0.windows.1


