Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56E6CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 03:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sf2MtafIziFxv0+iZSQBAt6orU3b9FFBk8saiJeqI+U=; b=Hpnn9lXVlcg5KjcdjJh22XeDRh
	dCydO+VBs3W0qiDZlamdftAJahe4qUbcden2HadZ2zRER0HkrE4aPoC+FjUoSz52svBfSCpztBTZ6
	YzGu5We7MW+VUKGdHVt24EXYk14EpuSXzViYsHOcW5UmIh5kbTnUNvTtMmndovtBX1iiv0AByhOe2
	Eb3SzZ/gBYMSPZe5tM8P/w4lAhHT1l7nc1UXOPGED9QEMRSJ+ClvSZ5l9Hk7M82ci1d70AH+C9cmz
	3NGU31XUD77Xze/FvJZO/OGBPKoiYrGlKCbqhBY0oUEWiEjd+Aro0d339fR3VOZ/Sp6NvR1D3ZMZt
	S869gu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFkt8-000000096BK-3fv1;
	Mon, 03 Nov 2025 03:05:49 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFkt5-000000096As-3HkZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 03:05:45 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7a9fb6fccabso555969b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 19:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762139143; x=1762743943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf2MtafIziFxv0+iZSQBAt6orU3b9FFBk8saiJeqI+U=;
        b=e/KnqjhOgyoHtXKZvkMVI7KRDFXyQnnc4ZOkOjOlF8b4WN5TzZalwRsg/YwiXry8BJ
         CFZ7LeaLo4vCGJHS/9zwP7M9qy13XLXsP3HG0+IjdUsf2m0XZpLkxSs96yCIBMllytzo
         wL7CL67F3PnqBLmGCG/yjxNEmLBPxYJcOLMk74/z4teVk7JTqLjhbMrhyZJi5MIqvVjf
         qaelwZs1HuMlw0Oer1tT4IzaDxr+MAFWL+H4tTgH8GrjDbr0KRNcvHsX04/wztI9jQ1t
         iLLK1uTmzkjo63nnHIquGZV725Y2STLveaApo1CAD0zrx3mfV1dR1U+hd48cEGoRVK7q
         XDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762139143; x=1762743943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sf2MtafIziFxv0+iZSQBAt6orU3b9FFBk8saiJeqI+U=;
        b=d7/ymiAGr68mFQnUDD/l/3DQj6CVbi14BgK7nWK11Bwxl8ADObZym92wUVv3cGaUni
         ntAT2gTf1EXNZmveE5eaFG4zGVsajKFRLICOCbnbLLmkIcyIoi1lgzaSQ0GDNFExfAWF
         z+elKAzIcaoJK/kju/J8u9ZjHZqgYtsY3xoevp1ELHuuLnXiv60KFzQJZvuDupaqABre
         p7eG9jy17thFqOqgqTiBrnW40RT/y7Ht+suMp0IYinRouS7SpZVg3yDAVc4ake7KruYk
         AqfhlCKpnB9lSSCGwMxQQCiOQaOCgeinQdbd9ecu8s3tCzAsHX2hYgQeOEyNU2AyXXEJ
         nR4A==
X-Forwarded-Encrypted: i=1; AJvYcCU8rJrfz5e2vTMXnGWhjnNtDXSfeQ8GFM9tYFZg8BPUDx+rpb1941rxKhL4hZNfk/JBr3FqYQvamwubRxd/Egru@lists.infradead.org
X-Gm-Message-State: AOJu0YzySxduVfs+HaHvkWEHAuHvCLIyar0f61DaUNCt+cWQjia/0Xxr
	4Q7AXqVgEKo6F6117vEDEt+7xLk6sjxU2rzVZa0EvtSSL929vHWVOU2J
X-Gm-Gg: ASbGncty3hyLnF0ZisrnuXUhdqk7O5PInVrycOeK2CDbWfi3c7vgxW4z9f+eEfx15xX
	FQs1oEL74NmX2jOf9+nWlZv7ydI1HfLYI/O6u3Ilsen3JShiNLZ4tfASqvEAc9y5LW+ob+ZzduS
	fbk+PAb3yBwlupGjx2Gd+KBqrLmJygucrbGhYmFLj0uihrZL5Z8Wu+dPyr3BFGkyr6MbgIzdjsu
	93Jc0WvZYl3Z+jia4FU1PtSEE+oLRGB9m5zGzE6pIQnL2HB91bZSogszhNl1BRxqx4iiQuvrnu9
	Pu44qUFiRVV97KwakCTmzvbrNLgFJtL7PdiroNO7qPAGbwhxzLz12RdMOsLRpS3+ikXZCV9imA5
	7JzwmmuO6LF1r6e3FdZti36wvHwJzl6kf1IfHZgTFBmjJpaFUDgxT4BBz+6d9cCq53uLfSOrZ4d
	iyRMeue6c2KQ==
X-Google-Smtp-Source: AGHT+IGYS/nnpitzE/eUQ+F68Ex58b2ct1BccZhqdFnCOq0bLpSK6sj1xCHRpQ3LEE1D/LOlqIwsLQ==
X-Received: by 2002:a17:903:2286:b0:295:4d24:31bd with SMTP id d9443c01a7336-2954d243448mr108631195ad.17.1762139142642;
        Sun, 02 Nov 2025 19:05:42 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295c2eb15f5sm11691785ad.2.2025.11.02.19.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 19:05:42 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Mon,  3 Nov 2025 11:05:23 +0800
Message-ID: <20251103030526.1092365-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_190543_829207_31393710 
X-CRM114-Status: GOOD (  10.98  )
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

As the SG2042 has an internal rx delay, the delay should be remove
when init the mac, otherwise the phy will be misconfigurated.

Since this delay fix is common for other MACs, add a common helper
for it. And use it to fix SG2042.

Change from v5:
- https://lore.kernel.org/all/20251031012428.488184-1-inochiama@gmail.com
1. patch 1: remove duplicate empty line

Change from v4:
- https://lore.kernel.org/all/20251028003858.267040-1-inochiama@gmail.com
1. patch 3: add const qualifier to struct sg2042_dwmac_data

Change from v3:
- https://lore.kernel.org/all/20251024015524.291013-1-inochiama@gmail.com
1. patch 1: fix binding check error

Change from v2:
- https://lore.kernel.org/all/20251020095500.1330057-1-inochiama@gmail.com
1. patch 3: fix comment typo
2. patch 3: add check for PHY_INTERFACE_MODE_NA.

Change from v1:
- https://lore.kernel.org/all/20251017011802.523140-1-inochiama@gmail.com
1. Add phy-mode property to dt-bindings of sophgo,sg2044-dwmac
2. Add common helper for fixing RGMII phy mode
3. Use struct to hold the compatiable data.

Inochi Amaoto (3):
  dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
  net: phy: Add helper for fixing RGMII PHY mode based on internal mac
    delay
  net: stmmac: dwmac-sophgo: Add phy interface filter

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 ++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 84 insertions(+), 1 deletion(-)

--
2.51.2


