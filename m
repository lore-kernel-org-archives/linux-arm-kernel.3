Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337F2C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f00g8h93qQX8OTMUbXqv3cBNa5BjAh6ZTXb5qUHVm6k=; b=vh16CZf9eE5wNETT/IFS60vwYm
	Ps6kD1WZYuO0GLZCqdTACFu0rKEcqUConivsGhUgxHlZ+G8bo9XzfKX9KAjoAzdJVLTNne4i0uRtE
	sGW/3NYNKoKk9o689fEmvfydxN2osrRM0WWxO+w9HDdO/HJW6ftdKAOlgPPMxjucwRc7hvPG0lThA
	nm4jziTjkcnZ2sPCAv4JzF+vGyPutUKeRtLeimQdTr4G1iwiKSX9qnwL3wBqMHpsN6UJm6BL/7Ttt
	i8hnYmVQ7c7NQOh3tVgmQBIjxKWyRZFWkenh3nwISqwjdKv0EOMVdZMjZVhN3xkPSynQ88npxLun0
	e2kAwKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tht9k-00000004WCU-2Z4x;
	Tue, 11 Feb 2025 16:30:40 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsuK-00000004SCR-0sZW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:14:45 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-47197412ccbso30791351cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 08:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1739290483; x=1739895283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f00g8h93qQX8OTMUbXqv3cBNa5BjAh6ZTXb5qUHVm6k=;
        b=zGVxQKxbkuXoL7fsBev1KHK0oft68JUal6tE93jtjMHFrUGsAVLQM2WbKNnnpImG2s
         N8B7QVxLCJG40b3XX5KJ0SOPgn18o6Nx/ICy+4O2Rufc7LZno+/EbmRExzUmDMGKItMy
         L2dyMLb9cxA2dbWnQltiDIG6DP1rExiWF23AAdQ1ZA9Eme1SKVB6ugN48RMKuZ+metQn
         IEqrCd9klpsPHs/1jjITjwD57XbGqEvcPjVHX2RDwHe3djT9YVMkFUXv3jGFlmb0vqO8
         7BvpX+7vwUdYVxYHH2SREXPhofkRZpm3WvIdsL1cCr1FoauS1e/TDYDa0lrLdOzI0GZ1
         5I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290483; x=1739895283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f00g8h93qQX8OTMUbXqv3cBNa5BjAh6ZTXb5qUHVm6k=;
        b=CQW96f7Zna+G8sIQY7EACIdgbQPP1uQxu5d6kXiyubxGjdrSMkp+eqVcnVEPonfcO1
         MYB6bCemWcWuBfH3LJPtatQk7gylO39Ubh2gXg+/zANzOo8snQRNwz11MaGmriV2aTZO
         2vn6yy113hbkcw+RgmsHx186hGRuuQGVjbF1DAUK2sxXEvNDe9wErM42l2hyACzw45J0
         ajV0a9/Zf1mRbekhrgn9iH6X0b0/LQeL7AJ4fcUqEgJVH1n4vdvD/9tAupRiv5Pl0xXJ
         2OdsftxBzQeg6+o5eXpNbDVVDveVIppm7eYXGVz5P516bjLSWBRJwUK9NgSuTzwLhKWS
         z4MA==
X-Forwarded-Encrypted: i=1; AJvYcCXFxY9Yr3BB0c75IC2RbyvBCnPMBVMvg7KwNjs6tNFhRfuTtiA+d1OzTh1drysymd9SUlHDC/aJV1qZG7XF3qRC@lists.infradead.org
X-Gm-Message-State: AOJu0YyU6F42sFUEWdPNGCZpma6JriIRz4DDCifVL4XLJ1Sv7mv3t2Lc
	kHLqTUZjrVKEZH+IqwhI+FdQGkaEh4nE5vWVJeT9xEIhOdjiFDL0o6haoSdLiyGq82lq+qCqp+C
	QR8Wf7kMFsgbDVWAjtYjSr/kYtzp/99ZNJT9XQA==
X-Gm-Gg: ASbGncvgUMe6FUChGV9bj52YGRYJahesl3hbYOA1DEs92oHd036Btz3Cj0c7NzLPByC
	mE8njEzNyPNvH0KecWaAu1AAgJ8wPFVcdTECfEmWZY7hV6k02i/qkjNOGi3RxfPyX2yYGMA==
X-Google-Smtp-Source: AGHT+IFV/2SwK8xAi9MTHEKrLCagsybkvEOxgGEB7IziCVbPaPZ5quI5gxUrWQ8mdomSEUM9RDcaJ8/FU9MUgrz9PW4=
X-Received: by 2002:ac8:7d86:0:b0:462:c14f:d13f with SMTP id
 d75a77b69052e-47167ae2791mr311026341cf.41.1739290483262; Tue, 11 Feb 2025
 08:14:43 -0800 (PST)
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <20250206132754.2596694-6-rppt@kernel.org>
 <20250210202220.GC3765641@nvidia.com> <CA+CK2bBBX+HgD0HLj-AyTScM59F2wXq11BEPgejPMHoEwqj+_Q@mail.gmail.com>
 <20250211124943.GC3754072@nvidia.com>
In-Reply-To: <20250211124943.GC3754072@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 11 Feb 2025 11:14:06 -0500
X-Gm-Features: AWEUYZnZrdGQlINhll4ZCmxy4_MiFjWVL9mBm_3F0LCmRscyspW8dY4HAyEeygc
Message-ID: <CA+CK2bAEnaPUJmd3LxFwCRa9xWrSJ478c4xisvD4pwvNMiTCgA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250211_081444_439979_E77BEBB5 
X-CRM114-Status: GOOD (  28.82  )
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

On Tue, Feb 11, 2025 at 7:49=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Mon, Feb 10, 2025 at 03:58:00PM -0500, Pasha Tatashin wrote:
> > >
> > > > +What:                /sys/kernel/kho/dt_max
> > > > +Date:                December 2023
> > > > +Contact:     Alexander Graf <graf@amazon.com>
> > > > +Description:
> > > > +             KHO needs to allocate a buffer for the DT that gets
> > > > +             generated before it knows the final size. By default,=
 it
> > > > +             will allocate 10 MiB for it. You can write to this fi=
le
> > > > +             to modify the size of that allocation.
> > >
> > > Seems gross, why can't it use a non-contiguous page list to generate
> > > the FDT? :\
> >
> > We will consider some of these ideas in the future version. I like the
> > idea of using preserved memory to carry sparse KHO tree: i.e FDT over
> > sparse memory, maybe use the anchor page to describe how it should be
> > vmapped into a virtually contiguous tree in the next kernel?
>
> Yeah, but this is now permanent uAPI that has to be kept forever. I

Agree, what I meant in the future patch version is before it gets
merged. I should have been more clear.

> think you should not add this when there are enough ideas on how to
> completely avoid it.

Thinking about it some more, I'm actually leaning towards keeping
things as they are, instead of going with a sparse FDT. With a sparse
KHO-tree, we'd be kinda trying to fix something that should be handled
higher up. All userspace preservable memory (like emulated pmem with
devdax/fsdax and also pstore for logging) can already survive cold
reboots with modified firmware Google and Microsoft do this.
Similarly, the firmware could give the kernel the KHO-tree (generated
by firmware or from the previous kernel) to keep stuff like telemetry,
oops messages, time stamps etc. KHO should not be considered
explicitly as a mechanism to carry device serialization data, the KHO
should be a standard and simple way to pass kernel data between
reboots. The more complex state can be built on top of it, for example
guestmemfs, could preserve terabytes of data and have only one node in
the KHO tree.

>
> Jason

