Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42703CD37AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 22:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trZCIv4VUbmZsT+tqtZK8MjDiIjWO57JQfjXqAJtZwc=; b=2zuk462AGh3ZkKsP6F2NhiDtrV
	wjAOkuEhR/y08QA7IhfCR2h6t7AyKFmcs6LvmHQ8Rg+cX/2HSJS6S/doSBGAbrzpVlQMiX6Lvr6hJ
	BRWrUyF0m10K0wH8aN/Xk9AWJbVh+cKJtdTdh1et1Qpy5RslPKHnSwx0lRHUUU48CKosB7EFTi6Ic
	NSlNUwoDPjJnLPbBCpgLeO54epWO/0yopZU31s1aLxEI2+ZYr493u0QWfK7FhkMjpHGZeL0JxuNg5
	9IZ7WdVJFucVTrMFRmI+ZuWiEAZwBesBzjHHZCWdPrPFCVvUhPHmwdAI09ZpP5rUTX3SPxCwNukR3
	iN/jtgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6u1-0000000518D-1a6w;
	Thu, 07 May 2026 22:09:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6ty-0000000517Y-3SxU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 22:09:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488ba840146so12172755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778191740; x=1778796540; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=trZCIv4VUbmZsT+tqtZK8MjDiIjWO57JQfjXqAJtZwc=;
        b=bVQ461dS6+6k1kA1bxJuE/SZRh4EpBtoGVk2IClVUoRQIPIpWHbZ8Oa6fU4pUmBZFa
         JpY1SXun67eDW7lQKZg6t8DrpOedkN6NFWzz2qmZ8BjnTrdkh/0UbTt1rk5vU5pRhd1Q
         RJFpEbvCBmxuXocmcx3R+EUXvuBn118YNYUgANTCvinZqY7f+KfljYPIY6Ufj/luxtPg
         IqbK+e4PoYGq331psJUUsScWNoHrU+dSct8tf05k5Hbn7dZ2RYp5M9ph4N09HJr4JoUz
         dfl8+0a78VsRfSrkIjazFBVPEPWu4YpeR8coCzZvUUf3BuKMv/ICEYNgLWUWtkRMDHkE
         vjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778191740; x=1778796540;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trZCIv4VUbmZsT+tqtZK8MjDiIjWO57JQfjXqAJtZwc=;
        b=GngKyKl2apFADE9aREn/CklOeaAYNe7ImqoUQpdRviaxsrJoMCtz0sqnXsVLSVa4Ab
         2cYQMfEdJrr5FMlK0gV+seMK9+/LB+aP7xHidGqnS8/PL2PT+yDRll39Nr6YFopUkJa/
         /m37arv37DOFwZB+hT+7o5lQZdfynXuZOJLO3Ewrwtkrf9r74O5ZBocbiwDxzYK/SjFV
         tBxt8RuOxsg/H7gldXzdYnullwWKo1UBzYHAM7x9sXlRMuQjrvPhGQoazE6GLBxeY5qA
         9srJeGjvJYR393bUdQnX/IyxtVxEyKNHsfy1zyy/VEr8CmgdawAyvBbuG2JbTvDiq5us
         E0rw==
X-Forwarded-Encrypted: i=1; AFNElJ+dozBC4eDq7vFYjDbcUe+9xVQkWIqqM2IDAB+sH2ZQ48yaOlN6bG7aR3JLdRH/jSB0mylLEnFmnggeLT68lrXR@lists.infradead.org
X-Gm-Message-State: AOJu0YzY49BgYc7+k/ripAVJ1CRmntdMlmFQ6oJK86SLm671ROtEEBdV
	CYfFRcUpzw18MFi6otNLA3EMebDYa1h+LSaauww+wXVA/0kWDgrxp1VZ
X-Gm-Gg: AeBDiesU9p7aNjSJcFcKcJlJuQB26qoZf7/l/W9Ziw1UP38n6fvProuR+ieCgE+0cyL
	SPIUmyy2SebwdswbRiLjdi5FcM7Pm2kJnJIZxCykh7n2GZZHWf0tYdCKxvFfvCsGbhmxp1aiFpi
	oWPBefBhTCwfnq5ISwOgsNYy5G2ooYyTj4TwmzlRCABcTdKYqJLTafDaPhHLhhcYAhlRB9IFhqu
	msyr1dKwekWjltUeQmMD1OKlZYda45djUcfxCDPApERoGbKCvDM/m4r/PP3h1CREmQ62JB6SF2H
	c1owrZIcFcQy49pQY6DybUq/JDLcDbRJc+avVqOj4ZmeMx0+1gTuwaewCN6oHqcEvi1z0LGybmF
	suozHukT60IEi1pRt5db/n1ldeiBRP8igNYwYtp58/HiBb847VaCKMmRPVTVqYBlobz4GIYsYyn
	F9KDtRd2Z7+VZr9D3m8O1es9ej5EWLdY+ksPT/L+m6qcf+Zvko
X-Received: by 2002:a05:600c:3548:b0:487:1108:48b8 with SMTP id 5b1f17b1804b1-48e51e0a60fmr153507315e9.2.1778191740007;
        Thu, 07 May 2026 15:09:00 -0700 (PDT)
Received: from silicon.doe.home ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412de445csm1834705f8f.14.2026.05.07.15.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:08:59 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v7 6/6] ARM: zte: defconfig: Add a zx29 defconfig file
Date: Fri, 08 May 2026 01:08:49 +0300
Message-ID: <23095518.EfDdHjke4D@silicon.doe.home>
In-Reply-To: <CAD++jLk02QnkXYwJ0b6x=qw9stR4nPrjD3sYPOvWAQz8t9OsUA@mail.gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com> <5379905.31r3eYUQgx@strix>
 <CAD++jLk02QnkXYwJ0b6x=qw9stR4nPrjD3sYPOvWAQz8t9OsUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7940474.EvYhyI6sBW";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_150902_894965_487F7517 
X-CRM114-Status: GOOD (  27.12  )
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

--nextPart7940474.EvYhyI6sBW
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Date: Fri, 08 May 2026 01:08:49 +0300
Message-ID: <23095518.EfDdHjke4D@silicon.doe.home>
MIME-Version: 1.0

Hi Linus,

Am Donnerstag, 7. Mai 2026, 15:24:38 Ostafrikanische Zeit schrieb Linus=20
Walleij:
> Hi Stefan,
>=20
> On Wed, May 6, 2026 at 7:39=E2=80=AFPM Stefan D=C3=B6singer
>=20
> <stefandoesinger@gmail.com> wrote:
> > I'll send a v8 with some of Sashiko's (very impressive)
> > findings but keep the defconfig.
>=20
> Maybe not send all patches to soc@kernel.org right now because they
> end up in the patch tracker.

I meant send them to linux-arm-kernel@, not soc@ just yet.

I propose to hold off on adding the new SoC upstream until the clk and pinc=
trl=20
drivers had at least an initial review. They are more complicated than this=
=20
current patchset and they will be necessary to do anything useful with this=
=20
SoC. I expect to send a first version of the clock driver over the weekend.

The important thing with the submission to this mailing list was to get=20
feedback, so I avoid building a long set of patches on a shaky foundation.

> For a new platform that may be OK though...
>=20
> Nominall it should be three pull requests:
> 1. Platform
> 2. DTS files
> 3. Defconfig

So I read https://docs.kernel.org/process/maintainer-soc.html a few times. =
If=20
I understand it correctly at this point "pull request" still means emails s=
ent=20
with p4, correct? Or does someone create a git repository on git.kernel.org=
=20
for me that I can use to send actual pull requests?

As I understand it, my 6 patches then go to the 4 corners of the kernel:

Patch 1 (dt binding) to devicetree@vger.kernel.org
Patches 2 (platform), 5 (DTS) and 6 (defconfig) to soc@kernel.org, but not =
in=20
one series but 3 independent ones
Patches 3 and 4 (UART) to linux-serial@vger.kernel.org. I think this can an=
d=20
should be a series of both patches belonging together

It might make sense to send the DT binding on its way so it is in place whe=
n=20
the SoC maintainers look at the patch that adds the new platform.

Do I understand the mechanics correctly?

Thanks,
Stefan
--nextPart7940474.EvYhyI6sBW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmn9DXEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoixokQAJhmmO8EPvppOjAKiU0j
VdiM0KDUx5XdfQy6Y3qibMHrfltre+BU1sXBALudR/Cu6eVqbRG7LnTS/SnW1HJV
nikfjKT1fNHMgbObi7u6cg/h7vAN8nH5GLgB+cXLO6WO+227c1rusLbDW7ofc3NW
5B6vIjy7FcGfNv2vLHucbdANPdwqrJWN/Ls5qHMUPmOo6Dqyp4t6KUUdlIHte5QZ
TwKse0rRM0gc3qkeiL1tAWyDGAsx3l0nkWY8Dbrv38rhF/GbnSo58wv8QGUKEwoj
7JEmr/4EKArvnpz2Hw3Kstgj2E9e2OUqV0Ba6LCKGhq5oV/+YQ0PPIrepFFznmCf
dOs0Ek838VCedQ7tTNr689DQiQqcfc9xaU9BZWOBx8c6neW6dqlLXb+Z+PzmcAMc
qwIMk7D+ryNHp8zKF5zc2P4GXwpeH5W87wU8y/pAscTqkBHe0lJqmqAemRqR5GQ1
JrpbZ9+q19rh43uWQJDc/gpBm+CqzfFRIpPHpZvgqC+C6tc+IfERZPVzp/qjG6Ee
QKks/Sw6Ppz24RhR696N1fOadSZpEBM2982UXlpTmBE6SbdMpIwycjtlakyx+qmY
31Vt8syR+uK7HDGzKaGdXU/IouS4tJ43mfi1uIPAy7OUWlFq+3foENXKECN+E9kQ
caBl+NzhrviDrlkehVYTcNkx
=U1tW
-----END PGP SIGNATURE-----

--nextPart7940474.EvYhyI6sBW--




