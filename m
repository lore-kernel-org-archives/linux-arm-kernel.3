Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55D4C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 04:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TPvbENIkCjAlZ0ZdoWwlQuAVit2DLR0jTmE0sNCqPts=; b=2tWvEz0i4XQcLQfScDaBhx/geh
	MaiqVndYxxEQQ+Ko9VLsO6+G+/aWCobtTypW0K/WAYHiSvifDokBwiyE3KyB0WszKHwMIl07FbNDX
	6JvraBr3C21XxhQ/twQd3NCu7F16de8JYRnzwihxrlWn0gRyMoVoYl2k1WIhLOtjNevOC6VmmCqof
	rDCZV6OarBrTGlHxOgB7uMolzfzU1Yr3UmpfjMAHXBP26AQH+vLJJlKgGdgMMXAkwODoL3NGwbXS8
	e4o8YDyawJByc4hoqomyYewgVvh4G/wg6cCl+r0ydEAek0xP0dG1nwuGrgHVYKLMyzTO9rOvgJX5k
	iMwIsMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te5Hs-0000000BtDa-2Mgy;
	Sat, 01 Feb 2025 04:39:20 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te5GY-0000000Bt7d-3XVh;
	Sat, 01 Feb 2025 04:37:59 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1te5GP-0000000076H-0inf;
	Sat, 01 Feb 2025 04:37:49 +0000
Date: Sat, 1 Feb 2025 04:37:43 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND] arm64: dts: mediatek: mt7622: readd syscon to pciesys
 node
Message-ID: <98bc223d174c7f544e8f6c4f0caa8fa144f2f4dc.1738384400.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_203758_888853_3FFCABF3 
X-CRM114-Status: GOOD (  11.93  )
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

From: Christian Marangi <ansuelsmth@gmail.com>

The sata node references the pciesys with the property
mediatek,phy-mode and that is used as a syscon to access the pciesys
registers.

Readd the syscon compatible to pciesys node to restore correct
functionality of the SATA interface.

Cc: stable@vger.kernel.org
Co-developed-by: Frank Wunderlich <frank-w@public-files.de>
Fixes: 3ba5a6159434 ("arm64: dts: mediatek: mt7622: fix clock controllers")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Note that the dt-bindings part of the original series has already been
applied with commit 9f7809c6a882 ("dt-bindings: clock: mediatek: add
syscon compatible for mt7622 pciesys").

 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index e3421fd2c0ef..0710b8959ae8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -790,7 +790,7 @@ u2port1: usb-phy@1a0c5000 {
 	};
 
 	pciesys: clock-controller@1a100800 {
-		compatible = "mediatek,mt7622-pciesys";
+		compatible = "mediatek,mt7622-pciesys", "syscon";
 		reg = <0 0x1a100800 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
-- 
2.48.1


