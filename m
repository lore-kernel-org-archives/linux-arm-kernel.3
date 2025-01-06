Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F504E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FaE6jA7/9ttNgKRSpfqIqxN/gQu26rH/PYdcqquPoas=; b=l1F9Cs46AwdrUfCZ8DsD9uU2Ie
	sVhftQwBwf201MekJd2LO4Ytz5/4dh4/DLT0/UjKEaC3aPtUUw4x3s0MGDp99v8PuM3bHx4mD7alZ
	THcI+TN8tJ77BInp0mqr2bIsUSXCEJc9ubgxiecL7OCWgyzPqgIM6pTxQkdl708Be49YW6uoyhq3t
	z4w/fzl3dUHtVd9YRhs3vqKGUWgAUZb4R85XsK7um2ehjMRO9NcUuxHh7vp0pYuShpPGu8sak3zgX
	1QnmihiLeQuyz08/Pt4m+/Kvtc6k3RO3jepDsEmDwMEWn1CflZVGQVeJws+Tyy0qx82WNlvt0YNsp
	NFjHf7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmaY-00000001IcQ-0zRU;
	Mon, 06 Jan 2025 12:52:10 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmDY-00000001DpJ-0Pld
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:28:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21683192bf9so201674585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 04:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736166503; x=1736771303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaE6jA7/9ttNgKRSpfqIqxN/gQu26rH/PYdcqquPoas=;
        b=LJnwYq8UEyRQW8nsMAko748lzgq2pugX3HJQiK56Vl8MiM805YoCYW6f7wRkaO+U7x
         xgUG+tYCNVtz6ddkYHQCx3YnFERAjeS6a2Vmzrb4MpZr9xsChowx5+agWL7IupzS/4xA
         uX7uN5mGJ5jQstAd3YtBk65tNmAaAXhxlLSCfLwkVPNi21eoylmSnz5tSSGddfKjdATA
         jaQo17AG4tgVKKwzC/mpfUT/7QVwtIaIKIQcHmHneDhIaGSKT+E4fu58hNb0X/sUl6Ih
         bwq8DVGH5S8JYuOEeXj9P7K3j1LTgQGm4ka726/+2/aMzM2UV4owqo0MN8V4XjmjftJJ
         E8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736166503; x=1736771303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaE6jA7/9ttNgKRSpfqIqxN/gQu26rH/PYdcqquPoas=;
        b=eozfVQFq9uJJOpPrRzzYmq8uvRmQHHCYNGfMPV0s8b+BBrEoaGOZftExsAzjywjzT+
         QMRX7a7YBykSFydWBMdFMLDpcLFp+Qca5TrNAeqn0i6kI30WvPjkfty/CQb5VuUzqTOv
         D2jAP5x6koK9hmEhPdyzNbolvPWEjb0koc+umTy1sSj+tMd4r2Gnelna8B2SUYSHs3RB
         VcYvLP7WWI1ElmCGC2XjBYLni0rijNDFDfSolaCP+d2yexUMPwZrX/7BOgyH9zP96HUc
         gE7qO034adanyqahdXXDvk7TjV1ByejyLRxrPZrMu40x93u4pPbP7LzotRz0wmgZrXFK
         7aTg==
X-Forwarded-Encrypted: i=1; AJvYcCVUo/QiHKsWhA79EuXbouucx3Dm/0DiYg+e9XETYHPZIfbu5sBVgSJecrmZDh6Zr+qBTzSlarhYjPQLsJ0RSpkB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6VBSpZvNVCcSf0xI9XTVQlE8GYERpDYIa6a29/JSXbx66XTiE
	ebLcCkXc86gF4n/R/cYw1x8TwzjmzaIJLhgfxFXsDJAIPleaCvpZEprul42RxPM=
X-Gm-Gg: ASbGncuogx006lcYxZLzu1MEEDxLsG3rBNQLO+cU5F9RAAdyluxo3s02EWgaxT5pENT
	NkHYnvbzjgALaY+K1KvNCfEqZMD6enDs+XPJp5yT6Wq9WIPm/eLjv74s39AOGKw7gFu4g5Ov7/z
	+zab4jEXHQfgbFYM8x8J41CB2XSxng4tBR9+fb91dPXJPgURTpFmoQ1IltlgqAeom6n9qgwbqcT
	ZZXC+sBoU4sqMXqOHSmOU5L5+46XzHapwylYG9wdcgVIW52av4O+4rNog==
X-Google-Smtp-Source: AGHT+IEtmv/rpXen4PxhtrgIHjNBw796XJqJRJF2YmhT/CZwKLvKOi2KzJX4cOgtxTYNo+/18MSJDw==
X-Received: by 2002:a17:903:2345:b0:216:4e8d:4803 with SMTP id d9443c01a7336-219e70bf2e8mr696777205ad.42.1736166502616;
        Mon, 06 Jan 2025 04:28:22 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9650bcsm292678655ad.39.2025.01.06.04.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 04:28:22 -0800 (PST)
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
Subject: [PATCH v7 00/11] Add PMGR nodes for Apple A7-A11, T2 SoCs
Date: Mon,  6 Jan 2025 20:26:17 +0800
Message-ID: <20250106122805.31688-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_042824_139906_B93B672B 
X-CRM114-Status: GOOD (  14.99  )
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

Dependencies:
- Split s8000/s8003 SoC DTS files
https://lore.kernel.org/asahi/20241222172735.145764-1-towinchenmi@gmail.com/T

- Device Tree for Apple T2 (T8012) devices.
https://lore.kernel.org/asahi/20241222173240.147675-2-towinchenmi@gmail.com/T

Changes since v6:
- Now arch/arm64/boot/dts/apple/s800-0-3.dtsi builds, somehow this went
under the radar this whole time... a bad merge after the bad rebase
made this not noticed earlier.

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


base-commit: 657dda2ef61e9b9e7107b672a0c49d2c594508c9
-- 
2.47.1


