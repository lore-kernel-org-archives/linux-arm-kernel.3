Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AD0E6C604
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 05:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z1y/UHRMXAPYx3GISOfCtLlDpAXY6Bu+5WAmn6OKXMQ=; b=2jYIuigTQbKtU98/u2swqzW2jS
	BiifBpiQyOi/XLE7LH8/9+WKW/AMskSsMXYvlijSl7YkQMgvh0iOWdJfaXmXuUFplvPAODpBAe/FQ
	nOR0tf5LzB3ObO1fCg11nkLpH9LqmyRxL0BXdepkuGFZZkthPSbFCFdozXhSv5nCJgkuKLeYQIYb9
	A5UByKEQdcgLSxtupsi3PjiQs/l1r2mYp9epKOyvaOPY6Z8FOYmX0r00vtpWn+dTtbnXrC/NmZRN5
	x8FTWpoGOCLSrlKazOnxJoGjh9f1eLCWLufpZjUca/jwgxMfzmeklyVZPPnais1MciN6ZTAgP9+Jy
	TGhIHrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIL91-00000008HdC-2XRB;
	Tue, 03 Dec 2024 05:08:20 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIL80-00000008HKW-1CBF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 05:07:17 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7251ace8bc0so4228274b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 21:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202435; x=1733807235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1y/UHRMXAPYx3GISOfCtLlDpAXY6Bu+5WAmn6OKXMQ=;
        b=YTkURD3EgXoXAIfDKYOW34T0xJrOYwEJID5U6aR2GVLLYS1thYpmNNTTUIckWld1Yo
         mZHb+cpsle+x4rNd6+r6c4eVRUxlLLEWW7v2WITy2B+0qGLNPMZ949SjAuuC3+bNRNqd
         MkyIBEXyY1LHCEGbhGgeRVT1hk5jdkC1VYYUcqY7IHmUUswT5tTbHqzUDsqy4Q0dElIo
         TqnnLlViXrd9cByswHF1clIRvGhZFXETVU1DTr2SoPmz2FIHj4rhORjJ7r2+h6rKeDUD
         uIjY9sJEHf+255m/38g93ew/8GyDjS0QUx3tGA/pR4iLTwWqYYHBh6fzsTs57rGA+XV0
         nAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202435; x=1733807235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1y/UHRMXAPYx3GISOfCtLlDpAXY6Bu+5WAmn6OKXMQ=;
        b=XxRHt5oZuo+Caa2xoNjRLTdnAy3Mmh9ci1l5Eq5rBC3R7YVGjnMb3RyWmVk8zd8/ku
         6iJLK4k/JgNYY9exeyRJzE8O1KDKyHtOnI5Uo5Uw1BSpYzgwFpt8cDW3DC68QKN0Zaki
         LboLJtiEf6ZHOI8M58dTByG0hJYGB6nqtOU4ZW+D5qL0CMjR5N8ubX2DdZukuby47uv1
         /hPqHIhK7owBByh1IwCmYWInzuoCn8KCGX/EzgJLGdjTGmyNqYP1BSbVVfCHirpTTR4q
         juENxtbY2244OkfOZSg1DAy1i6ORLbylr+Qnc3njoZ8nkLY67ydwdDEwJtyQga8fwe42
         7EFw==
X-Forwarded-Encrypted: i=1; AJvYcCVcZUFzYKKUHcF1+5bH1gVy2ybYaarG9I94yyQzy5ekMAqV9xWodgpbdqTbNhEb5biEfol6vFGRRV8XwLPGk3Xp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7yCw4+EZ9d7UofvIsMWQgdFHxfabSZ8LdMzyCVAy/6OFqNlcA
	z2Rztzg9t8YO78ACVX8xgrAufqaed/fC4Jg/diZA0wpLQEicntHL
X-Gm-Gg: ASbGncvmXM2wtg99YF9RCjZ8M0DQWPDwH8uDvPOeMWZvtMjxjJKEL+ZssvWcBG8o5bG
	5xT2gDyD9WrQmJHQxuBbnrJVkT480117we58ZKSmmJL7vyvrQgfw/VNsRIsrVkJsb+eRa9THpRx
	6Czd5ZL72LU7cNsm53UBH+xKVKQNgT3ofXcpth4eshud+iNBplG6KIt4qQDubjOuowxnuKvxfL6
	qZu8Wk5Y2rmwytkv3bMTvShHZ9HzoRq9CpdnDZPNkw9vVJFeX7LGsDGuyhpfLdB0w==
X-Google-Smtp-Source: AGHT+IEbfoV1aAFVp9GssTPLkbkHiqHshw1BAHV/JqI8/B7VSItMkDiZOcTGZQPqX+w+8P/MSchV7w==
X-Received: by 2002:a17:902:f688:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-215bd45d02dmr16275355ad.2.1733202434761;
        Mon, 02 Dec 2024 21:07:14 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21586d40afasm33242385ad.270.2024.12.02.21.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:07:14 -0800 (PST)
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
Subject: [PATCH v5 00/10] Add PMGR nodes for Apple A7-A11 SoCs
Date: Tue,  3 Dec 2024 13:05:30 +0800
Message-ID: <20241203050640.109378-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_210716_324419_11B47AC9 
X-CRM114-Status: GOOD (  13.58  )
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

Changes since v4:
- Use imperative mood in commit messages.

Link to v4: https://lore.kernel.org/asahi/20241201161942.36027-1-towinchenmi@gmail.com/T

Changes since v3:
- Add "apple,always-on" property to "ps_spmi" in t8015 power domains.
This is required for cpufreq to function correctly which will be added
in a later series.

Link to v3: https://lore.kernel.org/asahi/20241122095136.35046-1-towinchenmi@gmail.com/T

Changes since v2:
- Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
is required to be on)
- Add asahi-soc/dt back into the subject prefix, missing from v2.

Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinchenmi@gmail.com/T

Changes since v1:
- Removed "framebuffer0" dt aliases. It is not standard and not needed.

Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinchenmi@gmail.com/T

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
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 39 files changed, 6237 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi


base-commit: 9ad55a67a788c0806b0fe23be36fae6dbfbc3fc5
-- 
2.47.1


