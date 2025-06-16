Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B09C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ESidNUnPun/hd2HxPwnnanB3kSNyrGFR0AtYUeuLpCU=; b=ZyFInsrlZMt4/jKEuSua/z1tE9
	Vskxuh4ZitSZGAyueFKR2FP6SgI6H6Nb0YTEwePRRV7Ht0WzhzOJn7U7puCxebx4CC/XBLoSD0aAE
	17wUiH8MWBhX7cWIs6ORAnbyT2MmZjvkd2FmSJIkiDm2LhJJHDJQk3gbq2dpbNr4D9hd4F611oMJ0
	QOMuRBebsYTr5ULey2t3KtSZ4MIAbMzz+ymXEw2rtJ40P1FX0ZUWmk03l7oyG4z8Id7xxQAGLWPbE
	hpytjrZ8iLGQdo/tAqqtirSig24l2oaAwwPXCEWHaM04Ff32tfASDDv1aQAFahIc6gNgwMKTbiyyk
	trRqwghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHNe-00000005ZTd-0SWh;
	Mon, 16 Jun 2025 21:28:38 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHHZ-00000005Yq3-24u2;
	Mon, 16 Jun 2025 21:22:22 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7113ac6d4b3so42390217b3.3;
        Mon, 16 Jun 2025 14:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750108940; x=1750713740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ESidNUnPun/hd2HxPwnnanB3kSNyrGFR0AtYUeuLpCU=;
        b=maxtC/r6HW0nb5ZfFkWf2MYyJA93lILFQOn2tDCWRN2N1YkVj73LA3q2YHHMATNN5/
         UnCr4c8xbKg/lR8o8zPC1kmCWknGZXkLdvYdGBMZ1IS2kNcwZi2ZZSkeL9UzHf10aCCg
         jUhbOrYZvUJ88FSkTCgLvPcgN2/y59pF36Ca/zaWAwuFd/5/IEKQfOSoSJaMdGIyfvzH
         puAmEjWhjVqm+8NIIaww68xIZvyZLeb4yRGm71otdKTXbOElZNsKLw71kCJyiy7xb8K3
         zCEtUlDPFpsxXMcWIhhstoF203A95N+8yNtlFfqYJiQM9t+vhyCFydUuJiqMc+dG6Ddc
         cqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108940; x=1750713740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESidNUnPun/hd2HxPwnnanB3kSNyrGFR0AtYUeuLpCU=;
        b=EZ5TzyRjwCLxTomv5xDpOlvDWw4kj3qWCLZV49B5kpQNcKtRCVt2OQq/FDMUiYJCII
         vOngzxyJ5xKk9kZsY2mWj9CR8iJ/YzXUTlevM16c3ahZMMHT+alsvCM+e0s6vlqcNqxZ
         DF57G/EW4Ki7nH14sfJ/D+Mv8Ir0iol6BfA9A9l/mul7zOHvdKkfBU32C+dBhjSVFc+Y
         41I0hLscf2W+LfA5feBYsfBzUA0Cs5QaYBaoRKCnCpS0XYaskgcnzDhzOE9bHbrwt0H9
         Dr2p3x1kIkLLUSmogIiREHoJD0KYyLDUuW3GRbvtUrtgC4GgjHcOEnvKIb1VUm0Mrhfn
         S55g==
X-Forwarded-Encrypted: i=1; AJvYcCUER/nCumOi4kYGxUG+FbdIBiVb3F1kOEgdw+M39/loBnMZ9fHwv6jac8c9kBqUonAFUQ1lDPHpQXzzE0ekW/Y=@lists.infradead.org, AJvYcCVy0+iuLJlRr5ZjXANdKRvtfuI+Fjpojx9O4qXzdR5Ske8NVbj1liRxUzbNGjtYIh31x3MuVoXY0AGhGshC6UTc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7RYZmp01uPIzs9uERg0t5HJyZOa4K64QosGe4yUy3uaPW6YM3
	9I/NqWlxAQlkecGtMkDpaGuMgT0OKTVdNmeIfh2J41DaWOtbxLPm72oS
X-Gm-Gg: ASbGnctsJ4zgNRqBjf10cGBdCvCDiae3uO6VBEIsgwutezTc50pBANiSSDLrwt+XOYp
	NC3akDSyLpFokPczMSbGIBXCW/+B4HPTiHez0s6Z3vurgvE1raCsMx827OvvChPwlcwfSHJ4/92
	TL4Xv4CUU/DZz1/MHWQGgGbF+Cv0GXUfhRhqrFm/8MLlQPK76m2KivTyg/DOc3qWIxNk8DxTZyH
	ExIplIz11y3kKpw5pZtD5BML0d50x8uoooj3GJikv+doC4pED3P/uiTHfbXp3YkVFaK92RlIj3j
	xdpTTGgGU9Erf7HZ55kwTpkU6frFbp6F37uz/AoFNmjpW+Zl+pzdfmyPD2RxEPwAvJiSNa0=
X-Google-Smtp-Source: AGHT+IFTpaVK314wZKQhYhkRdFu1fTZs9zVmbqcOWMBnqY8mNxCxaKhIMQ8jPwrYsXsHzyL8/a4zxg==
X-Received: by 2002:a05:690c:17:b0:70e:1d14:2b76 with SMTP id 00721157ae682-711754df796mr137346247b3.23.1750108940011;
        Mon, 16 Jun 2025 14:22:20 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7117bc177d3sm10418837b3.44.2025.06.16.14.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:22:19 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v1 0/2] Add FriendlyElec NanoPi M5 support for Rockchip RK3576
Date: Mon, 16 Jun 2025 17:22:12 -0400
Message-Id: <20250616212214.139585-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_142221_535704_78D1AE52 
X-CRM114-Status: GOOD (  10.82  )
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

This series adds device tree support for the FriendlyElec NanoPi M5 board,
powered by the Rockchip RK3576 SoC (4x Cortex-A72, 4x Cortex-A53, Mali-G52
MC3 GPU, 6 TOPS NPU). The patches enable basic booting and connectivity,
including dual 1Gbps Ethernet, USB 3.2, microSD, M.2 PCIe NVMe, and HDMI.

Patch 1 updates the DT bindings in rockchip.yaml.
Patch 2 adds the NanoPi M5 device tree and Makefile entry.

No MAINTAINERS update is needed, as the new file is covered by the existing
ARM/Rockchip SoC entry.

Tested on NanoPi M5 with successful boot and feature validation.

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (2):
  dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
  arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 969 ++++++++++++++++++
 3 files changed, 976 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts

-- 
2.39.5


