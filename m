Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D540ACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a503ZvQbaOcbrGVP+C0Du3gnG7TeATUmwBd+VIhzDak=; b=YPcod/yHeYUM06x65VzriU7ojK
	0dKvLdicMdg6nJJbogU5bOiZtqSNSaZYf3iGDjYJWkH/P9l6AetOVrxDjlrah70yzUZUm9rxVV5sE
	CqqN4Q7EWykZG8jKlt9xVqYi+GWhj1qOwURkubf+5/zXt0Tz80Durp7wab5apSeeOc7xkcCDxLMNW
	YF/6COws1oNEU4avUE1Veaf7apwFPs8VbOdeB8Vv/W8tWVg1MaS/4nyYupLYkRwaDhj9mU/kL9SCR
	guiltMYLLutEF7nwnCPm6nZ0GrNHbSJEDeKlu+yi7IXjZAyvhK23CQzh5Fgf3Wkvq32bw6++36M8F
	LzY/1qqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhe-00000004Oto-2K35;
	Tue, 29 Sep 2026 19:41:26 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhV-00000004Oov-3wpl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:41:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F6C2106CF2;
	Tue, 29 Sep 2026 21:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790710871; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=a503ZvQbaOcbrGVP+C0Du3gnG7TeATUmwBd+VIhzDak=;
	b=Jh4VjVqKLZq+ZPiq0ostQQww0AuXnY/J0US3guNqQ2cjxK9tIaPpDymbpOOKeu+GkPi+qT
	f4K+jij31eLLcFdbzYa8+3YfeQsXV50fnqLKPY3WUrOfk1LX06/rNCEW7Ga7FeKW1E9J0y
	EM8waL4jrQ14ZPl9dGagBAhVc3+q5lyAVybvZ2vslnBbTXVpHIK0n9T9FVyFyXGjKhqoFG
	/qKiQfV52sNfJYGc/vlbTfIsnZGLZZ/NXsog7ACH+H4iDd0RFqKsqvuIXpLnUxXJY9tHsd
	c0eiRcFw626Za0WjaejprLVm9bjVJ1E+uppvBR81ZaZb/0Ur2dlXBqbujWt+mQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 5/5] arm64: dts: st: Do not encode path in sdmmc2_*_pins_a/pins2 phandle
Date: Tue, 29 Sep 2026 21:39:59 +0200
Message-ID: <20260929194035.496244-5-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929194035.496244-1-marex@nabladev.com>
References: <20260929194035.496244-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_124118_133221_5F91A11A 
X-CRM114-Status: UNSURE (   9.67  )
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

Do not encode node path in phandles, describe subnodes instead.
This is only a consistency change, no functional change.

Fixes: 9b584c92f94f ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
index 80d829c55d9d8..bcf63e2ea9898 100644
--- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
@@ -389,14 +389,18 @@ &scmi_vddio4 {
 	regulator-always-on;
 };
 
-&{sdmmc2_b4_pins_a/pins2} {
-	/delete-property/ bias-disable;
-	bias-pull-up;
+&sdmmc2_b4_pins_a {
+	pins2 {
+		/delete-property/ bias-disable;
+		bias-pull-up;
+	};
 };
 
-&{sdmmc2_b4_od_pins_a/pins2} {
-	/delete-property/ bias-disable;
-	bias-pull-up;
+&sdmmc2_b4_od_pins_a {
+	pins2 {
+		/delete-property/ bias-disable;
+		bias-pull-up;
+	};
 };
 
 &sdmmc2 {
-- 
2.53.0


