Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4364EC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 11:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fzxh7tPQY4iMYc+9I/7gDfWX3rGuxX+/a37R5NrhIjs=; b=VmHo0n+hkoAd095NcyjBI2VbAt
	seIo+6wLRy+iwTCxEwaOdYOrYtCjFHZN12meRmOBahSjaE5heVKHzdW/JXocN0KBpZVY18rLM0Wca
	jF7xLau0H4/A+xtrWULTEs0rxqW9DYBM2GsEBJNI48RvAAa3Gk8bC/Frp5cozEEfph9ltbsa7XwMH
	mujuQTovY5X4NQEf7CRnKXssvIAPmGiu10BXOjkrdQFyXHJgBE8tPzVKXgxEcpnuYI+UQzzhUzX7f
	WkyK6X7toX/Kcx2uh++lwX2PiWESYnpowbb1WKjR0bD7AfmsDOtud+P8HGM5GrqSP/VMpGf2GGcKl
	TbSoDqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv2H-00000005fq0-0R8O;
	Fri, 28 Aug 2026 11:46:17 +0000
Received: from out-123.mta1.migadu.com ([2001:41d0:203:375::7b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv1y-00000005fbS-2hlS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 11:45:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uapX6PXhcBGDCmHV05L6QsA4dUHjroApJlX837g50MY=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917556; v=1; x=1788522356;
 b=I2p4hb0SJ6TaUY31a5B+6yE26Potg1KenkyTVWcMN1iBnk+AN0ncdIVH6qPALitif4YZZ6Ca
 pjkfY7k8NsJZuQIPzlyq4uWeJIEl/GWv/poK8jSLuJGYvLQllTs6KouwXNIIlN8PNnPAoMpggTq
 knCpn3xNY77whepV3hRPTkS/GMVriD8q/5c/mo4A71cz0J4gRCtn9DRjyejfqR0YLBEBsMSI1/0
 x7MotC25z4Ee5u1AacytyI3pFh6S2Esw3P8vHVRzEf2h29xP9nlstKZ+vkHENOEbQ/Y6ZANFPp2
 qrbjyqh9A1PWnZfnv3BeFrDHFra/YkAbOArBOuFWc9Hzg==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 071f6fa85d8f0328;
	Fri, 28 Aug 2026 11:45:56 +0000
X-Mizu-Trace-ID: 071f6fa85d8f0328
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 4/7] arm64: dts: rockchip: Don't pull up rtc int pin on NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:04 +0200
Message-ID: <20260828114530.1315798-5-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_044558_851814_5C515FAE 
X-CRM114-Status: GOOD (  10.22  )
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

All NanoPC-T6 boards have a pull up resistor for the RTC pin, so there's
no need for the SoC to pull it up.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 84bfb33a4774..2c9390d2968c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -705,7 +705,7 @@ hp_det: hp-det {
 
 	hym8563 {
 		rtc_int_l_pin: rtc-int-l-pin {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
-- 
2.55.0


