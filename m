Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52763E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZ1KZrKq9fjjZZzg1BpDFYDzANeNx3Q16LjjyXms8rg=; b=fvYCUfOaw1z6jK5Kq/gDUBYgWP
	gcMYXqdhKdTvi42mjTx4reu/qpB+JSeS0K4Nc/UTy5E7nwEXci0nIMSjhbDFqDv8/owfuGOb3A+ql
	FU4H0xEA31f4P70ZoWj2GXTb207nB6xV32k//i2t0LRB84t3iGad9sHKE4d2nslXixIpP4oarZL+s
	q8LcJ4k8xt66yzMLQ1gYHSY7qlrnWTd0kMZTW0im3CEMLiFlXlVdtNqH3a+LWh+UAwKsG8Lg9vZSi
	PkcRQxSq+c0HEB1wNRRtnvXsUEZI/+Q06tu/eJc/xYue5/cAxPj/o2TwkODZkOc1nrDkgseuTmLay
	BhbK7g3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJT7g-00000000qSK-0EZt;
	Fri, 06 Dec 2024 07:51:36 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJT6e-00000000qH6-0XkJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 07:50:34 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa62e741fbaso22700866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 23:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733471430; x=1734076230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZ1KZrKq9fjjZZzg1BpDFYDzANeNx3Q16LjjyXms8rg=;
        b=W53dO795vQIn4/utWiTH4kLAzha0Axhicjh6/M45Eg1At7XRdrGWL9EO6728ni+h9X
         +XYIgc3xTcblbMw/lZOxGfXOMTZnGF1XAGtMVX9Caqzo2wj4Y/MluR3mOZgzV7yVjpZt
         LhgAIacAwySfdz1EhIstmEaqc+nKH4y2G8IQI8C6EN/IBzZuR/hAkNHIMnFuyhLkDwCe
         4nHoKZK6KHdbR3DAJn5TzwRYYAedNW0MseMHMb2HlHU2GVKBbqF2eyeblMP5PAD7kmsp
         1diKqh/8Vu7StIDR+KTanzoi/KcN7bufCufzTBtnYNWVd4zFJASg5p77pAyFLLTehvwZ
         uU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733471430; x=1734076230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ1KZrKq9fjjZZzg1BpDFYDzANeNx3Q16LjjyXms8rg=;
        b=q+NJhlDFo2jRqw3TJehwzrOmHjTnKez9tBVUBbuYifTQfAqsT3lgCR5SFU+jnpHVlF
         XgF1vofPtwAq6YegrpzxV5GWpZKvesj8SUGfA56VRKUAGUR6nXPE1WrhfyfSZEhJqFkS
         b6wQzxroua45QJtDYUOW+VbPAhG58m6dCoJ/oLd7hN6z6UPg/k7O82AzdE5ULKSKvCzC
         +XsqQSizSlLbH0XBMMINqPbedtzfse9plgEi8J1Pd37Ud1HhRxdjhtUiNjcxs0KE1DG3
         FxTzm7svZ6xLRmdx8xlSsTyG+yfsaXmH0HHyWVCBQiaGfbtMOK2H6pUk1nhMJaS137mx
         TdOw==
X-Forwarded-Encrypted: i=1; AJvYcCXVbqfjmO3OheCv6lJ//N5BzpQQCw+ZnM4K8VO3sywNfWH92hULec5DSPS5WZNF7Gt4dp2AftLAWezdFtE6xZzt@lists.infradead.org
X-Gm-Message-State: AOJu0YzJCJlHimg3SYRfbnpafw6VtVcEoyNHFxQwT+2SUSVv2Mn0ocZl
	6Qq10gbxxHHaWMjd8XOEw6UgehSrJlJTeACwOM4nPiIRSsBbfYttGBvrFoElJTI=
X-Gm-Gg: ASbGncuGUbk7owqtnWrZ6irD5+ps02yHAbMUHYSfbsl8sdGJSGObSTED4O/udQNURDE
	jCzrqTS95EGoCOnL+HxnJOeIwNd3xQ/FasdUkltBP7/+hXHb0sFubTBJU/dYWylJcXXTpWHTi39
	Hkly5HrfM9SuChdFKDngKCNRSnwNXp3IsTFULI3RWTqU318Rr9mPLhL/AYyzRFJigWdlucuLak0
	v3+ZGI1Ep2xKCzbWSOV1zE/UDabW2TDWQnnJayz61GlmrUAElAf4zh78kD6tga0f7wrJ+QOj93K
	U+no4eaWiWqijgwN3Bn4GBKO626SmE1C+zrimv3MtafyzjngnvWY7V8=
X-Google-Smtp-Source: AGHT+IF8xoPo6If2nLWiursPzHftrg3L5Sg/0RCI2v1dsSwqFkxqadIQUN7AYaRQbEqFSAHgtuUilA==
X-Received: by 2002:a17:907:3fa8:b0:a9a:8216:2f4d with SMTP id a640c23a62f3a-aa639fa5dfamr62692766b.3.1733471429904;
        Thu, 05 Dec 2024 23:50:29 -0800 (PST)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e58da5sm202707966b.28.2024.12.05.23.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 23:50:29 -0800 (PST)
Date: Fri, 6 Dec 2024 08:50:26 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>, Greg
 Marsden <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Message-ID: <20241206085026.32c89a03@mordecai.tesarici.cz>
In-Reply-To: <SN6PR02MB41571E0BD384C44C46127B49D4302@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
	<20241017142752.17f2c816@mordecai.tesarici.cz>
	<aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
	<20241205182008.2b36476a@mordecai.tesarici.cz>
	<SN6PR02MB41571E0BD384C44C46127B49D4302@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_235032_231237_BFB868AA 
X-CRM114-Status: GOOD (  34.69  )
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

On Thu, 5 Dec 2024 18:52:35 +0000
Michael Kelley <mhklinux@outlook.com> wrote:

> From: Petr Tesarik <ptesarik@suse.com> Sent: Thursday, December 5, 2024 9=
:20 AM
> >=20
> > Hi Ryan,
> >=20
> > On Thu, 17 Oct 2024 13:32:43 +0100
> > Ryan Roberts <ryan.roberts@arm.com> wrote:
> >  =20
> > > On 17/10/2024 13:27, Petr Tesarik wrote: =20
> > > > On Mon, 14 Oct 2024 11:55:11 +0100
> > > > Ryan Roberts <ryan.roberts@arm.com> wrote:
> > > > =20
> > > >> [...]
> > > >> The series is arranged as follows:
> > > >>
> > > >>   - patch 1:	   Add macros required for converting non-arch code t=
o support
> > > >>   		   boot-time page size selection
> > > >>   - patches 2-36:  Remove PAGE_SIZE compile-time constant assumpti=
on from all
> > > >>   		   non-arch code =20
> > > >
> > > > I have just tried to recompile the openSUSE kernel with these patch=
es
> > > > applied, and I'm running into this:
> > > >
> > > >   CC      arch/arm64/hyperv/hv_core.o
> > > > In file included from ../arch/arm64/hyperv/hv_core.c:14:0:
> > > > ../include/linux/hyperv.h:158:5: error: variably modified =E2=80=98=
reserved2=E2=80=99 at file scope
> > > >   u8 reserved2[PAGE_SIZE - 68];
> > > >      ^~~~~~~~~
> > > >
> > > > It looks like one more place which needs a patch, right? =20
> > >
> > > As mentioned in the cover letter, so far I've only converted enough t=
o get the
> > > defconfig *image* building (i.e. no modules). If you are compiling a =
different
> > > config or compiling the modules for defconfig, you will likely run in=
to these
> > > types of issues.
> > >
> > > That said, I do have some patches to fix Hyper-V, which Michael Kelle=
y was kind
> > > enough to send me.
> > >
> > > I understand that Suse might be able to help with wider performance t=
esting - if
> > > that's the reason you are trying to compile, you could send me your c=
onfig and
> > > I'll start working on fixing up other drivers? =20
> >=20
> > This project was de-prioritised for some time, but I have just returned
> > to it, and one of our test systems uses a Mellanox 5 NIC, which did not=
 build.
> >=20
> > If you still have time to work on your patch series, please, can you
> > look into enabling MLX5_CORE_EN?
> >=20
> > Oh, and have you rebased the series to 6.12 yet?
> >  =20
>=20
> FWIW, here's what I hacked together to compile and run the mlx5 driver in
> a Hyper-V VM.  This was against a 6.11 kernel code base.

Wow! Thank you, Michael. I'll give it a try.

Petr T

