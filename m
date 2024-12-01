Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98114D49771
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 16:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hLTw328DQY3n+nYpsFgKV/IZtfLPh9HpMEQT4J4adnI=; b=B0CCf6NJ0WYdRMBJNdlE9oFEob
	NE4HLEcxWfSaJpRoeKyBGAHhgqM9XRoHTCB3H9qu5IG14hE2v48W9rFg2AczEec6nidFQbHJU6jrS
	xYKK4J/AFVFYDbQD8oqltoOzAFXShgRn9vMsg3CoABi+tbt5yPI+59NcyzMcGsB0fuR1/sk3aIQ0Q
	on48ZgdzzEdEGtbFXNY7IO7jkgZJQKbPSnvUBB1MaE/L+khjEdwDDfs3Betb4uMTjB0aI6TTcLqnO
	1g6ZRcTsR7bY7mdmmofO1nEAWZCfq1EoQD7hZ4B9oCkUKdIMhIJ1BZVjRoqttd/hfamiRhF+IYhOc
	bWK6Go7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmOI-00000004125-2BQE;
	Sun, 01 Dec 2024 16:01:46 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmNI-000000040jP-0hgo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 16:00:45 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7250844b0ecso2741806b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 08:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733068842; x=1733673642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hLTw328DQY3n+nYpsFgKV/IZtfLPh9HpMEQT4J4adnI=;
        b=lBOuKSkBIZufP+xnqvcrRfw9yVL0OMllSCBvugptgJj5RY1/7OI08AyyPt5bncd821
         +jM6J67+IxpO3dgDuM4dY7ABA/JJRWl4muCSUGA2U5M9tEjLcYQc8/eN+ri1hEgAkbJ3
         lQqSvA/B31SjJZlQpRkp0rWIP4BCOuW5BV3dOXZ8JUqy/uhS0KuDb98us4oZpRiQ9xaY
         Rz90kGkwr/Vp5rY8Ve8aGGpXn4J/4hMJiU5si+2tTZu4p2LDL/j6oBYKeHrtWUjiaS4T
         G7Djbt8qzH2yLvwXFyrVTXoPpjcT8dq/tAufDBGYefpML8xVS5+hoJCbvkWns7R51tqQ
         5/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733068842; x=1733673642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLTw328DQY3n+nYpsFgKV/IZtfLPh9HpMEQT4J4adnI=;
        b=evL0evEIXUSv+c7beGti57oIhD6NEcf0Q4d6Tv+OnEydg01Ba7ZqcRiZR5PFqfDo1I
         UMdc1dWgBBJb+rNVD1v8aWNWVqLA4H9yJNlYA5aS1t0xlwWAK6CoSTYl3IY5FLFXdJVS
         nSLu/BFZYxfJBl8MgoPmdxSKLUoQmUT2tCvo0tsyq6ZHWoKKSfiCUGMpaiXlFM5ygmdO
         GKBk844L9leQ92jwRcDYLwOfYdhr91bJ/O04RGdqoRTxKj5c0I7QE+t56sQcbjzFlp+B
         LnSVWJBtWvrK5icXXHHkWi+93kJQbNiDZSGMnYq+yv5gNwFHaln4TMN87c/KPOTSLhYb
         05qw==
X-Forwarded-Encrypted: i=1; AJvYcCVecGbXAb15HOsksCE+KmOZLnYIoHtHhZwX1wA6jJA/7+GQ1HrGjozm+lbX2OMkntSFRKy5RG0aiCLlnGrJP6PL@lists.infradead.org
X-Gm-Message-State: AOJu0YwcdVUxS8Ze01yfKIqCGwWBrwjg9Jt726cfnkpM1u3mWZn+fdMk
	gPAuMqJRKvsk4zAWzbj/IrcxJgZexFuZMJgMHfU/TEhSo1H/zkOV
X-Gm-Gg: ASbGncttzob+hhx3qZaqjPqlGv0Zud1WxBG/DTzVPCDDGstPVhgXtk9CDUI02jpuIjz
	YkGNEdzVIxXXU99nO7exvGndT/91u95jbvxRaoOXZ0levqsPthfeXJf8a3FlRMDsLIZfFAItOX6
	nX3b5HI/wqned/vzVDQxkWiGwzytBwRsSQ3bA7xm+fXZEam/OZJFnVI9RUGtNpVcD2pQ5GVTyvW
	Q3rXcpbxl5H6th6J0F2CFPG6RgslPthr1vUwpssr7pulgPLWzGwJqzo4uBUXq8Rog==
X-Google-Smtp-Source: AGHT+IGchtk633+rQf9MvvkRJKgrKmqU7Z/WSWsyNWH69akPMsMA/WPwo6E4IF9tYA9VQ12V1KU66A==
X-Received: by 2002:a17:90b:4a83:b0:2ee:bf84:4fe8 with SMTP id 98e67ed59e1d1-2eebf845036mr1872439a91.30.1733068840880;
        Sun, 01 Dec 2024 08:00:40 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2ee6ebc4a73sm2395173a91.0.2024.12.01.08.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 08:00:40 -0800 (PST)
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
Subject: [PATCH v4 00/10] Add PMGR nodes for Apple A7-A11 SoCs
Date: Sun,  1 Dec 2024 23:56:37 +0800
Message-ID: <20241201155820.29259-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_080044_231838_4F2E9D0C 
X-CRM114-Status: GOOD (  12.53  )
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

Changes since v3:
- Add "apple,always-on" property to "ps_spmi" in t8015 power domains.
This is required for cpufreq to function correctly which will be added
in a later series.

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


