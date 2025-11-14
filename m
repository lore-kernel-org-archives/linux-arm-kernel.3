Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FB3CDB462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 00:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FVPzw5zfoDTWTXFnR/h7NqjV1cTezTe2Ib/OrTkeKgU=; b=wSGP3nQgmBltrL1vaVgpDqwVES
	5SRON8NnnBdDepuopV3athp5NHux4/+ERV9au7bNTDVQaiykBybc2BMzRQ/bzxJZIc4yuuyKvqaB1
	kMi2o/bI4o1TERC5Vzkkzv8DXxNVtBHesI5tBTyw8wMIgO+dgNCiXhEhq2KG7VBqOk46kFIba9a0Q
	8INjft5mNX/eJ9hHAiiQnVgW4kLJZ0ZT089fq9SJW8j0R53d1s+x8BQqCYvAZANZPDhcrdfczJcnd
	UwugBNcMqkPHuVq1H4dankXs8KKaq4uAEwfc+G5IsvEdPylpiMpNyENXwqQU8vZ/qX0bYgVHRqsFE
	kkPNxjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhpk-0000000BLBt-3ECY;
	Fri, 14 Nov 2025 00:38:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhpi-0000000BLBG-0MpR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 00:38:35 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso1251933b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 16:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763080713; x=1763685513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FVPzw5zfoDTWTXFnR/h7NqjV1cTezTe2Ib/OrTkeKgU=;
        b=KeyrKYPSeaITc6okz/01SPsW817g3FkUuH1zvzYzudzOfUoXswRYMN2g78Ef5icxkI
         fZDj+58bJLVrGNGyMNVGHK+3pfe0SyxPNtmv8l+n2puGMeAorenoyQdbiwP/7fN4OmMd
         lCAF5NtskrUbNtqow7PglcTz8UYfSjtZETwFCPo5dRCD5wVaIQ/ClVW3ipT/Pq2Z/JFw
         CuyN9tmuSo4nEeWynSHLTJVB96oE/KFFGKJmQSa7j1IJsUgSJ0TXr6kbg8VCLdeZemsS
         S8ltcjE+pdbtH+VyNJXBO6w+a6y45Ax4nGKKHprJ1iJH0i1XQISpG2srrF90H7dAmtmk
         PhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763080713; x=1763685513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVPzw5zfoDTWTXFnR/h7NqjV1cTezTe2Ib/OrTkeKgU=;
        b=txl4yU1RRh/JRCietLrdk0R/xubqgAUwu9shIKbua+y2K7iGDhBG2FLHn9GshqwRLd
         DVzSVwtwg1m4f/8Va08tu2yM5yb48lv+nSPC4qopZ8cSgSe8B7nAGjNXOq9MxtBEzTnL
         pFRU7XsgH8jJSoIBid+26ECTinBbP6ykDQcElR1dGtXtMepGHxNpn8ic0slzU6QPfBiN
         YA8laz+LLMWwCSHw7xfVSYrabr6SSSmYmVt0FzBuh1uYJR4uiceLrXNclc8k654/2C8w
         skXd5+EYIG9rSqz9GJ5/lZRWN8Z1nU9MHHKUZT6Ao4YzIKNfJerFmE8mwk3qk3MZs7Ix
         0WTg==
X-Forwarded-Encrypted: i=1; AJvYcCV09L5pDTk8hTm776I8y8lWzFeG5d6ioV5h6fezVP1s+z1Dk1OjDY/OydDoi5HumoadE3BMHjq5a+kRKPl2k5wx@lists.infradead.org
X-Gm-Message-State: AOJu0YydjTHc0SWxzA7Jt6/CLS2WXYp8DBqymPN1dW+FbFEhwT3POR0D
	XuV4Wqmmcw8wKDQ3jLmL32COz49mb7Ivq0EKM64bBVpNHZVnDYdOXKXO
X-Gm-Gg: ASbGncsVSaGmAxlTJzwyA5nm5HTg78tITH08IihYTyIpLZbzGRgTONsahWhprg8sWJt
	zG5bzap8LN5y82EAHe0nP5XSpTWB0EcaTTwxK2bFhsoaWUe6w2QahAFluPiV8rfIY2KoSmLBtNE
	KyhSHdHInWUpVFup9LQkTbwomiRmV+gWhoBjSXCxNcuvqqMY6Ma6/yiR9jaRk9/6lnQwL0kt8Hx
	Ye9QqrwxrTEALqbdic68l41dDdkkA3Vwrz4eNnlyQkDgcskrSmJw27aYSUFoHeCGIJF2pJXbR+7
	NlswoTackN2voqs2aMLDX57gKnqmOvXPrdPlH7tq0G0evUVX3sBtdooBTjeFC9oPdtO6I5py1pW
	fmFnlgHPQ1r+aDACFFD4Fw7SlhfW9407i8Y965mZ0rZpy7AWRWz8x+YO8OHniGaMKpQMubiPOJk
	g=
X-Google-Smtp-Source: AGHT+IFMN4Id0VDWD4vgNY5yrLAnESY2doxKYngxGOLEfNZ2u1GtM7J0GBLB9kpY4AWTmMpVtXfBvw==
X-Received: by 2002:a05:7022:6284:b0:119:e56b:91ed with SMTP id a92af1059eb24-11b412096e8mr571996c88.30.1763080712752;
        Thu, 13 Nov 2025 16:38:32 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885c0sm3384978c88.3.2025.11.13.16.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:38:32 -0800 (PST)
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
Subject: [PATCH v8 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 14 Nov 2025 08:38:02 +0800
Message-ID: <20251114003805.494387-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_163834_153325_731CE4C8 
X-CRM114-Status: GOOD (  11.20  )
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

Change from v7:
- https://lore.kernel.org/all/20251107111715.3196746-1-inochiama@gmail.com
1. patch 1: fix a mistake that using rgmii-txid instead of rgmii-rxid
            for SG2042

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


