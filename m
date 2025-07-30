Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C62C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 17:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1DNQ/CkakWxya9ioCSMZc1LGlAXI1Hd7khVRlNaZQcw=; b=cuYSnw1Cy74zh/
	OHUYnzs7i7exnEZwhSH0HQzuzhIQrUkt839I4N1f3OxQQ/KpT1a55U13SWqJXc6QLU9TM/WmCxgPF
	c1mHEsd5XD93J75hoHQ0BlVhB2V8C5Q1DPKypuwnC+J+8zkk5j/a5/W7zn5gZIVTvhu5hKsrEEkz5
	flG+LPMT2DI43xfZ9grz5p47yDjl0aoLSTsFqkNEPyA6wQ6YTg/M1O4cgBDwx7Iz3psBnJOD+wO3J
	T4VxyXW3C+0ym3QCU0FeKpxwkdICeC1ouHs9O91yfimqllr4NNpRAk48Be9eqbL53/+wPeeD+vPYE
	lSeHPqKt3ZDHK/cBXJOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhAHt-000000024IO-2bkZ;
	Wed, 30 Jul 2025 17:08:21 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhACf-000000023Wf-0hjg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 17:02:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 101D8442A0;
	Wed, 30 Jul 2025 17:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753894972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1DNQ/CkakWxya9ioCSMZc1LGlAXI1Hd7khVRlNaZQcw=;
	b=K04Kc9Y6dnQWT5oN+ubkShWHbI8woF2yt1y0mFhoMAKM5X8GrLn+uvU2xg/JE8ySiEEDJD
	C81sTMRJ1ppatn5yEiMvYsec+9O3+73dSVseS0N6dfFoawFkz4p2MOfTbvFrVoiqe/PGJH
	Zd/lq2JX6lT4SqJ2ZFRGphgEDCpqcsZQJ5m0sZRt3leuEph6FgVGXmtW6MGdARy8EHW5oF
	shguFngo9FyXQrCmIGUp5K9TehoKKIRfg1O4Ft5Z+B0H1l8iFkRjjsn0nufA71DwiwaRES
	WQdkBR83bk6x+B1cYOiKz11afRFBQSKM9dTSOlNvilsfcuCY7db6sU3bjgDYfQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 0/4] drm/tidss: Fixes data edge sampling
Date: Wed, 30 Jul 2025 19:02:43 +0200
Message-Id: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADRQimgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc2MD3bTMCt3UFKA4UDYlJzMvXdfS0Mg4zdzE2MLS0EAJqK+gKBWoCGx
 mdGxtLQCzfyWvYwAAAA==
X-Change-ID: 20250730-fix-edge-handling-9123f7438910
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: thomas.petazzoni@bootlin.com, Jyri Sarha <jsarha@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=3qzM8m2sqw4qt11ky5Zv7yvJN7y2yZ0leaL6jqvwqYc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoilA2a00gR53zdQMgm0IpbJxo/GWqnEGpHBJrx
 ziHrurFqiCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaIpQNgAKCRAgrS7GWxAs
 4gPsEACtfeuWZHXzNyPgiXjgYEchXlIJ4dMxcQEZCXZeJRYSzOYSJ2i65LxOdIlXKLKFNZqxZ10
 YJR7B9JT9zvlKVrM5FbEm/QyqQY7MInZQ/RiQqiMKIUPzeALIOY8HKQCRYH7q7QFOlbThCzA23x
 gseaa3SnXSZkA9M3HK0F/vbM/PoJkH9mA4T+dlHPRdVdg8fRHmbqItd4W8xjtQa5hnGJq7e44oS
 BBYskh+Q0nGrGmM8tao+iEDhWUHrTI7UU+TR4PTJxkcblgkv7fSQwSqqmZJ4dzg+SK8RpO1k0v4
 jvAxESeEo3TkgC1eAyltdmK7ChM8HmKN+XXW1v3JfIBvg1HKwmQfUNJRv6Yb1hSlT2BvwufRLJN
 KSMWP91O/B/NkO99alxNzuoXoCAYjxKzBmIo4cZAhhjBiZcV7YkDOzYaw3YOU+7zld8JEomHL+J
 cijDW3cN7cm4TXdZMSu6w97w/hVOiGVARXYhB7pPWqIDpE8kk54D9awSIodRn8sxHFQjJYyMj9d
 yJe+L63ZVYDG7lb11zICs5m3mDlQmp5xsSJct4rKpI8oQCRV4/OeCOOaE+o0ZGS35jnZ3cztHM0
 c92qmvMilBf1IpKfeKxkji8vgRxHjPgLh1LGlBGkz0w/KD3HPpnmigpL/u/58yhwL9Q8pGvxlTG
 ME/FmGb4EcH2zJQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfehueeguefhjeeuhffhjeekueduiefggfduheefkeelteelieevveeihfevueeinecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehjhihrihdrshgrrhhhrgesihhkihdrfhhipdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrihhsthhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhim
 hhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnmhesthhirdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_100257_691482_B82C4762 
X-CRM114-Status: UNSURE (   8.80  )
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

Currently the driver only configure the data edge sampling partially. The 
AM62 require it to be configured in two distincts registers: one in tidss 
and one in the general device registers.

Introduce a new dt property to link the proper syscon node from the main 
device registers into the tidss driver.

Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
---
Cc: stable@vger.kernel.org

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

---
Louis Chauvet (4):
      dt-bindings: display: ti,am65x-dss: Add clk property for data edge synchronization
      dt-bindings: mfd: syscon: Add ti,am625-dss-clk-ctrl
      arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl property
      drm/tidss: Fix sampling edge configuration

 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml       |  6 ++++++
 Documentation/devicetree/bindings/mfd/syscon.yaml          |  3 ++-
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                   |  6 ++++++
 drivers/gpu/drm/tidss/tidss_dispc.c                        | 14 ++++++++++++++
 4 files changed, 28 insertions(+), 1 deletion(-)
---
base-commit: 85c23f28905cf20a86ceec3cfd7a0a5572c9eb13
change-id: 20250730-fix-edge-handling-9123f7438910

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>


