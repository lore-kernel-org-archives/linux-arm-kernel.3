Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED3CF55132
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 05:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXZGUlaRb0Eje5wK/KO2zNOPWcHbRREyb47Kg+nZl20=; b=RDojoomi3CbIM4Wuzmv74YA7+I
	uhER6e3jmkS/NXQd6kfnRwuI+DLGVNyVUhIWX2Qy1qiQHpmPxtLdt8+F7qTu/K9WH9C6cS/RgJ6Fs
	epuSG51XGqiz6yIe4DmELLiSMMhivSp0vP1l2djhZDWYzfBErSY69n/3JyyqbIcbmDqK27EW5E1l2
	3rb1qxNSqGV9pwvu8MQCJRgm/tA5qfXjCYAVP0HDQXZvzm8v//Z7llewSfHrZBT6VdHYNG3kFXRdm
	6PjLmdQT5HksDNTokOm0MMc8oAS7LCm3Q7GTBqaCVzySLyN32ex0Ps0xDP4DLO1GQWIrfyHMtRbvi
	5vbRw4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz6Wa-00000005iZI-2NYD;
	Sun, 08 Mar 2026 05:17:56 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz6WU-00000005iXq-3lRv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 05:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XXZGUlaRb0Eje5wK/KO2zNOPWcHbRREyb47Kg+nZl20=; b=hyYLjF6wgfnyH9wPSYq1laaNpT
	FkqcbaBrE/8mbOPvV+hmgGzWBJ1S9ViQN59mKoGOIpnQPO3An+jyBc0tD4Mz5TC/lHUcnMuh4byIw
	dFVWDb36RR2aCvs6pKQ2dNQuIwkmgFZQo3nrkmJVg+mrpJ5vNg3p9nBWfPXVj6aEVTVKh6/1yY0wi
	6waqNkXY2XLwJIk/POqBWYkuggCstsMBuDLSiAMwjqDgcj2acjokcmt+ldzkncEtC4HmaG2T6XiaD
	NabG1QT+FemBJkVvvoIJqmPjZ7JStzUX314RfFwPoWsbMmZpIV0NL1FA3PeVO2j7wIbKUX6VJRli+
	xr+nasKQ==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vz6WR-00000007XH6-2UYt;
	Sun, 08 Mar 2026 06:17:47 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 08 Mar 2026 06:16:51 +0100
Subject: [PATCH 1/2] arm64: dts: allwinner: h616: declare r_pio as
 interrupt controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-rc2-boot-hang-v1-1-d792d1a78dfd@mmpsystems.pl>
References: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
In-Reply-To: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772947022; l=1038;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=JOxuT6FVbbvVPIn4RCxjy1V493HaKJzJyXP0whAIXO0=;
 b=GvKEovrQjw0tRC33e40KVrc9oE7hZGA2efZkp/YkAPjZ8Yjt8ZIc7pxWBOu1MD3C4cMidHD5j
 Xg1/3Vo7b16CAjfe9pV8+2KpdyVEqdmO7Ge6bPh2AAfCaY1CSXyN4mS
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_211752_345223_366D3982 
X-CRM114-Status: UNSURE (   8.81  )
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

The R_PIO pin controller provides GPIO interrupts to the PL bank but the
device tree currently does not describe it as an interrupt controller.

Add the missing interrupt-controller and #interrupt-cells properties so
that boards using PL bank GPIO interrupts can reference it as interrupt
parrent.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
Tested-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 8d1110c14bad..2d714dbf1b70 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -964,6 +964,8 @@ r_pio: pinctrl@7022000 {
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
 
 			/omit-if-no-ref/
 			r_i2c_pins: r-i2c-pins {

-- 
2.43.0


