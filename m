Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16937C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iEKTaT2LElUyz6hn/T8Mh2vQ8hFTWoMkAbmwi0/NDg=; b=bDXSEGXsxymIVI0luAYoirTkID
	GwFl6g8wQaJs2D2E7DhvxLBSR7wu4oAl6HRaYI08LSRi8s1bfaK2yCcqQapmAotHRBlDdeUz9IyD0
	r9c52O6b95iciMaCVvOmS/BKQuXfeiHYvOqN4P03E4Ddw/SS593sTYAV5u4ICDhqDU0bKt7sJzsq/
	tEKXwX8ZLwB0Z0WEG2dtBobs9Z9iwUN2dnPqeKN5xV1TyS2Nfw97Qpkk4f0WIoJp9hpXxwuS13qmq
	2AM1OzuP85p0dksbhpXVHBIyrElyd/hbni22se8ONPU2au0r0XGq7q0f0/C6x3+BRX8PJjjwJtzdO
	WnxuarLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNT49-0000000HULZ-2Ope;
	Fri, 06 Jun 2025 09:08:45 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNT21-0000000HTx2-1hQ0;
	Fri, 06 Jun 2025 09:06:34 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a4bb155edeso23825791cf.2;
        Fri, 06 Jun 2025 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749200792; x=1749805592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iEKTaT2LElUyz6hn/T8Mh2vQ8hFTWoMkAbmwi0/NDg=;
        b=JV6HUnbGX8+VWibr1X3cwNJDNiVlmOsnjnxJPnfxrMqPIJSAfzHaL/7mlqNaay+Lm7
         6ruXRgnC0v7dbPGfMhB4c/IAS/nQGnHJt1QCPuVE4A5j9OhScJOfx80fJF/aMskf1cVp
         A2b590eB428vG4cELmnPAwvrEOUh4HGyi9CIy0zG3y/B8HcB+Kq6NfC6oZtu7a3kzxik
         wkCjnaGe7x8akSRbPH4WB3/+IAUcrUtr4xFGeZ9La4wv2g6Hc6VefteqFiVGCBqBcp7E
         RmG/wd6RiT+QbYReOkP8BHM4oZKZ1uAV6uv1xh65ZDceGuH4Gmp4c3qYio5EFi5CgQPG
         YMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200792; x=1749805592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iEKTaT2LElUyz6hn/T8Mh2vQ8hFTWoMkAbmwi0/NDg=;
        b=V1OGxw6FDVJ71fgxI+NU0374boGEuxonyZUKKI/X2/THw/hXxCMDQ0No4ZXz2hrzRA
         DMLfL7+wsHPgBBDNqpY5C1cxgTLjJfA84G3CL11dbNpDXcs5jPU40uXrAykarwVL1MNu
         Udb4an2D22nGE07d/EJeF1ZRhV2Kj4hMjDGCYTpaFGOtLsyz1Z1OKbakWkhBjNiOuOOg
         hfoRvJajj+HDuOYv3gtOWCgFkNNztWepR53s2+H7htGMdnY8jngqsGqQJamVZP8SJoHk
         wdO0IZbppQp7oOdgrVyD1mgnKvOnwsLCwuV/tppPES8tMn5RyqI9/SlyrsA9nkyDR3wu
         xfkg==
X-Forwarded-Encrypted: i=1; AJvYcCU6wzooxLEy0E813TVKAoNW05+VKVH8Z59FBoUNoVOjCGEGIyKUcVZrq50ssBMxj5Ic1xwYafJfb+4o@lists.infradead.org, AJvYcCW0JdY0D9GLdjdoymtzN7Z+oms0z7gITseEifp0dBV3qWmmxQsw6PHtVltij1cAHqUs2C7ogK7L5GQ/AswBo9hw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9sx+wRe9jB5Nmp8CjHyFHP6WRIE6Uqmhg3mTn/hx6LjBF3Crs
	NWu2vLFS9T+xgmidvG8w7TH1Qf/2AsTASUyJo1K4yxuTaW1oFOoH+ITnDOfNfkuE42k+obthslA
	Y1Voca5dP3KiBYhRLzZmrDovMMKre3WU=
X-Gm-Gg: ASbGnct5yubcERJGeK5sDSCgZGx5Y+Z3HLRGWvQPBN0+BOFQY8nwkSXK6f6M6YIgQbK
	8zvNAz75rOScdwffhwNENzAbWC86dmPwemhu6LOswX7viMzRTpXFn5E6FjEsdRNRVBgfFJsCfo9
	7rof9cpdJOqLJCgvRxS83mt7cjYu7MScjQSZ7+8xTaisxPtyft7lPxiJYTWtAoMsWRfhE4GgrUy
	DAY
X-Google-Smtp-Source: AGHT+IEAnnzIxtW3T+9hMHK+wBH7ZD7AMKC5gNvjX9nEPuofdL7PSuw1v4ThDP1ou2X6MNg+w1DXRb5CyDe5GpT5zFk=
X-Received: by 2002:a05:622a:90a:b0:491:20d6:75ff with SMTP id
 d75a77b69052e-4a5b9e55b32mr50608161cf.31.1749200791922; Fri, 06 Jun 2025
 02:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
 <20250510-wmt-sflash-v1-1-02a1ac6adf12@gmail.com> <20250514204159.GA2988411-robh@kernel.org>
 <CABjd4Yz3w75PtkRk_edzD5yf6b2xPuf20gopbm8ygddgCBfpkw@mail.gmail.com> <2b520ae5-eb0d-40eb-ba73-cc18759f33b9@kernel.org>
In-Reply-To: <2b520ae5-eb0d-40eb-ba73-cc18759f33b9@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 6 Jun 2025 13:06:22 +0400
X-Gm-Features: AX0GCFtSe5pvb_MWkkzTKnls_WaiQE0eICzI9uRkedvlSrNICRkV_prB9UA_SHY
Message-ID: <CABjd4YxRMfi3ZFQxhB__6U4Rm3KQ7bm6J=wQLWAkpb++61ddEg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add VIA/WonderMedia serial flash controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_020633_441406_9E9CBC3B 
X-CRM114-Status: GOOD (  17.70  )
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

On Fri, Jun 6, 2025 at 12:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/05/2025 21:50, Alexey Charkov wrote:
> >>> +
> >>> +  "#address-cells":
> >>> +    const: 1
> >>> +
> >>> +  "#size-cells":
> >>> +    const: 0
> >>
> >> This follows the SPI binding, right? Drop these 2 and add a $ref to
> >> spi-controller.yaml.
> >
> > Need some advice here. While this controller speaks SPI protocol to
> > its connected flash chips, it's a special-purpose thing that doesn't
> > expose much SPI functionality to the outside world, nor can it drive
> > any SPI devices other than SPI NOR flash. Does that still qualify as
> > an SPI controller as far as the bindings are concerned?
> >
> > Happy to reference the spi-controller.yaml binding if so.
>
> SPI NOR flashes are still child devices of an SPI controller. You can
> look at other examples - aren't they all using spi-controller? Why this
> would be different? Unless you found some cases that are different, but
> then which ones?

No strong opinions here, and no expectation of any special treatment
:) Just wanted to consult on what's most appropriate.

My (subjective and perhaps unfounded) expectation when seeing
something advertise itself as an SPI controller was that it would be a
general purpose SPI master, to which one can e.g. connect an SPI
driven LCD screen and get it to work with generic Linux SPI
infrastructure - which would not be possible with this single-purpose
NOR-only flash controller. Given that I don't know how flexible or
restrictive other examples are in terms of driving arbitrary SPI
devices, I thought it's better to just ask.

What I'm getting from this exchange here is that I'd better use the
spi-controller binding and respective node names regardless of the
fact that this controller cannot drive arbitrary SPI devices beyond
NOR flash (which, as I'm getting, is irrelevant after all).

Best regards,
Alexey

