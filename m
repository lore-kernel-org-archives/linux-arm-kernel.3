Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE2ECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Px4DGTedr0t+HqBVc78Zx84UzxWlcHUehvdoHcOj/G4=; b=NlQKzQqMnNgzh6DGDYm6oICrD9
	la8SKMP8pjxAOAAijI5roC3KlRnT79BTcScNc5kkun3BDoRMgX3cSeePUnC2BbeHG7hS/Ied6bayP
	4y9cgb5fkJEEdx6aZoiRiT/1/hKnGgPp1PZMxRI7TPu+fo1+ovrvADpNfukSDZaClniJF4owHft+A
	QKH4KsfjjcjTY3egERySgYVoOEgy5nmLENo9b2DPMmKX1XAJgiqidNyEMi/+DCMEbw0NXcjDpie0V
	gSQYnHumJLP7yZyAKYvGXGhXM9OIJqTQrJfOBK54bpT2hk5bgXcSbK04/VT/MFYWX/51eLk/UuwrG
	Gsa7vZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1s0-0000000CQie-2gj9;
	Sun, 26 Oct 2025 14:37:20 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1rx-0000000CQi1-49rx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 14:37:19 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-b6cea7c527bso3665473a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 07:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761489437; x=1762094237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Px4DGTedr0t+HqBVc78Zx84UzxWlcHUehvdoHcOj/G4=;
        b=EQuhSijZ+JedPU5KZUvXLTUlKdRPGRujOxGBPBoWWYghR19mfFhnOikeSpi/25sLt1
         wFMaYdOKDRGJHZh1hbR99RroIIEC1easIbgcNjELSDqjO6c9KOjSoICcR6Fq0TGP7pKH
         /KqDT4lMV9+FAS/D28Q2/mx1OO4n2c9pTo6t27ZjGZoVXbQPIeMh8Tg6k3/EaY0s064x
         uinriezK/88ro7LSSwJfhxp+iREyS1W+W61LH+aEtVPoIhrio7IVnxFfIGIMf+Uf/12Q
         lmi3gA0alYztKPwAWu31/dFljsHQsEfc9Lh03/PHJWsahugL9Nr+RwjkbSe+R2j4qSFt
         CrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761489437; x=1762094237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Px4DGTedr0t+HqBVc78Zx84UzxWlcHUehvdoHcOj/G4=;
        b=rlbT7yk6477m+kjpwpRcEzP9CwfLE6pco9P4kvW0v+TqDQhVkizSCAngjAFaRTxt2o
         o97pRsuA1mzR0m/8OFoD+poiKp+y0Sa/fh0Yo0/AakKHDWZW/BQ51B9HgJYFSJ/3XLik
         Y/yC80hU8q/r8HpB4lryljgCOAe7eu1PeHwfi3Yg76tJP9ds4qgOYq8hkxQkJwr0/hiz
         gOyU5ijIc0143qq27DgzIYoRXKHZUE39UNYEbWF+vldWzQLxmIhbLzv/pgBslkXjoMYm
         7ZAZYjc4iheYktx3btNONTBIfaz2DPQoGIoaAQGxTkRJ1+qDXGTgP/ASBYfXksQCFBrM
         pErQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfBqdSgmMyEzKSH7yqpbZTU5LLGofsJ7WFwyqOtnS/zFX7DX/VtAJBveLsQUQDmom626QqB2dghbNMfHqD0Mgy@lists.infradead.org
X-Gm-Message-State: AOJu0YzPwaGH1kBNDYKxHxSrD6Upsc/dANU8BKmjiO6/2VEtwnK2HnFu
	1WM5T9Dvh9ER3QT4mtTmnxNpWBb5fUDnqB2LlXj/PlcuJ76XPFNDNjwi
X-Gm-Gg: ASbGnctNVkmByGILwIBHts3IddjQPG10ps+i3kyhWnV9ekAFmLeLX6dRr2cnEu2p9Ce
	ItO1ZGegpJDgQyly3UUG5RysjEuahTuPTtfxL7eLXJbBLikK9IkeeMO0bgnzBFWUJxhHR94OJ5x
	HJA7PyDIpCo3Pa/Bju/XbcLh3XPhTXamwqA1UFkSKZPdpLGYGJrovVftjdUSWDZ5PyjJ/hXyuue
	nISo4PngjZ6eFRKkV9GUbA3B3Rt722Fjua4CfUnqExZadoFShM1b+XRfYLi1Pp6TSlt964CjBlD
	GXvI1T/bxRiGOftGhQwhWGmqR7DN+mIIy/IgmQ5oek8XapTo0eL6U5S72+ZFgeM2Xl4gZBwvLe4
	Q3T1PhWrRzT9vbQbpiFhuoVDLV8WfT3ctR1qPvxQqx0jWm6qV/K0+Bl0aU2Xd89tlQz0WwyvNTK
	w=
X-Google-Smtp-Source: AGHT+IEfx0AH+HyiwJ68//xsscWnnszjfjuh908GaFcgwt1A/M2fn3D2pU1eaom3Q9nzHLoe+m5ueQ==
X-Received: by 2002:a17:902:ecc8:b0:290:c516:8c53 with SMTP id d9443c01a7336-290caf831d8mr427173395ad.40.1761489437072;
        Sun, 26 Oct 2025 07:37:17 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7128d4d44esm4652691a12.21.2025.10.26.07.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 07:37:16 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add NineTripod
Date: Sun, 26 Oct 2025 22:36:44 +0800
Message-ID: <20251026143645.917588-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_073718_050891_1D2B7AF2 
X-CRM114-Status: UNSURE (   8.63  )
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

Add NineTripod to the vendor prefixes.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d188200..37687737e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1124,6 +1124,8 @@ patternProperties:
     description: National Instruments
   "^nicera,.*":
     description: Nippon Ceramic Co., Ltd.
+  "^ninetripod,.*":
+    description: Shenzhen 9Tripod Innovation and Development CO., LTD.
   "^nintendo,.*":
     description: Nintendo
   "^nlt,.*":
-- 
2.47.3


