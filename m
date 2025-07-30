Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950ADC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2UE0f0lxM12DzKY8SLP9Ryrfpakau+5gbE2rpdBN1A=; b=dDN76Zfaax4zs4W4Ub2D5xbT9h
	wt8k1wLXsmJUu8WVXgVMhX6HO+JccVo2vP713TNuqGi5fXlJNW2B91HEobdWyLzuioxhhpIzH/dwy
	ximydZ3It6tRqi7MBnbt9McsY2zEXruRhHDJXoKwpFWhV2NoWV94Kx4O0n/tSVTnAo1pVDKacYGl2
	DL4+12/aiw1NkhU+idfCjLv9/agK7/xCMm+SRIRkgIU0TDC1VxLYeZsNFN1D9a2jY1V1oZyImE9mC
	3K6rJbSMJfT1A0XDwDs8CRFG7FsoIg2L3s8tZH4WTYpbm362fF8GICXAz8sPJmLAKAFgGe4pnqiTH
	1hq61jxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhAMp-0000000252D-2MuS;
	Wed, 30 Jul 2025 17:13:27 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhACh-000000023Z1-0t2n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 17:03:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F0BE442AA;
	Wed, 30 Jul 2025 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753894977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p2UE0f0lxM12DzKY8SLP9Ryrfpakau+5gbE2rpdBN1A=;
	b=ahu2yZS5PpM6RqG4gIA/3xnCkg4qml3y3KjQG8RWCeS0mvQ8P3OO48pA1rjRhGSrKzrK7i
	xxkgydLuwN02xdb5Ml6RPck3kBzCDx+pkpu5ylKcKwPORFhLh8pcpuLaYUiDiF8tg+5cAv
	glJgPdehk+mWn7F0mT65XneDhDEyWbo+itCG78QK53R5CMcaxIXTAdpS7ALLA6xKJWjVKA
	b9Qfv5dmHeIaaouIiJVme4EiM4UyXGpj+CXD4PkLcdT2bu7dHbL2zd88p7K/SzgCeMxxFo
	PjPaPgg+Ccs6LAfJztYZtdj7421A95gj0SUdHn9FKnjKBuFY4dZ4M0n2GyRw3A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 30 Jul 2025 19:02:47 +0200
Subject: [PATCH 4/4] drm/tidss: Fix sampling edge configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-fix-edge-handling-v1-4-1bdfb3fe7922@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/p3QCeb5vrjQsgDySv7ceP1YaCttjBmqpB2bCe9hbyY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoilA3+uu7ksY6HhTrzvxrlNdnU7OHWYsxGYCQ2
 fxOj7ZMH/+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaIpQNwAKCRAgrS7GWxAs
 4tKXD/4sZ0sUqe4etG+L+kea89Ub7gI7TmlWL/HHW/R4eN/jjonq+ae5qyuwSAYLbvlFvEBEgyC
 qGTFg0GCF67gfuuN095HEUNZ1EP9dGB2S0Yqj3MKXM36OHsCG2DHXtsBaFxs62DBxrwgnA1tEa+
 04f30TQYPpAPR4oKH/FF1/MEfz3j0Idt7cQXQcbqV8svD0waNm95iMrezSX15XkMajTFFQ5fB+S
 tbzr/utpbB4oFoT+mpoLBLPIeaE6Y9MlIi+iui9Ze3e4E4DjGRtj10IzVkig8tKyF+juxQNq61s
 OFuZuBz0o9eRx1ZQSuOW5HQrSP+3EkS0Om7KQ6OvJNvn/22fQb0zhxbON9UZ9LNjx4ooAZ/NxHR
 e7kMUuRN/CN4K92cH4vXzB65xti1xFFgmoQUpvjIUSH4FSTSvcxbdPYgoVjLvrImV6IOCzwysv0
 A7bhsLRoY4ZsyY2jqRTICAx4X3SQ10DCf7JwLKfvd+mxkZivK9nxJ9t64krM0M8PpYjQ802gPk3
 5tao4daQfje4SJ0R/shh8sCut2UJrR2QEdLX62WNxIWlRWfqaQTRDDHTBv9hJF1Sg4Z0dtPmyYR
 XZlEuSKxYEjSz/DNucVZ6iYTK+KIHJy27udRLPlcsFeAVY9MJnojagC9sn5AbuY827lx87j98Ps
 241f24OZV4aqqFA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehjhihrihdrshgrrhhhrgesihhkihdrfhhipdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrihhsthhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheps
 hhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnmhesthhirdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_100259_411237_76CC6270 
X-CRM114-Status: GOOD (  13.36  )
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

As stated in the AM62x Technical Reference Manual (SPRUIV7B), the data
sampling edge needs to be configured in two distinct registers: one in the
TIDSS IP and another in the memory-mapped control register modules. Since
the latter is not within the same address range, a phandle to a syscon
device is used to access the regmap.

Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

---

Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index c0277fa36425ee1f966dccecf2b69a2d01794899..65ca7629a2e75437023bf58f8a1bddc24db5e3da 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -498,6 +498,7 @@ struct dispc_device {
 	const struct dispc_features *feat;
 
 	struct clk *fclk;
+	struct regmap *clk_ctrl;
 
 	bool is_enabled;
 
@@ -1267,6 +1268,11 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 		       FLD_VAL(mode->vdisplay - 1, 27, 16));
 
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 0, 0);
+
+	if (dispc->clk_ctrl) {
+		regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x100 : 0x000);
+		regmap_update_bits(dispc->clk_ctrl, 0, 0x200, rf ? 0x200 : 0x000);
+	}
 }
 
 void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
@@ -3012,6 +3018,14 @@ int dispc_init(struct tidss_device *tidss)
 
 	dispc_init_errata(dispc);
 
+	dispc->clk_ctrl = syscon_regmap_lookup_by_phandle_optional(tidss->dev->of_node,
+								   "ti,clk-ctrl");
+	if (IS_ERR(dispc->clk_ctrl)) {
+		r = dev_err_probe(dispc->dev, PTR_ERR(dispc->clk_ctrl),
+				  "DISPC: syscon_regmap_lookup_by_phandle failed.\n");
+		return r;
+	}
+
 	dispc->fourccs = devm_kcalloc(dev, ARRAY_SIZE(dispc_color_formats),
 				      sizeof(*dispc->fourccs), GFP_KERNEL);
 	if (!dispc->fourccs)

-- 
2.50.1


