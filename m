Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D074C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkEcz9Od8lumPLGSI2mDm7zd90f2J6ysx2IIFyeMJqI=; b=3mrkKGL4fONJTTvUxSLTKEhXi6
	THGtMLxn3pPXOpH2YARIB4HIDr+4Tu2R89968/1ipw/tAOkBVrELXbKUhQZ1CuWzCKOVYg2neQmqs
	TUe2kXHQc9SjvTT4EG/YAyoEt+Uh0AvgQWInwUQNesXbdyGgcuDZEd/CLetXeEGyUzubClyf4QcLv
	wfN1+i8VKzMXXQIBpSuH2RmoMw0qMJ/6zW1OHPD4PqF7QThOZXuStGZps4X3ungi2V5iSDsGngWLe
	eM28aDO61doNKCjDwIxdimRZz6b2OBi+etasz39Zc/Nhj9mpB+dA9YGqhAINtk3JRAYAdrrGcOUZZ
	DUWWtq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhAFR-0000000242C-3SdZ;
	Wed, 30 Jul 2025 17:05:49 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhACf-000000023YJ-2vyg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 17:02:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17D92442A8;
	Wed, 30 Jul 2025 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753894976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VkEcz9Od8lumPLGSI2mDm7zd90f2J6ysx2IIFyeMJqI=;
	b=f7GHXv1lkyC5Z5PHrKkyeT6qbn/8ObZkq64MuI3kVq6v9CyV1NhYlJVFLHHtSITgx+Xlse
	pAtAm8R27EtjZxv5oceulWPucQ7w+ki+9KS88kW9zdAYQCbA/fG3I/oep1o+Ju4MGZQB9d
	moZqJVWvw5DbMycog67ggCgSpQbRgsjluKNYyiiihkDKZfIoiNTGLrlYYCOYtzqBZgewqf
	cZqN9Ehm9Kfo0FT5Sl5QlcnKZhli2bhXS7j9T2Q/ZcFyZNZ67LlTRZNVtbkYOJ2TpKBrcL
	/I+LSeg+q029Lk569x4SPkI2E6yoTWQPrKcoskHC8cfmDP30FJKcLQFaRxthDA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 30 Jul 2025 19:02:46 +0200
Subject: [PATCH 3/4] arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-fix-edge-handling-v1-3-1bdfb3fe7922@bootlin.com>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
In-Reply-To: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=HLG5xT1A8odfzcfiuinlcthJrJAa5lkuCncAANUHOzY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoilA3fOPjwvG0cZmE1+t6tNyHTDM5v1j5X4MXI
 s7lieBu5JGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaIpQNwAKCRAgrS7GWxAs
 4kN5D/4kRrkpCIavS2bJuKWAbgwtv9Mn70in9EJNplGfJRxKJK6SIYrOELlRzPDRiDfqJFWMxLw
 On3QBUHIUvAfhBBG19FOYinL8DTawFHeCUqgkSPD3KzvTUfzqA0uJLcrJoE9ifGPyK1YjXPrHx0
 KKmeiQHNrqBvA14SVQgXhrgnPCY82Gtm8A345ffpvnkDRH8f+qhiToeRd/xnLctCIT1ZC+yRNRk
 fAzce1tW3zki5RzgumyzJYdJKorbep1zGd8bKNwZxA7+LtNfQI3VzuHZ31FBqQsM8q6aeuco3Pp
 O24GeniP37W6GzFsOT3rz9Z0k+66zDU8MaLWEGCf8av7oG5Of1n1qtlLKm/NgLIERIRviM1ojjr
 xMzPZyRhLQz+Fy/pOUXxxFFGaLjZgP5NhTc0nuLEyNlm1Z4wUxAD4cUP5L2r9wOOzI1HufQRBtA
 9UNsTiiuv76Y2dVR+FCwIYFsobp8/Ax5cIdp3/nJTfYxaH2Y5o3mnv+oVWyAv9SsiKXZwotbSOJ
 QLayqbrCTaaZ4xTwnA1o06WnH1dOvF4qCWttQobHkL0BUpvuq+kkCyNAS6N6JTj1Gjc/cemHOJF
 lpkxhaz/gh4NAHmJKMBft7eTAkC2px5FdDnHjSZeNAfy2a4Ggppek3VkiUAs38bW06SHvO0BD4c
 FKK2cXZHMELwtQw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehjhihrihdrshgrrhhhrgesihhkihdrfhhipdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrihhsthhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheps
 hhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnmhesthhirdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_100257_871349_D9715280 
X-CRM114-Status: GOOD (  10.04  )
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

For am62 processors, we need to use the newly created clk-ctrl property to
properly handle data edge sampling configuration. Add them in the main
device tree.

Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---

Cc: stable@vger.kernel.org
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 9e0b6eee9ac77d66869915b2d7bec3e2275c03ea..d3131e6da8e70fde035d3c44716f939e8167795a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -76,6 +76,11 @@ audio_refclk1: clock-controller@82e4 {
 			assigned-clock-parents = <&k3_clks 157 18>;
 			#clock-cells = <0>;
 		};
+
+		dss_clk_ctrl: dss_clk_ctrl@8300 {
+			compatible = "ti,am625-dss-clk-ctrl", "syscon";
+			reg = <0x8300 0x4>;
+		};
 	};
 
 	dmss: bus@48000000 {
@@ -787,6 +792,7 @@ dss: dss@30200000 {
 			 <&k3_clks 186 2>;
 		clock-names = "fck", "vp1", "vp2";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		ti,clk-ctrl = <&dss_clk_ctrl>;
 		status = "disabled";
 
 		dss_ports: ports {

-- 
2.50.1


