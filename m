Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AB8C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 02:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfGyI8lm2/tzUihr+EPhjizt+9EWVURIdLSqDn3iQS0=; b=roBBq6K6GMsuWqHkkmroOEkkiX
	6iNxER/dBaBpzVyPLUHtKP0ES6Y8QOJHc3qmcnv9CqbqBAinrBI7cjRjpRZO2z8aU3paRbmQb+zoV
	Xt1eVZJEKRitmbVkhidZYPi4wYpzOYTj3LpH04W7IiXxDD2m+tWAJJnUUhr0Lbh/9ya2xWwZ7lvHj
	b6Uj4bYG8TWpyWqe19EesvQu/2H+1oLOH+hT1FK+7AgG5VX3wm1KPyo4ez4ndCVL58/jYq7fO690/
	0JR9pQUHXlwFlNGVyHlwX7atutvoeiZgXi6dppgE+FPE1YMk380Qo5T/jAuNOulXPkcRptxPJwKX7
	R55H7FBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBc0-00000008h7x-1q0E;
	Wed, 11 Jun 2025 02:54:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBAD-00000008eSw-02Br
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 02:26:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so4974207f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 19:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749608763; x=1750213563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfGyI8lm2/tzUihr+EPhjizt+9EWVURIdLSqDn3iQS0=;
        b=TmCfIEq1KB8+tkTIHeJ5mo/F7zT/KtQRt0RJ3bnPHlLfp2atQ9aIZgjvB8OogtPJ9c
         JDKByL8QimBu0pEjHYeRM+ttbs+Mt2cW1paBXfbRWcxeErd+z0qm99x1yJkByEfEkKPd
         pceezWfLsmV5K3ox+Hse+ntz7WZE98kilzdCj9lblfOSjEcxi+692NOwHFx/uXPiRE9F
         blvGBLrS7mqIsYvrzXz08jS1ZIkc6E+uSFE9MEeoWyXwHb+qiIocUf4RUOn0FATz67Xj
         nXf0INMy6ta49WuaqVy42vAfSs/0kwmT1jDus/4Hd4Foq/XN1I4v/CdhX8/VvXcG+YnM
         dKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749608763; x=1750213563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfGyI8lm2/tzUihr+EPhjizt+9EWVURIdLSqDn3iQS0=;
        b=JMGXv7wNBavGh51oMnpNkMVCgLEYGjMkizZfds2qw+UpfTGLCtsDOM/j3bRB1gzTxs
         Fk/he/Fq8bXWopslYlYgeYebMaNb0J9zLRcbrZ11Couks4jI1DM7CSCV6diAb32IDFkb
         jqTzJOajABcOdpkALEvFSllluUDEpvyf3ZW/yiwAlFV0f3jmMHK3XM8v+inID63xPEeV
         Cl8xxH96W70peAGCyXnZEM41GIA3+wjYjfSOYUyvPqFNOcj/YgP00B84g1yHNqlC2A+V
         4ias8wMPD5wzyk0+wIzMPOdaD8S0eeB5O/qhv2OYh+qmcI4HM83MQB+w+xXJegD/ziFc
         PIoA==
X-Forwarded-Encrypted: i=1; AJvYcCWAd8lIxwqCMxAv8n4RDlyWXE3Y3zShL0uOD55d5AzMYU1rYQWNzQx/8Zdbyv7pafpabvSMqdZD0pTXcoBo/ZSZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwS2iJKNCwR9AqJ6CyJjZKGRiYDLBfaMtl18BDecXTn4i7RqU9N
	9CrSlA8arJ+5FyQIoDeBvdwOYIMn5phNs4qIulo6v9W+Ec2rmLL2M5t7JJ2vsK1wGzZdBahgvrw
	XllRjjztv19b1psjGEYuzg5eglJxvIfk=
X-Gm-Gg: ASbGncsLGx10zINa5/vbhAHFoHfLcgy7TfvTh9qu86vhX6A7/J3NbP/KmTODztRXo34
	Mpa7aAucAAyxDvfOWGNy4+CLjNDA2a8sWgAwAEOX5V/o/+F+XTT/i1sP/R8dkBbvW3DdVUBw7cw
	mJ2MbSRsLHgL5kxDY378rMK4w3Afzc44fcGLICDnF4ImYvzvchOaf1xMt1Hj9RwIbYAZ+VZY8U
X-Google-Smtp-Source: AGHT+IFSdsGdtwD7pz8INw/m1yUNVDtukoawrcdPdoY3WI/e3Ukmlpi/Ec61CuxAbfl/NsCzWZpqWpsQQtAvLMpiF7o=
X-Received: by 2002:a05:6000:4028:b0:3a5:287b:da02 with SMTP id
 ffacd0b85a97d-3a558a3138dmr849863f8f.40.1749608763284; Tue, 10 Jun 2025
 19:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250610232418.GA3544567@ax162> <CAADnVQ+jNQyC=RcoiwDXeHj9y6CGzr322scz_8uGwCDVx-Od4Q@mail.gmail.com>
 <20250611020522.GA3981304@ax162>
In-Reply-To: <20250611020522.GA3981304@ax162>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 10 Jun 2025 19:25:52 -0700
X-Gm-Features: AX0GCFvkcjZRnP7xpZYc2JrdqH6YzuB8ObJQ6ArvSdla8G5K0SFXWkviXJE56sI
Message-ID: <CAADnVQKTGgBGgqfVsDGxijuL1oVkBOhmgx+0XQ+VOL4wLoVKYw@mail.gmail.com>
Subject: Re: bpf-restrict-fs fails to load without DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 on arm64
To: Nathan Chancellor <nathan@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_192605_044979_CC2DCC3A 
X-CRM114-Status: GOOD (  22.22  )
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

On Tue, Jun 10, 2025 at 7:05=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Tue, Jun 10, 2025 at 04:37:24PM -0700, Alexei Starovoitov wrote:
> > On Tue, Jun 10, 2025 at 4:24=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > > I was able to figure out that enabling CONFIG_CFI_CLANG was the culpr=
it
> > > for the change in behavior but it does not appear to be the root caus=
e,
> > > as I can get the same error with GCC and the following diff (which
> > > happens with CFI_CLANG because of the CALL_OPS dependency):
> ...
> > > -       select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
> > > -               if DYNAMIC_FTRACE_WITH_ARGS && DYNAMIC_FTRACE_WITH_CA=
LL_OPS
> > >         select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
> > >                 if (DYNAMIC_FTRACE_WITH_ARGS && !CFI_CLANG && \
> > >                     (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
> > >
> ...
> > That's expected.
> > See how kernel/bpf/trampoline.c is using DYNAMIC_FTRACE_WITH_DIRECT_CAL=
LS.
> >
> > Theoretically we can make bpf trampoline work without it,
> > but why bother? Just enable this config.
>
> As I note above, this is incompatible with CONFIG_CFI_CLANG, which is
> more important for my particular area of testing and maintenance. Since
> you note this is expected, I will just go back to ignoring the warning
> in my kernel logs :) thank you for the quick response!

Somebody probably needs to fix CFI_CLANG on arm64 then.
It's not clear to me why dynamic ftrace has to be disabled in such a case.
It's not disabled for CFI_CLANG on x86, right?

