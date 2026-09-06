Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39692C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R/mSQMe/ffg+AP+VO4769NtESa1TU8r20BVXKonSb5k=; b=xVn4ErhkrT0SLsC1MMDXzTK6e4
	OnOkO8gML8yHbPbJwRH0ak5+dLYpzc9qUtvVLsLFHvlnT/CokSNGR2iV89ajsB8E1n0qbe+wEWf3a
	sAkkPte1Q7epUdD+iuoen1iILrJtOpqCqcZlHwUE/G4hdEPVMAOY7k+Ax7vvqbzQi2f4YG7HUIa6t
	NsfBS7MnWMy7UG4IoMWRJ3yBEQ1AKh1AYuo29t7lmCSpsuRqp8Cc53jaf6KMgjJq1FC+UvZ/QTz3J
	FIaaAqFoCHjMGyxveDFsqBt+8g/D0UBLBHiANScQHMhbMLxHJdBaXN0HVAejwlrAX/mOoyAtsjTql
	ZQnX6R8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3HQU-00000005I9c-0haV;
	Sun, 06 Sep 2026 18:17:10 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3HQS-00000005I7N-0DYb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 18:17:09 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4858a186d5bso171505f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 11:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788718625; x=1789323425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/mSQMe/ffg+AP+VO4769NtESa1TU8r20BVXKonSb5k=;
        b=ZBdER1wr/KHzdRTH00VTRhtp6RVwFLJdmbiZuF8HpYo/ZK5z+xNIMsuw6eTNn7HRxs
         OVCjNm6CdEG2AzD3S+Svv6aX3KIt/GA1mcbEehWrahxURG3jSv0tgcDRW81D2p5/zTSK
         9nt7oMqDxHS2Trb2g2WhvazWMcTaCBI6greehL+WuWIUU/YXdXsoWP0+0VRKHxBzDjRI
         QnXmFYm7jjT2JDbmSrPP31tiKfJFp4dnYxq63/WyqFMioqnjhD9O3bP3dTJszJOXUD1Q
         xsunJzracWHu/odlCszju9j9YG5GgYEKRSrd8EQydC28r3cPJAUAfDuYlXKBPtyIPZl1
         nXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788718625; x=1789323425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/mSQMe/ffg+AP+VO4769NtESa1TU8r20BVXKonSb5k=;
        b=eY4HDjy9vYT0ytAH8VYwZkrd2en4NFqyOWoGoJSuycdEVyBryxprK+Ge4WwhotSzuX
         SG3mBBqNgW6SGFf0AHoF5n4wFnjBWUaehXrafnidTcb6+kxl14X63VtcJ87h6tFxZRKu
         A9z840Xr4OhRe8wYnn9xXzVwUWtu2iPRif2JgtCSldsurxP2G5cqK6GAOVVhP2wxC8HE
         J4SPXjuBxwVZXQWD9/MFY7ptD+8+RXS9Wd25ws9hrWkKQ4Vun6bgO8VxGUflK3FSLPLv
         SFw70DtVinNhCMSMKhJFUu0rghVEeEIehqjWTdgepgVnB0RsSCeStQYwLTrdx+rZkwVl
         WjMQ==
X-Forwarded-Encrypted: i=1; AKwUvByM1OMDFLIPhpnI2mkinr05sBmGwNgQSRcqSEsgRl0ickc4S0G5KorgKvPHYLqdaTkxz6TwDzJac10gz2lAY4Pv@lists.infradead.org
X-Gm-Message-State: AFuF++kOO4rUyavaYAUXzBBgdFEe9E/jVheefvpfQTQhf0pn6UoRW1lV
	ZnI8QlAqvCgnzm1RiaLwFiBRtFTfsePrrMpC0+P2uWM6+fP9xt7ewkjK
X-Gm-Gg: AYBFou2DmzHwLUdmg7ycLC2rS+lrkyR2oCVx17d8aJcOJuceGW3EkDKkgQ2ehoqsLiG
	NhO2zup3S2hYsQDLgHWT+GfFifXUTUv51JhTkQnZdhoyGj5yxRpiHOfVk/ER+iumhJt/erWUIqq
	oW7Yam++1MckVmaLmPfgtpRhkyXnR3aq1W/xbrWf4JavwePt+IL9vP8NNc+R+CKK+vDpHkvV9Pc
	Dt9XN8HMdcg4XYfRB+tb9sbWAHZgv7FdEk14wfBsxxIg13N5XFBgYNbpWBCsya6ip4So2f+RmF0
	H92/+15oh+WUrUlmU2dPQubV6kiZmwSj42vAWJ7JsIsK0q8npzTZj3xYCZKkCKo/C3vCcKJndfM
	rdhPKo98+o8Mp7FyW2PItwtxFXcQ1amFyZaQDEpZ+FiDt+hyr+jeDlb7BYdZm0ASAWns8mFENy/
	on4l9P7Up8rFzQAI4RlecTJ96k3x//SnwnNUxCY0hPgX52F7pw6CFvjCCa+7i+x0Gj5WOy8OzEv
	3gJXcgu12HvIT6GIrOzzv/SUhhbimtHVCi2YiXciBVlcZpHxDAr3Tu5icD3TRp/b84hj3wCURPQ
	h3c=
X-Received: by 2002:a05:600c:c494:b0:49b:916a:e553 with SMTP id 5b1f17b1804b1-49d010c2a57mr100932445e9.0.1788718625331;
        Sun, 06 Sep 2026 11:17:05 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B886400ACFAF9D8E9019935.dsl.pool.telekom.hu. [2001:4c4e:1b88:6400:acfa:f9d8:e901:9935])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm433916725e9.1.2026.09.06.11.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 11:17:04 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Ondrej Jirman <megi@xff.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: fix hym8563 interrupt pin on Orange Pi 5 Plus
Date: Sun,  6 Sep 2026 20:16:22 +0200
Message-ID: <20260906181622.11991-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_111708_112189_AFB59430 
X-CRM114-Status: GOOD (  19.67  )
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

The interrupt line of the hym8563 RTC on the Orange Pi 5 Plus is routed
to GPIO0_C6, not GPIO0_B0. The vendor device tree uses RK_PC6 with a
pull-up for this pin; the mainline board file uses RK_PB0, which is not
connected to the RTC.

As a result the alarm interrupt never reaches the SoC, so the RTC alarm
cannot wake the board: rtcwake enters s2idle and the board never
returns, which looks like a hang.

This was verified on the board by enabling the alarm interrupt (AIE with
AF already set, so INT# is asserted) and sampling the EXT_PORT register
of all five GPIO banks: GPIO0_C6 is the only pad that follows AIE
(high with AIE=0, low with AIE=1, across repeated cycles), while GPIO0_B0
stays high and its interrupt counter stays at zero.

Switch the interrupt and its pinctrl entry to GPIO0_C6 and use a pull-up,
as the vendor tree does for this open-drain line.

With this change the alarm interrupt fires while the system is running
and the RTC wakes the board from s2idle ('PM: Triggering wakeup from
IRQ 52'); before it, rtcwake never returned.

Fixes: 236d225e1ee7 ("arm64: dts: rockchip: Add board device tree for rk3588-orangepi-5-plus")
Cc: stable@vger.kernel.org
Assisted-by: LLM checkpatch dtbs_check
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Notes for reviewers (not part of the commit message):

Measured on an Orange Pi 5 Plus with the vendor-style method described above
(GPIO0 EXT_PORT sampled while toggling the alarm interrupt enable); the vendor
device tree for this board uses RK_PC6 with a pull-up. With the fix the alarm
IRQ fires at runtime and the RTC wakes the SoC from s2idle. Note that on this
board the resume itself can still stall later in the USB 2.0 host controllers
(a separate, unrelated issue being looked at); it does not affect this fix.

 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 145986695720..572b892e4066 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -189,7 +189,7 @@ &hdptxphy1 {
 
 &hym8563 {
 	interrupt-parent = <&gpio0>;
-	interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+	interrupts = <RK_PC6 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hym8563_int>;
 };
@@ -298,7 +298,7 @@ hdmi1_tx_on_h: hdmi1-tx-on-h {
 
 	hym8563 {
 		hym8563_int: hym8563-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 

base-commit: 1fc5a74b108fc90951890ec513ac81869f5eaff1
-- 
2.43.0


