Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71908CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHQiv9s65dpo7FDHmAP6xWP3YKRgmxyddilHRLa35UM=; b=0uUUwIC/9ktrfD2QFZoaWluq0D
	BXQtV3mYdH9Kn/JrIMvWZMtsDIg2WIA80HfXLz7F+m8NELUR3ODV6zRSopfAr1n07PKgAWWJycl7+
	eCzxNnvYJtYqPwKSBiP8PomLEnPgF3RjwO/8W+FCEiIro9suUoquQ48d7kn9YKtEwlGDtS413Kj6x
	AJzMeDSkvFLixI3eAvI3x36WpeGEhOAKZaoj+cLNiPWf44q22feq3p2n8+5SnwsOo+SDwHaUq7x55
	9AKPsezWuXDlek1+WKfXBsu+6bZaNm3DgZkSh1vuV2Hy6WHCg+LIUzP+t9bWTY2akSEBia9zEmE+7
	YcsorvEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOT1-00000003oEl-0YuF;
	Thu, 30 Oct 2025 08:57:11 +0000
Received: from pmg.emh-metering.com ([62.153.85.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOSy-00000003oEE-35Sm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:57:10 +0000
Received: from pmg.emh-metering.com (localhost.localdomain [127.0.0.1])
	by pmg.emh-metering.com (Proxmox) with ESMTP id 2E088201A2B;
	Thu, 30 Oct 2025 09:51:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	emh-metering.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:from:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=EMH; bh=MHQiv9s65d
	po7FDHmAP6xWP3YKRgmxyddilHRLa35UM=; b=Bw59v1gNBZSiPl3Mo91zylHTR0
	Z0arcUb+nLgdab2KDuPkoC4Za4CNhc55VGbBNKnQYw49qJrZ8MnBqYMcJ5DThUtk
	EGI2gi5AkG6GbK410FTCFBnMGtWq03/hfIWzJoRFV8kP+cgLG0WRS9u0LB4LYhcO
	sUeO98N+sOyDz86Wb7Ko1TcFbqWUYWiAUXoQQwb/x6W39+FnutNj9mM8HreuKxLY
	93I8YQx7EMtFjlCp0kZC+/1WnQLZzY8ieKYKCp3QgVaJhSI3o6gc9SnFPEnIBuMq
	ORsGKMbK5owlLdPjzGAn9rGh58FRw3kTrQBw3K18MYVzoBSXOr1CbOpBsC9w==
From: "Krebs, Olaf" <Olaf.Krebs@emh-metering.com>
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <ukleinek@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, "open
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] Fix IMX PWM period setting
Thread-Topic: [PATCH] Fix IMX PWM period setting
Thread-Index: AQHcSXnStwBUqBV5nkubIW1yr2rgX7TaYM8g
Date: Thu, 30 Oct 2025 08:51:20 +0000
Message-ID: <c26fde7dff3a41ff9f7e6c97e2a31801@emh-metering.com>
References: <20251030084727.4098222-1-user@jenkins>
In-Reply-To: <20251030084727.4098222-1-user@jenkins>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.18.16.235]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_015709_216666_A8AF0409 
X-CRM114-Status: GOOD (  12.09  )
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

From: Olaf krebs <olaf.krebs@emh-metering.com>

We use 3 PWM channels to control an RGB LED. Without this patch we get an e=
rror:

[    7.395326] leds_pwm_multicolor led-controller: error -EBUSY: failed to =
set led PWM value for (null)
[    7.405167] leds_pwm_multicolor led-controller: probe with driver leds_p=
wm_multicolor failed with error -16

Our DTS-Config for an imx93-Board:
	...
	led-controller {
		compatible =3D "pwm-leds-multicolor";
		multi-led {
			label =3D "RGBled";
			color =3D <LED_COLOR_ID_RGB>;
			function =3D LED_FUNCTION_INDICATOR;
			max-brightness =3D <255>;
			led-red {
				pwms =3D <&tpm5 0 1000000 PWM_POLARITY_INVERTED>;
				color =3D <LED_COLOR_ID_RED>;
			};
			led-green {
				pwms =3D <&tpm6 2 1000000 PWM_POLARITY_INVERTED>;
				color =3D <LED_COLOR_ID_GREEN>;
			};
			led-blue {
				pwms =3D <&tpm5 1 1000000 PWM_POLARITY_INVERTED>;
				color =3D <LED_COLOR_ID_BLUE>;
			};
		};
	};
	...

Signed-off-by: Olaf krebs <olaf.krebs@emh-metering.com>
---
 drivers/pwm/pwm-imx-tpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c index 5b=
399de16d60..82db43f56da8 100644
--- a/drivers/pwm/pwm-imx-tpm.c
+++ b/drivers/pwm/pwm-imx-tpm.c
@@ -190,7 +190,7 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
 		 * there are multiple channels in use with different
 		 * period settings.
 		 */
-		if (tpm->user_count > 1)
+		if ((tpm->user_count > 1) && (tmp->real_period !=3D 0))
 			return -EBUSY;
=20
 		val =3D readl(tpm->base + PWM_IMX_TPM_SC);
--
2.43.0



