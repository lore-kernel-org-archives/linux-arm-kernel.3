Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A08C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FT06o2miAnw5cPfmTWHZubI3xiHqfvO2xjSPX/KMN8k=; b=Hg7HzTRFFckmU2NPh/X5h8f7br
	lB69mS01d/gbH+w9oxf7SChktKt1SVAl8ci0IE0AlYQSaGNtgBV0rITRJZsmEebGnJZRm7HN3myq/
	54lGy1LHFaUJw/WP2c/ogD7A2a/kYGjggOTfoJrVY8NYy5W73x9cuNyUMiqDjxp1Wltfilo9ubUgZ
	XjMIlIeKDAH4IYC2kiKx0Dpk5NAnBTlfP95nnH1WqYx3sj5bTCttnrYbgjnlbhaff4U7LtsiDuEly
	PMQMS5CSD4hk0HeCx/glHPxsBdMTNAvQd84y6QAUN6jDiKnPz+Q38bzKjRQ6RYuMTuxciPnukcxYx
	aZg7abnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0Y-00000000KrZ-2Un0;
	Tue, 25 Feb 2025 16:42:10 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwAx-0000000HZQL-4AWu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740494688; x=1772030688;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FT06o2miAnw5cPfmTWHZubI3xiHqfvO2xjSPX/KMN8k=;
  b=KogUtG5le859GqmEZAKDe9BBKwKXBXP1wyV41knKZS4eCvfH5y2sF+A6
   8hrfVdv8G40/kGekTISvLiKdxwzSXAFmXU9UGLdF9vLf+3iSkA+sIz4Zt
   aKMbk1ZJcHPQqb/0FLz1Nok+7BUrhHt0LpgVXDQgYBA/o2awUY3gtj7Jf
   /IdP547fXZEM5B4MuyjXyS24gLdm4K0V1iitYgSeqNvNVf18SrFp5FZN6
   9j0mSLzTufau6pRmpky5RfoyzYkoGcHKIaIpmtAN8ix1KrIaGlMWIosk5
   2mgAc2GDQ7K/5Pv0hzF/VpPK4vcMDWEaWcbu9XkIFGvZjKaXIaYiUECUa
   w==;
X-CSE-ConnectionGUID: eMXG0DpYQMSKImBvzpP0Wg==
X-CSE-MsgGUID: 94+PQPA/SaK4M7yxwKY14Q==
X-IronPort-AV: E=Sophos;i="6.13,314,1732575600"; 
   d="scan'208";a="42075197"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Feb 2025 15:44:44 +0100
X-CheckPoint: {67BDD75C-26-28232521-C0C2250B}
X-MAIL-CPID: BE2FC7B59292282D81112299F45E8048_4
X-Control-Analysis: str=0001.0A002104.67BDD75D.001B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1B93167F5D;
	Tue, 25 Feb 2025 15:44:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740494680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FT06o2miAnw5cPfmTWHZubI3xiHqfvO2xjSPX/KMN8k=;
	b=oEpbFiQ27AGv0uiOoRWVCP5DmMFCUNUSa7/mBeB+Y3tVOOvCqEB6WWbvS6fuoRy8vHtgDu
	nEVHAi0EMMgLl9TdyQs6iHdOGGPNtuk3omCD8zu0St1RonxIR+ZZGl94X79nA3QxPAShU4
	FH+hOSbwqGRTHUIYZs/skx8p9bLxBXjU5Ym3yCoPCCRH+NEPBmjM9J59AneyKjJdM68hpJ
	zQfL3bVjHTeolFWUwZO063f1zqhXwQsT4qUT4Ev8SU4RGqC5pVEdsLk+3gLd6E6ETPJEYd
	DBwiYebuaRYyeMys+EzaJF6/Bxf7XZ+lSxi3Ou+kNwPp/WitHRWvCVQJTOFdjg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ARM: dts: imx6ul-tqma6ul1: Change include order to disable fec2 node
Date: Tue, 25 Feb 2025 15:44:35 +0100
Message-ID: <20250225144436.813645-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_064448_523093_FFFB7C2D 
X-CRM114-Status: GOOD (  12.10  )
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

From: Max Merchel <Max.Merchel@ew.tq-group.com>

TQMa6UL1 has only one FEC which needs to be disabled as one of the last
steps.
imx6ul-tqma6ul2.dtsi can't be included in imx6ul-tqma6ul1.dtsi as the
defaults from imx6ul.dtsi will be applied again.

Fixes: 7b8861d8e627 ("ARM: dts: imx6ul: add TQ-Systems MBa6ULx device trees")
Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1-mba6ulx.dts | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1.dtsi        | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1-mba6ulx.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1-mba6ulx.dts
index f2a5f17f312e5..2e7b96e7b791d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1-mba6ulx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1-mba6ulx.dts
@@ -6,8 +6,9 @@
 
 /dts-v1/;
 
-#include "imx6ul-tqma6ul1.dtsi"
+#include "imx6ul-tqma6ul2.dtsi"
 #include "mba6ulx.dtsi"
+#include "imx6ul-tqma6ul1.dtsi"
 
 / {
 	model = "TQ-Systems TQMa6UL1 SoM on MBa6ULx board";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1.dtsi
index 24192d012ef7e..79c8c5529135a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1.dtsi
@@ -4,8 +4,6 @@
  * Author: Markus Niebel <Markus.Niebel@tq-group.com>
  */
 
-#include "imx6ul-tqma6ul2.dtsi"
-
 / {
 	model = "TQ-Systems TQMa6UL1 SoM";
 	compatible = "tq,imx6ul-tqma6ul1", "fsl,imx6ul";
-- 
2.43.0


