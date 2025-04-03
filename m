Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D683AC3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 11:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e7N6TSglbOMXGrbSWsg3supmWymijubudO7AAYgdgVI=; b=PYIv8afWIz+9WS+dWj/TwTUKgp
	sppc6SzLQx8/vPzo2+QcPv9xop4XGEGw6yicnAiXBi7HdpLfAp2gh8tgF/Pyc20eMCdZjkFiMUT5H
	19GBUjGZ259wbRrfUKkZfFXDvNjPZjmeDOx1P3lndfu5NFBlwO7XEFNXKhRqFfn+QNHGB4h2RKE7P
	kEGG6eEXOk3CZ8WJoNLEojMG6w00AInjVb/1zaOShpegBwM5yb7Qn1dL4tTWrs/WbTXnP15lu2B2H
	EjoiFx1v/f5hRtCninAyN6BwdHzkSW5g/n2PUFHu/vx2pt5p+0Unv9mKVhvX5SgPcpq0Vj6F+/HEk
	p1r7d0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ib2-00000008gaZ-1sn3;
	Thu, 03 Apr 2025 11:18:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0I8V-00000008cak-0mG6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 10:49:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43948021a45so6739775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 03:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743677365; x=1744282165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7N6TSglbOMXGrbSWsg3supmWymijubudO7AAYgdgVI=;
        b=ci1Cov/yvihnBkOjxy+wLdsrXlY7xOWRPWc39x4WKkBPJumbWu5Lm7liGltRgYb+gm
         xh0u9d9cYzJxxiYs+VbdbeGXR98RcDoctWRymqwlz2VHawwUHcEa+QYAT6ppL1zISnJr
         WNAEtiqXGxeOvwlrRIPdWBxt2gQO/Ix2piSKy8Ppc517N0IqnjtEV0ZKZ8RGDVfODiVJ
         6WdLG2dENerZWoNYD/GP+K8wfeM37o8k3HjucY9WeqCyrgTCd21yIBQhfg26hsR1cNIM
         NvdPP7YmALMX7Zih665PxbS2nFY/HQrQy0X4v9OSuxnQe+sgLIyp2P0YtBq7kgk1MKmq
         xKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677365; x=1744282165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7N6TSglbOMXGrbSWsg3supmWymijubudO7AAYgdgVI=;
        b=xFuUNVY8uDqiMIbarj28lHotugfJRVQo3MLpRsCqmGUsq38n+niJPKQwG8oJihTN7v
         ER9On0gGc0IROLnQLM3HsLR2fyGkNbMs3wdmr735+4RWMjl2vo+NFyvRkzFM8iPTQXpB
         h20/XVap55ySvAbezuhuCYkQ/byU2lxwAU6DH7UZNAvA4iT5yFFIxUoRp0Q3I9ckm6Tf
         2qqshc6TBtmFkuCWwWpJHeTMaa0itIt0GX1le7gfXdT+6dt9KbA5FjTW9pLP5PInLcWo
         R3DD+E7T+dYJ4hgC+lZcF8XBazzbXWCxJGdg98FCnAmlxj+BPRIqUt8x+WMVrIejFcTs
         LXKg==
X-Forwarded-Encrypted: i=1; AJvYcCV5/pvFnOc2o1erxoNTs7k31EZXU1rmdcWnPXxvARN1MY5BQtxRbznYndKANi+feRoxhzCwwdb9p7WpU2r98u4J@lists.infradead.org
X-Gm-Message-State: AOJu0YxYGbCRP85zkdWhH0bo9GiC91i5xF9JTiHYYgTjO3l+3HIy2YAc
	jr06Jlk+CMyPsjOammBu7MPKo8HP6t8f8M1IriyvI4D5NgMegaPVbtjJdlIqXVM=
X-Gm-Gg: ASbGncuTzNzIGkGqjA3D4VEHJ1nHDuw6dC11vzRurGN4vkS9mT2bBMpidEHg1856SKF
	PBZtfqWcvt1KYwCjKgOFI8axhwwrnrG/jOOluK3vEllt1V352Ci2sEwrwHcLerC/QnTYxgNYwzU
	ODnid8VpEfM9JW+VFAjc2GkD0dGki4WvmUIYK/5P1/w0Qe/iieg9B8rqij7sdjIg9yzXnWjEMrW
	58S6FiT5aOH9YNzDl6IEx4Mg3ddt4LCrGquu0QTY7wnDspQwRNUHAMqg6xhxKqa1YdKVEOEnoIg
	Hmct2m2XbB7xoOO+974ZnFzkYWN4sz3TFttzVB6XRIKhmiK2zYzUqRGklf7in8NMCJQU0tOKyp1
	PrCrQxKsGIto=
X-Google-Smtp-Source: AGHT+IF7ppya2Qe7sDdlJauBrlDdBS0DOhdQY6it8f/OoMt81AYudBQET3IpEmjnLoCxmzeRrLg8Fw==
X-Received: by 2002:a05:6000:1aca:b0:391:1458:2233 with SMTP id ffacd0b85a97d-39c120cb5b1mr16403178f8f.11.1743677365072;
        Thu, 03 Apr 2025 03:49:25 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a732asm1476123f8f.30.2025.04.03.03.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:49:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Purva Yeshi <purvayeshi550@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: lpc32xx: Add #pwm-cells property to the two SoC PWMs
Date: Thu,  3 Apr 2025 12:49:14 +0200
Message-ID: <20250403104915.251303-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=PiSeoio2a86WeS2jXJRlVM0CbLy7adADUG+LFiQOMGk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn7merikfyXXV0LsL+fQxBuc+nqdH7dQZ/s7ZfQ 8IOL7u4IGSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ+5nqwAKCRCPgPtYfRL+ TjWwB/0b9e+IY35Xp9g8dPZuyf2cd6XtTWE0FyNuSx1RToEiFcjklGDYgFCtEKABwcKtOBEulek HwZ4A4tHbzhb5jBnciWyaUFZj1wkLoW6qboUr0tx0KMvb5MHhAk9xqlCowUe7338mRaLpij9YLJ ltxRsgek2oj6gC14sGnIONM8I2Bl1SMh0j7RDoCMvS9Kb66HGMe/6t1ixavC5RUxRol2KNwYRRT UOKpKSBkan+bbe2D3N3GMzVsBNO+wJy33UIGVMjyrvyx1bmeuq8AUAgt/PJq1qvLFw/eVy6aKtr j/93vWsR7GlnQJD3O3+rrMGdlerhb/l5KqMU/hSuuIL63uot
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_034927_487137_64E5221D 
X-CRM114-Status: GOOD (  12.82  )
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

If these PWMs are to be used, a #pwm-cells property is necessary. The
right location for that is in the SoC's dtsi file to not make
machine.dts files repeat the value for each usage. Currently the
machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
there are no properties to drop there.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

found while reviewing https://lore.kernel.org/linux-pwm/20250312122750.6391-1-purvayeshi550@gmail.com

Best regards
Uwe

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..4460a1960606 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -481,6 +481,7 @@ pwm1: pwm@4005c000 {
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005c000 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM1>;
+				#pwm-cells = <3>;
 				assigned-clocks = <&clk LPC32XX_CLK_PWM1>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";
@@ -490,6 +491,7 @@ pwm2: pwm@4005c004 {
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005c004 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM2>;
+				#pwm-cells = <3>;
 				assigned-clocks = <&clk LPC32XX_CLK_PWM2>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";
-- 
2.47.2


