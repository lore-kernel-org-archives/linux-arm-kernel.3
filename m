Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A49C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wl/1DFtCVA8JUg3JrvOVSDvXuYWKhgnuN/JPe0OCyKE=; b=N+3OmUGupoi87rDX+cZ3UiLEiF
	UQTfZPZiME1jvXTqjZiQ8w4sIj7j9kuGxEWpQeUe/CgVNYCgE+4dH/I1KMGEItan9FdDk1GRtwx9k
	orm5M/fZ03AbAECx5h9m2a8Tb4QJtpJM8xZAtfzlD9dlVv45Qivd+0m0pGU0/IZEVBXJIHbnPuQQ+
	+tWC4ohWlCBAOOvgYlLX6AAXTf2cq4UTZGgIH1Chl/ev0G+e00sBVX931aQRckV1UVjCu9bNwPRCX
	I2Dj0DRBJDWtzgxtHbX4Hg/U6Wu1PSrd/y31TYsmDVdF9JY2NNhCAwIHdm0dJbS0pmMT9bFXtr7f7
	0pxwYTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbzL-00000001bUD-3GC2;
	Mon, 10 Feb 2025 22:10:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thare-00000001QRy-0hSw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 20:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Wl/1DFtCVA8JUg3JrvOVSDvXuYWKhgnuN/JPe0OCyKE=; b=F3/q+DDHi9INeM+siW3NvYKHhu
	xgkZawcO5o3lfANZpL6eQRifpMTOeEEzqPidchM53jZNLYJpaSpDlsAvzT8/mTODv9e8viQT8wulH
	uZO4GAHc+9LkmQEi0YEXLwPN3MdPOqlsWgtAVZfEcPgQQw7870X0XUMQ+0LB0e5PlKPXL697X/ZtC
	OWxMv5jVy73BlA8FjjUue9RYL+7TcaMkTM3jbj/6uT/9eaPBdyWZ/K8tD8KoJaYAuCZoMvkOnAdw3
	0olSwRgxZgVvfYy3CGo9QPKp5YjF//TfOWg4xZr2aBkiDZNr6W91nWF3Ebm2nMVdYGciOh1AuLc04
	XzIhwSIg==;
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thara-00000000GDf-42Bm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 20:58:44 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4718b128eafso6680841cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 12:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1739221118; x=1739825918; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wl/1DFtCVA8JUg3JrvOVSDvXuYWKhgnuN/JPe0OCyKE=;
        b=a3LACJo6zc02gFP/8v2wgcnIHrOlkTSMxlsB+AisYfXlbe/LNc0p29gS0hMRMW1UmV
         uqgvE7D3gIKMsD4AiP4UxZqSFCa97kVH4NG25w0/6I+1NUD+6V1ednv+WM+UIfLzmQfx
         b5CnywVvgZM6gcZPcdfVZ2xJSFOXjiXBTusuA5X4Q/pVh4M2xbD/f3FAaZZMu1tTYItF
         h95QWKbPx1d/n3s8CHUSb5pu4AB5MWSg6yLvElzQL+xN3WHaqhS2hUpueEvTBTdDVanO
         WFs5s0LttU96nzu4I696pVVCHBiIZm889aG0cq/ywHy+PFZB5q0ssGKDLLyHzxNsjvkq
         wP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739221118; x=1739825918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wl/1DFtCVA8JUg3JrvOVSDvXuYWKhgnuN/JPe0OCyKE=;
        b=u3RjaaqZIsnanoZo3R2ZaIVjGIM04RGuP55RFxifVXpR8SjtO7srFvJnR/NVmFD8F6
         OT402NRcsb5bHPz7MVhv/6yIaHWwYoTqqTlztp9Lr0xDnm7MTIYwvUPM7JwFGahPiriz
         tvLtc+8390Zr9cydLHndMVOyO8fbPRvcehXn9cwhGHFuZqKfWJIj7eXTZkWBxAp01YVT
         a9Th9bLJGGAToO7nR4/JU9tfnq8GnR/z7NFnb3J006Sopsl+TTpFC9VivubxlZZo9DL6
         86C8Mk/TQaQPbW8Ojm68psM9RGXh+Phs+rNlRBS6bUuafQ8fPtIxCv82g76XwAxXypC2
         FkRw==
X-Forwarded-Encrypted: i=1; AJvYcCXvifG6wDmmUeq2FFRv1N0YIDFIOs5A2B+uCpWbjhvEFVwJQpfS3ZhvB+XinEAF2mkXgN3jUmMFWtJmjYBD6qOY@lists.infradead.org
X-Gm-Message-State: AOJu0YxHKIpD5t2uCj640PpUrYmPMbG26UevSLgYjhbQ/s+VVZ1p2ooA
	QL5dans3IX+GZ2a2tVHeci/VgdPjSbEN94+jIpUxDBF2xatVnzISK8RtL8Eg53uq2+XobKGYdK0
	Sbn0H2g9nOkdfZZDlljIrdrl11PW/rRU45NqcRQ==
X-Gm-Gg: ASbGnctpNpGIVbS99TfG77YAviEAYQGU7W4fo4q8R2vLUg/KhRhO6lPr4lq9md7wSUO
	x+eeqQAC9iDOcDKXkX1qBXrSrUjiDQCbfPA1M0HkY8BDJY9+Z9lx4b9RbJSTKQic/mFCp9Q==
X-Google-Smtp-Source: AGHT+IETHCKadrtvKNJ7fIHLak3uf8ALu7tDsyEEqgrBMvB7GxxInEvWUg2pBVKBZMO1RROtaHb319Yhs3eTr5CpbD4=
X-Received: by 2002:a05:622a:1a05:b0:46c:86d8:fc5 with SMTP id
 d75a77b69052e-471679cb76emr238937621cf.5.1739221117601; Mon, 10 Feb 2025
 12:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <20250206132754.2596694-6-rppt@kernel.org>
 <20250210202220.GC3765641@nvidia.com>
In-Reply-To: <20250210202220.GC3765641@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 10 Feb 2025 15:58:00 -0500
X-Gm-Features: AWEUYZnfXstpOnVhbWRWzg5zc_KYEQnAl1ReknkHBBoTgx3FQhtVYh2voma8nHI
Message-ID: <CA+CK2bBBX+HgD0HLj-AyTScM59F2wXq11BEPgejPMHoEwqj+_Q@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] kexec: Add Kexec HandOver (KHO) generation helpers
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Lutomirski <luto@kernel.org>, Anthony Yznaga <anthony.yznaga@oracle.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Woodhouse <dwmw2@infradead.org>, Eric Biederman <ebiederm@xmission.com>, 
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_205843_313775_C27842A0 
X-CRM114-Status: GOOD (  44.72  )
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

On Mon, Feb 10, 2025 at 3:22=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Feb 06, 2025 at 03:27:45PM +0200, Mike Rapoport wrote:
> > diff --git a/Documentation/ABI/testing/sysfs-kernel-kho b/Documentation=
/ABI/testing/sysfs-kernel-kho
> > new file mode 100644
> > index 000000000000..f13b252bc303
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-kernel-kho
> > @@ -0,0 +1,53 @@
> > +What:                /sys/kernel/kho/active
> > +Date:                December 2023
> > +Contact:     Alexander Graf <graf@amazon.com>
> > +Description:
> > +             Kexec HandOver (KHO) allows Linux to transition the state=
 of
> > +             compatible drivers into the next kexec'ed kernel. To do s=
o,
> > +             device drivers will serialize their current state into a =
DT.
> > +             While the state is serialized, they are unable to perform
> > +             any modifications to state that was serialized, such as
> > +             handed over memory allocations.
> > +
> > +             When this file contains "1", the system is in the transit=
ion
> > +             state. When contains "0", it is not. To switch between th=
e
> > +             two states, echo the respective number into this file.
>
> I don't think this is a great interface for the actual state machine..

In our next proposal we are going to remove this "activate" phase.

>
> > +What:                /sys/kernel/kho/dt_max
> > +Date:                December 2023
> > +Contact:     Alexander Graf <graf@amazon.com>
> > +Description:
> > +             KHO needs to allocate a buffer for the DT that gets
> > +             generated before it knows the final size. By default, it
> > +             will allocate 10 MiB for it. You can write to this file
> > +             to modify the size of that allocation.
>
> Seems gross, why can't it use a non-contiguous page list to generate
> the FDT? :\

We will consider some of these ideas in the future version. I like the
idea of using preserved memory to carry sparse KHO tree: i.e FDT over
sparse memory, maybe use the anchor page to describe how it should be
vmapped into a virtually contiguous tree in the next kernel?

>
> See below for a suggestion..
>
> > +static int kho_serialize(void)
> > +{
> > +     void *fdt =3D NULL;
> > +     int err =3D -ENOMEM;
> > +
> > +     fdt =3D kvmalloc(kho_out.dt_max, GFP_KERNEL);
> > +     if (!fdt)
> > +             goto out;
> > +
> > +     if (fdt_create(fdt, kho_out.dt_max)) {
> > +             err =3D -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +     err =3D fdt_finish_reservemap(fdt);
> > +     if (err)
> > +             goto out;
> > +
> > +     err =3D fdt_begin_node(fdt, "");
> > +     if (err)
> > +             goto out;
> > +
> > +     err =3D fdt_property_string(fdt, "compatible", "kho-v1");
> > +     if (err)
> > +             goto out;
> > +
> > +     /* Loop through all kho dump functions */
> > +     err =3D blocking_notifier_call_chain(&kho_out.chain_head, KEXEC_K=
HO_DUMP, fdt);
> > +     err =3D notifier_to_errno(err);
>
> I don't see this really working long term. I think we'd like each
> component to be able to serialize at its own pace under userspace
> control.
>
> This design requires that the whole thing be wrapped in a notifier
> callback just so we can make use of the fdt APIs.
>
> It seems like a poor fit me.
>
> IMHO if you want to keep using FDT I suggest that each serializing
> component (ie driver, ftrace whatever) allocate its own FDT fragment
> from scratch and the main KHO one just link to the memories that holds
> those fragements.
>
> Ie the driver experience would be more like
>
>  kho =3D kho_start_storage("my_compatible_string,v1", some_kind_of_instan=
ce_key);
>
>  fdt...(kho->fdt..)
>
>  kho_finish_storage(kho);
>
> Where this ends up creating a stand alone FDT fragment:
>
> /dts-v1/;
> / {
>   compatible =3D "linux-kho,my_compatible_string,v1";
>   instance =3D some_kind_of_instance_key;
>   key-value-1 =3D <..>;
>   key-value-1 =3D <..>;
> };
>
> And then kho_finish_storage() would remember the phys/length until the
> kexec fdt is produced as the very last step.
>
> This way we could do things like fdbox an iommufd and create the above
> FDT fragment completely seperately from any notifier chain and,
> crucially, disconnected from the fdt_create() for the kexec payload.
>
> Further, if you split things like this (it will waste some small
> amount of memory) you can probably get to a point where no single FDT
> is more than 4k. That looks like it would simplify/robustify alot of
> stuff?
>
> Jason
>

