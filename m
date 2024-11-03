Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2326FE67806
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 07:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JK9/LDUBjeqfgN2Gg/DD/Yg8tlljxY1YXMgl96rzOhc=; b=eTlG09zw0Z4WMxgOLtGrY6euvg
	nRlxH/yN9zYNkzSx51GfBp3JhcAZRm+Xv2Ob2E8d5Z7HJbe/GAN+iKdK4lw9R+UKxPVScY//hZQqR
	mkqycXFLMhko5ww3OalrJZzmfwBv6zLR4IZUNrTh3yr3gHSAa2gMA1tztLOVcD1YYUnXvowLOaI/P
	aB0rks5otLmIb9biNvXDF5P8ZBgL/Pe4tG2Xl/MEWyJi7OMJGir2Oc0MnZuwoXYNNfMTViEtsLA2L
	U7HKHzhdeR/3K+wIYBH941GFXWLfkNU5yFqLqPD4tTpCYw3E7J1NrtQAJvDyXx0QeUIz45+4FvgaC
	rIzUv7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7V92-0000000B5qv-0riY;
	Sun, 03 Nov 2024 07:35:32 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7V7F-0000000B5Mj-0UuW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 07:33:42 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so2489132a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 00:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730619219; x=1731224019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JK9/LDUBjeqfgN2Gg/DD/Yg8tlljxY1YXMgl96rzOhc=;
        b=JgumqKcX5XBOwpYbfWXZVBSFmrWrfAoYBZrQzJ1p4yK0dDIk88oCHR6hYky5FHcPgH
         l/2qthzDNo8FgyqzqZGhI91DCK3T2qgi8klLbpMvyjGhdnPO5yas3CBP+CQiBstCLuva
         H464Zc3sqUQELX7nJw2om8DKGShhXoLgxF/MdBYc3xQoJWod9MmxDrrmKyEfSBkpArn7
         Kd+T3e+H4K7x95kLe7GAVvj3qk9i66y2V4US6DpkvLiVmkWg66fbQ5PqqJiHIEkmfRyp
         AUfMV101rE+qFXfmrhWDXMx8LVs0qTVI7f7DdXysj2mnTjSMrbLq2Je4z8JgeEsFh2qS
         WRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730619219; x=1731224019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JK9/LDUBjeqfgN2Gg/DD/Yg8tlljxY1YXMgl96rzOhc=;
        b=OHdx1LViJqFEhkwx56kJULn4bzO545vQWgHuOL5IW1XQuaCswHUtDxVsO6C8Lp8yqz
         pp/unnIhhA/rhWSTHoi0Exh1ZIBE3Gnm+Eywa60GpSWR6zb4Es9wYzKwu9bjjNKA47lP
         Q/nVmUpxCNhrEXxiQeE1PGwCuGHVLlxq2Qy5cA2VGAP/n5+YqOleZzEVPFHyO4TuWBRW
         WQUdyOkDg4cgt44AZxxgoa3KTQ8OFlW1GTXsy4Qnh5HtW/yk/zi+/eAIxZypb9TsbNzX
         yuYpPFJu6SG+Jv3SQdyeMGuoXo5FXTUugibYgC9kROqxRpTF7hU+68UvsRlqboLsPleY
         7NUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX01TTSJN42ODMdqbEmV+7efsirFwGS+uBoDmX6VSXuWAojBaATDDb8wWxWjyVnhZ1w3lOIH+T0Exo97m49Pxc@lists.infradead.org
X-Gm-Message-State: AOJu0YztVGYJE2owVLChr6GCdI6bLjUZhGIPi3qMRlLzJTKohP1Pmhmy
	JUNavrj1ge7j72o8Ja4PKGDoBe9CEjB57iXFhjWtiOOH0iYioiHDpF0y5i1k
X-Google-Smtp-Source: AGHT+IHpO6ChUYhlaktb2w//U/SuJc4GICT1u8EbdcOi6DCPXEF/TjJe/FrYq9R1QV8LS7U+4HIwDg==
X-Received: by 2002:a17:90b:2e45:b0:2e2:d181:6808 with SMTP id 98e67ed59e1d1-2e93c1d3a03mr16305519a91.30.1730619219400;
        Sun, 03 Nov 2024 00:33:39 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e93da983f9sm5353443a91.5.2024.11.03.00.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 00:33:37 -0700 (PDT)
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
Subject: [PATCH asahi-soc/dt v3 00/10] Add PMGR nodes for Apple A7-A11 SoCs
Date: Sun,  3 Nov 2024 15:31:11 +0800
Message-ID: <20241103073319.30672-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_003341_183962_EE0E1AC4 
X-CRM114-Status: GOOD (  11.19  )
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


base-commit: 5c9de6f45db36b8a74c12e448cf9db87c97bf1e5
-- 
2.47.0


