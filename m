Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F09CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 23:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZ4jWWafjjXcwH05GnObD9olZZvV2Ky5W91cHEQ+Ek0=; b=EA/Kri15rTs9bi6I/6VkaXn3N+
	yWOj6uuIRS5r+fTIWJ6nsCdr2olgGEQMN2uBPN6CVZlCkq3bohakfgFzQj/Q3XaxTmhuZBJDFS4BV
	SACLJfkfvZZHMmZIdarnOmRAIKNrcQz9Dk983UEslD6l2GeomWzcPQNHax+jOyLeFJXLNj1eknyUT
	G1tb2Q523GpAFDXEtX0G1H+psQ/xun0sXGYl0P1xMwMThpo0NzhE160lWX4b0+ZoPG6bv/n0AtS9a
	hpLy4k1DxUMS/2Yctj2JTZUlRu60O4iW+vKm+fK3wn3taweOjaXTwOqLslclf2Mj8NXWWpYOmw1a1
	3kFlBHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyejs-00000009VLA-32I2;
	Tue, 16 Sep 2025 23:05:32 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyejq-00000009VK1-1mQq;
	Tue, 16 Sep 2025 23:05:31 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uyejn-000000005va-3sor;
	Tue, 16 Sep 2025 23:05:28 +0000
Date: Wed, 17 Sep 2025 00:05:25 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/4] arm64: dts: mediatek: mt7986a: add 'serial' cell to efuse
Message-ID: <689dad6ea05479b520100bd6ec92dfa7a541ec4d.1758063737.git.daniel@makrotopia.org>
References: <18af6977cc34de75e64279141dee69dcbc81c420.1758063737.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18af6977cc34de75e64279141dee69dcbc81c420.1758063737.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_160530_469403_F18F136B 
X-CRM114-Status: GOOD (  10.84  )
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

The efuse of the MediaTek MT7986 contains an 8-byte unique identifier.
Add a 'serial' cell covering those 8 bytes to the nvmem defininition of
the efuse to allow easy access from userspace, eg. to generate a
persistent random MAC address on boards like the BananaPi R3 which
doesn't have any factory-assigned addresses.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index a8972330a7b8..0823eb586ec6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -450,6 +450,10 @@ efuse: efuse@11d00000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			serial@140 {
+				reg = <0x140 0x8>;
+			};
+
 			thermal_calibration: calib@274 {
 				reg = <0x274 0xc>;
 			};
-- 
2.51.0

