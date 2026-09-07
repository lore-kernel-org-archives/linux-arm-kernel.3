Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E15C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gzRNn/9KqahwkYAHP+82Y0/1urrH953paNl1KnHy+O8=; b=GnESJ871HTRahAn+RSB38o87Hb
	rt0y2y04Q5p3t+h5SPy9NpcahcHfdO4/7c/ll7/NVcy2vCaAve5td2Sy4o4xs8ZCBf0YVpE4EwcWb
	ICGR5b3VDqHXXxPeh9RT0Ypqres8TRwbw97cdL5+j4ZMbR87BMLKu07/eGFvB/nGib+iOvfOJNnzu
	wDmzJOfATyzY/tHSaNKnD4MVPypuPkZaLS/yvYlGGr5440DTXYmUttAFWNOHyv3cIG9Xd+owlXQZc
	ZqgGrgKopJY8ZFIeab2hNfN6di/RvKQeoYgvLiKtjk4YbieYJKf2Vyu5KxGmLIY3iaFDKZpyBXIOR
	4ohDdlmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VQi-00000006Ll7-0dhK;
	Mon, 07 Sep 2026 09:14:20 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VQf-00000006Ljw-3SdO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 09:14:19 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id BEEB9240101
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 11:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1788772451;
	bh=gzRNn/9KqahwkYAHP+82Y0/1urrH953paNl1KnHy+O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=lwaaZOtUt5IYQVcP3ggg//m00AxpvTBE3cFvwXABha8ddWNMGlGmVJX1KOUhomAXu
	 G4gpLqMApjmq/diD18D9HWijXuzwVdJXBdmhoBbKY/AHMPMTepVHY2kiFn5MRruCvb
	 YHXuzKpCEzQhyCqf/GR7rs3wvDwxYJstzD3ysQBvwYiouXZ7bhW2VLHg25wAKLgDTU
	 5vG/cnT1sS+SilorICaRxT7vx8WMBvj8RksQlwbOxch3KGAzkqegxXCvB5ncK/Aqw5
	 HYyyBEFn2vsdSmkY7mGAVSmrxxxiUewCzYOKScZ+l2paJRRJfFTjvxBw1svH2qbFeD
	 RHlyCMeGUVJRg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hdhG95QPSz6v2H;
	Mon,  7 Sep 2026 11:14:09 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lionel.debieve@foss.st.com,
	amelie.delaunay@foss.st.com,
	patrice.chotard@foss.st.com,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on stm32mp2
Date: Mon, 07 Sep 2026 09:14:11 +0000
Message-ID: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_021418_486009_3227FFFB 
X-CRM114-Status: GOOD (  11.32  )
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

OP-TEE implements the STM32MP2 watchdog SMC service with function ID
0xbc000000 (CFG_WDT_SM_HANDLER_ID), not 0xb200005a. With the current
value the arm_smc_wdt probe fails with -EIO and the IWDG started by the
bootloader is never refreshed.

Fixes: 89fca38168c9 ("arm64: dts: st: add arm-wdt node for watchdog support on stm32mp251")
Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..35e247af957c 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -35,7 +35,7 @@ arm-pmu {
 
 	arm_wdt: watchdog {
 		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xb200005a>;
+		arm,smc-id = <0xbc000000>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..2dcbba65e298 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -36,7 +36,7 @@ arm-pmu {
 
 	arm_wdt: watchdog {
 		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xb200005a>;
+		arm,smc-id = <0xbc000000>;
 		status = "disabled";
 	};
 
-- 
2.55.0


