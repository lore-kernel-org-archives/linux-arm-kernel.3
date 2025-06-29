Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF122C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 12:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdOjVT0hxZ4MogGhHL86KxEfuOHrbi5hNR9VAR3J/Ig=; b=twZCNsld7Dcs5Qs/MuFgUhlW0J
	jvO8ykYuOOXLRLIj3Da6cYwREHLgXAbfgsWKn+3BSJvCh7IhI0xPOp/W2C2g9KiGEmpJC0esbd3M4
	G9cP4wMJiyf6J9muht30yl9jlnsJynKFcHyqa2ikRQN8bISl1EPKr40P8RihBh/WWLNHPQSn+nTlS
	kEzRvV07TOR1YbxrXU+3o7t1zKdqhmdtO1iWyyU8X+sVXk4CDAq6lEOhH4dQOC7PmYskOA7mUcTFb
	p0zVegIFgMJhtwRYGmeFKIXaU4MyUgg4s6Izx8ns4J27YRj3/fJnqhcrq+aU/yYKNFesdAxHmOhB1
	yQ/8j4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVrUb-00000000FEV-34kD;
	Sun, 29 Jun 2025 12:50:45 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVrJA-00000000DfT-2dgB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 12:38:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751200734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LdOjVT0hxZ4MogGhHL86KxEfuOHrbi5hNR9VAR3J/Ig=;
	b=mfJeej8n77x2tjiXp/a6v5SR+HUR+Fhw6vw6nTzjX2kvokPnfal7AFKFrXUnS9EN/F55Dr
	qC8eSPXjyNJdRJ2V9T/4rNZ5os6O0nEf2/lpuEiVyUuC1AbT1PqkVEFibRc9PrN0o2A+hq
	hWil32gFkhrmnos2SlBKTU0GDPNBicXV7QnLV9VHGDdk/nfK9fVBuLqx37EM2lfCvJ5nLu
	GyR8+cPHFShoDgr15FGUtsgGyISAi/HstaUB5ADKEEQatS9/tzc4L5rG//XG0JTJnB/yYA
	g0oKjGhlJQgn5zvblPssfoQvo4emsM6pu3LffFbBvJEG/R6Fx2f+ciOnpjxPBw==
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
Subject: [PATCH v3 04/10] arm64: dts: rockchip: Simplify VOP port definition on rk3328
Date: Sun, 29 Jun 2025 14:34:45 +0200
Message-ID: <20250629123840.34948-5-didi.debian@cknow.org>
In-Reply-To: <20250629123840.34948-1-didi.debian@cknow.org>
References: <20250629123840.34948-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_053856_832289_07D38070 
X-CRM114-Status: UNSURE (   9.02  )
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


