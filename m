Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F49C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZ+7NcQN2GRHERXJVYagMBxlSawy5BYRQeFxBS4jvGU=; b=cNEzF1e9Iqnrdx3ZduDdyGriGs
	ikQAplXZ+kAzFeTxDfnJl0czD25c48rB9bi4ATy+7V/8gc4ueb94CzFrF1GP2qRLq9dT0hZiltlFt
	dBLtB0fY7Ooj/uxnhwrhxcaO7pB/6S4hJHIyIYhwWv5UF5sb2214/i6zGywD3C2s3rBO3Vo1Xi3S3
	qrMVoBAIyWkKXPFrtzgdXGLq9pKHU1zB0ZXh/J4F0zBjbxNnKuUyG4V3dBSEeT9KO/RXPGFSfQxLD
	lEfPf5nBdjnR6DO6eb0uQxP7GEg8NoRKhh8y8FxFvcqrsDGzZmtkP/68b70fWtkDzm7XtVR8PDIdD
	Z7JkYmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYBF-0000000GCM6-0LIS;
	Thu, 16 Jan 2025 22:17:37 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYY9y-0000000GCFB-3iX2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:16:20 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so2817325a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 14:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737065777; x=1737670577; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vZ+7NcQN2GRHERXJVYagMBxlSawy5BYRQeFxBS4jvGU=;
        b=Hgh3Bky8aZahQSz6JJ7ZJ8Xu7Bg7m34vPgz6p5s4EfdWzVFh3Cm3bMaxX2DDyUN3lo
         xUdPtF2dX/4EfYu8ufBSgGQszqkavHdxSt0iSdD8UZAeckxCns9hSlAJ3v7r0qJC5f26
         TOogB+7eXb7j36vFh9T252wRr06Zhf4JUynyDB1xGFycuNaNj5+unxKq+BIWEe7JKJ/A
         VODPeDZDLTUeI4CBt2l7F/4nGoPLDQQI0I/8y4Z+ndfENXxqRY8eHBsvTQgWn+Zx03gx
         v+3e9I3xUd2gqQb1Jl+ZYl4nLatrxEFfdOppf9wEGt+N9WFuap9bmlOfj60VKJ0by3il
         Y3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737065777; x=1737670577;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZ+7NcQN2GRHERXJVYagMBxlSawy5BYRQeFxBS4jvGU=;
        b=bhjdKbOr9AazBrdtKtBan6+kdfGCZcxFBXnzfeItmGeFENvBjlTLP4zsZqlEjLurkk
         x6Br86ag74DvKRbHEPEG9T2k9nF7AkeSBjJzUP+gcyxP2ded06+K9kBZBCTTBHjswBuW
         r2OwKDyI4Z00WEmiYu20wlK5n4IBIxAR418Gi6jUZe8Teu0Cx6W6/XOipST5j2vH4oaI
         nSlVvjr5GUYUgPty303k7o0SQIulOIIEpqNCpYbqUgyb9ec72p0C7tmC3rMVTtzU+n/9
         eFVLS+/95xCxaEQ+raUCZyh/dQGWNa/uAoJ0+j/4wsZFugqD26rK0DS5i5RTyRTwlDpF
         QnxA==
X-Forwarded-Encrypted: i=1; AJvYcCXjayF2lGspYyUnoKbwImjuqk5BwlwgTQ1laOBwp9sgN0IR0VNF3WMg2OJXsRVb629vAtv0bkQNecTBF/Jtom/b@lists.infradead.org
X-Gm-Message-State: AOJu0YzsQrj15N3vMQ0s6x+kgXuKJQGD9W25252LFqAka1vEvs2chz6E
	BszY2a5BoZMHWkv6X7uKB7ZNSqhnvCjJcHMNyKgL9p0aUqZ1TLy/D/D4cY8ea0NnFtEbDW4clll
	ZYg==
X-Google-Smtp-Source: AGHT+IFQWdmM2razhLJbL5aP2luCP61s/wuhDj08lqTNDx6qC+0wGyJoLk/MjnPxGPcgL9u/wZA2pdBixos=
X-Received: from pjbsn6.prod.google.com ([2002:a17:90b:2e86:b0:2ea:4139:e72d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2c7:b0:2ef:2d9f:8e55
 with SMTP id 98e67ed59e1d1-2f782ca1fffmr397272a91.17.1737065777241; Thu, 16
 Jan 2025 14:16:17 -0800 (PST)
Date: Thu, 16 Jan 2025 14:16:15 -0800
In-Reply-To: <Z4lsxgFSdiqpNtdG@x1n>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
 <Z2simHWeYbww90OZ@x1n> <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
 <Z4lp5QzdOX0oYGOk@x1n> <Z4lsxgFSdiqpNtdG@x1n>
Message-ID: <Z4mFL8wfHjvz6F1Y@google.com>
Subject: Re: [PATCH v1 00/13] KVM: Introduce KVM Userfault
From: Sean Christopherson <seanjc@google.com>
To: Peter Xu <peterx@redhat.com>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Yan Zhao <yan.y.zhao@intel.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, 
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_141618_950174_83E030A5 
X-CRM114-Status: GOOD (  26.67  )
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

On Thu, Jan 16, 2025, Peter Xu wrote:
> On Thu, Jan 16, 2025 at 03:19:49PM -0500, Peter Xu wrote:
> > > For the gmem case, userfaultfd cannot be used, so KVM Userfault isn't
> > > replacing it. And as of right now anyway, KVM Userfault *does* provide
> > > a complete post-copy system for gmem.
> > > 
> > > When gmem pages can be mapped into userspace, for post-copy to remain
> > > functional, userspace-mapped gmem will need userfaultfd integration.
> > > Keep in mind that even after this integration happens, userfaultfd
> > > alone will *not* be a complete post-copy solution, as vCPU faults
> > > won't be resolved via the userspace page tables.
> > 
> > Do you know in context of CoCo, whether a private page can be accessed at
> > all outside of KVM?
> > 
> > I think I'm pretty sure now a private page can never be mapped to
> > userspace.  However, can another module like vhost-kernel access it during
> > postcopy?  My impression of that is still a yes, but then how about
> > vhost-user?
> > 
> > Here, the "vhost-kernel" part represents a question on whether private
> > pages can be accessed at all outside KVM.  While "vhost-user" part
> > represents a question on whether, if the previous vhost-kernel question
> > answers as "yes it can", such access attempt can happen in another
> > process/task (hence, not only does it lack KVM context, but also not
> > sharing the same task context).
> 
> Right after I sent it, I just recalled whenever a device needs to access
> the page, it needs to be converted to shared pages first..

FWIW, once Trusted I/O comes along, "trusted" devices will be able to access guest
private memory.  The basic gist is that the IOMMU will enforce access to private
memory, e.g. on AMD the IOMMU will check the RMP[*], and I believe the plan for
TDX is to have the IOMMU share the Secure-EPT tables that are used by the CPU.

[*] https://www.amd.com/content/dam/amd/en/documents/developer/sev-tio-whitepaper.pdf

> So I suppose the questions were not valid at all!  It is not about the
> context but that the pages will be shared always whenever a device in
> whatever form will access it..
> 
> Fundamentally I'm thinking about whether userfaultfd must support (fd,
> offset) tuple.  Now I suppose it's not, because vCPUs accessing
> private/shared will all exit to userspace, while all non-vCPU / devices can
> access shared pages only.
> 
> In that case, looks like userfaultfd can support CoCo on device emulations
> by sticking with virtual-address traps like before, at least from that
> specific POV.
> 
> -- 
> Peter Xu
> 

