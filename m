Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEF9C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qz4r6eDVVqJGCe/oy52NXEZSAO5/dgEgwwHQac9esXw=; b=U9apys/6123YT+
	DqK7apA5UrQ1DMg4hvg3/nceMeqE9p7TDGiAL+AdrP42XdX1iYEqyuRODu4JuopKXDg9pKtykH94J
	CAHz09Y5wbLgR+2zVpuOtEQGQBqvu3RZJJ8idK8ub9lWvXXS4NnbDZS6N8T2D85cT0U00bPNVLzOt
	Tt3fmFBHCtyjTdDU7zpBfgZp7V2AP/IBMkfn5NueeFL4Yo+6u5OAI2MkEN/0sVrZuOHGPUOSZ+n0A
	gtxkxegzwEBc3TGqLzq2OduxXNeRbAvTT0593WhGUasSz9Kp7dwdh9nxDfejg2rwH2quRBoyoVi+/
	4uuY3GoRzPV/DzssoC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZ2-00000001e7m-1hFi;
	Mon, 07 Apr 2025 18:51:21 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ptQ-00000001JlD-3c0T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:04:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C35D244366;
	Mon,  7 Apr 2025 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744045452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qz4r6eDVVqJGCe/oy52NXEZSAO5/dgEgwwHQac9esXw=;
	b=jdNWS3eAIVArEu3C92X0nLhisMf4z4c8bYFhix+J1Qj0TNzESU4h8CxN8OWce2xCtdDWBN
	OS0sz31DbWeuKlBZDDMCKq7KoZXHnfLPZBvxgIMVMPfaj8VrnIokQWjwBXR+EBakqal8rZ
	Tdo10z2GbkFertT9xhX9LC82+lmiFkVRprNxSDIVfgBK241oecKMKlpNgU6D8JAuCYVr4u
	ExKlLlUuXRjdGWAimloPO/X4qzYOJk+/7hWCC+Z0DxC1R1O8vTTb/R/WBL6Eq/+vz+r74R
	sy07XEZcpLurONERoFmZ2nTktPWtQrJdeBpZqOpyoCTCn9jPUmyQcT0BVhMCkw==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH 0/2] Enable watchdog support for iMX8QM
Date: Mon, 07 Apr 2025 19:03:24 +0200
Message-Id: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwF9GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3czcCovCXN3yxJLkjJT8dN0kC2MzY2MTIwsTo1QloK6CotS0zAq
 widGxtbUAZHZNlWEAAAA=
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
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedthfettefhfffhleefgedvveejfeeufeeflefgvddtieehtdfggfeileegjeetieenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggur
 dhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_100417_051117_B201E5B7 
X-CRM114-Status: UNSURE (   7.78  )
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

This series enables wathdog support for iMX8QM SoC. The first patch defines
a imx8qm compatible, and the second one adds the watchdog node in the
iMX8QM dtsi file.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Thomas Richard (2):
      dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
      arm64: dts: imx8qm: add system controller watchdog support

 Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi                   | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250203-imx8qm-watchdog-b8363342842e

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


