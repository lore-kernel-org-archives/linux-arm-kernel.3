Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C10CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 11:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LN8J2MPpiqnkZZeP9rMuN2R02piDWN78Q70NiOhBpfM=; b=erACsN5xR/hPqdtK0yCvabme6A
	Adi1q4wHkh8UNKJE6e4w2NFInpqp/Tv70i9nGk0oN2hcxRH/3GsZW7F7TeGmAvVLBV+EmZ2vd7jb4
	yP1w4LA+1Pi/VbXRsxm8zipuhLVfLMkfpkfQV3DjV+gXAiUX++i483Q6WAuPelOr7IYmy+OpREMhs
	CEGNOhHJtzSXjEP/GuG+jj81rIuhld3Yc2x/CmxE+9JCsgq8sfB0qgGvHD9zjcdHHp7Q8vY6um9GX
	rpwMTozc9sjTXl8rviqDrCvAsTeSIo7G/9sHFCbCIMgm7l9Yr6WQy0Q4R9T+sJqztvNKuoknz0ZRm
	sNaAuHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKTL-0000000HBZs-48Gf;
	Fri, 07 Nov 2025 11:17:40 +0000
Received: from mail-pg1-f174.google.com ([209.85.215.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKTJ-0000000HBZP-2Mrl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:17:38 +0000
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b994baabfcfso393609a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 03:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762514256; x=1763119056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LN8J2MPpiqnkZZeP9rMuN2R02piDWN78Q70NiOhBpfM=;
        b=H268KpOObQ/c/1apqP3L+jL1o36sRRqel6FUyfguWjldlZUjZY6hP6Q4+84h+/DlhA
         F8WaC+4Py13IYcd407eUn2+jHsKjcFB/ook6TJXAYS1lndSFbiIyzcrhvdm71YE1HoNQ
         0ZdxSt2lvhoyezMTCDjFwgkh2cs+MzSOYHCuqYXBK8lEFsnIMwbAf4etGdmExOJ9LHjO
         6gi7unYcMZb2RDyUV+xFimWYXHgM3I9R52iJj+qmB2udRMsLIxG3Wg7Pl+4RV8uZe5fE
         IBwcE0ETNum3axY22g42v8pUvWrpK47OqRoSpCbLa+DSoxyJEBIELFnvNLLQ5D8Dx5wX
         uLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514256; x=1763119056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LN8J2MPpiqnkZZeP9rMuN2R02piDWN78Q70NiOhBpfM=;
        b=aKWydhzaaA9klrgk8rD/g1Bk9tP7WB5gGCVzBWEA4ot2wQ8f0tnVOzcR5O16pMj39b
         bbb3CtVFSNtVNcZLrgXRE2yESfK3+TMxRSDldpStoMdGqyqiuYX6fXk2WqjnxXluG9qt
         MPuKKE2SI+w0GdWAbletxOb9UXjpCu3yTUB/1WXeV8pQzgUFsENtzIl8bMEFtV4zxMat
         TPjcQOgI9NTeuOEK83dWpEfX7frLh+S+k4TSoRiWbCuemXIu79pSdjqMyY7eGmuAjKcx
         AM5TIm78ShksEp9OL6/tIy84fNlQcf8WS/Wgp65MqGf6gEcMbwMYzTXj/rUYWbRht8i9
         pDcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX43r6TcRZV4itaFmVt5dYZVYArHhf+G20r1j4BvLgs/oWYMLtlQfvbXeArzNj9gyuBfbQvO+toJOmc5y8LN4V+@lists.infradead.org
X-Gm-Message-State: AOJu0YzRbVsgjSV+9Os0lDz6ANSKGZf5Buqmt+AgtcqZu9x5bJMA9gRi
	1DfRzXITSIziosYelDva2gYuhzs4eEfMeFqeC7+dSpiOli13XpzV+k0l
X-Gm-Gg: ASbGncuZILl1sdl5+tS5HX2nZyhPY4fZaKa8xsLE54MNv7/AInaK0nDagpbMESvcppY
	ihHAgDqsgco+h14GSIpe3ht+nXZ33eqVH3ec0tKtC9uU6tFI4wGiy7Usi730KYz/X6yv+leVa3m
	O03s6p9McnxcwbiK4ZSAkcd4cWNfcpUaTopDt08+DzOFcswBB7mxpk3M3/fdHFPX9unKS4eSNqi
	Dy5eHs/InXht3eiIKJ0kUGy0G6r2zk1HIDyEevJJgGHpYJskLnfWS2zboRLL6OAsd5EuwM/fC7/
	lOY8soxrltaEJ7BeRzUf62LoBEroSfTnv7ZtTnE3XkxiDU8JOck2R2a08IRUdUyabf1BZlQoEy7
	pIp/6hlUtEJE/UZQSJJ1D1mjithpNtu9hsEH2GBN8NYbhtP9zXRDuNVyFX1BImuOxgJ7oG4mFke
	Jxsd8ZsbBNMg==
X-Google-Smtp-Source: AGHT+IE6dkmZ1xSfeQ8gFlQLsPa6AwKU7ATxDW7ucEzzW+bfiWTWRF3rzrVJ+aYG0hm2l5jNpYpSqw==
X-Received: by 2002:a17:903:19cd:b0:268:cc5:5e4e with SMTP id d9443c01a7336-297c0386b92mr39537185ad.1.1762514256178;
        Fri, 07 Nov 2025 03:17:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c6f6cdsm58791375ad.71.2025.11.07.03.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:17:35 -0800 (PST)
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
Subject: [PATCH v7 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri,  7 Nov 2025 19:17:12 +0800
Message-ID: <20251107111715.3196746-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_031737_606086_4939B567 
X-CRM114-Status: GOOD (  10.78  )
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

Change from v6:
- https://lore.kernel.org/all/20251103030526.1092365-1-inochiama@gmail.com
1. patch 2: fixed kdoc warning

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


