Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA76C2A075
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 09:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xS4Pieemzy4r1o+XZyR7jxfKf1/JCiqumXmtg6ZAf0Y=; b=cVtjVYMXrG0VDA7kUleeaAJgUa
	39WC+R7W90X75+bVBwBIgRf3gOuVK3yJ2ioLOzu06PJjmVDjML2cXbrKHU680WdYFmi9Y7ZAnl700
	PSXcDQ1T26qBu7JIDG6LW5dPYgzwy8zYwfp4uexXrkRdFLU1xdEZ5MkncPf5dEAejyA8huY3iSb1+
	WYEIdM5uvRkwuvNmyjVZIjilsgxWCPpWo/t0rdsSETptzjwjNRyiqyilqvUVImT1i8qLg8nH1CP1x
	lxZ414XJehcgi/6iYuUJbrf619fsYJQrp4dU0AIwY07CJNczytsRwNd/vRDpBahEC2fX65nt7F1rR
	ZDj195VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcghN-0000000B3Od-3QG7;
	Mon, 05 Jan 2026 09:16:25 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcghK-0000000B3O6-3zL5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 09:16:24 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-3e80c483a13so9238851fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767604581; x=1768209381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS4Pieemzy4r1o+XZyR7jxfKf1/JCiqumXmtg6ZAf0Y=;
        b=DRZMCp0JAF2+YxYZV+eJpbbk8eEMXK9M32zbRg/bG+mp7j9Y5xRBRDYiBOTSVtKKwG
         CNJROYHomhx9vzoM9/xWGL6WGBY7Aq9KC9njtg3KP+AjkcEOtnhAg13zFEhA+rFftLsz
         067oCbX5B9LylQNUu4Z47/adSa7Swoz6DVRvqRJi4z7H4oV8ytUoj9l0+6I46p2fOS9D
         cVkUsnGlSK8cT+LwCR73SeJ4v4APqLDryPQCLZ6wu4/8rruEUGWZdnUuA2xoy10Irl8x
         /XF/q0dsvhkNG6OO1+4HQFAmKYe0zvXJAZSvwvh1LDCv5CM+ApZM0faYLWc7IBtjl0/A
         Hd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767604581; x=1768209381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xS4Pieemzy4r1o+XZyR7jxfKf1/JCiqumXmtg6ZAf0Y=;
        b=NVjW9WaCVxP7vVvMF/njcq4OKkGooxOI7IZhoLuXKzsiRn6ed6yBR1agOEg5sxiES7
         VO2OVlMaZUOSgtHFvz7O55Sy1WrW7Mt5mvjMJ23j2BN5s1O3psys/+TEc3KubID91i6x
         WB/4a7lKtCrkTrhwcauVJ+9PdXUJa3fhwJ7fUP7/uuRS5/rr9WOjyCLlWEmWdXR4nK/A
         fjTL+6lBlIyAqQwSRg6cmqBzYKLtX7l1v9aNp9KmpeiYR5Ij9eyUBasIE2pamq4eQU43
         NG6NMtN+WK4GBXJCAwayz4wllzXuxKyynoq8gIFfhEg4kP/VZwjFergOO9Cs2+AgjFt2
         LwCA==
X-Forwarded-Encrypted: i=1; AJvYcCV9clBbvHzH6e11o1VyDgqyTbA11BmzAA0LyTOtlMygXJcAJ4OFIV/t1tL0c5pVgBhM6494l2elnOYobZUExnsV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2aMw8D8ZPmPmMbjk+PmW6+cCK3Ombl/57XI99aq6HagUogss2
	u4b9OrzTZxXwhtAx9txyZ+xNmK5YQSZ++q7Ikk8PNpnI42yfW+e9JL53rtxEhzoXmYYznG8sXAJ
	jSEGmFya0aBCkMfTgqVG3bCZy3DvwedSXA7yKx1wlOQ==
X-Gm-Gg: AY/fxX64a7uyj+WoPt1e68JAAF7uOOTvLFaR/Iy6zw7K6mRfz+7ChM91QCe/PrnPXNi
	SXqVdJ4URuWKe9Ki6tEXU16j1Jftiy8fp5R+AmvyPfqJxsjruSa9EIikh7DSXL16+4PIp4RzXvq
	e6cPZu3q8PiwTMcEHcSOPiUn7xR/ZgOhp7wPDuMjqAOuW4HR3N9YHOSxjOo8zZdefx/t8r+DPe7
	kM0yJWJMSeuOLxAVe5nP2BYyS8tfSsO0j4r8mw8XCbe+RhyQ3GyCuvO3XvHYngW14VWqNcUJZkP
	twou18THBrPJ/87Gav1RHDsTjg==
X-Google-Smtp-Source: AGHT+IHdtu3uK1YvLPvRXmBmsYletnr+Fy6yEnWw7FcQJMBZUAFsUyE2L/0PG3GpU/2KGeBY95bkFD0S8glmAzrpFaU=
X-Received: by 2002:a05:6820:2289:b0:65c:f9c1:cba0 with SMTP id
 006d021491bc7-65d0ea16a88mr23376881eaf.37.1767604581140; Mon, 05 Jan 2026
 01:16:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
 <20251218135332f323fa91@mail.local> <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
In-Reply-To: <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 Jan 2026 10:16:09 +0100
X-Gm-Features: AQt7F2q8lTcIoa5xBnvz2Mkjx2axWX5OMGPJpQNfFM5WoFI2KGlEdVoT6sJvPQg
Message-ID: <CAHUa44HqRbCJTXsrTCm0G5iwtkQtq+Si=yOspCjpAn-N2uVSVg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] tee: Use bus callbacks instead of driver callbacks
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jonathan Corbet <corbet@lwn.net>, Sumit Garg <sumit.garg@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_011623_001789_EBB9010A 
X-CRM114-Status: GOOD (  38.87  )
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

Hi,

On Thu, Dec 18, 2025 at 5:29=E2=80=AFPM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> On Thu, Dec 18, 2025 at 2:53=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 18/12/2025 08:21:27+0100, Jens Wiklander wrote:
> > > Hi,
> > >
> > > On Mon, Dec 15, 2025 at 3:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@baylibre.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > the objective of this series is to make tee driver stop using callb=
acks
> > > > in struct device_driver. These were superseded by bus methods in 20=
06
> > > > (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> > > > methods.")) but nobody cared to convert all subsystems accordingly.
> > > >
> > > > Here the tee drivers are converted. The first commit is somewhat
> > > > unrelated, but simplifies the conversion (and the drivers). It
> > > > introduces driver registration helpers that care about setting the =
bus
> > > > and owner. (The latter is missing in all drivers, so by using these
> > > > helpers the drivers become more correct.)
> > > >
> > > > v1 of this series is available at
> > > > https://lore.kernel.org/all/cover.1765472125.git.u.kleine-koenig@ba=
ylibre.com
> > > >
> > > > Changes since v1:
> > > >
> > > >  - rebase to v6.19-rc1 (no conflicts)
> > > >  - add tags received so far
> > > >  - fix whitespace issues pointed out by Sumit Garg
> > > >  - fix shutdown callback to shutdown and not remove
> > > >
> > > > As already noted in v1's cover letter, this series should go in dur=
ing a
> > > > single merge window as there are runtime warnings when the series i=
s
> > > > only applied partially. Sumit Garg suggested to apply the whole ser=
ies
> > > > via Jens Wiklander's tree.
> > > > If this is done the dependencies in this series are honored, in cas=
e the
> > > > plan changes: Patches #4 - #17 depend on the first two.
> > > >
> > > > Note this series is only build tested.
> > > >
> > > > Uwe Kleine-K=C3=B6nig (17):
> > > >   tee: Add some helpers to reduce boilerplate for tee client driver=
s
> > > >   tee: Add probe, remove and shutdown bus callbacks to tee_client_d=
river
> > > >   tee: Adapt documentation to cover recent additions
> > > >   hwrng: optee - Make use of module_tee_client_driver()
> > > >   hwrng: optee - Make use of tee bus methods
> > > >   rtc: optee: Migrate to use tee specific driver registration funct=
ion
> > > >   rtc: optee: Make use of tee bus methods
> > > >   efi: stmm: Make use of module_tee_client_driver()
> > > >   efi: stmm: Make use of tee bus methods
> > > >   firmware: arm_scmi: optee: Make use of module_tee_client_driver()
> > > >   firmware: arm_scmi: Make use of tee bus methods
> > > >   firmware: tee_bnxt: Make use of module_tee_client_driver()
> > > >   firmware: tee_bnxt: Make use of tee bus methods
> > > >   KEYS: trusted: Migrate to use tee specific driver registration
> > > >     function
> > > >   KEYS: trusted: Make use of tee bus methods
> > > >   tpm/tpm_ftpm_tee: Make use of tee specific driver registration
> > > >   tpm/tpm_ftpm_tee: Make use of tee bus methods
> > > >
> > > >  Documentation/driver-api/tee.rst             | 18 +----
> > > >  drivers/char/hw_random/optee-rng.c           | 26 ++----
> > > >  drivers/char/tpm/tpm_ftpm_tee.c              | 31 +++++---
> > > >  drivers/firmware/arm_scmi/transports/optee.c | 32 +++-----
> > > >  drivers/firmware/broadcom/tee_bnxt_fw.c      | 30 ++-----
> > > >  drivers/firmware/efi/stmm/tee_stmm_efi.c     | 25 ++----
> > > >  drivers/rtc/rtc-optee.c                      | 27 ++-----
> > > >  drivers/tee/tee_core.c                       | 84 ++++++++++++++++=
++++
> > > >  include/linux/tee_drv.h                      | 12 +++
> > > >  security/keys/trusted-keys/trusted_tee.c     | 17 ++--
> > > >  10 files changed, 164 insertions(+), 138 deletions(-)
> > > >
> > > > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > > > --
> > > > 2.47.3
> > > >
> > >
> > > Thank you for the nice cleanup, Uwe.
> > >
> > > I've applied patch 1-3 to the branch tee_bus_callback_for_6.20 in my
> > > tree at https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-=
tee.git/
> > >
> > > The branch is based on v6.19-rc1, and I'll try to keep it stable for
> > > others to depend on, if needed. Let's see if we can agree on taking
> > > the remaining patches via that branch.
> >
> > 6 and 7 can go through your branch.
>
> Good, I've added them to my branch now.

This entire patch set should go in during a single merge window. I
will not send any pull request until I'm sure all patches will be
merged.

So far (if I'm not mistaken), only the patches I've already added to
next have appeared next. I can take the rest of the patches, too, but
I need OK for the following:

Jarkko, you seem happy with the following patches
- KEYS: trusted: Migrate to use tee specific driver registration function
- KEYS: trusted: Make use of tee bus methods
- tpm/tpm_ftpm_tee: Make use of tee specific driver registration
- tpm/tpm_ftpm_tee: Make use of tee bus methods
OK if I take them via my tree, or would you rather take them yourself?

Herbert, you seem happy with the following patches
- hwrng: optee - Make use of module_tee_client_driver()
- hwrng: optee - Make use of tee bus methods
OK if I take them via my tree, or would you rather take them yourself?

Sudeep, you seem happy with the following patches
- firmware: arm_scmi: optee: Make use of module_tee_client_driver()
- firmware: arm_scmi: Make use of tee bus methods
OK if I take them via my tree, or would you rather take them yourself?

Michael, Pavan, are you OK with the following patches
- firmware: tee_bnxt: Make use of module_tee_client_driver()
- firmware: tee_bnxt: Make use of tee bus methods
OK if I take them via my tree, or would you rather take them yourself?

Thanks,
Jens

