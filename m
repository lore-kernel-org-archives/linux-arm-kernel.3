Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201A9CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tS+nBEv9oHEaSNtYsqRT1ZFZCy7e2jnR6M1qWnJYb6E=; b=zjEdU+CQFF7pBCI6nbRQ4rkiLf
	6KQYSVGwXOl/ug6EYkt6OxS/QMicgNyVDcc9WQ8bCUpzv5CjWdvAUoSeo0cYzqi1+F3RRm+ttsjj7
	4Sg3stvgdsPiYXGQn4qdYO0Z/JnM6vuh2tSQjy5q58Qwz5EyhKTYUZ0SQUOtdbB2r63IuwQfRYs9f
	+kHmVkxpkewgcWJLlYnrJmh+7FxHXUNHFgiYcjFpEoPBE1h1GrDxqPkoKNsBkB0FprlwkdwTOLf3l
	N6KIchDLbuGrxcQWsLcjaEItqwxQc+x3hTLjC0lOJzQJYLvkS+UxUgP61bzZta1wYQyP1zyogJRVl
	rGrz8quA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upke5-00000004SX5-0pUx;
	Sat, 23 Aug 2025 09:34:45 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSRK-00000002imF-2SBP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1755871702; x=1787407702;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tS+nBEv9oHEaSNtYsqRT1ZFZCy7e2jnR6M1qWnJYb6E=;
  b=Bt+de30MlvjO1sdFaM7l8hHJrlTIx2x9RfQnRIMJK4TuqqJ0kWo//1L8
   uuXcp88c/IrZf42EJkFr4NnSOinG2M39zoRBBTCTRbeYUeUrktutGZqHr
   qEPl39Zr0pGgnQFWClsSCPjvS1Jz+vElbwRrEPQ/vszYALQUKBWhd9vII
   WpTrJ27tk6n7Pw2D7nxKrNdMRbP/q4pC5hpgdnK0Oml0sNXYrRProjJk3
   xfSnxzr0tYoEC+NIUObwRgq8Wffr1UUXAqiDwYCUkQo7Rpk5hheAqH8Aj
   ZWHNPdeNotJSRga9efKTe2/Mk1AEeTPOyD4EWtSRUsRHHoY/8tchqnIyc
   Q==;
X-CSE-ConnectionGUID: 3ZLGV4isTLWShCVsOBQdQQ==
X-CSE-MsgGUID: rHg/Oii3Rm6+VFvGcAxEMA==
X-IronPort-AV: E=Sophos;i="6.17,309,1747692000"; 
   d="scan'208";a="45868597"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 22 Aug 2025 16:08:20 +0200
X-CheckPoint: {68A879D3-25-299FBAB0-EF52EDE7}
X-MAIL-CPID: EC49AC01D376B20CFDD65F635FA6CFBE_5
X-Control-Analysis: str=0001.0A002118.68A87981.0009,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0B011610C9;
	Fri, 22 Aug 2025 16:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1755871695; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=tS+nBEv9oHEaSNtYsqRT1ZFZCy7e2jnR6M1qWnJYb6E=;
	b=RGs6IhMOEYWJprTa7nM2CmRinCHM8JGAerJJi5tEldNMyxDk1NoBYf64N3YsibLSabJkyM
	24DYKjSJYpfVO0dX3jXkyZfeRiaX++Oy6jkvhhbvp1G4v31x0ICl0CJKJRPexp+JTv7+IR
	Y6TGZ3rWmGGbSphthP7cRNx/tpU7IG4FGzcxEEG+OosqHJWbkr09FVE3qxksXPsHBGkn7c
	XYTykrFUnArphmBsycFunw6tg0mp/kpZWy5ASFPaLlCOlw8lfuwVceVIEaONWUO5LLuxIu
	1YaBRGo+o+aCAbKubEzZmP+RrmE0MrBudW/vlqSwVHtFtDPVFPfbgRe+h5zMkg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl: Add MicIn routing
Date: Fri, 22 Aug 2025 16:07:41 +0200
Message-ID: <20250822140742.3352401-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_070822_966209_23090FB3 
X-CRM114-Status: UNSURE (   7.97  )
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

MicIn is connected to IN3_L. Add routing including the Mic Bias.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 2d4eaf9c02b88..1924d51bcbcd8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -245,6 +245,13 @@ sound {
 		audio-asrc = <&easrc>;
 		audio-cpu = <&sai3>;
 		audio-codec = <&tlv320aic3x04>;
+		audio-routing =
+			"IN3_L", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"IN1_L", "Line In Jack",
+			"IN1_R", "Line In Jack",
+			"Line Out Jack", "LOL",
+			"Line Out Jack", "LOR";
 	};
 
 	sound-xcvr {
-- 
2.43.0


