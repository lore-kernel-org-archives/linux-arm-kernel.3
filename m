Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54769C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuNRgEM1/VSSZOP8AP4UeKswwiKQNT+cWOtWKPuUrmU=; b=03HkefZ6PHd/xlitCBIwpfZu/w
	IR1tAPo4HIb9aXavWImVFCB1ShiDpUw8fBL2w91moNfCd13YVggVCnXlWqHIZeqoHvOff6YiYbUD+
	7mZ7CTiSF1OKe8SBfcBfyWPbPS3nzm0ksXG2INJR2u77uqNCR3+WIzZX9/NZBfDLHxIIuR0fkcKms
	z93Hwr/LdZM5PpOFeFB6XR/nIqaNcokNkggsyYlXbkp0c1M+vf1dALXKOIK8fUQbOuBfvrEsXZYvt
	Y740i3Z5tGKwAv6xRNET4J7Y7jiA2Am5hw3IFvOxJK1ADtXY49GWauKPNqWJHnKEZ9I160+eqUQ2B
	BzL22I/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twQcA-00000001cEx-0H4A;
	Sun, 23 Mar 2025 19:04:06 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twQaS-00000001bxq-1yEn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 19:02:22 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff58318acaso10334835a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 12:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742756538; x=1743361338; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RuNRgEM1/VSSZOP8AP4UeKswwiKQNT+cWOtWKPuUrmU=;
        b=LhLZeawdAr+ypIYpurrobEWfWFH738jIFV423j9vl2mOdZlHkH5PIo9V2TGXqmwa5l
         izn+0+6TGnWwxpLXKhoBNIQol0KM7dEX3WewIxxXOTm8Nth/TQD3t4KavUC2wpojwoCt
         elL4/48jgGAMumTa6N3OyZOkkE07lZmUPlX6zk0Jjm59bycdNj2viMPTPSnKeT54+lIo
         nROheU4wCZ3v37Gs/nUrN9wEp9rvKGJ12G/J1Ubf5PziHkqcaRDgVRlhN+Dc6SKZ8hHn
         SWREEm0hSNXSPjqjhFYx+uty6yg5/n1r95O/e42YGXnT9f3iDqprECLT78fW5ZiKA4W6
         Zy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742756538; x=1743361338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RuNRgEM1/VSSZOP8AP4UeKswwiKQNT+cWOtWKPuUrmU=;
        b=wH+ItD7shfeuFNYg1nwyAVQNUX0kpf0Zh1wLYiRDshGiLOuqPv/a++dhJNy7GbuCfT
         44sG+mex1qupZh7bD1qF/cOvqJ4epVBY6Y6k7zRULxXk+s3qtauTuh8p6C/S2o33yoeK
         ZpW8vGDQYf9/Em3N3TB4PE9ehSl4mjA2uwuydKBia4UaLduIviIhSyvWIqFxy6ab3++4
         gNwP059Aq7V4xvsIZXAkiYxHVhtX+4JTU0pn9vO1lzZPnQEJTbEKaHYkr48C04eBwdiY
         Mki2YMR0GErPWxiql1tCeufFTdVvA83/OPXkRgh+7C4kUdpoIxtHPMORvcChTLgdseHB
         UC0g==
X-Forwarded-Encrypted: i=1; AJvYcCW4Q77FYIIzdVJm+VrI9qIQerbxG2aoOGBJDOwk+9PkxdQetZDrKZ2BzJU50rwR48KGSR6/Dq6k6pjNySZEK86/@lists.infradead.org
X-Gm-Message-State: AOJu0YzHsODeQUfcr1WrmCo9N5PV9HGGgfV38/r+p97kNZhDpmuWELXf
	87CnTMf755404PotunMYm5BsPCyrWC46ufjtt4X33l7ePMesZmE3UOlVjxIUqjnyeMynW09tj2T
	YIIu5IcXERsXLoU/5ow==
X-Google-Smtp-Source: AGHT+IHqKpRChgtgDh49YPKj5euGR0CZLSvO9CAU4Y43PCYdmIBq9tlLyCyLELbaKPjbaTiHWY1Fon3WmY7MX6oI
X-Received: from pjbok3.prod.google.com ([2002:a17:90b:1d43:b0:301:1bf5:2f07])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d008:b0:2ff:693a:7590 with SMTP id 98e67ed59e1d1-3030ff08de9mr20652493a91.33.1742756538347;
 Sun, 23 Mar 2025 12:02:18 -0700 (PDT)
Date: Sun, 23 Mar 2025 12:02:04 -0700
In-Reply-To: <20250321133447.GA251739@nvidia.com>
Mime-Version: 1.0
References: <20250321133447.GA251739@nvidia.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250323190204.742672-1-changyuanl@google.com>
Subject: Re: [PATCH v5 07/16] kexec: add Kexec HandOver (KHO) generation helpers
From: Changyuan Lyu <changyuanl@google.com>
To: jgg@nvidia.com
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, changyuanl@google.com, corbet@lwn.net, 
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org, dwmw2@infradead.org, 
	ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, 
	kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, 
	robh+dt@kernel.org, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_120220_501034_41341E40 
X-CRM114-Status: GOOD (  36.24  )
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

Hi Jason, thanks for reviewing the patchset!

On Fri, Mar 21, 2025 at 10:34:47 -0300, Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Wed, Mar 19, 2025 at 06:55:42PM -0700, Changyuan Lyu wrote:
> > From: Alexander Graf <graf@amazon.com>
> >
> > Add the core infrastructure to generate Kexec HandOver metadata. Kexec
> > HandOver is a mechanism that allows Linux to preserve state - arbitrary
> > properties as well as memory locations - across kexec.
> >
> > It does so using 2 concepts:
> >
> >   1) State Tree - Every KHO kexec carries a state tree that describes the
> >      state of the system. The state tree is represented as hash-tables.
> >      Device drivers can add/remove their data into/from the state tree at
> >      system runtime. On kexec, the tree is converted to FDT (flattened
> >      device tree).
>
> Why are we changing this? I much prefered the idea of having recursive
> FDTs than this notion copying eveything into tables then out into FDT?
> Now that we have the preserved pages mechanism there is a pretty
> direct path to doing recursive FDT.

We are not copying data into the hashtables, instead the hashtables only
record the address and size of the data to be serialized into FDT.
The idea is similar to recording preserved folios in xarray
and then serialize it to linked pages.

> I feel like this patch is premature, it should come later in the
> project along with a stronger justification for this approach.
>
> IHMO keep things simple for this series, just the very basics.

The main purpose of using hashtables is to enable KHO users to save
data to KHO at any time, not just at the time of activate/finalize KHO
through sysfs/debugfs. For example, FDBox can save the data into KHO
tree once a new fd is saved to KHO. Also, using hashtables allows KHO
users to add data to KHO concurrently, while with notifiers, KHO users'
callbacks are executed serially.

Regarding the suggestion of recursive FDT, I feel like it is already
doable with this patchset, or even with Mike's V4 patch. A KHO user can
just allocates a buffer, serialize all its states to the buffer using
libfdt (or even using other binary formats), save the address of the
buffer to KHO's tree, and finally register the buffer's underlying
pages/folios with kho_preserve_folio().

> > +int register_kho_notifier(struct notifier_block *nb)
> > +{
> > +	return blocking_notifier_chain_register(&kho_out.chain_head, nb);
> > +}
> > +EXPORT_SYMBOL_GPL(register_kho_notifier);
>
> And another different set of notifiers? :(

I changed the semantics of the notifiers. In Mike's V4, the KHO notifier
is to pass the fdt pointer to KHO users to push data into the blob. In
this patchset, it notifies KHO users about the last chance for saving
data to KHO.

It is not necessary for every KHO user to register a
notifier, as they can use the helper functions to save data to KHO tree
anytime (but before the KHO tree is converted and frozen). For example,
FDBox would not need a notifier if it saves data to KHO tree immediately
once an FD is registered to it.

However, some KHO users may still want to add data just before kexec,
so I kept the notifiers and allow KHO users to get notified when the
state tree hashtables are about to be frozen and converted to FDT.

> > +static int kho_finalize(void)
> > +{
> > +	int err = 0;
> > +	void *fdt;
> > +
> > +	fdt = kvmalloc(kho_out.fdt_max, GFP_KERNEL);
> > +	if (!fdt)
> > +		return -ENOMEM;
>
> We go to all the trouble of keeping track of stuff in dynamic hashes
> but still can't automatically size the fdt and keep the dumb uapi to
> have the user say? :( :(

The reason of keeping fdt_max in the this patchset is to simplify the
support of kexec_file_load().

We want to be able to do kexec_file_load()
first and then do KHO activation/finalization to move kexec_file_load()
out of the blackout window. At the time of kexec_file_load(), we need to
pass the KHO FDT address to the new kernel's setup data (x86) or
devicetree (arm), but KHO FDT is not generated yet. The simple solution
used in this patchset is to reserve a ksegment of size fdt_max and pass
the address of that ksegment to the new kernel. The final FDT is copied
to that ksegment in kernel_kexec().
The extra benefit of this solution is the reserved ksegment is
physically contiguous.

To completely remove fdt_max, I am considering the idea in [1]. At the
time of kexec_file_load(), we pass the address of an anchor page to
the new kernel, and the anchor page will later be fulfilled with the
physical addresses of the pages containing the FDT blob. Multiple
anchor pages can be linked together. The FDT blob pages can be physically
noncontiguous.

[1] https://lore.kernel.org/all/CA+CK2bBBX+HgD0HLj-AyTScM59F2wXq11BEPgejPMHoEwqj+_Q@mail.gmail.com/

Best,
Changyuan

