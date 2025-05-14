Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE091C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Wvx3ucJuAray+HL/HptLX7X5NZZogGGvAUJPEAufiY=; b=mkZz3dQCg4Ls/7YYaBLOJUnPJN
	cErSOj03tDindVan13VyRqiOO+E7mmJLCM2jve9q0Fs9GkZh9hFrnJ1F4yK9JOpKPDZr75zmuz2b3
	KL30sQr+xqbB6Kh+xgHd8ZevIabxn3ACUz/tOLdC33N6xU1US2gFNsdZ5Nj1SXE1UcXMzTjFnjgVS
	3RNy7PrBuoHD0oqzIdKg3kTGOYyG3LtgPZlVyCrM5xh+0tVm63x5X0fT3Iwh9yyW/ype2da1W6B8H
	MOwKHqCvTOENqZN5TiNOC5xRuGYSigBzZZyTQxjKmjVbweylvPNmFGYxSSsE9zHY6+VSxB/dQ7yD+
	Ta9fkjHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB58-0000000F2OC-3EC6;
	Wed, 14 May 2025 12:19:30 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8cq-0000000EhmU-1zyj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747215728; x=1778751728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+Wvx3ucJuAray+HL/HptLX7X5NZZogGGvAUJPEAufiY=;
  b=d78dPPoMeiNRreNWiaZtwWoc0sRQA6mSikryMzeBMTH1dYycdZJIoGY2
   PUXcmoRhc7KGkSnno93oOO1rbpd0TeRIT4pipBympLiigzQPMi5pA1XyL
   8/cXP3YWgINb/a5mCegTjCW7fuJbB41lsTVaYT6oIzz2gel1VCy83pGVU
   HjtSKdA3ix2La4uA8dpghOlxPbeI10K79oomHkRaZ3sKP87ShN8qyXt2e
   IVmtRN9ivQZl5IEwxZMoYDAjc7tvWan2KAbQzLy5pGQiA0EJxBYS+eDcN
   /RJws/O7kak+6ZDkXmCZ6fsRMrQUt4hyg51BTj1fXW+UW6Rucv3bAiWzw
   w==;
X-CSE-ConnectionGUID: Q9Nola/5Qeu9dMgyPBR+VQ==
X-CSE-MsgGUID: Om5AOhGLSN62OmU1viv7QQ==
X-IronPort-AV: E=Sophos;i="6.15,287,1739833200"; 
   d="scan'208";a="44067208"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 May 2025 11:42:05 +0200
X-CheckPoint: {6824656D-3F-DF3E87D0-C74668F0}
X-MAIL-CPID: B2EC1E38393EE08C66776342BF6B7804_0
X-Control-Analysis: str=0001.0A00639C.68246580.0078,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3845168F22;
	Wed, 14 May 2025 11:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747215721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Wvx3ucJuAray+HL/HptLX7X5NZZogGGvAUJPEAufiY=;
	b=Z5MFqRMb5LX1beEmHGwIHMDFVu3mtTHZVP8rFGpLNK2jjcBOtun5gXXUjpO3tismICs4zo
	v1QTHzIciZLq9/vkoPXiTmCyNaILP6KczQabmMGcbW3wjR5E/W7z4WYpTisQ3yTXfxsfB2
	o/70xfo4iUBfb6+8hM6i0oVV9/4J73m8HW+PPfQ/pYY4I/xdObKS8fVVuXcuERzTYH1FVG
	tIE3nOyW83w53o4yCD+kzwaSZXVh386q6Gl8taaEvuQ3v1l0iO0ez/mmhSBJ6lrkXj6ZEU
	s5YkFrvUc5+Gf5no+WYLgaptaOuTdymTyx9+b5nXxnrBImOlFt/Gb7dhUhUGXA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: freescale: imx93-tqma9352: Limit BUCK2 to 600mV
Date: Wed, 14 May 2025 11:41:27 +0200
Message-ID: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_024209_006558_1ABE7304 
X-CRM114-Status: GOOD (  10.25  )
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

TQMa9352 is only using LPDDR4X, so the BUCK2 regulator should be fixed
at 600MV.

Fixes: d2858e6bd36c ("arm64: dts: freescale: imx93-tqma9352: Add PMIC node")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 2cabdae242273..09385b058664c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Markus Niebel
  */
@@ -110,11 +110,11 @@ buck1: BUCK1 {
 				regulator-ramp-delay = <3125>;
 			};
 
-			/* V_DDRQ - 1.1 LPDDR4 or 0.6 LPDDR4X */
+			/* V_DDRQ - 0.6 V for LPDDR4X */
 			buck2: BUCK2 {
 				regulator-name = "BUCK2";
 				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <1100000>;
+				regulator-max-microvolt = <600000>;
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <3125>;
-- 
2.43.0


