Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34927C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 12:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDjBICGKa43kYHEOCFvDUYcy1IhXoeMUQwDGcLiaSWE=; b=pVdUIkc+8ffk9KyOvJzVOmNdxR
	bUkr0URWiUD+hArUO4EgOl+lwe2XsVRv2tU4PIj/MKAPd2A1k8g2cSNYt5QA5YibPh8BCLY4N9wRd
	aqcBdvVvtY04LLVSpywX9tP9i8Z5K5PKkcrMCTaSgPiesJjqFtTdtTAmyxmVGXC0z00cqIYNiMTKN
	QcEEQjy9rZvCN0GahpBS0ROWTEdB3ABPxx2dFWs9Pe/7qN54t2k7XHWcBqwVF/0+GPNBJ5Xvm7j5M
	m6TfI3t7gvATHOH8ItvEHt91t+AMUHr1L+H992pG8OvynifqG31bVvt7SAuRKD9tBg5UnQbzUPexN
	G45DxmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txPbV-00000008Qq4-0pr4;
	Wed, 26 Mar 2025 12:11:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txPZm-00000008Qby-2Ihu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 12:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742990981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDjBICGKa43kYHEOCFvDUYcy1IhXoeMUQwDGcLiaSWE=;
	b=HYYEPVgcoiRab3S4mqIPcQmU/C5kexj4lpsQw/LVSjhJYHDk927rPgMOgdBKYNBGfw+tNS
	Em3v6P6/HX69jsa7S6/4qoQ+6AcbXxXDldabjEOqUAiDqH5KgUOPF6ED17Ezp7VWd+3Jli
	rvFxo+gxRTsk9PIIPDa/r2bQ3NaQP98=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-NCiILD-CPTKdZto_55JFkw-1; Wed, 26 Mar 2025 08:09:35 -0400
X-MC-Unique: NCiILD-CPTKdZto_55JFkw-1
X-Mimecast-MFC-AGG-ID: NCiILD-CPTKdZto_55JFkw_1742990975
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b3827969dso676701439f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 05:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742990975; x=1743595775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDjBICGKa43kYHEOCFvDUYcy1IhXoeMUQwDGcLiaSWE=;
        b=ZIObkKtrn0dqQMdzwTCRuHmamI9V3ojGriIAPRY2Rf7ivT69zrQUw/HokXA49eq1hI
         2F9o2+tGIaWCFBjt98M4nCbunqjt+wuP+F5bciCC+xcJgdw30NOo891iNUORMv53bK5q
         8fGpErrJgH5+l3bBqLheNCrueWNZIPqRM7wk2mUEQr+IvtgqFgzhpNcPCh0qrBA7DrPQ
         J+X4EsIP1ulFCDwSckg1TBElLRndeVRgoKmuJpQWqLnefMkn+7aFDl99SGrJoxIbkQyh
         70HDc1KrveyT4hbDZ8kK5se87dl6EtFNWCStj50CKY7kWZHHFZmb+X37eS/7hGQmy+ps
         tfxw==
X-Forwarded-Encrypted: i=1; AJvYcCVIG4ys3s7R9SuGo7k4dk0Q7nScRopZHl/43XK5xOb2G1djL/wugcy8zbbOxMvqDvfscG6KZeIwV8MX7TpZXqTZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8t728jRu1ZgMhFxCX0W3NGEN871JjNXUgVpa82Ck2DUUP1cn1
	yla4EFmknyeCbBP/T8hnDM9buVE6E9y5AQq/wGAf8pqfN7PNPe7XEbu4QHKRoW9mOkw657Nu1C1
	E74oxgHczqI61NEf/Kpf5zt1xdsVklVbNjXEHX7jl+XlwfZXS4ddisCD+0peUv77cpFPQaDhI8b
	hwM0uCYt+5HSep3ZIUeDjGh50YqtIngUmwcRZi2p5zlpPc+pU=
X-Gm-Gg: ASbGncswhGyQ0oFCLr+hHGOqZ7pXZYMWTX5b9O++a9h2fcZYMmbf0s6dNP5cmRw4cBL
	sNYwu0wvntpMg+MBlXmEOS+kE06RB+R9mZcWQjTqH03dozTMk2zGNHqAjClQGrZVoY/AeclKtrA
	==
X-Received: by 2002:a05:6e02:3a0c:b0:3d4:6f37:372c with SMTP id e9e14a558f8ab-3d5960e2419mr225832885ab.7.1742990974578;
        Wed, 26 Mar 2025 05:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOuyfQGVOhYyFSi3hsb9kc2zJRzczpD7XPzwNdnwVuHyYQPBafKpH087OtVwDsIyzVWltmG166ADE4aJfipJU=
X-Received: by 2002:a05:6e02:3a0c:b0:3d4:6f37:372c with SMTP id
 e9e14a558f8ab-3d5960e2419mr225831915ab.7.1742990973998; Wed, 26 Mar 2025
 05:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv> <CALu+AoQj+mHECTvbuK8CpUTmOYgx6n2oMFm5kQXtSigL+5Ks2w@mail.gmail.com>
 <CALu+AoRdfjNcjweq_ipxCC6UGBzM-a5ma417RBr-C3EQ=Em9OQ@mail.gmail.com> <Z-Pk9Bnr0lDVopKj@kernel.org>
In-Reply-To: <Z-Pk9Bnr0lDVopKj@kernel.org>
From: Dave Young <dyoung@redhat.com>
Date: Wed, 26 Mar 2025 20:09:55 +0800
X-Gm-Features: AQ5f1JrnxWyTc7ruwIDaX1fnmt0FdUmOV-OtIvcwHa3Skex-wO_kM_31tXed_lg
Message-ID: <CALu+AoS9=KttzqgR+xi11jur5eX7dBwUfOoueHoOss3eFn+Hkw@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
To: Mike Rapoport <rppt@kernel.org>
Cc: Baoquan He <bhe@redhat.com>, Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org, 
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, dwmw2@infradead.org, ebiederm@xmission.com, 
	mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, krzk@kernel.org, 
	mark.rutland@arm.com, pbonzini@redhat.com, pasha.tatashin@soleen.com, 
	hpa@zytor.com, peterz@infradead.org, ptyadav@amazon.de, robh+dt@kernel.org, 
	robh@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com, 
	usama.arif@bytedance.com, will@kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6G-s6qDkvII-_C3QKtlrId29Oioati8d7S-gdPoS_ss_1742990975
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_050942_663656_058824B8 
X-CRM114-Status: GOOD (  24.28  )
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

On Wed, 26 Mar 2025 at 19:34, Mike Rapoport <rppt@kernel.org> wrote:
>
> Hi Dave,
>
> On Wed, Mar 26, 2025 at 05:17:16PM +0800, Dave Young wrote:
> > On Tue, 25 Mar 2025 at 16:36, Dave Young <dyoung@redhat.com> wrote:
> > >
> > > > >
> > > > > Have you tested kdump?  In my mind there are two issues,  one is with
> > > > > CMA enabled, it could cause kdump crashkernel memory reservation
> > > > > failures more often due to the fragmented low memory.  Secondly,  in
> > > >
> > > > kho scracth memorys are reserved much later than crashkernel, we may not
> > > > need to worry about it.
> > > > ====================
> > > > start_kernel()
> > > >   ......
> > > >   -->setup_arch(&command_line);
> > > >      -->arch_reserve_crashkernel();
> > > >   ......
> > > >   -->mm_core_init();
> > > >      -->kho_memory_init();
> > > >
> > > > > kdump kernel dump the crazy scratch memory in vmcore is not very
> > > > > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > > > > so please disable this option for kdump.
> > >
> > > Ok,  it is fine if this is the case, thanks Baoquan for clearing this worry.
> > >
> > > But the other concerns are still need to address, eg. KHO use cases
> > > are not good for kdump.
> > > There could be more to think about.
> > > eg. the issues talked in thread:
> > > https://lore.kernel.org/lkml/Z7dc9Cd8KX3b_brB@dwarf.suse.cz/T/
> >
> > Rethink about this,  other than previous concerns.  Transferring the
> > old kernel state to kdump kernel makes no sense since the old state is
> > not stable as the kernel has crashed.
>
> KHO won't be active for kdump case. The KHO segments are only added to
> kexec_image and never to kexec_crash_image.

Good to know, thanks!

>
> --
> Sincerely yours,
> Mike.
>


