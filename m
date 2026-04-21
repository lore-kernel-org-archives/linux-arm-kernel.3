Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4838FF327BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNG/Y20//o8s/WKC5TFEmO5f5/3pr9Lb0W7Zg73YSGA=; b=b/zaMpdshjqDh/+frVhpVu3Vdz
	eyFxicX6JKsVj6Hj+jNyGeTGLNsCeS9tVlvT4WThaLMNwQ7JQF6pevna4fl5QjtuLuUlnK9Oa7qpU
	T6F6DqR+Y1bUIBOrKJa7gvim7RC4A6tCKz7T4TTNIN5wTJHNNln0nnzfBvfk1ZV+3+ZLn9R0+1zsZ
	UP1GP7T8pKRBp5DMsvS0uQhdIMHtomh1JqcxIMVceO1cqomGirH2zGRibfEj+M0/vYQDPKCGUI6Ph
	YYZJUXVnyMhrfNiyWN3iPT3UjAVnus5etw7GGQkWtnPtjq1bJwuIWfWHvMMi5w+ifkDti4uFJaTQ1
	uXZye7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7fo-00000008M9d-2bf3;
	Tue, 21 Apr 2026 09:45:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7fm-00000008M6n-0ZnN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Apr 2026 09:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dNG/Y20//o8s/WKC5TFEmO5f5/3pr9Lb0W7Zg73YSGA=; b=p0XdMbRyy9RhnjXLgncZZYI4sF
	Gb3CN8Ea9j2wbDnHb3pndYZSvCF2eyb+Gv7m7HvHEEyKsrEGG+POuItvr1LS2Un5kq87vFTUExzgT
	xcjo4f7VcB6c8F9ikJ6fJUF4NkRe9GZgkFVTI9kbP1TAJxrVKD3XRVvB8GofPZI8yJPLYGj/F0DiP
	6HKMtmZPCGgq8Y8we4635Jbwi4ICAEI+6d7sjHEAjTd6PFXHyK3tz73NUYZomXz89eotKPEJMIIDr
	LjtqeHS5qckvnS4SoQF0zFQ9NBQtDsNlZdHr4SVjIiE449jKMtwFiyF5bvr+JuDrsdEOmIHTanDa/
	tkpUP2sg==;
Received: from smtp-42ab.mail.infomaniak.ch ([84.16.66.171])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7fd-00000009Vam-0FuO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:45:33 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g0HXM00Krzbqp;
	Tue, 21 Apr 2026 11:45:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1776764722;
	bh=dNG/Y20//o8s/WKC5TFEmO5f5/3pr9Lb0W7Zg73YSGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m6tjE2QwToZnbli7rrQbIaNnibN82woMW1IErKpEEBaZmNpq8iyeihtoxEuMrrjjN
	 tEQgCM2HrrPa6dBDgFNHL9Gm2fzuAABNXl2XP74q89iT+ZLkrJM5y/4lkaDMsDb9SO
	 PjvEVDvSFTRRHjvUMbatYIvkY+jV6/7IIC+JIlmhCPIpeAklgHR81cKwxLbm1HbAIo
	 Kkg2htoGVyG3eAun/CMlz8bfv0n5XGNTHbu76DKmLtB6lq/Fw6IHOUZgexVOvVKm53
	 xD+DgXvbGS6C0cil9NaBnmeMNLS30nZ+oHyhC5aM6j3WvChvd4pfdVG5ptY7pz9LSD
	 +ta/wvaKp3ouQ==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4g0HXL0Qv6zbgQ;
	Tue, 21 Apr 2026 11:45:22 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 21 Apr 2026 11:45:05 +0200
Subject: [PATCH v2 1/2] arm64: dts: rockchip: fix Ethernet PHY not found on
 PX30 Cobra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-px30-eth-phy-v2-1-68c375b120fd@cherry.de>
References: <20260421-px30-eth-phy-v2-0-68c375b120fd@cherry.de>
In-Reply-To: <20260421-px30-eth-phy-v2-0-68c375b120fd@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_104531_592054_800B29C0 
X-CRM114-Status: GOOD (  15.13  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

When not passing the PHY ID with an ethernet-phy-idX.Y compatible
property, the MDIO bus will attempt to auto-detect the PHY by reading
its registers and then probing the appropriate driver. For this to work,
the PHY needs to be in a working state.

Unfortunately, the net subsystem doesn't control the PHY reset GPIO when
attempting to auto-detect the PHY. This means the PHY needs to be in a
working state when entering the Linux kernel. This historically has been
the case for this device, but only because the bootloader was taking
care of initializing the Ethernet controller even when not using it.
We're attempting to support the removal of the network stack in the
bootloader, which means the Linux kernel will be entered with the PHY
still in reset and now Ethernet doesn't work anymore.

The devices in the field only ever had a TI DP83825, so let's simply
bypass the auto-detection mechanism entirely by passing the appropriate
PHY IDs via the compatible.

Fixes: bb510ddc9d3e ("arm64: dts: rockchip: add px30-cobra base dtsi and board variants")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
index b7e669d8ba4d1..add917af5de78 100644
--- a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
@@ -397,7 +397,7 @@ &io_domains {
 
 &mdio {
 	dp83825: ethernet-phy@0 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id2000.a140";
 		reg = <0x0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&phy_rst>;

-- 
2.53.0


