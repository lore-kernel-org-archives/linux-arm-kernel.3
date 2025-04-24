Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6CAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFC4CWwJ3J/6ue2pTv1yj5qQxvmBEsYXmSdGmslQgWU=; b=YkahT3JxJ3Yae34N9wZQNqvWIX
	VGTFPEFBaF/mvccLQcJ0L1Qp0M7Ma2AX/9ivaWv5JEXapPvEnj0Awlw1ny3Jz9xhmJar4myiaMEOR
	+zGGKXQDLytGERaRF0rD7eN0HulyqhP8VxcZGu6pyOX2Y1ETVg6Whg4SBuod8O/TKpyikSquCv9lh
	xdKvx2NBq7yzQdqTJ0lxABpahkhPTdCkv1GmWnv90PfozJabEcDJxiuuEq1DNsrLdSsh3ArouCBmj
	etcuujEjPRBUys7sBITOy9CuUEp5BZr6sho5/OTq4WjufEZmIrlvjE35MoG3ynFH72MMWM7X0CEHj
	viTXcnVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rI8-0000000DEls-43d4;
	Thu, 24 Apr 2025 07:46:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rG6-0000000DEN2-3Djk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 07:44:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so4069355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745480673; x=1746085473; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FFC4CWwJ3J/6ue2pTv1yj5qQxvmBEsYXmSdGmslQgWU=;
        b=cxk4Gs2ZyK1EAfGQLPzSytURr9I8yiofCxpJHDGBKtEbKWe1d9ngJ42mOBju29yIsQ
         s1D3Wp4v94gWQAMElMn7DKLwhrsEJO/342eanXPLSofSpLiKVN4kA95iSVrequo7yjbH
         nKW8wP1GmVAeyJUul3yXB/LbtUxtvygm22Eec1qjywwfuBsDRfwgwxVsXJ8enZprfW64
         Uzv2H2qpK5xs+DDoztefvEhTf8Ad1cGUQK+PgJ7/5QD6s1WHJV3tMACxaxhGnOQj+9Vk
         Q5sk0XecQHyUCvmXH+PmSG2n8/+s/HMUo7ctho5oX81cSXBYn7d7qm1uIUBsdz+IJSHr
         9qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745480673; x=1746085473;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFC4CWwJ3J/6ue2pTv1yj5qQxvmBEsYXmSdGmslQgWU=;
        b=fZBRShz9+3rcWU2n+veYc5qu7sf2fysxR5UrZMTEg4Y/MZhySKrcBXS6bsRE4hlF9T
         7laTYLtD1CPHGC31HsngKug/UOn7DPreMZHnVQBrqF/iBEi0DkKh4yGlX9iVMOg+msXJ
         Lw3ji68xLVWhTMzFSA1H98p6gjUcf+R5aH6oJD5rBdypI3YO544mFA/oE/nc556trjSI
         3TFrtmMUJ+fpSrtsUal7PN1CAL3utCaspHNgKz5eiMHmk4JheD06+iRHItmhGZbTC04l
         dC+W7QDNSdgXgSFATTAO/8Y/YVwOqMQwhAL1hIch3jIrmsaW9J6Dn6+9iemtXEvqqLbO
         0aQA==
X-Forwarded-Encrypted: i=1; AJvYcCWVT/3Qqf5ZWVaCHxcB+a2prFPl4EQfD+1EKmk29CPJAsvgXPDB7HjjTyp01UI85kzjY7Ccx7LQEQadNzMKSOGR@lists.infradead.org
X-Gm-Message-State: AOJu0YyQw+qqlUTrQbCXTZJTYA9OGJ6uxSjS8tNg78EWGxbb3QSDakE+
	yKfU3P4g6wL3X8rcymotGUcn7ORnGgEMQyS7P4YFWWOcC/mlJWfY
X-Gm-Gg: ASbGncvuCc2s3dHUfVZp9G4PxBxruFmm3IXBKG4fs+A5j0X1hyxm1Onaga1GjWoh7k7
	Fiu6cKBBrS/QojaZEs4bSClrndyXne2BClYXUp3Tcc2PsezO3QznyUk2uMPbMC1MDIPrKemfuAM
	4kDOKpHixOmJ4PfBSVA1ukRBrDX3Th6OpAG1fPUtxIKabJcY0/jfzYzvN0m46FaJTtuHTwqtjwc
	VrqNjB9rQrSE8LnRo+C9abwdrLL3oBk7jXY25KsVITJZS44v3PO4oBC54t5EueEq60FrHLuzXBO
	ire/DpAMmu70UBE7VdUXh9rGRwOu5b2vuO9/KyM/H6sxvYcWbgLj3M3diXleSLhlHa00KdzK25/
	LcGkTDBlQJEB7
X-Google-Smtp-Source: AGHT+IFQ1Uepev3bF6DqMnMwT/ZztF4YDs7mV/bmiMaJ/9BB2oeeGflOhD/8srCT4ufJnyMLRmDzeA==
X-Received: by 2002:adf:e30c:0:b0:39c:1258:2dc8 with SMTP id ffacd0b85a97d-3a06cfb208emr940912f8f.57.1745480672986;
        Thu, 24 Apr 2025 00:44:32 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54c246sm1124123f8f.86.2025.04.24.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:44:32 -0700 (PDT)
Message-ID: <3f3906e76ef6d87a12552b99d8f5bf9e34724677.camel@gmail.com>
Subject: Re: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, David Lechner
	 <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=	
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen
	 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Eugen
 Hristev <eugen.hristev@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 24 Apr 2025 08:44:36 +0100
In-Reply-To: <CAHp75Vfa0spzCW8WmR32N7u55N89kxywK5uuYMZDJUNHwSZoDQ@mail.gmail.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
	 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
	 <701bfc6a715046044dbc789f1c11c7f85395c7a8.camel@gmail.com>
	 <b4218efe-3785-4065-a3f7-57824e882f09@baylibre.com>
	 <CAHp75Vfa0spzCW8WmR32N7u55N89kxywK5uuYMZDJUNHwSZoDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_004434_806699_4439598F 
X-CRM114-Status: GOOD (  19.47  )
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

On Wed, 2025-04-23 at 18:43 +0300, Andy Shevchenko wrote:
> On Wed, Apr 23, 2025 at 5:51=E2=80=AFPM David Lechner <dlechner@baylibre.=
com> wrote:
> > On 4/23/25 4:18 AM, Nuno S=C3=A1 wrote:
> > > On Tue, 2025-04-22 at 17:07 -0500, David Lechner wrote:
>=20
> ...
>=20
> > > On the other hand, as I mentioned in V1, I think that an assertion or
> > > BUILD_BUG_ON_MSG for making sure 'count' is a compile time constant
> > > expression
> > > would be helpful. Sure, we'll get -Wvla but some developers might sti=
ll
> > > ignore
> > > the warning and send patches with these arrays. So, it would be neate=
r if
> > > we
> > > fail to build and force them to fix their code.
>=20
> > BUILD_BUG_ON_MSG() won't work because it expands to a do/while loop whi=
ch
> > won't
> > work in static struct declarations. But I can try to see if we can come=
 up
> > with
> > something that works.
>=20
> I guess Nuno is okay with static_assert() and TBH nowadays the
> BUILD_BUG() as is most likely historical.

Yes...

"...I think that an __assertion__ or BUILD_BUG_ON_MSG..."

- Nuno S=C3=A1

