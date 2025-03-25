Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEBAC36002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 01:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80YXslX43Vd+KzUMLEtvDw9pbdwUBTF2zW23HR+RDds=; b=UAwRV0Yu8j22AXHD3JvCsFmKPw
	JwV++XFdUntNGQ5T1RG/JGjDWRgEthRR9VLbv9DeSKCK7bOATYqFEE+i3GgTmv5zLBboHHakPmGIU
	2uM+Ifdv6EtYje0WIuloB2aTII6Uo+JJz+RMKIOVNjAkSYb1m8v+8AwxV/da2vJFkgZAMnRFd68TB
	Cp/MUMjTACfs+5s3l1O7DyiWYZ+7HUXj+eFEwO0SRgctgqvASec8A9rCmsY2XrKwzM+kY8PJgeXAf
	EkuIvS+O6tyV8obxRscNisEsjLNVr9rEHO6YZCCU0TuW5S+dvKENvFQv2BZzTph86o2pbswggepuv
	0tJdzBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twt2s-00000004bcj-1IZE;
	Tue, 25 Mar 2025 01:25:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twt18-00000004bRi-1bpo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 01:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742865825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=80YXslX43Vd+KzUMLEtvDw9pbdwUBTF2zW23HR+RDds=;
	b=TZPRRp74mFhm3kfkgSDZisTDWCN/BEAIvX8sVo9SkkPtev0LXoHwCRZ8ByTEzsSwRYe0UX
	MpJ7ekxNA7gEVGJPrOX6/zl+65W9ItEgEV5wXd5XGSipV2vppoKYaWVxYfszd0vxQnO+dy
	RsyjpjQ8JoQ3cUbL4uvwc9b8JJGY2Io=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-g36zJQpMP7uqlaC1gvZY8Q-1; Mon, 24 Mar 2025 21:23:42 -0400
X-MC-Unique: g36zJQpMP7uqlaC1gvZY8Q-1
X-Mimecast-MFC-AGG-ID: g36zJQpMP7uqlaC1gvZY8Q_1742865821
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d2a6b4b2d4so97590085ab.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 18:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742865821; x=1743470621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80YXslX43Vd+KzUMLEtvDw9pbdwUBTF2zW23HR+RDds=;
        b=KoUhT1kYSV2oHV/knKoBARUOlMH1cx00/7MGOUnXV2NLLnXAojMWzrbaB4YVuebu5V
         kmkJLiCQ2gV9blK8m9EaskekHMSWC7aCKITn7hC2CGSyoJww/wFWycufLWjJCSzeW6+K
         Dtc3196C5Y9JzfrqCqNVvB8M2onRx8MlpDL+0B/XCm7bpcqWWZaYBSGhG/lGRxgFi9Ox
         2okf3brN/6MvR+xwWm7wehLEJHljEWFKxPX4HpIS1HFuU9GbaBRrZvAqg0r36iaV/10u
         FdEBCIMtmYZpzE0lCgrVTZFm1f1Pj48PYSlKme+BRUatxrURZ0PSXmT7pJ68f7W6cfrR
         UO0A==
X-Forwarded-Encrypted: i=1; AJvYcCUHA0lKqKeFN0ItQt5YetxFvk74jv/pSq/lgwsWZloh0DM/mK7MBzI7KNCH36/Ub8psO8urfkApyZBKoU9pYmUa@lists.infradead.org
X-Gm-Message-State: AOJu0YwECot2XaOE8y9jpQpZMdy95g8Juz+a65K7ZcIkQczvA+ytjksM
	SSJxv5NkkEJG7OdTMj9FlZV0WfyZRXyG6g8thDXsayavfsnTsRqnwlWquwIzISJ3UVmYpZ8gVzn
	MPykg70V9mPKQSknktV9JYfvwOR4EyDiXgT5izCaOsDB73jUknho8/hgdwy2w1XD904UfBud+q6
	6IprHEYq6kQ7MT3hdP+VdxwVJ8sK977Ynk00mNhyyfq5lZPt4=
X-Gm-Gg: ASbGnctgCHvwDpZYsDNyPnISvXbSaNJzSzDEhIo49x1/jF3UuNf+Rjg1MavoDDjFSGg
	S5LAcMHCo9E2uHfmX0lEfyf7A2W6JyHt0YYRAvxVPbdIdSri/NeS9W1s/A/6yqC9CjDMhT0Z/HQ
	==
X-Received: by 2002:a05:6e02:349c:b0:3d3:dd60:bc37 with SMTP id e9e14a558f8ab-3d5961c530dmr173137525ab.22.1742865821216;
        Mon, 24 Mar 2025 18:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/JUKTQmyT7rmzB1113MDJsVnMSnwa5fEmJ4QQvGW8nT/qrXson+JpXQKKM8geQr7VEFqwbzNfblKLM2iKFAI=
X-Received: by 2002:a05:6e02:349c:b0:3d3:dd60:bc37 with SMTP id
 e9e14a558f8ab-3d5961c530dmr173136965ab.22.1742865820779; Mon, 24 Mar 2025
 18:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <CA+CK2bC4PM0JnHOUm7qfpQ=wUhwsYQ-hJ12tTK_7pSWgYk+bhg@mail.gmail.com>
In-Reply-To: <CA+CK2bC4PM0JnHOUm7qfpQ=wUhwsYQ-hJ12tTK_7pSWgYk+bhg@mail.gmail.com>
From: Dave Young <dyoung@redhat.com>
Date: Tue, 25 Mar 2025 09:24:02 +0800
X-Gm-Features: AQ5f1JqwitaQjBg4ofN5mWtcdKnJXVa6ylkj6L0R0h_oYxt_kysMu1ZOpV0VfzE
Message-ID: <CALu+AoRL+oHW2vN8nf1wpsG2Ki8d44AABQRCBMd+CE4_XzqRTw@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: qmEdxnfBCSCR4j3eHm5AEFQKCAeAYueTqVIlddUHlaQ_1742865821
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_182346_482629_22E27E45 
X-CRM114-Status: GOOD (  35.61  )
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

On Tue, 25 Mar 2025 at 03:27, Pasha Tatashin <pasha.tatashin@soleen.com> wr=
ote:
>
> On Mon, Mar 24, 2025 at 12:18=E2=80=AFAM Dave Young <dyoung@redhat.com> w=
rote:
> >
> > On Thu, 20 Mar 2025 at 23:05, Changyuan Lyu <changyuanl@google.com> wro=
te:
> > >
> > > From: Alexander Graf <graf@amazon.com>
> > >
> > > We have all generic code in place now to support Kexec with KHO. This
> > > patch adds a config option that depends on architecture support to
> > > enable KHO support.
> > >
> > > Signed-off-by: Alexander Graf <graf@amazon.com>
> > > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> > > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > > ---
> > >  kernel/Kconfig.kexec | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > > index 4d111f871951..57db99e758a8 100644
> > > --- a/kernel/Kconfig.kexec
> > > +++ b/kernel/Kconfig.kexec
> > > @@ -95,6 +95,21 @@ config KEXEC_JUMP
> > >           Jump between original kernel and kexeced kernel and invoke
> > >           code in physical address mode via KEXEC
> > >
> > > +config KEXEC_HANDOVER
> > > +       bool "kexec handover"
> > > +       depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXE=
C_FILE
> > > +       select MEMBLOCK_KHO_SCRATCH
> > > +       select KEXEC_FILE
> > > +       select DEBUG_FS
> > > +       select LIBFDT
> > > +       select CMA
> > > +       select XXHASH
> > > +       help
> > > +         Allow kexec to hand over state across kernels by generating=
 and
> > > +         passing additional metadata to the target kernel. This is u=
seful
> > > +         to keep data or state alive across the kexec. For this to w=
ork,
> > > +         both source and target kernels need to have this option ena=
bled.
> > > +
> >
> > Have you tested kdump?  In my mind there are two issues,  one is with
> > CMA enabled, it could cause kdump crashkernel memory reservation
> > failures more often due to the fragmented low memory.  Secondly,  in
>
> As I understand cma low memory scratch reservation is needed only to
> support some legacy pci devices that cannot use the full 64-bit space.
> If so, I am not sure if KHO needs to be supported on machines with
> such devices. However, even if we keep it, it should really be small,
> so I would not expect that to be a problem for crash kernel memory
> reservation.

It is not easy to estimate how much of the KHO reserved memory is
needed.  I assume this as a mechanism for all different users, it is
not  predictable.  Also it is not only about the size, but also it
makes the memory fragmented.

>
> > kdump kernel dump the crazy scratch memory in vmcore is not very
> > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > so please disable this option for kdump.
>
> The scratch memory will appear as regular CMA in the vmcore. The crash
> kernel can be kexec loaded only from userland, long after the scratch
> memory is converted to CMA.

Depending on the reserved size, if big enough it should be excluded in
vmcore dumping.
Otherwise if it is a kdump kernel it should skip the handling of the
KHO passed previous old states.

>
> Pasha
>


