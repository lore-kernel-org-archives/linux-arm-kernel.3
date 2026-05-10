Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D675CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 20:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8NI3fN7QsJncCNnXfLt8QQqn69GGnzb/da19UX/jwp8=; b=VKDKlbhr43VZEAujn7O48K+BDF
	BNDlXgb9+ZzKGZPMCW0eAMx7ql/wKpLO5rI84x0EAOh/rq2RfY/RTyTujgjw8ZZM+4PSlvzDIqha4
	jnaIf5E/GyGH+DfLdRKOBxO309GcQ2dhvFRU+6S+ONAa/EvifExXtWTqgQFiTi8CIS6l1CFaQckmd
	Fi8WWC+tZzfjzRfVhM0DDFcrChZugHongrcLb1+i9mqld9u2UsS4RHtnhDZE7Jhvnj3ODDLOClfhB
	m6N8OEKmRxyzSZ8LEViR8ewIMd2CBWkRgfhtXmMETaXK1HlQY1nCB34cUGuDV/Q7qEwamEfRIyJtw
	Rmfp3Z3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAaQ-0000000BYHl-3cVA;
	Sun, 10 May 2026 20:17:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAa3-0000000BYEk-18BJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 20:17:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso33314665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 13:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778444209; x=1779049009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8NI3fN7QsJncCNnXfLt8QQqn69GGnzb/da19UX/jwp8=;
        b=VbDEcoHdTB+2kW6kg8qCpgsmiMdGKyNGWAVMBa6vbogpmU/ODjUoVKMHUrgryRqq3I
         FexwVGEGZGPhz3OwKb+hUz8dNsDUnFdACiw44VWJ4Sr8eZnVCnGiIkuVuKOZOwOKmtF+
         OO/GfXMNyWHdoTG3YeIYzGLsQSW6dhegm0u1gJ26DaJkNQXquRQ3PB5tprsnX7Fn43i2
         7XI3MWhBdmiw20qMHtF5eORvqW10YBCoJP6kjHu3pajv4oWUdyUTVRiKvpuRSGDoTG5f
         a3n+Guc+1VSdaOhUJmLDXEV4vDtlxjlZH523vo0z/5zVWTk9WLzDeEZOL47dj+GWlzHf
         I6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778444209; x=1779049009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NI3fN7QsJncCNnXfLt8QQqn69GGnzb/da19UX/jwp8=;
        b=ruZwYUlj32oO3NsUBhhbXeKdBKJObMIH1aEKJDgv+RJrg6jLI35DQX4Nn7eQTynnXS
         6SXSVitrHZ3y/HRf2Nz1WsBrKEVPd1Pmb589bFD7bxkULXHTKz1KNVsray01k+8pE+Ux
         BPTfMOG/TM2Y0ImcfE0thN7bEVQI+Ur+5p1qOQ0bEORPrMS1xxBxDKnOizUChN/U7GD5
         glPhdyI5klAE76YVwsdUm5IB/L4KxjeWm6CaCa0ZJAPicOx9AbhgQdhWsOczuSG37PSj
         zY9lghF2HHTpx8MdhdjSrTf9fsFkt29nEkzcjwNNClKasm9I1PJZdfrihUbtRt/WjTRo
         KRMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RPxOL9fbXgWV0f/qfCC3KJvomc3PL6K76n3Dt3OVCUWG340o0nz8khgkTKwcN14NITUZMuVZF901lR715Jquy@lists.infradead.org
X-Gm-Message-State: AOJu0YxbGixVRO+hAl5VpnpdUMYQ16zK1OmMgM/mdEvpK2XMq5VrCJvZ
	B8NDcBNeyOcIWfVQinTv2dla7HjqYXgne5ta2x8j0PTmhbDx9VrH2nJz+0YiSw==
X-Gm-Gg: Acq92OFMHQbtfcY7/uDUsxfBt6zIfs7ZE7rKO7OiZR/ljjWoIpDGw/ksVxvejgVQqrt
	lCiCed/9tcgpCp1CZ1Bbk3zlAhQ3qFx6e08diSnmL7YlBDLqkSWAHyhP1Zz3j/Be3sOxipUurKL
	hWE54uvNsTfVq1DHP5G8uvLQ0SpzG8kjlMDP+uFyBzafvbVJrYZO6TyDMJZyFTF36X8o7ibaeY7
	yKhDjWLcTIrcSr6GrrctKOAIGSbyhJDZ2YfjmGXwkBKBjcuWmi8ztq0kEhESuWM7JN4A8mxJHPg
	MhzyXMTGP1VOnl8BTcY5znlPfgbPBK/32LFh3yjJ/FsbT3TD437L8a8rDRy3BWOrHobuluSd6CT
	+IjKmq8gB9FBTyO6uhLakF0lA+fSs90LHfLNCtSKBfNJGoZ6W08c0y+U7xi4Hs8P/KTnctm5XZF
	ZoSYAvU3BepOqlYV8JWK0SFYMN2qQAoed23GOJXtyvPCVwS952eEuW
X-Received: by 2002:a05:600c:3507:b0:48e:635a:18d9 with SMTP id 5b1f17b1804b1-48e706b2726mr104321595e9.15.1778444209019;
        Sun, 10 May 2026 13:16:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a8f1sm127667145e9.11.2026.05.10.13.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 13:16:48 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add support for Baijie Helper A133 board
Date: Sun, 10 May 2026 22:16:37 +0200
Message-ID: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_131651_361148_65850941 
X-CRM114-Status: GOOD (  12.06  )
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

Baijie Helper A133 board is a development board around Baijie A133 Core
SBC. Features:

- 1/2/4GiB LPDDR4 DRAM
- 8/16/32GiB eMMC
- AXP707 PMIC
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- Gigabit Ethernet
- Bluetooth
- WiFi

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet.

Link: https://szbaijie.com/index/product/product_detail.html?product_id=23&language=en

Changelog:
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board
v1:
- https://lore.kernel.org/all/20260503191842.2736130-1-alexander.sverdlin@gmail.com/

Alexander Sverdlin (3):
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

 .../devicetree/bindings/arm/sunxi.yaml        |  11 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-baije-core.dtsi | 162 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   |  94 ++++++++++
 5 files changed, 270 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

-- 
2.54.0


