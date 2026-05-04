Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971C2FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P6wqddPFyyag+0HqiKhjqX5gfmmABljWiCbj0h87e8Y=; b=vF5L8ndAV1xA9cFh3sB4IUC1Dr
	r2TZ8I57lDrvS2IssGejSCRy3NI0W+ltgTfoqJoAj7yii766syc5mM23KoHe51xbOo4org47TivKk
	BzNjDZjr7syueCut1EY583/T1ao6qI5HqvXiy1DtOZiNPDjBAqDqGfCAdWewIVIJe5KbbBIHybYZf
	YTgFTRs78zh7KFZE7sUhcEZpAfnNwlViGL41x56at3qe9gc2iUcrHZ8Z4IK0QFnjv4/hGIBrKwtsx
	T6s8/6bNunk45ipwc9VmC3ptiWxo15AHGHvJ6nuEXXK02qk816OWZfe6soZg854oqXN4HMIAfTB24
	Wpg6EjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2CK-0000000EXDH-1uGT;
	Mon, 04 May 2026 22:55:32 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2CH-0000000EXCK-2q8c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:55:31 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g8cRz2W9zz9sss;
	Tue,  5 May 2026 00:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P6wqddPFyyag+0HqiKhjqX5gfmmABljWiCbj0h87e8Y=;
	b=Tpv7d+h5dL1knisdlh7UBjkinEoKoBsPW95Jq5jM5NdIZy/C1vMaInpTJ91KZOcfMGaujW
	Tw8if6Y0wzXkmmJdEjx6K8YxPyREdwzHRCMcBCl7Hr9sykPs8xaK5kaAAXdZBNpYjGmfaP
	inQbW7Ql8bF1ls2Gt+P6crcFD7cN2+9R2O7cAbEGTYc95AjRPYyKpjEDnrq9JwvxSoT10x
	Vnity6tE9ryB1i+hCwRNRrFRhNPj2rBgDBhz7H8lXEErvvVf9Gi+0ffkgn02sfQaO3EMT4
	oVGg08KonaGpu26RMipX0qT5UrX6acBhwFrLb2YwGbVOc5nEnpjoLT4g8XyKNw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=p5mcKY7T;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P6wqddPFyyag+0HqiKhjqX5gfmmABljWiCbj0h87e8Y=;
	b=p5mcKY7T8eA+iyL+Ft9GmRBAOVZK54B+jHNOXsCnPsXy16OLq3AgG49wOrnsduUJ9dgxal
	Z39GKelv6YRGGsRJFgFkQIU1z5iKwNdxoE2U8PnBMLwraJDMq74Xt5LcVfllsqLB4M5sG9
	SxaTN/E/i2kNbP8KgOItmqDg6qZqMdzQLCeWsH23ckGKzMoYtiuVd+hWFNECRJcy6+TA7Y
	8FznnD/Iv6DLMsiZOeBDO0p/eY+y1nNLvUiCCzNLn+nBW/gSDssswFOLmNA9ejlk4UjwVa
	LPdnkupK9mGkZFxN1PMfbTqkB3WGAtSnmkWk9Uw4hhuUHBd8tswlUotOMMcGRA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: renesas: ebisu: Sort sound node
Date: Tue,  5 May 2026 00:54:42 +0200
Message-ID: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 51c91871026be051011
X-MBO-RS-META: fcqpm9xnkumw5gk6o8hkimkjef8fjrrm
X-Rspamd-Queue-Id: 4g8cRz2W9zz9sss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_155529_857230_FC8582D5 
X-CRM114-Status: UNSURE (   9.42  )
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

Sort /sound {} node in the correct order alphabetically.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 34 +++++++++++++-------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index aaedb1fb51aed..ba564aa098661 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -186,23 +186,6 @@ reg_12p0v: regulator-12p0v {
 		regulator-always-on;
 	};
 
-	rsnd_ak4613: sound {
-		compatible = "simple-audio-card";
-
-		simple-audio-card,name = "rsnd-ak4613";
-		simple-audio-card,format = "left_j";
-		simple-audio-card,bitclock-master = <&sndcpu>;
-		simple-audio-card,frame-master = <&sndcpu>;
-
-		sndcodec: simple-audio-card,codec {
-			sound-dai = <&ak4613>;
-		};
-
-		sndcpu: simple-audio-card,cpu {
-			sound-dai = <&rcar_sound>;
-		};
-	};
-
 	vbus0_usb2: regulator-vbus0-usb2 {
 		compatible = "regulator-fixed";
 
@@ -260,6 +243,23 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 		states = <3300000 1>, <1800000 0>;
 	};
 
+	rsnd_ak4613: sound {
+		compatible = "simple-audio-card";
+
+		simple-audio-card,name = "rsnd-ak4613";
+		simple-audio-card,format = "left_j";
+		simple-audio-card,bitclock-master = <&sndcpu>;
+		simple-audio-card,frame-master = <&sndcpu>;
+
+		sndcodec: simple-audio-card,codec {
+			sound-dai = <&ak4613>;
+		};
+
+		sndcpu: simple-audio-card,cpu {
+			sound-dai = <&rcar_sound>;
+		};
+	};
+
 	vga {
 		compatible = "vga-connector";
 
-- 
2.53.0


