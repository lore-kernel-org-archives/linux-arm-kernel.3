Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1C5E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RIzROz9khoj2BhgYd0nISvi0RDBvOsblgFIn28Lq6mo=; b=MvJSnfzsV+2/zUclHyB4OC+eDq
	cFjNfjqtXBypG7N59mbsk897D6scMfpelgxG/tOInSk+/kOkincETncGZqL/vUcU/0Vzl1rnLxIFV
	uO7qK8YRw4SiaHZ1sIzyECMeO8WquAXDM1xSj5bIToB3NQTqNThh/5bLqNANklZk9nr55Ygzrt2Gw
	dTZ4xz0SPsZE+wlUrUcp4Jfmmrw/ARQOjluGF1Iw2pP2YoMU/UdyAO8QM4uV6Lf0OCNTDRM97HtJn
	wB+9txsphstI03rl44J2GEMpT3FK4dhfGc1Sbrr4xFQDu/RAxDTq9gqCCV95WbRknX/JGI0GHzhTV
	qSbZHbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCd4-00000005fuM-45uM;
	Tue, 07 Jan 2025 16:40:30 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCQT-00000005cw7-3Gt2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:27:34 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 8B6A5138021D;
	Tue,  7 Jan 2025 11:27:28 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 07 Jan 2025 11:27:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1736267248; x=1736353648; bh=RIzROz9khoj2BhgYd0nIS
	vi0RDBvOsblgFIn28Lq6mo=; b=JgJYzyfb6uWDMn3aPzlcl/3MJiH2QRXXcmkSK
	I0kdbVlIvZ7X79l4EIKV9TQSUQ3D/hgLZrGsE2BBPn1VHqf7Jc6d1HcExifAI1PO
	OE9q8rYyxLGuN73nUDDivs5+XYpFz6l4KIBJwT01fF4lDlX1ijgRZ4UGOYGYvC33
	bGnDwM7yKi+5WCxfsVWZaR2W2/4HkTgcJRIadJYespfqKUTXbAtY2PhnIkQ+UUqy
	rSj0+mF7g4xXp7A2XWd5CqBXctNlxt9qKvCx3tWAB+4dLovrXjMKzZ35yUHLp+xO
	s+bOUJJU1WSQdDEmeNKwBtPMXi4tMvYCXeNLjtF6PHJ9q1i+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736267248; x=1736353648; bh=RIzROz9khoj2BhgYd0nISvi0RDBvOsblgFI
	n28Lq6mo=; b=v7fL1/cFRe3LyWeEDJqbN+BHz84S4WxdXb/p2y2oyHbnQj7pIeb
	RUg9q8dSrlCzbFr99KizNdUXCWV2/k9UgcWNPOtNvdVqeD6ErQsvzjxymNQ6w5ou
	Z2vXTZwRhYdIBEaW1YLoH4wvMtsou8v7UhyJk8ksg9Q5IrDQgkYEk1ZFO5Mmjqpz
	YYp/gY2Dy8C4M3TyjoBH4at9tQP7yNvfbEqTDl0/YzfvWZZKIvC6sBSRSg2SIPpf
	OBmMf73L/QvH8IAMeN+d17mdMWlUVE63SMF1uQEvtgDcHM8BFMx9NuTn+W5GoGUW
	zxa/VCMEmFThJ2F+QAVk5wZItGXWnywtiTQ==
X-ME-Sender: <xms:8FV9Z1o58OmcY7bOpfDguii-4Dyq9EwnbKb2Rlia05Gm21v-ixVeqQ>
    <xme:8FV9Z3pjvaGGvKkTq73WqoYzNFeC3e4iojEfGBlDjf2Lt14Wr0Q7InFJrJR-BJ2hJ
    h1TSHm01SQFljv3v80>
X-ME-Received: <xmr:8FV9ZyNP23xLO3nAt_k5WbX6SXsU2lnNr4fel_B8nM5WdGDi7mjgAMR7mwM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegvddgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegfrhhlucfvnfffucdljedtmdenucfjughrpefhvfevufffkffo
    ggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoe
    hprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeevtdevgfdt
    hfefveejudelheeghefhhfdtteetheehudeiueefhfetkeejleefteenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthif
    tgigrdighiiipdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdought
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpthhtoheprghn
    ughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphhtthhopehprg
    htrhhitghksehsthiftgigrdighiiipdhrtghpthhtohepuggvvhhitggvthhrvggvsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrh
    hnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:8FV9Zw6QocUaHzH3d5RerqE4_65ciJ2PP1FhCYjR4buSwlZCzyAkrA>
    <xmx:8FV9Z06uYnqS91cIQ4aayYyOJP4doFTlVJpORD90oeKneZUjvlY8Yg>
    <xmx:8FV9Z4jnbJkStym_1S2pHwtjzWRHvnu6bkb9dx1K0bC8vklsDMaF3A>
    <xmx:8FV9Z25WYP8x5t4Io_naP6_mjO72FfUC1q5B4XAo1OBZS6DlO07Klw>
    <xmx:8FV9ZxxwKaQde-S-bbq_i_gl61gnJfILwioB6CCwFQKbwmmaL8X9x4NQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jan 2025 11:27:27 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 REBASE] ARM: dts: aspeed: yosemite4: adjust secondary flash name
Date: Tue,  7 Jan 2025 11:27:25 -0500
Message-ID: <20250107162726.232402-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082729_897516_5D2209E2 
X-CRM114-Status: GOOD (  10.59  )
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

Meta (Facebook) has a preference for all of our secondary flash
chips to be labelled "alt-bmc" for consistency of userspace tools
deal with updates.  Bletchley, Harma, Minerva, and Catalina all
follow this convention but for some reason Yosemite4 is different.

Adjust the label in the dts to match the other platforms.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index ab4904cf2c0e..29f224bccd63 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -159,7 +159,7 @@ flash@0 {
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
-		label = "bmc2";
+		label = "alt-bmc";
 		spi-tx-bus-width = <2>;
 		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-- 
2.44.2


