Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03287D5B85E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 01:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6QZuqlncHnASFQSfQcw4aMTWgJLEaZN0b1kh9Wmj6pk=; b=Wq4wsN4TF+m+0LvP6rOXzfefIL
	n0bc+uRMOkmX79I2vxEyD5VUy1GM21lMxSSOuirl/b0zempCmUNno8SIkU5K03IC2d4/SxBdEvOpo
	WhXuDhkoeAHF8+IWYYqUMNNXxbQbszuxLXuVsZLrtjoaOzUZSIFQdB1gl067Pkti7d1GzCiUvqPxf
	s5kwb2Eb7xEa4gzjNikIa/yOWoLYV+gC8AayDFFFIllJ6B42NuMOKzki9BXfcukVowY44L27JEIuO
	JEJJLfcKSGJCwifdVERSheat2NDriQWnJUpJ8GSY3RPV2xojnzE2HoTrNY4HIW4H8gUaxLLB7kFUF
	CIoFBEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5aiH-0000000Cox3-29IY;
	Tue, 29 Oct 2024 01:08:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5agc-0000000CoSu-1X3j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 01:06:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c803787abso39184745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 18:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730163977; x=1730768777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6QZuqlncHnASFQSfQcw4aMTWgJLEaZN0b1kh9Wmj6pk=;
        b=NRQFj3d0TMxoJZqqEuqkk1A/Qr13+/cKgGfPj77XHZafhHC945+yVt9d4LEUh+MuXV
         6gqMMwkXpg8iFN/yJfz8E6BUFjV1Ts9g+IxomPfkYuVXcmU4R6mxLEmGUH6gc9IwKKBO
         2wF4mjwYoUQ+zkRBm5m+fo7EtbA/caLA7qWdPtGI9RC9DeFYn5h0bAO12Xtw3jyAwngw
         zQ+Z9N5/Jf7SWDKKV1tQLK0AxZDZdmImrPHGJ1kI39uycGVBYFP3vX7UibRK2nvrsL5E
         T6voBhL5ih0zcInVpJYsy73VDADWCtPZjZz8y1/UvIMFu11CfSGndqDXdBGwzBi8bpaQ
         kbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730163977; x=1730768777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QZuqlncHnASFQSfQcw4aMTWgJLEaZN0b1kh9Wmj6pk=;
        b=KigCrbqR3Y99InmT/wTBcnrAuJGxuJux3VR5D29GkycCmHvIkV80bTlrDF9bNyt63U
         cI0lVfAIjWmpIhS2bJdI8EjHfP1wkyv+b6tArdqMyQWywitjcEI/9Ic9dL+BHA6u5WZU
         vyV5Ov9WGz5yrCARO1itnrIeyB5A+cJZbNq0VMkT08RWNu1SGCFDPyf59iBtjbrJACPy
         Q+yleKogGpw6two7qYau5c726J9aJ27c6Ys1ovAAqKEzJixFUW8PteHk8o8T4a4tRRh2
         3qlEb8VK7o0a72hEtdQBbxDJaPubfGhAC9E5puBhcdk5O31DoqmvR/GyZUe+BLZ1h36f
         fLRg==
X-Forwarded-Encrypted: i=1; AJvYcCVyAVKlUNDmr4SzXU33MqLUKIW8qkOeEajAAsgSB0Wsa1CdQWScZ4qZa2+pThp/qPjRnlGIaTeR6k69UwMG7R5G@lists.infradead.org
X-Gm-Message-State: AOJu0YxPVPaWwAifVQ16Kn6T0ZVU3+C7iEVJ3dtLmWlRZR6YeLe12OHY
	1dMq4CRO8RC6RQCmneYxCyrpLzD8cxc8G1HZqRUT5qfVzrTYRKKs
X-Google-Smtp-Source: AGHT+IHXmpqlNME9SpK/s72If+aWe6wFxCuZu7NIgnm7bl3z3OsIfdfVuVaBDQuhav9xcbuN7m8D2Q==
X-Received: by 2002:a17:902:e811:b0:205:7007:84fa with SMTP id d9443c01a7336-210ed46b161mr5094555ad.28.1730163976746;
        Mon, 28 Oct 2024 18:06:16 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-210bc02efb1sm56306225ad.221.2024.10.28.18.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:06:16 -0700 (PDT)
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
Subject: [PATCH asahi-soc/dt 00/10] Add PMGR nodes for Apple A7-A11 SoCs
Date: Tue, 29 Oct 2024 09:03:58 +0800
Message-ID: <20241029010526.42052-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_180618_442669_C6E47E06 
X-CRM114-Status: GOOD (  10.44  )
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
 .../arm64/boot/dts/apple/s5l8960x-common.dtsi |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
 .../arm64/boot/dts/apple/s800-0-3-common.dtsi |   1 +
 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi     | 757 ++++++++++++++
 arch/arm64/boot/dts/apple/s8000.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
 .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 823 ++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi |   4 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
 arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t8010-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 807 +++++++++++++++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 43 files changed, 6246 insertions(+)
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


