Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFA4E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 21:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ajF0q6OCJuLsYioDhwVmpl7KNWSqiP+JgnntFRjDDG4=; b=obnD4JZ904QMphnA8stkZWpc6w
	WKfcaxs5bc+tLeL+d8MU4iOT5ajJx/1223DNulevOz+InoB2lRbOopGnfwIl/GYyqGhNADimw34bl
	iEAVv3fuM+XX471Id/cOBnlI0oPBI9uACnvENeH4lidWSA5puyiWj/Vhm4V4ztT5oy5G7yVwM1yvb
	JfgLDLdbC93XU7TQn+folBIEUyWWg6OHMrmQsldXIpajuJjHVMpP5SmiuOp3fTuECFJwPgdAgutj1
	bSGhWfgYbUN8O6O9YLXK2eRoXQpc9OXO+r0ncuvDGhxzFWsuuuH4gMrCGjaA1UZh8jfmf0Eg00WBI
	+X5e4h4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO1Yf-0000000085A-0q19;
	Wed, 18 Dec 2024 21:26:17 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO1XY-000000007zU-0GT5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 21:25:10 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4F8D0114019F;
	Wed, 18 Dec 2024 16:25:04 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 18 Dec 2024 16:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1734557104; x=1734643504; bh=ajF0q6OCJuLsYioDhwVmp
	l7KNWSqiP+JgnntFRjDDG4=; b=Dtbd3xaH0xMu9DZFCIUFlLd+vTa/Lw8JpCQPy
	LDaOgII/NnRcEJuhJ0iya+tUp2A4usbLr8lXm4+pqO9JDR5I/TR+dTiCdCksnJPu
	RK+0RfdFMp2uLjJ3q2NCsWRg//g9/5WquZw4jaXzjph/jpghoGkqOgY/8E/qSpAY
	LEzzrgZ2KJM6LSnN9Zhz1Z1baIVqa0/XwgMkWTfu3wLuluD9dKdjzyrFjvey8JrK
	6sbPGusnhwn1KVYHpDom5ePTXjZOCj98eYAD03RN5lhS1TxxNtxQDPVNg1hlGctb
	xcgtf5yWHH7zos9rcxdlZuNDT4pxD/AR0Mw/BhgLwOiSHXhKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734557104; x=1734643504; bh=ajF0q6OCJuLsYioDhwVmpl7KNWSqiP+Jgnn
	tFRjDDG4=; b=g9khhf41+0tF12rxgfuLL5H3w/h4ATcUyNw6H7Ur+62IaIjQcz1
	TPWIYljCbZB5U4Nxs3vfOK2yg+jkUFf+NjRagJkrQu4VoMhk1daXGu28Mz2C3U38
	KJd/JC08wgnp6/jlUppWRC3/lXri00qdsn5bv6TZF/XfxNzRGUjGKFa7h5rbKmhw
	M52OJmWvNN8LLn/LXisZHmrZlVga2v+id1X/aDY8+fRwV8riYU1Vs3BKz+yZHxkE
	FIA3HZwYrm/CymaW3zSRhVBKerit0EABxerv/VzlPecxoXXRSDSiyUeAd4QR7wMZ
	PsjnCMINmii620Vd7MAsgt30mVzd6W4WT6w==
X-ME-Sender: <xms:rj1jZwgqEhEYT0ualcrzwbOq_gesttZYpkVSbCijZWA9YF-Mf17m3A>
    <xme:rj1jZ5Ax1Y0p1VdSd6ZJj_z5_c7Ds6WFZgvJdw5nxJuZb7KNqbWRsNVbDyIyHZP4M
    9nMA0d7tZa6tGhbTFg>
X-ME-Received: <xmr:rj1jZ4HSbXa7olTni3gDMsvMYFYDcg0OnMXSYklJQGUbtRD4hr1j22GIb7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleekgddugeekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:rj1jZxTzsUkmJn4DSDqtvqRuCy041IwKMmvZl9gc042EIG-UC0VRNQ>
    <xmx:rj1jZ9w73Ou4inMQs4mpBe4G6QHix3j4nriQDqmigDnVAo3h5DLTAw>
    <xmx:rj1jZ_7AQ8LQIsia8H4AL0qOW1A34WoyWVVXrbaTcmq69sWOUc6oDA>
    <xmx:rj1jZ6zxAjciFvNk9hRNSP8ZmseV3_xyFdZglL9lrEP6BL79UxUTjw>
    <xmx:sD1jZyp9ectKCObsjwWr1aRtv55CMJU8WeTNvP--ACpX0ngj1mhnS4Sw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Dec 2024 16:25:02 -0500 (EST)
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
Subject: [PATCH] ARM: dts: aspeed: yosemite4: adjust secondary flash name
Date: Wed, 18 Dec 2024 16:24:57 -0500
Message-ID: <20241218212458.3050775-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_132508_917553_28D57FDA 
X-CRM114-Status: GOOD (  10.98  )
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
index 98477792aa00..e20816d9e077 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -112,7 +112,7 @@ flash@0 {
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
-		label = "bmc2";
+		label = "alt-bmc";
 		spi-rx-bus-width = <4>;
 		spi-max-frequency = <50000000>;
 	};
-- 
2.44.2


