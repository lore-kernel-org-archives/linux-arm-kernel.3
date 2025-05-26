Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B06C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JafaCAGJGUzONesEsTwK7Fp4cbryqbnxv96ud7slC/o=; b=gaPnG48QjoQMX8Li4oEyxFHqJA
	KlaUW+xyguTcsDN9IY1i2vXatRK6U02Pxl8/q2+mxkIq1o/ICqna60bfmCkjaAQAoy8kAdOBZQWh8
	EdeVjoPpWDQg8PBLzYNHmv/iAPWJflLd9ZLfMvc6Amj3HhXxJ5wW8Kw27KT6bDGBvmcVuzpal7hup
	ExUyJD9XMwo7i61HGr8CGNRglZFgx00R4Xkl0vgUGkWOPNh0hGkYOnfkePGhxKpEqeIaF0Sx/73/4
	M1TMk+Bvs2yIkzgF+d7Apj8k1z6P4GmpismTal0x3zrnmO8lpgKZg3PajhsIwdcrjPOFgNvkeYJhJ
	F2FAvY5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaWP-00000009DQf-0YDM;
	Mon, 26 May 2025 16:17:53 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaUF-00000009DBf-0WXx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 16:15:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1748276116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JafaCAGJGUzONesEsTwK7Fp4cbryqbnxv96ud7slC/o=;
	b=EaOgnIe2JbKBWXb5SWzSwqUTKqR+L7PNAjxIqpGlvjgLDlj1hbA82saH6+gN5BHl8vxVHk
	rUFh/sJ9pdxYXskigNRqSi1k4727NOLgFWp6QkuVLkn8AKOIq6MRUf+t8I3ZheJKrLeOQh
	852T8FRJzmP4VsY2PMGScf1V1HSO8obJzvFlflc3QzZUekB2jKjSrzWD58LEObJ1HEimlS
	OouE/t5t7CZwR/mESHouvXUoF3zRMXaT5QrwbZqpomC4xbTqB7QT6+lt6yoNwncQWUeE3V
	GuaUGnpp/b8C78+IrXOA2C/4bPfub3KWCC8IQZLNqLibLt90ew0y7C08B2J4Mw==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	Marek Kraus <gamiee@pine64.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	hrdl <git@hrdl.eu>,
	phantomas <phantomas@phantomas.xyz>
Subject: [PATCH] arm64: dts: rockchip: Fix cover detection on PineNote
Date: Mon, 26 May 2025 18:14:47 +0200
Message-ID: <20250526161506.139028-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_091539_311012_5F96B3C0 
X-CRM114-Status: GOOD (  10.01  )
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

The SW_MACHINE_COVER switch event was added to input event codes to
detect the removal of the back cover of the N900.
But on the PineNote its purpose is to detect when the front cover gets
closed, just like when a laptop lid is closed. Therefore SW_LID is the
appropriate linux code and not SW_MACHINE_COVER.

Reported-by: hrdl <git@hrdl.eu>
Helped-by: phantomas <phantomas@phantomas.xyz>
Link: https://lore.kernel.org/r/270f27c9-afd6-171d-7dce-fe1d71dd8f9a@wizzup.org/
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
index 3613661417b2..5c6f8cc401c9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
@@ -55,7 +55,7 @@ switch-cover {
 			label = "cover";
 			gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
-			linux,code = <SW_MACHINE_COVER>;
+			linux,code = <SW_LID>;
 			linux,can-disable;
 			wakeup-event-action = <EV_ACT_DEASSERTED>;
 			wakeup-source;
-- 
2.49.0


