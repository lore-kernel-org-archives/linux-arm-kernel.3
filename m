Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156A9D7494E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 01:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCmWu47sjTGX3jar/Dwdhp+9K5zVvqpEnsEiRnQbuZ4=; b=mKlIul5pAtRz3V8Wo/beOU67cf
	BICwD/btp1gy8RFz6Ys0vSSypEibCdsjGoIZKRwEJ/CIwe09LRGjk4kORzvhgs+E0u3ptCBTzEjMz
	Y3QFZSNlH3lbu0QVpG+7ge0m3rbVVJHE0nKFdL1aDqutuFxTb1+K0MS4iEfAK8i5JQWnVqnZfV7oR
	XshYm+foi5SFI5daWLEBFGL0dCBpPncYI1COyaY6bwjZczT9TS0OpD9/QcfQIo9XbQ4hVQDYe9SdK
	LiOn5QLv7FVeSyOsAtM5wNeIw8AOFtiulthVt+e+rDcK0z3SbdRpsMR4r2VWjqSl8K1kijJDlZZcJ
	+j5jM3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xXl-0000000GQ82-0BPK;
	Wed, 30 Oct 2024 01:30:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wOf-0000000GJcr-1epl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Oct 2024 00:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RCmWu47sjTGX3jar/Dwdhp+9K5zVvqpEnsEiRnQbuZ4=; b=ILKj4W5uJCfsW3zcinfUlnvtuJ
	UDY53FBLVJyoJWW4DQGqnYyTRsvt4k60phbnlvI2od4bCG+ER+gX1PVX+SCeAkjffs/Xx26d3hXmo
	aJkGnaJbMNe3nUpoJlajR+DnmhY6OmlcVZsMiKPZVTA54RPlIFMjAkeisk8iMANRg+JGBJ9JjdZX5
	IzYINx2Md1aHL5q/C+EedZfKKKa83jgOwy9UuTT/Hp1yUHQ3oytvMU3adkxaBMVD/9+tdj5lIpfCH
	NHvrg4PofCSYYia8vIEoys47EvWt1qfboateGZuvjlarbKewQXMq2f3BqxkCZp3oZvR2W4kHH9Lrf
	Mx/JzKww==;
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wOZ-0000000A4Kg-2mcu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 00:17:11 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-460b295b9eeso73601cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 17:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730247422; x=1730852222; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCmWu47sjTGX3jar/Dwdhp+9K5zVvqpEnsEiRnQbuZ4=;
        b=d0eH6ql8L+I8gYaVwVVKJ5ed9gw9H+fQUDCxv5uFEtbKkxKds16rVd3j7EfUrKCFHs
         toFDRD4CDXqBgiq2bdJx62cZlaIekHfiGCZpQL6wBaS4Uy7Zm3Y/7/ssBfI/bvnTPqo9
         xMj7h0YmVvYdt/2cmPOwf/EVD6i3pT59LVo7XN2IxA2r5sP7qLaun59FMxWN63UgNWNG
         vTyucoeauFvq4BHZgVoqbBMu9C/raNo0ROoO9vf8NbS7/5FWrtMro/T5ueOs7TqVy4LQ
         9jzg+/HiotnZKInX1/g4nQT4PAnXjjzBVw3njgI5bzp1KFMSUeB33QQwnbj5XhYdGGTH
         Ga4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730247422; x=1730852222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCmWu47sjTGX3jar/Dwdhp+9K5zVvqpEnsEiRnQbuZ4=;
        b=s4g8KCAljKZRPBvOQa5EvQc2jRisBwAQnRVadEBfavCfWfLX1E6MmppqmhrtdzvsZR
         2xDcYQNI/UmdJFdD3PLM2omd4Vfzyi6qKKZ9rDW8RjDh4K6+cvVAW8HWKCn29/jAcI4F
         URdgHS2nRVunGZd38b/omrj0xyiFnf4IdYZOdw5WWpkCzxfiBRdKcjOtg+seaU9W+tmc
         7r7rg2JE0aLEzyfG5e0vJomqA05FDc7LzEbUM+lRz+3T6Id06ptz+DPKOwhvAa9ZN1CO
         9see//N/7W7ecW9Ua/U0S8Z229BiYHnz5Mxu7CXBNglaZh49/cp5yrCj2STyYWb3Dxmu
         3aug==
X-Forwarded-Encrypted: i=1; AJvYcCXO3e4CFGKCN3FusMjhXfoGvb1BbX8W1wc4fXgs2KghgIp0g7todmMS5kNSZUMsj2iezXv2aT9+NQ7BLak34Kln@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl3SKy1BjYkr17H969lq2NagT/DfLHSxPczRESvETuLBXj1Qa+
	L2zRaVHERVLkK15/Drtxyk2uZUXy6ZuwS3kwvJ8RWp2bA53eArYOuqV3CnzycrJVxhjkg2XbZ3s
	tY44U0qPoDHRK8iJFYu8/fb5ZeS/eUmR+h08a
X-Gm-Gg: ASbGncvJpTtnWEGaVMAH+5wAymvuwzZUKtFbr47fGr0JJlliyytmiGoTvi7BxnJ6ME3
	e4duQuhe9V1rj1XDYTlDFIqttehCC/2V1GuHN+frhTHzpfajJsV/RBqnZ5yvUGtJy
X-Google-Smtp-Source: AGHT+IEaPibastFimQxIGHeancJlv6kb2dWI4ioRIOkCpZsX0edKkHwzu5czUo3lz8BTR5AsStAJ1WI8kMngUNb28NI=
X-Received: by 2002:ac8:5d91:0:b0:460:48f1:5a49 with SMTP id
 d75a77b69052e-46164f057c4mr6157321cf.14.1730247422165; Tue, 29 Oct 2024
 17:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241028234533.942542-1-rananta@google.com> <868qu63mdo.wl-maz@kernel.org>
 <CAJHc60x3sGdi2_mg_9uxecPYwZMBR11m1oEKPEH4RTYaF8eHdQ@mail.gmail.com> <865xpa3fwe.wl-maz@kernel.org>
In-Reply-To: <865xpa3fwe.wl-maz@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Tue, 29 Oct 2024 17:16:48 -0700
Message-ID: <CAJHc60xQNeTwSBuPhrKO_JBuikqZ7R=BM5rkWht3YwieVXwkHg@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Get rid of userspace_irqchip_in_use
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	stable@vger.kernel.org, syzbot <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_001709_395456_60433006 
X-CRM114-Status: GOOD (  19.98  )
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

On Tue, Oct 29, 2024 at 11:47=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> On Tue, 29 Oct 2024 17:06:09 +0000,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> >
> > On Tue, Oct 29, 2024 at 9:27=E2=80=AFAM Marc Zyngier <maz@kernel.org> w=
rote:
> > >
> > > On Mon, 28 Oct 2024 23:45:33 +0000,
> > > Raghavendra Rao Ananta <rananta@google.com> wrote:
> > > >
> > > Did you have a chance to check whether this had any negative impact o=
n
> > > actual workloads? Since the entry/exit code is a bit of a hot spot,
> > > I'd like to make sure we're not penalising the common case (I only
> > > wrote this patch while waiting in an airport, and didn't test it at
> > > all).
> > >
> > I ran the kvm selftests, kvm-unit-tests and booted a linux guest to
> > test the change and noticed no failures.
> > Any specific test you want to try out?
>
> My question is not about failures (I didn't expect any), but
> specifically about *performance*, and whether checking the flag
> without a static key can lead to any performance drop on the hot path.
>
> Can you please run an exit-heavy workload (such as hackbench, for
> example), and report any significant delta you could measure?

Oh, I see. I ran hackbench and micro-bench from kvm-unit-tests (which
also causes a lot of entry/exits), on Ampere Altra with kernel at
v6.12-rc1, and see no significant difference in perf.

hackbench:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Ran on a guest with 64 vCPUs and backed by 8G of memory. The results
are an average of 3 runs:

Task groups | Baseline | Patch | Approx. entry/exits
----------------|------------|--------- |------------------------
100              | 0.154     | 0.164  | 150k
250              | 0.456     | 0.458  | 500k
500              | 0.851     | 0.826  | 920k
(Total tasks for each row =3D=3D task groups * 40)

kvm-unit-tests micro-bench
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The test causes ~530k entry/exits.

Baseline:

name                                    total ns                         av=
g ns
---------------------------------------------------------------------------=
-----------------
hvc                                  20095360.0                          30=
6.0
mmio_read_user           110350040.0                         1683.0
mmio_read_vgic              29572840.0                          451.0
eoi                                        964080.0
        14.0
ipi                                   126236640.0                         1=
926.0
lpi                                   142848920.0                         2=
179.0
timer_10ms                          231040.0                          902.0


Patch:

name                                    total ns                         av=
g ns
---------------------------------------------------------------------------=
-----------------
hvc                                  20067680.0                            =
306.0
mmio_read_user           109513800.0                         1671.0
mmio_read_vgic              29190080.0                           445.0
eoi                                       963400.0
        14.0
ipi                                  116481640.0                          1=
777.0
lpi                                  136556000.0                          2=
083.0
timer_10ms                         234120.0                            914.=
0

Thank you.
Raghavendra

