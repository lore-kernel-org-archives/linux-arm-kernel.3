Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B590CF43688
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bfx46WdZhqu8lztj9xyqAvU04DecckJObsgTFL6vuC8=; b=lJNbbe3f7jZmCvl6HDi7gjWxjR
	Sn3sJEWF4BGXQr/uhivBMskdv5BQzW07vDPazwjTa6M8xUekmmJHGY1I4s35pcZgp/r8Ffsybonzk
	lLP4MWe0YPXpK3RnmikSEgOOLv3ckF4GjSXfUOd6BY+aaw1ITEUwz8lzrzwIlxzo61PisBrcy1TcY
	DNLat+tYbd9P5S94Nvkmf7srfrGVqlzDMoZdN8hNw9HmbPG8meT5JFe0TseiUjb22KCBQde8lvdo8
	pS+hgeiha66iXSEU3tILQCrb0rlAIC0y9RvVLqLmjsaMjD+pYrwiHv+L1y1vpz3Erms0z6XVaTgZU
	E/miRdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfU6-00000003nMM-3YK9;
	Fri, 17 Apr 2026 09:27:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSF-00000003l5y-3guK;
	Fri, 17 Apr 2026 09:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Bfx46WdZhqu8lztj9xyqAvU04DecckJObsgTFL6vuC8=; b=MY+4v49aIAF+VXmOQOT8xujfHG
	PajmNAiuXJMKmgqT0lZhir280JRUjow54x6bAr5+nM95nX3ZzJCKo0uIsL/Da3ztQFuMKquL6XcDW
	aAyuYLNyCvZ7wrDkFof0+URNoIzrK7nQWI2ZyUYqfc6dttVNjgAjUcIjfDeu18CHAAtZt3xoUPYnn
	sr/KrPOLXmK1p4MdDmoAcOA+5cb9C0BS1dzackna/t/nNsKV81ird/L85bqo1Evcj25VpFReTz+Us
	fnnLG3OGCaBQ8yB+/rpjiLsvbgKIz4SfQs6T1nb8Z9IocuKUPCB2y/zeZCHj+9lzWOQ+93LmJJnfL
	VU6cHidA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSC-000000054Pc-1T2c;
	Fri, 17 Apr 2026 09:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417929;
	bh=Y4Y7VbsW5TifY4+vjA71M9IRvPES5OLSFIKw/ni17Ng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nXIEsiTmsgTFtkztQlyfSFzXMaiZmOsE+o6PgPRrX+BormzVo0Z7rAc7DoDBidcjt
	 Ir/EF6G3556SWi8bE2IB6vIakU0BPXQL6nJJXaVfH+X3b/AvwPG2ae/sKPO0cjCAtG
	 QNRHIAxbJUKSiPVG3J2isZ5xcUVUVaJ7DUjUWHxaHWcgGrNMv0I8jMFmVCyRG3mBti
	 gTZgY+QTTF3fVZxc6klSS5BXJu7PRlmrsByx1lZIYAYx8dDt+YazcgdHUzsNrKgwvV
	 ol7WrJcyWchHfjoxvpvQeKwG79+RSiFGZoP20iCmF2eI3r8Dlerzgs0s05f0UXmK2K
	 9oHI75vtl2dPA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23DEA17E1274;
	Fri, 17 Apr 2026 11:25:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:00 +0300
Subject: [PATCH 26/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-rock-5-itx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-26-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_102536_516919_CC70AD88 
X-CRM114-Status: GOOD (  10.40  )
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

The board exposes the GPIO4_B1 line to control the voltage bias on the
HDMI1 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI1 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index f7dd01d6fa0a..1f4c1eb7a8c6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -347,7 +347,8 @@ &gpu {
 
 &hdmi1 {
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
-		     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -696,6 +697,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int: rtc-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0


