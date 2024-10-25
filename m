Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F76D1171C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8XBC4RSh8TfpYO7N1cJ3hGiE9IZ5JY14wIot0+OdLjw=; b=zJKwiv3244JSR3
	Uv+qSfRVpZUsQOqFb8WVbFNw/N7A9vTSx2Kn4+9CoKIS6Vum7adYsSz8q92Bs2vxXYqSeJaAcwxLt
	Xr8m7pICPcgidhLTEZrvaGfKcJILgDEXq0j7ObW7IdCDmrk64nF+Qs5L7g08KIwT/yt5TLTkuJ6b3
	iFysr913S0vnLhfFyTkjG/l1PBVCOdALXJ97245wqqMjCo0aNyeHbFJOzdclfwfSfxRsm1y5WPtid
	kFYe9PUHnVKYl/EVLKFjH/emTyVWk11WeY/hIkfFKoVB5yTw3H5Ynj1oivGa4tQmTwpvLxG54DWYA
	jH+ackjy8ot3NUk6SPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FKB-00000002ukC-0CYA;
	Fri, 25 Oct 2024 08:05:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FIX-00000002u5M-3OoC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 08:03:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20cdda5cfb6so15431225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 01:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729843432; x=1730448232; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XBC4RSh8TfpYO7N1cJ3hGiE9IZ5JY14wIot0+OdLjw=;
        b=cTYoDyE8YyD5TppElhs9Q0yfAc60GdFEVOIEJay6MhZaKEcG/l6WyUK3SC8e7w067X
         XloXtFISJy7WKg/JmKitc7oHC+0mEL6IRjh891YXV9FQl+cdaDcXKLGa+jLBPrTEkGVz
         +4xp1G5yYkKc/2UG6//nMcaA+ICR69LWEStGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843432; x=1730448232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XBC4RSh8TfpYO7N1cJ3hGiE9IZ5JY14wIot0+OdLjw=;
        b=CVTKn2gKVO3QbQcZ6Dg0OfQR31ZelUv3/xaU5eFDPo4T4GD7tUgGrpMr38flZk9IYD
         HRopXy6wvOUwOtdpkexqvL7kcQCuUtecvFPQ5w/V14F7hcicJVLM63utE/RhbqGkls11
         8CygzeobpNqnYx7epGoPriEGh6WJ12QU/p4+qYx4uJx0aGdNAENUBkRkBLx4QamSR+qv
         ygYwS6G7HjR9Sq1jti1D75Ttz0i/hhUYxFwUc19RDyjyOJX6BIskJZrpv2xLCPZKgkI2
         jvAsdTNPPoMg+zIaN03HBh+kgVmU7NeFQXhNLdlRj9o6iSEcOeGLhDaPSWZbAsNGISxX
         ecOA==
X-Forwarded-Encrypted: i=1; AJvYcCWbHltcAPhbeFnps8UNPxE7jJOrtRMfG7Vd2tg/nlRYmt1s65Ly3tyjvfKycLjN51vAcsv980A++fvSNHlR2Oco@lists.infradead.org
X-Gm-Message-State: AOJu0YwltsNf4wDuX7/m8CxgnhwU1LvkK5XpioAKY5+w2JOPeEKVoF6W
	Y6vcBW43cZGe+IfQNgfxA6hn9pCuiEqQoVy3JKLHeWPuCuBwVG5fz+WWgiCPxd6A7u2wfAMw+nI
	=
X-Google-Smtp-Source: AGHT+IGn2s+chrglz5njxh1erJWL0JkpBhiVbjoyPn5g8eTfhQo4rJVyhvThXay1WwGBJaAL6fX6dg==
X-Received: by 2002:a05:6a21:3984:b0:1d9:275b:4ee9 with SMTP id adf61e73a8af0-1d978af6913mr10351102637.15.1729843431913;
        Fri, 25 Oct 2024 01:03:51 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:5a9f:16cc:8d5a:55e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d025sm558120b3a.101.2024.10.25.01.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:03:51 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH v2 0/4] arm64: dts: mt8183: Add i2c-scl-internal-delay-ns
Date: Fri, 25 Oct 2024 16:03:47 +0800
Message-Id: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAONQG2cC/1XMQQ7CIBCF4as0sxbDEK3iqvcwXTQwlElsMaDEp
 uHuIjuX/8vLt0OiyJTg1u0QKXPisNZQhw6Mn9aZBNvaoKQ6SS21YGWEpce0id7WUeOVSDqo/2c
 kx59m3cfantMrxK3RGX9rU1D+KRmFFL1xZ31RaNDiYHwMC7+XY4gzjKWULx3Szs+lAAAA
X-Change-ID: 20240909-i2c-delay-6d202918ee0f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010353_905840_52DC16EC 
X-CRM114-Status: UNSURE (   8.86  )
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

Add i2c-scl-internal-delay-ns for each device.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Add missing Signed-off-by tag
- Link to v1: https://lore.kernel.org/r/20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org/

---
Daolong Zhu (4):
      arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns

 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts  | 3 +++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts   | 2 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts    | 3 +++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 3 +++
 4 files changed, 11 insertions(+)
---
base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
change-id: 20240909-i2c-delay-6d202918ee0f

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


