Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D76FD730AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 07:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GWcM9PLpKa8NgMr9TP++edAfqxjdMWwshThC38ZMJoQ=; b=c/wAO36sqQo3nW3sXpDQEIkYVD
	X6F2qjVWsojQHyt6zVADk5mDrqU4tuRtJHfXJ2BLpc2pOB3qnq3p0Kzvdj3vs8RRbiV0IfZGd7kE/
	38/FKr6ZHfhW93x2ucmube/24fo28CPsgQW5K6wkqN4ocxP3k9HvomlBuewwt/Tqi5ZAPSQw66pUa
	38+Dp3hKJ867IIgAg/koHHJwiiXc57e24otAUM/BW2kf6e0itodGYi0Ym3xEibj1PMXnm9dVWfrjs
	kh/TMp6debQn7qK54CoblLOG7tQ1sxvP8yBciOj6asiWOia6L7LK2yz4NWfJpCiEkjOb/0o6Q59yI
	K/RWhi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YZ3-00000001RhX-1U07;
	Fri, 03 Apr 2026 07:03:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YZ0-00000001Rga-3sWO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 07:03:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4889e045bc6so1384835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 00:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775199809; x=1775804609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GWcM9PLpKa8NgMr9TP++edAfqxjdMWwshThC38ZMJoQ=;
        b=XNL73R3xtbcUY6YR3qMSYeuFKheao5lT3eRBBdN+7xbOLbVi9lhIr+zWtKsuF59j0a
         /+2qrKFRT7AAjhJIA3/PlRZlkH7b3W/1cRJheStYuFPUJIIX80+heaovghOgwm9m3xRa
         6afT1Qa6wS/HMe9icc5vDCEVFjhlfv4vOhD5rpT8FyU1o/+v/OcSzN2EsXOa1BJPOCig
         qFJy5fAVRX3me32eea4UMpuzin0NBIBfyU1tFmDL5glKINTxsBByVXA7WOqMIcK39UBa
         XduEoV3LKpKlnwGIVEJxzzV915jXvVf8qyrs+soW2R5YTLQm9ONcKE1Wk+Pijc0YKv/h
         K6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775199809; x=1775804609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWcM9PLpKa8NgMr9TP++edAfqxjdMWwshThC38ZMJoQ=;
        b=TOgQf7Xr8Ps8MARDSJurU+ZqD+DqbVPBJxZVE3nl+iGqXW8J1t+pu/zi5HznSVjTkN
         BQFbtGn9MuWoQPjBx1ufM29+TLLfgmnEIUUPgSLa//K6JS5Aj2kj+RAUjDq9e9r5ZZWO
         KyL5WrB8eqtzlZOEmZnwoA4T/gCkfl+eznICxRGpKz65AthLqUCTJQcV3qkh1KrfIqxe
         k9m5kvE9DoVdCoZFssDYalO0PGQ1lgsGEAqp+kRVwc2+CD/b7bHfcUCfh5tiIXDriS8w
         LZ5tv957ZsLZhYfl2sQnoWiN3aOUJMb4RRrPAHDnV9WaCeGigfZV9/Yug2oyJ9mJUFDd
         HpbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSJfoVpnr4jFoP7TMHERLIjdCpoarVB1oYckN4l07MtgmD/3J06CHcWgHfB75o4H6h6cHi3A0Ct8MF7WSiP6o8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Q8jkP7Ej0WhKkeKzYfVaq9Jf3i9I3uWHzyi6uqpBMe2PtkBP
	ypyPA1qsi26RNdU9E0RxClzzMND4F42+dWC36SZNAoc41K2QYnNTIPv50p5ksXHHLS4=
X-Gm-Gg: ATEYQzwrcknbb5ou7tMKRE9+HEBvZRbftN0lttVYYHZNoKxgpolJSPPBI+R3LasyjZy
	ahmBgzV7FujRwdnsJJySo6vyP8OZhiy7nO59PR+5wGFPDqxT1BFSnKeN96JwTuVH8yp7cZqq4qk
	KZ8lwk8FmT3lp7vlf0urLqnzjTHE/FwR4eJo1/FatQwl68r4UhvUXDREW23BIxA2spJWNuUk1OA
	Fov7XIBo4klruFxI2cOYg04y6VwWb0yFqSMr6Bjpsu9n+n39vy1JsF7zjyZdTmF8bsNl/7Jhlwh
	VqncVbh7c2bhc+eesHvxGb3Bo1NoB8N+lWjS/1NUdsjsRvZgHvz1KXyENCsgpr4g/IAqWsIvwQJ
	eP82JFS1RieevYR7TXRIR8bXNIYWbRggpaMkIySxEAIJ60pgLzlxHhJ/MUZyjp7gQGsQmtHhkqV
	q8M/t/oVVMNyYVuUvt2Uh/xCngUu/qEor5mq74YK6Big==
X-Received: by 2002:a05:600c:8b33:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-488997b2291mr33076195e9.17.1775199808999;
        Fri, 03 Apr 2026 00:03:28 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889b5427cfsm15676205e9.1.2026.04.03.00.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:03:28 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 device tree updates for v7.1
Date: Fri,  3 Apr 2026 10:03:27 +0300
Message-ID: <20260403070327.2552867-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_000330_964117_40442988 
X-CRM114-Status: UNSURE (   7.05  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-7.1

for you to fetch changes up to 7d7a9fc1310a0ade8ea61c5eb4d8b29456f8d604:

  ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node (2026-03-24 15:35:37 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v7.1

This update includes:
- enable LVDS, LCD and PMU for SAMA7D64 SoC
- drop unused #address-cells, #size-cells for SAM9X60 UDC node

----------------------------------------------------------------
Charan Pedumuru (1):
      arm: dts: microchip: remove unused #address-cells/#size-cells from sam9x60 udc node

Mihai Sain (1):
      ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node

Ryan Wanner (2):
      ARM: dts: microchip: sama7d65: add LCD controller
      ARM: dts: microchip: sama7d65: add LVDS controller

 arch/arm/boot/dts/microchip/sam9x60.dtsi  |  2 --
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 40 +++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)

