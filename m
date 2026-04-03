Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B40D730AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7OXn+fDhlDjBfFUiybD6ea00XK+mf3TYPg3/vc00MCU=; b=DX3d+ui//6HvnZ81Xu9X28v6mZ
	x7Deq78oI62VVayUhbwJI/ztFAkdfOxS3rI59ZkiW6qOR1MpLx0pU+UuQB+4tEhexTI1EjMG9667K
	mbnZ9D2Wxgcsj6gVnKUcK0ZoHtjpijjC3MCbk0oO0orUF0Y6cFI7B0mHeMO2CB2Z7Vq900LXqC2QF
	IPGbgqslo/YHfqOQW82sTh+rC/2DA1rY3Qmsh8ZPBnjNyR4fh7iyJC2Mntn3jNUbtDRnpucSMb6FH
	8LIor0AXDER112GygnTSe3LhArXvuQ1nsVQHfLMf28Z2Ibh/sffIM52NOFg1eA6YUzs3P9d16DA7D
	uZ4bptyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Yc8-00000001Szm-1P6z;
	Fri, 03 Apr 2026 07:06:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Yc5-00000001Sxq-37jE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 07:06:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488895ad947so18453175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 00:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775200000; x=1775804800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7OXn+fDhlDjBfFUiybD6ea00XK+mf3TYPg3/vc00MCU=;
        b=Dt3ADShmyMdTxgfuC4hAQ//ryYlWpZKSN5XsnbnIjC/NrUJw17tWewNu12JFCVi7no
         Mh3EPpD8Wk8OLLKLe+PCN+fdsSp5DOMxVkGY2xR0S1jCphqh2YflbwNi92sksfF9khgt
         A8CQv9mnAc/BtmpgulWbVki+pqpt33rompH6KZexDwmh76FxrAuFwR20bSyP4gdJUvfJ
         IkxHwxC09jR8jynSaJ8flkyLZRAwwz85oHRe1V8waR1TcA9NXBDaS2EmVrpna8muDd/s
         hJ4zNPqgD2LJOxE7yozTo4WrnRhelQ8Bp4t2jtIiLcgoQUwQyyqgkKPlzYSvlRuHr074
         79Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200000; x=1775804800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OXn+fDhlDjBfFUiybD6ea00XK+mf3TYPg3/vc00MCU=;
        b=ACqApLR0h09ZqmcngTbnlrLunTWa2BlN+ysJ1RQQEaQ4vg4hmAf5rD5Ds4E7lIZi25
         nXmyinV9szMxw3hjBuFdgjuYzlHPTJxOT5EJuuwuz1yg1M4ARNYNFCCOX9yFlmBU5f5X
         6QprO+kMUFNkQTj89zZCEgwums2a+SL6vPFVC4DZ7SVU/rmH95LPd9QpROrr8zWkFvNZ
         8+ZSQeONQ2N/MY4fePlGKZ38p9pcx/ZGvaNovAK4OFQrDOf0nxZtV8USFL/Ki+LBjfYS
         kLB2TsdVH7HNflbqQyjL3PHLQEAEhrgIu1swKAlCk1w1zTLSeCIkwfVrKzYbkThqEtLs
         n2Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUY7XVq75WJPxNzpmc01f9VgVN6PwuM27mtH6KmBhy+uCIHRw+Lvp55UdcRlejzclRkSrCx7lLwzfG6ktDSgB2h@lists.infradead.org
X-Gm-Message-State: AOJu0YweGP2npF+mGM5PKTNIDH0AwD7trtU04a/tPmrdnGH3xbv4Fi1O
	a12dY1cLjchNVIP5R0Aztpo9BypsAXrXhM1P43cZlcPYQpua1A15DKSx2Th03Tm1t0A=
X-Gm-Gg: ATEYQzy+sj+hzIbxxJNt147KWjMNvYxov+gJdM3bGaXcLuCkC+Kjs3rYjavpdoLJk0s
	EQxgNz8uWZrdHRV0D5gEX9mRm1xwJN8pu7+j2mvXFyikKOnWqnQHrWlN71XY/gobVNt/PR765k/
	hua092zGR/RsWNNYmYB1DjHSCMv9vH2LDpFdPPwNhBUNmkSa6jdseD/FYUxFgm/ptYZzWlN1GyZ
	14gG6e0IPl/gOle1X+2b2D3JaTgCrlsT8M96JA/D4QFZmSAX1655qdrEBcC3JiARCAPCL5/T2La
	No7NstKY6nq1sxHqLSkQ4rxlDeO9vVLdhJ0oa9i0gXIwTeilztGrEWNkrFBvHztq7+lTPDW3YSj
	KtacPcRoOsN5bXbMvFunuoDH8UI/8IqbqvSsuTjYi5opvKZ6I6+2hkOGyIZ6b9xh+FU1jkKl4rW
	e7DfWs4mQRpAxzmGJFdvY81hMaH9ddvBQ2teTj/Q+kpA==
X-Received: by 2002:a05:600c:818d:b0:485:9a50:3369 with SMTP id 5b1f17b1804b1-488997e74fbmr27479815e9.29.1775199999487;
        Fri, 03 Apr 2026 00:06:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889b559a15sm16310975e9.2.2026.04.03.00.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:06:39 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip ARM64 device tree updates for v7.1
Date: Fri,  3 Apr 2026 10:06:37 +0300
Message-ID: <20260403070637.2554408-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_000641_787936_B0534964 
X-CRM114-Status: UNSURE (   8.78  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.1

for you to fetch changes up to 711cca0f1cfef57018654b969da4041c2bab68d3:

  arm64: dts: microchip: add EV23X71A board (2026-03-20 10:56:22 +0200)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v7.1

This update includes:
- device tree files for the Microchip LAN9691 SoC and its evaluation
  board (Microchip EV23X71A)

----------------------------------------------------------------
Robert Marko (4):
      arm64: dts: microchip: add LAN969x clock header file
      arm64: dts: microchip: add LAN969x support
      dt-bindings: arm: AT91: document EV23X71A board
      arm64: dts: microchip: add EV23X71A board

 .../devicetree/bindings/arm/atmel-at91.yaml        |   6 +
 arch/arm64/boot/dts/microchip/Makefile             |   1 +
 arch/arm64/boot/dts/microchip/clk-lan9691.h        |  24 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi         | 488 +++++++++++++
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 756 +++++++++++++++++++++
 5 files changed, 1275 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h
 create mode 100644 arch/arm64/boot/dts/microchip/lan9691.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts

