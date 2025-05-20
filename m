Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A34BC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 22:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSFnRhdA6dv0Ibd3iDpTetyUbHtuWoDiaLttMv9a8UA=; b=RPGCvvv5GTO1Ubv3YHOlkXelgl
	b4sVL2pasKPzaYWho/yCEgik/EBRaeYZzwtwpUY7hzGP0UXArIdMkD93Jwq1nEkpHNKo8PHG2L4TO
	d/7/2YcROMb7CferTcAB5QTPb1yPUcqJgTOngTWmyLUteQPCQB9ityZkudhZNuTp8k8WJt0sDAqt1
	fTLgYIbRmT+H0SWcbodjrAOjmFxq81e1YU1KAYzUevhOvz2OyHrMo4aiAvtVqC4hce/sOvEwU9FAb
	jWp79QIaNly+NrAA1qrxbXElSsmy3QOJLVFlPSafkdpdNChuuxU25q+fsyvqzm+edEroI5IHeH9XJ
	xTOLs3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVNx-0000000EG1O-07zY;
	Tue, 20 May 2025 22:24:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVLn-0000000EFrG-3xxi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 22:22:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D8464AECC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 22:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C646C4CEF2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 22:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747779739;
	bh=PSFnRhdA6dv0Ibd3iDpTetyUbHtuWoDiaLttMv9a8UA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uqEQU7Qx052CYgFoK14TYHm07pqL9HttCt0RkS5DIje8K9StJYmkNw9g+u8tq/2wr
	 5RGm2y07KmQKKlHfkI1YJiunsSMpznKqf/w90actLrdnMjGb1VjKjpKSU4aDlVbR16
	 XrvTMp7yjpCiU37oOD8ximJLfxaqKVdiRePRN/Yq6OIODft51LuYb3uRnt5BWxjJ24
	 RfLjGHALLZyGQyg5sDTBh8GEDc+MD3xMZibDeL98zsHY2qUrhRHqmtJ0RkN9/ZC1N9
	 34lihYFSdcOg5sPQX+YgaFbGCT5bMgac90T6OXSipHOkysUbowsKJq6bQYrbJr8RFD
	 7SGYVaSrjqcjA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acacb8743a7so1021453666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 15:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSuH+ikYcyw8TCvKrymqWKr2GN+2ZNoXQk3aMxi6phIflr3urZnqEogv+nMJX+MzH7VMcxCg3nSBaNaiFGi04W@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7LO1hsUFPSOtZt4MU4iiafJ8CfI5QRjD5yOfC+c9Sr+kBmoNd
	y61XfAQh54/P1ZwVFws3t+FQEzGNB1InfXJxyHFxp4HdRdn0/4gQG2o4rg6gycVRSCnf3aXdprc
	yoJXQknUbuaaged9BxfXyluRgzsEE+g==
X-Google-Smtp-Source: AGHT+IGov0hihbX3nMjv/1exgX1GdOXfquBDi24JqrrM+xtngJD67Rk/E6K9Ejlx6ygNLKgOhEILcowTjixD7Xd6Yss=
X-Received: by 2002:a17:907:3f08:b0:ad5:67f3:73ea with SMTP id
 a640c23a62f3a-ad567f37579mr886028566b.21.1747779737495; Tue, 20 May 2025
 15:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
 <20250407-arm-brbe-v19-v21-4-ff187ff6c928@kernel.org> <20250519150621.GA17177@willie-the-truck>
 <20250519215651.GB2650608-robh@kernel.org>
In-Reply-To: <20250519215651.GB2650608-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 May 2025 17:22:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL2KgLQGXRLZJ3txuvytqbRRkdK1nM=5_URO2gH_nZMWw@mail.gmail.com>
X-Gm-Features: AX0GCFtFzlmCBASIuU0YBO76uu_wIfpgFX6QwQXx6mNBYPf-UQnVG91SPo_aQCM
Message-ID: <CAL_JsqL2KgLQGXRLZJ3txuvytqbRRkdK1nM=5_URO2gH_nZMWw@mail.gmail.com>
Subject: Re: [PATCH v21 4/4] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_152220_026665_9AB2CCDF 
X-CRM114-Status: GOOD (  16.42  )
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

On Mon, May 19, 2025 at 4:59=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, May 19, 2025 at 04:06:22PM +0100, Will Deacon wrote:
> > Hey Rob,
> >
> > On Mon, Apr 07, 2025 at 12:41:33PM -0500, Rob Herring (Arm) wrote:
> > > From: Anshuman Khandual <anshuman.khandual@arm.com>
> > >
> > > The ARMv9.2 architecture introduces the optional Branch Record Buffer
> > > Extension (BRBE), which records information about branches as they ar=
e
> > > executed into set of branch record registers. BRBE is similar to x86'=
s
> > > Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
> > > (BHRB).
> >
> > Since you picked this up from v19, the driver has changed considerably
> > and I presume you will be continuing to extend it in future as the
> > architecture progresses. Perhaps having you listed as Author (and
> > crucially, in git blame :p) with Anshuman as a Co-developed-by: would b=
e
> > more appropriate?
>
> Shrug.

I did a comparison to v18 arm_brbe.c. It was 1134 lines. I (and Mark)
have removed 332 lines and changed 369 lines. So a little more than
half remains, but the unchanged parts are a lot of 1 line helper
functions, brackets and whitespace. So given the more complex parts
have changed, I will change the authorship.

Rob

