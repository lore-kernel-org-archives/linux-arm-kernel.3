Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD2BC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD7UStE/XOr8A5NJ+GnuX9Z5tu/0sy2nS7RxI5FuuYU=; b=DDUkKo0tBX2i7L9YGwnEikDYrJ
	H+gzL87bKPWPAuMCcHen71ivaDUbHO/wdRjQZXXHHTZSplwCc7RW6J9bd4T1/AZTjafCbEzbiIPwX
	N7CcXVTS5bXbeJaPtZgfz3k+VCaWZISK0rxphwOhVHietmxMqeJh2VFUgfrh5S1N3XUV1W0dwxxbB
	uS42FArrlK89Yl5/hrvzFpDn/KCXF+LUOvKrb4INsRFzWXglkkQTvsUo+YhUkuVBHCGNKpvYM8UsY
	NR8bkksMPzWJqXafWLmL2oLhP/vM0/0SZXtWYPGWSTJNNe9vsflvlz5cnebIkedS1EtOHH1yMApZS
	OdojUtBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyma7-00000000O8n-3aM4;
	Tue, 25 Aug 2026 08:32:31 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyma4-00000000O87-366w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:32:30 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c2055f5a993so501326366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787646747; x=1788251547; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lD7UStE/XOr8A5NJ+GnuX9Z5tu/0sy2nS7RxI5FuuYU=;
        b=FCBY2ADMU7C5Mxd6+gAvuuDBJRhtitJSpeEHaEjnSQN6TrgZ01v82+rqIi9t2HINSt
         yty79Cwk6QH/qQk1ck5vVK/4mGT1ii2U9gk5RIT3AWtxwdnwdAU5sZmtODJeX0RzOeIc
         Ns/2j6AOejiducAioRhxb9hdlOPQKd0rGp/Iun8LHqaxi8M6RC1TPa1bYOSpq6BzsdkI
         qfaQsXjCQ6Og8kahFx+ip1XxvmKjPqKDYKheoVL40eFD6WdVrmziuVeo+apygAJ8him0
         BlLIXlGUDz9rZlJ3qoIbx/rNMRKkYNOBlVvaw2k1LlGUTdWqBE7Y7Ea7v1Ql8Z5nrOEy
         0AGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646747; x=1788251547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lD7UStE/XOr8A5NJ+GnuX9Z5tu/0sy2nS7RxI5FuuYU=;
        b=AiwIW5sZ7NBQ4ZiARGyQKVCMhw9lu4rVE78AP4fiaJclkha18e04jw90or4Sh9yyFl
         4XTNGVRzWo5si12PnlvcHMHiB0CpzZzw5aFu4IxMO5BCsYtrD0TU7juFCMxG8Owd/fwk
         MgofA3V6nkayWdO9WQY4p5/uLw1WLJDt/jpqU1vXzwniqFo4R5Ba5wgZsDI1H9njQMNE
         LjCL685KVwiDVSl3JGZzm0PMiXdT+jBWVAsPzl2LSyJqucTeMZgp1X+/+FXKFeQ8vlev
         TTzpwCd5WwNdgf6WswZuZKJaTdE0THqD9TDhN//z/cwzOGautM5NjX0EoIzall+Aw58Q
         TPrA==
X-Forwarded-Encrypted: i=1; AHgh+RqYwcbqe/3e88FYLchJNKrJBzBJrJzyrnvxp5jx7CapOOFyIFyGZptHW8jlbzblQsqix0k4N8vmalftaNpWwaw1@lists.infradead.org
X-Gm-Message-State: AFuF++mg2HEMXzJU1YabdPs2IWtNQ1i4bs8HSEFdUNyOPmSr7mWH9OOY
	/zklhWUIF8vpfXZTtFiO0fzvRc40Vg6qW2DJiWIUfwNHeVRJUWmtcD6pN+UNsTb503w=
X-Gm-Gg: AR+sD12danLv4znINPqknm/Zp8S8vPagz1eif1S4OljyK73+yIbbxAE7JmXuRt1T05a
	Rdgxzj/KY912J1Oyg/hu5GFINQO4IDzBPNuAMWCAJeUGM3vmYf/ch3wBmOtL+2HF9mvwoJO/o+t
	mnB1m/tpQyreOzvGk57jIkoam/r1K8CdXysaZQjyFQqdOk8cEHfQnGq9sSNytU4ks8/+MDTVBO3
	dUVY08HFvYohD0zWquc1PtKLJr3OjgZmk7GsxQDJq85LJjqewsIN/jvTDYjEO5k3J8FXkFeRceO
	CKTbWoGtC2D/e9/A237gq5onMdJpdO/4K4/GWNEQ2v/AuNj07jXEd/BKN0bEATekO+A4DvyvG//
	tj6pEYmgxPEFB7kTgEZXCdSbtNRP61j4EqyZ8D+oNIeUtBCXVDbJeG5ABkA74lZ8LX2lzAvZtgf
	WSi0gdtYcoEPwLGIbQg9ZMWCiuFfZzQILtRrt0Z7irBc47NqhNLUZ5wCTMIxnW0eNNyF09iVBok
	HzCJ509lEjjHVhXAADqnmfKGodaY0eprAjFq8/sIU8o+HmKZm6Awp+FyUSKAw==
X-Received: by 2002:a17:907:9445:b0:c21:6f8c:2335 with SMTP id a640c23a62f3a-c24e5ff7a2bmr571761466b.16.1787646746723;
        Tue, 25 Aug 2026 01:32:26 -0700 (PDT)
Received: from localhost (p200300f65f19a904037016a565660d5e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:370:16a5:6566:d5e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c249686e37bsm1692467466b.55.2026.08.25.01.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:32:25 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:32:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
Message-ID: <ao1SHx440b6OxUDm@monoceros>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
 <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
 <aow2GFAfy84k-N2B@monoceros>
 <1bf5984a-d1d2-4763-bb4c-b17ae8360192@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfxdkmmv4cdosfpl"
Content-Disposition: inline
In-Reply-To: <1bf5984a-d1d2-4763-bb4c-b17ae8360192@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_013228_805228_35C7B0D0 
X-CRM114-Status: GOOD (  33.73  )
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


--nfxdkmmv4cdosfpl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
MIME-Version: 1.0

Hello Hans,

On Mon, Aug 24, 2026 at 04:58:43PM +0200, Hans de Goede wrote:
> On 24-Aug-26 14:22, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > I just replied to v2 and only then found out there is a v3 already.
> > There is something wrong with my mail filtering, sorry.
>=20
> Not sure if it is your filtering, v2 is somewhat old
> and I only just revived this series.
>=20
> I'll add you to the Cc list for v4.

If you don't make the mess that is mod_devicetable.h worse, there is no
need. I'm already overwhelmed with mail ...

> >> +};
> >> +
> >> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> >> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devic=
etable.h
> >> index a397213bedac..d241421c36aa 100644
> >> --- a/include/linux/mod_devicetable.h
> >> +++ b/include/linux/mod_devicetable.h
> >> @@ -49,6 +49,7 @@
> >>  #include "device-id/pnp.h"
> >>  #include "device-id/rio.h"
> >>  #include "device-id/rpmsg.h"
> >> +#include "device-id/scmi.h"
> >=20
> > Please don't add new includes to mod_devicetable.h. That header is ugly
> > and each include makes it worse. Just add <linux/device-id/scmi.h> to
> > the modpost source.
>=20
> Hmm, I did that at first, but that is quite ugly also because
> file2alias.c, does:
>=20
> #include "../../include/linux/mod_devicetable.h"
>=20
> So I ended up needing to change that to:
>=20
> #include "../../include/linux/device-id/scmi.h"
> #include "../../include/linux/mod_devicetable.h"
>=20
> my thinking was that the purpose would be to move other
> consumers of mod_devicetable.h to directly include
> linux/device-id/*.h"
>=20
> And keep mod_devicetable.h as a file which includes all
> of them for use in devicetable-offsets.c + file2alias.c
>=20
> But I can see how actually getting there will be a long time
> in the making and in the mean time this will cause longer
> compile times.

Yeah, I'm still pondering a bit if I should start dropping #includes
=66rom mod_devicetable.h or if that is more annoying. Fighting new
includers for mod_devicetable.h itself seems to be a tough task, too.

> So if you're saying the somewhat ugly thing of adding
> linux/device-id/scmi.h directly to devicetable-offsets.c +
> file2alias.c is the right thing to do, then I'm happy to
> do that for v4.
>=20
> If I'm reading your comment correctly, that is what you
> want me to do, right ?

Yes. I agree it's not pretty, but IMHO better bearable.

Best regards
Uwe

--nfxdkmmv4cdosfpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqNUxYACgkQj4D7WH0S
/k5wCgf/eIWRfjCexiKewtXq3u4X6kYeqNfHxU/aHRvaG2XAS6E+1RPly2vZKqRP
S+yKDqswE2AFauvgqGNf+U3VjCqnf6AQdButjabhaAkBoumLTSz8unOA54k89HjY
ThBXcUmVtt1D5s/rBi0lh/Ak4BpU9pSqJgw4CwLS0P6hESLiGfqhrD0P3E+/KghH
Le7l4PIbYdhN0xCAObN5xv6Hd95e/k3i5+zG2kmjw8VZAHvQ8eixXynbI6Ch0MOV
6TXmQs1gWz+lqtKVk6SSdOwjQFynbbDGAJdAIkys9CxZxwOGSoJyq6rcnQMn5+t8
awDppaPW9PyQKN759eqifr7kB/XR0Q==
=xnLj
-----END PGP SIGNATURE-----

--nfxdkmmv4cdosfpl--

