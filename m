Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5DEC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JxIQLyP26v4rF0viEUEQnw43xKOq8QxXK3Q1+9z51gI=; b=hr7GcF8R7s8UHyEFXNSasayrR4
	fMFg2TjbnDL64T+ta5sAq/BCvnQv1mAl59JTDCC71RMciEcxCtSMF7fgOFEm7TmoDc6CWs9kOHW92
	uBgJhFtlvi3aLO1pq0q8Utr5MP3y2S7RBXcRp2qiB1qtMp178F9SUC0iRTn+HqX0iZKVpXeRb+FYc
	s2gatDl9u3qfn/LotjnWuz6z2iJgcRhjcfAmR1saVV4hM/tR5l53bPn44OZ8e78hxQ+cTidbmN6ck
	CJ+swsEgRJU2uqqYkORHv9Rki3wGUVwCJ+5pMOfTzoA7pujx/Gq+rkjlWa+gRhpQNtzeRgPa3jlIP
	4K56IiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUrw-00000004D8x-1Eot;
	Tue, 01 Jul 2025 06:53:28 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUQd-000000048f8-0np1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351115; x=1782887115;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JxIQLyP26v4rF0viEUEQnw43xKOq8QxXK3Q1+9z51gI=;
  b=EI04OAKkQyEs8h3Njo4pav1pZIrj70hmAPKdyiMl+TgFMX5KCoIej+++
   3BJR18293efyJqGEDlbNVDMtBqb6yFpob3+lan873M487L5Gb2t/cCACt
   UuO58NJKiJe+Ga3du16W8UzaHDa4+MSGEmJ/e+R8m1zqvgqzhQc+2nZK9
   IFNRD3vLelVwWUgn3+o5MDk1hP8yhRD26ptFXNhW0rNfQLpGGBwx/COEe
   oX+AYAYHmBuyEJcpi6ZAsBczI90CguQ9b7TrDUjQWg5lG/Q6jH4HxKxRf
   VGFSxEXrq3CFJbhUHOVQ3DqG/7m6p9awq1xJ5qghrLwnJK/qAYsyD0X0T
   A==;
X-CSE-ConnectionGUID: kLXLKSUvSECYNTAmH4TDvg==
X-CSE-MsgGUID: ZSAxOqnSR+mJTwx/0dmXug==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943368"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:12 +0200
X-CheckPoint: {68637F48-4-ABFC28F4-D6731B76}
X-MAIL-CPID: 4D93FC8CE74F964E39D083D9A1BE8425_5
X-Control-Analysis: str=0001.0A006376.68637F79.0065,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E2AD165890;
	Tue,  1 Jul 2025 08:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JxIQLyP26v4rF0viEUEQnw43xKOq8QxXK3Q1+9z51gI=;
	b=k7zGGGA5zJxR9wVKxccy/UDRfdq5y6EhEtggs8bEFWvgaV+fRV9iDe5y11DVvr9e7uO0NQ
	z2fsY/1vI1HdFriLCVJAIFw7wSn2fGSbamg6RrK9MfowAs+3Obt7vdL6FSxA9xEraQgnUd
	LTnzMdnDZxuV0+ty4tg6vdflXiVfWQGNJihdn8PqbP4sFsmS0Fn3F8BEG9gN4lAyT/TaBo
	d4zvFpeBrcLBvCBKPBCCguwSHfDEGNsmoyCdT/FcAPORFvld5XdDTm9JFLtZ+rw1D1Csub
	yjrPW22fTv1L4YXZuofBNBaeMnA77cRtiKV1cPIqN1dO8T2dzrAKWi+PvxYNsA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 0/8] TQMLS10xxA DT fixes
Date: Tue,  1 Jul 2025 08:24:48 +0200
Message-ID: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_232515_538650_227B207F 
X-CRM114-Status: UNSURE (   8.84  )
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

Hi,

this series adds some fixes for TQMLS10xxA family and consists of several
groups:
1. Remove superflous properties for spi-nor
2. Enable SFP interfaces on TQMLS1043A and TQMLS1046A
3. Add missing vdd-supply properties

Best regards,
Alexander

Alexander Stein (8):
  arm64: dts: fsl-ls1043a: Remove superfluous address and size cells
  arm64: dts: fsl-ls1046a: Remove superfluous address and size cells
  arm64: dts: fsl-ls1088a: Remove superfluous address and size cells
  arm64: dts: tqmls10xxa: Move SFP cage definition to common place
  arm64: dts: tqmls1043a: Enable SFP interface
  arm64: dts: tqmls1046a: Enable SFP interfaces
  arm64: dts: freescale: tqmls10xx-mbls10xxa: Add vdd-supply for i2c mux
  arm64: dts: freescale: tqmls10xx: Add vdd-supply for spi-nor flash

 .../fsl-ls1043a-tqmls1043a-mbls10xxa.dts      | 12 ++++++++++
 .../dts/freescale/fsl-ls1043a-tqmls1043a.dtsi |  3 +--
 .../fsl-ls1046a-tqmls1046a-mbls10xxa.dts      | 22 ++++++++++++++++++-
 .../dts/freescale/fsl-ls1046a-tqmls1046a.dtsi |  4 ++--
 .../fsl-ls1088a-tqmls1088a-mbls10xxa.dts      |  8 +++++++
 .../dts/freescale/fsl-ls1088a-tqmls1088a.dtsi |  4 ++--
 .../freescale/tqmls1088a-mbls10xxa-mc.dtsi    | 16 --------------
 .../dts/freescale/tqmls10xxa-mbls10xxa.dtsi   | 21 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi |  8 +++++++
 9 files changed, 75 insertions(+), 23 deletions(-)

-- 
2.43.0


