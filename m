Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EF7C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 18:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dpxuBRogWor3q4lMth7t3PBdJyoOLprduS4IK1yfNYE=; b=utURZuOx4QnC2/b42H5uBf/LAX
	Q8vz/utOLuHiLb7UgRrZ3BYQ+GVoWb+FQguvQRSIzS7/yTY/lfmNTg9ktT/1QEWj+G/p6OO7tPeUD
	ENVSAfANM2sCidxAzSuBlR3yxhSGo+wwrmpzShAaXRdfoZwAdE0ixCdleHm1NNWbEzNYjCnyg1+1+
	9TsrBNAhiLZqbkmyOYV+2MdzWLnWtD7C30wFukXNS58RI9m/WYjs7H+VQdaEXSN84icnJeKZlGyQ2
	9kOnGNmn8jqa4V79WSZ4Yb8486Rj+ORJtGKUx8E9FzfRUEMtYL0H5cTIhhG4CvWrq/maSRqLCgVnN
	4BoZd2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyq2-0000000BL2C-2Rf8;
	Tue, 27 May 2025 18:15:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyns-0000000BKpm-063J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 18:13:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4d877dfb3so2830926f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 11:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748369610; x=1748974410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dpxuBRogWor3q4lMth7t3PBdJyoOLprduS4IK1yfNYE=;
        b=Gg/Pt3aBrvc30BrqqZl9Ls+Y5yPLl2B44cuteEcqMiW70RVzUm7MMhxn4oMixvMiOE
         YPSC4wCGblC+rf0cBTi0lMieyRx40GqDkT+5qvajBbYtUQ1+4ApIETuzWYNe7B7+Bj4l
         ufQ/TIS5iPUa4wyo/aeLtbDAydg4OIpHYGcV+BPHxlXaPac56xKKfIKh2ycF8Lxp+Z5J
         iaAI1G24PqOHJLFZw/4TbIQKzElchHn1/xZg7wl41ZA/QSjBCJRpKbxdhrdXav9qzl/d
         /W0NNYoRH8HYJdPRKUn1eR1LOikPf+RAhD/wl68B/FcIB1dQ+y2vcQFuJvtg4S9gujfp
         k09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748369610; x=1748974410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpxuBRogWor3q4lMth7t3PBdJyoOLprduS4IK1yfNYE=;
        b=FQtTI9nwiXOsq5/ynD1TX25jwuHXQMe/RzcYbI34PA3DR79i9TlNWISAce+ZF7jbsc
         6z3j0DyG/wot5KF0+SDOPO8fhONo65xAFupV9XEeg/yJGgosJbyetQAHwXMtvl6LXScK
         HoW2+C5X1PpJVMqjGNpfwvsb7GlWDDb1GPVcJ/jLhS7JKW47Y4wLLq8sptTmmZ+Co6D5
         bxfvDRNTzvmgKp9RsQLOF9YulS18RTv0pDqVNeEuHtN8LPkcfMUL4Fb34QLz/9QGXbFe
         TQImUy9rD7ijHWY5oCitv2d8lF6DvGXGUeze4eM0DWdnQOZT4CczxsO/G5QURZU7lHq9
         osYw==
X-Forwarded-Encrypted: i=1; AJvYcCXbVOqlCQZIHMwEMraWVou1JNrQQhHVaNBy71gwRxHCYuncR1zq8NBtT+TK/c105UJbyM9bsjaPQY5NwKnJAs2A@lists.infradead.org
X-Gm-Message-State: AOJu0YynPh6IKHsRRksvC46mGTO4LH8rLt/pjtd4Ww8TFy3TjW0abbOx
	PCGNIe3YnLWpmh8LhktZXo4YDBhbGktV5gSZUbjeSSrG9qAxYBIDHLR1YElPwxPbISY=
X-Gm-Gg: ASbGncsSq0AMaEH4UuXbqbE8V6UAtiMj3AiRyXHyo/59mac+ABnsLOwBsuYRnbZWjQs
	DayjVdE9hmHmQYxP8PqM3D+9Oj2Wimm218cX2OUltqYujPBe7zSpRSEbGK81U/asKALdfr5K6Ki
	og2WWOjskq98XWwgDlft1RlzzyVcfB+bKUjT7tDA5iJQWuLGYVBkA0kYO5y75QX3xkOP2l6g0y/
	Ys1Ma6el8l+Ms6DFYzHPZkJBGm6igc0gy7726PgGHddtlGN5cvSYRDkUP+nJthCHt0bTDNZbbTR
	IfIMtUc4pi5G15PF2lyycjReOE+IzmQW2vLGj/qdDboaQeJV2xpX/TH5FKHqqIw4WuunTYeGpBF
	mmgw7XtcW01VHQL7eKXxEgrhvRrDS
X-Google-Smtp-Source: AGHT+IGyU3zHzfNm3yCtX8SfqxXihbtdFZqypQaZRfy+BYQa0ZaAr3pKhSRnVElWiW/7T7dSNF3VAQ==
X-Received: by 2002:a05:6000:288b:b0:3a4:e65d:b6d5 with SMTP id ffacd0b85a97d-3a4e65db6demr1273634f8f.1.1748369609987;
        Tue, 27 May 2025 11:13:29 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4e658f96bsm902113f8f.38.2025.05.27.11.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 11:13:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: bcm958625-meraki-mx6x: Use #pwm-cells = <3>
Date: Tue, 27 May 2025 20:13:18 +0200
Message-ID: <20250527181320.373572-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=+dNHJsRHE/JZChzL4jtoYzFUWpe+5i/Vh+Y/tynOtRQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoNgDAW5dubIg6+TqZHBRIzyah2FApIaAYRtXTf pqGRfowoMaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaDYAwAAKCRCPgPtYfRL+ TkZGB/9L3cCZEK+NJYPysI9UUNFEL3UFLYkm0pC5Pc6rhtCooUd7UHPjpFwpnSERFbvwzqjhIir 8ok3PXRe5Vr9IZiZGJEA3jCFTl8fJnG9kaL9NJeFS1di59xHVkQpGJHNUdV3jDe80F/z175+Yi5 31wqH+aUr81mLJdgGkUfANvYr4jAlI6ieCUOKHIiTDUaRrx8sD962dl0NJbcZ1xgUFfExXwq2X0 NiNvFdTnxy2pzSe0g9dDSypBrpdxQgMc9ErQg31gHtRXJz1hdT6h6+E8U3/SAEjKiClfvJerdhC akYjIzxbITlzegy8qZBD4jL9EVhn8tZGs0XaN+nJfCFobCKy
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_111332_070588_1CB02A33 
X-CRM114-Status: GOOD (  12.67  )
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

bcm-nsp.dtsi has #pwm-cells = <3> as is specified in the binding. So to
also use that correct value for bcm958625-meraki-mx6x the property
overriding that value just has to be dropped. This fixes a few warnings
like:

	arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65.dtb: pwm@31000: #pwm-cells: 3 was expected
		from schema $id: http://devicetree.org/schemas/pwm/brcm,iproc-pwm.yaml#

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 .../boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi
index 71a8b77b46f4..7e71aecb7251 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi
@@ -17,21 +17,21 @@ pwm-leds {
 		led-1 {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_RED>;
-			pwms = <&pwm 1 50000>;
+			pwms = <&pwm 1 50000 0>;
 			max-brightness = <255>;
 		};
 
 		led-2 {
 			function = LED_FUNCTION_POWER;
 			color = <LED_COLOR_ID_GREEN>;
-			pwms = <&pwm 2 50000>;
+			pwms = <&pwm 2 50000 0>;
 			max-brightness = <255>;
 		};
 
 		led-3 {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_BLUE>;
-			pwms = <&pwm 3 50000>;
+			pwms = <&pwm 3 50000 0>;
 			max-brightness = <255>;
 		};
 	};
@@ -132,7 +132,6 @@ pwm_leds: pwm_leds {
 
 &pwm {
 	status = "okay";
-	#pwm-cells = <2>;
 };
 
 &uart0 {

base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
2.47.2


