Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFF4C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znUavP/BrlHSUj49dkNncKOBHc7iyfaD5tE24M8Y1yg=; b=0+48S1GK5fIWtV9la6P//c+iIc
	lOMxrTRQrJEq4s3pOJ8zvvmkW6KPWvVrz49TK7tsjVvmCO812dfSi4Zr6JaxmvNtBCgdBaaieb2jr
	X9jt8JsyMEsC5UtRibfJsuOcBqX8HX7AsGPuM9enV3jHmdtDwghuqcAW/LF2bfCTTE3mWE/5ZJ1gW
	r1yJ67maZumLJ5Fjv9eimy/+yiszj2N/YdiwAgItJuBHRqvBCyTBduG/pcqB1tisMPtY1x1626rzj
	vB32stcxTNOyscZTXbUlwjjZ2g/aT31m5mFzc17ml9NiFSmpxiRQFTMPOAkeUp9/1Ngklj/cQokhX
	NeSTVX7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uIj-000000023zn-3549;
	Mon, 07 Apr 2025 21:46:41 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qv8-00000001TjQ-37fr;
	Mon, 07 Apr 2025 18:10:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744049394; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K6IiAeHqBHlNrWiqQn+3MNldAf/eENA+BvXOKM7nbKf1rlWU+6fUObV15o6Rm6AzFG6GgOEtfu0XIpDc8C0GFToquzvl87oy2p6ABernLurSxNOjQglpzYwNJNglrILRb0r22iJejThpPi1wf3L6VWQrwvwgIWNorUtwpX/WALQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744049394; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=znUavP/BrlHSUj49dkNncKOBHc7iyfaD5tE24M8Y1yg=; 
	b=NXh8bDoXXWwwOExleJ5437igv5RzEKqCGSEovzd4+KtJN2D/EGSY3B8ycbC31KnJP8R8YkF0sSnDU1LdYgNcNJ6Fvs2aqT8u/ZjryWDtOcmiIhNiT7JSoFvJ0mNtUGEg6DeI8DLfYJrFI/8fzjWmZ1zdRTAFQFdx+QFOEdz0D6k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744049394;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=znUavP/BrlHSUj49dkNncKOBHc7iyfaD5tE24M8Y1yg=;
	b=RwpDAbGcZNxlG/P6vQDHPFyHVr7ljwNalyK6/Nd34ZnUbpXUgs6R2H3OfuaWiSLp
	gnHapHdlFh770AYbaJvZTiPxdoNrvOi1rMaW5zbLWhcGZ0JkREGGZ3swN8pMQ6jUzm0
	nJf56irj5oDDC5GLmNZ6ihhSktGDII90JP717cGU=
Received: by mx.zohomail.com with SMTPS id 1744049392553406.29570236196037;
	Mon, 7 Apr 2025 11:09:52 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 07 Apr 2025 20:09:16 +0200
Subject: [PATCH 3/4] arm64: dts: rockchip: add phy suspend quirk to usb on
 rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-rk3576-sige5-usb-v1-3-67eec166f82f@collabora.com>
References: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
In-Reply-To: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_111006_842858_ECC9EED4 
X-CRM114-Status: GOOD (  13.33  )
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

The dwc3 controllers on RK3576 appear to have some quirky behaviour
relating to runtime power suspension. Specifically, they will cause
SError aborts on register reads in the xhci code when setting the device
role.

Downstream appears to work around this by manually checking for the
rk3576 compatible in the dwc3 core driver, and then setting the
autosuspend delay to 200. This appears to be smaller than what mainline
uses, and I'm not quite sure how that fixes it, but I could also be
reading the code wrong. The important takeaway is that the RK3399 uses
the same codepath.

Looking at RK3399 in mainline then, we see that it has one quirk that
RK3576 doesn't have in its dwc3 controllers: snps,dis_u2_susphy_quirk.

Long story short, adding the snps,dis_u2_susphy_quirk property to
rk3576.dtsi's dwc3 controllers fixes the issue. Quite suspicious that
this is not needed among usb controllers based on dwc3 in other Rockchip
designs, especially other RK35xx ones.

Fixes: 23ec57a32da4 ("arm64: dts: rockchip: add usb related nodes for rk3576")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index ebb5fc8bb8b1363127b9d3782801c4a79b678a92..71c71f5a2b77c52b251bea16e4deaa4b0109715a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -470,6 +470,7 @@ usb_drd0_dwc3: usb@23000000 {
 			snps,dis-u2-freeclk-exists-quirk;
 			snps,dis-del-phy-power-chg-quirk;
 			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,dis_u2_susphy_quirk;
 			snps,parkmode-disable-hs-quirk;
 			snps,parkmode-disable-ss-quirk;
 			status = "disabled";
@@ -496,6 +497,7 @@ usb_drd1_dwc3: usb@23400000 {
 			snps,dis-del-phy-power-chg-quirk;
 			snps,dis-tx-ipgap-linecheck-quirk;
 			snps,dis_rxdet_inp3_quirk;
+			snps,dis_u2_susphy_quirk;
 			snps,parkmode-disable-hs-quirk;
 			snps,parkmode-disable-ss-quirk;
 			dma-coherent;

-- 
2.49.0


