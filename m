Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A8CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 00:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YP5w1TR+MGgkl02qn/UbwcANepbuHsH+to8TLiuTSp4=; b=ceajpzKP1WD+xNXuDiIXwuUxrQ
	FXOjKEczV6LMI+Pp5IZgbq2piXlXwV48fKcVbaV3V1ZR0waXQH16/7U5UvM9WNhN21lAKhbsdgHAB
	4RrvCXJJGZW2DdukYF/qi6OQqANBOsNJ2ruWL+8lOcZQy1tgk5T7qDMIIGGRnXEkypJEGFgqa3FZP
	E1x8sqBRHQUkUCEQupizp9+mdTQK9qZDLAwzpTLCj+xK4LXKXs5gf2Qi3cUaPQrIKfqb4//rK2z5e
	DTukXS/tV+QhRjnE0266nyGTvCWF24NZ5SryFneOHq8mc/y9eQK1dAgdquVHUjq/l5n2mHaSBlyMd
	jxYKCFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv2gH-00000003LoH-1oKC;
	Sat, 15 Aug 2026 00:55:25 +0000
Received: from lab.riabenko.com ([185.143.146.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv2gE-00000003Lnq-2nhz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 00:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=riabenko.com; s=selector; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YP5w1TR+MGgkl02qn/UbwcANepbuHsH+to8TLiuTSp4=; b=WRugtcH3kXqgQsyTCbhPlTXgTw
	vy6nCgC1LcOrJpc8huuWJ4ucGyx5oiywy41amkJI92D+X0O9+A57+x+JViCd2yLNPF/d7nLJz1OS3
	a3RjgwZ31Rgn0zOu/RiTNp6QEq/bJbXhi7uaIgE+iAq0fuUvlrS0fdLKOGnwer3Iq697JftTuMvnp
	dGVdKr0W5uqaOb0vsAXSYrJSgGA3Ma6ABqRpA9L5f6cfZseL7A6ekVOOaRGOyBZveJFacDN9egZtX
	5OVRCa+QdHpJCEc2xuUM20Z0HLRm3Yj1i6ksy+b3uoVBNd1tLetb0+BwZxzRiGo+viXOfOH2jvVbi
	A7WCDFhg==;
Received: from librecmc.lan ([192.168.10.1] helo=desk.lan)
	by mini.riabenko.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <roman@riabenko.com>)
	id 0005MW-000000004B7-1ITa;
	Sat, 15 Aug 2026 03:55:07 +0300
From: Roman Riabenko <roman@riabenko.com>
To: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Roman Riabenko <roman@riabenko.com>
Subject: [PATCH] arm64: dts: allwinner: sun50i-a64-olinuxino: Add RX delay
Date: Sat, 15 Aug 2026 03:53:16 +0300
Message-ID: <20260815005316.28998-1-roman@riabenko.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_175522_699845_61CE6C35 
X-CRM114-Status: UNSURE (   8.28  )
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

The Ethernet on Olimex A64-OlinuXino computers requires an RX delay
greater than 0. If the value is not set or is 0, packet loss in the
downlink direction is severe enough to interfere with downloads and
disrupt software installation.

The range of acceptable values is wide. The vendor has been applying
200 ps in its downstream DTs since 2021. This patch matches that
common practice.

Signed-off-by: Roman Riabenko <roman@riabenko.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index fd3794678c33..6c8b79c257b9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -106,6 +106,7 @@ &emac {
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_dcdc1>;
 	allwinner,tx-delay-ps = <600>;
+	allwinner,rx-delay-ps = <200>;
 	status = "okay";
 };
 
-- 
2.54.0


