Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFDFC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GzXxf0Hnx2ZuZyJaAghD13+hNIZ5tC1zzw1pZ5Fbdb4=; b=c6vgjQuK/5Hjd/
	PzSuV3fQTgFsmZG8KBrvOilRPtO93LF7bKTCG4bKgsTAKPdoX8GgRVRyZbaJ3HD2bB9rIODyc9Rw0
	16P64AMXYM8zoPTm1IS1fnbcM3GC01GNWgGZhoMPBMHXlbd4HihffR1Kt1BPKFX1RBjj2V5VzFEme
	a9xq0WAD6w8ejh7yoLfI2gd1F5zV49NhfiAYTsbc0TcnL7YE7jIjujAU5Q4uyZXa7J/o9mayFjvwD
	eambnIu9nDRwM1VyTWzbDNueCeMHNc+X5g70umzaxg1CU0myhgOmkV9EOxk8RonZRr9vYu38EhwRg
	KWDvuYTQUxZALwVRb1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUac-0000000Dub3-37FT;
	Wed, 07 May 2025 02:32:54 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOZ1-0000000DK5S-109u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:06:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2295d78b45cso80102675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746562010; x=1747166810; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GzXxf0Hnx2ZuZyJaAghD13+hNIZ5tC1zzw1pZ5Fbdb4=;
        b=Rkh//zLKbHRUm2GR8mwkqOtv+Lte+KamOS7gcgAyb6Mj1fwpLAQ57D2TdfIWwKrLyS
         v6P3ASaDhqRIVIWBk182Feb1SEiD+SKvNAnVeGfr3MiDgXWaag88d2efw5HJbhGckuE/
         ekbTIxOa9E6AauSeBfS2+turkcW+SWsUlPHsyKFue+4i+G4L74f5AJpsqWwEWbHRkYr5
         whOWmwjTeA3kuuEqPBLz0Kf/GnjzhHVhatDZb+jmXqWuyDcTq5e/qI4jIvS+HdHHDWDq
         ZLuR+paBhZV1Iv6PXOwNPZ3yWTLgSn1dK7OoHTIrMhtGjS1ydodo7Mad01UufakWjVwg
         zSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746562010; x=1747166810;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzXxf0Hnx2ZuZyJaAghD13+hNIZ5tC1zzw1pZ5Fbdb4=;
        b=JMzpzbhapA8za+iIAjuAgVdCOo+WoCQu0wTXvwlNz5ZaNX3t08vVq5H5cJapBw/qEg
         Qn6k9MX+9JAJ5J4/ZbBcfDWwLh3AIJZKT3zhShSL5pmipNyUja576LDTJETqtlbpz2zc
         L2MvIRAugX6gDmKD5iQtXza+WJM845bLkJae7cby7t69Jd+1KAQn81l1icLxsTJe04r6
         U4oxeuw4ZBXFUETUJb4KfbToYNc7EUgWw885scSBIvXXamy93tJSw/qXYwBbNZqT+YfV
         KtSOVbPB4YyKP31gtZ3o2c+T5jWaPxb4oFoOavUjecB5HxkXZ58MRm3Q3Sfu/6yvFqfn
         oUEA==
X-Gm-Message-State: AOJu0YwfPl24Es5diPNi9WN0z3unfuLTj0zOjbDcRVKPpnCIixLQjGeo
	bJ2OGA7hy6mLAj/3FIyMkA9WosCqNIBpG6XRxzp8LPugHdFW2Yty
X-Gm-Gg: ASbGncuQs1axzDi57vv1QBtqQLmfnZwoQk+dYIzr96u1EUUaKdZaAe5fn8BYsXkrhCa
	Z2JmNOKHgtvgzHlkfVgLpZ6dzgAnznTdby71YX2t7idzOlyua1xTU/y+ou8i1kJ+2pfYIvbzbqt
	OpV16tvMxMUFzKVC8KROSv38fCo5UyXCt1VDPOTz64k4KcZoRrINwgBq9omCUYFYacmiSM/QxF/
	h5VmC2Zm2tlx7wzMspY/Uh/WWKP2B+8gNeebFFnCPsVA3RA+6XmEwkQvd4hgqZkJNjRQHnLl7cG
	WPQef/3hV/K5T9RisEU64uAXSPD6VnFKeEfsSWEYTuxMpmZHZc+6
X-Google-Smtp-Source: AGHT+IGdwuldVbcmWLN0KkrUf8rKTSXH7NdW0ivuFj9VQtpVoZ4NgUzZQC4g3DwuL7LkRQ99v38W+A==
X-Received: by 2002:a17:902:fc4c:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-22e5ecc2696mr7068435ad.26.1746562010216;
        Tue, 06 May 2025 13:06:50 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm78378635ad.62.2025.05.06.13.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:06:49 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/3] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Wed, 07 May 2025 00:06:11 +0400
Message-Id: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALNrGmgC/x3MPQqAMAxA4atIZgMxtCpeRRyKjZrBH9oqgnh3i
 +M3vPdAlKASoSseCHJp1H3LqMoCxsVts6D6bGBiS5ZqvFJriTDpKgHPw7skEY1x5JlH3zBBTo8
 gk97/th/e9wN7PQX7ZgAAAA==
X-Change-ID: 20250506-vt8500-timer-updates-44a0d22cd720
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746562005; l=1116;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=C/hqTH9fWgjvHIAlcqh9rsEMLpNaQkiA3cjX0v4rFQ4=;
 b=OYx9UAzouM70vpNCQH3qouty7tsRpKFTtpa0JWKuPso00r10WEe4tlx4RQVdoEH34FMnVadUi
 vlkxM9CYfvgBuejsWOwhg7DDo6ck4dKisIh/KF92tMHD0RSHr6KlVgN
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_130651_282842_527EA327 
X-CRM114-Status: UNSURE (   9.21  )
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

Add named defines for all registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (3):
      clocksource/drivers/timer-vt8500: Add defines for magic constants
      clocksource/drivers/timer-vt8500: Add watchdog functionality
      ARM: dts: vt8500: list all four timer interrupts

 arch/arm/boot/dts/vt8500/vt8500.dtsi |   2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi |   2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi |   2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi |   2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi |   2 +-
 drivers/clocksource/Kconfig          |   6 +-
 drivers/clocksource/timer-vt8500.c   | 115 +++++++++++++++++++++++++++--------
 7 files changed, 101 insertions(+), 30 deletions(-)
---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


