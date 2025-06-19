Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5B6C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RW9ntFbfGj4jPPmbk2HD9BL+2SiOP7eRTkuwl1KD/rE=; b=sgEt3pdD8HJvi6kGHkqP3pzyc+
	p6xm1KCuZhTdQuzguiY9ZEMZqGBs8dDItWWjcbM2gqeY8YCopsRX/d4hhH0JD7mCtTUGM1f1UyNUv
	HWfiSNx/So9hany2Z03585Yy6ayoyC7bQVn3ekbI0USWIcDW/roZaZaF95Zc2nBEl1+h6U4sz7ZNE
	5ft7HMBmK9oXElmVAcAfATFUeWlsZNrkMMwQ5EHIbXTDtr3ExE2Fm3cRqTtbbI495OO91jZu37h9Q
	MnJeAKiH1l6xFgIVbuSk07s0rY1gbawA9yc5S43/OAE+4nlZRIp/U8WCDnRg3tbvIpPMWIV5Iqn2M
	Y/cqsM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKCG-0000000DyxR-07GV;
	Thu, 19 Jun 2025 18:41:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSImX-0000000DiOk-0QCY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 17:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C069AA546DE;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E047C4CEF1;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750353031;
	bh=IQ/Y9U0nzxzGUrCLzecuHFfq901/was5ToS48J7PkBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n7ZdUe9CBdTNyTfQlROqRZ5vpt8NKwi2nppZSwqQarz5IhWBTb7Fuf8Y6A0/k7RKV
	 oZKsSCbwBRFUPRD6rP/TpNuQ9RtRxabjo6oqERe77Q5R9Eo5l8++R5LrXc86UqaYFi
	 OR068erT3x6FE1H1NfS/K3PcLb5E/Qnhle/zFrbIzQhAhjgATpLBCKFf9QnB7PUkuY
	 VgukLCpXYCyGdnVISPcXPT0tVLE9F7O2NlVM1kiLQqrFfRq9Zgnb64GUCbAGWDf64l
	 uSeHjzyKXQm4hPmBeVSBrBj5JQwTQbufs1pY3nTNwAyPX1uUE1SmTmyX1dyriZbgZy
	 5P18Yvb8c9R7w==
Received: by wens.tw (Postfix, from userid 1000)
	id 85B495FEDE; Fri, 20 Jun 2025 01:10:28 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: reset: sun55i-a523-r-ccu: Add missing PPU0 reset
Date: Fri, 20 Jun 2025 01:10:24 +0800
Message-Id: <20250619171025.3359384-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619171025.3359384-1-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_101033_214118_70E10475 
X-CRM114-Status: GOOD (  12.14  )
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

From: Chen-Yu Tsai <wens@csie.org>

There is a PPU0 reset control bit in the same register as the PPU1
reset control. This missing reset control is for the PCK-600 unit
in the SoC. Manual tests show that the reset control indeed exists,
and if not configured, the system will hang when the PCK-600 registers
are accessed.

Add a reset entry for it at the end of the existing ones.

Fixes: 52dbf84857f0 ("dt-bindings: clk: sunxi-ng: document two Allwinner A523 CCUs")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 include/dt-bindings/reset/sun55i-a523-r-ccu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/reset/sun55i-a523-r-ccu.h b/include/dt-bindings/reset/sun55i-a523-r-ccu.h
index dd6fbb372e19..eb31ae9958d6 100644
--- a/include/dt-bindings/reset/sun55i-a523-r-ccu.h
+++ b/include/dt-bindings/reset/sun55i-a523-r-ccu.h
@@ -21,5 +21,6 @@
 #define RST_BUS_R_IR_RX		12
 #define RST_BUS_R_RTC		13
 #define RST_BUS_R_CPUCFG	14
+#define RST_BUS_R_PPU0		15
 
 #endif /* _DT_BINDINGS_RST_SUN55I_A523_R_CCU_H_ */
-- 
2.39.5


