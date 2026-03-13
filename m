Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7F5105F7A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qsmU3+KHC+79pXEFoWAli1oSj80e3a/HpsprpoFgQoM=; b=aw/9Ivqc/EW7P94eF1QaSOQI2Z
	DTGc+ZQD/IJ3E+QJd9CBakhW5yH5rps/B8e7rQ5XQPmMnzFmhDbGTLwGMldlIlKMPim+F8yGGbCVB
	sJO8bD54usj12lijnjEtqiMeq+s9ihPWl4XR5yWVdZ433coGDEE/7TbhnIeiDYKwQeZihkzO+6euP
	OvQnGXX2EyQCGPTLV7EJ78PiXA8bJIlvJNmQscswc+LUWO/74tfj9MV9vKJjxxogLxnL0OfudB9DN
	n497TfDW3mPRF6MPMoUd1ciHCS4KmG13CLXv0Nf4fSdaJhqPRPe96/2MmFJdxzsn6N+FycoFYqTKO
	ToPm1Tww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12G3-00000000B4F-2hku;
	Fri, 13 Mar 2026 13:08:51 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12G1-00000000B3R-0LTn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:08:50 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2bdfc4b191fso2488268eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773407328; x=1774012128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsmU3+KHC+79pXEFoWAli1oSj80e3a/HpsprpoFgQoM=;
        b=mL90c/iriT5Pbspmcs9lAT9wFV/B5yDzGuH+JI0Vz322fvdpcHOQKhOXe/rK9lge6l
         M4VxmpnofOmY23t3alYTznH+o3UHKdSPkRL2F1FqCO5jgCMd4WgM0GsoTBXy0Rr8jm7/
         pE2+gjdoWWp5JmktLCrnBZA5Vr+SlmTdqXDXbwt3C/Xh7OIYvJujwY5hBXet7fE37ksr
         sbQvDgnkFVqlZmrDpRYoLSVerrdVrcj/MpdPUyLZyaxoq1q2PDaPMRXUAVcB8W0hpVWe
         ygaJElS1p7fEOU/fSSvPBMoYdicJBCzcLh6CXyx8lvgl0JnqhAQi/MEeAbu0/oH9pl7R
         UcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407328; x=1774012128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsmU3+KHC+79pXEFoWAli1oSj80e3a/HpsprpoFgQoM=;
        b=KceFpEvJwNqTuq8Q9R5l90Fm9DmOgqhwmwvLCq2O6nYuSgrASTYAxTVEHzg7tqBLYg
         COE5dvvwLk0SVe9zwvB2j5wBY/n7uK3wb1ApUn7pAU9Gnth7Aq+KkM/mhg7+x3PzF2l/
         BnkGvcgvHV2jMEy9qFgRPY87DfD68drWav91BUhHkQS9ib4O+G/+cO0taTPZopdvwOkk
         1B0NKr45osUIG8uuBcTDXiylZt+CCTB2BDedY7gYdvD8FlLSlcqwtJSb41k0BLRzN5bg
         FQFEuVHyHY2g+iXHVsDYbQdBzXpqiFW9HM38M8SFm84mdfdC+tUnwpbDMZMr1aX5pHX/
         +89w==
X-Forwarded-Encrypted: i=1; AJvYcCX7bD3x+EW3qooGNtOHadsj8A3dEN39neEKwKl9/0Wd1CzLntSHQQjewd3qYiqQ8uNq+I/TcLT5EeYGqFHzHS50@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk9AlqcYM76kRl/MI7s2rD27GkqTlgo0QtjoigIz6FxS3lufS5
	tKRXK+kkIkHPRwiyQdXPKY3EDTuznb1e4pKFRa5SvfFYYOpee4CQnked
X-Gm-Gg: ATEYQzzCocxgnO+GuzSvNOQwbuQpIlK5IkayaK+QpdPFLrwm+FOC2YjHmHe7sNfKVzt
	PygmN3bIApyr+wxYInZMGbVFxF55rTza/TIdbH0KMIXGMV7H+aaJQQKSpYJVKSbBCxur4rdBQLE
	SveTfXV8Mq5ui3yojRSle87mKevELi8DwaG5na0yMBZp79fW216vRxObKyi07pfpfbFPWghQeK3
	CXhMWYC7U9xpOhFQV5OmRGt4uy31GNOuyiC2f+4x+D8yrxs7gLKWWBWbUPItJTO5UXV+TqLpgdP
	P8rWthE5HJOmdyIvPZrOn/BB9Nsv0r4VYd4r4xr/dJhfjQoLe1D/KQ+a6zxNJ0x6GLDs2/bXEdo
	huiopSXzbXnY+6KIh+VoMakA/yT1oudkTZ9SJf2LFpLPOhRV3s3m0BqkXToJ/Y6DO2hS7rrFhGr
	rWgwhXFyyKpulsP4+Vzfwk6JfX0oa2Kb16xxQ44mIrf58RfMgh9gJSh2i3zC4xWGzRtA==
X-Received: by 2002:a05:7300:6d23:b0:2be:19e:3064 with SMTP id 5a478bee46e88-2bea547d159mr1501145eec.11.1773407327739;
        Fri, 13 Mar 2026 06:08:47 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:148f:b6b5:4:db6e:9a2c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab5706bdsm2831454eec.28.2026.03.13.06.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:08:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: ulf.hansson@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	shawn.lin@rock-chips.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH] dt-bindings: mmc: rockchip-dw-mshc: Fix the RV1103B compatible
Date: Fri, 13 Mar 2026 10:08:35 -0300
Message-ID: <20260313130835.708066-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_060849_122666_4F3EF256 
X-CRM114-Status: GOOD (  10.76  )
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

From: Fabio Estevam <festevam@nabladev.com>

RV1103B uses the same DesignWare MSHC controller IP version as RK3576.

They have no "ciu-drive" nor "ciu-sample" clocks and use the phase
tuning inside the controller.

Fix it accordingly.

Fixes: 517b1e3c9455 ("dt-bindings: mmc: rockchip-dw-mshc: Add RV1103B compatible")
Suggested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index a75209bd2710..4965bb518c54 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -43,11 +43,14 @@ properties:
               - rockchip,rk3562-dw-mshc
               - rockchip,rk3568-dw-mshc
               - rockchip,rk3588-dw-mshc
-              - rockchip,rv1103b-dw-mshc
               - rockchip,rv1108-dw-mshc
               - rockchip,rv1126-dw-mshc
           - const: rockchip,rk3288-dw-mshc
       # for Rockchip RK3576 with phase tuning inside the controller
+      - items:
+          - enum:
+              - rockchip,rv1103b-dw-mshc
+          - const: rockchip,rk3576-dw-mshc
       - const: rockchip,rk3576-dw-mshc
 
   reg:
-- 
2.43.0


