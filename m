Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E8CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 01:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzKDKoVrBDUrsawz8VsqQN0RmxEUxc5SPjjl/Dgx0g8=; b=1SBInVxaPJlJqkI1I8gTe26Co+
	BLVUBz1JO9OxkrrxFqvma3USeoBQ4qEsVhYZmpLZyIZ8+gabGqQpj1dL07N8BqWKER4ontzW3cJpk
	lxbnWl/gBtLxY+rfRA2dHRAt9HEPgu6aJCun0Sr+Bj1nClSvKBjLSMiab4QathfyliwXt8/u4bmJh
	O3zTe3KZecQvzZnHDK1cjMbLvRXcebedslJtm0NIbtOjy6JK37rQAgZDv8XfMusHolknPBnq7c2qW
	TPTE+3CXkjsvfoIsiD/dtf/gORZop9AMGpZ9NTuGV/UsGsJ3ONSjxRn0zp2dfC+/tCMHgASGUVjRS
	q5hxxJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvlg-0000000GDfD-20gI;
	Thu, 20 Feb 2025 01:54:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvh9-0000000GCTO-3dgE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 01:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740016183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mzKDKoVrBDUrsawz8VsqQN0RmxEUxc5SPjjl/Dgx0g8=;
	b=AP7HDlvddmt+fx98SdQfbdM+RXOO3E6jLcS+IbxCU+4BsANQ7OAhboUmDXYJPmvtzFW2oB
	/VKjlJjE82+RDmeZMCxOom2QeJRF2wcT2Z6Iwk138aCJrHI+RkOlY6yw3qlwztX5YCyRaL
	xIsVAejIh4syhcldwTsMy6/2VNa7vZ8=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-90U7J_-OP_OOOS9cPIcu0w-1; Wed, 19 Feb 2025 20:49:39 -0500
X-MC-Unique: 90U7J_-OP_OOOS9cPIcu0w-1
X-Mimecast-MFC-AGG-ID: 90U7J_-OP_OOOS9cPIcu0w_1740016179
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d2a60faa44so10101825ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 17:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740016179; x=1740620979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzKDKoVrBDUrsawz8VsqQN0RmxEUxc5SPjjl/Dgx0g8=;
        b=WMcLoXHwTL1gySodrGaDKyf0tCc3EUZeEd3jB896/yrWnu1zl059ivhp3PO45rHTUp
         yvIgg8jbHAxKoQMsK7AxFCMd+LVCnYUf1CZjHcEgJ4eWGltaZy+8IDEzj/V5f5Rm8XKv
         j7v3Q/FB/fwNJ1PvJPaaCZgTnIYE2y4BqIaEvalSgKqgIo5rkHdXS13x9+ZY7MMhZdXj
         R7bMjHhsv6sxlLuHyrTCwlsqRSoJ9jJc7aizMq7mqjqhADHFlyXlad27yoKe5k8814ph
         M+ka3uk7qXDy9dDVmzCb3tb9a3zhEYN/AQxyBB/hybvbY4yAqiiGpfOEZxJBN7snRYfj
         UFtg==
X-Forwarded-Encrypted: i=1; AJvYcCVpTs1fdkzTqcX9Icl5ZgiNvdoqqrj7XdP/5Z2vSsIY2sGva/z517vgLoqJZggGK+xvc1ent2k328HYWc5xZLqa@lists.infradead.org
X-Gm-Message-State: AOJu0YzFE++Bc8j4sausKQ6/ef8i6H+0XRhxrzX3x4x7c8e8OQqkZRgd
	DOyww2BElhvwb0BJpiW6uHCelatWwO8iGf0eKwivq7VfL0r22ungLQzvNGW/bcGS2Zzs+NmiSeA
	BFwC+Jrr+g7y//l9riOEaFpfY5ulcpkmQHI/ug/u6Z3INVQ2VZDhJLrl9m0CgW4GCldfzVVEOF/
	RCjS1jvWmAYK0w+rWbdDh+NgYgUPLsxNuzjPzkHrHySFUeSDA=
X-Gm-Gg: ASbGncsHPdnwKRMb9aMRz4DvBf5tUwFxT6zvq3yMVgYY3e3yt6RAAQAGOPE+X6uHCzI
	opPwUFARFUMxuYTQz1yBXu6PRADDxEp5VUqvzRUPt857GRPgAsEc+YlfgMGusycg=
X-Received: by 2002:a92:cd8b:0:b0:3cf:ceac:37e1 with SMTP id e9e14a558f8ab-3d2807b90afmr166598615ab.11.1740016178799;
        Wed, 19 Feb 2025 17:49:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHua4N3hMkedgyAywjDxkxVa1LR4pC25UZ/n6ciTidS6+LPrXCE4QkVj5KAidqXqI09qUbwPkqRyqNWoJszBts=
X-Received: by 2002:a92:cd8b:0:b0:3cf:ceac:37e1 with SMTP id
 e9e14a558f8ab-3d2807b90afmr166598175ab.11.1740016178479; Wed, 19 Feb 2025
 17:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <CALu+AoRMQyRDFS_4L0KQkmrFT_S+yk=uZ-Mqt86JQYKKnj-5Ug@mail.gmail.com>
 <Z7WJD6eBLuIRnLwk@kernel.org> <CALu+AoSaEthfed1NOYPiQgm_g-dhibVMRAp0+=_+9qTT4_x=tg@mail.gmail.com>
 <d8c43707-65a2-4176-85e2-acdb4c9d16ad@amazon.com>
In-Reply-To: <d8c43707-65a2-4176-85e2-acdb4c9d16ad@amazon.com>
From: Dave Young <dyoung@redhat.com>
Date: Thu, 20 Feb 2025 09:49:52 +0800
X-Gm-Features: AWEUYZnow-BFw9b6Uwj9RQ5_fBga9ll51qxXSJUam_iT6jbFDfi-PA1-cJgL388
Message-ID: <CALu+AoR0BbmbZeOkLU55OpD8kxGsVnFs+pXgEC9Y_MpB4=GMvQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Alexander Graf <graf@amazon.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	Anthony Yznaga <anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ashish Kalra <ashish.kalra@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	Eric Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, 
	James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	Philipp Rudo <prudo@redhat.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0EodTp7M3w4RYmXzGG2av4HX-niyOn76xxe9R5gJylU_1740016179
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_174943_969728_1BD076D4 
X-CRM114-Status: GOOD (  34.78  )
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

On Wed, 19 Feb 2025 at 21:55, Alexander Graf <graf@amazon.com> wrote:
>
>
> On 19.02.25 13:49, Dave Young wrote:
> > On Wed, 19 Feb 2025 at 15:32, Mike Rapoport <rppt@kernel.org> wrote:
> >> On Mon, Feb 17, 2025 at 11:19:45AM +0800, RuiRui Yang wrote:
> >>> On Thu, 6 Feb 2025 at 21:34, Mike Rapoport <rppt@kernel.org> wrote:
> >>>> == Limitations ==
> >>>>
> >>>> Currently KHO is only implemented for file based kexec. The kernel
> >>>> interfaces in the patch set are already in place to support user space
> >>>> kexec as well, but it is still not implemented it yet inside kexec tools.
> >>>>
> >>> What architecture exactly does this KHO work fine?   Device Tree
> >>> should be ok on arm*, x86 and power*, but how about s390?
> >> KHO does not use device tree as the boot protocol, it uses FDT as a data
> >> structure and adds architecture specific bits to the boot structures to
> >> point to that data, very similar to how IMA_KEXEC works.
> >>
> >> Currently KHO is implemented on arm64 and x86, but there is no fundamental
> >> reason why it wouldn't work on any architecture that supports kexec.
> > Well,  the problem is whether there is a way to  add dtb in the early
> > boot path,  for X86 it is added via setup_data,  if there is no such
> > way I'm not sure if it is doable especially for passing some info for
> > early boot use.  Then the KHO will be only for limited use cases.
>
>
> Every architecture has a platform specific way of passing data into the
> kernel so it can find its command line and initrd. S390x for example has
> struct parmarea. To enable s390x, you would remove some of its padding
> and replace it with a KHO base addr + size, so that the new kernel can
> find the KHO state tree.

Ok, thanks for the info,  I cced s390 people maybe they can provide inputs.

Other than the arch concern,   I'm not so excited about the KHO
because for kexec reboot there is a fundamental problem which makes us
(Red Hat kexec/kdump team) can not full support it in RHEL
distribution, that is the stability due to drivers usually do not
implement the  device shutdown method or not well tested.   From time
to time we see weird bugs,  could be malfunctioned devices or memory
corruption caused by ongoing DMA etc.   Also no way for the time being
to make some graphic/drm drivers work ok after a kexec reboot, it
might happen to work by luck but also not stable.

So I personally think that improving the above concern is more
important than introducing more features to utilize kexec reboot.

>
>
> Alex
>
>


