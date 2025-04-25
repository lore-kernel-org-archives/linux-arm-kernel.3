Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5040BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IWFeZwQkKxKDNc32b6AQqa8Tbi3kqSkUWXHW/RB4xQ=; b=Md3p4hhwFf46lBnNHwHl7SCF4i
	4hlY0MTY3vwBVBVj0sFzls7JumNu99xI1TmUzDNC3kWDRUFx49Wh52HgGjw9QNCvmd7mf5vyQkwAH
	angfQ9s5fk02ZRAWJrVRsFrLs50aypzFwFPiKwnhRVf/g2JZYHIZY++gz029rDfFWIGfk0nZ3XpRe
	6htw8Sk/6qDhva9TfsNVSPT4FYPU12rOvrVtHNYCLlzmHnKOIsaoArKXPRiNnvyk+AfGUg9SAitlq
	hbq0OWGZA8Uzom52c/S1pXFqgxEZz4YgS/yhJEDlkAFxHiyy8It4COw1OCYaQz9fIUIF+HD8TM8f2
	dthalK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HZM-0000000H1IL-2CZz;
	Fri, 25 Apr 2025 11:50:12 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FKJ-0000000GXD6-3Ja9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:26:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1745573189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IWFeZwQkKxKDNc32b6AQqa8Tbi3kqSkUWXHW/RB4xQ=;
	b=bvGmNe8WywhaYqVBAc60FF65NJltCetdn45FTsqiGHTawpD83xmIccx1HDuMIWO422PudS
	W8gEtY6zLaoi/ndbRSwl2eKtGbjZJ+4pZVFDhvfu4OlsqeaJXPEa/SNsXuU1wF0jPlTL8w
	GoFg8PldKlrGcFUf97TPFhaGFjmxazLKlqdthMljYv2adSmBSMcRe7BXVkmNS1gAzSYIUu
	8Qftpj18dvKi2px1HdAlYOwEfU5jppXUGG+FbPhr1b3KE3RU+i9vqRFM4WRjlCxR9TAYe3
	GQZ/F7zTEhATo4fAY1kE6ZPA3Rgq2yLIAgN4glzpJfKg+p4dGncJVelOI4u4fg==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Dang Huynh <danct12@riseup.net>,
	Johan Jonker <jbx6244@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 1/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3328-rock64
Date: Fri, 25 Apr 2025 10:44:41 +0200
Message-ID: <20250425092601.56549-2-didi.debian@cknow.org>
In-Reply-To: <20250425092601.56549-1-didi.debian@cknow.org>
References: <20250425092601.56549-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_022631_969440_2E7C3DAC 
X-CRM114-Status: UNSURE (   9.43  )
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

As described on page 6 of the Rock64 schematics for both v2.0 and v3.0
the SPI Flash's VCC connector is connected to the VCC_IO power source.

This fixes the following warning:

  spi-nor spi0.0: supply vcc not found, using dummy regulator

Fixes: e7f4e924f46d ("dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply")
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index e550b6eeeff3..5367e5fa9232 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -343,6 +343,7 @@ flash@0 {
 
 		/* maximum speed for Rockchip SPI */
 		spi-max-frequency = <50000000>;
+		vcc-supply = <&vcc_io>;
 	};
 };
 
-- 
2.49.0


