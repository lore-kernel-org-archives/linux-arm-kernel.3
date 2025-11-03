Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1118DCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 06:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EB2O6kTVDpxjxa6R1ervwAhb64BXCh6IFZiwSALTWaw=; b=0z+/zilbodkkuLcE+A+HqZyxIT
	D1Y7to+78/Y5Wk4/oroKvdbuftRVqaTbgidaNwuyd/8riNKSlQYFsWPDYb3kvGMTEryieM5AE8Nzx
	TMEubfj69p8dEs5dJPEpaIYNEw9yXqagOnuDLFiKjzet7Lrl3hWO28rhdRVOBiAGHkv8PtQMOGCPn
	pbtEMn9A77oZ3ahfQYAlvffilPnL67BSdJzZ1dz/MUko4ohZVxiJvryXezAkf4tsWdsNoXW+ZXp+P
	TZ2/MrY6XXeTjioGi3INmv0R2Xi8iaZst6mOw816zoHusGkDfi+ktEIxj28ErYQ5RR5GsPgoeRrxP
	Eobv0aKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFoV6-00000009K31-3jId;
	Mon, 03 Nov 2025 06:57:12 +0000
Received: from pmg.emh-metering.com ([62.153.85.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFoV4-00000009K2Z-1Ztq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 06:57:12 +0000
Received: from pmg.emh-metering.com (localhost.localdomain [127.0.0.1])
	by pmg.emh-metering.com (Proxmox) with ESMTP id 79533201269;
	Mon, 03 Nov 2025 07:50:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	emh-metering.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:from:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=EMH; bh=EB2O6kTVDp
	xjxa6R1ervwAhb64BXCh6IFZiwSALTWaw=; b=ei12VmxgEys3hOhNzAqfWfZpUW
	e8SIzsI7bzqQyiatL4os7UmgkilXHKCXIh0JLH3bQzfuxkMTU1zMfBPTcJwDOCRd
	ReqAWzJuwjoWpCIwpYxc7M8wmtawa71/EORM6NFxDYV2lvN/bNuuFZYHcpHP3KG6
	6lrUHsAPhzYD6YsWhRBEVgSBEdtTelGtaEqbq8nBJ8X8pfdmOswTIzwqH41ab1De
	zKV95vvd+svWUeJhbVNsJKCQVC+LPinj5x6LfvN6F3KLHhPElDpRk0I5kjyakx12
	pnqvuFEGXZGflaKwXb9esY/JU3FqffrOvbmyrW87UJOk3aPxhDmdq0wDrBlg==
From: "Krebs, Olaf" <Olaf.Krebs@emh-metering.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3] Fix IMX PWM period setting
Thread-Topic: [PATCH v3] Fix IMX PWM period setting
Thread-Index: AQHcTI3pZaT6LbFQuk2XOLVoRSV617TggtSg
Date: Mon, 3 Nov 2025 06:50:20 +0000
Message-ID: <1b071599b84c4519a81990fbfe09782b@emh-metering.com>
References: <20251103064813.522840-1-user@jenkins>
In-Reply-To: <20251103064813.522840-1-user@jenkins>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.18.16.234]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_225710_739789_92BEAE0E 
X-CRM114-Status: GOOD (  13.51  )
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

If a second PWM is requested by a driver before the first is configured, tr=
ying to configure any of these results in .user_count > 1 and thus the conf=
iguration fails.
Fix that by only erroring out by additionally checking if the period is act=
ually configured.

Exapmle: Using of 3 PWM channels to control a RGB LED.

DTS-Config for an imx93-Board:
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

Without this patch, an BUSY-error message is generated during initializatio=
n.

[    7.395326] leds_pwm_multicolor led-controller: error -EBUSY: failed to =
set led PWM value for (null)
[    7.405167] leds_pwm_multicolor led-controller: probe with driver leds_p=
wm_multicolor failed with error -16

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



