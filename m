Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82745D6B6DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 21:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUWOyc2+VA+j7fVuDS9r8cTqpyGqEZHb2HZIq5jjl14=; b=GevUVkaIcfngvm6AysZicyIyUz
	wdTSdso25unkAHbEJQ/Giuv+Lsv8LIFHOvkEzJkJkUWx7fjEJCmVP15N0JMbSvPLW2Yi4XgupOyVf
	qdJUcuh0cKpjr6dsuoCPFO1Cno6Nx4MfehZYTW22umVxS7YXeQl/mMGPI5hwv1WFCod2T7mew+PE7
	HMfLErcAhEriysFNID43NJrMSTFLcz9P3kWRdd+t7PdRadfL1cMhhGuBFoHCAK+SK01gu/ag8fs3S
	utk/MhUq9ERMB95tjO27+hXSu81b7T8397Ad65FVd3QPOM4DMzVaUV81E7gjuW//BXonhKFs+2oD7
	WDCWkZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Gc6-00000001vmS-3x7U;
	Wed, 30 Oct 2024 21:52:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6GaT-00000001vha-0YEN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 21:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730325042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GUWOyc2+VA+j7fVuDS9r8cTqpyGqEZHb2HZIq5jjl14=;
	b=DuvFsl7r/gzsiRrQFsfZmHSk4aF6SIL1eXbmZJdAXz6Tg1vT1j87RmMtVddu7XMK3ZuU3l
	surNuceaKPrwInqdQm98AZ1lphnPMdeBirwmUjYlwG3Y/zHL0iGcaBRcrr5G67Bv0MpNH9
	TtquqrMPhIfyFRKkEvCtN3IEAaEv3fI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-F6tOaxSVPC6YMr7FZqnGUg-1; Wed, 30 Oct 2024 17:50:41 -0400
X-MC-Unique: F6tOaxSVPC6YMr7FZqnGUg-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5eb6275167dso385872eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 14:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730325040; x=1730929840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUWOyc2+VA+j7fVuDS9r8cTqpyGqEZHb2HZIq5jjl14=;
        b=j+pPBS2rWuIAaP9pBWUOI+clCtMUM00MgQS0XbX7eDnbI2dM2FKDfLvafxNVGO+myN
         Cf/oFa52voMTQCd8tSlKe+bZXwAEpaVLKx2b1LvCcJLLSrz1BgaYJp7sHbtjTEzTIKxd
         Gc4zTeTxxDd1lkpIXrLCICe7QQOokfCHTNISXCGUVS9he/8Ek3nvM9qoecF89bKnMlLA
         NRoTALjcoVby7cc2nZHez8wEJ7lTJEJehBB7WYVn+g7YSmjYm+1tQPGedpIlHJjHBSS5
         tPRsg7rpWmHX+54yTNvbXWQEv6n1RcpVbXWwmRnZ4waUe11zlUQW8eBbUZDh0Pgu+3Yw
         G5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFHnK7wxHooLWejKPnA1dEOHK0bLZZ34AMIiO+HlGTpjfo73NJgDp4uGais34HYz33DkvQX3MSgeZGcFaqjhfN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6wwLx6WrcbWlMrqDZMRaBcvP7c6yYhw+lbwZnN13fdVYLStAH
	BqTSt98oKRhHFGmCDrI4O5uBWaO1FeKbuxiCJkQ4TmiNrtPvYyGm2cPeXESv97iBjG7znCsnASa
	qYbjvaZckPdlfUE+/P/yCWGDfDzbtqUI673t0LTnXvu2/31IiITIKHNBQKCfk46r9S7xFr+/Rjv
	060WixaFc+k0KIfh1zAm5T4SnIAvbTKq5gRIvRQkSEBe/W5sk=
X-Received: by 2002:a05:6820:1ca7:b0:5eb:6a67:6255 with SMTP id 006d021491bc7-5ec23809e29mr13769662eaf.1.1730325040643;
        Wed, 30 Oct 2024 14:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE2uD/p2nyIXD+eR1GIhHhe5wbCBe/BhMzZze8dvS/ZMdiztngBVFDGkld4cJXA26nFTUftxz2Ds4m0zMr/lY=
X-Received: by 2002:a05:6820:1ca7:b0:5eb:6a67:6255 with SMTP id
 006d021491bc7-5ec23809e29mr13769651eaf.1.1730325040348; Wed, 30 Oct 2024
 14:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
 <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com> <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>
 <ZyELRjoDLmHeVvSR@kernel.org> <CAASaF6x8cMJUTYpm0dedkh9boXgVaL9WvxaG-r+aHY+6QOpw6Q@mail.gmail.com>
 <ZyIvxWghfaK81I4d@kernel.org>
In-Reply-To: <ZyIvxWghfaK81I4d@kernel.org>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 30 Oct 2024 22:50:12 +0100
Message-ID: <CAASaF6xU4zbjFNEZkNLsPZz=d2-8dqbKkogU7xH05rgvUE4nhg@mail.gmail.com>
Subject: Re: [bug] aarch64 host no longer boots after 767507654c22
 ("arch_numa: switch over to numa_memblks")
To: Mike Rapoport <rppt@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Jonathan.Cameron@huawei.com, 
	dan.j.williams@intel.com, David Hildenbrand <david@redhat.com>, linux-tegra@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_145045_268401_BEABCD35 
X-CRM114-Status: GOOD (  20.60  )
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

On Wed, Oct 30, 2024 at 2:12=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Tue, Oct 29, 2024 at 10:03:31PM +0100, Jan Stancek wrote:
> > On Tue, Oct 29, 2024 at 5:24=E2=80=AFPM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > On Tue, Oct 29, 2024 at 04:43:39PM +0100, Jan Stancek wrote:
> > > > On Tue, Oct 29, 2024 at 4:07=E2=80=AFPM Zi Yan <ziy@nvidia.com> wro=
te:
> > > > >
> > > > > +tegra mailing list and maintainers
> > > > >
> > > > > On 29 Oct 2024, at 8:47, Jan Stancek wrote:
> > > > >
> > > > > > Hi,
> > > > > >
> > > > > > I'm seeing a regression on Nvidia IGX system, which no longer b=
oots.
> > > > > >
> > > > > > bisect points at commit 767507654c22 ("arch_numa: switch over t=
o numa_memblks").
> > > > > > It hangs very early, with 4k or 64k pages, with no kernel messa=
ges printed:
> > > > > >
> > > > > > EFI stub: Booting Linux Kernel...
> > > > > > EFI stub: Using DTB from configuration table
> > > > > > EFI stub: Exiting boot services...
> > > > > > <hangs here>
> > > > > >
> > > > >
> > > > > Is it possible to have earlycon output? It is hard to debug witho=
ut any
> > > > > information except kernel fails to boot.
> > > >
> > > > I know it was a long shot, so far I haven't had luck getting it to =
work.
> > >
> > > Does it boot with numa=3Doff and numa=3Dfake?
> >
> > No, it doesn't.
>
> No ideas without the logs, sorry.

With some trial & error I narrowed it down, but as it turns out
the fix has already landed upstream today:
d95fb348f016 ("mm: numa_clear_kernel_node_hotplug: Add NUMA_NO_NODE
check for node id")

Regards,
Jan


