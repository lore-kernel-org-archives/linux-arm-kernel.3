Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC96CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 11:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3MyKOLv1phDkTXXufKrW4U+8URaiOhtHoBu2bsKAnpA=; b=26veZLB5sYR6GPfpwmBrgm3SNe
	3noqBNAK5a+BnVN2FJBZZWJpFXvFRJSi5s6G7utqdsDoWEjQ+cDgezCpb5FndGh8wqNWyislWeMjk
	yJAX1LitLCk8jifh1IoSl0LNJPcEOqQdZ6sVZETkrjeLpI1Nw77jlAx4VWiFaQJXNHCaFZbTSUgvI
	I37tIXXM+gxCXWh1WUI8/ohwZ7VdrGz0N5DJd1Rqv465QZ3TPmG74OAp0skO8Gjh13ZpaCzHYFSLj
	G+VTkIMhuZbdB0IvlPnRonZXbWi/GB7btSwZWbUwvF4Z63OSu1ITdVneTZyCg8Yu9swbwHUvIMNQs
	6rW5ZdSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2Gl-00000004i3X-1II6;
	Sat, 17 Oct 2026 11:08:07 +0000
Received: from ocn-ckd-mts-116c31.ocn.ad.jp ([122.28.98.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2Gh-00000004i2q-0p4U;
	Sat, 17 Oct 2026 11:08:05 +0000
Received: from ocn-spm-mts-104c1.ocn.ad.jp (ocn-spm-mts-104c1.ocn.ad.jp [153.128.190.232])
	by ocn-ckd-mts-116c31.ocn.ad.jp (Postfix) with ESMTP id 6BE6F50002D0D;
	Sat, 17 Oct 2026 20:07:54 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=docomonet.jp;
	s=20240125; t=1792235274;
	bh=hGNhfkcn2Z86vETcyytxBZgfY0XAKYhXjXZeArvSo78=;
	h=From:To:Cc:Subject:Date:From;
	b=dTI3Wf69wJ5HdmIQvwNn0MljM6LiutyytSYs0z3dqy0PJOoe5GOtmeno+fiLW6mNa
	 oARwd4wOJFMkKu/8LFbvXI97wmh0sPnVKeeKMn4MNWuJ74KhOSgMkLfTXAqYkstXcw
	 hLZECeKh96EuSTMpfbUK4b1D4/MeuLAIzkbfxTYI=
Received: from ocn-vc-mts-109c1.ocn.ad.jp ([153.149.236.232])
 by ocn-spm-mts-104c1 with ngmta
 id a1331e1e-18df4c7c813ef527; Sat, 17 Oct 2026 20:07:54 +0900
Received: from ocn-sdpx-mts-110c1.ocn.ad.jp ([153.128.117.202])
 by ocn-vc-mts-109c1 with ngmta
 id 596d86f8-18df4c7c63057845; Sat, 17 Oct 2026 20:07:54 +0900
Received: from X870E-AORUS-MASTER.kkp-group.com (p3688129-ipoe.ipoe.ocn.ne.jp [153.238.101.128])
	by ocn-sdpx-mts-110c1.ocn.ad.jp (Postfix) with ESMTPA;
	Sat, 17 Oct 2026 20:07:53 +0900 (JST)
From: Shigeaki Asai <y-asai.0816@docomonet.jp>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shigeaki Asai <y-asai.0816@docomonet.jp>
Subject: [PATCH] arm64: dts: amlogic: odroid-go-ultra: use the RK818 RTC as rtc0
Date: Sat, 17 Oct 2026 20:07:43 +0900
Message-ID: <20261017110743.3555391-1-y-asai.0816@docomonet.jp>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040803_643956_B3B5655A 
X-CRM114-Status: GOOD (  10.61  )
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

The ODROID-GO Ultra has two PMICs with an RTC each, RK818 and RK817,
and the SoC has the meson virtual RTC. Only vrtc has an alias, rtc0.

An RTC without an alias takes the lowest free number, and the RK817
RTC registers early, so it usually becomes rtc0, the RTC the system
time is set from at boot. The RK817 RTC seems to run without a 32kHz
crystal on this board: it ran about 1.5% fast while the board was on
and 14-17% slow while it was off. The RK818 RTC keeps time well:
with it as rtc0, the clock was off by less than a second after the
board was off, with no charger connected, for 12 hours 40 minutes.

Use the RK818 RTC as rtc0, and give the other two RTCs an alias as
well, so that the numbering does not depend on probe order.

Fixes: 62e73f000696 ("arm64: dts: amlogic: add initial Odroid Go Ultra DTS")
Assisted-by: claude-opus-5-5
Signed-off-by: Shigeaki Asai <y-asai.0816@docomonet.jp>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index 348baa4e6d84..86902f68d7d4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -18,7 +18,9 @@ / {
 
 	aliases {
 		serial0 = &uart_AO;
-		rtc0 = &vrtc;
+		rtc0 = &rk818;
+		rtc1 = &vrtc;
+		rtc2 = &rk817;
 	};
 
 	adc-joystick-left {
-- 
2.43.0


