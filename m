Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8567C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zm64T/IdqDWHw2fYB3DMuVhVwWq8Nqi/tIifOFc3y/U=; b=H2oLI+SE5gFPKXixrOzP/nyKiq
	mNzPPpINlOLxaMJcBvlwk//oK6X0oRXEqLeUROvIxUo5mTrnMQnj9RQJrb/jrH8kCcvULqc2SNzeN
	pjPSQNIApXr9Aj9RGoR34u7jcCCyxbQzTchbJXCjvAOY638jSkRbe/CQhRk4RkXXgTPIK/sXoe3Y0
	/W/fuYPAg0DPrMfEXbcoRWgRIC2wbDpyhjEGlPAvXh4CH4Xtt6fhHbJ7DKc1wToNec31YzOEqfRob
	QFrd6FbU8ajTGDu8IjwwprMAAuSeShl9Wmjd4StWQTWyd2nVrzNQcJlvs3LWASNXKK3UBjesgzH/a
	lZ2nd4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUyo-00000004Daa-3Rsb;
	Tue, 01 Jul 2025 07:00:34 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUQp-000000048f8-3rTV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351127; x=1782887127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zm64T/IdqDWHw2fYB3DMuVhVwWq8Nqi/tIifOFc3y/U=;
  b=VQoz7Tr2s694DJenRvtY1rELh5bKQTVyc29Meu+rR11IpyzRjJAfd1lH
   X4FRcb2gxIltZBAr/48kuV+kUgKvkd/wlVAFkWjn5t2WyuI968PzAsQ2E
   OxtiJJ3EDtLCnJPO0Z6LmZ3AbJJWL37wrC9jhKO6vOXz6OEQFvyppB1tR
   08JOgD6wWOw9SzNyL1goZbKppHTfF3qZu/WNl+CFVLfdwzwfN8zr0gLLC
   Q2brQKiGKH3p6sql9ykzf7037vG5Ic1QWr+kor4Zscx7XyBziFyixh0zZ
   ndhCjwmKMZyu4E/aveFeGMiv9BGe3Sq7PpvSDPqHjCVinKiz0YBj8B6QG
   g==;
X-CSE-ConnectionGUID: knYFXxf9TQipES6gueG2KA==
X-CSE-MsgGUID: 19z7TP5dQjubtt8iE/0+ow==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943375"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:27 +0200
X-CheckPoint: {68637F57-6-F34124BF-F8CE6E96}
X-MAIL-CPID: D68F531D0395034A2964B73398F07505_4
X-Control-Analysis: str=0001.0A006370.68637F7E.0001,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9205216A55D;
	Tue,  1 Jul 2025 08:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zm64T/IdqDWHw2fYB3DMuVhVwWq8Nqi/tIifOFc3y/U=;
	b=ZhbJH6amPJfx49jM9DM4t02zHYl3WN39XBJDZov9WJWXiTqDtwCRECPkt/8IA0EYqRHabc
	CS5+j1BOyhraMwwoCs4Qdn1oBBd/FLIEMCMQcrvXMq/U47HnJymz3rSlMbLNgiBBFYh4Y7
	HfNOHLw8SR0QHSXaYlE5yHO5SaBtM7sM7zx9n4ypGXxdj7F17o6iS/LqUenIE7Gym1zrrz
	3L1t78XITICwKyZIpMtKj8/RVLsuTpFaSm1FRsg8KDRspejz6Cmd1BwcsN718oNgvYZNgO
	6CB+6shfoWGg5EZrx/Ub9BffOD1CeuyY4/L968jC7eGsCKupbc+L0fucpOvrzw==
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
Subject: [PATCH 3/8] arm64: dts: fsl-ls1088a: Remove superfluous address and size cells
Date: Tue,  1 Jul 2025 08:24:51 +0200
Message-ID: <20250701062500.515735-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_232528_255230_6B2A4E8F 
X-CRM114-Status: UNSURE (   8.25  )
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

The jedec SPI-NOR flash node itself has no partitions, but the partitions
subnode.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
index 9a0f21484be94..66a7aff893b32 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
@@ -17,8 +17,6 @@ &qspi {
 	qflash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0


