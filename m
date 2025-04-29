Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C744C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3hn7TI/NIifsiTf4RtEzy2zuXp6Q4rhXJuOfP6jWeJw=; b=w8kYG+4xM+a7l+3RUOSZskrFcY
	pt7qFb2Yz7XWm3HaP8efziWa40q4wwfZH0kl7Fl5Rz/fAHToPgTDwKah59LcQh1vF6g5mD4BvuMwO
	KQScfDPyTAAGx1nHqj32bsMNZ1XgUbAHqqPVxLYzug0XBkjf3zkKKinRANxtUW9lTFdGbV8xSqFN5
	F8nxzLvw9vFP2xFB3CYzJuR9Ie9ji6RZ5nijD8ELAPm/5uW7c+BQqGG5m045WJ7oO6Ezr9gcvFnZS
	LDP1oAAJodvJApqHaKILUNGa4vOotkNJiEz8JuifVBpZFJ5cYDjO5y7bncBYLAtX/Su89rlA+EVeW
	bsUDxp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oHx-0000000AL1J-10fw;
	Tue, 29 Apr 2025 16:58:33 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oC6-0000000AKHG-310w;
	Tue, 29 Apr 2025 16:52:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745945533; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IQBQTzconYJkqWZwYVbRGCr0fE2QNxTFfE3QMFz6gVJvqqjVNRcp2WzYj6h+XjBoGDtnOwgRXtU4MQotaYUT7/jbbr50Xbg6I79CiNY/zyud3E4Q9mX8xFOoKJLaFQUUaZnfQaOFpSxS+znfdhhs0wQeqrvItZnZemNMOS1zkSs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745945533; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3hn7TI/NIifsiTf4RtEzy2zuXp6Q4rhXJuOfP6jWeJw=; 
	b=YKACafeXthLiyZt4GzZHB89ADiQiUemvk91QX01rpznlzPVelZ2D700U4mpJudnJD+Z1zzaKxOXvPQae3EwQjLwwZW5WzluKVEApp0yGf30eDKkAfX0R0N90PMas83qOyh2CmGBWY8pHImSW5+uIglGNU7pPcWl1HfXVVf+MGgg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745945532;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=3hn7TI/NIifsiTf4RtEzy2zuXp6Q4rhXJuOfP6jWeJw=;
	b=LrKvbKunSVI/bXi0eGOSIhTtqmEIxNKK8+JHQmS6zxTAqs7D9di/oS1wd8kmygIq
	+KVSl52vk2D2C+eLPatAmN+tCgO71mESSy3jpjvZwPNZMB6GbnAsdvjQ4pIr7P2ubrr
	ITZukGJ3wGH7l9tGmZqoP+i2VQkKYTKRsExjpbJM=
Received: by mx.zohomail.com with SMTPS id 1745945531729697.7459362757056;
	Tue, 29 Apr 2025 09:52:11 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 29 Apr 2025 18:51:55 +0200
Subject: [PATCH] arm64: dts: rockchip: fix Sige5 RTC interrupt pin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-sige5-rtc-oopsie-v1-1-8686767d0f1f@collabora.com>
X-B4-Tracking: v=1; b=H4sIAKoDEWgC/y3MQQ6CMBCF4as0s3YSrDZFrmJY1DLiLGhxphgSw
 t1txOX/kvdtoCRMCp3ZQOjDyjnVOJ8MxFdIIyEPtcE21jVXe0PlkRxKiZjzrEw4XKIL3nvyoYV
 6m4WevP7Ie3+00HupcjlGeAQljHmauHQm0Vrwr7fQ7/sXWxEMNZMAAAA=
X-Change-ID: 20250429-sige5-rtc-oopsie-d3c5a777e7a8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_095230_845467_115E18CB 
X-CRM114-Status: GOOD (  12.21  )
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

Someone made a typo when they added the RTC to the Sige5 DTS, which
resulted in it using interrupts from GPIO0 B0 instead of GPIO0 A0. The
pinctrl entry for it wasn't typoed though, curiously enough.

The Sige5 v1.1 schematic was used to verify that GPIO0 A0 is the correct
pin for the RTC wakeup interrupt, so let's change it to that.

Fixes: 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 board")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 964ee351d3b63fcb4ede70f4b6c06541715cfe19..570252c4c0bfe56a3c269e47d81fca7676e61787 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -616,7 +616,7 @@ hym8563: rtc@51 {
 		reg = <0x51>;
 		clock-output-names = "hym8563";
 		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <RK_PA0 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hym8563_int>;
 		wakeup-source;

---
base-commit: 05c58e5408604391298fccf956f8cd0a4662da73
change-id: 20250429-sige5-rtc-oopsie-d3c5a777e7a8

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


