Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9259C02194
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vQ0bIWQ9q6zEM/5sxJXyhS9znYkoFFSEkIGy2uTUko0=; b=AMre8sTpI7Qk+6Ns5k6/PjfUza
	BLUzmHuqnA++YZOf6KnzKEmAETGfge/ulbfQnnM/gSvbtZNz+80E/k+uLrLvPeQUfFJPwcCVKrGUV
	zrHgs/ZSA29apCJCTpYrI4kSHS477LYQFsJz+l1C8gouQuRYEBu10xfEoFXvowbvpmED6Y9yijOXP
	GPAxqZRQPJZGcJvtJtcxx1S4/7VtIaWdQCyP6XK8CcPiS52OpcgGoa2aFdX79vz+fdZ5IYWKA8VWO
	0IfNvtVwHFjfVICOhPPWfK8vnpysguJ3TnWacgorPgm8Uu71/w8DOQ1ZJBo4VmfS5UvOlD7A8IynP
	EEvrqzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevR8-0000000FLl2-1hi9;
	Mon, 03 Feb 2025 12:20:22 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevPn-0000000FLU3-0QxO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:19:00 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ee74291415so5438565a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585138; x=1739189938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ0bIWQ9q6zEM/5sxJXyhS9znYkoFFSEkIGy2uTUko0=;
        b=kh46Xd/l888xy2ZHev7rcNtqqCac8xkmwTaHKuAYMNqfxP1e+LSU2KIVQFIoYktT1b
         9gs9K6obfrimGAlfiLLF58fG36K25BnESMI603H50fc3BCwJX57Dtuo7HYR9/iPqVFN0
         1qpPLfAngoYGv+xKPsBGbe2SQRZ2CpdfKhh65fwGOcFBxGMQjkja9nUmtGrMauFYqbfy
         WBUPJuSHpKWT7sgoTnxCuzfgxQf8jDMTmW5pXA4fSw2QYiHz1jlaXEgVUZCBqrkPKtaG
         HkiZXEwwoHi9+bDkQ9fZM1ZrGNrcFO1GOkHoUxpoH6M3MWD9uOMYoMkqWRsk4E0Ue9El
         /tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585138; x=1739189938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQ0bIWQ9q6zEM/5sxJXyhS9znYkoFFSEkIGy2uTUko0=;
        b=RL5mZHpL9ThLtY3CsTX9RfaBxcgRGl5q4jlSYSjisfyJNUW4QB75Rl9fd2hVYjFQX1
         hKwUJz4IsRF5fKlZ6Ht1twC7ejcDP4iqZrg6jRrp+vHzVNGDyf3x8A6zNI/cY1lqc+Oj
         54csh1ynPZi2s7PiQIXiveJc0oETxZ+9XO/r2zQ2GXKaXTprvWFhsmaB0so8H6k+XlHU
         DVgL28h8SmV0EL76f/xtB2+5eDkTbwkBWVSIAbpaNkKgDeVPjkLtUaqpb82tMzXg+si9
         EU4ABrU2e4xmUQW4mx+WfC0pH7r97PYYxY+fc2kTV/O6w97S+yrKHmqf1mmt4VJkbAug
         N2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVFtxx3hGRLbdy7OPb8dhvrdbJLEKqFblfuFIpLgrWOt6JbYOsOIKLvJO4QvgZ7l/+efKlK66z5EX0hXd/fHY9K@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo+USi1QHzOenI4KZtUaBdrWE9zGa3PiIu1lS8ESpj9HqyllFE
	FUIYO++48aheFRa7mK338Ae2Ox49YrpP0xa8p+rOdraBOLRarsBs+JJXzfx+
X-Gm-Gg: ASbGncst/0QZ2L+ec0Ubz3NxShw48cv8+SvbC4HKyLxBjcszIwdTmUNw5LhFD+eMtlP
	OlIFZHOMdza98FiIWbND3rgN3wH5kBnynsoomQlYjDpuFkI+f1Kzh4tf6RhBZx8nBiOo38U2jl7
	plQ5o8SjO4y43VBh4YDaeMDMsBfljsmADLI4HdjJmQgZ3guAST0eLddw03CUWkWasuwAwssOlqe
	8wQsqC9yj6iX6Pmaub261dc+sbwVb379xenT3kvLpVW0Y1+VFoCl0sccKZ+MseT5tozED4L0Bol
	G02CLOv8O6Yg4QHP
X-Google-Smtp-Source: AGHT+IFFymEkMEGgrkjU7zGyOQqWTVsUSLUR/9aihtoecd2Y1Z2PQnMwmmui1qhml39JCWlRaPhsIA==
X-Received: by 2002:a17:90b:2f0d:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-2f83aa7cfcdmr39474128a91.0.1738585138321;
        Mon, 03 Feb 2025 04:18:58 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm8789225a91.12.2025.02.03.04.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:18:57 -0800 (PST)
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
Subject: [PATCH v7 RESEND 00/11] Add PMGR nodes for Apple A7-A11, T2 SoCs
Date: Mon,  3 Feb 2025 20:15:44 +0800
Message-ID: <20250203121831.36053-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_041859_142773_85FEA160 
X-CRM114-Status: GOOD (  14.34  )
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
Apple A7-A11, T2 SoCs, along with the associated dt-bindings.

Dependencies:
- Split s8000/s8003 SoC DTS files
https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.com/T

- Device Tree for Apple T2 (T8012) devices.
https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.com/T

Changes since v6:
- Now arch/arm64/boot/dts/apple/s800-0-3.dtsi builds, somehow this went
under the radar this whole time...

Link to v6: https://lore.kernel.org/asahi/20241222173750.148071-2-towinchenmi@gmail.com/T

Changes since v5:
- Rebase the series such that splitting s8000/s8003 device trees is the
first patch to be applied. Now this series depends on Apple A9 device
tree being split, and the T2 SoC PMGR nodes are added in this series.

Link to v5: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gmail.com/T

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

Nick Chan (11):
  dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
  dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2
    compatibles
  arm64: dts: apple: s5l8960x: Add PMGR node
  arm64: dts: apple: t7000: Add PMGR node
  arm64: dts: apple: t7001: Add PMGR node
  arm64: dts: apple: s800-0-3: Add PMGR nodes
  arm64: dts: apple: s8001: Add PMGR nodes
  arm64: dts: apple: t8010: Add PMGR nodes
  arm64: dts: apple: t8011: Add PMGR nodes
  arm64: dts: apple: t8012: Add PMGR nodes
  arm64: dts: apple: t8015: Add PMGR nodes

 .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
 .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi  | 757 ++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  22 +
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
 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |   1 +
 arch/arm64/boot/dts/apple/t8012.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 42 files changed, 7097 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi


base-commit: 146773acdbf5afd40b0faf7383061a95adee8a2f
-- 
2.48.1


