Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82E2D3A661
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 16:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLzrPWzlgkFiUziotVGT3esj9crGq7+1ihwfkLHXWiQ=; b=xIcgKx/O33/axcm0PGW6odGC+d
	zqpaMTmzxGbiqVPSWT0hAr5qmq04tjczXrt4VwEdCxvwEvymLEQXgmeEOOlVPCmimlVShhI1+M0jD
	Op/hWAi11+v48sBaL1alGdpX9EJQaXw1tO1ZOll0ANjOFHZGMGGkPY8xmemdJyR+N64E1xoZejTNg
	Mj9Qdm4Vo5mNc0NsQkVmoOP5q831w81zGbuT30XSEsZ0Ep8PtPYx8pPIb4U9KZzZiHFNYGpkjbckh
	Wtdsc2vCbxelGCyYqGBFMMVKKeuFMdif6v0kM2S4m9uZxlw+gqW5+bIkrmCaybsIhAsmZHdAEa7Vw
	m4D/AjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5okV-0000000F43P-1FJe;
	Tue, 29 Oct 2024 16:07:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oO1-0000000Ey5y-3brC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730216638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLzrPWzlgkFiUziotVGT3esj9crGq7+1ihwfkLHXWiQ=;
	b=JENzQ7SvtxrxEnabaZSQYVAShaaufeW5bsrPTXkpYy2kHpzT5wzE96tO8E8gdkZMT9/32v
	/FaPaZqva24bcKOqhSCvg/LmNtzTDRZMXrJYNAU93JXXM6MmEU8k7kymK7TNQMFyA7VGKH
	e/qIBKDq74d0c7kRs5DKakI0paMfYbg=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-ibLL7D5iOgWvcCYz3cYfsA-1; Tue, 29 Oct 2024 11:43:56 -0400
X-MC-Unique: ibLL7D5iOgWvcCYz3cYfsA-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2885c5af51cso8469923fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 08:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730216635; x=1730821435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLzrPWzlgkFiUziotVGT3esj9crGq7+1ihwfkLHXWiQ=;
        b=naSwE390qyQq5U1TAbBpQ/NKjJ4DxbDn7vP6P6lxcrYrojf7Y0j7sq+BU7y+1v8MR/
         hPN0Rwb045wICpDFu2WOKW8SrsmNfpz96D4CHkB+6jniAsukzSMHTKBEm5I4Ck8cf3C0
         VIDHwfZ4jlNjQrDtHpNDiwKBTl/PN1Fw4Wt6Hf1uGGblqSwPyR+oFLNgKEUjwQqRt+/s
         diKu4h64ZwNwtA/tYhZ+ovs1XjvusRXHJC83W7Ygf4Wcd8Dm8vTBeYB4BVt675Iorvy4
         SUUJb4iRNQshbXjbiINzL7CPozbSt0zd0XaRFNVbfcA8ZKcGGaPUbP0tNWWvlRAjLUhI
         VZ/g==
X-Forwarded-Encrypted: i=1; AJvYcCU0eIaeCVClHTXXhawZxqGNwCt2bg7qz75fIOvz/U8kD4qPfI2lVpCdI69hsHEQJn+jIZmiS7ik6EkekiNS975i@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlkq6efuXnYdz9NZXGrRXIyd3IXFLnAapBzAD5y6p0AzRgtu8I
	BX0WIjSGZJpyA4Oz6Vm+kwVG+tOwmQDeOcy5BU1ZZxRjgti4ttUAzyTn9TeC2qeWNw2vrTgkl5Q
	ZfeW9ekvY9gYZg9QnQFb1XDm/Rq72NSPxRNi8v0hx0f0F9ivmL0bQPcjd+nZsThe+Gwmru/u8xa
	3NJOVp3qfzV/Mh+UG/+9b3RT6cpUSqwn0v7pgWPrkwN93UvEQ=
X-Received: by 2002:a05:6870:c0cc:b0:268:2efa:2de0 with SMTP id 586e51a60fabf-29051b7d295mr10756356fac.13.1730216635496;
        Tue, 29 Oct 2024 08:43:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTdBdezoJ7VG3vDcy5K8pvqtBHt690NWETS+sPu3lYdLD78vt8pfHXNLZWYN26LTrmH4wgdkvUV70KRX6avfM=
X-Received: by 2002:a05:6870:c0cc:b0:268:2efa:2de0 with SMTP id
 586e51a60fabf-29051b7d295mr10756341fac.13.1730216635261; Tue, 29 Oct 2024
 08:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
 <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com>
In-Reply-To: <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 29 Oct 2024 16:43:39 +0100
Message-ID: <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>
Subject: Re: [bug] aarch64 host no longer boots after 767507654c22
 ("arch_numa: switch over to numa_memblks")
To: Zi Yan <ziy@nvidia.com>
Cc: rppt@kernel.org, linux-mm@kvack.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Jonathan.Cameron@huawei.com, 
	dan.j.williams@intel.com, David Hildenbrand <david@redhat.com>, linux-tegra@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_084401_983369_C7FE33E1 
X-CRM114-Status: GOOD (  20.57  )
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

On Tue, Oct 29, 2024 at 4:07=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> +tegra mailing list and maintainers
>
> On 29 Oct 2024, at 8:47, Jan Stancek wrote:
>
> > Hi,
> >
> > I'm seeing a regression on Nvidia IGX system, which no longer boots.
> >
> > bisect points at commit 767507654c22 ("arch_numa: switch over to numa_m=
emblks").
> > It hangs very early, with 4k or 64k pages, with no kernel messages prin=
ted:
> >
> > EFI stub: Booting Linux Kernel...
> > EFI stub: Using DTB from configuration table
> > EFI stub: Exiting boot services...
> > <hangs here>
> >
>
> Is it possible to have earlycon output? It is hard to debug without any
> information except kernel fails to boot.

I know it was a long shot, so far I haven't had luck getting it to work.

>
> Since the previous commit boots and I assume both kernels are compiled
> with the same gcc toolchain, this should not be caused by the binuils
> bug in 2.42[1]. Is your binutils version 2.42?

Yes, both are compiled locally, with binutils 2.41

>
> Thanks.
>
>
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=3D31924
>
> > Here's a log from successful boot with previous commit:
> > https://people.redhat.com/jstancek/aarch64_numa_boot/console-log-good.t=
xt
> > and config: https://people.redhat.com/jstancek/aarch64_numa_boot/config
> >
> > # lscpu
> > Architecture:             aarch64
> >   CPU op-mode(s):         32-bit, 64-bit
> >   Byte Order:             Little Endian
> > CPU(s):                   12
> >   On-line CPU(s) list:    0-11
> > Vendor ID:                ARM
> >   BIOS Vendor ID:         NVIDIA
> >   Model name:             Cortex-A78AE
> >     BIOS Model name:      Not Specified Not Specified CPU @ 0.0GHz
> >     BIOS CPU family:      257
> >     Model:                1
> >     Thread(s) per core:   1
> >     Core(s) per cluster:  12
> >     Socket(s):            1
> >     Cluster(s):           1
> >     Stepping:             r0p1
> >     CPU(s) scaling MHz:   100%
> >     CPU max MHz:          1971.2000
> >     CPU min MHz:          115.2000
> >     BogoMIPS:             62.50
> >     Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc32
> > atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp uscat ilrcpc
> > flagm paca pacg
> > Caches (sum of all):
> >   L1d:                    768 KiB (12 instances)
> >   L1i:                    768 KiB (12 instances)
> >   L2:                     3 MiB (12 instances)
> >   L3:                     6 MiB (3 instances)
> > NUMA:
> >   NUMA node(s):           1
> >   NUMA node0 CPU(s):      0-11
> > Vulnerabilities:
> >   Gather data sampling:   Not affected
> >   Itlb multihit:          Not affected
> >   L1tf:                   Not affected
> >   Mds:                    Not affected
> >   Meltdown:               Not affected
> >   Mmio stale data:        Not affected
> >   Reg file data sampling: Not affected
> >   Retbleed:               Not affected
> >   Spec rstack overflow:   Not affected
> >   Spec store bypass:      Mitigation; Speculative Store Bypass
> > disabled via prctl
> >   Spectre v1:             Mitigation; __user pointer sanitization
> >   Spectre v2:             Mitigation; CSV2, BHB
> >   Srbds:                  Not affected
> >   Tsx async abort:        Not affected
> >
> > Regards,
> > Jan
>
>
> Best Regards,
> Yan, Zi
>


