Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E4ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eYqKhruI45NqfrcmY2IdIDvWyXftG5Pvnt74G18ZyBg=; b=lETOKHuIXFZKJ8
	2O4vmkBhefyt2moF6XxCU6ZnGx/C0/gA1HfOpMeA43XO7prOL2QGf7mWT01D/v1xN0xxThAK+B6s5
	ZqTxZPSZBAt9M6NHIGu6MX82googII2qAX+OlinSwURs3Du9HDBq/ItDk9HQdNKyYiMHz2FCeKzYP
	NYIJEfFMr38I38c4j5Ja/4zI1GhkAVjZqZ8bSTDfr+AoCcb/XkLcoOfHPK5KeVCWzJSDQLlbN6hI/
	5drqyzmyiLDa3uE6utCR2HFjz1e5v3c2KgvaAFwQ+2hOQI8I8EmDF+g8UzQoYRCK/YvT7c+khYxf9
	UpLs4N7k1rzKz2CjN7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bez-00000009dPC-3ZUX;
	Mon, 22 Sep 2025 08:12:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bex-00000009dNd-41Mm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:12:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so39228145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758528750; x=1759133550; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYqKhruI45NqfrcmY2IdIDvWyXftG5Pvnt74G18ZyBg=;
        b=HVAYVpYr8jrudVEQk9O3GIHCjNnW0SvWH88k7siflZD8qhm51msQR8FVYO6EJ7e8qx
         XJaa5I3gmOu7OYc8bzUOx8ce/LoCdJXSm+pkxBHJr1riuF2BqyDKyeCxi1Mwt4Sv/l6v
         NDAEYDow0astU3fEiMMtW2pIPx/+ehOOej2gvk9ugv1yhQnChsWROtoyzRLC6Rkc5lxn
         XbYa6TmgaUEJ5bQyU77sTqL4HrJvlRefhPv+oKJeHG6lIyMabVvFTuc3tJCIXtIE4TGt
         jc5YC5z2jHE7xJFtOnRYZemxuR2EvuoJeqJfVN+4Eup+EovubK17neWy1LjgkLkDWo3v
         RaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528750; x=1759133550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYqKhruI45NqfrcmY2IdIDvWyXftG5Pvnt74G18ZyBg=;
        b=K33tVd+rY0kZYDB09yvbrGBTP0Wv3YGNoaEHdXKYEx2KzN/Q9HKdLWhKHG6e4XOh0x
         Yz+oqd0xXQ8qQRecAwsF8vc8o77j0mE/Np+FyuxAphnrAzD0k/CNA9hGhsikEOIJbrME
         Ze6lX+EvnnulyE8414i69/rmWnKq3i5YDA1hN7Vbo9MPxuS3uAe58T3pNTnKXpLIrz2H
         FcowpuRYs84tfvQFA2rPWwCIRHflHD0cDDxBoDIwUuJv6R/zC/9LbE6p9I2wKfAcszS1
         1bUtVgBuclJ9krzpWED2ZJ1lftHiv68MvfexN9mU5hN+7eHVjr4O1eSoAk69XFl4Iay0
         4fPg==
X-Forwarded-Encrypted: i=1; AJvYcCXTAX3KqpfTFlexhbLeK0E/9+G+3uL+r+ShlezdTsrHK5K19YkeCavw3jPfdGCknteYCTyAWRQVbAc6ktCDIlx9@lists.infradead.org
X-Gm-Message-State: AOJu0YytSVWxxS51GkXIb6LE4zCe/WZ2Ma1Gie+VjFut9e6vGoy/qAz+
	RpS3sTyJyHeAXRpsyJFvLQTt8n/j6bkXphB6350LjbJ3etqovERgn7Re
X-Gm-Gg: ASbGncuq15Tnn1P96sOtc1Tix/1mu7NovIf/nSzNTYmrnglPeSGoWbe+MxCFwziJeki
	NGCQDK5iJIJi6cEbywyFUJ2YUgc+1NWSXKTIqnB/M1Uifot6Ilw4SK/n576W2k/NblF4EZiKoJb
	oh2gUIGYLkfrha5sWPELUOLE16/dbnMzVmmugFSdOe2QeCR00h9Xw9pj6W8M96/TA5P8MW/BBXd
	kD23cpfPoPAC3i4Uq8FkYHSlGVInTd8auo3vpnJSoesYkWwRe1QGQKVVuA9Zm6//SENFzY9hciZ
	kg2Jersw0sUcio0MgMZk6E3afk4PSPZ9GcVa/JMNeeEm6KxL47KXk792oc3PM90mlG/gE6c87zz
	VVlOJmWZ18YE53eFj87d8+ax1APlH12buO3cqjPwrlWdBdCZoF6Z/xUud5X59lBENsGoNUrCpJs
	MVKQP2UgS6CWNhibMj
X-Google-Smtp-Source: AGHT+IGaW5mf3l3e9WL0amAUkV4jBYZ9TpBBxRsBaTLr99vQ32yK+2WU4XPkn1fwTjqGvgH00a6hfw==
X-Received: by 2002:a05:600c:3143:b0:450:cabd:b4a9 with SMTP id 5b1f17b1804b1-46d31dcba3dmr18635985e9.29.1758528749751;
        Mon, 22 Sep 2025 01:12:29 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3fd84338ca2sm3903576f8f.42.2025.09.22.01.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:12:29 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Subject: [PATCH v7 0/3] Register the STM32MP25 RCC driver as an access
 controller.
Date: Mon, 22 Sep 2025 10:12:17 +0200
Message-Id: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOEE0WgC/02Oyw6DIBREf8XcdUkAK4K/0ri4wqUl8dGC2ibGf
 y+pi7o8k8zM2SBRDJSgKTaItIYUpjFDfSnAPnC8EwsuM0guK26EYt2VRWvZ8kxzJByYRk1Yolf
 IHeTWM5IPn9/irT040mvJw/MRQoeJmJ2GIcxNwWuSNTqhSmPQW6dM2VE+E6LjziOpkrgSlYezU
 FOcdXyI9Ma+/zs5T7rSGqXwullraPf9CzYPxM3pAAAA
X-Change-ID: 20250916-b4-rcc-upstream-8a8ea3af6a0d
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_011232_014525_3CBB634C 
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

The STM32MP25 RCC peripheral as an access controller is allowed to know
whether the clocks are secured or not.
The STM32MP25 RCC peripheral knows about the clock secure configuration
of all non RIF-aware peripheral.
In parallel all the RIF-aware peripheral configuration information
are known by the RIFSC peripheral which is already an access
controller.

This v7 is a subset of the v6 and other prior versions, split to simplify
the review and merging process.

Changes in v7:
- None
- Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-2-ce082cc801b5@gmail.com/

Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
Clément Le Goffic (3):
      dt-bindings: stm32: stm32mp25: add `#access-controller-cells` property
      clk: stm32mp25: add firewall grant_access ops
      arm64: dts: st: set rcc as an access-controller

 .../bindings/clock/st,stm32mp25-rcc.yaml           |  7 ++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  1 +
 drivers/clk/stm32/clk-stm32mp25.c                  | 40 +++++++++++++++++++++-
 3 files changed, 47 insertions(+), 1 deletion(-)
---
base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
change-id: 20250916-b4-rcc-upstream-8a8ea3af6a0d
prerequisite-change-id: 20250916-b4-firewall-upstream-dfe8588a21f8:v7
prerequisite-patch-id: 1ead960f405c7a2dcc9111acd0bb4c95ed33954f

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>


