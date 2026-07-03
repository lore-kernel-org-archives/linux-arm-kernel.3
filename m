Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A2BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIWHnFcEQq2TBgkIFQBCpLfgyHT2aySOS2MIMPq9LZ0=; b=oNSfcVSiZwjQ7ju0x7cbQ3RQaP
	g4Za5Q4u2sbZsHql3vuTeitbmPDNzQIQFQN23sRXhbzYSFTeneOAZkmWU+sQcNe0LG6P4xppkpkBw
	cdlzH5qi2ciY8WaBI6ESsu6n2TsheZ0mrhlTEC/jRXEaKs8MhL5wV0iUzEKQ8LN2BjlWzxoccrwla
	EhgWQdlQ0rSvGIKjToJlRleUKqQasC2C+LqFZucm0+Y0fRMGR2sB23IEPlbpQ1v5lWoYMrjEEwhBe
	C2LrzNEIJbVo18gOFqY+vO1uO4OAl+v8BSOyPRvXNdw8kdAqp7VzBTfmrrYYTHKlHQ/RWEwyfYP0f
	M0oKSn2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVY-00000006s1w-0rh5;
	Fri, 03 Jul 2026 11:56:36 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVV-00000006rxY-1TLK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so476595a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079792; x=1783684592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIWHnFcEQq2TBgkIFQBCpLfgyHT2aySOS2MIMPq9LZ0=;
        b=aVkMcdQ1NYm9Ak71RhP/9Dccr2DhRPlXfDCzxuhMwM5Co+g2MNQtkbaotJZGvga/bK
         yAIoFRTOS1zYZZhichq6XVI5RmQ0/5/oAALCOAG2NeKc2wozPfCAouBEZjVYXiyiBLb+
         my/NiZQ2A0rbV0d1THHGczmXjb7R6mJxnQKts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079792; x=1783684592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIWHnFcEQq2TBgkIFQBCpLfgyHT2aySOS2MIMPq9LZ0=;
        b=hXLlPE11LB8CpdSQVEyG/LcKGbEkZVOOPZeP/Ktu6d4U3sTFR6Iuj81m2d4JViFzD3
         YgCBdKKRuQwbd0pJSEUvIVuyvQP+FReZhFN0I5IKAZPZMxl0tZ9AyAl3Ve0OS+qnkJnA
         mV7jEIPV2hIRV1/JmZYLl2MOGOuo3AWyNdUoqZUU+dvpfWeBo7iDeA6gYlGB5GU0OxAo
         DdTG2xF5Q6OpZennf6juEs28cjVoJ5MuFUGWqSidYHgjY+f0swcKwH85ZXeOi2ymANCL
         FBtFZPnmCeOgENKxNNFnCho9MTyR3odJca0HR5bGoCN6WrzN71FEioojpoREDPFqpwcF
         5oNA==
X-Forwarded-Encrypted: i=1; AFNElJ+LhchBYdqqh9u4R0zpImGnj1n0ktnWj/9n3G204ImVSYwxaYzf3/kHQeS63UzTIJ04UGU5vhqn0QXBEdKAcYtH@lists.infradead.org
X-Gm-Message-State: AOJu0YwBp/m7GAGXSVvZt/DiTWfBOfRF3HIDODf/hGcze9T3pBh9QDFB
	daUezF9v8tRwPcpfyyFhDq15sIvdtDDdiUIw0jJEDJ0vCkwFNN0c14neo4WAbXGHzA==
X-Gm-Gg: AfdE7clCT6tw2C6pqXxYWLkqcc1IEmfnDNn6IkjsQWgIkCtcZ/VJ45gebrXmweLJNlH
	RZhsSd75EnvDB5OsekIbn7Qd/pEmYr3T5U716GLR5VH5vIjCYWMLQJ1B4AbbXq557woZMLJA90q
	XQhLYpNBsIZf70u0+35yjfbM0qSMWZBlMkqfTpkfd95TCRsTK80t7rmFAG/ZJ46sVgZgWjkwI9j
	6A3LZQgr99C5rPtUyvT9k/nRGSfG/aQjy4ia3q1xP1jiwt9hIpcgDXub1z2i3LN7md9en9y1bhW
	NF3HOJjfSWn4EcI8UktjF3UUfd4k1OawPu/L/JgPxS2ZAFZh/E7AOBM/csA474KNUwEeiWKXhXH
	8TWp8JfD69KDlg1hIPrpLdgQGlVuwkgZ5hcAQ+hjXnKzdHMofq7rzYIlo2zZ1FsUfeJg2G70fPZ
	5B/lZAEo/AyZN64b03tbhFmkqPUE17iU+uyN8hO0RDoU0MC6cN0xkH4ciU2t0PMvgLrE6/+g==
X-Received: by 2002:a05:6a20:2d14:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3bfed1bf5c0mr13230564637.15.1783079791119;
        Fri, 03 Jul 2026 04:56:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Fri,  3 Jul 2026 19:55:59 +0800
Message-ID: <20260703115601.1323491-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045633_390975_2913B8E8 
X-CRM114-Status: GOOD (  17.56  )
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power up, with
opportunistic skipping of the delay when the regulator was originally
on. The I2C HID driver gained similar opportunistic delay skipping.
So has the I2C OF component prober library.

Now fix the device tree to have the regulator not be always on, and
let the I2C HID device have the correct post-power-on delay time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 +-------
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1004eb8ea52c..b9e311fcd9a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -62,13 +62,7 @@ trackpad2: trackpad@2c {
 		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		/*
-		 * The trackpad needs a post-power-on delay of 100ms,
-		 * but at time of writing, the power supply for it on
-		 * this board is always on. The delay is therefore not
-		 * added to avoid impacting the readiness of the
-		 * trackpad.
-		 */
+		post-power-on-delay-ms = <100>;
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 		status = "fail-needs-probe";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..6b9f47f515c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1093,7 +1093,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.55.0.rc0.799.gd6f94ed593-goog


