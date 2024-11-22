Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A90AE65D3F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jMwyC39icc4IvLpJGYFqdt3FBTe+CoSHG8g9XwWwf/M=; b=WIMeKXapoq8bBat7Az5ooCDOQa
	pKxH1a+nTR7kgfPrL8Ey39Jq7M9QOHgwklGGTeGV5HvmkQM4r88XrCwdBFNFNeCaEckgeyUzpsVnm
	ie0K+9IB226zcCe442Y1n+tc9hZz8sVXfoPZogzFn9jjxkcNQt1U3pH3YfxmwP93zudzwhR3X13ku
	/TzNM50dVvFKKJN/DMpZI6wF7Ynr3lCZjzpzLEBGxdvD8yLAMamRYlGHnF47h6jyNMJvneOtcT95x
	3qg9Ghkr7YXkvDFO50FIrUmTIwby5HSmgHU1H+l3FSBtmSky9gTzEkyRQNb8rrkPjrAOfNVI4OkQG
	1I6ZSOmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQO0-000000029tm-0hbK;
	Fri, 22 Nov 2024 09:55:36 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQN2-000000029g6-39t8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:54:37 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-724e1b08fc7so422142b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732269275; x=1732874075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMwyC39icc4IvLpJGYFqdt3FBTe+CoSHG8g9XwWwf/M=;
        b=hEWb2C3nWus5BawAGQUSWJEaJxxuGMsUu0lGe9oKUNxx8JJ4m1cuRjvbE0CM/1KofA
         7SUKj3MBFu6Ux+Q5ii2eoz13fN9hGlNMsxDPX8E0yzS3oJs13F9LR1zCqFMqqUZzNHbg
         Jo47vRPPpstqaw8N7PugQNDKEbnFEXuHb2H7pqKC0Nob09MRsE/G7k27kMv6HYiD2aBB
         vHOqGlNnafAzIbRuYmnGEPpSIFLM4icziU06CtqWxJB92iBMS1qDjmA6EhrEwDr/rp9h
         LwU8n+ZR29wk1GaZedy+IcshbKlBbvZeYwKJV8JKUHI4QNXt8gpsG+XzaZQwIUxpAk1C
         MUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269275; x=1732874075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMwyC39icc4IvLpJGYFqdt3FBTe+CoSHG8g9XwWwf/M=;
        b=s/Gs0+Rbvcw4iQC9sP7xUleKSX7SuIPi0tr5vJAXtaY4PF8qp7CNYdw0nJy/tXlmZW
         13bfO8tJQuWshcJQIFfHCPGkaCcmY/a3IMK1oWyduWu2RhKe5wm91EzuZdlXZovSYFzS
         OJMZSYSkkI/M6XIQBYmkcGhhsno0vCpnkIbzQx+dMzMmyIOkm/gkVCwPOY38UM2v0Xlw
         Mz6jnRVIQgu/+g+UD4d/QOZc5jQiWYfTkA15kJygp9ydVxX9HEWmgd2i3iquqpWUIUqS
         yz0+Bzzv4MrLcVDsj6+y3NcULdewGBNWegGoWWRSJoGmDxKnXDweeExWsnP0Uo7wN7KH
         ofZg==
X-Forwarded-Encrypted: i=1; AJvYcCX0qajXAunYXeCWKJ+7YC3l3SAfJ7hXubWoL28RjH/+j4tirGtiPC1lFdVYzyJhHcB5LdHGKH/WUKYsA7qg3FlP@lists.infradead.org
X-Gm-Message-State: AOJu0YxoW+3v1RTdKi0SuYQ90dUVB+234r9G78gJMRv/OwTXfTWU7hLn
	DSbbV6iHnyuvYrMkFpdUDwijXpxMf/HvMwxT29tJWcFnJPQydjWcr3AY4g==
X-Gm-Gg: ASbGncu/J0Bstei9JXBWeVXDHXCTyT0xUwXTQwx1CJ57iWBUr/a4zNyKutVo/FyOXMJ
	6b7yLiRnO/on2jrKM5BnxPrRfAZ2pkj/XlvLPaITLPLcAXCV2/yutvHI3P0sirHRrD7vyZt5O0q
	G/wJ/0bOqfFP2byuazoiP1Pqov9KufuPZc3ke9G+UbW0oLLFga1dDaEd+rifQwH9aw47XoQgZDB
	QmgWn5EdlvE2Wcne9Jfdo2bXh8xrukkWCQRdW1Ih+mBscx2hFzjuaXjSCiZ3x/vMcM=
X-Google-Smtp-Source: AGHT+IEjVX8VWWWGoeSVP64ft86gsom9aoLkVu92O9mQT+9mQ+XFMKlDJE5V2OCvy3SC3WAbz6IS8Q==
X-Received: by 2002:a05:6a00:c81:b0:71e:cc7:c511 with SMTP id d2e1a72fcca58-724df68f1a3mr2932208b3a.23.1732269275199;
        Fri, 22 Nov 2024 01:54:35 -0800 (PST)
Received: from localhost.localdomain ([182.152.110.125])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7fbcc218a87sm1236332a12.39.2024.11.22.01.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:54:34 -0800 (PST)
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
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 RESEND 00/10] Add PMGR nodes for Apple A7-A11 SoCs
Date: Fri, 22 Nov 2024 17:50:29 +0800
Message-ID: <20241122095136.35046-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_015436_789578_BF1C3E4E 
X-CRM114-Status: GOOD (  11.65  )
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

This series adds the PMGR nodes and all known power state subnodes for
Apple A7-A11 SoCs, along with the associated dt-bindings.

Changes since v2:
- Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
is required to be on)
- Add asahi-soc/dt back into the subject prefix, missing from v2.

Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinchenmi@gmail.com

Changes since v1:
- Removed "framebuffer0" dt aliases. It is not standard and not needed.

Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinchenmi@gmail.com

Nick Chan

---
Nick Chan (10):
  dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
  dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
  arm64: dts: apple: s5l8960x: Add PMGR node
  arm64: dts: apple: t7000: Add PMGR node
  arm64: dts: apple: t7001: Add PMGR node
  arm64: dts: apple: s8000: Add PMGR nodes
  arm64: dts: apple: s8001: Add PMGR nodes
  arm64: dts: apple: t8010: Add PMGR nodes
  arm64: dts: apple: t8011: Add PMGR nodes
  arm64: dts: apple: t8015: Add PMGR nodes

 .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
 .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi     | 757 ++++++++++++++
 arch/arm64/boot/dts/apple/s8000.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
 .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
 arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 806 +++++++++++++++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 930 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 39 files changed, 6236 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi


base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
-- 
2.47.0


