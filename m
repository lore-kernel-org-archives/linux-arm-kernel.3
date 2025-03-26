Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528A9C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ow6AGnrr84AMQ0ah/Xi6PJkaHmTpZO5eKBmQQUtOVkg=; b=fOp7jlXrSf87Z5LDAdEQPl5asM
	S5hm2eEuPxDxhElZhf++qXUa5njbbi4u5jA7WhY68Lm6qefieOdEG0aaP/dy8HPvjHCE4s7SeUnEe
	XSEJnIoXWBzi0jgL0pcsrkGr4Y5wce4xn/9M+UW8+S5lvMgZag/yfZuNDLiqZ0sWR455HcpF3FHmt
	39/2Qm/dEAeYo2zdF1s5GPV8T0opIMzLFFynBJhBXl4g0IptxYHR/jZFQQYZup8vNVLHftr7QscnA
	LtywWNaI5k+BO6HP+b4ZtOdbPucfzCSU4BFEizjhgSe0qsuS86nkwaahv5H4j2cJwGoLOJX65cZ60
	IVuMn8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMv3-000000080dz-3vKA;
	Wed, 26 Mar 2025 09:19:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMse-000000080Nq-3kTK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 09:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742980617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ow6AGnrr84AMQ0ah/Xi6PJkaHmTpZO5eKBmQQUtOVkg=;
	b=aXXGggezF1ezh1XJYmGlQHRi6ALyjONB/kYJclvM0jGnTfYcGc8hvzkxYVZrTCyBsIVYd8
	/waOH0SPjr0KnaRz9Sc10rQrXWsrx+VLu3Xp4JjrT4dq58x6MMsQKJB0uYJ6lC+dbnagOf
	tWBc9XFIK/E3SRQxwU6+1JmiglbSbDo=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-kPsjxwE-PFGf2a94CwH-qA-1; Wed, 26 Mar 2025 05:16:56 -0400
X-MC-Unique: kPsjxwE-PFGf2a94CwH-qA-1
X-Mimecast-MFC-AGG-ID: kPsjxwE-PFGf2a94CwH-qA_1742980615
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d586b968cfso126313035ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 02:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980615; x=1743585415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow6AGnrr84AMQ0ah/Xi6PJkaHmTpZO5eKBmQQUtOVkg=;
        b=At5QLPfbPDWxUFmxElvCiBrRJgZFiuEOTRFW/xwgoTVpvrBdGfe8RhVxh6CktDfORG
         HUqSqVwtMdO/Pxw0nc5ii5kn1xmKeKEz21KgS4ye48CBWC5oi7H3ljQLKO7emzFJTxr7
         fGpNAt2vJkGjFByM5roJoFJdcWf3Nlqhqtrh/vHK9NRiBwX1t0Y/0CO2oLRnA023IsIM
         RpEw4wtTCxoda57UreeiLnxp4kF3fStOdpVy7BHZ9fHvLXmR276VmhN1Xjz34a9FxuXq
         dOxuZCj9/j/LCBy+1MccXh1Ip4p1Dw/X9odMvhrcIc6+Vg+7XPpp914ZuXQH/I7yxiND
         JTtw==
X-Forwarded-Encrypted: i=1; AJvYcCWJqp0rB3Q/ZEhhWuY9aNtSwaOTsGEgFKQWLXSlmLBqr6iPDpq/os6kvEr9Sz4OxdQNckulVxp2J6nC9qclqb0z@lists.infradead.org
X-Gm-Message-State: AOJu0YxIai5/S0f29QSU3tWNloz9BYm1/4UCq3c5wWgBtqOnUCcLV2y8
	etKlD0SVMe5vwKNTn9FrP739hU8sPic98tudrpiU1eqS62QpeMBhtpYiWzp79G2VoXAijX1rTpX
	Y+cF0be+PK16XnvvgLj+H8FJ7vSDtpwg4/xRDZlD5Bmp7Mq8CY0pUiA0KhcZknL8jjWIgIAEWog
	eb83dtcITu4OkCJhUGFYVhG4hLy6W7rNLAkw5xPMRbdykkd1c=
X-Gm-Gg: ASbGncvoh8wi9t/uNUATZI8V1oegXQoK2gaTYlyD3L5l+vqRHBAFyc/aqjdHORpiUaT
	gVLOE5XSXk+/cMpH7l4CfwgS32nReKPx4wbH2AztVtZChDVKLkeCAxXRr65trBZ9qYlaAYnkEkg
	==
X-Received: by 2002:a05:6e02:3e03:b0:3d4:2409:ce6 with SMTP id e9e14a558f8ab-3d59612bc91mr234170105ab.5.1742980615125;
        Wed, 26 Mar 2025 02:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ1vGph9A3VJepHAKEDwhyEi3HEUoYZg9GSD20aZ5PWU5QdCBZemC86Ee43E1W8Lw5ALFAPfq+RTfo03e4kyA=
X-Received: by 2002:a05:6e02:3e03:b0:3d4:2409:ce6 with SMTP id
 e9e14a558f8ab-3d59612bc91mr234169465ab.5.1742980614659; Wed, 26 Mar 2025
 02:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv> <CALu+AoQj+mHECTvbuK8CpUTmOYgx6n2oMFm5kQXtSigL+5Ks2w@mail.gmail.com>
In-Reply-To: <CALu+AoQj+mHECTvbuK8CpUTmOYgx6n2oMFm5kQXtSigL+5Ks2w@mail.gmail.com>
From: Dave Young <dyoung@redhat.com>
Date: Wed, 26 Mar 2025 17:17:16 +0800
X-Gm-Features: AQ5f1Jpq9GZncvPHkaxZJh8I7FiGahHb1rvcGNvIVWbnRM_2M_RRWQiPj2LtDHg
Message-ID: <CALu+AoRdfjNcjweq_ipxCC6UGBzM-a5ma417RBr-C3EQ=Em9OQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
To: Baoquan He <bhe@redhat.com>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org, graf@amazon.com, 
	akpm@linux-foundation.org, luto@kernel.org, anthony.yznaga@oracle.com, 
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3vUV1GWKigDHzwVcNGwPprty_xRTMthyzwuji-wdykA_1742980615
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_021701_009189_DF0F40FA 
X-CRM114-Status: GOOD (  17.93  )
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

On Tue, 25 Mar 2025 at 16:36, Dave Young <dyoung@redhat.com> wrote:
>
> > >
> > > Have you tested kdump?  In my mind there are two issues,  one is with
> > > CMA enabled, it could cause kdump crashkernel memory reservation
> > > failures more often due to the fragmented low memory.  Secondly,  in
> >
> > kho scracth memorys are reserved much later than crashkernel, we may not
> > need to worry about it.
> > ====================
> > start_kernel()
> >   ......
> >   -->setup_arch(&command_line);
> >      -->arch_reserve_crashkernel();
> >   ......
> >   -->mm_core_init();
> >      -->kho_memory_init();
> >
> > > kdump kernel dump the crazy scratch memory in vmcore is not very
> > > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > > so please disable this option for kdump.
>
> Ok,  it is fine if this is the case, thanks Baoquan for clearing this worry.
>
> But the other concerns are still need to address, eg. KHO use cases
> are not good for kdump.
> There could be more to think about.
> eg. the issues talked in thread:
> https://lore.kernel.org/lkml/Z7dc9Cd8KX3b_brB@dwarf.suse.cz/T/

Rethink about this,  other than previous concerns.  Transferring the
old kernel state to kdump kernel makes no sense since the old state is
not stable as the kernel has crashed.


