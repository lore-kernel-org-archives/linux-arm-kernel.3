Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BA4C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxnBAvpwCrecjAvuTm91rB4larlUyZM1HHjTp7DbEqQ=; b=g6rMD4vpq2yiQkwVt0GY+v2n+C
	BJfcYpOLtpuOuwA1nNVeKvRu+S/ejTnXDGPMTOd53M5NcvkrRDgjsFzN1XhzoJ0Bv5Qx7txE7KA4w
	DMBlI3w9u/z0WRq+PsA37ZipGXKZ4qTKaXCkTuqywa+OLvNss+pvDssILOAumUIChuqLPHCG6NjIT
	sLPDBln/9IfxL/Yoerjcqh0cAxEDxVnK9c9E7ZH5z8XLjiT+3LM8VytpjjUaJQAxY5MyctGVVhL7j
	P6+TzlAjxJqk13xXeLlrJ5zcWk7PdkKkCkYnPEUdrr4uEqAcm00AU32Md0i8r+RR9+fkBgWli1buP
	Ny1vnHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pAE-000000018FS-2RJI;
	Mon, 07 Apr 2025 16:17:34 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oDc-00000000vRV-28hK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:17:02 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac73723b2d5so942649966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744039019; x=1744643819; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qxnBAvpwCrecjAvuTm91rB4larlUyZM1HHjTp7DbEqQ=;
        b=VS41Rrmzhqw+E/HGMjVYyG82Ue1cT9EELeCWPycyvai4Vdd/cEctZIF3TKSaVPUIRn
         I1pjTbd8aPwvkRW3juhOO/fi15f7PwUX7P9Fd60E1LS4WXNdbgN+aXShCli4ljQSxype
         tp5wWGGHr6NXhAj0mYWIz0dkm/iaaWDmIS5JMGobCGq7UfhZ/AAcjsXOOP0++aRr++4E
         T5EADaDuWmoWku//Oqsri/b4kQp9QsbOqHiZ8F6r0HekyUbstcbP/iN2Yl3+IXgnw1l9
         tW4zqxMRyXrtnNDgENS0ahWplj+qPXOXpC428I8aPD+xioxM/Vy4Y1xLUzZfIVWHud5a
         z0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039019; x=1744643819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxnBAvpwCrecjAvuTm91rB4larlUyZM1HHjTp7DbEqQ=;
        b=QNW55db4dHUFa9VSVLvZ92rsRO57yKndYLfjPkYCmze9tCMQIaZ4X/3ZXyUz09972V
         CL4vNxuHr47ehaOsLIKt3tRo/43szsrQyGfnWO1bYwM6XaJX928qdw8/wUM3XVWfIsQC
         ypmMqWDeRE7IG31mj3kQGocmyHfkd3X1dFBbSSP5Hs2ULx6CT91VYvuuB39NBe90lHvr
         KhOHxoJZC9dP1aoArPGYTrqefgC8PRBA39+C/YM97SR3jmiV2FQGUIsvJEQKtar1QWLf
         bq0J6QLpMJbpMv8pyKH0lKYMEFHwdIBElCxdSb8WWs34kGYDGTN4RJ2i52gatrNP8KDN
         wI4g==
X-Forwarded-Encrypted: i=1; AJvYcCU2j/z+Uk8134+ok6EMdLsCA/i5NE37WXSnB4gprp0V5WKggX2iHzcsOuwnNt3LmY8qo3IdVkQimnZ37ve98d2B@lists.infradead.org
X-Gm-Message-State: AOJu0YylJwmx2M+V4HhfijdjaREiwL6EgmkB77zMjUrwiqFlSq5dHVE/
	dGnWjZlCtJOvetbM3H57NMHBw5hnNSRAmNIi24A5BTfWpaVrh7X52Ft2EXQxdq4=
X-Gm-Gg: ASbGnctGBT7/YYndXtIdhF6M0oSlaLHDo7eBG/uNaaUWo5hHDXKeMTu7aProMYxaR02
	Bx1TbqeOR2Uzmfrw5XhW+vOAVjJoMb3iD1Eg68dOto69mNixW0zsd7P+1HtR1VRnIrLoHyZnhti
	9OiTxkGuIua6/W/DqjXEUme60kWFhEWP4h8gdvSeNgh99vPDa3osJv4QuR6hdUiewmbU0b/+Td/
	SXKkA+shbx3un3vV+GKfpbx0tvEcITNxf44Abs5SAaZ1P8AHcxYwZozl2CIXglT3Y5SFwfjjvKX
	01iGmLyzGvf8qKgMdIy2k2PppoXFtYkxD/33DLfOAtR/P+l9Tw==
X-Google-Smtp-Source: AGHT+IFzTIXbrDVkyQ6AbBiDuE5pSliyWRspT9PlDuGXWQ5GmY7qspmZDr7hbN6PADzz8nJe3cDOSw==
X-Received: by 2002:a17:907:9716:b0:ac8:179a:42f5 with SMTP id a640c23a62f3a-ac8179a43b5mr48095166b.14.1744039018700;
        Mon, 07 Apr 2025 08:16:58 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7c01c2c3asm768777166b.176.2025.04.07.08.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:16:57 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:16:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Michael Hennerich <michael.hennerich@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH 0/6] pwm: Some fixes preparing chardev support
Message-ID: <wn3ef55yaangw4p5cihu2rafqlm7ckmylner6q5irtpu6yq3cw@tyjieqhlq6vc>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
 <lzwvrhmx3yqv2v2qkpiq5e542eflnnwvhm63fjmq6szh4bh47b@zk4hifurejja>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pvxqsbn576kt2xa5"
Content-Disposition: inline
In-Reply-To: <lzwvrhmx3yqv2v2qkpiq5e542eflnnwvhm63fjmq6szh4bh47b@zk4hifurejja>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_081700_548225_DF88D0B9 
X-CRM114-Status: GOOD (  25.60  )
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


--pvxqsbn576kt2xa5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] pwm: Some fixes preparing chardev support
MIME-Version: 1.0

On Mon, Apr 07, 2025 at 12:24:31PM +0200, Uwe Kleine-K=F6nig wrote:
> On Sat, Apr 05, 2025 at 11:27:11AM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > while working on character device support for PWMs I found a few
> > inconsistencies that are fixed in this series. After that I plan to work
> > on getting the character device support into shape to get it into
> > mainline, too.
> >=20
> > While some of these patches qualify as fixes I think there is no urge to
> > get them into 6.15, but given there is a bunch of such changes I might
> > send them to all together to Linus for inclusion to 6.15.
> >=20
> > Best regards
> > Uwe
> >=20
> > Uwe Kleine-K=F6nig (6):
> >   pwm: Let pwm_set_waveform() succeed even if lowlevel driver rounded up
> >   pwm: stm32: Search an appropriate duty_cycle if period cannot be
> >     modified
> >   pwm: stm32: Don't open-code TIM_CCER_CCxE()
> >   pwm: stm32: Emit debug output also for corner cases of the rounding
> >     callbacks
> >   pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request was
> >     rounded up
> >   pwm: Do stricter return value checking for .round_waveform_tohw()
>=20
> I applied patches #1, #2 and #5 to
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fi=
xes

And patches #3, #4 and #6 applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

with=20

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index dca5d09d80b9..4b148f0afeb9 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -213,10 +213,10 @@ static int stm32_pwm_round_waveform_fromhw(struct pwm=
_chip *chip,
 {
 	const struct stm32_pwm_waveform *wfhw =3D _wfhw;
 	struct stm32_pwm *priv =3D to_stm32_pwm_dev(chip);
+	unsigned long rate =3D clk_get_rate(priv->clk);
 	unsigned int ch =3D pwm->hwpwm;
=20
 	if (wfhw->ccer & TIM_CCER_CCxE(ch + 1)) {
-		unsigned long rate =3D clk_get_rate(priv->clk);
 		u64 ccr_ns;
=20
 		/* The result doesn't overflow for rate >=3D 15259 */

squashed into #4 to fix the build failure that the 0day robot reported
in this thread.

Best regards
Uwe

--pvxqsbn576kt2xa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfz7GUACgkQj4D7WH0S
/k6YPgf/SN1j5yOtJmC7QVuGTcUlTuOBLQ2qNU8p1Lg66BPQ6jADoLAXq6aILNiA
Yd2vrJGFq4Aiw1p6B2xWwmzt7C2QdcqKRD8qdbDsfR1STaNLoseLs6nNG4PvbrKw
5HI6vqngB8oD4YE1TRq98S9/J0oGXmP9sHJk7LsHRbsVlaZggTLGXHqqc4wxJFNx
cOBJ4o8zEfjytVTIA4E5wYf86/ag/ZjROBWuZTuhzZG57hkeM3rzGnMtT58/8A98
VaEFgkpFp15TF3utVme6ORwWOm1JNGUJYyV67iDMY4h7IawmHHcstQYR5iOHfqoU
jzQYSZKQ/foRNzTwC+xzpVl5326WiA==
=EicF
-----END PGP SIGNATURE-----

--pvxqsbn576kt2xa5--

