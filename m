Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D43E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zDMdLkzK4YXyBfIRpCGTdJZPn7J+kcoIKRDno7O4/7c=; b=iQyLxcqUNIupO6Q7Tlw2jz4Kr0
	WpiKL0DPZggsEb9HmuehQHyTAVzS78CsRmkj+CAONXdGQmtGvyboJT5YjFxUd0+NdZttnlvoYc8Gq
	1ToEqynik83yBVLlmOqqA6Pe7uU81WeH2460RPkvSw7d2DQV5X7wowRDx9cG99LPK1tI/02JdPMK4
	f7gfbZ3+o1gs/1UAyZ3s3IiEahRqOZyu8+imWr/tSpVUhJly6pb3/7wHHsiVjt/CcAdWIsn/GpA0a
	j+0MftqrBlQisDRzRkwoo3vY2xK/VPH4bcyAllABxcdi7ZKtSHJbs7mTq6NUa1HW6SJ1MIvL/4sX2
	/vCcfz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQCw-00000008eTA-3opj;
	Sun, 22 Dec 2024 17:57:38 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQ8u-00000008dix-1sW0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:53:29 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21683192bf9so35583225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890007; x=1735494807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDMdLkzK4YXyBfIRpCGTdJZPn7J+kcoIKRDno7O4/7c=;
        b=N4fUuYRSgHYfsnVcbB1SpGAep0BQc0+4j3IeOqJeapYWzAlc+rERzHBP2iVvs8m57Y
         +tasWuSLbuog+zjUekY32VACBKjuxCzrlQntd/RwrXL2oTiB+e6dfmFg79l+LdpTL6cZ
         m7Nm5u9p7aWwwCbOVUIwsijsPK8kANDaRiUv6potEEzT4ej68KPI00/43h0BYMqAx0NY
         Cqh9Cks6Ba6qyF+Dyla5mhuAxvGT7grVQy0L5b5ofODtEORikQOEgsvfvpfg3YsOu/lJ
         C47PVpAahQoCkILqSYYc2PpZx2DNztP3PT9rjIr44BE3t+BA+8LtJipYEwzcmFumwlFM
         09FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890007; x=1735494807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDMdLkzK4YXyBfIRpCGTdJZPn7J+kcoIKRDno7O4/7c=;
        b=pbxEE/1O2qkfyYK+hcsOguXXp3r8pbElbSEwFTwyjaMwUG2HQoDM9X10A+N9PVozHU
         4OrtJC8lgQwDlC05pxhVLoo/mKovz58SjD0T6cUYHUru/D9TsvU874yrk/plT5fruSrP
         Af8/Bp9peZdHbw6HK4hyzRz/q2TLOf+gqZNm0KG+MdGD/lGhWXQStdVfvbECUYqFNzEs
         s6Ok1mKiNZKybrMppzqPDVyISwX7VWrrxc8BLPjlPb4yUBJtUkVMWmYn3uC8vucycNDn
         iCfxYnVZBI9ZeoIH7tc//Es52SQ4wYBlDSAOx8LsA31xUESTBZ+sqM5LGcHPwAAF7Cwf
         QmpA==
X-Forwarded-Encrypted: i=1; AJvYcCX8JnjqqEwZ/POckMnT5NGl/HT+PwVwFGFwG1eFe+wERD7g8r9oig/+Yhu9vsSf7n9sS6VfQOKrMC2ZUgT0jkEs@lists.infradead.org
X-Gm-Message-State: AOJu0YzK4O1d+aOctUfOieLVXqtN8VcFnbwgPn0SDhXtZc7t8y6yMYNT
	k5JsNkfvmvmBqmwxS7jawZUAnvVL+P85y6MzfqrhAK/lZ4WkEytK
X-Gm-Gg: ASbGnctUDPcVdgIIULzgiFFjzH7pEJD0eOoh/q0sdd9jXVIA3ftdMSx+hEPSvJWPtJb
	e3//68bHoFPz1bq+IM2HovpLATQlbDGIwF80SPOEFhAe69fKndcBnrAMHDWXBVIxrp53JNuibal
	AuquRF9LZOCdp8q5j9vyYXIT+H/7/rg9ujYhky0nZzzCF0ZNcd0HArM8LAA2kSU77Zk1N+0OSZ4
	r/kL7MqLfNtgfqdr1DTwTO2PJe+KuAEV2fucJzgO518NuOuHx7konvdXg==
X-Google-Smtp-Source: AGHT+IG2c5ImIZhO72M0oe5oieCq6SaUFn68rpgEdkMuKrS32fV+fQUK2a/x6HLbVFBi143LXmxggA==
X-Received: by 2002:a17:90b:534b:b0:2ee:ab29:1a65 with SMTP id 98e67ed59e1d1-2f452dfaee6mr14740405a91.4.1734890007511;
        Sun, 22 Dec 2024 09:53:27 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:27 -0800 (PST)
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
Subject: [PATCH 0/9] Add Apple A7-A11, T2 SoC cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:00 +0800
Message-ID: <20241222175314.151437-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_095328_511396_A973E384 
X-CRM114-Status: UNSURE (   9.42  )
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

This series adds performance-controller and operating-points-v2 cpufreq
nodes for Apple A7-A11, T2 SoCs.

Dependencies:

- Apple A7-A11, T2 SoC cpufreq support, in PM tree.
https://lore.kernel.org/asahi/20241218182834.22334-1-towinchenmi@gmail.com/T

- arm64: dts: apple: Split s8000/s8003 SoC DTS files
https://lore.kernel.org/asahi/20241206135051.56049-1-towinchenmi@gmail.com/T

- Device Tree for Apple T2 (T8012) SoC devices
https://lore.kernel.org/asahi/20241203051147.110980-1-towinchenmi@gmail.com/T

Nick Chan

---

Nick Chan (9):
  arm64: dts: apple: s5l8960x: Add cpufreq nodes
  arm64: dts: apple: t7000: Add cpufreq nodes
  arm64: dts: apple: t7001: Add cpufreq nodes
  arm64: dts: apple: Add cpufreq nodes for S8000/S8003
  arm64: dts: apple: s8001: Add cpufreq nodes
  arm64: dts: apple: t8010: Add cpufreq nodes
  arm64: dts: apple: t8011: Add cpufreq nodes
  arm64: dts: apple: t8012: Add cpufreq nodes
  arm64: dts: apple: t8015: Add cpufreq nodes

 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi   |  45 +++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  10 ++
 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi   |  45 +++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  10 ++
 arch/arm64/boot/dts/apple/s8000.dtsi          |  53 +++++++-
 arch/arm64/boot/dts/apple/s8001.dtsi          |  59 +++++++++
 arch/arm64/boot/dts/apple/s8003.dtsi          |  53 +++++++-
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |   4 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t7000.dtsi          |  46 +++++++
 arch/arm64/boot/dts/apple/t7001.dtsi          |  52 ++++++++
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |   8 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   8 ++
 arch/arm64/boot/dts/apple/t8010.dtsi          |  86 ++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi          |  79 +++++++++++
 arch/arm64/boot/dts/apple/t8012.dtsi          |  83 ++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          | 123 ++++++++++++++++++
 21 files changed, 773 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi


base-commit: 9a33cbb3b1e4a0b520a131aec028ddeb99da48c3
-- 
2.47.1


