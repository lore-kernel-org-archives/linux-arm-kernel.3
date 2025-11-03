Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7449CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yk/MqQKqZE9ciR/f+72baGg6dFC+oYSceyoJ97PjXtQ=; b=Hyz5/APaxqNGgzmPk25EpnpKvT
	0Pw2/twWyGOYXczwCZgkyS7KzlXubk66PAIw1N23BabS3GHG6sH4uhtHQyNh/k7lRa9J+jHpcAXwU
	3XSO33x5UK2hlaV7obgfIIQa2qoE54rzmXG/8bSkvpdaoWo/DSP054Ed85Q1V6d/+Gjsd3qgFHcNA
	XB3f0X9VzJb/e0mzrd3HABt8fKj9qyBUo0CSW/BrP4bhL1U1pjq1h4myDyt9QLPkKXboyNxHwk3Jd
	AfKPguoR1dXsqjFQnq322g1yJap/G1sU30AWCPm7Zk5bLqWvoQwlosnHs+arUMnDpjPJ/En+xpDh8
	EJHXE3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrfL-00000009cD9-3qVl;
	Mon, 03 Nov 2025 10:19:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrfI-00000009cCZ-2D6l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:19:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-474975af41dso31514355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 02:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762165194; x=1762769994; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk/MqQKqZE9ciR/f+72baGg6dFC+oYSceyoJ97PjXtQ=;
        b=r72jeJrdZTPk7OLdGMLyB8d1MLMSwKb2/M+kizgDjGral6R7DMaN+85cUjFpAabbdi
         WRmdeDI85OxBj94VqFQXl5eSpr8U8Ppr0sqsm2Lxo68GBncjfIweAf4U5hQAp+fpKiz9
         BhdhXB6BnII+0Q8GMmq7CqLp/EpqHdzKQzLAXBg6Mr3Mw7wtGiQ4HeIdobzitk1NWamE
         oYTdJOmC0zgLVtChq0W2tN4IVPOcBm+imNgkbmJUWiV+RbiI0gD3ollM/0sw0YQSl72t
         MDCcqsAIthou/ghXXg8u02HRlctrN4cvXfah3AgsoReK/Ci7d8UOSuVJi7ctl41OI3pB
         KXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762165194; x=1762769994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yk/MqQKqZE9ciR/f+72baGg6dFC+oYSceyoJ97PjXtQ=;
        b=rHWHtRLZS9X+BT73CWaUf1jH0KAqddVh8UsG19QJYmy2S2G8D4noCIrKZGckJjZVz8
         2bYVVh17sCY7kODDUTpQ6Q12ise6twNSrDvpNFaqt5BtxXrOKmB8YtZk6WVNTFhmDRw3
         xZx1gWJpPX31lojvqV4Sbc2/Sg4dzFB5AkBmsWkUUmV3VBeVecUtmlywBonY9pVePEMv
         5hTSYZ1mI3czb5/PbxZhwdtrL1rZ0ABdu65HdcLb2TmlTXHgp1o1hzpYJ7PH1s3VwvIx
         0SwbXiJ3uevmYUNXW4WsmB4RPt43C079qoOfg8g8uqj2pz7ssigw8G3M1uOGH/RBOGhX
         DTOg==
X-Forwarded-Encrypted: i=1; AJvYcCWtgc9h2706BRehFBpIK79Xv9+QLDRdTt/MwTWy9BheEMZ+QVTp6tCAkmGMiu9kYve8nalzkWYEnyw4GtfMkD13@lists.infradead.org
X-Gm-Message-State: AOJu0YzLxcTKViuVdmWFCITuX17IDFBBBofdE+rEKSv7psFZ9bOVGK/5
	lZlvp8/BxClli03I7jVmWP11p+Z7SDbMHNVmadXbiMpOCe/6NzPAiDXAxDVc7/rnivk=
X-Gm-Gg: ASbGncvlOh3ONSZIIbW8HhF8hQ7w6Eycea4klB7Gjcog4TYHpYKZukTrCYlo2gm73Z4
	yJprvUTBqj6q5Ds7B5sxdJ5dO3LXOisZZ6HVwnbZ8wywX2swqSNCjFuC1W8mT79wmhfmC21/U2j
	FbTLVyuQkJ4fh6EHqeWZQTKpKWC++jPRwu68lu1xX2Kj5HCIdN/TIFtMNaI+DeZjfggelo6puex
	di2othkwXLikYxeC1vx+25o3YvSfmFrR90BxRHbw+Yoaf+5WlKsK+bZy5emSnrCDNLGAZCqmi4m
	+M5hLyr0KqM4x5WzpJUvwS+tdJS2rXLcjPEgbWgpOFai0jWDDtgnhuAT4tV1gatI31ZnTffwyW9
	wEN55nQxYtRQKaK3y0VndNk9J188r//Man2gOmxb7zwanpk+bA3vEA/f1K59IUK9Oh0eThtHmWg
	yHSR/vlOABIeb2CGCoYH6jU+G8wb+SI9HmHdDiW/g7yrjcnjDPbh1bBxl6rPsJEEcKNzqi4XP8r
	A==
X-Google-Smtp-Source: AGHT+IHOtduNrRBMSHOgFwat+JbsvBQbjZA2f2jjaeArzvIV58w9j8NgIBsWYYESYm2z3s+D+nQH/A==
X-Received: by 2002:a05:600c:34d0:b0:471:1435:b0ea with SMTP id 5b1f17b1804b1-47730872aaamr92764025e9.24.1762165194241;
        Mon, 03 Nov 2025 02:19:54 -0800 (PST)
Received: from localhost (p200300f65f19f5043df592b151413282.dip0.t-ipconnect.de. [2003:f6:5f19:f504:3df5:92b1:5141:3282])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c569390sm144870105e9.16.2025.11.03.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 02:19:53 -0800 (PST)
Date: Mon, 3 Nov 2025 11:19:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "Krebs, Olaf" <Olaf.Krebs@emh-metering.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] Fix IMX PWM period setting
Message-ID: <vi2hrue6l5g5ihoa3rh2u3pitgbwiyvr5su6dhztg6iowajwfw@6rj6lh5fbtb4>
References: <20251103064813.522840-1-user@jenkins>
 <1b071599b84c4519a81990fbfe09782b@emh-metering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cs2lqjurbk5vnplp"
Content-Disposition: inline
In-Reply-To: <1b071599b84c4519a81990fbfe09782b@emh-metering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_021956_592726_7A96E878 
X-CRM114-Status: GOOD (  23.88  )
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


--cs2lqjurbk5vnplp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] Fix IMX PWM period setting
MIME-Version: 1.0

Hello Olaf,

On Mon, Nov 03, 2025 at 06:50:20AM +0000, Krebs, Olaf wrote:
> From: Olaf Krebs <okr@smgw.emh-meter.de>
>=20
> If a second PWM is requested by a driver before the first is configured, =
trying to configure any of these results in .user_count > 1 and thus the co=
nfiguration fails.
> Fix that by only erroring out by additionally checking if the period is a=
ctually configured.
>=20
> Exapmle: Using of 3 PWM channels to control a RGB LED.
>=20
> DTS-Config for an imx93-Board:
> 	...
> 	led-controller {
> 		compatible =3D "pwm-leds-multicolor";
> 		multi-led {
> 			label =3D "RGBled";
> 			color =3D <LED_COLOR_ID_RGB>;
> 			function =3D LED_FUNCTION_INDICATOR;
> 			max-brightness =3D <255>;
> 			led-red {
> 				pwms =3D <&tpm5 0 1000000 PWM_POLARITY_INVERTED>;
> 				color =3D <LED_COLOR_ID_RED>;
> 			};
> 			led-green {
> 				pwms =3D <&tpm6 2 1000000 PWM_POLARITY_INVERTED>;
> 				color =3D <LED_COLOR_ID_GREEN>;
> 			};
> 			led-blue {
> 				pwms =3D <&tpm5 1 1000000 PWM_POLARITY_INVERTED>;
> 				color =3D <LED_COLOR_ID_BLUE>;
> 			};
> 		};
> 	};
> 	...
>=20
> Without this patch, an BUSY-error message is generated during initializat=
ion.
>=20
> [    7.395326] leds_pwm_multicolor led-controller: error -EBUSY: failed t=
o set led PWM value for (null)
> [    7.405167] leds_pwm_multicolor led-controller: probe with driver leds=
_pwm_multicolor failed with error -16
>=20
> Signed-off-by: Olaf krebs <olaf.krebs@emh-metering.com>

checkpatch is still unhappy with your patch. That might be (at least
partially) the fault of your MUA or MTA.

> ---
>  drivers/pwm/pwm-imx-tpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c index =
5b399de16d60..411daa7711f1 100644
> --- a/drivers/pwm/pwm-imx-tpm.c
> +++ b/drivers/pwm/pwm-imx-tpm.c
> @@ -190,7 +190,7 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
>  		 * there are multiple channels in use with different
>  		 * period settings.
>  		 */
> -		if (tpm->user_count > 1)
> +		if ((tpm->user_count > 1) && (tpm->real_period !=3D 0))
>  			return -EBUSY;

Repeating my review for v2:
> Please drop the added parenthesis.

Have you considered "I wonder if a saner check would involve
enable_count instead of user_count."?

Best regards
Uwe

--cs2lqjurbk5vnplp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkIgcUACgkQj4D7WH0S
/k5zegf/ayuI0k1O/rvOwqgY2KX2snbmVt0zQXx+wWSvSz644LtOFQR+LgsDyy7u
SlZmCAUgG9sTXIZk8uCCI9YhccesU/1Tybc5sca7brEOjTlWzWVGhzliodTxVbYI
95iNCr3aNm6Lkhf6mfDO9FEVvfn7oTSZlDmeiBQyDaD9LDEVKyrHBbFC0GaEINLT
GFLi3KqbLbvJu5df5v2xnsLIwH0zaWj13fMV1oocCylH9tp+YB5tGLMl4/3Ygq9b
4R+YiqcoeL8cupykXBd0WR9S3lqUcIfME9FivoDTC3UDCTeNiMrDNgbF8mxOwd4+
39agoAx03n2Cq66N/ZG21wkBHiffjA==
=DpDO
-----END PGP SIGNATURE-----

--cs2lqjurbk5vnplp--

