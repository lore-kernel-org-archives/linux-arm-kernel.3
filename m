Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0CC83F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHZe9EgIX5bHoOn1lRHIIocbOcsSd7x7FE0vB7xjsvo=; b=K4Z6PGhnctpUxQfZIrPVkb4Cy6
	SIUa0ycw+/VKL+6Iym3pmkPSnSwobbcH7+p7866J6qCZZq/kLwnJ4JlO05dBCMGFPWCSki8zgNNtG
	+Sfd4AhlovAeMAHZuFxEF/Vf3+O116p1AEdUzMB6eagrZIYG2lTYeCZUay26iNmeAki9OkzAphZ/0
	vMEK3dp/hMoLZq1nmZyUztODGZuiYe7knFHSdocbMZ+8v7S+A8T1NTj1kDBpSfGLHedCSYrmWQBrS
	6zAPHBt1WsYgMhjeXVHxL2B1B7EkZa+y7HaXbYdfUWw4YPo+7bixQfIP6wx5pvrOyTrAj+g9y8lEx
	cwbjK08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udYme-0000000Fb3H-0Yqg;
	Sun, 20 Jul 2025 18:29:12 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udYkE-0000000Faus-3GaN;
	Sun, 20 Jul 2025 18:26:43 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso2668120a12.2;
        Sun, 20 Jul 2025 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753036001; x=1753640801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHZe9EgIX5bHoOn1lRHIIocbOcsSd7x7FE0vB7xjsvo=;
        b=CwenShLlVReP8OozMAylKF/H8YdEJfnUYIjFAFWCAgI1l0HfigWc40jllMCwPkfxCv
         I/Mp1KFgbws2Ta49DgcXBdE8QPZH7i/DZFIyFCpWaHEZGNU6PcVuFIEpsyPRxTQQ6M9b
         3YY8VqAa6kVP8XVoVWcRvm/B67PgXL/Js3Q1T4xMYwKwo8libWhMz86CFlScX16nBObf
         c7zyNzDqzEUf79es71fQju34J2fHvyOOi1mFbJo/96gHbVjQ/5q23m0CEpgs4bXOno1t
         7khyUn+HVhwSazB5e7HAvypf5VyUwdg9/jNXBRzuBAlTWu6QQSMXSEbVtAadUs/vxZYw
         LLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753036001; x=1753640801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHZe9EgIX5bHoOn1lRHIIocbOcsSd7x7FE0vB7xjsvo=;
        b=c3dAMf+95xSIHJVc9aggeHPvx8KRuV09fxO43dc+x4/iJhyU+6AGFVG7BiHW6VebFp
         16il8cB1BhYE3r5vcHdOVTE72dSbVk4b8HUBvtFqeSt3cRg/P4sgmiSH3r3DeoKswpxg
         Sql/fnFQWxTq6Tc7fD7aaj8xQOJaKKrdT6NFyZ2f4CyfPj5hF3LJvQFV7wUltyu9h4UK
         VurZNU9XzolOc1c1gDJyGT7YxuIITWQa6KeYYITz4mVoLnE/+MuKIuERP+7GV/6BKOlC
         rlK78Mti/N7SR/m3kYHkqjA05FbUnCNoRxX/PwXb9ze1QZznCgGmmOPj6YreZJwsw0Ba
         XLqg==
X-Forwarded-Encrypted: i=1; AJvYcCWbNFPkDs9Kc2lGtedvkrMwR1EEb4CNlBhLFWpY38Ejo0XRyVj2h5neO+TP0Qhv9rbCh9JabfTbx6Rv9NQT@lists.infradead.org, AJvYcCXsBAwfnD4tzGehOf3wBr3KOSD3rTyoSsQ6ldeh8ctzA7LYUQrpf5zYITuZgPHTjPSs/sbovlJLKG6DJdoTaDNTtA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye9NBMWrn6SUg7GsTylWWZs9+0BOP8PBztULs1oXM5IBcxNolE
	WbtD9eQjLj75gD533RRzPyQ6NB4AcAFKRJL9CbxkVwFYl+PjwMug5vQz0+VnIpDPoJQ=
X-Gm-Gg: ASbGnctnznAbYpUH5AUoTfiFlQ3awVH5PKo6LI/xE6YaE5lTntqluqp8HiB9oN0tusU
	xHAIWCTsnrSry6W7wTydKkDJFbmYNQv/tpiheVC5iY/i3ejQXKRlAqRPGg/ky1L5tMH6qp5umjO
	3SP/5OgCBys1GGdoq6ZFvGKtMbKHbcSyzRFUp1pK8xUo74fEIk/QZSnPjZtvP/qMLvK4TLywSnt
	Xpmb08tVevBM1VgipCpgj5TNacOjGoUXrbqj0lOpYZTTvZJgxGj8d/QmHiFKRdNjwLgKJxOO6v6
	piYD2hLMXcaqMNIGEvitc/ECfBFiO/mKrYAnl5h7Xpa+P4D8vJ8yv6gli405QWYUq+i6dw==
X-Google-Smtp-Source: AGHT+IGoGfPH4SczPPgpunZElQl0pQIPgpNF56UBU7IRRaCJpTzKmfW9fc9yllKz3BFHUR8wc4vQBw==
X-Received: by 2002:a17:90b:4b4d:b0:312:e445:fdd9 with SMTP id 98e67ed59e1d1-31c9f3df4d6mr27338628a91.10.1753036001293;
        Sun, 20 Jul 2025 11:26:41 -0700 (PDT)
Received: from km-host.. ([49.207.192.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d2a82sm44634475ad.156.2025.07.20.11.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 11:26:41 -0700 (PDT)
From: ">" <sanjaysuthar661996@gmail.com>
X-Google-Original-From: Sanjay Suthar sanjaysuthar661996@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: ribalda@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	sanjay suthar <sanjaysuthar661996@gmail.com>
Subject: 
Date: Sun, 20 Jul 2025 23:56:27 +0530
Message-Id: <20250720182627.39384-1-sanjaysuthar661996@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CADU64hCr7mshqfBRE2Wp8zf4BHBdJoLLH=VJt2MrHeR+zHOV4w@mail.gmail.com>
References: <CADU64hCr7mshqfBRE2Wp8zf4BHBdJoLLH=VJt2MrHeR+zHOV4w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_112642_840646_CB5474D7 
X-CRM114-Status: GOOD (  12.23  )
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

Changes in v2:
- Fixed commit message grammar
- Fixed subject line style as per DT convention
- Added missing reviewers/maintainers in CC

From 5c00524cbb47e30ee04223fe9502af2eb003ddf1 Mon Sep 17 00:00:00 2001
From: sanjay suthar <sanjaysuthar661996@gmail.com>
Date: Sun, 20 Jul 2025 01:11:00 +0530
Subject: [PATCH v2] dt-bindings: cleanup: fix duplicated 'is is' in YAML docs

Fix minor grammatical issues by removing duplicated "is" in two devicetree
binding documents:

- net/amlogic,meson-dwmac.yaml
- iio/dac/ti,dac7612.yaml

Signed-off-by: sanjay suthar <sanjaysuthar661996@gmail.com>
---
 Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml      | 2 +-
 Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
index 20dd1370660d..624c640be4c8 100644
--- a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
@@ -9,7 +9,7 @@ title: Texas Instruments DAC7612 family of DACs
 description:
   The DAC7612 is a dual, 12-bit digital-to-analog converter (DAC) with
   guaranteed 12-bit monotonicity performance over the industrial temperature
-  range. Is is programmable through an SPI interface.
+  range. It is programmable through an SPI interface.
 
 maintainers:
   - Ricardo Ribalda Delgado <ricardo@ribalda.com>
diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 0cd78d71768c..5c91716d1f21 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -149,7 +149,7 @@ properties:
       - description:
           The first register range should be the one of the DWMAC controller
       - description:
-          The second range is is for the Amlogic specific configuration
+          The second range is for the Amlogic specific configuration
           (for example the PRG_ETHERNET register range on Meson8b and newer)
 
   interrupts:
-- 
2.34.1


