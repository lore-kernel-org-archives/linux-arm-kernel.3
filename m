Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AFEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 03:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QX+zFdWjeuQlzuCcAZM/kErn+a5XVCQ6Ck8ssaU/og=; b=hFvxTf2ZFw2UesR7G46+wnEmFi
	TCjQwyzWRHsOZp5xZV0lnjHSxxSOW/2mbjSNZ3fVO+jLpNnza9QrBNQPn1jHbxCqTUZtqxXU2WdKw
	gyHIJsv8ilClhE6/toavN51fJLpCbw/jThRyYS+nAmxYvpACzmyJOYCKWYtzJLHid1d5GOuRmnI/X
	7eAgU/vSWy1QTUcGeXOv0qKCYwgvMLVbu3I1rYUYllz4IKS4+fqlni1o5RnVk0mjfaeZDsycExGCz
	l/XAq9W3R/nWjGBgG4vOfMoS31Sg64Fgrc8UkdGdkSUyr1C08Yt3Sq3QTAXaAjX47CfTE2MstYTDs
	DYsFjtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twufV-00000004jad-3a7U;
	Tue, 25 Mar 2025 03:09:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twucs-00000004jLK-3ozU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 03:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742872008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8QX+zFdWjeuQlzuCcAZM/kErn+a5XVCQ6Ck8ssaU/og=;
	b=gt/DY1J/08YJGkLPSbtFsj9R0wa9fKrpv0qFhOS8BcAQTTB+X7Wy+jG+mVWQ1vMk4yrREM
	ZiH3R+YzkRLR9m9doV7s1JZsBY85LNv/o6pLKGyiTEx2Exp1aluntf5+ihk8Y6OuwmzG8v
	29RgOsYkL7AjGDiqBAM+q01qch4kb1w=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-ku47zlupMQuGSKUKNt125Q-1; Mon, 24 Mar 2025 23:06:46 -0400
X-MC-Unique: ku47zlupMQuGSKUKNt125Q-1
X-Mimecast-MFC-AGG-ID: ku47zlupMQuGSKUKNt125Q_1742872006
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d443811ed2so86701775ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 20:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742872006; x=1743476806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QX+zFdWjeuQlzuCcAZM/kErn+a5XVCQ6Ck8ssaU/og=;
        b=YMgljxqPjo6pDqmOaO8Nmyk0y8Ng6ltCDooxQwlnEBcT/5M7ua4D3ZRlO5q+XDu2/E
         IKDZAq30gvtk4tBKYWh8/B87iEOnKaYWCaExWfnbITPC/E3vhDmPQaHKKp9OGDR4TOyb
         kWLEzWz2JX+9Rnu9W7RAeGmVRTN+2iMSbx84EytMYvELB1OH0zX8Y4xCKLl7lBKFO+sT
         afgGtOsb0p5r4hvwG0fYa0bjZmORqzvMvnTVrJ490CdouQ1PEIsrznvqfb76BXZIEHaD
         TGeOkAmFsfEQtNdjkGb8SFlKqpRvRt77bo9dj49P/I5CDGifxKQUylby3obtHFR9dgQ3
         P+cw==
X-Forwarded-Encrypted: i=1; AJvYcCUFEGkdOCTdacDx3zuH3ooXra6YkbQB5u2g4An53ngRSZS0U1Bff/F4gNCzudzKyaewBPJhRfMyIGMMqwqj/NHn@lists.infradead.org
X-Gm-Message-State: AOJu0YxL4B0JfeTUqQFUByIWBWJ6Q9h6haRl1kTFZjGPzKWbSJGAnBHD
	AVbbCBOtX0+cR6D99/Xma2lu8ktKAGnoJqUnVcXv57VWzcf4lvgLZpGZanloHq+rs4FuquwmdDf
	IujZX1uDh+50nR5zWjn9vO/c3tI4OfB3TuOmijcsyz7C4lc2ubF8dwWN4ZkpRv5aTNEPo0979rF
	T9sRwoROmrGfF8xLbyNrm/zOh9lvh9DdzRFxapR+CbV/G7zEQ=
X-Gm-Gg: ASbGncu1ENeV68OOGlUF5SuzGEN7z/XrgFhS3Wn0DWbfWLpMwMGmkxZeFSPCjNtjxOX
	db5xbeoMcwwt2bXWqzEQh2o2CqF9QbbpklcNUtIDvCVtWtEc5zWqG84oko7+hmwZ7z8Bk2sYjZg
	==
X-Received: by 2002:a05:6e02:748:b0:3d4:6e2f:b493 with SMTP id e9e14a558f8ab-3d59615d9b2mr153651235ab.11.1742872006023;
        Mon, 24 Mar 2025 20:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5XTfTYA1qkf4MGjSh6Evza+A2MB/jUqh1YG/uG3OXh4qzNNvGTBc1K4PgXO/eVmwdqOvHcPKX5AjVSKaQhLs=
X-Received: by 2002:a05:6e02:748:b0:3d4:6e2f:b493 with SMTP id
 e9e14a558f8ab-3d59615d9b2mr153650885ab.11.1742872005537; Mon, 24 Mar 2025
 20:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <CA+CK2bC4PM0JnHOUm7qfpQ=wUhwsYQ-hJ12tTK_7pSWgYk+bhg@mail.gmail.com> <CALu+AoRL+oHW2vN8nf1wpsG2Ki8d44AABQRCBMd+CE4_XzqRTw@mail.gmail.com>
In-Reply-To: <CALu+AoRL+oHW2vN8nf1wpsG2Ki8d44AABQRCBMd+CE4_XzqRTw@mail.gmail.com>
From: Dave Young <dyoung@redhat.com>
Date: Tue, 25 Mar 2025 11:07:06 +0800
X-Gm-Features: AQ5f1JodZdPjZPmn7C-4IUrPojZILVca8awRM4MpIz-0KIylSAlKoZUHH0RUnGg
Message-ID: <CALu+AoSzOixDBHiFdry=RbFGX5Umk5XxLC=BmPKMYW7rCLUxSw@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org, graf@amazon.com, 
	akpm@linux-foundation.org, luto@kernel.org, anthony.yznaga@oracle.com, 
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	hpa@zytor.com, peterz@infradead.org, ptyadav@amazon.de, robh+dt@kernel.org, 
	robh@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com, 
	usama.arif@bytedance.com, will@kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gWHon3O1DYerzs2-xDlBaL-neDr2Rn_OKIukjqTzo4I_1742872006
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_200651_037236_AEEFC11A 
X-CRM114-Status: GOOD (  40.59  )
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

On Tue, 25 Mar 2025 at 09:24, Dave Young <dyoung@redhat.com> wrote:
>
> On Tue, 25 Mar 2025 at 03:27, Pasha Tatashin <pasha.tatashin@soleen.com> =
wrote:
> >
> > On Mon, Mar 24, 2025 at 12:18=E2=80=AFAM Dave Young <dyoung@redhat.com>=
 wrote:
> > >
> > > On Thu, 20 Mar 2025 at 23:05, Changyuan Lyu <changyuanl@google.com> w=
rote:
> > > >
> > > > From: Alexander Graf <graf@amazon.com>
> > > >
> > > > We have all generic code in place now to support Kexec with KHO. Th=
is
> > > > patch adds a config option that depends on architecture support to
> > > > enable KHO support.
> > > >
> > > > Signed-off-by: Alexander Graf <graf@amazon.com>
> > > > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > > Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> > > > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > > > ---
> > > >  kernel/Kconfig.kexec | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > > > index 4d111f871951..57db99e758a8 100644
> > > > --- a/kernel/Kconfig.kexec
> > > > +++ b/kernel/Kconfig.kexec
> > > > @@ -95,6 +95,21 @@ config KEXEC_JUMP
> > > >           Jump between original kernel and kexeced kernel and invok=
e
> > > >           code in physical address mode via KEXEC
> > > >
> > > > +config KEXEC_HANDOVER
> > > > +       bool "kexec handover"
> > > > +       depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KE=
XEC_FILE
> > > > +       select MEMBLOCK_KHO_SCRATCH
> > > > +       select KEXEC_FILE
> > > > +       select DEBUG_FS
> > > > +       select LIBFDT
> > > > +       select CMA
> > > > +       select XXHASH
> > > > +       help
> > > > +         Allow kexec to hand over state across kernels by generati=
ng and
> > > > +         passing additional metadata to the target kernel. This is=
 useful
> > > > +         to keep data or state alive across the kexec. For this to=
 work,
> > > > +         both source and target kernels need to have this option e=
nabled.
> > > > +
> > >
> > > Have you tested kdump?  In my mind there are two issues,  one is with
> > > CMA enabled, it could cause kdump crashkernel memory reservation
> > > failures more often due to the fragmented low memory.  Secondly,  in
> >
> > As I understand cma low memory scratch reservation is needed only to
> > support some legacy pci devices that cannot use the full 64-bit space.
> > If so, I am not sure if KHO needs to be supported on machines with
> > such devices. However, even if we keep it, it should really be small,
> > so I would not expect that to be a problem for crash kernel memory
> > reservation.
>
> It is not easy to estimate how much of the KHO reserved memory is
> needed.  I assume this as a mechanism for all different users, it is
> not  predictable.  Also it is not only about the size, but also it
> makes the memory fragmented.
>
> >
> > > kdump kernel dump the crazy scratch memory in vmcore is not very
> > > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > > so please disable this option for kdump.
> >
> > The scratch memory will appear as regular CMA in the vmcore. The crash
> > kernel can be kexec loaded only from userland, long after the scratch
> > memory is converted to CMA.
>
> Depending on the reserved size, if big enough it should be excluded in
> vmcore dumping.
> Otherwise if it is a kdump kernel it should skip the handling of the
> KHO passed previous old states.

If you do not want to make the KHO conflicts with kdump, then the
above should be handled and well tested.  And then leave to end user
and distribution to determine if they want the both enabled
considering the risk of crashkernel reservation failure.

>
> >
> > Pasha
> >


