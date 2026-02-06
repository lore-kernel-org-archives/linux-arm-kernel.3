Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC3FEE2084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T3qmREDUK/hg3y1Aloren8RJ9Uvld3RN9ufvh+a0UZQ=; b=U45UAIwg3dlawV
	12iNWZtWxo7x+b9HrbadisXoy/cKdG/0NSOA86BLA0a/qRZbJpcvuXrgcB19AGwXlCXHLikMUKfNo
	dnzll05JstcAM/ruVElSDNP/a3V4lcOnQ48bQ17/i/7S9JARcaNgj3esvDgfAbIZ0h6P5NQ8s16wL
	Ipyj4qnTi4QNTL8i52LLS1XzouGh29/IpIrOEB1BfcpEekqoMojy8EWTNtxm7x4YIDF3xmJaSTEKY
	vfy+VPNl4IevTdrOz4BVQ1xOWuzS4/vnypyS08BVLWvr4IxXbuIgcW82wjdDk0Ro/RpEd227bsK8z
	+N/WKTehlI18N8BX6z0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIxs-0000000BAfG-1ULM;
	Fri, 06 Feb 2026 10:21:28 +0000
Received: from ahti.lucaweiss.eu ([128.199.32.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIxp-0000000BAeN-0wrM;
	Fri, 06 Feb 2026 10:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1770373253; bh=R6d6LOYx1acrZEfT768rwpy3DqJ5O4GGUCRhdfOAiOs=;
	h=From:Subject:Date:To:Cc;
	b=c9xEOKQ/su2/QSb8Z4jYID+ZTdPzW74lDLaWIT/7ZSAI9HcA6ZtBtv6a+Vb0AAhMi
	 Z7XcvChmWFJQTpLFvydDN21rBPSqWOCwPkfJtn28eohMzJmJYU8ab8ws5GZFa2R1r1
	 KvFpNCOJlwwg/yKBEV4wwfX/ru9b0PGT05czLSNI=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/2] Fix syscfg-pctl compatible for MT8516
Date: Fri, 06 Feb 2026 11:20:47 +0100
Message-Id: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqAIBAAfyX2nKCCi/Qr0aHHZnvIwo0opH9PP
 A1zmMkglJgEuiZDopuFj1jEtA3M2xgDKV6Kg9UWtdWo9ss7g0pemddQcUSF5BYz6RE9WSjpmWj
 lp2774ft+maRIpmYAAAA=
X-Change-ID: 20260206-mt8516-syscfg-syscon-6e5d1b0a68e2
To: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 phone-devel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=614; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=R6d6LOYx1acrZEfT768rwpy3DqJ5O4GGUCRhdfOAiOs=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBphcCCle6WQVY8NfJ/FMmSJUdEibM9IZeseQXgt
 WZADv8RTTqJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaYXAggAKCRBy2EO4nU3X
 Vs+eD/9LBSIv48EKjvhOdZoTFAt94zO89FZiJosZwfat8w8XNmaWa66EC2YdT4YjRiYeXn40Q6e
 D+h+Yo/szBLSwT4vWDU382eTBV8HhAoExnDPnH6hsIqgkfETc4B4kdefOkMXlGht8+jvNZOSb71
 dFxKEKNruMiWnvn4KAe5mDso9V0PZf5Dau2lzyIsUKKBHmft3RgXoJxCj78TK66vPF746VJIPub
 rmZgWZrhbPGsfve91HoWnXUUKd3JMENpNfQ2l+e1jLm6Cy2niFYAAoHKeiKsjkvnicqRCQK6yIu
 gHs89P2adwGFyjKZMBx1hg9AJfPliBNMfaYOP7E99FXSBdMMSR/LljV39hAtSmLZY0G2A4ETLym
 uE61xzKqL2IhlSWLicVqk/as5WNCGEmed2W+8AN755ABnswylamh8Jwwj+pr3g6GyWWmmAX+N1v
 3as7Gid5JHwaVBjtkYs7xBwNJacLuXS2H85EaVcDXz5svfvhSy08D17QFcH9nL33jq6Nt5tOx+E
 WbNoj7kI1qIUepNGqIWfAU6lAVelA3I+uSn0htfkE2Jktu0Z5Y/GQxuP9Y1jF6QQMQZFUThql28
 ywK4WMHLtrcjDGnfY6h2mUTb7Ejx4IULWOx1JS+UHQZz7tUOh73WSzmwcuPLIkMVrswzpPkaqk+
 B1Dp6RguibkHjaA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_022125_406759_8BC8D79F 
X-CRM114-Status: UNSURE (   7.31  )
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

Address a dtbs_check warning on MT8516 by introducing a new compatible
for the syscon.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Luca Weiss (2):
      dt-bindings: mfd: syscon: Add mt8516-syscfg
      arm64: dts: mediatek: mt8516: fix syscfg-pctl compatible

 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 arch/arm64/boot/dts/mediatek/mt8516.dtsi          | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260206-mt8516-syscfg-syscon-6e5d1b0a68e2

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


