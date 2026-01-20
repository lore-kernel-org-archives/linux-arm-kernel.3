Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6F5CA5FBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 17:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9iLuhBBaWFw/vFGauqBf+tR/cYKN7IjXcWrjMcj1kg=; b=a/cAMCLthOYbNhPCGOIrZx9WvZ
	8d8fGBrcdjWIGq5oxzPEV8VHSw6cBNHO/9bc2WGLQF/Qefa/YvU3ttrd4dshX2eYzRW+TtNEpq6XA
	FyuXJLpXJI/6j8gmZhNldhVnMTriIuYOO3Fk+OCkVPdZrpesJmA0/vm3sulhq4/bFVygZC01a2P+5
	RZAPfBJB9o+ZPNTdAD/eZ84RZmd6zncSrvwmZ8WA/2zimFv2yANGrcjB0+dZP9q7rSG86Wo3xaiwO
	1hbFncYwVLuq3Z/A/01cdTpwel/1istktyRFyM+zTvX1WXt3Xk7Fwe059LV9nV12i4MVeHvHknXKj
	BFReFfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFqN-00000004G0K-00Bo;
	Tue, 20 Jan 2026 17:48:43 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFqL-00000004FzI-10o1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 17:48:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4F55148AD87;
	Tue, 20 Jan 2026 18:48:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768931318; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=a9iLuhBBaWFw/vFGauqBf+tR/cYKN7IjXcWrjMcj1kg=;
	b=fNeDGe8mv6Rlfr8cFOjBCpX+6Qmj8jO2iHS0qT5DPCfu4kLq0d6MoX4LWa/qi7nti2x986
	l86EFkt6kwe9acw/UA0VDcYTZsAmnUy6AcOAxbKwC5x0FHU5eAMA0P36+DdjYJEn+B8QJv
	da9NlyO2unJsV0tgojRgayTkcmCf//0dLZq5VmZ3GIgFGoEX+opu745SyoyOA81DrHr68p
	vaZqnWRhiiKfCMsGAbq+0BzxZ8Uiix5UmKp6mVcCWoP4ZgDgjpYdOlRG4zqoTfQdPEGaaK
	UWxnIk4AYFJXctNntwVvB5Pde7e37dKAylQjq907GDl0GlIGnoOlVTaYyNMjTg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 18/19] ARM: dts: microchip: sam9x60_curiosity: Enable OTP Controller
Date: Tue, 20 Jan 2026 16:44:52 +0100
Message-ID: <20260120154502.1280938-12-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_094841_433535_0E8E19A3 
X-CRM114-Status: UNSURE (   9.03  )
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

Allows to access the OTP memory and Product UID now.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Reworded commit message after reordering patches
    
    v2:
    - same as in v1, no changes

 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
index b9ffd9e5faacc..c110a8e87568a 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
@@ -252,6 +252,10 @@ ethernet-phy@0 {
 	};
 };
 
+&otpc {
+	status = "okay";
+};
+
 &pinctrl {
 	adc {
 		pinctrl_adc_default: adc-default {
-- 
2.47.3


