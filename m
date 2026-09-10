Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AF0C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 22:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UDtbunOd+y403pbt73/1ep0N3wlp/Y+kJJQS/7bASM=; b=f+WHnscRxh4dhSmzYuEebPXfvS
	KUQI/oRUVzBiyRbmiw8cS3SU3X9ZYyYJDFFpdRQZnLTp8jhJYlP2G1hVV+rqsvuMHI1cCpTCCHaPi
	3RG4CyMPXDI8AAQ/HNAiK4II/WgHJ9AWneZzA3BXkXFxOLh6dbzEk4X0eDNrD30f7YK4gM8U+jtQr
	/mr/Ub3cjtSinKBbGoMEcGQ+efx2d+vHjuEF81FTSVSsk6FCwem+6ltzj3lqeDbJFEESWGS0ov397
	BJzFNNkTCmLkeO0QzEfYsR8EqHoUEhbGqQ9CiZWRF5ODWmbJX0xd+8nGb1PmX9OZzGZfXuskJqesu
	3H+0M0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4nTd-0000000FV1S-3GWx;
	Thu, 10 Sep 2026 22:42:41 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4nTa-0000000FV0g-3T3a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 22:42:40 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc1b8088203so388993a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 15:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789080157; x=1789684957; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UDtbunOd+y403pbt73/1ep0N3wlp/Y+kJJQS/7bASM=;
        b=tW8i/k2lMwe9Z8K3O/i8gicpmcl493gTuSgRvpzyFGWGgBDDGkpVJTF5JJHph53xZA
         1NY4/HLnf9M3wIMTZ6k6DZV+tKaOZWTDxOKRQ/4TvVffdEjoaboio9GbhBP0nvL182IG
         3HfBTHcGZmwy0zgCGmUVhuj2swrjAMpIqQol+4XptmhA+VE9qysJNnRDN9UiDAeMlqIX
         CFx6uiHLHUXGkJbCcw56hZNk+IrAQMmwj/DD9Zd57+6R8YwDFq5kQmdinYeRviAzDt0A
         kbdei1ei6GhTcMKW98t8/XfqJD5b6HGRyzZpre+QYTKI/dVCweJI9NJeF/fa3KPwEqCQ
         k1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789080157; x=1789684957;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UDtbunOd+y403pbt73/1ep0N3wlp/Y+kJJQS/7bASM=;
        b=pYJoO54b+UqIXUBWGO9J1nffXDh3k0q4dqixusiQlJDJluI5BaQYChxK4399EKQptz
         miLgDyqhK78g81dyRYDQIwdGyZmz5ygVGcdJc0Dc1Jbsy72ZCHi51vKuSRA50EwlALIF
         c2dQNSdehzurj5wRRnvzfQEDgrcavb1zz2wAda4sOED/+bAOkLLCIppdSC4IL+D00uqu
         6VLTaFh5R5WDNHGAREFh+sZ/VHwUycuzIBHutKhjGuQJh5bxY8clMXoWuaVL+crUIXOC
         R/zhog1ev9yiiFYR0RJvj8EPLAkDQtdAzNe6SQsxpZt9KzP2z+3PbixNeAVTXrMphZRf
         POcg==
X-Forwarded-Encrypted: i=1; AKwUvBwAGtWL0khJL83fzAWEYtyx8CkWusA5F6t4C609ndI4K0O016GyHBgLuaUQeD6IYSx8uUJzmf6pWnvPVI46RHcQ@lists.infradead.org
X-Gm-Message-State: AFuF++mAnCu9W/aQrk5HCxG5Tvdz6oCPyFUt1kn0h/OjO8WgLHypTrfv
	jPNNwrMAmBbQGVbLqwATFyAhlO/Q3m+S6LxbLlNoIrwJdhTwyk2R9+8D1sp11c3+F+zeMM1rPJn
	EHAtiPw==
X-Received: from pgdh15.prod.google.com ([2002:a05:6a02:518f:b0:cc4:3b8d:ea37])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:22d4:b0:857:73e2:9103
 with SMTP id d2e1a72fcca58-86b336d6a0bmr1513199b3a.19.1789080156858; Thu, 10
 Sep 2026 15:42:36 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:42:36 -0700
In-Reply-To: <20260910221832.GH3968357@nvidia.com>
Mime-Version: 1.0
References: <20260903023452.721732-1-loganodell@google.com>
 <20260904160009.GV4157646@nvidia.com> <aptFFYqcSiBdMLE8@google.com>
 <20260905012403.GX4157646@nvidia.com> <aqIAtOoew-_6jw29@google.com>
 <20260910143448.GD3968357@nvidia.com> <aqLOWkuVKccR-I7W@google.com>
 <20260910171210.GF3968357@nvidia.com> <aqMgjXfTJ8u3n7Kj@google.com> <20260910221832.GH3968357@nvidia.com>
Message-ID: <aqMyXE-fD-UN6w5L@google.com>
Subject: Re: [RFC PATCH 0/3] liveupdate: Move to feature flags for LUO and
 memfd ABI compatibility
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Matlack <dmatlack@google.com>, Logan Odell <loganodell@google.com>, arnd@arndb.de, 
	pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org, 
	graf@amazon.com, akpm@linux-foundation.org, pbonzini@redhat.com, 
	maz@kernel.org, oupton@kernel.org, bhelgaas@google.com, alex@shazbot.org, 
	kevin.tian@intel.com, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-pci@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_154238_905389_4C15F372 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

On Thu, Sep 10, 2026, Jason Gunthorpe wrote:
> Sean's initial email was asking for strict never-break ABI compatability
> rules on top, and that is what I've been reacting to.

No, I was never asking for that.  I think we just have a different interpretation
of ABI, or rather are talking about different pieces of ABI.

I am still asking for never-break serialization format compatibility, i.e. the
more literal save/restore ABI.  I'm not asking for full backwards/forwards
compatibility across all kernels version, i.e. the higher level "kernel" ABI.

To phrase things differently: I am a-ok if kernels are inherently incompatible
because they fundamentally operate differently and/or support different features.
I am not ok if we end up with incompatible kernels because the save/restore
interfaces and payloads are poorly designed, lack abstraction, etc.  

