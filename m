Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF3FC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLaEkJkOM/bblPdjJj80Q8FaxdewKpE3ij2aO8k8oV8=; b=in9mr5hm51rFby5jEVD25fu3gv
	bDM4tJOYRceBiSX6VZxItem+M1V69Qpowv/yQI+6+ffHSltzLrj9vVyJaoBKjI8E3msHzXptxVTLi
	XTvgIJRqkmY84IQemiJ7/jJAL9UwBAoRTVy9ptbGE7sNxkCgnUUOom04cVwKAsVUe1qjCRIWSREBK
	l+DVbcvXDGvFX26e9HufdmGq/hewrsud+EotaSDs3ZmCYvAF3nQFmcNxSOFQgzXbAO1xvccTgLWoh
	fHavshAAd8Wrcf8tmkL1E8JI96ie58ckJTtIB5wa2KRo0XZ6dBtt3MEs/Hlj5TQSZWgCjrVtQMW47
	0j8itW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Ko-0000000BeWh-0xQv;
	Thu, 20 Aug 2026 14:01:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Kg-0000000BeOG-11Yb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:01:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso16003495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787234484; x=1787839284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLaEkJkOM/bblPdjJj80Q8FaxdewKpE3ij2aO8k8oV8=;
        b=JIEqrDH3D37tC0BlBfl44zucyXTQv34mQfu1TjbLUprDYbLfLj7QDOwAVgX+VYnOi+
         lBHgJKMja8rbXxvWsSg2XgmyZ5s0mFCYkqaSFNmahGFv7z9V91c9XMQaAcpTefelaMNj
         whmF2oeu2bfdXId0vrw2Cvy1cxj+9Wcoe1KZYEOdi1gjxDs4kH5/4kMIb58wjhNnuKqk
         3nD62u2gFy74sJVnfUwfk0hadYs640Z8aDUyJXz7XARz9FVfj9ibuMR+9mKIDRlxZIRC
         MS2h76GsSQb0MWqSvF53JIC43g2ZuOB4pp+kI5kivQ5ZFNFsLg0q2l2qivl3tmY941cV
         kbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234484; x=1787839284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLaEkJkOM/bblPdjJj80Q8FaxdewKpE3ij2aO8k8oV8=;
        b=lqNc20kXfnbl3lAq0Hy+SX3o5mthSAPtvuVhJFga/vKcujKA3nLzf62j1tvzXb0yzS
         tVlr2lavFIMJh3umufustktv5AtpX1q+YHsZhuDKhi1RFGOJURWxpZifaCiXMxzFvwxn
         d6bovRb8O5nViLvKOdtTiN8QNL4Mi2BY6U9VUkoTN/H/xHftnSE3uvk0BLCkM5KG5idN
         LQn2TmljcAWxixjW8FGWvSTBtn2TOFJZphMH5zZTmLQ9WMcqcNS21pUsBf2OpPfa+P8i
         htsPY9ppZzJ3G1N3T/8nA4kVM5TctlzVbonU1ZMiyH7ePjpjfUUuS0HZosGqUVVLuXP1
         v40Q==
X-Forwarded-Encrypted: i=1; AHgh+RpZ5SYzfoQGFkob7sGh3LXnGFWzkghbxLz2S6jgVFrgqSvUELAOWlymWL0oVdbYyfBI8us9J7ap61dWSUc9xL4H@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2JA0mMTA72Mqv3ZtbJUvnj6CXIa+7fH0GFrXckdmllVodtsl+
	f26JE3y2ok9XYmcFhbAG0O5EyA2sbXS30rZaDiiYx8NZ6aBitlBTSjfN
X-Gm-Gg: AR+sD13pihJFckz/DzgIvvrSi+HbTXhsKZAA0ghWnKJ7GFYEMVo5xviyODXsW8bZVbW
	iYab/ZaGidiFO83qVqFZRns9Qgzonr9ZGI3XKUy0XlVWR/bZUy1oNqsGaYNr9ZezPpSXjWLEy+n
	GBCd//x6k05asyRRbYlmbAOeauOt+a9j7769alszVxGnIlcnh++jLkHNj9HrFAmxV/I32+gYyPi
	lDZiOtSyyO97d8FUj2O5gnjFpUB7onqLknCyBhnhpBbavb/B4I/XAUO1bXbcL5MAdgch6zhHShZ
	pjMFKtzH0JPA4ifT+NuceNYPRGY/CGsE/luNnWBH/I+oVa0GiSKgrYrj/bKY1SAy1RaiHK8Sl/O
	psJKG9F/OOgcG3ZLMSujEpZapB5p/I9Mygbimy5mfLLVrAbs6P3swKxDSEprfLyewCWQf3fC9bR
	r1asmjG5lzdtk6SZp6plE5EH9eV1cF1EQKZAb6pojsjoKTY35SkQKL56u7grXYOXkdr3+gUqv8c
	1XHLGX7s8sYR+yhHdjIxDq7MPeeQfLLOWgSiil9qQ1yA7FE
X-Received: by 2002:a05:600c:1c22:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-499aa1f5589mr213200385e9.15.1787234483988;
        Thu, 20 Aug 2026 07:01:23 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0e473dsm137978275e9.15.2026.08.20.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:01:23 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Thu, 20 Aug 2026 16:01:09 +0200
Subject: [PATCH 2/4] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-rk3576-dphy-v1-2-70e25e8d5e78@gmail.com>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
In-Reply-To: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787234481; l=1206;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=PQU26xP0GCgU75+6oYY/FD7rSTDen5UQ3ddMVoJKHtk=;
 b=vVatJWe+TLIe1CZEaI6WT0B5tUQdWfTEoBKH00j37Vospx7fXC+76eafe1vUDln3ztYdagCAm
 IVW7y6akOZjA+GI048Dv150feOuZLDXjs8YFPTR6f8zv8l6/jhXfJoD
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_070126_302938_1E555608 
X-CRM114-Status: GOOD (  11.16  )
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

The Rockchip RK3576 features two MIPI CSI-2 DPHYs compatible with this
binding. Unlike the RK3588 variant, each PHY instance only has an APB
reset line, so add the new compatible to the single-reset group as
well.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 03950b3cad08..92d0c961f4c4 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -21,6 +21,7 @@ properties:
       - rockchip,rk3326-csi-dphy
       - rockchip,rk3368-csi-dphy
       - rockchip,rk3568-csi-dphy
+      - rockchip,rk3576-csi-dphy
       - rockchip,rk3588-csi-dphy
 
   reg:
@@ -89,6 +90,7 @@ allOf:
               - rockchip,rk3326-csi-dphy
               - rockchip,rk3368-csi-dphy
               - rockchip,rk3568-csi-dphy
+              - rockchip,rk3576-csi-dphy
     then:
       properties:
         resets:

-- 
2.43.0


