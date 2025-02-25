Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D7EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lw7LGz5u4+UY3MSVtdaDIcTdVd1t9SjnuxeMySHbeIw=; b=cIAT/Ll5Bvq/NK4nEku9lkOuFC
	d626beR2F6zzIX0V1psTKnwT88WfRXlpW3KTQAdw7WWlUAebZQI+NgJIGH1uV9jiVO3t8NHyJZtpW
	MxTy+HegEo7vfIilIizdNxXqbhghHIdM3KO4ZVH7wAJWaD8VzNaKexXA9OP+174YSSm0IF+1d9F/e
	cX2/S13m0/VBGUNdmZkiyyohSBHcgN+Come12RGerAo1jegFVaxV1I/p0xYxxdfVTb1cfvf0t7psD
	FQAsEl6A2EScAHQAn9jyxKnjx6cB33i26Jv35ywwiLmwfSekh+c/8pJmRTDH/pd1YvFLeB/b0GjwM
	UrSo0lZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsr4-0000000Gyl0-2xvb;
	Tue, 25 Feb 2025 11:12:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsBL-0000000GpTZ-0Hh5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:28:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso33754195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740479333; x=1741084133; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lw7LGz5u4+UY3MSVtdaDIcTdVd1t9SjnuxeMySHbeIw=;
        b=rBz9MqDJmQUfA3VUZ9QYAE9FAjVGrPAWafNEKmjLNNPNWyDZVm9DBhYN7qHzfNde6F
         XgkDAIJGGzRN3Oqifdf1eXUfv9P50VF5fE84egq1bzyAh1+CyEWvkuC7m1RGJet7/j+4
         50PYGUTGq6YpXBp2FmFyNxb5tYTT+yBKKxvol/SqCXKbf8FqYfmEDp8VBbXCfSuf+K66
         6F3+uPfULfL4iloXqA9dGydL/U804eBqm4c39B9MNArcuFHHkqt/uuQ8eaXHkk6b1CPK
         hYH5bPpiDF3mVxLkOJlmzd1MCmiCEMwtPD8EaoH8MAnO9McFiSB35ueu62vPoK+7nVSd
         bD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479333; x=1741084133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lw7LGz5u4+UY3MSVtdaDIcTdVd1t9SjnuxeMySHbeIw=;
        b=IHOrLJ6pFYXL6SjhdB3wOtD0AvdPV/uAFckK4IQIXc0VZXebnog+VyjakE6dz1cDi6
         WxDQJZ9NbRxfVh5ow7rJa0lSzG+DwtfZv7PYUw6oOSy8YNVokaZCbdghUxQ0j/PTzavI
         8o2BAdBlZNJQ3EiMbFIJTiPZEUhZs7+LOYt5vIWQDiloJfV+n1o/Il8peE0jhrlZSJCp
         62ktTESud+1NRIYYOjMferNePrZAETTp/ypqBhod/eZLB7ajxz4/fUuUomh57iiLiq61
         RoGYXBeS3i7s9M8gAOxWVrs/gaN18a/k5dT1/7LP8KCcJshClkrqqlGWbxKm6wyN9JRd
         UurA==
X-Forwarded-Encrypted: i=1; AJvYcCV6WiMLFwegqndoUt9SxTGmVaCOFIhyIWIWT7FTp0ujj6J2G1rj+phUShs2gWQK01dirYZOoiVP01kwKbcI/g02@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2nJJy7/zMw5a1qJSDZHQGkpXalhklwlbgGMeOxf81QePMJgcP
	9NmrMvY5/vdDw+M2TKXjbbfjsPZIM4jKZPs8Ruhu7cHDnjeyjdKLiP0WwO7ZD1nJqmY6scfu93d
	L
X-Gm-Gg: ASbGncuCOCPCJ13AeuJ8UAog8iMRCQJBdaoH7BrsLn0kTB/a3D/obYl+5JqnYAa2+DJ
	qkzPnIjsBoZMmlOEaySddWqm7qzW3jXe9QZW3LIjVZgsidbN9DrJm/jSfpdxu/RFlZHwv1DCEFr
	WcRTdgCLp7fLCVwME910GNK+xK3017wpP47ZlYzKQGFlGpoXuaIWe18axqU2Bo62TIyh+HL778u
	5A7gC2O3qOmzRlhHT0o1r+o2/8Bapoh4W/Ug2qQ8ljhinvnqPovrlZRJCG96bxVCzFFH4EpkJ0S
	4BhjylsIBQs2j1CKBBQjdQ==
X-Google-Smtp-Source: AGHT+IEIzE6LVOdzTaiF/XQxe5YVoLSwzJB4+evEnTKWGqEM97O2xxmk4cpePWYkQ5BISMx7dPcrxA==
X-Received: by 2002:adf:ea8f:0:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-38f6e95b41dmr13202225f8f.21.1740479333083;
        Tue, 25 Feb 2025 02:28:53 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:7bba:546d:aa63:621e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390cd8e7233sm1802184f8f.66.2025.02.25.02.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:28:52 -0800 (PST)
Date: Tue, 25 Feb 2025 11:28:51 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Judith Mendez <jm@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tero Kristo <kristo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hari Nagalla <hnagalla@ti.com>
Subject: Re: [PATCH 0/3] arm64: dts: ti: k3-am62a/p: Add r5fss nodes
Message-ID: <qlqxmqluqrw36bkjaa7efcsk6cinyr2rxvznfhz6dopeu67dsf@w4lkuq65uwno>
References: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-0-f74835b91da9@baylibre.com>
 <c81ccd05-4fb7-4ec0-8cc0-c59ac4dff91e@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="obza7ftg5kvgvlah"
Content-Disposition: inline
In-Reply-To: <c81ccd05-4fb7-4ec0-8cc0-c59ac4dff91e@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022855_113542_BE6CFC66 
X-CRM114-Status: GOOD (  18.75  )
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


--obza7ftg5kvgvlah
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] arm64: dts: ti: k3-am62a/p: Add r5fss nodes
MIME-Version: 1.0

Hi Judith,

On Mon, Feb 24, 2025 at 09:06:56AM -0600, Judith Mendez wrote:
> Hi Markus,
>=20
> On 1/22/25 3:54 AM, Markus Schneider-Pargmann wrote:
> > Hi,
> >=20
> > am62p-wakeup already has the r5fss node defined, but it is currently
> > missing from the am62a-wakeup domain in the devicetree. This is added as
> > part of the series.
> >=20
> > For am62a and am62p starter kit boards the r5fss memory region is added
> > and referenced for the r5fss core 0 node.
>=20
>=20
> This has already been sent here:
> https://lore.kernel.org/linux-devicetree/20250210221530.1234009-1-jm@ti.c=
om/

yes, I saw that recently. Could you please cc me on the next version?

Thanks!

Best
Markus

--obza7ftg5kvgvlah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd8KHufh7XoFiu4kEkjLTi1BWuPwUCZ72bXgAKCRAkjLTi1BWu
P3ayAQCmje7sVfMPAH4ZyOoLuKscrkF/LVOMHgeJryGd7sabvwD/Z4OE3BQ8OMVR
Z4ksn1XTyKXHDVVnCnaiIwLS83cpoAU=
=qRs/
-----END PGP SIGNATURE-----

--obza7ftg5kvgvlah--

