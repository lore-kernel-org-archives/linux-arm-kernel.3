Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7226F94CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqs4tq3cJApkfQJS5mLpoKAO6cqhkMUnnjmZgHzvTmo=; b=UZltmHfxVk6h45QNc0bK3jU0mb
	evRq93YnUrprPbh3nrM3mLLNy2F2saz3FjAf9k09wNW6/kPaivJh/wK3W+IHaRiaOqxXHE8VbFZJa
	9+2jDVljhA20Gg6T4Fvc6G6rABajeHCzYy1hOZnsRq37bnKhE/KZrjSkm2KGpX46leGBEPOvHhtT4
	N3xbfIvTafTADtQnn8hXt7Nj/I0Hi01jETo1OuyTW7qt8xvEfIpY+kzlmSufvpM4f8ldCFHMjVGgr
	nWPriequ6yRKeNqQiJfLGSigSH7c0S2Fh0e72J3256+2JD4T6orKs3dhfWtM0G5UO9MBgKMyfMk2q
	pjYgh1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFa8-000000090kY-1qtD;
	Tue, 21 Apr 2026 18:12:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFa6-000000090jb-1c4E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BE4C41B2A;
	Tue, 21 Apr 2026 18:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5B2C2BCB0;
	Tue, 21 Apr 2026 18:12:13 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 04/14] arm64: dts: renesas: ironhide: Enable SCMI devpd, sys, and reset
Date: Tue, 21 Apr 2026 20:11:37 +0200
Message-ID: <2eb3c62df7b6ccedb525569fe34c10403e2fdcf5.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_111218_441720_05228C9E 
X-CRM114-Status: GOOD (  10.30  )
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

SCP FW SDKv4.28.0 and later for Renesas R-Car X5H Ironhide not only
implements the SCMI base and clock management protocols, but also the
SCMI power domain, system power, and reset domain management protocols.

Enable support for the latter by adding the corresponding SCMI protocol
subnodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index e2470257d2f32a03..2fb9557a7eb9dbb7 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -31,10 +31,24 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			scmi_devpd: protocol@11 {
+			    reg = <0x11>;
+			    #power-domain-cells = <1>;
+			};
+
+			scmi_sys: protocol@12 {
+			    reg = <0x12>;
+			};
+
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
 			};
+
+			scmi_reset: protocol@16 {
+			    reg = <0x16>;
+			    #reset-cells = <1>;
+			};
 		};
 	};
 
-- 
2.43.0


