Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F83CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7V0thKaaXLknaSFFCEKfUqz/WjfEeC5sDR0O7VSr4io=; b=BKehpbL1/+EkKk9xtvJsMU5oAC
	XPmdeqaXrGuHGb82MeLuThEyPu3zabjv+3+dB8jJDsS7aDmuHDCfUYnwq0yL5BFbG+ZUmPA64Fy4W
	rH1Tx6w+OkKaQ0r2Y00RDRztEyI5VwSTAGiuyGrRjzyua/zTD8twggqKQCOAlxTnwOZoMKCyBT26m
	AvPr/oOSo/hTgYWflu61OgZRRhKe5n73yzQYuw3d2qNcDAWaKzeDIDyJI0xAQMranex6qbEe3nApi
	86D3kHMRpMEDzg2cUtzUvAaYKdUq/BTgAtUhZ9E2V+kHrVCxXfQZ+jc81LmH4KAxktF+pKdu+JBqW
	hucBW5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhs-00000005qcs-0B4C;
	Thu, 14 May 2026 15:10:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhO-00000005q8f-33Sr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 15:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7V0thKaaXLknaSFFCEKfUqz/WjfEeC5sDR0O7VSr4io=; b=Hlmk6qFBsBEKR0Iw4eyLW2ftYm
	sh8PDitb0w9gsmO7sDdtyM4EGFBMad1hfSw4pOkGKtzp20rSwjbgvY6jbpNnttOpVTjJ6z8J62Btn
	p3/gphJ9d4uvc4loOz5iV/0/CUV35WEfwM762KnvSyZsBfmzYwlddlUxgT+wV0RjXU/Krcb8E61VK
	5/9RyvCwP30sfpSPWGDvzmFzbHT4UEt71K7LSz57z36LsjNaSULv/rFMZ4cOtVqDHJeZzFYUwhZuh
	9boKK4H2kDEV/bmFrHFbL0otCLg0upvE4p265+QEd2gFWlILsnJIG1Hh6f2mtsm+nhYh8BmGBATgL
	RT7F+xqA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhL-00000003Dng-1yZn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D33844709;
	Thu, 14 May 2026 15:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF23C2BCFB;
	Thu, 14 May 2026 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778771399;
	bh=AUUR2mNpd4MZjYN5NiaEO2JmuYp8gYDD2xKReT+S1UA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SG+xOPmwQfEwmi60wxXn13aXig2rzNj7gGwX7r8a8w3dhb5abuddwrXYi9ytKPeK9
	 miGFEa/RAVBrncFx0lL1vI8DH48o+NR4SEW+LhzhRt9Awgl/+GMlgbC8T1jFjcaOhx
	 1f+cCh7/do+PmrRzFJFg2a+to7fEGNxdnKIobtmUbVNQSAQKcubDfrx4tIC/9SrjSF
	 mrb1HW08D/S1FCkF8ov/+FZ25tfN9gbzv14WsRGCzLWtdQBDOsuJXdY3nzCxgUdHlP
	 M4gVKmxHVY9cE4OXNL07q7JZ9YDJ4NyS1tgQ704CZtYEHLiqkg2Ako7Luq4p20L7Y2
	 03tPGpFoD2uCA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wNXhF-00000002Oqg-23HS;
	Thu, 14 May 2026 15:09:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ge Gordon <gordon.ge@bst.ai>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v2 05/17] arm64: dts: allwinner: Add EL2 virtual timer interrupt
Date: Thu, 14 May 2026 16:09:33 +0100
Message-ID: <20260514150945.3917510-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514150945.3917510-1-maz@kernel.org>
References: <20260514150945.3917510-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@kernel.org, catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, mark.rutland@arm.com, daniel.lezcano@kernel.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, gordon.ge@bst.ai, bst-upstream@bstai.top, jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, ivo.ivanov.ivanov1@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, dinguyen@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@kernel.org, jonathanh@nvidia.com, andersson@kernel.org, konradybcio@kernel.org, afaerber@suse.de, 
 heiko@sntech.de, shawn.lin@rock-chips.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, michal.simek@amd.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_161004_152781_60B56EF9 
X-CRM114-Status: GOOD (  11.65  )
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

The ARMv8.2 based CPUs used in the A523 SoC (and derivatives)
are missing the EL2 virtual timer interrupt. Add it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 5afa8d92acbfb..d3c47966e8fc8 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -101,7 +101,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	soc {
-- 
2.47.3


