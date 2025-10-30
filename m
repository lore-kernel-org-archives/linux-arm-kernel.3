Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006BFCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 11:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pCbYYq0xwhFd+v4MnGs/Q/HBgsOzi97lwLcKsdRuoA=; b=bb9fyHgaG3i910W1/MMFW2yy6G
	xqVCdEwJCkJ7jz+sxYbStzy2VP6gqoaBrS6FZ9mI3YE0KPu9LPLDrRh4k/Y2TVNlROMyeC1KP58tS
	qGAa1U48FcoIQUeov66lAvPjxH0F4goBFXU8zYQIMercxBhV5RLcJm2ciKVtRixDB6Vsyp3ms65y+
	UWeHSbiaSf+we4gnNrCE+mCa8t2zQ/3aZ35DV6NjwcsLqm60OCcpaHtqyeAwVQK8sGnfROrEis83m
	e4uqzNI8/rNf8UE/jPmKBEDeZeBvhNQtouNHbIANuRXudbcVan0rUKW/9yrOk5XlZIOv8ekyW4Ypx
	SuV7fEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERDj-000000044gj-069W;
	Thu, 30 Oct 2025 11:53:35 +0000
Received: from pmg.emh-metering.com ([62.153.85.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERDg-000000044gE-0bZn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 11:53:33 +0000
Received: from pmg.emh-metering.com (localhost.localdomain [127.0.0.1])
	by pmg.emh-metering.com (Proxmox) with ESMTP id 6A70E201AF0;
	Thu, 30 Oct 2025 12:53:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	emh-metering.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:from:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=EMH; bh=1pCbYYq0xw
	hFd+v4MnGs/Q/HBgsOzi97lwLcKsdRuoA=; b=Q/ey9GsZH/kzevjsax/k06JGZ8
	vS7c6br4j7NWMNbnSLyHo/TuY2PNuaaozbI/frtiH5C85vIUmBLiB8yy6ADqaOQo
	2+yCh73/IWsZVFiVTbwbWPjgAKuoKGW0P+kR7GOhnapNvAUw27cQUYXSiLCBofLz
	1StkUwuz/6VcBzTA85ogd88pUIfemtbi+A6J8iVkfbxhv8b4117yFVwvO7Dp2sYN
	eDiZQthPeOZanKpOyyOIXq32/S1Q3I1abjmAtIbo17RNb95TlHYJXlrT1l7SFqcl
	PqvW1PHNZ8cAJ80MJbiermeN5qw81UhtaRNpXQt7P2Zl2NBeszmpMBrT/gMg==
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
Thread-Index: AQHcSZLdiHZhs8PhqUSPCiSwKgl9I7TalByg
Date: Thu, 30 Oct 2025 11:53:27 +0000
Message-ID: <548dfa909f984868a62e04efc0c51bdf@emh-metering.com>
References: <20251030114641.4109598-1-user@jenkins>
In-Reply-To: <20251030114641.4109598-1-user@jenkins>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.18.16.235]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_045332_648279_126D6CD4 
X-CRM114-Status: GOOD (  11.96  )
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

From: Olaf Krebs <okr@smgw.emh-meter.de>

We use 3 PWM channels to control an RGB LED. Without this patch, an BUSY-er=
ror message is generated during initialization.

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
399de16d60..411daa7711f1 100644
--- a/drivers/pwm/pwm-imx-tpm.c
+++ b/drivers/pwm/pwm-imx-tpm.c
@@ -190,7 +190,7 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
 		 * there are multiple channels in use with different
 		 * period settings.
 		 */
-		if (tpm->user_count > 1)
+		if ((tpm->user_count > 1) && (tpm->real_period !=3D 0))
 			return -EBUSY;
=20
 		val =3D readl(tpm->base + PWM_IMX_TPM_SC);
--
2.47.3



