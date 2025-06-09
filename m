Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BB7C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 12:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hfNgM/UwK9Bgs6Z72i34/JIUtkeJLfZjGuO9+tnxnH0=; b=OSQUtyewh2Tvd8s/5evJWhkc+V
	1UjoJAyt7N4cC8Tv8m97ILxt731Rkz2siOeWCnfPeFBGn7s5Cr4lspactjUouIavIqQsnrTQfcNJF
	SsDSlcDr9T+zMuxTF1c6QzgowOtL3ZMXsFTL88R/EWitaiBm9CJVxGlPcqCQ4hslOJaoKalf8gkmd
	MZKrfQWKrknTGgBneqZQzP8sdnTtwvbPznlum4LG4tWKypzjDHYqZSa/3b6vHBCIFmPTPPfOK/Flk
	I9zzUSm5f9lranhXWIhnbZNalHf0j2dROnIpNb7HpkXUkt5xidCnvMl/cxOui1/nkb4gecf7rPjH3
	KCHRdHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObLm-000000045Ec-1EC4;
	Mon, 09 Jun 2025 12:11:38 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObDF-000000044RH-03m8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 12:02:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A901243280;
	Mon,  9 Jun 2025 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749470564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hfNgM/UwK9Bgs6Z72i34/JIUtkeJLfZjGuO9+tnxnH0=;
	b=ljoFAD+30tSZSx407+2w+YNK1fKSnD3cdTADkIFdznx6Rt/JlyhivF0fVhvp2IPAfRttnx
	4XMFp8fcOrGTdM/valSvUkptmZH4+/E2gWu6M10YK2vX7bQztIc+WLyMJjhBMe/mMH8FwC
	BcyNvFdPsVHWLxxArDn+0i5sVArRnHEfsr3Sm23MyzqZoTBme1lzWFHSSQsZd5YY4Owr6a
	rZ4nlIJ1ye7QGZ4cEonhqEZvyVzZ/OiSCkLu6xJdgzSLwdI3wH1u0KlQbnTC39B/lasPAP
	CHLZ/MpJy/VFzNgHfqV/3+T1Z4pBc9FBIqErUz5FBSawySGjltulFdGgXedaeQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 09 Jun 2025 14:02:34 +0200
Subject: [PATCH v3] arm64: dts: imx8qm: add system controller watchdog
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-imx8qm-watchdog-v3-1-5c22618606c8@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFnNRmgC/2XNQQ6CMBCF4auQrq1ppwXBlfcwLkpbYBKh2pKKI
 dzdghsNy/8l881MgvVoAzlnM/E2YkA3pBCHjOhODa2laFITYJAzYIJiP5XPnr7UqDvjWlqXohB
 CQinBknT18LbBaROvt9QdhtH59/Yg8nX9WpKddlbklFFgGnhV87wxcKmdG+84HLXryapF+BG43
 AuQBCkrKHJVGSXtv7AsywcuBI9e8gAAAA==
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
 Oliver Graute <oliver.graute@kococonnector.com>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiveefueeiveffvedvfeetvdfhkeeuudefkeeuffefgfekudelheeiffduveeikeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtohepfihimheslhhinhhugidqfigrthgthhguohhgrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_050249_192309_2D265913 
X-CRM114-Status: UNSURE (   9.93  )
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

Add system controller watchdog support for i.MX8QM.

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Third version of this series. I just rebased it on v6.16-rc1, dropped the
binding patch (already applied upstream) and took RB/AB tags for the
devicetree patch.
---
Changes in v3:
- all: rebase on v6.16-rc1
- bindings: remove patch
- devicetree: take "Acked-by: Oliver Graute <oliver.graute@kococonnector.com>"
- devicetree: take "Reviewed-by: Frank Li <Frank.Li@nxp.com>"
- Link to v2: https://lore.kernel.org/r/20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com

Changes in v2:
- bindings: take "Acked-by: Rob Herring (Arm) <robh@kernel.org>"
- bindings: take "Reviewed-by: Frank Li <Frank.Li@nxp.com>"
- devicetree: move the watchdog node just after thermal-sensor
- Link to v1: https://lore.kernel.org/r/20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 6fa31bc9ece8..11527050ac8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -356,6 +356,11 @@ tsens: thermal-sensor {
 			compatible = "fsl,imx8qxp-sc-thermal", "fsl,imx-sc-thermal";
 			#thermal-sensor-cells = <1>;
 		};
+
+		watchdog {
+			compatible = "fsl,imx8qm-sc-wdt", "fsl,imx-sc-wdt";
+			timeout-sec = <60>;
+		};
 	};
 
 	thermal-zones {

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250203-imx8qm-watchdog-b8363342842e

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


