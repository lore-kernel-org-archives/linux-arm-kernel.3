Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89133C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 08:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lXPMVnUwf3/EoxHQfzIlGfhIh7pfwuueI5x8/O9yKtc=; b=EccubWlF8xCjWTVgsnKOvw3iuT
	z/MUrBMZQ5yrR1gk/rtOlJ7b4+jjeq4qhSR2A+O1NdsKnITeo6w+ZR8VZwvjCRcBcwCbaMzsv75Pp
	/5tiojIwYWIeCggcF6njtyYM6n1+O9ufEmYyzP925zhy/ard+h0nNnVuunYosAR8dWb+K0Fwy/548
	dIyk+0YuoCId+rj0cG5xhWQAUGBuK5hjpn0aL2Br7J2nxakqh5Vv93AnG3oGNbJCxcnu7kiJ9nI60
	ywNcxhsXBRfhZyNpC/l8yo68PwSBMxazrRPVhl4LG5X+OyYMI/WjewXed0PMSJGPlWEUc6SlGUaTS
	YlzczSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGlQ-00000009GAE-27ql;
	Wed, 11 Jun 2025 08:24:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGSW-00000009DCc-129u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 08:05:21 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2363616a1a6so16700015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 01:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629119; x=1750233919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXPMVnUwf3/EoxHQfzIlGfhIh7pfwuueI5x8/O9yKtc=;
        b=mFT5rBbxwcgz13VLuqjZ5y+49J12f4dVlmPzt8oqYQ6hWeTr9Ra2obao/y6SNcZhqe
         wipDGosA47Aqi4JGkktNkROOH/C3aKEViwKDxTPru1nfL8LlEwxpBssVtWa5W/Dc+OrD
         dJyIXnYjcC4qkClUUtMJkKUq9cdWeX9DH+ycHX2kRy622PJDTPATcAaExsHQGvGEt1CO
         HGkMkpQ90g7ZxZTNqbganrnQvq8qX0gI0ZX32RWUry+7gaWkmigq3niUdPsAYoy1Dohv
         KxPNhJKz/WpiZHrs2UVUZ/OMqwO04yepmSYziXhQJP5XCwMIycWlpFQVulaNI3xnm1I+
         1WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629119; x=1750233919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXPMVnUwf3/EoxHQfzIlGfhIh7pfwuueI5x8/O9yKtc=;
        b=mcjrF5ZdQgAm7qVvDEd1clFzES/Un4LNion3W7Api23bKuiX8XgwsTR5uRfIZEPWMF
         JIz1L3Wu3dJx/w184gAPhnpnI8vp3iLin2RsmZp+OXatb03oekHPeReDq17s51OUNcpK
         xifCANJpTSHsmxkTCEhCG1/qSPhdqfFV+KY3zal8H4W34Nm7TUBbBaUvPkNcSPpExpNI
         Q1KFap6Vjjy8LVa4yQkpiaT5URhhHWJq2MmkQCe64lhyOQ9aOemV2UIEcjIJG3d90uLD
         R50P0wbfag2xaoHTMjteax5EpVxtltUewZdreP/Whss99xmifIDcnx+jDCTpXLrVP/zZ
         fKzg==
X-Forwarded-Encrypted: i=1; AJvYcCUFyQQVzzTGAHRmsEF5r6dumWa0f+4Y84QQVkwanIM40q+lhcAqeMB4a7D6lAMom29minQwxBHfHoZsyktWkCIH@lists.infradead.org
X-Gm-Message-State: AOJu0YyP+eklN0c7yt9cYpY4ui6gR/ZyDFWUFh5ZdNwdbDgYGdp62gfE
	E+nBtaY59MiwpC6+SP1/DBfBL0akOe22Y41v++zFAaAmtZk4HZUMIzhV
X-Gm-Gg: ASbGnctwdlHgI7eT+AY4fFkeUO5v4EtM22bAa6bpwG0Pbsz8hOgXElaFZQPVHcL+xrT
	AODFsbGAsoceQV2cClYnR0ogZNj6mmPQ7A0eLVtwi3dEvXNlse6LbpstPd9uHLkIBhxi8qePkD5
	HZnNkQON5se3SYKnyPx6skyOtQ93+42rN2YZvZZY22WX6/nfVhwNmLceNErEO5hr/XX8W0JV39n
	YtwBg8XRXP7NjAl7m8jd6LATIr3651I7omOgBQAR0lgELqcEeEfZ1kL50Qf//rQ0+rVytFyR/R9
	JKe1h3Z1bTVDwY+AmDGiwp7fYtr/aPPFYpUm+bkbvbDapQpPskMnKx48Fq5OQvihzFQJtGnEXSg
	ASo91PxtesZXpkZeZmdDr/McFRidjV50uVM8RWUU31pCJy+VDVys7g5P2gJCUuKW6llVCK6/j8B
	oViYSME9eigGW5kJYv
X-Google-Smtp-Source: AGHT+IHeguJ9PfRvFO2Sr8bPSpOlwMx9Qn9l4lODdIxgT6Z8X+BhIHgTKrD1PU4ZUCit2Tge/jE+KA==
X-Received: by 2002:a17:902:ecc1:b0:234:ed31:fc98 with SMTP id d9443c01a7336-23641b14d61mr29238475ad.37.1749629118911;
        Wed, 11 Jun 2025 01:05:18 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:18 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 0/5] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Wed, 11 Jun 2025 16:05:09 +0800
Message-Id: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010520_281650_110E41F0 
X-CRM114-Status: UNSURE (   8.01  )
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

Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Based on:
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
commit-id: cb3f397b17bbda3f2998eff9e54b040c8fa85cc9

v1 -> v2
  - Patch 0001: ARM: dts: aspeed: harma: add E1.S power monitor
  - Patch 0002: ARM: dts: aspeed: harma: add fan board I/O expander
  - Patch 0003: ARM: dts: aspeed: harma: add ADC128D818 for voltage monitoring
  - Patch 0004: ARM: dts: aspeed: Harma: revise gpio bride pin for battery
  - Patch 0005: ARM: dts: aspeed: harma: add mmc health
v1
  - Patch 0001 - Harma: Revise node name
  - Patch 0002 - Harma: Add retimer device
  - Patch 0003 - Harma: Revise GPIO line name
  - Patch 0004 - Harma: add e1s power monitor
  - Patch 0005 - Harma: fan board io-expander

Peter Yin (5):
  ARM: dts: aspeed: harma: add E1.S power monitor
  ARM: dts: aspeed: harma: add fan board I/O expander
  ARM: dts: aspeed: harma: add ADC128D818 for voltage monitoring
  ARM: dts: aspeed: Harma: revise gpio bride pin for battery
  ARM: dts: aspeed: harma: add mmc health

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 85 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

-- 
2.25.1


