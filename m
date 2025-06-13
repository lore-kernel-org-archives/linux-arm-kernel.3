Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F24EC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06HUies5V7PRfoIqtd4meQuakxr9viCcxBP1N+2s1sA=; b=Zc/qdJynpjVonZD61B9EERPKZe
	vdG+P1uAKHl5Qi4HIQCH0o0yDuWpFXP0a2k6Nh2FKnQdwlm7ygtJ2pjmnQ9s1WcbJpd2ehBqUK/1E
	pbD/Odg1G5u+eVLMLt5PG6UW4/CMtSqtEnwihU18L0T3NTyKG9hHJtKVHHCD3Xab8zNQHRbg6zjRW
	YAholRNPKjiOg7ZSfOrYmBlSWaYqhg7W7g1JRnsV1pVTNXMuz8l+uekQfwMQbiXSH2VxOgz/+bepE
	zsBts5p4jE+dBcfnBZQVX9e0uRv/AQ8q05+TjC1YoxB8xYhlRSEZqTdGdgoc4L6ADD1PU+Fa5e6b1
	gJbmLDcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8x6-0000000HFOY-2YYp;
	Fri, 13 Jun 2025 18:16:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6fH-0000000GxGA-2EKW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 15:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=06HUies5V7PRfoIqtd4meQuakxr9viCcxBP1N+2s1sA=; b=TKlCniUyUXeJjz7vOxLrbn3rD6
	6dPfRIKego3IKhsE4Tz3g5mhAitpQ8ikEf0Egz7pW9QzU0BG9Dd5esAO+m5rq2jQTBpwApAHJIydQ
	+4ZmpVdNy0Q3oY/PyWlvTpam0KYIoyFcCylXNa0aINh1L2TRHvB9OnqT0vSKbc1wjcB43Xw867pug
	tImK1CNeY0aHFIqXuOxooiUv6HNCZZMf3L3jWMriPo2RkK1C9kIyiA5ay8fLfif8Mnx9DiRPdZALr
	FyK/D8/gkDvw7wv1rFHgocRkgtZXDQS1XyF6lHcAdO9kPCRqCfptrKTL1UAvjppOombI7nhdpHJka
	xE3cR8mw==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6fE-00000003254-2jI2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:49:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77A9344447;
	Fri, 13 Jun 2025 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749829791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06HUies5V7PRfoIqtd4meQuakxr9viCcxBP1N+2s1sA=;
	b=JoEXE9bZRnEeG69FH/gTa6N9rF1tm/6Ztnot7Gm6/NbrXPQAkk3NnioADJWIfErYMt9AB6
	ePqTcMnkm1QuuVNeBkH9eB4ydseegPV4fBNSyEl1hxBn8Wrl+MmyOB3soCwodliRBRzDur
	Z73+3SuxAk55frgcM22aKCONpIex3CUEDv3EtOic1LC6VCZOQ3ZsaZsJjkHMgrMZ3VAHmt
	4f9VbdUpSHWZG59BiuUzJ8wCrhgp14p/3meF42uyVEQXMGew3nBAiWttWx4eHOLJ7GjCqT
	QrLQhIWZaxz2PwLlqCn2CC5jsu+eaymmicitVmZ3SwGwG6G2jbtY4e+HIkkrPA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 13 Jun 2025 17:49:46 +0200
Subject: [PATCH v3 3/7] arm: dts: omap: am335x-bone-common: Rename tps to
 generic pmic node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-bbg-v3-3-514cdc768448@bootlin.com>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
In-Reply-To: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>
Cc: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppedvrgdtudemtggsudelmeekheekjeemjedutddtmeeftdgtfeemkegthegsmehftdekugemgeefgegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeehkeejmeejuddttdemfedttgefmeektgehsgemfhdtkegumeegfeegsgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepmhgrrhgtrdhmuhhrp
 hhhhiesshgrnhgtlhhouhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhkrhhiughnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_164956_830495_5C45BF74 
X-CRM114-Status: GOOD (  11.13  )
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

Rename tps@24 to the generic pmic@24 node name.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- New patch.
---
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
index c400b7b70d0d..ad1e60a9b6fd 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
@@ -212,7 +212,7 @@ &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	tps: tps@24 {
+	tps: pmic@24 {
 		reg = <0x24>;
 	};
 

-- 
2.43.0


