Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DE8C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=; b=rZFvVaod39KqTFj/ZSZ4WQwtRe
	OLAVfqT3i7LYO/ulHkAzus7F4ux9t6kN4LdnFDITtMpL8pgdXLCRRdFuiNmTYFdzfSMDQ/6DRDam5
	d2RUTYmPs10FIEpbpB0ofP5PKY7g7Vh5NfEgpLFXrwSsBboqv0m9BrfZAZEwxcy+QllT4mFurt+V7
	lI1LCDp+ea1FS9INMz9GpYwh1FjyFDxGxXkFjTB/6sVrudgfzzeeov/63b+sNBZwY93ACgaXQURhL
	Is+IKmb8QUc7yWrqtvq1wlPqTg7D/jZIYkybbzPOBIJ6Dezt/9O5dOy/9cgmzSP2WDIZonpZw2dI6
	6wAVwAYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdMa-0000000Fw1J-3kzM;
	Fri, 20 Jun 2025 15:09:08 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdKM-0000000Fvsh-0hk4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 15:06:51 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6fad79433bbso18177766d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 08:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1750432009; x=1751036809; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=;
        b=aLgJqfM437F2qGklAs16SAttFNGZv9tSiw8Ai1n7KyrZl5a7KjxjJf+NkCjL5KDc9+
         Q6nL2oxu1ZjAutVw/hfj/TsM0G7JkZPwqupv0MpIGL38cZrKGEmhoBQlBFj6//vejdSb
         htqZGf7/knntL81Cw8iRqtwETTZYMYHH3hHcO5VoHLliqS26HQR96Vi5n3GENxFsxP1S
         TXg9ybk3rF4fMLnw53kbzePoF8OsCHFVeInG2uZVHTsafuyHcfnXHcqhufgY1MZxIMo0
         0EySWxarl8heExDzWWhwM8ytNfcgcTHEoyb39PBQcgkgdhsoSD+Yp4Sl9+FIMBN0jmuU
         6Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750432009; x=1751036809;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=;
        b=WbUiNy3WC1wPMRVktIiYCNjgQ4e4TbdNclx9olx0Ov0ChUFvtQNF77n05ednH5qDay
         QgV564Tx6nDyKTAOzxFP5wvAweicZ3DI9J1Fo5hPEEFawmFc6wmY2b1ZNfgeDWpGR1gA
         2aStoHLzRhmeutFqgmYe4yiBzYZGvJL7DBK/1afgxDap7OKuGDJUSYJ8EVwJqO9H0SQV
         TY/XVad16B/o8+7Vfyexelay8++48DKuG2fLbWHapqY+6GhcNvh3aRdm7XXXbKruwAju
         4OwhgPBZsvWMa2kW8mDoVce/W5L4p6CgTI3cveH/FieNSl0Uyq1VRN0eCYfTHa/lYHKP
         P06A==
X-Forwarded-Encrypted: i=1; AJvYcCXipuexceQ36VKgVv/ZrduasIPyqZjd295Oml0xlEqZy5b56MlCT7+VkUS9zfahHqyeeYocqMAD/mgMkHOvt3bh@lists.infradead.org
X-Gm-Message-State: AOJu0YxREdTEAyRGSHXFLhuQoWPdMXaG+PIO73sd25oIwiV3MUGpwJ2T
	8UkIHCInLWtSZFCatYIGI5WLgxi5cPeGVmgf+Ja4F8S7VU1k/lFDKEau4zTXLqwRMAM=
X-Gm-Gg: ASbGncvjPE+8MQoI2NBpDum/YwqecOdiKCvk4lFvrJgSSGs5lv9EOJ5dZr/nlYSub2L
	bsaNr69DtQtf/taUtDxyXgjaq+gVQQ4mhLLeA6jqBqfrTFxjt1Y7kryhNA4ZE+3FFeTT2n71/tf
	I5hLL8nHG9pmhWrfll6KzYy1gDTMs69JO+o2iVou8xWfK5/283jRsfOdy/BrEhtvngV84asYynI
	RXvIDWC7ypn9RG93FFvbBVEleDsdVWKJtWa+evfbI4kUY1RlbHghWDFJtMik2nXlPC7UHflQlRp
	g1F7KIDLxgK3AHd4gkZ2hwdrzZPI/UQdXcvsJHiF7x2netqHBeoRLphMpABToxcF3sU=
X-Google-Smtp-Source: AGHT+IFSbdWcJq6maD1xUyD31N97nxqkeERkrPfl+oPHZ7odb6VWFZL/FFDSL0pRREpka1+wvb6uPw==
X-Received: by 2002:a05:6214:2463:b0:6f8:8fdf:f460 with SMTP id 6a1803df08f44-6fd0a461262mr40636306d6.9.1750432009010;
        Fri, 20 Jun 2025 08:06:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::c41? ([2606:6d00:17:b699::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd095a3f94sm12971696d6.111.2025.06.20.08.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:06:47 -0700 (PDT)
Message-ID: <82d38c0dc93255da3195a919dc650ef8fc07e7f2.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Shawn Guo
	 <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	ming.qian@nxp.com
Date: Fri, 20 Jun 2025 11:06:45 -0400
In-Reply-To: <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
	 <20250521173444.310641-1-Frank.Li@nxp.com>
	 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
	 <aFORokzx/sImgDtA@dragon>
	 <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
	 <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6BjHJSIIonN27c8RdqsP"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_080650_313958_DDCAF2BF 
X-CRM114-Status: GOOD (  21.30  )
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


--=-6BjHJSIIonN27c8RdqsP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 juin 2025 =C3=A0 07:54 +0200, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 19/06/2025 19:16, Nicolas Dufresne wrote:
> > Le jeudi 19 juin 2025 =C3=A0 12:27 +0800, Shawn Guo a =C3=A9crit=C2=A0:
> > > On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
> > > > Hi,
> > > >=20
> > > > Le mercredi 21 mai 2025 =C3=A0 13:34 -0400, Frank Li a =C3=A9crit=
=C2=A0:
> > > > > Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc",=
 which
> > > > > are backward compatible with "nxp,imx8qxp-jpgdec" and
> > > > > "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which co=
mbine
> > > > > wrap and all slots together. Reduce minItems of power-domains to =
1 for
> > > > > i.MX95 and keep the same restriction for others.
> > > > >=20
> > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > >=20
> > > > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > >=20
> > > > Krzysztof, will you take this one once the DTS part is ready ?
> > >=20
> > > dt-bindings is the prerequisite of DTS.=C2=A0 DTS patch looks good to=
 me
> > > and I'm waiting for dt-bindings part to be applied first.
> >=20
> > I was waiting for sign of life on the DTS part, we usually get some ack=
,
> > which is good sign we can take the bindings.
>=20
> Such process never happens. DT bindings are the prerequisite here and
> platform maintainers wait for bindings to be accepted before taking DTS
> or even sometimes reviewing DTS. Why even bother to review DTS if it
> follows entirely incorrect binding?

You are the one requesting DTS with DT bindings for review purpose. You've
done so regularly this year.

As for review process, Ack are a workaround to a black whole in our review
process. Patches without any reply can either be un-reviewed due to lack
of time, or accepted. You do whatever you like, I'm just saying that clarit=
y
can help to coordinate.

regards,
Nicolas

>=20
> Best regards,
> Krzysztof

--=-6BjHJSIIonN27c8RdqsP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaFV5BQAKCRDZQZRRKWBy
9KazAQCZpPC27cOiLrCeirOx9KtegKeVBpOKvNdcjZFKHZg+0AD+OJGvNGaHn+Di
rFaOSJG8M735rmjWeSPrkNAWKU2s4Qc=
=Chy2
-----END PGP SIGNATURE-----

--=-6BjHJSIIonN27c8RdqsP--

