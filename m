Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745CDC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9rr401OufXElmvBl3vcgyDTpasOf1VvGYueuVS+Uto=; b=1AeZ/msCLxsGzenQR5mICbTe9s
	L6wOf247TWS7wuFGAlXMcnC4Ig0yFzSOpjO4x7LqZ32MO10WFzQOC/BlH36AgX9w7l2dG+i36+A89
	i0HRNe0Q+potZghJ1JrOxHYDufeR8RgxODnx70hXdcEVbpobH+r1H2c/KeYZrFqXKsob5T5GdkBmN
	Ak93a+j+f0CGtuyiA7EbCcJapfYMy84QrHvXoSqPUoIQF3ohVHVbzkNWud+i1L+Em8V0g5Y6qAmcR
	gKO3+UrFnaHTV2T3dmHD/SPJBrUTvcxmXxnqmYBT1Ym308NxQNaUpei5GLejBShVbDgYsEqeSc1un
	7MAJTuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5V-0000000BIXB-26sE;
	Wed, 23 Apr 2025 17:40:45 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bBR-0000000AqKZ-0U19
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 14:34:42 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3f6aa4b3a7fso1896078b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 07:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745418879; x=1746023679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9rr401OufXElmvBl3vcgyDTpasOf1VvGYueuVS+Uto=;
        b=NvJXmZoF3XaAHvemm5EM/f01QkSI+hJoKDPUEMElHR6+rgWsfRf0RAbMVH1mE3Dw6V
         B/hA8EUBvRVU0Z6NoyjXlMsmrv//fevot3bAqqWOQbkZmcM4tIazFkiXwGzW/yFMmWTG
         aHlgoTpzmHoI2TJCjCpf45sC7v/qJaw5fmImI2OS6KW3j6ta4JFfAmYsRFSqcJlGX5j9
         ijuAgjCK2lAaSxLmGU4c8GHuwLKXLnaD6/jvc5HhVhkST+5fFBucQGH9zj789mG6Quql
         QoDprdguLZz/bIAkD4eC4s3pxrfv4oXsqpEhBPpWA77iTU1kNYffx5hFSVL7frk7CiIU
         66oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKbI7jUfZycWc6n5qUqPcngNpLyFWjkS2bf1oCCXzZYWkJuVmIbxKdDpFLemg+nAmiSaHjdI96ebbwIn/x+yU4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0PW2wvRn+7/FgOTD+WNhYL1+0B3qf4GCuJrtYkk76Ue4SLvoG
	KyBmiXEs6Fs1SwIXDnCgCovRjZ7mdlcG4hnMEb2EA2CF/b1uQJbBJWDxrAQl9uY=
X-Gm-Gg: ASbGncvsqiccH8nrsACtUWcwvvPMIwTMHBHeOf9hVnrdLhEUauopFQQXanrYRercluJ
	A5TbPjp1yWymrMJmkjnW5Cd0fS7kliyLyrvUT2IcMupExwlqoapHNayHgoFLIIaoMDBkDgqLl5w
	TeShAYaGcJWA+8MKdTeovpQr4I5aonwzeA323Ni/QKDstjnVwVIof9wCB011Y89765C9gFmFlfs
	1PK61Ueu5T9eB/b9WWJJ+Tw46n3YnTz040GGmmVqLdQHvkIRIsJ4/qSo01u3bypm+YC6h2v8C3m
	cPBi5qGB7JBMLyNfIKfD6D/TDA+47WUHKG507HW3OQEHWTAZlvuxlD/8nPSHWQtmy3FC94eOd81
	sgHU=
X-Google-Smtp-Source: AGHT+IH9d7wkaxuxrUL8v2d0QMm2Q276myosmiOvMG6vgKHzpPm+9iVyAJuH223EFz+lPaJ+Q6FNgg==
X-Received: by 2002:a05:6808:870b:10b0:3f8:b73b:682b with SMTP id 5614622812f47-401c093292amr9050901b6e.7.1745418879453;
        Wed, 23 Apr 2025 07:34:39 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401beed8a5fsm2613094b6e.18.2025.04.23.07.34.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:34:38 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c09f8369cso2046705a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 07:34:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3kjq4SToZAbBCUwpPewpeTkDLSdt7miOHuBM3ANH8/NT3p+pD5ClA3Nl9Oy/72A8vUJZpm5ZLdA8WN18eVlQH@lists.infradead.org
X-Received: by 2002:a05:6830:6687:b0:72b:8ec3:9297 with SMTP id
 46e09a7af769-730062f764bmr15710973a34.21.1745418878334; Wed, 23 Apr 2025
 07:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
 <b1f19b31-3535-4bb5-bcef-6f17ad2a0ee6@arm.com> <CAMuHMdVJKA8zYETKJTRAwg6=+EuTq4YqbFO32K4+py9YNsD1Gw@mail.gmail.com>
 <aAjTg8dgvxqLQOwQ@vaman> <CAMuHMdXQKG0qptWMi169MVBL1S3hPo1TsaOSxWspoHAwRd+fug@mail.gmail.com>
 <aAjaPV/2DSyPAGRB@vaman> <b7557def-d0a1-4035-9586-a2651e28ab24@arm.com>
In-Reply-To: <b7557def-d0a1-4035-9586-a2651e28ab24@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 16:34:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoxPc71YYrEMdPwdq-HOhmP2jNiwo1+-8o6_v4YJ0NHQ@mail.gmail.com>
X-Gm-Features: ATxdqUEnXX6HpwpOQNi-bNaBAYBUuz0gKv8TfTPMoWQoV5DcAvXfFibPzFN2Uu4
Message-ID: <CAMuHMdWoxPc71YYrEMdPwdq-HOhmP2jNiwo1+-8o6_v4YJ0NHQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ARM_DMA350 should depend on ARM/ARM64
To: Robin Murphy <robin.murphy@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_073441_162840_08D6D786 
X-CRM114-Status: GOOD (  41.14  )
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

Hi Robin,

On Wed, 23 Apr 2025 at 15:29, Robin Murphy <robin.murphy@arm.com> wrote:
> On 2025-04-23 1:17 pm, Vinod Koul wrote:
> > On 23-04-25, 14:13, Geert Uytterhoeven wrote:
> >> On Wed, 23 Apr 2025 at 13:48, Vinod Koul <vkoul@kernel.org> wrote:
> >>> On 23-04-25, 13:11, Geert Uytterhoeven wrote:
> >>>> On Wed, 23 Apr 2025 at 12:59, Robin Murphy <robin.murphy@arm.com> wrote:
> >>>>> On 2025-04-22 7:11 pm, Geert Uytterhoeven wrote:
> >>>>>> The Arm DMA-350 controller is only present on Arm-based SoCs.
> >>>>>
> >>>>> Do you know that for sure? I certainly don't. This is a licensable,
> >>>>> self-contained DMA controller IP with no relationship whatsoever to any
> >>>>> particular CPU ISA - our other system IP products have turned up in the
> >>>>> wild paired with non-Arm CPUs, so I don't see any reason that DMA-350
> >>>>> wouldn't either.
> >>>>
> >>>> The dependency can always be relaxed later, when the need arises.
> >>>> Note that currently there are no users at all...
>
> Huh? There is now an upstream DT binding, and DTs using that binding
> most certainly already exist - not least the one I have, but I'm not the
> only one. We don't have a requirement that bindings must have
> upstream-supported consumers.

Dependencies in Kconfig are not related to DT bindings, they only
control what can be built?

> >>> True, but do we have any warnings generated as a result, if there are no
> >>> dependency should we still limit a driver to an arch?
> >>
> >> I am not aware of any warnings (I built it on MIPS yesterday ;-).
> >> It is just one more question that pops up during "make oldconfig",
> >> and Linus may notice and complain, too...
>
> Well, yeah? It's a new driver for some (relatively) new hardware; every
> release always adds loads of new drivers for things I don't personally
> care about, so I press "n" a lot when updating my config, just like I
> imagine most other people do, Linus included.

Please read [1] and ask yourself if Linux wants to see a question
about Arm DMA-350 when configuring a kernel for his AMD Threadripper
workstation...

> > True, give there are no users, lets pick this and drop if we get a non
> > arm user
>
> Well by that logic surely it should just depend on COMPILE_TEST, because
> there are no ARM or ARM64 "users" either?

If you want to push it that far, fine for me ;-)

> FWIW the not-quite-upstream platform I developed on (a custom build of
> fvp-base-revc with a DMA-350 component added) did happen to be ARM64, as
> are some other Arm-internal designs and one available SoC that I do know
> of containing DMA-350; I am not aware of any Linux-capable 32-bit
> platforms to justify an ARM dependency, so I'd consider that just as
> arbitrarily pulled out of thin air.

OK, then the ARM dependency can be dropped for now.
I had done a quick Google search to find SoCs that contain a DMA-350
instance, and had only found a Cortex-M0-based SoC, so I assumed it
would be used on ARM, too.

> But then to pick another example at random, XILINX_DMA equally has no
> "users", so please make that depend on something arbitrary as well for
> consistency; it's only fair.

Sure, there are lots of Kconfig symbols that could benefit from
additional dependencies. Unfortunately my time is limited, so usually
I create and send patches for new Kconfig symbols only....

Thanks!

[1] https://lore.kernel.org/all/CAHk-=wg+38EHPKGou1MqXwAAXC30cM8sMgZAGnZ7TcFO4L9J2w@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

