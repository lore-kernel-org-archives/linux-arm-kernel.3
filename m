Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CB8C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RA0XtAJL96WJLxRbWatCDndiWUNj7K4Qgw/hFBCvBuI=; b=jsdpiQ6KxChJ/O1p49P8EoQNEN
	sA2mQgQh7B/3nkScXNsuSDAvfkV8mTRhOSZZUTig2sFiCnKJlpf2MJ3ZFgZkkUVZ+obw874jc4sqn
	TESVJEVGj4RT3XXiJf5I1T1thWAs7+FHZl0UQDcX/4nG4TLwezwIP8aJxYRQq9YTObz8x06xKm7O7
	NhWNF7FmLMGG2D9iirqwjfGUN9A8Vw77BPJsZ0RHMBdGAvYg4kgNuNq7bYc4juolMMMRi3d302n0E
	SfqljJV2jn/xdkR2PyT/nnrcMvvuIxfz7y+GXAE136qEUVMdki6r7SS9tJ0ZvpHp1lZQFpksuftCS
	ADpKYLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuuR-0000000FGy5-1vco;
	Mon, 03 Feb 2025 11:46:35 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teut4-0000000FGee-46re
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:45:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so7043300a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 03:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583110; x=1739187910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RA0XtAJL96WJLxRbWatCDndiWUNj7K4Qgw/hFBCvBuI=;
        b=fEjP+RKTf549C/D/W4zodnojootK1a0R4XHYGpSlfurAxTjUtZn+C6V39J7UqnCcoD
         6BqiCpHxEvhSrsBIKL6mMMU9EtDti9laRxkuG8JKyx+UOlmFKPBmyAl/MqubuSrKkTgd
         2kCxxynXukn5A0Mw5cErlMrM17vDeDV7nc1jU/+HKuD8NP9pgHGNQlaEcL+dVpUzJXNu
         A+X6BYOSjtADWBmmS1km5aVCdGEx6BHRHjwZKP2k53rg8yqEZ4zDmi1HMWbGGhU21cSy
         O+auVkZXtct0TzJAGLMi6ApOPNSZspFpWd+SwMs824MGQ+TxtkxN+xDgnQVvkdDpXS0f
         eY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583110; x=1739187910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RA0XtAJL96WJLxRbWatCDndiWUNj7K4Qgw/hFBCvBuI=;
        b=gi1l897X/+blupcleObmV8fuf8x8sIzeqZSZ4cFsnKvnfmw3eQZBJsg2meKCdXAF1s
         Og5ooKApHrKnjgut7XzEJFRYhNCpr0uK5Jb34M92iLsPV8qXILcOdfcyh8yfzVoja5SK
         xX4cROPs8gSh+3pdu1KpOCnL5TLHDTx3qglicOnslU65PjGbG9Gy3YlL6F6FI3D3ewHD
         cWgo6vFrjyIUeo62d0h42jS5hlQULOv3ucDwdQguXvG87ApVqHb8Osfoxo/pN/nMSoMU
         tet5wFcLBgVUuLS2bVGEnPjkROZIjTQDbO4qwrYL8sfbeTikLV2h3P6TRZzKdSGjk+G1
         8IsA==
X-Forwarded-Encrypted: i=1; AJvYcCVvasEQ6Vp+5nLJ8Hf8ondpcaEwJhypmLVqSXHSkQ7TFg15CiqYiIibYOyVsoQumyTGMsoECUX68gGZF9YfYjK4@lists.infradead.org
X-Gm-Message-State: AOJu0YwD1I1m6MgIgkmSTk4AM26EnQtl7WHojiAxzFfUhSoD9mHeq02R
	58762cuhinjn5IKbACyeC5dWkpmSFX4TVZuca1rOc1ZIVZfydmCg
X-Gm-Gg: ASbGncsNDTzbVy8vbnR32/lwvKPFTbw/V/IT6dPw9qqgBeOG/j4QIryq00/cgYZ5mHy
	5O3u4Pb1giQh5aHXXndZn42ttM0+T2B0ucxpWPORzIGhSvdW5Jn5FiZJ1+I4l4aFFsorq+sXm4G
	AtNESV16ZAbg13rFX0hmK1TcedEFTxJu1XP0VS0lMzd6+5VUzqCQsr95/uEQEj6kSkHfltsBNXJ
	cIh0vvSKBl7jIzHVPvffvOmw2VbUvT5dfzOFWFjPgPsY7rOD8Inb8rF66j0QrcKlKcD14Lvi3Zu
	DCQMLSfSdCYEJnUy
X-Google-Smtp-Source: AGHT+IHHjGHPnhtBshFZlL0STf36xDX/jcGjHEfsZF68knOtHxu3Ihb1HeH8FtH6IcuizJVxYRGNvg==
X-Received: by 2002:a17:90b:2711:b0:2f7:d5f8:f393 with SMTP id 98e67ed59e1d1-2f83aca3021mr31267475a91.35.1738583110013;
        Mon, 03 Feb 2025 03:45:10 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f848976d1fsm9712490a91.3.2025.02.03.03.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:45:09 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Aun-Ali Zaidi <admin@kodeit.net>
Subject: [PATCH v3 RESEND 0/2] Device Tree for Apple T2 (T8012) SoC devices
Date: Mon,  3 Feb 2025 19:42:51 +0800
Message-ID: <20250203114417.16453-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_034511_019731_A29E0E6A 
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

This series adds device trees for the Apple T2 Security Chip found on
some Intel Macs released after 2017. This SoC is based on Apple A10
(T8010) SoC and, for many hardware blocks, can share the A10 compatibles.

Changes since v2:
- Drop PMGR nodes, moved to PMGR nodes for A7-A11, T2 SoC series.

Link to v2: https://lore.kernel.org/asahi/20241203051147.110980-1-towinchenmi@gmail.com/T

Changes since v1:
- Use imperative mood in commit messages

Link to v1: https://lore.kernel.org/asahi/20241201161942.36027-1-towinchenmi@gmail.com/T

[1]: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gmail.com/T

Nick Chan

Cc: Aun-Ali Zaidi <admin@kodeit.net>

---
Nick Chan (2):
  dt-bindings: arm: apple: Add T2 devices
  arm64: dts: apple: Add T2 devices

 .../devicetree/bindings/arm/apple.yaml        |  41 ++++
 arch/arm64/boot/dts/apple/Makefile            |  16 ++
 arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  19 ++
 arch/arm64/boot/dts/apple/t8012.dtsi          | 176 ++++++++++++++++++
 21 files changed, 527 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1


