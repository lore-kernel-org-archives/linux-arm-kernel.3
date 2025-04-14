Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47ABC369B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VzojeLzRzjGTLGMyfYp2jFx4+LuKjP4OXY5FtffKGh4=; b=Et8/XftWc2tWtt
	WLOZ6x9BUxb3jIR6JmRj8mJeQNk1Zcwjyh3sh0IHVcgDEqSCVpFhIYwIHHdleZar9+DENXIGo8dIt
	ghkuGYJiKFCCMn1snEGuWhz6DgyESSo9W+RKoxHog1gHYA5mKhtQRdorOhiVq4XXbZZXaIGwGuYmM
	fKtJx1FKygwta2w5vkslWAGC3k//JBk23Ba+rgbI5sFIOZEVqIcKb9VGJlUrS+7IgD0YQL4PnaRrO
	YvgroDxn+/Ms9ilFVXiyeQ5w8v+qJC3bCjwR4I2h0MynV21CfYXPISkMKiJs+IA/2YnsQW5aLQW8c
	OLLVFwGlkjTaKnpikwPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LT1-00000002ZM4-0ZX7;
	Mon, 14 Apr 2025 15:11:23 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LGK-00000002W97-0I1F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:58:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C694843873;
	Mon, 14 Apr 2025 14:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744642690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VzojeLzRzjGTLGMyfYp2jFx4+LuKjP4OXY5FtffKGh4=;
	b=OO/7IjbVfrVk6xAWP4rf7KxCg/QeTbSKDvEfKBRJAl6Y5vRQk+0Lz3H8QauGfslmII75u5
	w5k/Z3r6eM42Po5LBDv63KZm3SnpyUl4y6Ha2Zqw7YZq29I+7RcX8T0iP1HyB8Nsm1B+xy
	riD6zdJ4/hOtdi6brtCRNUkRdtiS5kDPF04Rc6RC2vJIMqufogSbSNqA0AxQ7VGU+ve3n9
	2CGn9um/ssi5hxo8U1gG/lquGb5/s1JbsqW6TPY2vrjyYJQfzCyS2qZiwxFejy/i6qGqQJ
	+SNq/8dVmAlrt0TfQQsdDescE2NBcC0M6e+jwUHmfQQXZK51shNo8WAnp83dfQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v2 0/2] Enable watchdog support for iMX8QM
Date: Mon, 14 Apr 2025 16:57:23 +0200
Message-Id: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMi/WcC/2WNyw6CMBBFf4XM2pp2Coqu/A/Dgj6gkwjFllQM4
 d+tuHR5TnLPXSHaQDbCtVgh2ESR/JgBDwVo1469ZWQyA3KsOHLJaFjq58Be7ayd8T1TtTxJWWJ
 dooW8moLtaNmL9yazozj78N4PkvjaX6vk579WEowz5BrFRYmqM3hT3s8PGo/aD9Bs2/YBqPUHF
 bAAAAA=
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Richard <thomas.richard@bootlin.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteeijeduffelvdevuedvieeuvdeugfekgeehjedufefgkedtueduvdffhffggfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopegrihhshhgvnhhgrdguohhnghesnhigphdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlr
 dhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihimheslhhinhhugidqfigrthgthhguohhgrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_075816_272165_5FD0E9E0 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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

Second version of this series, I just took the Acked-by/Reviewed-by tags
for the bindings patch, and in the devicetree I moved the watchdog node
after thermal-sensor as requested by Frank.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v2:
- bindings: take "Acked-by: Rob Herring (Arm) <robh@kernel.org>"
- bindings: take "Reviewed-by: Frank Li <Frank.Li@nxp.com>"
- devicetree: move the watchdog node just after thermal-sensor
- Link to v1: https://lore.kernel.org/r/20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com

---
Thomas Richard (2):
      dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
      arm64: dts: imx8qm: add system controller watchdog support

 Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi                   | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250203-imx8qm-watchdog-b8363342842e

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


