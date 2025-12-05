Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C18D374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bsaeh+R85W3yqBXY0/3dvY5ZY1X6APknzRRJmY7imCA=; b=LUpMc/rrdZ1a2t0EHrRVLwqO4K
	9jB/yWjXOwZeq+bkNKzG1aAEk1xE+OHwOg8gwDgBqX4YkTsBvbBbXiuhPg1+NGfE6k7PXEoRCxnH6
	BGPmbKEg5HkfBBmc/LO5PnVIHKkmd+2u2xEriyqwNg8mKGPWLUBY8tNMGaS7en1Nc72hiLZd4jrXa
	5LEBUgm2w+N4eNsgFB2n7en9vLlPaoVPtVtS+BOkElTtjeiY9eugZqCXy6JcCR6entjzFFSe2V20W
	H2qVMwbk98KNn/DDJBt/pZNtNddx8KaWfNzowg46vf9Grqtkno/MF312gSmK/zAjhyO6V0Xnz+4yw
	Q+yjLGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqg-0000000A5RD-3hMr;
	Fri, 05 Dec 2025 22:00:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqf-0000000A5OZ-28SI;
	Fri, 05 Dec 2025 22:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Bsaeh+R85W3yqBXY0/3dvY5ZY1X6APknzRRJmY7imCA=; b=gVPFAFitucrsfMwuC88SaBaC5K
	lEZbb6hTwYbfgKyCYizCM8AF/uHrtgWhbzLgfyJw9SQTH0UsoFMZ4oY9Gq1Urh/KYtJ6OFB9cCYYZ
	pCWUIDJz5QZR9eiGhrFN2y2YR2k8D0jsfZrkW4r5ljQEHR0S58tRbOx5WWOPC32+pFHsKjlRNhmLJ
	q0gE6Ic90s0N6enpl/Yd6LOr7dXm4ERUQVCLxrNhY+FMvvcwyghZ/S9QWwXgo/Suj8GqN8Wg3GvG9
	AxVlO2bi9IqD87iVj5aO1GEd2wZR5xxtqYbD6flzxpQlrkKt2IUzBuvSMkmnuIDkkSDzktjIuOl1+
	Ve/EUaVg==;
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqa-00000006IYH-45f5;
	Fri, 05 Dec 2025 22:00:19 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 1BE7A3FD50;
	Fri,  5 Dec 2025 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1764972005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bsaeh+R85W3yqBXY0/3dvY5ZY1X6APknzRRJmY7imCA=;
	b=yJRRRkihclJuRSI/DLO1f3PO8oASBGmyaBC+rF5SUnfv3zT3xsbKyKAU+KRrSq5t7crTf+
	2Nx695LypGQojaYqtGjLjg/HcFW4QTJuJ1q8qn01KK8KLph2NxfimDi/actEOVldkm5z1Q
	N108qUsFeV8T4xwo6l+ef9z+zSDJVZA=
Received: from frank-u24.. (fttx-pool-157.180.225.155.bambit.de [157.180.225.155])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id E5F1F1226F1;
	Fri,  5 Dec 2025 22:00:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH] arm64: dts: mediatek: Apply mt8395-radxa DT overlay at build time
Date: Fri,  5 Dec 2025 22:59:38 +0100
Message-ID: <20251205215940.19287-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_220017_274692_29E4473F 
X-CRM114-Status: UNSURE (   8.36  )
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

From: "Rob Herring (Arm)" <robh@kernel.org>

It's a requirement that DT overlays be applied at build time in order to
validate them as overlays are not validated on their own.

Add missing target for mt8395-radxa hd panel overlay.

Fixes: 4c8ff61199a7 ("arm64: dts: mediatek: mt8395-radxa-nio-12l: Add Radxa 8 HD panel")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
This will show a warning [1] in upcoming 6.19.

Note that if it is desired that the combined .dtb is not installed, then
the combined .dtb should be added to 'dtb-' variable instead.
---
extracted missing part from [2] with updated commit title/description
after my bananapi series [3] to solve all warnings. Added Fixes-tag to
make sure it lands in 6.19.

[1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20251117211306.725678-1-robh@kernel.org/
[3] https://patchwork.kernel.org/project/linux-mediatek/cover/20251119175124.48947-1-linux@fw-web.de/
---
 arch/arm64/boot/dts/mediatek/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index cac8f4c6d76f..3f76d9ce9879 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -166,6 +166,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-grinn-genio-700-sbc.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtbo
+mt8395-radxa-nio-12l-8-hd-panel-dtbs := mt8395-radxa-nio-12l.dtb mt8395-radxa-nio-12l-8-hd-panel.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
 
 # Device tree overlays support
-- 
2.43.0


