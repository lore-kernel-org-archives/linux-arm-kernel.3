Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCB4C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 10:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZCakf6JGwbqvm2h6HRTdGxaUvs22cY3XdBlUVVd06E=; b=Z4OyhutD198WRdnSgFtTaqlLFV
	ev88T4Vo/55yXPulYvv0YsLHN0X3chOvovGTd7ZZyPUKncFdC5CJ8DzRA6i1fq5lHcHlsPhw5wn7o
	F7mBDXr1CcsyFGu6Qilp8ic3fHDx/HSoj8oRVutPajafqJVVoua7AsVJVdRoBL0DhiJGOuoPpL9SU
	QFtJmC1EFB35GIuUFSKXpTh+bbkaVpaWMJRcaXFCxQVP3X3v/e5KTPTaK78Z25GVJnxfKimD1zn6O
	0kEmTq0DvmOS0BeDF/YN+fEesIrSC9bvQ/hei4Z9DI2yzmFk5NPZDLeNCsA+GScsr3CL1r7MNBG2K
	ysKFEYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKZ8-0000000Dnaw-0rgz;
	Sat, 01 Mar 2025 10:59:30 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKOv-0000000Dmfv-40k4;
	Sat, 01 Mar 2025 10:48:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6472025F03;
	Sat,  1 Mar 2025 11:48:56 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwfR_2k6Scbh; Sat,  1 Mar 2025 11:48:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740826135; bh=oH6NiGwxSjELVuqZw+4pyix8JS63OndzJmq8Erv5Xlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jRXEa/KYzSTYx6difv4h7k7TYQziMtP99ob/mIgs3ma1mfrJ7aSoypYDqA+ilUxxZ
	 2il0efJ4ux/87uqcqlb2WXSXx1uIdIz9znZYAsQahMh8hU1hSgNskNs79oznvgmMjG
	 md3sBfksXF8cX5pUiapK8RGREeIX7IsfAUJOkojtLBQyYW9HIQzhydTPdnZraW+azD
	 8j6/PM7ezUFXx61dDHExCsZqk21VCsx7hUXTFMi6hA0up1Nz/Vh8ygfVZn5ZXwGhjz
	 fVbSynlyzYu12pMgt8+0c5tiX+YgHTNW6LjZqNa2Gn/t+D3TjOVkPIj2hG3u3NyVtq
	 V+Q0uQDWRohBQ==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 8/8] arm64: dts: rockchip: Enable SD-card interface on Radxa E20C
Date: Sat,  1 Mar 2025 10:48:35 +0000
Message-ID: <20250301104835.36439-1-ziyao@disroot.org>
In-Reply-To: <20250301104250.36295-1-ziyao@disroot.org>
References: <20250301104250.36295-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_024858_124354_23A9D968 
X-CRM114-Status: UNSURE (   8.93  )
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

SD-card is available on Radxa E20C board.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index d2cdb63d4a9d..473065aa4228 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -12,6 +12,10 @@ / {
 	model = "Radxa E20C";
 	compatible = "radxa,e20c", "rockchip,rk3528";
 
+	aliases {
+		mmc0 = &sdmmc;
+	};
+
 	chosen {
 		stdout-path = "serial0:1500000n8";
 	};
@@ -20,3 +24,13 @@ chosen {
 &uart0 {
 	status = "okay";
 };
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	rockchip,default-sample-phase = <90>;
+	sd-uhs-sdr104;
+	status = "okay";
+};
-- 
2.48.1


