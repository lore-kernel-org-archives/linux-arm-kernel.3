Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17EDC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EaTufouzUrE+fHGKjau0XKCchZCy0Yqa9z83nKb4F9A=; b=RBeT074NfvM5ZFH1aLs1xAPAVD
	hbbKJi0YDdXiYPG5LkUKhGMj6Ymku9E2niLC10B3LYEAJr26cduZrUtGxdBYH8Sg9YpPr32WBvlHU
	gyy2sX232cLJ4+r/NYx3jtjKEhBm8POrxowUMTmxcKQG2XFuBl+j64sa5s7jl/tRAGSnrYWxe01Da
	xRVlKyyLI+oJZfgtfX7rg2+R3JYLUVqf2Qe1x37xrdObYLR8AU/xDQAnGSd0LISZ22sWyTUjxgrog
	dBS7q6PBHBzb1C0xNpi6TvEo/ng+/pyId7VdpNl9FUu2SqpIpbVV+VOlDW+uD63XkBJpBSPGOEokx
	28jkrVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7br7-0000000F6A3-2RF5;
	Fri, 18 Sep 2026 16:54:33 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7br5-0000000F69S-19qX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:54:32 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so856851a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750470; x=1790355270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaTufouzUrE+fHGKjau0XKCchZCy0Yqa9z83nKb4F9A=;
        b=QtFL1KhB7V0m0zMrps//SwYd9D92qKMpo7igfvyndZNtggFwIFO+7Fyz5MHY+zasDH
         5jwk3fRtAVEKWKfGen34K+p69ZoNddbEXH/dcCABFnf8AabRTSE4nRxT28qRNIjodRH9
         J/BwgKjDvn7kNYWKYwU445njYMlXGoLU81ERtPilQSAQw5nQ0tp/tK829Kgpzo9a1uyM
         6zFP4+RHaT6loWpxCLz/tZ7/+jMVk+++3NvoVyenP5/G2w7XBfd4vGqhjn6YiZktNqv1
         bjj8ruF8LfDMXT4BdL+MZ0hsYxKWn7AWV/kqxeiFU+nbhKQXPpd2mX2kh/NZ/o6jGlTG
         zRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750470; x=1790355270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaTufouzUrE+fHGKjau0XKCchZCy0Yqa9z83nKb4F9A=;
        b=e9BBRqAeXcyhpFFBi66agFSc3hZBfMraxCErVdFAsNjUzuq8kMhve9TS/LgY19HojK
         ekZuCwQ2AnbW7nFXEL0G/9uinCRUENvLW52r/HMKI4fy/oFcTrKSOcCNKCbpFVzOMRrc
         IFp3uf2F2ZjDCtCJVGk2BneH18Fy57fQGDm+szYkuK9FZ+Sdaf/cGyfjYr9AOm610fO5
         lGZ+Wtgcm9BDQEpUmovEhXB5im8Lqm7/VPn0IlZsDIIrhD8hcKJ68umbm2NwUi5N4Etb
         hKd1BEQXgZfVJVuvgHra18rjQ1NR3Nzb/sVOoG8YH6Pq7bhy0I3Q8AXYdnlQ8anXbO3A
         FLJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAptEFBa14hM9UKLTMwM1mLZ132SLxdI5SjU4FEt+0FU/HSgk3XAiokfA+9tvarkG6Y73RPqMgdHmxKqGqJvN6@lists.infradead.org
X-Gm-Message-State: AFuF++kougdoPD/p4GaFCCDmlQxPbV2rkMs7Rpm80u/HkXjbADKkn2D0
	43kvwHoxYEk+cR10OHA3yBp9XUeYk9O8sQRPgzC/6qmFfpaBMTMhr5dNl3zs1A==
X-Gm-Gg: AYBFou2EblLPMVOahlORU4+KmThqFmP1ngSdMpZtainPdAHvb6D4NHYUdgzC0dT7UsY
	QXpvkfsoKoyy9pp8kHWGw133Yz79Ckb3mp5uvxMWPpte43b+fR9+4tpg7P5Z6VLy3guiFDI/tkx
	z9GwrIAMLmt6OlA8rUIS26GwEDQgJqwSo9HBQYWj51F9xWZsBwfabQUWq6eYkzajqQWfUh4dEcW
	nJ4LU3xpvXrNAJTdx76kvdavpSlYSqzc35J7mUXS4pSUBI344e4zGf1X2+9CHUctxZjf6q/LuMB
	1JxJIaFHpWANWjd/8a6RqwYoQieG9hTZt9YTr39+tXmiWzkZNCxK0IIRo44MT3HN6wdX3vI6xKv
	Rzl2d/cSI2SYqTdJbTeKGBzYxRlJknJ66gHO5XTR/a3VpfHbNwqTWNa9ovs/fLSAN4DDkj2kgBO
	X1IHelLdX4DCbVTxaG4W6Y96La2RsmJTPiT3F9e+tt6SZ1/tZdXqoVlTKhXTV6F30=
X-Received: by 2002:a17:90a:da90:b0:39e:6a80:b796 with SMTP id 98e67ed59e1d1-39e6a80b849mr771187a91.38.1789750469839;
        Fri, 18 Sep 2026 09:54:29 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:29 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 0/4] arm64: dts: allwinner: add Teclast P85T (A523) support
Date: Sat, 19 Sep 2026 00:54:10 +0800
Message-ID: <20260918165414.1129076-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095431_351108_34AC836E 
X-CRM114-Status: GOOD (  13.16  )
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

This series adds initial support for the Teclast P85T, an 8-inch tablet
based on the Allwinner A523 (sun55i) SoC.

This initial submission enables only what mainline supports today.

Display (DE/TCON/DSI), PWM backlight, audio codec, camera (CSI/VIN)
and LRADC keys are deliberately left out, as those blocks are
not supported in mainline yet. They will be sent separately.

Patches 1 and 2 overlap with Andre's series
https://lore.kernel.org/linux-sunxi/20260914210115.28151-1-andre.przywara@arm.com/T/#ma8a2554315eccbccdb15ee7ac212a4d0afb45a5c
They are included for compatibility and differ only in the full company
name in the description.

Touchscreen operation requires firmware extraction from the Android
firmware kernel module; the file will be added to a public repository
later.

The values below were obtained experimentally via evtest:
  touchscreen-size-x = <1786>;
  touchscreen-size-y = <1128>;

With the values below the touchscreen and display coordinates match:
  touchscreen-inverted-y;
  touchscreen-swapped-x-y;

U-Boot support requires an LPDDR3 driver for the A523, which will be
sent a bit later.

A ready-to-use image with working display, audio and touchscreen can be
found on the Manjaro forum. Patches will be added as other contributors
add their parts.

Based on 7.3-rc3.

Mikhail Kalashnikov (4):
  dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
  dt-bindings: arm: sunxi: Add Teclast P85T tablet
  arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
  arm64: dts: allwinner: add Teclast P85T tablet

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun55i-a523-teclast-p85t.dts    | 420 ++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 +
 5 files changed, 446 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts

-- 
2.55.0


