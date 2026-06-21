Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B113CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 04:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ossxZ78Hg/cW+cDS48M+y/9kOzu3muGsd3p5SED7JIQ=; b=24yJr1qIK0zMCoskxzFanlywci
	wT0iwjvl/3K/jl1Dzh+X0sEeOOuazJzaXJ7q53AZ7ny/pIQTmVVR2q0LZVMtURpzBEyD7CMvmcXme
	oqGF4ddXbx+KJyXxJcTLLIYeNw1C/k4+QEPiSbD9yNku0Mdp+WzzHRk7hK5pzShP27LCslTf1RQ41
	usiG5s8JTOKHR9bES6SZ9ONgzNDFd+3u0MwfvUd+bdNXimjv3p9sa990lGeKQkMXi6VjS/NMoGmPq
	SE4rAiwXPDpwdxfnfSwUCGM9y1ea1UtiTZanXFmkxOmewHROX8DRt2oKBANQuxhuiVqBoQwm/Ew19
	IEwtUDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HC-00000003hJv-3A8Q;
	Sun, 21 Jun 2026 02:51:14 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8H8-00000003hHx-2ntw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 02:51:11 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gjbSD1Lvtz9smJ;
	Sun, 21 Jun 2026 04:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ossxZ78Hg/cW+cDS48M+y/9kOzu3muGsd3p5SED7JIQ=;
	b=bAtLK4BPCaMvJ2Cbl0mhR63gGMz1ugr8KBEqyOnLWiNpqSNrBSY5ifspvtWKv0U2Mq02Iu
	GFieBfiF2V2g1D1mCPoSZ45fgzfP/U2aqd1nuUaaKd7oplIWtGIkQ9JprBbgMtwRJMPi2Q
	ubLEujx/MyHhmWnDahpo5YtLBoQ6L7EzCAPCetKgSJ94oQ7vwHlsOutQNwyarxQVep3j5x
	47udzT0adn7pddjgc3blse3wfV/ZP3tSJc+D4mMDt5OOgy+hoMT6wXfvAVjmnhhcupCKG6
	daOMDAt0W3YtVxvXAmXK0HlVkP7sleuEfxAnZm9FXgEr1jNWlXnHJADY6yt36Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ossxZ78Hg/cW+cDS48M+y/9kOzu3muGsd3p5SED7JIQ=;
	b=girzEagu0dbsURCZmH/6g+KI6s7bFGwqRexvFjfYbE0sokDjbBLUzxPin+rtfYDyndQ5QH
	GV5KYzQKlQBwYYGgHMIu5dmr4e1F2j1LcVm7lFhH1qsW57k3lYxg25k+LshY9x0H9fO023
	SpL28gdFJ1w0wuTOQTNoBpbP8RE6BrH9sCP7JMnFcaEWN1K7Ipm0wpSdr/KQ+oRNt7O4mK
	Xl4G/8Eh8OfPN0U8GkANqWQ1u4DUqm0Qcu4vko0T4P33Fb1Y+D959zq1JF2xKzQjystiZ1
	PtV0kJwpJcUCK26QSK99c12gfsAsfB93xqnx3f94IworsR89I8pVlpBBYZ3gsA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:25 +0200
Message-ID: <20260621025052.406507-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b2607534602c0fc3376
X-MBO-RS-META: xr66haj7tqn85hsdbt7pk3n14x7y54a4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_195110_846756_D17D7D63 
X-CRM114-Status: GOOD (  10.87  )
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

Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
which already has that soc: label. The soc: label is useful in U-Boot
where it is used in U-Boot extras DT fragments.

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
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 9d76e39eab72e..ad4491ba948f2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -311,7 +311,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


