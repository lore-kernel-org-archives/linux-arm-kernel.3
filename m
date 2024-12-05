Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFB1E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7yig2Aaj1cF+uoOcuOTHwfQCd/qo7BAxwYpQ38Ftu4=; b=EuFm0t3tZUeEXKm8+Eg8idaSKS
	n/YXEOM9oa7grl4g7KafUqD38pqmmCZ7gewk15zv3x+1w4cMQ6FKf8BQyPAt1GX8uuScSy6lduGm9
	0QMXQ1c2XFrfukhhE+egkZVs6JAJ2yciXoUdnJet7l1zK3zG04Yp7hdiAbHG3RKHgFb8iDXvqMx0g
	fNPuuzj8ven4SXx5EHKSBB1s6oQw6BYkMAux5JOgPJkhP4zG/1U7vemiRQPI9gy034tc0T4PbyIe3
	HQ5UHtrUMv/Ca2vOQ89LOGdq/NlaGUoyFwK6sFlFRlwn8mh/uEk9b2hHqsn38RqOqS3y9I/Q1Tmt6
	8gov1NIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFe6-0000000Gx9V-2k63;
	Thu, 05 Dec 2024 17:28:10 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFWP-0000000GvMk-3eER
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:20:15 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d0bdb7ea48so170660a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 09:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733419211; x=1734024011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7yig2Aaj1cF+uoOcuOTHwfQCd/qo7BAxwYpQ38Ftu4=;
        b=O9hiUKF3o9W9tglJcXy4jCpHjelR1Yov4VwlehO86D3OpJ0+P6IQiFMsny17SXzbas
         QirRtsuus94Bc1kIZT9qQxpCaZm0o7o4ItmKpxOTwKZQSdAGzYEcUYfY18VKQpRU5duf
         1naQTKgDNBp/Y1mf0QnHq5L1AEd8eHQi3wELLE+T4hsY/TzScRv85nWZqmQbU06dLVuL
         7UoUoV4nGHzoRhpdt7Z3/c2D+ximIOCZL7E/cF4Jt48feGiTBTnYako6WzcAjqAPfvbG
         Lltr9CPCOfVwAcGn2xuogMJ226Grb67IBrcRtlRBCoRGvvU5djBLzUJI7rLQdnch2mEV
         cw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419211; x=1734024011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7yig2Aaj1cF+uoOcuOTHwfQCd/qo7BAxwYpQ38Ftu4=;
        b=LLyuDtGzvZyYK3AKgKbIe7RMjvwTBRCHglx4FuZ1xVOXNnrEofGZotNOVagZdkXLrM
         dlS5+hr/bXdmNZ0wcMRHM3CkR5V+GrTHjqLsWx10hjfat4vTGOFX9w6SQbkx4vx6jSC6
         h/SLDsSOb33OxOlw/J41lD8k2hipaToEdGNuGJ0ajal1i5uV/83ZBGyvosUDtBms0Dkp
         +xH/GwFtGrAKVQWJh+ACCLPrJq2S2sYHvcfhBPZGAa1Gyckl771nbV/pfNMIvitT9j0z
         ioee7TyUIsnISSy9mhXauEVyKa+4RYcHr+VrrEnjYlCHVEstxiKdGYIQ69XK2TXB3995
         NTNg==
X-Forwarded-Encrypted: i=1; AJvYcCWBfQQ0YNgqBIkCWL5w9xfwmeEEMr4aWG6qq5HyaV73FuDnLpZXj07vcpGCvU+h/iAFed43VdwUQQO1ros6AQPX@lists.infradead.org
X-Gm-Message-State: AOJu0YzQtH06ZRARk78QYY+UcINpcx5Pwv+t5PbDgCvA+gGvyGyTwpOO
	D8ivjKrRtTiPK5ZNNlPHbSG+2Ju56scAVUTne2mXCgAhApKtfX0HJfNNXPWECmY=
X-Gm-Gg: ASbGncunk9IAZRd3ydNRg1QoXVVymPQBT1hNLRcMZbqLFeUxJ2rr57iTkFUeQaGL9Ub
	/IED4NwMYEpkzC6+PzKrJaYIJqNpPlvGCodxb+cAMhZzxODzwvV32KEzWtU951wNVKv+irGtrc6
	R3uesxfab/7zD2wmrgZf1jTFyVgQuGRXD1VJOLPsW5o6dS0QBiavNyx8radaWmAS77+4thalvOm
	oRV9wY7TeBEGkHpWzooWxvIBibSvFrGK5StEMYqt/XPCCcXckmgyB61QltmKCo+KUB1oWqQNipA
	V3ZRNRuq/E1qLrD2kAVScOPtu2dYUPfyVHkGc1PUWUtXxuXzaFbaWYg=
X-Google-Smtp-Source: AGHT+IHQT5uO2ud1UQt44xQIYeAthB46apVlg4D3uRW41UHhyYXuzbyoQSLWZQMImKqi2K1w5Bh/HA==
X-Received: by 2002:a17:907:2d09:b0:aa6:2eb3:40ea with SMTP id a640c23a62f3a-aa62eb34bc8mr78820866b.11.1733419211129;
        Thu, 05 Dec 2024 09:20:11 -0800 (PST)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcb9sm118859266b.89.2024.12.05.09.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:20:10 -0800 (PST)
Date: Thu, 5 Dec 2024 18:20:08 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>,
 Greg Marsden <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Message-ID: <20241205182008.2b36476a@mordecai.tesarici.cz>
In-Reply-To: <aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
	<20241017142752.17f2c816@mordecai.tesarici.cz>
	<aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_092013_910398_066B56C6 
X-CRM114-Status: GOOD (  25.00  )
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

Hi Ryan,

On Thu, 17 Oct 2024 13:32:43 +0100
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 17/10/2024 13:27, Petr Tesarik wrote:
> > On Mon, 14 Oct 2024 11:55:11 +0100
> > Ryan Roberts <ryan.roberts@arm.com> wrote:
> >  =20
> >> [...]
> >> The series is arranged as follows:
> >>
> >>   - patch 1:	   Add macros required for converting non-arch code to su=
pport
> >>   		   boot-time page size selection
> >>   - patches 2-36:  Remove PAGE_SIZE compile-time constant assumption f=
rom all
> >>   		   non-arch code =20
> >=20
> > I have just tried to recompile the openSUSE kernel with these patches
> > applied, and I'm running into this:
> >=20
> >   CC      arch/arm64/hyperv/hv_core.o
> > In file included from ../arch/arm64/hyperv/hv_core.c:14:0:
> > ../include/linux/hyperv.h:158:5: error: variably modified =E2=80=98rese=
rved2=E2=80=99 at file scope
> >   u8 reserved2[PAGE_SIZE - 68];
> >      ^~~~~~~~~
> >=20
> > It looks like one more place which needs a patch, right? =20
>=20
> As mentioned in the cover letter, so far I've only converted enough to ge=
t the
> defconfig *image* building (i.e. no modules). If you are compiling a diff=
erent
> config or compiling the modules for defconfig, you will likely run into t=
hese
> types of issues.
>=20
> That said, I do have some patches to fix Hyper-V, which Michael Kelley wa=
s kind
> enough to send me.
>=20
> I understand that Suse might be able to help with wider performance testi=
ng - if
> that's the reason you are trying to compile, you could send me your confi=
g and
> I'll start working on fixing up other drivers?

This project was de-prioritised for some time, but I have just returned
to it, and one of our test systems uses a Mellanox 5 NIC, which did not bui=
ld.

If you still have time to work on your patch series, please, can you
look into enabling MLX5_CORE_EN?

Oh, and have you rebased the series to 6.12 yet?

Petr T

