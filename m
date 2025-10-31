Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20836CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 01:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4k5u4IDHa2ldPO/YRgbWN7ExpsWnE3pSTkUg9MZsePQ=; b=3IqBj+CfEr7bO4vtRtOamWkzgi
	OCvEZvBUSCjYWcng4ojp2NnZDSyvL5bo8cbPTXjeLNj6+dH85zJnrHFM7eDsuik0hZnPC/mC2UP5Y
	wHDO9KkdFRDzD5jqV6FE+s0g+Lmak5hsFAYcjA/lrR7C7ICW/FHWmoasoYsp/f/cjoWyt7dcDXwzX
	wTuNQk+nfjszH3lxSHGMWomEX+WJdZ2kKvuoxrO6sCvzrMemZXhU4FW4B2WYnJMJRCUVwAsRf2jEM
	kESE+cKSG9RHDHZWpL9HFs+qhXI5mIAkzko6jQ0UyxFV7kcyYrDNKpwteehkQjj+nXxi9ycy5/Mpb
	+xapACfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdst-00000005DwN-410y;
	Fri, 31 Oct 2025 01:24:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdsr-00000005Dvj-0LiD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 01:24:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7a76584ea6cso651786b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 18:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761873892; x=1762478692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4k5u4IDHa2ldPO/YRgbWN7ExpsWnE3pSTkUg9MZsePQ=;
        b=AsMiPXC/tbnyAQmwaOW8SgfYoMO8P8CPBWidnZ0A+4YRh5jmXq3CB78pZrVLhGWhgE
         vANB3vg0RjIwDCHE2ZTt4c3JBhtfLkYrgvl4YA1t1o7n21DE1yRytMHEb0pGB3Tr8VQG
         u6ggwHGr+iS+FP0hCCYC76coALWi5v1DEMe788zksAw3a2idJSGBqFE92Hadl5/KnSVT
         3YxrwMr2yTnoYTuHkC9+YvWH8pUK7iAEOSdzcW0Eds3AOKCgTdd9xQW2d3hUuwlgZXui
         rVtP+eKOO835BBboNbJwcQmEBtpRyAbmi/8E9L86505KgvZ3uhfG3iwvgv1XnuuK0RHG
         UQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873892; x=1762478692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4k5u4IDHa2ldPO/YRgbWN7ExpsWnE3pSTkUg9MZsePQ=;
        b=U9GkqjxchwvuZLDKlndD3IZYgmwTkigAfeu1Rc8cUy7fYLUZocAoXqHm2yG0wDazWm
         r4Im/q4RrbK/azIlRXMRLNTIG0OS9ezHj9o44RMRUOCeDRfG0iTkfk4Eyi+AfCcGnqk5
         Gx8l7Yz/4dJpKS4nR099STlKGET5QhYk2HAlu+CKQr6GjfnljgCMl1qLk1PH7tX08LaO
         /oJodVVO2yT+WWMati2JTayY8qEPRIltS/EV0i2zhba1q0FAOijBIwPjUVgjts9RIePH
         6hmcpEowGMZxrinRlb69lKCd1cMaqqbaTpsBZFeKjk/xx7IV9GRN40mqdCbRTt3f2bb6
         mKIw==
X-Forwarded-Encrypted: i=1; AJvYcCVrJdhMb+YqU8ZJWWNbTgLWGLGlh0MN3dpLyTUd2LxR+UvAtYnJMXNJREZHpi2itzW0Eb/nWgfpbLlvcqEpxrn/@lists.infradead.org
X-Gm-Message-State: AOJu0YzYKyccMvnVV1DRspEYrnFPML/S5hMgA3zFnMNztNgPceHe3GFp
	PsWRhoBF4IraVrfxJdQKtlokFKVLAstEZCwyu7gwGWdA9S3v+oghAG/m
X-Gm-Gg: ASbGncuiG9p82WXeNYep5usGSRS6aezXn/AKVgRm3NxR6UM/I7y40OLbulKka0viqS9
	smMv+cyXbkMKgU3xTfB2DwyFDktUtN8IuBPfevmNSUm6G1FlITwschrz97NHazQIaYve1mmEDiD
	JtRqg9kbjXbpX0vEzd3SIDHn/oWGvpVZQ+KfQnO4zwf17GoH6EHfPmVISyiSua1Uz+uXkpQOZpZ
	zXaKcB8V41rpYYG/UskAccVnN+gHJviaNROxXasQjM7i3m4g8nesxy55hx+WRdsgaGFIAjr/sCX
	dDi6blAAoMvvzgvSiEjxORQTCCkyGYSx3xif1JbSZ4Dvl2PHZDoZAV9jEcZKX7kqvgE2jd7dKi5
	CLk6OX6qZXXmnYdlh/Ts/YDd451lrgelKoyRKKRT1gre16MkE0dPiBq0uAqjwxmvkbIpWP5dwZJ
	A=
X-Google-Smtp-Source: AGHT+IEKj3bBCS9FtDr97rBmPSsnGuT/6Hzs7PvtGv6PRK2iG5dvba7cpbCl+e/48QRV8/RBzMyxUg==
X-Received: by 2002:a17:902:c401:b0:24b:182b:7144 with SMTP id d9443c01a7336-2951a38fdf9mr20303525ad.7.1761873892179;
        Thu, 30 Oct 2025 18:24:52 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699baabsm3091035ad.76.2025.10.30.18.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:24:51 -0700 (PDT)
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
Subject: [PATCH v5 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 31 Oct 2025 09:24:25 +0800
Message-ID: <20251031012428.488184-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_182453_139973_31DB7699 
X-CRM114-Status: GOOD (  10.38  )
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

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 85 insertions(+), 1 deletion(-)

--
2.51.2


