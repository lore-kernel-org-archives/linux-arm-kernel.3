Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2D0CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0Kp4ncgXY6sTHdsDfmoXcWbE0QEKFtuM3FlNwmz7Co=; b=uVZMJi+z3SjMjxAMda/P2p/W7U
	aCEMQaY9p7yulcuykU0HsgWdFHJPob2jiEAm+sKxJGVTRfog2QUiIleGbxMednQ7GKg0/VJ+t582u
	vEOV3A1//oMgPaS5LFevV4WJS2Qj6uV4Q0EfeWN2o4Tg/qUp+Np+WHQfy0WfWiaE8xNlzFV0/uA1M
	oVHJiPdMHFZc2LyAzbX8nkyk2IWAC9cBnTCQvzZXIzAByq7/yzHl5k0JKLtdrc6hz0bw9CDx3rVA6
	qE2jnGMCtF6oRrpPUsRlhJlZrvslbJ/uj361jM8aFIWBnHqR+3TyQzGbrvtAbKZS1maJz+yonwvdk
	pZwIAofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcku-0000000Eg6t-12XH;
	Sun, 16 Nov 2025 13:25:24 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKckq-0000000Eg5g-3TSw;
	Sun, 16 Nov 2025 13:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a0Kp4ncgXY6sTHdsDfmoXcWbE0QEKFtuM3FlNwmz7Co=; b=mCCupmGR4VACIb7XFnHo7lDTli
	7a1k/F0U567Jgitn/50ki7a1O+tAXg/ZMeViwhaCBOf7GUtu9dgE+3saKm+Da4IeVkM21p8CWkbsC
	HW+AWw9Vt6+FxE82sqx+1LyrGdGBL4qYTg5vr6cS1YPIP/Gtt3DQVAalOcnAYHrgl9wXwWqtRwkPk
	GssLovcKS8EDnS6fUAZttOUhaTi+dZfEQQ4SNc23eTmNImuoX+7SJAgJsUS3H3AMP/PK3QpnVvrbc
	4zgyPVvZKvX5pFH2CZzgGER4ZBF4wLCu4s2aGieKTjLiMldRqZbkDNptd1Hwejg2VhXsgiel7OnzM
	cyrbON+Q==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKckl-0000000FWTF-31Nh;
	Sun, 16 Nov 2025 14:25:15 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v2 6/6] riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
Date: Sun, 16 Nov 2025 14:25:03 +0100
Message-Id: <20251116132503.441015-2-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116132503.441015-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116132503.441015-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_052521_013580_2B1E4A86 
X-CRM114-Status: UNSURE (   8.16  )
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

Add LVDS pins to the PIO since it's now supported on D1s/T113.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 78aa61607..c4ce809be 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -108,6 +108,15 @@ i2s1_dout0_pin: i2s1-dout0-pin {
 				function = "i2s1_dout";
 			};
 
+			/omit-if-no-ref/
+			lcd_lvds0_pins: lcd-lvds0-pins {
+				pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
+				       "PD6", "PD7", "PD8", "PD9";
+				function = "lvds0";
+				drive-strength = <30>;
+				bias-disable;
+			};
+
 			/omit-if-no-ref/
 			lcd_rgb666_pins: lcd-rgb666-pins {
 				pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
-- 
2.25.1


