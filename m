Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A8DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 06:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/i3lJ5UnNUwnZHcBsmIKwojuviTql3djQ9HFxU9mOWY=; b=wsjSrhWRLm0iU5Eqt92oUWEp14
	MMmvBABAfvSgPRl7249SZ8OTbJMB6BK2QgPauguwIjm1nwbXN4lnFqC5d9ytptW2iYnR3TQL3+Bkr
	5rPA+xT+bkIQbmfwl/VeBp8PxmSw25sWo/jYTqvQm8yU3UTFLXLo1d3E3hvqNnOx2YXH5w/hF05gK
	e1woYsw0dB/qA9lj0SFHn8QIMxVvwnpyki0vB0IhbjgtL0pI6vUBnAeJemh+FBflbvQUaoIe/PVgJ
	TAmAVEL5ewGfPnTvoW48tZczLeiqd7qjQXqMrahqfXdKG4GHJYkX8Wqg1R/Z1A8W1VH+nnzdKIJ35
	zWtv+fgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37pT-00000001YDA-0iYa;
	Mon, 29 Sep 2025 06:57:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37pN-00000001Y93-2Zx0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 06:57:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-26e68904f0eso42143935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 23:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759129061; x=1759733861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/i3lJ5UnNUwnZHcBsmIKwojuviTql3djQ9HFxU9mOWY=;
        b=EEF5i1OvFw3kXabVhuF+ksVM5BMUYaW2nJvh9ASvuPE+p8xH/YVs1ojGXMnM3A80wb
         7JKnx+UmMqVw6U35VEdiud6eufQniOIuLNxTkLBe/Fm5ntAUzUtAEXYzQe2QQBSvSbDQ
         /Uvj65sp+p15UFUzZNTnrOSJQx2xqEj60/ALT2eoTHIKCdligAwtQnCcB4O/bArYwlXI
         q1p3RAUlwhrhiB47E5GNLZPaepf1hc8HnKgmUCUs+wrsuVYkgN3Li/5rB8NW5utmeZ0S
         WgQAZb+d+P1xcHPQ0iJFps5U+SJnM79BQP2tt50bP+oLdxkrm/jjMruF4PgMQemKtk0a
         VO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759129061; x=1759733861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/i3lJ5UnNUwnZHcBsmIKwojuviTql3djQ9HFxU9mOWY=;
        b=ZbBcK2q+Wb+xaxr6F0M6CPaIDk5GydnDyl5zMW6H9Tou/7cH91/eaaEBW6vfivYqzL
         N+WN7Fh0ZAoEN4x3hH4ZmZ1JVJRp1OUHj5V1N2dOlynGm+1KY2M5P50ihFBvNoTHf+uK
         gNmnFcHxP6QocpIzABcW0XvhcgrGoSggjCIC0th9ejY7nNm9BoMVHQ7RzwzknrsooBqp
         WCj8XTWu++LWIiLOEYM1R4lblcGoV0Oa8emyh5n/LSBUk2BI/NLsxSfJpFBCL2KSa/5P
         D3cNCFIIbRF76806BMYJofDnCk5Uc6eC/qNxMyBormLvfoWWEHXByb/IQulGXq4ASx2A
         4O6A==
X-Forwarded-Encrypted: i=1; AJvYcCX26PCfEKf1dEQhgTOAMujYO2+CYYtrKlyD+JFmI+lI7eFZWaMGh2aKu0jqFUTK9CWU1usCXjSZjLU9NODYUUDK@lists.infradead.org
X-Gm-Message-State: AOJu0YyCbIKbv46X8jPVwNybVxsdLLPaKlm1KJ3zq/fqQmzrd74iCIk4
	usduGZZEX97air/kWo1UyPwYApmLxxEsyYHUzWWSAtJIvg9S9cWx9Rpn
X-Gm-Gg: ASbGncu9DPeC9XA4VxXxsDgom6+p9R+P9I5B7kJiizjo6JI65TAjA0nIPLDA0oKVGm6
	rdeHp0GLcgPKEZ4OkMoqbnTIqvI5ivjm7/vhgACfLUU62NJ9Xbc1ITGVkytS9d+eF2Z+obca7XZ
	vPkakeLjB6AwN+hqAb7B4AUD6DM7iD35zcUiNlTJfX9800G6MUvOZo1Q2HL+LF2jkK3+AFLHq0E
	NAnWFGm4DZ4OQm9QMy4GD2O7G+s0muitsKrRBtXd2KH9oGbpimoZfNM7O1SsiEwJBl9/o5QU+LC
	AAJiPun+kbMRMgJ6t6SO1SE9mNLgKXVZrdR0oMARC1cpkDyEDx8leZCUDfW0Ln/pDcMGORqHSUQ
	XGqjY7qG6pRWdBJTyjFLb09LyD2RLwhJRmGdUrAL7VYI=
X-Google-Smtp-Source: AGHT+IGXx48956iAsgN2mLQXj+DWiZQ/oeB2pwDmDud/7PQv/mcuFlsHf1iG+3XAh+OJgY293RcZBw==
X-Received: by 2002:a17:903:3bce:b0:25f:fe5f:c927 with SMTP id d9443c01a7336-27ed4a7f364mr157596135ad.31.1759129060832;
        Sun, 28 Sep 2025 23:57:40 -0700 (PDT)
Received: from localhost.localdomain ([120.229.16.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53cac77sm10549595a12.17.2025.09.28.23.57.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 28 Sep 2025 23:57:40 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add LinkEase EasePi R1
Date: Mon, 29 Sep 2025 14:57:13 +0800
Message-ID: <20250929065714.27741-3-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929065714.27741-1-jjm2473@gmail.com>
References: <20250929065714.27741-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_235741_675314_8AD07090 
X-CRM114-Status: UNSURE (   9.75  )
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


