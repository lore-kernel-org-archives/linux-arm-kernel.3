Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AD9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EVne6v+WJjnFyalBsEVSGk40M4U34bdUdr0DOqywwyA=; b=Qthvhq8Iwn9XA2xj8GMzAJP0JP
	++ANNeLdvsfmGTKQQ0xvAEHYUiafsxAx/m7c/8ioP2oqeO52BQES+KqVdYR0qpvM1lxDCN3Y0CY3X
	7MCNu3Vxiqed4oM8alMsQF3oIuCdTR5VDuriMMSe4TGFL7xOWM1NA9gcFcxsLAoxrr2e41/9my0/7
	inyk/8VY8R+3Z+9OPFZEhWRIme0Z2lzaXDVu0ORUaiBnGkP6fvPslCpE/KPtwNt6io49mEDRdkZ4R
	Mg7I8QAGh9uWPGvBjIm3tRnnS8HA7BwPLGAV+25q6AFv+HbfvArhbCkeJV3XZanK+3KE1+DWAZfmZ
	01P88uWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcoW-0000000C4vU-0HuA;
	Tue, 14 Jul 2026 13:04:44 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcoT-0000000C4tz-015O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:04:42 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gzzzV42BXzMlTh;
	Tue, 14 Jul 2026 15:04:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EVne6v+WJjnFyalBsEVSGk40M4U34bdUdr0DOqywwyA=;
	b=hV1xh2eExXPMdD1GyvniGTVFfkCdC57CsExIhFdEpRvthIXWFElOlL5Jh3oFntolcLSMPr
	75zVC8K5h3fNRT64VTv1OVZHW3cAlmUDyZ4fdHFPbKmdofZ8hJS5C7xmN4phk6CZBUT7ix
	hgy6ni3mNYDmUA0zEQ86neYHFwHbnirKZB/VtO0GsL2qZzBATZbbjadNZl/XHTF7K4n3OB
	JCvFpoie92Ck+TYeCNFNgEur9g1yAM4/wKb03sW1YQMaeM0ZStVLnj48VO2HVaCyhBc4VV
	DYj48Jaxkb6+yfLOd34+kNZtvfDwVQqPKhpqzqP4kbty5V81UyIDvUyVvMQOmg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EVne6v+WJjnFyalBsEVSGk40M4U34bdUdr0DOqywwyA=;
	b=CSkuSS+i+EMPxhLKfXXAKM6WEyHZu47cBkuAhtCeM3wbfgty8EeFL6ljLwGOioScSL7BQn
	wxrXc0p1AcGwRW360/noYHCWfnBz0l1buS7mzyEBUUbYhj7Xye1uzL8Quw2iBcXbyRX2mv
	QFcnv28Qik8hwUTXO+RWivPXQjbn8IrKAR0gVawVoYf0fUh94gtsyHH6RNXWmUuikM77TD
	2a6Ji+8uO102zsl0+AHln/YKZpwuTbBzl4mzwF7Ui2LrtDX/jfr0lZpIiVo6TuzUYJqDiN
	zQeqDepS17zC3sWpZhbnDElsnptY9n72etCuiSKru3Fe79hvS+DQnH6uYZZVfw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/9] arm: dts: renesas: lager: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:54 +0200
Message-ID: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 93110a46b0bd6b25939
X-MBO-RS-META: 7ernc3k9ijyha7d51sjx173qk6mfk9e4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060441_191926_3D17B539 
X-CRM114-Status: GOOD (  10.12  )
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

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
the system wait after deassertion of the PHY reset and before start
of communication with the PHY via MDIO. Opt for the same value as
used for KSZ9031RNX, which is 300 us.

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
reset high is at minimum 10 ms. Set the DT property reset-assert-us
to 10ms because the KSZ8041RNL RM does not explicitly spell out how
long the reset has to be asserted, but this at least covers the worst
case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7790-lager.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 8e76655016755..86548859e803d 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -687,12 +687,14 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 31 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &cmt0 {
 	status = "okay";
 };
-- 
2.53.0


