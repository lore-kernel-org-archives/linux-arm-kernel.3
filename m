Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B558C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOmMWBXTx1M9wulu1amjVALQyNz4yRMvByQadLNPKSQ=; b=BBpH3kK4dl8qQ/ejma+mScB4hM
	QKZGJs2YK8PC1iHsUbGkunrR4X/78k6JFu++g00F51leTi1X3RjaQlN0oVr3mV7zrwKSpGqrqL5GC
	rBk6gSSVZxCcj/p8SpWw6uAohbMMVIUB5lRqoE+9zHyF5l2BwPZQQfS3leORaqJjRH7YA3tdcy94E
	cs+Pyv6BmP4tMHvPuRc8sQQ4cUReoUyHV1pvMjk1lZGS0Or8iucrCEZVlU9ym+FrvrVG8Iis8zd/T
	B9hyjhTDmUae8ifF9g5kKcazqhaUDHZvYR4klShzvQplopE1wkSfcubXfnmTnExQVPShMydKia7Z4
	4TF9QbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iod-0000000FqbQ-1pxn;
	Fri, 18 Apr 2025 10:19:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iml-0000000FqPD-1zlF;
	Fri, 18 Apr 2025 10:17:28 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3995ff6b066so950820f8f.3;
        Fri, 18 Apr 2025 03:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744971446; x=1745576246; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eOmMWBXTx1M9wulu1amjVALQyNz4yRMvByQadLNPKSQ=;
        b=bKAgecXFM/wfqDK5T0ewy07NU7OUkF4c85H454W0R20LoxzQBmm7nJMEX9TqExV89L
         sALO8ObyXAHtYR/MPIIOjJipRxLiUuZaJWWi3LmofVo/np+zOOokq8CncmNBwwaH4zQj
         Mk26De/sloeiYA4ckhVeLTzDaVcxpSopb7BD7dM0nAqTF+yWoSKqdqsrNx5KbsEs+n9T
         bNdvdSf2wGmwsIsHyCRlutR9wwV/AwinASN4M0bkl6Ogfi+qKEnuyBBoY85pyUYlUCEB
         M51xbxCENJBWI6GyYySnbpC/JbD072s17XM7GF5vBmKwrjpYD5VdhkotGOzdBjQsW5Pj
         /OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971446; x=1745576246;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOmMWBXTx1M9wulu1amjVALQyNz4yRMvByQadLNPKSQ=;
        b=xJRoZh/q5yELGT0HjJjAkVJ+L33+LIDGc8cxt8kaAKYQwKE34ySqozxbxQ34/AIkQW
         NeOS7zoe2JiyYJ1P0hSs9X0IXUV8rQjDfQhLyfJVSjIsTEePN/ss4M7GvZ2xv3BucirO
         1d74eJ0RbpKixV/8xMCVnbGcWTzNs1C+3vnbZ6WW00ZVDFav7HP+pddUpGql+CQ0IuN9
         tFNQfgUrKfP01xJ1EtmDQC31gyWfqu/wXm/K5xPfX/RjHfWfq95HHdj81W8L0fGbLlZB
         0Quo9UEiTlR/AJ5390wSMBLg0sn4r6tF5yu7JUKO+OnvtVh855zRtzJc+LzekzhKBtRt
         c8nA==
X-Forwarded-Encrypted: i=1; AJvYcCVapDWStoqv2qHsk0qhLb9V+XHtiJIn0gWkiJPlK69YnSIO6qvq9idzS61yRcJFwbQUZTtP1eUAxGnDx6BZXYQ=@lists.infradead.org, AJvYcCWqL55D3sqC/P5nYY3hpoLjBLajjJF9QHIfwe5DW9ZZyd6P0W/KvzGHcXze/oByxzitZNoSfs0+0MqkCd4CKqyc@lists.infradead.org
X-Gm-Message-State: AOJu0YzJfhkPkkA+y0rcycXFB+jseQqdtYTnxZI0Ws8LJAs4+EJZt2Se
	Chc+qJiChG3JMxSuEH7H0kP1hC6t/lp3g9M175o1fQaRRzEamcjM
X-Gm-Gg: ASbGncsZNfX4RWZKxpviqpv+GxPLB4yCQSEizCmF8yATPthLAbE0QO8lmQX/LMb61PI
	DmPz1G2UItLrlP5te0jNmWpRsWbKllGyOztRZPIsnRT0LPPiA773MFmbuZO/4QPZB704TvFkz5q
	vSo0/5GWA++ngdF635KNeNbS7ZdtNKP9/AkU9twLvhywjQx5rdynRjiA1dj3nuNMuSkm4sANDL/
	q+hDrkE61s7b/xntpPDmCD9ZtB2tS7P2yeXklTgTPSdL0eKwSDun1NRBce15eNf6aLLkZk0BCVk
	o2nEwlUVxx2jl0Lmisu7Lama01fZ+w87k8JC5A+zDifq5eMABRLvExq1s9Jyjuxz9DO/oN2n3T4
	hK5mJzzxR3Fyg18g=
X-Google-Smtp-Source: AGHT+IEkbQ7voM8ncroqlk8dFE4Yp2MJiM8ArCnC7OxTSaJtSz0Be/gNlrys4JDijwJkyzTmUEnkmA==
X-Received: by 2002:a05:6000:4027:b0:39e:cbef:95ab with SMTP id ffacd0b85a97d-39efba397eamr1549484f8f.12.1744971445796;
        Fri, 18 Apr 2025 03:17:25 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6db10csm16368235e9.27.2025.04.18.03.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:17:25 -0700 (PDT)
Message-ID: <5ba8def4eb147e0224bb82795aa8b01abb11c086.camel@gmail.com>
Subject: Re: [PATCH 6/8] iio: imu: adis16550: align buffers for timestamp
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
	 <Jonathan.Cameron@huawei.com>
Cc: Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Cosmin
 Tanislav <cosmin.tanislav@analog.com>,  Tomasz Duszynski
 <tduszyns@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>, Petre
 Rodan <petre.rodan@subdimension.ro>,  linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Fri, 18 Apr 2025 10:17:46 +0100
In-Reply-To: <651b1f91-fd5e-4d59-b78b-fdd7f89247e4@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	 <20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
	 <aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
	 <f4db1a95-106f-4fa4-9318-3ee172e29cdb@baylibre.com>
	 <20250417184429.00002403@huawei.com>
	 <651b1f91-fd5e-4d59-b78b-fdd7f89247e4@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_031727_509567_2B67C704 
X-CRM114-Status: GOOD (  23.12  )
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

On Thu, 2025-04-17 at 15:48 -0500, David Lechner wrote:
> On 4/17/25 12:44 PM, Jonathan Cameron wrote:
> > On Thu, 17 Apr 2025 12:07:37 -0500
> > David Lechner <dlechner@baylibre.com> wrote:
> >=20
> > > On 4/17/25 11:59 AM, Andy Shevchenko wrote:
> > > > On Thu, Apr 17, 2025 at 11:52:38AM -0500, David Lechner wrote:=C2=
=A0=20
> > > > > Align the buffers used with iio_push_to_buffers_with_timestamp() =
to
> > > > > ensure the s64 timestamp is aligned to 8 bytes.
> > > > >=20
> > > > > =C2=A0drivers/iio/accel/bmc150-accel.h | 2 +-
> > > > > =C2=A0drivers/iio/imu/adis16550.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 2 +-=C2=A0=20
> > > >=20
> > > > Looks like a stray squash of the two independent commits.=C2=A0=20
> > >=20
> > > Oops, sure enough.
> > >=20
> > > >=20
> > > > ...
> > > > =C2=A0=20
> > > > > =C2=A0	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS=
];
> > > > > =C2=A0	struct mutex mutex;
> > > > > =C2=A0	u8 fifo_mode, watermark;
> > > > > -	s16 buffer[8];
> > > > > +	s16 buffer[8] __aligned(8);=C2=A0=20
> > > >=20
> > > > As for the code, would it be possible to convert to actually use a =
sturcture
> > > > rather than an array?=C2=A0=20
> > >=20
> > > I do personally prefer the struct pattern, but there are very many ot=
her
> > > drivers
> > > using this buffer pattern that I was not tempted to try to start conv=
erting
> > > them.
> >=20
> > For drivers like this one where there is no room for the timestamp
> > to sit earlier for minimal channels I think it is worth that conversion
> > if we are touching them anyway.=20
> >=20
> > Jonathan
> >=20
> There is actually a lot more wrong in this driver, so will save that for =
a
> separate series.
>=20

I think one of them is actually leaking some memory into userspace...

- Nuno S=C3=A1


