Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A545CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21AZHTqybSb5OmbtTVjNOZNhbq9KmR6x57mgJmfZhKk=; b=IF/hKZxWpGeF3QmiX/qPxXr+Zp
	Vq5ssRHxoSeFPm+ND82X0vkZV7vxGyrxID+e8wo3PwT3WsVK6a0xt1mOcFggfUBzVorH6EHhWDoso
	DdWOhevXc/srnGGFP0UAEl34N1jlyo1P4JtXvXF09Y1/MCDhYH6JmpHKTcV7igHyLvuGKP0VNWN4Y
	Rz6x0GpbZwp3jE7s6L46+h55cwKg6KA6fl0fzrvFBxBv/MCvCIvhurssee5gUEFX0SYOpRX6P2CD1
	t0AYHia9F8GQ+ZrCHlN49yhF2ieB4guSTTqeM39xeg+nzNOvfQbFLbLHN780iHKX2dg/ku2+27mrJ
	kEaLRN1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxNRJ-0000000EISO-2ypP;
	Sat, 13 Sep 2025 10:25:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxNRG-0000000EIQ1-0Uf7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 10:25:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 433FD44405;
	Sat, 13 Sep 2025 10:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA168C4CEF4;
	Sat, 13 Sep 2025 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757759101;
	bh=7AISgck/ZfKlMuH4s1xfIjU+tBk3KnXivPq4YLbqruY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tyj2oI2RMRQskhiT81MTqum2l6GhYqY0PwIRVt4nqfJRTrm3cfoNVuhHJKl17KV3B
	 4iRQvig9nVX+PBxa4lq9SpVAWPSzIwAZHRWHzrbfOXELt/o1uBDgzYAPLXuesKqYQa
	 LF6B8O+C02ZS5EuLrVyhNC4NmzHGVbgd4dZdz53VUiqJzvABTQgZOtmaQZ4m37oPlF
	 pQg969k78J4vJtPSlKvNL3IjKTKh+7uGupXQDJMTNfRschgeQKaTYEwpt9WQB7joQz
	 hNXN7batDHUgvVlZvZS+wxX0tYSqIoQ18SQhW5V7kgNYLOUH9B7wukwGU7AHTHONlw
	 TtM6J9DZrq7dQ==
Received: by wens.tw (Postfix, from userid 1000)
	id BAADB5FE35; Sat, 13 Sep 2025 18:24:58 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: allwinner: t527: orangepi-4a: hook up external 32k crystal
Date: Sat, 13 Sep 2025 18:24:50 +0800
Message-Id: <20250913102450.3935943-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250913102450.3935943-1-wens@kernel.org>
References: <20250913102450.3935943-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_032502_194096_A1B64FE8 
X-CRM114-Status: GOOD (  11.43  )
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

From: Chen-Yu Tsai <wens@csie.org>

When the board was added, its external 32.768 KHz crystal was described
but not hooked up correctly. This meant the device had to fall back to
the SoC's internal oscillator or divide a 32 KHz clock from the main
oscillator, neither of which are accurate for the RTC. As a result the
RTC clock will drift badly.

Hook the crystal up to the RTC block and request the correct clock rate.

Fixes: de713ccb9934 ("arm64: dts: allwinner: t527: Add OrangePi 4A board")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index fb5311a46c2e..f71860db83d3 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -393,6 +393,14 @@ &r_pio {
 	vcc-pm-supply = <&reg_bldo2>;
 };
 
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc24M>,
+		 <&r_ccu CLK_R_AHB>, <&ext_osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+	assigned-clocks = <&rtc CLK_OSC32K>;
+	assigned-clock-rates = <32768>;
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.39.5


