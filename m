Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C52606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YqnkW9tU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YSXLCZnB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1hYspQIQ4LkjWerTtfiwgFtZ0WGW92Raq9eAnPsktJs=; b=YqnkW9tUQLNVcE
	D1hymbCt5BiOZw9hYIHBsaHFnPRPoRyHxsSPeD9KWbUYCOj0Ptsq2TcvDGFn6teCQAkB8Jvw8KxDA
	eamVvEz/Q5cdVxylaI9I78JZsDCH45X2IBZJZK0EM6zgvCcnPSM6nqKGUf3xyct+vomqAriwyX9zY
	IZDyQWSBV6Us7o1WPcjMOMFBfpAUFnHesr7d3+zg+dhIkf/0O4jV0we2gCWgem4BHols6V7d25iSE
	U1yfJH6TNAzN27fd/kr13w8VzokDls/zBdMwURQdAZ2sKbFt5OfbczNpIEBACJlrjYLxOjgg4qSKv
	zi/2eHOEX7QRBLd1K37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62o-0000000AoYz-1Y7c;
	Thu, 05 Nov 2026 22:34:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62V-0000000AoQU-41FG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:34:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A785F41F9A;
	Thu,  5 Nov 2026 22:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533AA1F0089F;
	Thu,  5 Nov 2026 22:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918075;
	bh=1hYspQIQ4LkjWerTtfiwgFtZ0WGW92Raq9eAnPsktJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YSXLCZnBsbSH6o9EuclTsHCKziC97L4yn92K40m06PANLvq1GqQl3bKFJE8dK7QoU
	 p1YA0e+08t+qsfofVL5fcjba2n5sO0jNzAj9WXkGnmqTXPM5x42Mw5l31ctLwll7pt
	 D6PPgAT/bMOzcsIYtAn4MwHwbeIYLB9BaaGjOklDQsoQTs8kPV5FO+ixObOZQgR/14
	 JieCUr930vDatI4bY+SqwLhE9PAfHx5NDgbZfC69B0wLqQxsLDL5/o9leHd89UWy85
	 rtHuS0KlBewmmNvVykQ3rF+xB8hK7VzPbtEXKhAVncWK5s0UkaaSpmUvkvhO9kOn85
	 Z/8P1rEGwT2yA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:19 -0600
Subject: [PATCH 6/7] ARM: dts: arm/vexpress: Fix Cortex-A15 GIC compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-6-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The "arm,cortex-a15-gic" compatible does not take a "arm,cortex-a9-gic"
fallback compatible, so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts | 2 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts  | 2 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
index dd68250fa999..75d7f2852f94 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
@@ -92,7 +92,7 @@ watchdog@2b060000 {
 	};
 
 	gic: interrupt-controller@2c001000 {
-		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
+		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		#address-cells = <0>;
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
index 8f210671b287..f3f9d6e4dd16 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
@@ -147,7 +147,7 @@ memory-controller@2b0a0000 {
 	};
 
 	gic: interrupt-controller@2c001000 {
-		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
+		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		#address-cells = <0>;
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
index c716e60a8be0..a5e0dde254ab 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
@@ -119,7 +119,7 @@ watchdog@2c000620 {
 	};
 
 	gic: interrupt-controller@2c001000 {
-		compatible = "arm,cortex-a5-gic", "arm,cortex-a9-gic";
+		compatible = "arm,cortex-a5-gic";
 		#interrupt-cells = <3>;
 		#address-cells = <0>;
 		interrupt-controller;

-- 
2.53.0


