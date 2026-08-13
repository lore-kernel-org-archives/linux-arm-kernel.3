Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CECC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7k8Ok3ovsH8z7i16wZyB/9R4mVj0xRZGgmoWoCE0MIY=; b=xmpmXAhnSesTUcjKP1SetgB/1F
	j36ebC2jonhPeOW1Sve9m7QXeEZmjNhyc6GyF5FcvB7xitXALTknnaIDgoykdUJZ3FlnwHPlBHRyg
	mhM3d1WzxodxnjJjfSxGJildwVUFT84209WuJnlK94zIP97IX2TyWqkIUoGRYHFblzjBikSlqUY0F
	uEkCnA0TlBuvn8fwJ2W/HVgVyXZMFXhdQy8yXJyPZcNvmRf9nmOKNk/YNwp2zvB1iQMZ+DQ5PN1oY
	urCrTGKLHZ10kuk+w2aGGoMS3OUET90uELCB46gd04K4kPiofdtmkZTbOf1UaQvX+3v7ADCNtJzjZ
	FF3naD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWwN-00000000uDO-0y9n;
	Thu, 13 Aug 2026 15:01:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWwK-00000000uAh-0m8C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:01:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49553515a8bso309545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 08:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786633310; x=1787238110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7k8Ok3ovsH8z7i16wZyB/9R4mVj0xRZGgmoWoCE0MIY=;
        b=o4i9Q35WWH/AMyac1OPvTpXDnZsiyKQExtmyWsrY7pBXBtktJwmFYDe3WtK0jJ0kOs
         WRjZWVxIaMBvy9pylmZ55EL1lM0ShLN7UIzjopGLtDHVCb/Nl/ZAzaivvuiH/a1m5n0d
         pXF4jH3upRKf98MugjDF0hGqTu2I3AsQwa5TJUt5qPDHcYx71j5inBYnmry4EmXG9k/S
         lx+AZiYCkeCQFuzOvsEi9JbJpJtz1x3Q6Mu3U98mL/rWgJ6nNQ2jQxYGOkzErJtr5rLT
         vqvPhzbnSsMvsSFh/xOvl3WmzWDMvxiVKjbMdoD+m7e+ZOOKiuQuPBTjvrdrGJbsvo7F
         mezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633310; x=1787238110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7k8Ok3ovsH8z7i16wZyB/9R4mVj0xRZGgmoWoCE0MIY=;
        b=XL0PnavLNUScx4QRIM/BuZjdATlbezcuNy3OeqqzMhz+AcuA6C0ZjCN7Z9Vbn7EU0H
         /1xguOCPPIWORnFYre1ADQVm7oiOQRdN0zCfo3aIpqn/39zBZGvBLC/NHBvn8/PBMIzQ
         64CziFNlSltBOuLfpfaIQU6Vbrpflp3KrUTjpSrFgiIIvL88qQBM1OpgowghN71ot/i8
         Ku90r6ibuDy4hSCi3xzQO78jQ2d25BzNf/p97pwlkWgSc1I01NStPSV0DQe567UIPDeZ
         DzN3G+IwrojLKU6D2f0++km6y1bdtIGuJLViMfXANHk63o6Dvqx+sNp1MCCJAKzY8zr4
         5Hzw==
X-Forwarded-Encrypted: i=1; AHgh+RqKdn1DGVq80ftLzcUwvD2Rfi4eB7u5ALLzFK8z4TqIiZvTOqPRzqJPxeGlE5A9y18yGkjp92hkTe5Bwok9QU9d@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4uMLrDm/RyyKUYWBcAyy3Mu4VBZDwKEbE1btNKXCrBkOMibg/
	/Lu4d102BNq2/N2eBpdMLIQ7T/wifwCSabRuGARHlzd9noH6U7Y/idNF1Vnt24nXS8M=
X-Gm-Gg: AR+sD11WWBbMZnqibJ3YGCkvZluYgF+nH4B0Vsa7aPge3VWAozzJHn/eBU+9T6/3zos
	drHRbEhyGT4XNu3udIMFT4vrLKHJ8s0NxPS1jG74kt5wQ6fg/jZsHOOYkByRwHCaT5+3KXW+9T5
	vi88cIb1aEbNQXK6XCQNss6OyBGDmzNHyUR/HArqdRpBJji2I1yGQ1jZ9CbcjtQrVSJKmxFTvPM
	6g390w+Sg5cMAe3fGhYKDgPbm7QukrROUsV42rkwOfwi9eJ2+Ys8LqWki73gzy7OVhrS5uewRp7
	YSI9gM/4miKCftqtKdg5E63/IMwl+Q9CnW+9rKEIOr6/8zPlzeURebI542pUo+bssjhe2K2yPc2
	kYLw4bAlRHMJHVN/i7mWiSrH5QT8hYlSrDrWLX19Zk5bQzvwUG4g8fd6/q30bO7i3lf1Hgl2sbG
	Yk/ZKjMid5h3mI4wfVlYx6jZerpgcq4j8vG8rGDpWVqwvgYE6W8EFsoULxq2gKQwVXgsemiEokN
	EHU6Dhib3dyOoIyOXyl8M0wWf5FIKfQUuVnvCTw7KycX/D3WJQSjsQTYkilpbqO
X-Received: by 2002:a05:600c:45d5:b0:496:ca1f:a428 with SMTP id 5b1f17b1804b1-499821d26demr65530185e9.19.1786633310090;
        Thu, 13 Aug 2026 08:01:50 -0700 (PDT)
Received: from localhost (p200300f65f017104a224b5246b1e216d.dip0.t-ipconnect.de. [2003:f6:5f01:7104:a224:b524:6b1e:216d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49981b03cd0sm75972075e9.1.2026.08.13.08.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:01:49 -0700 (PDT)
Date: Thu, 13 Aug 2026 17:01:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ian Rogers <irogers@google.com>
Cc: Will Deacon <will@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
Message-ID: <an3YAEn7Q0GwiaUG@monoceros>
References: <20260812002728.2283079-1-irogers@google.com>
 <20260812052417.2361040-1-irogers@google.com>
 <anwuYYxLFbtDmmHx@willie-the-truck>
 <CAP-5=fW9bH_yd2VF+X1jnem91+dOHPjP53uNQ8x69xFmjLbt4g@mail.gmail.com>
 <an2DHgfQsQ6TOF44@willie-the-truck>
 <CAP-5=fVOzmzxO2X4+r9goRxtwtWqdR15kPBP9ApSjuP2u6p7Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bhv5kdfh36fwppu4"
Content-Disposition: inline
In-Reply-To: <CAP-5=fVOzmzxO2X4+r9goRxtwtWqdR15kPBP9ApSjuP2u6p7Cw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_080152_257817_A14CDD14 
X-CRM114-Status: GOOD (  39.62  )
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


--bhv5kdfh36fwppu4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
MIME-Version: 1.0

On Thu, Aug 13, 2026 at 06:44:48AM -0700, Ian Rogers wrote:
> On Thu, Aug 13, 2026 at 1:41=E2=80=AFAM Will Deacon <will@kernel.org> wro=
te:
> >
> > On Wed, Aug 12, 2026 at 06:38:24AM -0700, Ian Rogers wrote:
> > > On Wed, Aug 12, 2026 at 1:27=E2=80=AFAM Will Deacon <will@kernel.org>=
 wrote:
> > > >
> > > > On Tue, Aug 11, 2026 at 10:24:15PM -0700, Ian Rogers wrote:
> > > > > This patch series adds an uncore Performance Monitoring Unit (PMU=
) driver
> > > > > for Broadcom AXI system and VideoCore VPU performance monitors fo=
und on
> > > > > Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 throu=
gh 5).
> > > >
> > > > Why are you sending four versions of this patch series, at -rc7, ea=
ch in
> > > > reply to the previous one? Nobody is going to review that.
> > >
> > > See the cover letter for changes. They address the sashiko reviews,
> > > you may not see these reviews as they are only sent to me and
> > > linux-perf-users, which is somewhat customary in the sashiko setup.
> >
> > Have you considered running Sashiko locally given that you work at Goog=
le?
>=20
> Yes I do. If you look at the changes you will notice that more issues
> are being resolved per version than the issues raised by Sashiko.
> Unfortunately, factors like the model, context window and just the
> inherent non-determinism of AI mean that AI reviews generate a
> firehose of suggestions that you can't reproduce either remotely or
> locally.
>=20
> > > I don't see any relevance in rc7, I'm just mailing out a new driver
> > > now that I have the opportunity to look at it. Whether and when it
> > > gets pulled upstream is up to a maintainer.
> >
> > Right, as the maintainer for drivers/perf/ and I'm just asking you to
> > slow down a bit. I don't need 10 versions of a patch series in two days
> > when I'm focussed almost entirely on the upcoming merge window, which
> > this is too late for. You should read
> > Documentation/process/submitting-patches.rst which states:
> >
> >   | Wait for a minimum of one week before resubmitting
>=20
> That's not what it says:
> https://www.kernel.org/doc/Documentation/process/submitting-patches.rst
> """
> Once upon a time, patches used to disappear into the void without comment,
> but the development process works more smoothly than that now.  You should
> receive comments within a few weeks (typically 2-3); if that does not
> happen, make sure that you have sent your patches to the right place.
> Wait for a minimum of one week before resubmitting or pinging reviewers
> - possibly longer during busy times like merge windows.
> """

I didn't care enough to check if respining a series more than once a
week is explicitly mentioned, but let me interpret the paragraph for
you:

Maintainers are busy people. Patch submitters who increase their inbox
size considerably without adding much value easily annoy them (and I can
read Will's annoyance between his lines). A maintainer being annoyed by
you isn't a good situation to get your patches merged, so better
consider to follow their advice. Once you made it to a procmail rule
that routes all your mail to /dev/null, it's hard to recover.

Are you aware that it's Will who judges your perf patches in the end and
picks them up for mainline inclusion (or doesn't)?

So yes, the documentation about sending patch revisions might be
incomplete, but if you're asked to slow down, practise some patience and
do slow down.

Also if Sashiko still finds relevant issues after 9 iterations, it might
be better to seek internal human(!) feedback by experienced people in
your company first. I recommend you to reach out to them, before they
reach out to you about annoying upstream folks and thus damaging your
reputation and Google's with it.

Best regards
Uwe

--bhv5kdfh36fwppu4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp93FgACgkQj4D7WH0S
/k5Kpgf5ATTmyu6kJCS0955udpxpXmTJ7JxCYhgN+G1BAAu7jp/u/KY2XWN8bQQS
uEQVZjMCMedQIoONcztXt+cY0IkAASER0CWkgLVDt+QnRjEyZg2QSHg+tkJNJAm2
tTVNZkrOCZsFU4+MIyBhPcySLotLA9mJsCguyI3XL+EKmoYbvQUYi7SKEooq4g34
nYmbCPL311rCBRe88Eb/oBMexpUQdCwzIf33DfApU2ASTxYBtxYJOic77El4uzjK
za8AV7iEavsb6xJFvzam6s9pSenpQCQg3w6J9VJJxtlTRybRytrKHjd8f5D5rJg7
53BVklIR3Y+A+Zz6cPPuo1Yevq7StA==
=tysB
-----END PGP SIGNATURE-----

--bhv5kdfh36fwppu4--

