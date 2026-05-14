Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A541FCD4F42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcd1JbPtrEgwdOAeh0HthnUl2Zq4Rk56InIYU9qFrKI=; b=0kotQNVGx/2LuBgZ2kjb0D6PNw
	5/0PcWQ/JpXK2waY5DyOmqQXBjMIx1dVXBL20Zxx0OascX5ruxTQtNf+gDl/GRlES9zlmBvRMERZr
	5uALzZ775VW60hWY5dFHfLWjw1bINBubbT3OEdik2gG+Us0tfWAzcIA+ouiuruNhq4z2BLdoFf3mg
	c6B2QCLaKvlbt7I9bKiDmGLUpzX97A8kpKhzfSXO3LpggW5q/EFOrWVdtnSPmcxvQ7sc+FyMXTHU5
	27OQeodAjmqVfBWm99RU6sNPalUYUGr7j2ZcGT7dqUsyd9uJSmZSHwpjTdVwUzcPRCoNAHTwhycGq
	rzInfcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXht-00000005qf0-09Xb;
	Thu, 14 May 2026 15:10:37 +0000
Received: from smtp1.tecnico.ulisboa.pt ([2001:690:2100:1::15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhl-00000005qVF-0gXZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:10:31 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id AF71760020C9;
	Thu, 14 May 2026 15:47:31 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id OinNfQWH81a8; Thu, 14 May 2026 15:47:29 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id A955060020D6;
	Thu, 14 May 2026 15:47:29 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1778770049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zcd1JbPtrEgwdOAeh0HthnUl2Zq4Rk56InIYU9qFrKI=;
	b=efsLmlWdYYNiU5dA0Dot0WXBUlxQX7fnGCJX1BPRVzeCxzDCPaal+fsDSvYvjyuq8DTU2I
	iGciiVW/QoqWxmBIIjMujMUemOWvs6xnKrRaBe1wIn+U1LvaSuG2pzcc26ozW8tTIchpVP
	F4zaFcGR6NBGYEeBthuy+uJblWiVzJ5OKendEPZUS5p73YUkQHPo2iDdJtKNBX/Kk14Du3
	ql62isxTd0a6jMrLpG4vi77nTIUTcI9AU7UQjpINp8cqFKejJ+uyztiF6N3zeoLq3iTDpO
	GY2Qkd0deq81AjpmivAQRP35pUDR4B4AyfcbBh+0m2W9BDhC2V4xz1OpqNjnig==
Received: from [192.168.1.94] (2a02-842a-00d7-bd01-2527-ff0d-f555-b6e4.rev.sfr.net [IPv6:2a02:842a:d7:bd01:2527:ff0d:f555:b6e4])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 16B61360249;
	Thu, 14 May 2026 15:47:29 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 14 May 2026 16:47:22 +0200
Subject: [PATCH 4/4] arm64: tegra: smaug: mark MAX77620 as system power
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-smaug-poweroff-v1-4-30f9a4688966@tecnico.ulisboa.pt>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
In-Reply-To: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778770045; l=857;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=8xZjmEb0d95N1+sb8980A/vPSc/pHkMH8Oys2etbVAM=;
 b=fAg7sGCuUVA0iqnWf++Tln0G9BLmwunVozYRTTAPsp51y1pPfrbVXJeU21dWwC8wa8i8qLzU1
 RSAjLik/GjCBtFgrjC/UcDxwZVxEQlg6mU1osM6V+Jtt3GBIBV27s9a
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_081029_359214_08C91D47 
X-CRM114-Status: UNSURE (   9.72  )
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

Register the MAX77620 PMIC as the system power controller on
Pixel C so the driver can install its sys-off handler.

This allows the PMIC poweroff sequence to override the non-working
PSCI SYSTEM_OFF implementation on this platform.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index f0b8c2c80aa5..1791b47f0a73 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1467,6 +1467,8 @@ pmic: pmic@3c {
 			gpio-controller;
 			#gpio-cells = <2>;
 
+			system-power-controller;
+
 			pinctrl-names = "default";
 			pinctrl-0 = <&max77620_default>;
 

-- 
2.54.0


