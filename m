Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B2EEC142A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g3SE8o2QxCYBZuJ6zYQoYbch5/wwuKdRU0VaDoGflE8=; b=lt3KpuPl6pe9IQGcmNZrU/sm2b
	dez+S/qntzodSXe5N1LKXL+T9RNoaxV1eOs3ix8SbaDk5QlXES9vsvEjOJTFZF6YXY43JGkynzN+c
	T0jbAPBi5IH8WivjI8K5QYrX2auc9NDpBw0NiWL1Ng8pyvopT9ihE14HawJD5zuTGBk8WzQLrp8wH
	/OSnpGwdb76VMoKICgpvhHff34Ku0r+MuTzLb+8K8h56Knx1tRHCZRDnZpEiu2TxplX2VeZe+5GOw
	Cv2E5GH4W2sgjNUZeiPH4cSjwynRhYSDaPOjeMKNZcbl5LOAUXJDi47u25Vx2dH8J84uzAIIByJb6
	LQZ+4/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxNLQ-0000000F0LF-2Qf3;
	Tue, 03 Mar 2026 10:51:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxNLO-0000000F0KG-1mCs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 10:51:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-483487335c2so45856835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 02:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772535072; x=1773139872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3SE8o2QxCYBZuJ6zYQoYbch5/wwuKdRU0VaDoGflE8=;
        b=ar4J4Eni3iC6JL7zVX7MPYQuVL9cyxgyJ7r/zJ5gwd+KghBqLhSGy3riaEcgv93T6n
         BXIsl/Topl+96eE1vj8QZC4wxTFdTzP2JmAc95D4mcHVJ85aXHM1Cdg/v0KYHC0M/tV4
         zA/fB1BrVMDmFTvni3JqB50Mf3mkSpoWJSxkL3mqoi0wNj8ATqp68LB4LcGTau6iTQYA
         e8SlBd5NdGiU9KJn8A2N2ejzk9vIY5Qt6ssJoVTu6iuIPhZo+3jr7wyCtnGx516VCm7J
         PX81XhfwHMSHUHKpDmh4Kz6Cn644TGCB5R9o0OZSwBVX0Wy5eEYAZhfTDsOjC3TKE6pY
         cmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772535072; x=1773139872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3SE8o2QxCYBZuJ6zYQoYbch5/wwuKdRU0VaDoGflE8=;
        b=iDev3Z3jRengOnV5NhKnZgT4XYg6RI6IxD/xxurNbkoxCtdqag/rWv5f09G+jT6JM0
         EpNGCicHQSFYNRuQFoED3SKuzNWivzG1SWiCV+Krjojd2tjQtYzhaXGD7A2JYfrFKans
         tQNkq5pHV72SxdGwIEKqzbUVSdUMuQZYh3PGJ4n6AtRny12c9fyJPs5dJDMqfoIVcPEm
         PgBBLS96cIdkPm7EQ6TwtC+63O6oVNqXdVeLXPKEGPzjFq1slqRzAhT0cw3BLbqAuDmk
         oaqqIM2qwa2za33UaKrW4LAgDIweE2aoSp/X171loP45PQgHpvRzqLz/2ZEcErDG6TCD
         NLLw==
X-Forwarded-Encrypted: i=1; AJvYcCWBXdIH9YKcQguJGpQzeqRgrpiaKmdnLpoq0v2BL8me/zMviIrq7zxs+VtVE9bSljIjV8uT0hh3g6Q2c1zWGOON@lists.infradead.org
X-Gm-Message-State: AOJu0YzvxpFZvWifPJCYSkruSvS4VwiltktYnZG+hZ2RkLHj+pU8ymy/
	k53Z2u6Q/MdyGKMHN9GyXyw20vwXQilNJotLOFcPa3/fc8Bl6Pyc3VMQ
X-Gm-Gg: ATEYQzx8dE1Wv4qzuX8leGbIi6h5XEXyJoFJYOW1vCXwS2J2nBBjXebrrN/aGX/6Sr6
	JhOk1I5aWMHrS5fx/l8OCVjhmdlwnJf//Up/mCJKvDpPoAfW22p9iPHM5rW1JkSlwl0xB44PFUm
	X1P6aj2EXdtfy4sPICzK1Rrmx7j+SyOpQuW1QQVpR2rl6aNywTInehOdtTBmc0j1yIGmMtKVPZ8
	c9qxcXPdHs2RoG/fQUbJ7Mn29dWj0huaNVFTBWN+WCziZzDZwLOsBxx2vaGFsZJkeihZA1sqMZu
	hFsWysWiYTKTOUNvucJ/7udqeXY1cTHaeUqqH6jUQKQUkP1Ehm1tfDmNKiIZQCPa6B9zuqw6fI5
	iULIt2C1D8anOTUSfQE5csiGP8ZR5wDwcWpmj7EMhF0XH2B49OhPiSbYl49E4YCer52mUUDKlKw
	opOaxBQSKscacGkbO0st3ZED8eYlQfU6Kd3iutkQYywVI26x2Cjv8B7LSyEwLmzL5xSGokxGEPY
	dQqa9XJp7nNZ5LPrB+LlnclPJa45F8qCyx6ECA=
X-Received: by 2002:a05:600c:8b84:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-483c9bb1adbmr270868955e9.15.1772535072145;
        Tue, 03 Mar 2026 02:51:12 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3474dsm318916045e9.1.2026.03.03.02.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 02:51:11 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] Add support for Variscite DART-MX91 and Sonata board
Date: Tue,  3 Mar 2026 11:50:36 +0100
Message-ID: <cover.1772534362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_025114_479092_9F354400 
X-CRM114-Status: GOOD (  13.42  )
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

This patch series adds support for the Variscite DART-MX91 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v2->v3:
 - Rebased the series to fix DTS apply issues.

v1->v2:
 - Ordering by hex and node name.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX91
  arm64: dts: imx91-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-dart-sonata.dts   | 498 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 ++++++++++++++++
 4 files changed, 973 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi


base-commit: a251f9ed77f01f16adaaa1b3d2f568fc1b5acbfd
-- 
2.47.3


