Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65694C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BNLjiFIOG2P1Jvd86TR0xlX9AA+JzbF7W9zKST6qIE=; b=4nLo7lJzNLzd3BGjzgIEgmwrYp
	9akU8onUqJAluRvUoh8p7k4aoujPIN19dHh5//VdGSm6JYjbgFK9JK244nfC6LW4ck2ph3+gHVNMM
	AQ2yOfIddkdfRvpKAE5w557Y5GzMfc1qwjbhS9AJVgxDAuMKE0cDVxiFENI6GQS1JokEk6Lgf1fTE
	o1d7lsWLxrBXoQUA6dns4BVWIDqXI0SEb7DmeZlp3isnFOy+TVqBD2H5NXINRISgSuIqSjkX9I9kc
	laosXuHQ8An/DvVfVcp15krFUMLsapn0q9HL76k2E5tUcOY/qK6OAkTdL3aKbF29L8PEuqhI0TWgK
	HbwaaoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPPG-0000000HYD9-3GRz;
	Thu, 13 Aug 2026 06:59:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPPD-0000000HYCH-25hm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:59:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4956242332dso15974565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 23:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786604349; x=1787209149; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3BNLjiFIOG2P1Jvd86TR0xlX9AA+JzbF7W9zKST6qIE=;
        b=i1VcpjWy5hV6HagJzAU8I0uhjQp+xvT8xq1qgT00/d9jNk/RCnvX+vTOPGshQiN4VO
         OVDWGiPcLs+PGOIh3IxQGRIF9AFI5A16zdT8DZyJ+vHUSqQDKKcz6ZTcajWDD07EFK2P
         dklUemS5yKJnmf6Peh3b9vj/d+doc+PCtQY+A/u2Uz8vaDQI1QqdLHSXJLJPX5NwLeu+
         yM8huwwGiP70213cURdgK+IJx1U1zEUV+58UsWt05mGq+pHxACJn6UNm5fSSefbbdK5w
         Iw3VHje15P/h+6girCuX+AH8sLaM0DXruUwdgVjHjU7eKYFsZhyeNSWBpcX5D2zbL6Vi
         Tftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604349; x=1787209149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BNLjiFIOG2P1Jvd86TR0xlX9AA+JzbF7W9zKST6qIE=;
        b=Uz7Vz+GuMVVUpGz3TMEd36ONNuRq7Grtce8JOn5j+UzbGAxtX5zLaNd1MNuJF2YU/h
         zNRvvfAwTPIahPuCr001ZdKFrRdp+CMPDEL/tbo1a3oJg4EZALcb9twQsWEBne8aCxg2
         WQNlf7SjGb5Uww88dcJfCJPkQFiy4vULn5N3nQXd9nnBkH/oa870s0B4E2NsC+pEPgHz
         Euhe+GuRI10G7e3B5qyua77nXQrQMzvZV2IxCFZ7II3XpdI9If5NimuXaquSX1G8tUf/
         KjBjePYVWuHmKi9YrKwsmS9HUQ3MtG1QLgVLq5bkUqmLqt0VXTyf3StGpCvRDC0l2Vs6
         THLA==
X-Forwarded-Encrypted: i=1; AHgh+Rp10s/a9lPt3czkcjj2Y5G0tRc6zVaq0D8E5wZYITEl0elP2/o2vgupsMTCDPtmmt47ARW2KeY5NZxStHi8bmYU@lists.infradead.org
X-Gm-Message-State: AOJu0YySBZW7XSzbaWpDwZe0FEq1hyataXb8xfk/a3FvpZXolYIOB4/J
	tkY/Svb7xciL44UGZcqk9zWG07Xe+3EwjCnwFThzegJYHLOnCchct9GGt6bft2aG48o=
X-Gm-Gg: AR+sD11F3CRQ3xGJpUjWmmaSx2X71p4NS8G0T9Unc+cq/Xxvt1rlJ3bXO30vtwZnkVn
	RoEMxCX6M8hqR5fMSzPME8/rtOrr0c68ohrdbQa4+J8tfue5tVTwdPrNoRBr/Q461nrc1CguTOD
	SLZDA29vmT3XjFr9Z2wPlDljNJCL4gEm3a7K5NUezIPjVWz8nYjn7rA2UrEkhm5BCTMc0iYBgtA
	aNnVlTpYVdgEuwdyXZccOp/MPoh4mH+MrqXz5i5CVacI1hl5cMec0e6cvRJj2bg0tjwY+zDw0+t
	Igk0AUb+acA2gAG7H22BNr8ez//kAy7KlERfts/aBGyW03veoujl+VKmDPAwrzuNHiBS4crUb6A
	kv8tDu+npTcUOENgnsSSpo8BUxZCIyKgrJyWDmqrHKQbfiX/Uckld7R9/6enPTVHe97atOcwioJ
	g5eR+Xt2VVeMCBOAdhTkhQrbSZycUagOEWIzLaRvo6luAZfu0J3obCBqQW44Qv5vAiiw==
X-Received: by 2002:a05:600c:1d1e:b0:495:641a:bd3f with SMTP id 5b1f17b1804b1-499821d295amr35363365e9.13.1786604349134;
        Wed, 12 Aug 2026 23:59:09 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49982165351sm33566005e9.10.2026.08.12.23.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 23:59:08 -0700 (PDT)
Date: Thu, 13 Aug 2026 08:59:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ian Rogers <irogers@google.com>
Cc: Will Deacon <will@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
Message-ID: <an1qE5g9GW7OJceP@monoceros>
References: <20260812002728.2283079-1-irogers@google.com>
 <20260812052417.2361040-1-irogers@google.com>
 <anwuYYxLFbtDmmHx@willie-the-truck>
 <CAP-5=fW9bH_yd2VF+X1jnem91+dOHPjP53uNQ8x69xFmjLbt4g@mail.gmail.com>
 <anyd_NS4D8KRIuEW@monoceros>
 <CAP-5=fUrvxsJ09BtPy-3beSoypBG6LaNjX1iL4aKMMEC8LaH2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gi6uudmibuugdytf"
Content-Disposition: inline
In-Reply-To: <CAP-5=fUrvxsJ09BtPy-3beSoypBG6LaNjX1iL4aKMMEC8LaH2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_235911_582144_54A196FA 
X-CRM114-Status: GOOD (  23.36  )
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


--gi6uudmibuugdytf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
MIME-Version: 1.0

Hello Ian,

On Wed, Aug 12, 2026 at 02:37:32PM -0700, Ian Rogers wrote:
> On Wed, Aug 12, 2026 at 9:26=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> > On Wed, Aug 12, 2026 at 06:38:24AM -0700, Ian Rogers wrote:
> > > The changes are sent in reply to each other because the entire series
> > > is visible in one mailbox (b4 mbox), which I find easier to work with
> > > and provides me better context. Others use semcode to do something
> > > similar, but I've not explored that.
> >
> > The usual recommendation is to start a new thread for a new revision.
> > Depending on the mail reader (configuration) new mails to an old thread
> > might or might not appear at the end of people's mailbox where new mail
> > usually lands and so might be missed.
>=20
> Yep, I agree. People who configure their email client so that a thread
> doesn't move to the top of their inbox upon receiving a reply are
> prone to missing subsequent replies in that thread. I suggest that
> people in that position change their email configuration, or use
> lore.kernel.org, which doesn't suffer from this bad configuration, for
> example:
> https://lore.kernel.org/linux-perf-users/20260811083828.2057695-1-irogers=
@google.com/

And I suggest that patch submitters read and honor the hints they get
=66rom relevant members of the community, to make their submissions easy
to work with and less annoying. And no, the solution is not that others
adapt to you.

Thanks
Uwe

--gi6uudmibuugdytf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp9azgACgkQj4D7WH0S
/k74TAgAgl/E9K/Ppx9iCIHf2mu930Fj3swFvVkP3RocXwmv1+UvBqbTGgDLHzuw
r27kX7YVEUQkqPIiVONTD3EQD0JYi4I/oQZpWVFdDPq/RGXQXFlbLlbmOJyQbe6a
APmnD6QGm+CyEXc+YBLPBJD5n51Z40sh5zUq/jVyDGIgRSwNHl6L2zeK/FF89nuW
sWoSvNY9kb8APqjca6cuoZ3l4pKgSoKEP1eLKJvfctTa64JJQ8iv+NQnDtsDAwtf
8h6sI7+Yg34qr0ZalF8MQHDYNHPlusp81tqrFswP89QVVZ1eF0cgJ8M8KQlDx2zo
8WgbGX7VozEa5He73YAL0SiAX0AjvA==
=vp29
-----END PGP SIGNATURE-----

--gi6uudmibuugdytf--

