Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFCBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 13:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=maCTQepsTUVpu3pdm5l+blLPz6LwOEt1QP+hRHzrnnQ=; b=EcYRJpcCnE2ihwOlsit3pZqZYY
	5xOu8SZkAkRYNciPZH+HtzYPSlPOVrJ3LrMicOwbWabZlD4UsmrnMc4SppK6Ap1SXdMJKxXZRTg5U
	L7Hm3Qa25o+8bAbnxrQ+XLi8/a+IOEQoMNFKxwC1KwUSewOMr6v+jPRdNgrN6HOi1E7wbq03tDSiF
	6bdWPpLyM7LvwnBfpYfbrasREmw2NQL/cU0Y53o7XS6WI0iTkmCuJ54e6dFtyyzUoPowto4QLbpQ7
	LHT/LRcgmf9WbfTzIN6K5EqZrTspkT0RyCjIyWu6jhAYv6HowPkvWzyXJzsct2A0AHSt5DXjb5EiR
	ABhruB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tScJx-00000007GGo-2MtK;
	Tue, 31 Dec 2024 13:30:05 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tScIn-00000007G9R-2Ayp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 13:28:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso9665695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 05:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651731; x=1736256531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=maCTQepsTUVpu3pdm5l+blLPz6LwOEt1QP+hRHzrnnQ=;
        b=WZuqgCj+IfkAB0BcRlpjf5FaLN6XDm2dUQw0JfgMlQu3SAVyye7X8enAfp2t9EtUiV
         6yT5x9WlgP9Yo/hdmG5VpffNJqo9/mZvlb3rQa4UUsrkTp4VdvZr05ExwYz5H+3W87Yx
         EPnHSDFT3Yo71Q4Cpu3UjkIOJZJ30lM5ESgThYUqHY42Wq8YmBRHqd4PN3men7ZOKcxj
         /eJ+FuVOor6XBcQ6KutVE5ZuA8w6WEDy417OwrU3pkaxuEU/Fwq0h7GLeRGuykx5+3WU
         q754E0Bf1+ogfzIPpvQNsoGHohvjzCD8H3zMKtOcpVgQ/Tu0gw6jswDoAnwkaWi8WCFA
         ORJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651731; x=1736256531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maCTQepsTUVpu3pdm5l+blLPz6LwOEt1QP+hRHzrnnQ=;
        b=IGFXtgc0xIftSK/uM4lNmGYmmys3pp6ROoAFtfsRVNtWOEMqCHo4o7mzCOWeGQEWvk
         b0eZzD2frsKw1Kw0IPUIgCxALZn30XtIPKMTQ4tyhm31b+Ak1s0NuTubK40q0/AyN5vT
         +ysZX1Qr9kB9+x3ZKt/7CKpgq0gQcYscLMOkSDn60NOmf45amoOi0oBuTrAi+MtUbkbt
         qqTUaAOXZ2hcGXOFVnOxldViGUlUxvh+rP7wfk/h94vhlhR46nn5/Saw986GbQ8KXzGJ
         oA8agcRi74Q2zIy5BirE/wxu5UIeEvky0PvUGW/DVVRFihZSLtA4Vtk+kx8CqkbTZ8UU
         mx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZDCFyEccsPMT2uH7bjKLmYvrJaRdL0My5+lqNs9P5zUrURoqGQ0aiCNEV90OOMIcpVo8vy0DjuruQ1Nbx1aLc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0BhDvBESZymD1SLfFqu0kQ87OPocE3hGD/8VNbMHkBOBMArzi
	cPpkO7btoXuK5CQ3gEkz1QpfjMlFk4icmuoe3raIbhl2JgMIaHuz+dz1GwARHEA=
X-Gm-Gg: ASbGncvmuLCbvgh2KBFTPdzbmR6cm/84S4w8nb87RTTUONlGOMvWOzNfPavx7dWF9oc
	WZV5IlxDpSf94FEjKC4nHkVh74mtnFnLJCCnwutd79fJ2s4ORhtflOmyOt4nPjV4K1FyVJ3m4Cb
	MYYZoHC4Gr99NcLjmZ1jalAkSxQ4t3e2ZpH92h0zEWYNU1JMs81VHR/nRUKx4vcgMrPA1l0DD2u
	LW9C2wYH4b10r4y1dcDoy6gWUDsopAjtlHHS1MZaUlQAMGv76cA97uA7n8kf2OHImUMwxk=
X-Google-Smtp-Source: AGHT+IFCgCggkijd8BCvvL0HdAA1DNcbL4lkGRKWlrZWXZ/2B/Du2w0fh9jPXbFcqVFRT4zZ1tGerQ==
X-Received: by 2002:a5d:6d0f:0:b0:385:ebbf:8736 with SMTP id ffacd0b85a97d-38a223f7484mr13078577f8f.9.1735651731380;
        Tue, 31 Dec 2024 05:28:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8334aasm32800220f8f.41.2024.12.31.05.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:28:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: various for v6.14
Date: Tue, 31 Dec 2024 14:28:45 +0100
Message-ID: <20241231132847.135814-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_052853_578924_058FC204 
X-CRM114-Status: UNSURE (   8.91  )
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

Hi,

Few cleanups for two platforms which were not picked up by maintainers.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.14

for you to fetch changes up to e1daed030b56049caa2d8cc040c824990374d941:

  arm64: dts: sprd: Fix battery-detect-gpios property (2024-12-06 09:42:08 +0100)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.14

1. Spreadtrum:
   - Correct few issues pointed out by DT schema around properties and
     node names.
   - Move fuel-gauge from DTSI to DTS, because it belongs to the board.
   - Use undeprecated properties, like battery-detect-gpios, already
     supported by Linux.

2. Uniphier: Use un-deprecated hp-det-gpios (no ABI impact expected).

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: dts: uniphier: Switch to hp-det-gpios

Stanislav Jakubek (6):
      arm64: dts: sprd: sp9860g-1h10: fix constant-charge-voltage-max-microvolt property
      arm64: dts: sprd: sp9860g-1h10: fix factory-internal-resistance-micro-ohms property
      arm64: dts: sprd: sc2731: move fuel-gauge monitored-battery to device DTS
      arm64: dts: sprd: sc9863a: fix in-ports property
      arm64: dts: sprd: sc9863a: reorder clocks, clock-names per bindings
      arm64: dts: sprd: Fix battery-detect-gpios property

 arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts |  2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts |  2 +-
 arch/arm64/boot/dts/sprd/sc2731.dtsi                   |  6 +++---
 arch/arm64/boot/dts/sprd/sc9863a.dtsi                  | 14 +++++++-------
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts              |  9 +++++++--
 5 files changed, 19 insertions(+), 14 deletions(-)

