Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FABC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIYsLkAjUeyDKKQKrmnCLsByOqWE42bsxW6TVXBXKao=; b=DHYNB6xpTMhVdCVb9A21oAjvsp
	pKznCJe36gAsuzmRKaeQoMq0AyufOXpYoCiuYfMW8SZQ+hQXicscos+lEohyxs4GxdiyZoWs88c6p
	Ta8qPluBZ4zax+hqOqJNhEauAm8OHjN7pi8GqYJcptmu6ZJ3Rg0YYypHVdmJ7+9hIrCPOFFzZetP4
	dlllKch0JI1JltkBIrRFBVDalr4JzmcmwGGHRJqqgHxcOxpV/kJtqQpnlagYrBjHf8577yINOENzd
	LAIzDiTqCKaEMlCFwGgYVhFPnqblsjGcSrVxu/SdmlGks5uKIciJMr8KpVG2PBYoNzelIRITmXFjV
	qIOazuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcol-0000000C57e-3z2d;
	Tue, 14 Jul 2026 13:04:59 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcoi-0000000C53j-37Y8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:04:58 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gzzzq0bffzMlDF;
	Tue, 14 Jul 2026 15:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIYsLkAjUeyDKKQKrmnCLsByOqWE42bsxW6TVXBXKao=;
	b=ndQOwXuXEEczfanTo49npLbHWf8Z8V/O/MY8Za+ZvouLgB9SDa/Oo4+Dzyg+CTPU0BOXgy
	1cntIqMgv5mCscTZlCI7OdtMeKWqE/jnKyVeXzSqqp1JSTO4vgES/dZ4RH66jmusyFWyYJ
	CYKUNFkR/24GDNAX4IP5rYXy1J3sxY6AQFWcs3VrTlA2rrvAatehXzgY7F25scVJcypsVo
	/HfD0MeHyW9RZTkx2LEXKMNYUgV+KELTDSfMR0LwddL46jTjxe2ITlv+pJ3xY9KipHUyG5
	NzFP3c5NAJeBKHbJ7jOt5pI+unAFIo/C75RZjbGOLJXVKOlih9IL9+u5VThklQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ayzvAUb3;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIYsLkAjUeyDKKQKrmnCLsByOqWE42bsxW6TVXBXKao=;
	b=ayzvAUb31pnEGosErW9vURvJpfJiAc8OgINnQFjBJaLLc/PBS2sRzKFk/xmbrnT8u7qktL
	ggy2cv/9vmPcOZAUnkPLfw3SnMaxq+dqHvTDlQh+Pwr7R3ISHl+S+KBEDzNabC+0nD64QC
	91olWvD+bjs3aRHpv1Zt9qwKnd6Xxa430P/0JQFvF7D48nA50F/o/gdzab+aF1BXmiQ8Pt
	HGcrJqe2CdA9TUUGWG1iNZ7ns3QMgryVP+FYxftwF4jx3pxJzQYhhqXejvD7dYt9p0qrTp
	xfj5QasdjuGRloY9TLloKHGSy4CHvFTZ7m4FCQyLSRTPG9UhyvqRO+rdwLgITg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 8/9] arm: dts: renesas: sk-rzg1m: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:04:01 +0200
Message-ID: <20260714130429.11214-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 443339035ef379a2ec4
X-MBO-RS-META: uhewo1entse39fnbw516k77yt4a41km6
X-Rspamd-Queue-Id: 4gzzzq0bffzMlDF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060456_926835_A709B579 
X-CRM114-Status: GOOD (  10.60  )
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
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
index 60217797e5345..dc1b4ca944622 100644
--- a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
+++ b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
@@ -72,8 +72,10 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
-- 
2.53.0


