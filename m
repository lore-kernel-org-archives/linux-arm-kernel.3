Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA373C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 21:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4y4c9RWx1FC4PNy7DS87OEXiGIOn0UZg+CHPX2i3p3U=; b=jj2BwgDdw40rAd3/exJEFRQoGv
	NfMzVyYelmw/A65tQHtKbu/QpbLwgut/6Mq4rOJcQLywUilyGyAtO/GcVhdSv1FPO4tfZzwqmg71b
	Xa8YLBKXCsA+xmSGTf4zrP/l/AvlXHQTwO6Va+1JKghi1hZ67fpXkLVPqOun/yt1SY7ZImuqb4qc5
	HQXYB6653apbzzxXZAzgZYAd43jE2MNw6DyYeDchjmiyuEdP+EY7yOcVkI/ECiyS7+44cP01B8jX/
	Z/lCKTA2ZfE36kuF8jO5GiGRukkaGrLokxRG/GbpKa0/IhTvZoR2UQnNh4M3ABE5JrjbfqjVIez1W
	ExBlK56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvxK-00000007zCF-2uYJ;
	Mon, 20 Jul 2026 21:55:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvxH-00000007zBU-0uJd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 21:55:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 743DD143D;
	Mon, 20 Jul 2026 14:55:13 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D0703F66F;
	Mon, 20 Jul 2026 14:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784584517; bh=J0vkAr4/Tu7YiyTBXngYksEOi+A0F6Kza5yefrxWGr4=;
	h=From:To:Cc:Subject:Date:From;
	b=UufmdQV7TIrXz0Fczo5N/Zzbo0dd87gqsbUToclSVqMp6IBu35tQZO5MGTd/YcFmB
	 bkj9QM4mE+Eltt6VJ1IH3BeejA3Da3VrUQ3LFt1LAeRSkfDLtX9x6+XFO+wxOKqZ84
	 O4tVF+Ua25hTrF1ysEGlGL65xsPIvgfTHcBFCXg0=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: allwinner: a10: Fix PMU interrupt
Date: Mon, 20 Jul 2026 23:51:28 +0200
Message-ID: <20260720215128.5761-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_145519_318211_443873C4 
X-CRM114-Status: GOOD (  11.45  )
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

The Performance Monitoring Unit of the Cortex-A8 cores in the Allwinner
A10 SoC is connected to interrupt line 66, not 3. This is shown in the
manual (where interrupt 3 is assigned to UART2, also in our .dtsi), but
has also been confirmed by triggering an PMU overflow interrupt and
inspecting the IRQ controller status registers (from U-Boot).
Please note that "perf stat" does not use interrupts, this might explain
why this evaded the initial testing.

Fixes: 7e345d25c796 ("ARM: dts: sun4i-a10: Add PMU node")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/allwinner/sun4i-a10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
index 51a6464aab9a3..cabf619c2e217 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
@@ -185,7 +185,7 @@ de: display-engine {
 
 	pmu {
 		compatible = "arm,cortex-a8-pmu";
-		interrupts = <3>;
+		interrupts = <66>;
 	};
 
 	reserved-memory {
-- 
2.46.4


