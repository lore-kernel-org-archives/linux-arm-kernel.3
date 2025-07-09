Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9C9C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdOjVT0hxZ4MogGhHL86KxEfuOHrbi5hNR9VAR3J/Ig=; b=ITTa9Kx8LP0pmodeW6dm/R7b7L
	24ii1mW32H8rhQRxq2rpMK5qlkGUxaspGeYIvEatPPwxikEj4CP78fCwu77F/SMOlFFnqHyXODaOC
	P5Vox5vuNe7GdEXpem+M9cG3jRZEUmMsmbcrGotiwZ1AJC9XBo0Gau1OwrTwPGGOn1cyBeQMNnDH0
	ytlnzra9MHk7GQYaRKKJpDeRJFl5Ua7eV2fwcjikmTyFovmde+UkfJWoLsjmWvu7pn0Hhr1UZq3LZ
	CQaa/M+Rwzsh5SD7v7L0qJSDOCfCV7yOXdbCxnx19wIP8ZpAQIow3vOjKmrX0g3bGHpsjks6Q9dR1
	uh7mATfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWmv-00000009B7w-0wdg;
	Wed, 09 Jul 2025 15:32:49 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUlt-00000008lr3-41xH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 13:23:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1752067416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LdOjVT0hxZ4MogGhHL86KxEfuOHrbi5hNR9VAR3J/Ig=;
	b=HdrlA/dmy5Fa4JgMgEwHcOTJYaWLiae7fNQ2A05rKkMmpz1hd9A0sViJK4a02+zGuwWG6f
	Mn2ORHj8hG9W/CjoEy+oAX3rPXznFnASAaQJSpY69ZHQKA5AyaYCCR/0RzPnwClkEfsav9
	mH/wTD8o/R9BBb5osT4fvocY5gIxD+xp3jmj0OEU2ZUo9XC9uOP1VtDCZ1W5B0YyPlRybb
	2tZpvKh0NeucF2Bd9Zc6bujWGqOdjOyIXjD7HDEjkKeEFK64Ymxck7LKGY8LrDK0gTG7Bs
	c/6LOoiQiM02gNe1C1rXmIP9+eOSWRvP6AAwUJJPZh1q6E2CyFYcIJWATFlKMQ==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v4 04/10] arm64: dts: rockchip: Simplify VOP port definition on rk3328
Date: Wed,  9 Jul 2025 15:15:17 +0200
Message-ID: <20250709132323.128757-5-didi.debian@cknow.org>
In-Reply-To: <20250709132323.128757-1-didi.debian@cknow.org>
References: <20250709132323.128757-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_062338_143173_F80A646C 
X-CRM114-Status: UNSURE (   9.00  )
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

When there's only 1 endpoint, there is no need for a unit-address and
removing that allows removing of related properties as well.

This fixes the following DTB validation warnings:

  graph node has single child node 'endpoint@0',
  #address-cells/#size-cells are not necessary

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 7d992c3c01ce..6438c969f9d7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -731,11 +731,7 @@ vop: vop@ff370000 {
 		status = "disabled";
 
 		vop_out: port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			vop_out_hdmi: endpoint@0 {
-				reg = <0>;
+			vop_out_hdmi: endpoint {
 				remote-endpoint = <&hdmi_in_vop>;
 			};
 		};
-- 
2.50.0


