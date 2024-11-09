Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE92CD5E373
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYoftX9MYsgzzu/6rGSN6nv7vYU7xKCcdFz3gJAEJiU=; b=1OoJlCKVWajsdegO7J82njCEpf
	M7EN7PAxJgjSgGk1a0D8aoqQd51E+hVUeTxHE4imKPHzoNtjbZjFm2+sb127o0WSt315BNQL+BA9e
	dxh/LuFKkw4tT26bqyQSJZGcbr5RuTsczetDMJm08M/bPfKOmHr2IysHK61e6lc+hOEsGOu7LUDRA
	gdqPvfSec8Mnw5tSPbHd0UFEFMfK3WvauDxMtIOZv1fp9Mg3pXiSUr2W3YPoiO75i/wdNhZfazh9A
	de4Heh14XYTNlvCDfv9qaKO05fukPhP94V/cMvvra8VezjBkHy/NsLP/f2lcjdDvWQEab1pOFs2CY
	t6vAQmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nJ4-0000000DYJP-2Vrq;
	Sat, 09 Nov 2024 15:23:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nDv-0000000DXeS-3B3F;
	Sat, 09 Nov 2024 15:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731165482;
	bh=VbPbfj2ctRAP7owi1u+FSVqiTAv43zAlTWjFAzykWdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AQuz4r6DCtf2noiphodcPsyMjNhCWHzC7OFaf3i0doW0h5QhpRcI6cL+Y2nx4lWqs
	 Rvn14k7+Lw5R0yVAYo2ZGZ1QDIMwMZLxboBq7jtDCazRoUia85r/A1pm7T8tD+9uZ4
	 /TCm9A4U26ctmSavimZ3TiEJ6rQLzfYZaBUtuR/CzSwG+NK6pMM0ZpHwcCXWcD5Hb6
	 Tni2tec56rPYJSooYXTXc70jIAHKDXkeuAcLJEI4j/c92ztlQCIyR6kC4fH6OCkj6k
	 gRbHHB+SGjVHxONCkO/rPiLLU6PkVD8mx5OzbKAMiVXIpEfgA66ZpRRBPIek4VQYXb
	 Mp0cki2sj0JTA==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B06E717E36C6;
	Sat,  9 Nov 2024 16:17:59 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sat, 09 Nov 2024 10:16:33 -0500
Subject: [PATCH v2 2/2] arm64: dts: mediatek: Set mediatek,mac-wol on DWMAC
 node for all boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241109-mediatek-mac-wol-noninverted-v2-2-0e264e213878@collabora.com>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
In-Reply-To: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_071803_963128_3F1BEE9D 
X-CRM114-Status: UNSURE (   9.61  )
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

Due to the mediatek,mac-wol property previously being handled backwards
by the dwmac-mediatek driver, its use in the DTs seems to have been
inconsistent.

Now that the driver has been fixed, correct this description. All the
currently upstream boards support MAC WOL, so add the mediatek,mac-wol
property to the missing ones.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts                   | 1 +
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts                  | 1 +
 arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
index c84c47c1352fba49d219fb8ace17a74953927fdc..0449686bd06ba17c5798aafdfb3fa071fca7e2f2 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
@@ -115,6 +115,7 @@ &eth {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth_default>;
 	pinctrl-1 = <&eth_sleep>;
+	mediatek,mac-wol;
 	status = "okay";
 
 	mdio {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 31d424b8fc7cedef65489392eb279b7fd2194a4a..c12684e8c449b2d7b3b3a79086925bfe5ae0d8f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -109,6 +109,7 @@ &eth {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth_default_pins>;
 	pinctrl-1 = <&eth_sleep_pins>;
+	mediatek,mac-wol;
 	status = "okay";
 
 	mdio {
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
index e2e75b8ff91880711c82f783c7ccbef4128b7ab4..4985b65925a9ed10ad44a6e58b9657a9dd48751f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
@@ -271,6 +271,7 @@ &eth {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth_default_pins>;
 	pinctrl-1 = <&eth_sleep_pins>;
+	mediatek,mac-wol;
 	status = "okay";
 
 	mdio {

-- 
2.47.0


