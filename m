Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72186C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 13:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNnj7+IGvRtmWRtdYlqf7RvYRLfXlCqJXD/wP+Mfkkw=; b=EW9jNaZZ71sLmQ3f9vaGWDWpms
	zWPN+nhvJihub3QNQ3wKqL1QDbV8+YK9HWQN87HEWN2dCIJ/1XRcN5DVc1+6YZaVNbN1WI1fuh7n3
	4/7BwbrNUVdrReAri4Ydy6icrlmb1pxGdr+mTHMEcvMMqaeUlLXeGvYhXe/6FoBhea3zcbTBeea31
	MHsIvW4JUdukMaZV5ZRaA4MF6U7tn4S6WZSayXH7kOsiq6pk/Oj1NQL2iZxiZXqbHnveBrKyUaNh6
	0CFr9xwGs2EM/qArdmeJFtTywGFvM20XpR5STOgrgzb/Fl/MvJDyx2qGtx7Mj1kfAzareyBVoMI5g
	UrAGIcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivfg-0000000EzVH-3X9Y;
	Fri, 14 Feb 2025 13:23:56 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tivPl-0000000Ew8F-1H7G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 13:07:31 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso36137236d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 05:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739538445; x=1740143245; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNnj7+IGvRtmWRtdYlqf7RvYRLfXlCqJXD/wP+Mfkkw=;
        b=M/CV/bildPaNYfvx6/cxa7gaM1zTAUXPsyE0/BK3xQ851JHvOlUOjyXVmwFqtsDLyw
         ovpp9jOeYcI7MXSDV0h27yHFd207KyQCIWO3ymJoGljM0UVosZqN/fjXHTSSY1JC6r6o
         4ekvnAtXdkmoEMU6odGRCjvmNCswTrkS1Qq8zRbND56IhP9du62c1t/1TOv26J02GXKk
         Kq1G58PgHvOhSdONRieJeEIsF1SaWlGH4P6o0TQiBDDB3lm5BH+tXW8dOy+ybuaRde+m
         PpOsI+Rjq2bDr5hOXbAGgVolwx0O0gwn6GhQXVR5a4qYFFvaORKO8nXSxJMtbK1Xcr0B
         1g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739538445; x=1740143245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNnj7+IGvRtmWRtdYlqf7RvYRLfXlCqJXD/wP+Mfkkw=;
        b=hRnpBvt+1wVH7h/zzjpq0/n485A9bPvA+txv4PXRsgk0WJTIqMx3MlwOSm4A2wMkmG
         u9mO2aWZw4AznT29WrS5Gn724bS33Bt65z7nJ6PANgKKMpa+3LtlEESdR+9rArfqWkCN
         grh7vPY/zQIu6t7JM4BO6QH1F75pZnpc19ghkAixMvmZd2K/az4WbNi76zyB/7hsNM5z
         nJlVfzYzeW8oG7/bxoaN9eAgy17KrJNggxPpIwQGz1bN+t2yoCYSkdmGJDxRdYXtEq+3
         mD55YS4F69CqOQoHqztm2x76Va9nqdr9VMtfcG4Cnj/8vuG2V6aGMNKfAqmtCvb0BVpR
         O79Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2EefDCARdXJni8RAbJPo7/ibIhPT2I9dC3N2KWOKKIobcY26ATGk7TdJi+Uj6X5EtPttT734no3upvcYrZTZN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw71fOa9tvSiO2O/i4Ty5J7NuG0pAtsb7S/j3PGnp2PyQYV6qJE
	W7mx94yKuAbP1XO8xFOKCMMpdWoZn4spY1P4LwjcTiDy1gts3NRkFlbVqnVrq72013qkg69MCGN
	lf6NzfS9W2vhRKRknnJN26Sl9FepmXQaK2a5KrQ==
X-Gm-Gg: ASbGncsvzFsCLMf58w+5IhUBxfO9+bRpZfyizN3bgV/vW8p8ZpR0Sxl9CbjRIq+U3tb
	OUvJCao2Hbpf//9rmzN1Bin40dsV1L3svbt1DeL/abOwq7xsyI9t6r8eLCE5GxWlgRHia3S79n1
	U=
X-Google-Smtp-Source: AGHT+IE3ByM7DSgjLBAaQUp9tqk81OqGvrRN0VTqQ2J9pH/WZcBHm5+t6oEWmrDoJ+W5s9rNaAD7/fQhaTsa/R2yq4c=
X-Received: by 2002:a05:6214:469c:b0:6e6:6225:a907 with SMTP id
 6a1803df08f44-6e66225a975mr79026126d6.31.1739538445485; Fri, 14 Feb 2025
 05:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com> <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
In-Reply-To: <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 14 Feb 2025 18:37:14 +0530
X-Gm-Features: AWEUYZnJYqssuMMtIO5Ohg5UzNEocwYL0hODNzFGJUyN-biak0SnkML6hDkQjD8
Message-ID: <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Jens Wiklander <jens.wiklander@linaro.org>, Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_050729_336761_1DF35D07 
X-CRM114-Status: GOOD (  48.09  )
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

On Fri, 14 Feb 2025 at 15:37, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>
> Hi,
>
> On Thu, Feb 13, 2025 at 6:39=E2=80=AFPM Daniel Stone <daniel@fooishbar.or=
g> wrote:
> >
> > Hi,
> >
> > On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> > > On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishba=
r.org> wrote:
> > > > But just because TEE is one good backend implementation, doesn't me=
an
> > > > it should be the userspace ABI. Why should userspace care that TEE =
has
> > > > mediated the allocation instead of it being a predefined range with=
in
> > > > DT?
> > >
> > > The TEE may very well use a predefined range that part is abstracted
> > > with the interface.
> >
> > Of course. But you can also (and this has been shipped on real
> > devices) handle this without any per-allocation TEE needs by simply
> > allocating from a memory range which is predefined within DT.
> >
> > From the userspace point of view, why should there be one ABI to
> > allocate memory from a predefined range which is delivered by DT to
> > the kernel, and one ABI to allocate memory from a predefined range
> > which is mediated by TEE?
>
> We need some way to specify the protection profile (or use case as
> I've called it in the ABI) required for the buffer. Whether it's
> defined in DT seems irrelevant.
>
> >
> > > >  What advantage
> > > > does userspace get from having to have a different codepath to get =
a
> > > > different handle to memory? What about x86?
> > > >
> > > > I think this proposal is looking at it from the wrong direction.
> > > > Instead of working upwards from the implementation to userspace, st=
art
> > > > with userspace and work downwards. The interesting property to focu=
s
> > > > on is allocating memory, not that EL1 is involved behind the scenes=
.
> > >
> > > From what I've gathered from earlier discussions, it wasn't much of a
> > > problem for userspace to handle this. If the kernel were to provide i=
t
> > > via a different ABI, how would it be easier to implement in the
> > > kernel? I think we need an example to understand your suggestion.
> >
> > It is a problem for userspace, because we need to expose acceptable
> > parameters for allocation through the entire stack. If you look at the
> > dmabuf documentation in the kernel for how buffers should be allocated
> > and exchanged, you can see the negotiation flow for modifiers. This
> > permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.
>
> What dma-buf properties are you referring to?
> dma_heap_ioctl_allocate() accepts a few flags for the resulting file
> descriptor and no flags for the heap itself.
>
> >
> > Standardising on heaps allows us to add those in a similar way.
>
> How would you solve this with heaps? Would you use one heap for each
> protection profile (use case), add heap_flags, or do a bit of both?

Christian gave an historical background here [1] as to why that hasn't
worked in the past with DMA heaps given the scalability issues.

[1] https://lore.kernel.org/dri-devel/e967e382-6cca-4dee-8333-39892d532f71@=
gmail.com/

>
> > If we
> > have to add different allocation mechanisms, then the complexity
> > increases, permeating not only into all the different userspace APIs,
> > but also into the drivers which need to support every different
> > allocation mechanism even if they have no opinion on it - e.g. Mali
> > doesn't care in any way whether the allocation comes from a heap or
> > TEE or ACPI or whatever, it cares only that the memory is protected.
> >
> > Does that help?
>
> I think you're missing the stage where an unprotected buffer is
> received and decrypted into a protected buffer. If you use the TEE for
> decryption or to configure the involved devices for the use case, it
> makes sense to let the TEE allocate the buffers, too. A TEE doesn't
> have to be an OS in the secure world, it can be an abstraction to
> support the use case depending on the design. So the restricted buffer
> is already allocated before we reach Mali in your example.
>
> Allocating restricted buffers from the TEE subsystem saves us from
> maintaining proxy dma-buf heaps.

+1

-Sumit

