Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36077C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=; b=nJxjBM+DICXo4cg/cFhepb+4Vj
	rxvaUdvnjcDG8oucHGPymQFBeoUdE466BrnrnC+ZQuR8Aw1PofxNFLtSorzE1ecgWtXCMUasd8btY
	GjEyhXIk2mn+p2vOe1qJp0iYM1J4y3zmpTJMK+eZ1sagrUgEDZbNPJlxwzjhkXrPVgYMZSFrvkyOQ
	8k2ZwdqmEh+5cw6Q8fQx+K3kV9Ety+CsvX0UwSR/7BVJclTGyceGF+sfJM00GjS79xAmLAkLrzzJ/
	ijqa4jFupDvC9F236nokviTBGpm1g6kv/A8DQnNHWXNU22QjnUwIRBAd0fsyrk78BvhWuZhj+UJOp
	DX5gPsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uCv-0000000GFD8-11ks;
	Sat, 19 Sep 2026 12:30:17 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uCf-0000000GF2l-2nkJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:30:02 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79f7so11239435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 05:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789821001; x=1790425801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=Jbx8ntBapRdORN2yWHUYUMGbCEhP9G1xem4Nt+1+7AUHL5x/iDjL+h2HkyOm7Qh9YW
         jLJWpqGQS+ANOJAk7RJwwuDV7npI9VGF94xsrjs5EoyMplueCn8MtfJmjHZ3pvYhXofZ
         LujArwWSHyvijuvbN6q3BYEbHuhIfRghHHVoxZtTldwXn+MY8vviBB/eHxK+ykby5mpQ
         l/4Lr9S1u/Y2U0MqulQ09/yuRO6EAtOLFSA+83CDYqZIAx8qqZYKAQ3TddwBT4wLbgaZ
         lauLUiPYoSnGlApHIOupvZbaiuqis0htAvFjIw8n16IcWwX/795h30Z0e1LU6arbFqHu
         An+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789821001; x=1790425801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=0xWY9XIvojfSlvR5Z9cDPsfSGPgJG2kqQDvx8lv9n3yOAXRjeLSccnX7XnQ6UowGkY
         hxI2f+XZom8x1V9DDydnpbOmB/KOKv84eFYboN33EmI6PUw0MEwHFdDVZoU73VGiST7s
         rWvsUfr47mbyB15juLhp7ykGUqD7iiKLN0MkdWlXBmng0iE4VI+F6puuWM2tlSU/FjdL
         g4SIt08VxfpZ1Wo5Xhj88RtUVu75xev5KPk/I1u2lLmv5yebDDzu7uWMoTX9U5j0DkR1
         CBi3yCClfW9vFgMJI1JDwrDlmy1R6Qt5a57GSYnAorTTiR5sCLcjxw0G+uY5k125EaTX
         hefg==
X-Forwarded-Encrypted: i=1; AKwUvBwSkZGNaV/+BXcTQMsX3o94Cm6+fXnBJ01YMX1WoGZCbYO0KS5aHZD7CWsEIcWjI4ZWiOFMWG8TkXZbkhz2ZLYI@lists.infradead.org
X-Gm-Message-State: AFuF++mlLDuIphtXcL2qJ9p+54pmMwppTlNqmHHdhH7nBpfqCMJ3d5hk
	+ThoV1L6JKYopQeWbvauD+o4/9NNI7g+FhukrMgqZlD29KqZYlMZuRKg
X-Gm-Gg: AYBFou3R/BvnvDYIYOGP457hBVIj4L0LmoYeS4wBlZrOZiEXI9LUEYdRHU39tMCluDU
	t9N7ccNEK4bZhI9ttXvuqYD0kbeFx+rq+RzGejqRHyLXzfbvb51bHX/k7e+7nDTgFZSsBfav2o6
	jMFRr5dmE+pyQLrEa+0xfS6MMXIm//fkZpKPmLWbXx8v+gs+cYLUb2qsNrk5t92fOJhfJ9b6bW9
	dkorJgZMfPFYZI1qgMVGtTKqPn8j13r8PAGogqpy59DlUpp35rxPv5utZL0OKFQdI+s5ltxW6OR
	GvV0aDx97OKsrjkWb2jNB8fnql6cJ3tBi1djH02tBsCFxWwx+FT96L6qnyz6TLNPne3NK97uNVw
	btF2Lpzl3DoP0ENY/bJovklJV2fQFELaG9E8zv3D/zoBGyDAO4PdChqIeTCBsRuGI9bBiPyk6gl
	lkQkl/rFLgdwtcB91Y9BlEeWZ4I7QHUNiYpFZJlcZk3jH6ySGYrqEcjGIgBBFEWYQgQjIW1vccH
	pBwFljGG0I=
X-Received: by 2002:a17:902:e946:b0:2dd:c0ff:e72a with SMTP id d9443c01a7336-2ddc0ffe9a0mr29054485ad.60.1789821001018;
        Sat, 19 Sep 2026 05:30:01 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm9552155ad.66.2026.09.19.05.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:30:00 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v2 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Sat, 19 Sep 2026 20:29:30 +0800
Message-ID: <20260919122930.1418-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_053001_715016_AF916A37 
X-CRM114-Status: GOOD (  14.21  )
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

poweroff on this board drops the rails and immediately brings them back
up, so it reboots instead of staying off and U-Boot reports a power-on
reset.

Firefly's BSP drives GPIO1_D0 and GPIO1_B5 low during shutdown, before
writing the RK808's shutdown bit. Mainline does not describe GPIO1_D0 at
all, and describes GPIO1_B5 as the backlight enable GPIO - the vendor's
own backlight node has no enable GPIO. Nothing therefore releases either
line at power-off, and while the backlight owns GPIO1_B5 it can hold it
asserted, which is enough to make the board come back up on its own.

Describe both lines in the PMIC node and drop the backlight enable-gpios,
with the settle time the vendor uses.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..75b75fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -27,7 +27,6 @@ chosen {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		enable-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
 		pwms = <&pwm0 0 25000 0>;
 		brightness-levels = <
 			  0   1   2   3   4   5   6   7
@@ -327,6 +326,9 @@ rk808: pmic@1b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		system-power-controller;
+		power-hold-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>,
+				   <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
+		power-hold-delay-ms = <200>;
 		wakeup-source;
 
 		vcc1-supply = <&vcc_sys>;
-- 
2.55.0.windows.3


