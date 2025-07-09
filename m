Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EE8C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lzY/wkRIsQfHZQP8v4qsHJxPM4X7h0KVostvHPrFTLg=; b=08d8wG6GzvSJ/ej1nTfewMxcDD
	ZxIE3vioIHA2eDhsL8JVucUzaY0F+MX97XHl7t1V5uzyukt0IuCq8uT3vuBYjZsdvuacpVhuyxgF3
	0b+3JVxgaFmyXC7yljNyBE4QagmHFUqQ6Rz4XfCxI/AGMEsI0sHychH+PH2h6dDOZAZ1siP7XT2sC
	cUfUwpFwu8ltn3TLUD+w3FxisI35xDk9jhAOLnCX2bl4RCTnEqXIgo3PsInLYdyQzQLAZ43S4BJ55
	EdKQgqWJYnTjeeixDT4rJyhGsX4ffLU+3b8MCPa6aWUUXcP2FDD90FGVPViShdfUy1gtxJTQZ4DXQ
	2UdSfZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoi-00000009yNU-4BLQ;
	Wed, 09 Jul 2025 21:59:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZZpv-00000009Zgv-2DE5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 18:48:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso36349f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 11:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752086886; x=1752691686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzY/wkRIsQfHZQP8v4qsHJxPM4X7h0KVostvHPrFTLg=;
        b=SitQ7Ts1aDu7nFbczCdJf+5hYm1XsuTiQshpIDs9iL+sxWoJmbQ03SvYCP7755c2Ci
         wCLzyu4ungxtswnVVGJyTA71IKAJqLWVRNT5byq/iNlRUlIba/mUSHrmQS+XlTXZ6cBg
         ase0W3n9WjVKII9mOERoFh0F+y9wQ9bgCZ5oTJb7/HDJmXH4rshaGa9TSbkd6NWAHDU6
         NVlUHlcI+dO+KdNl00n/2oECLk6tM2dUhO+LRyGom0EHBoMkbbBkHi4rWsLCRORDb7T2
         rqiMcqBgwmaUSOanIQ/kX/fDLpMVt3ijS5XVhUaKQ46eF21fJdU/2LAjEX0WZUze6kou
         vhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752086886; x=1752691686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzY/wkRIsQfHZQP8v4qsHJxPM4X7h0KVostvHPrFTLg=;
        b=aNJ/VIVgXl0SXB+cD7Y21N5WPxKirimmDH+mQmDiO7rfhpvfBteqgrp6yqw8XxoIuy
         GRcUFtdYRyUGvKHpLFOKwoVGdoA2znZYSsOA1i8DKDfCebuEeWnOv5gAk5wpFQ0Yu8Qx
         JPFtXRbBusSz+gF6PqyliS/pMPdxScOZrF4ne3snR46+k4/0Rfot7jk4m5VQmUlQWB52
         PXMXbgFiq4lbEewXkbhUSERGvGC9VIYlZRBJ/7A/YiQjt8Zsjam362f3FqxxMM18joTW
         160hbKW1kP6By/3557LlaLkMrvrDCK67KpmDu7PmPJxXpQivsrwOS7OBST5bMywXkdq/
         GuVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmakByG853sTefuwwDk1kBun3dXAZcCxPfX9h+GKfYlhDalXS7DnyO32VBKG92Yv7fFvrid9EWa3IPjDDPXw1g@lists.infradead.org
X-Gm-Message-State: AOJu0YzA3hMEnWJtfGtziPC0Fz+ioNFykrzOVg53dBelc/OCZ3X2Vsly
	GcYL4tSF/biM9EvvW9Be8j4H+vlJFROzWsBGKweUx/UfcFdiEEcvxq96zNRhcqgA+L8=
X-Gm-Gg: ASbGncvztI2Q0sZ2se32j4IbcB5DA3+sUy/HzccwD020u3YPEwc0e58BnLUWlR4cU2L
	fFw3fY1Ed82ESp4lSkyr/fdlU0/SR+VJGit8QL5/COXo/6O7/GF0fq/yGxGdDJQ+O5dtPzXB6tI
	Wm3HcTxtu8emkr8hfmS5KP/Ms1/YOqz9OQitEzYzq5re9/QybZnCAjMc8HLHSJ2NTcf8e//nts0
	90nx9sYbS6LLweV6BEly8ImCpmJaiXBqOKoOjg4rAqi6d4qylo3Ev53kzBvWhIME6hA1ZE5h/Vf
	X+hCLuaHXOfHQjJUHqnNQrGg29NovQQPwdpi1l5gTt4Fq2YR3givc5EYs6sBgDReZ8XCRi4m7su
	/cC/2vAsVww==
X-Google-Smtp-Source: AGHT+IFjKA2bgIqGaBqRLesEX9wcoaMoKB/p6ZG4Z389Kueb42crYAklSyrFhdYRjHDnMQwyszNa9Q==
X-Received: by 2002:a05:6000:1acc:b0:3a4:f8a9:a03e with SMTP id ffacd0b85a97d-3b5e44d4291mr904572f8f.3.1752086885818;
        Wed, 09 Jul 2025 11:48:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030baa5sm17171045f8f.12.2025.07.09.11.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 11:48:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: vt8500: for v6.17
Date: Wed,  9 Jul 2025 20:48:01 +0200
Message-ID: <20250709184800.168462-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=u3Hc3nQp0O5WYAc3HQ6CtOu++sD7TDGjIrpQ003ybJ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobrlgVC0ilF996/5GTTUNwBoZFaYVvZ5ULFp4m
 G/hCGPoMsOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG65YAAKCRDBN2bmhouD
 19zOD/9i+E2GOi/b039lg98NNZcohGuoXIVSRC44kihPhyF5fktFrk/DYRA34Z97HujEDDnMHZ+
 5EtZNNNIWw8FuyuAWLGSElMQkrjbj1rf1iDE8+cvXFOWDCKrLSeCijgz+hkkBUAwhzA3KplHhq2
 ZgcttfJOK37Shz4j04++7ApseLxU75w9ou6ELjVcMB6wly+eWO4G7MiYkWnWXrp/tT7yj4sBxoS
 U/SbufyU9eNMZZFqdaLUAwF3fXPMCgiMcyvNab97TamLWvQM6ixfCHChj0Q3G7ZAD1l8YUk7Nkj
 +hceANY6G3tkzjZnmsfh0Ti0+/fKZ7Gj/qK0GepilBUyO994ZfExWdLyXPV3MmbpA5NJ8lAqVuY
 EaQ+58rT7omHCIO87qynp4FH9QDWpJ1/QjDABkO8kwNCVzfau6GOeQgYCe4xud9lY+ArFwQEiB2
 n5N05oj4H7VfqWpJtG0S/waFWpeH4gCidQ7CE3bHTcqIfBWYQ59tvK8nn/PnJ1Hs0fYb1LhrVga
 LCO5uXg4nEXPLUSQGFS7B1IXoOiKOF/9djhL3PJAcKzi1QjF4mDOa9YgnQGbakhDqgAaj829iC+
 0n5aePn0OMpoFv687cCUiDgzh8diioDXnEbvfYovugu+4Ij5nNpSjr9JZL80/JKvgKRrtmOMUv3 JAHzaOEGLKT6Zrw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_114807_573884_C993BE1B 
X-CRM114-Status: UNSURE (   8.43  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-vt8500-6.17

for you to fetch changes up to 6cd594ed969d5cfc7f97029f8ca0d240637ebb8d:

  ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950 (2025-06-12 17:25:18 +0200)

----------------------------------------------------------------
VT8500 DTS ARM changes for v6.17

1. Several dtbs_check cleanups.
2. Add missing cache topology - L2 cache controller on WM8850/WM895.

----------------------------------------------------------------
Alexey Charkov (5):
      ARM: dts: vt8500: Add node address and reg in CPU nodes
      ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
      ARM: dts: vt8500: Use generic node name for the SD/MMC controller
      ARM: dts: vt8500: Fix the unit address of the VT8500 LCD controller
      ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950

 arch/arm/boot/dts/vt8500/vt8500-bv07.dts    |  5 +++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8505-ref.dts     |  5 +++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8650-mid.dts     |  5 +++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8750-apc8750.dts |  5 +++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts   |  5 +++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi        | 21 +++++++++++++++------
 10 files changed, 56 insertions(+), 38 deletions(-)

