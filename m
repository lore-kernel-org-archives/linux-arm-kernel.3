Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90CBE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 21:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZs6YfEI3/l5tOpZdRufVPmaqDWxkIbDThpOmOAjfL0=; b=Do4JqSeReH+u+R54Z7ch2Al4Xf
	IOgwYwu8lV8NL6kFnA3pOYW+mgCE7VoM7/9i+QPpgsDBwEP4gEQEPZ+QfsR3RKZvT5VISCtvncANa
	WU2zRbWrr3HV01NuUvnTQNFfg8W5qaHyqRXbdKZsR4SEmEDLxvp3EbKWGOfNpLztDub8yphaDPjkd
	KPFIuSzywBUXVd7w8TkKzjNTLQy+WGt/tzYhyI8+q/dVDxLPPokhuqWKDaQtv4lwqHZBe0KyHrsiP
	CviJAAJpYbMcG4Cp1z/OrM7WiPXH4F21INfvsFJe7SwHy3NNpGAPgRoRykQXmlRv5VdxsA7mChC9y
	7Pb5gUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC9E-0000000CoEz-3zRf;
	Tue, 24 Dec 2024 21:09:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC82-0000000Co7h-2Qts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 21:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735074463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sZs6YfEI3/l5tOpZdRufVPmaqDWxkIbDThpOmOAjfL0=;
	b=CplfYiCcpsQ4mScETrvJjvnZznQtM+dCkpDaGGGB0/zejpvunna5mvyRYUhdrqpPo5QDbg
	bh+Wp6k83dB5T4oqWfEA1OdLnFO9HyPD6DWBbz+yNay1TghCjTH8RNWfPY4a0F+EykrKd9
	I27oUTvypBFhPGKVwmyhdhu53oJORCc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-tJyECDhdPvW0fTZ7yUlkSQ-1; Tue, 24 Dec 2024 16:07:41 -0500
X-MC-Unique: tJyECDhdPvW0fTZ7yUlkSQ-1
X-Mimecast-MFC-AGG-ID: tJyECDhdPvW0fTZ7yUlkSQ
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6ef813ed1so832166785a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 13:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735074461; x=1735679261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZs6YfEI3/l5tOpZdRufVPmaqDWxkIbDThpOmOAjfL0=;
        b=fNDxk9lXJ6Ar8E6kkqTI8fkRtwkAxe+NjAuZaRp4nANb7uoQT5x5xB87ARXtZ1By9b
         9TYYhcrBeLFDlnEno8IBZ9lrovqM9xD3B5S63T7q9wc4ELhH01+le5yx+872UPPQeM9y
         rSJii6/JQec570+C0pXx+XosuvvxonOhQekLxFfRinTk4l8Z4LoqE8To0+kBvuIM7Pmr
         zapqGe22NiVN6HWzDZXnNsMCe79uzoJ7+uo7hjJlVh18bRufSot6VlZ0JtgJsBA5+DsH
         GQKU7GoUXrwWNPySy34+Fd3z/I9F6tJN1kX/bE0iokqisA6gWVZ20xXwYIwb1qdDKlbm
         RFSg==
X-Forwarded-Encrypted: i=1; AJvYcCU3iYpPUwvoUqb4n/lWajgGOV1Qy05lExDEibxcQHB7PG3nnbrVnzthdPFv0HBnhQ45mlzDDx8KhMGplKOmF37u@lists.infradead.org
X-Gm-Message-State: AOJu0YwteyOcv0YDqU7+fHNpWuiELc1S9fDTUGXySuCpbi/tl+LwK+S4
	718+TdAl2f79p8Pz5BWCjVHzQ7jT8s4fMwusL8bZHOvPbSVGnHbiOItU/rtDSmzPOVyVXeW0fuJ
	+Y/JpYiOqNnwjAWkwX7h4XZsvqQtfpS7UZTkYkyHyB1V+Tr8xDFWFeuEgViVxgYTmTzbuCzlg
X-Gm-Gg: ASbGncuh55dVE96RqzbKCdXL3y0aO8xpamXRE9qzcqmhAX2RVo4+GpxOrred4M/e9Hw
	/xamVfWdtOoJ3RkjHZ2HTbg509cePmjc5iVM1N3LHl9OKFfZTvzsmiVS170mk6W88Srotly1pn8
	pLf01UFg/21BOBAu9c3rUawJ0tRESmA7Z+OYoMAhvCKl1y7qsxTCfXZpAjdlLdtSWJnudqE8TxI
	Gr/cmGq9XNMnwalNi44JJ/VXy2aJC9K78W+VzMGhNpZX8x9IgOdx/NnYjBdN0o2AihakF17DMmB
	Oe4tH9wEquyyTAyXcQ==
X-Received: by 2002:a05:620a:4113:b0:7b8:626b:7ab with SMTP id af79cd13be357-7b9ba75eccdmr2798803185a.19.1735074460861;
        Tue, 24 Dec 2024 13:07:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnN/zY/woHUhG5osGnG+exxCB/UJU+6pyhc9ubSIWO3+84Rcn5ofakxvIKipqBFvygMHhkKw==
X-Received: by 2002:a05:620a:4113:b0:7b8:626b:7ab with SMTP id af79cd13be357-7b9ba75eccdmr2798800285a.19.1735074460495;
        Tue, 24 Dec 2024 13:07:40 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e676f26sm56608011cf.19.2024.12.24.13.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 13:07:39 -0800 (PST)
Date: Tue, 24 Dec 2024 16:07:36 -0500
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>,
	David Matlack <dmatlack@google.com>, Wang@google.com,
	Wei W <wei.w.wang@intel.com>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v1 00/13] KVM: Introduce KVM Userfault
Message-ID: <Z2simHWeYbww90OZ@x1n>
References: <20241204191349.1730936-1-jthoughton@google.com>
MIME-Version: 1.0
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lVbVlCHCiut7zEiUeEOpvsrIYPWq4P90X5RTEUZotPI_1735074461
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_130746_706739_883BE9A6 
X-CRM114-Status: GOOD (  44.30  )
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

James,

On Wed, Dec 04, 2024 at 07:13:35PM +0000, James Houghton wrote:
> This is a continuation of the original KVM Userfault RFC[1] from July.
> It contains the simplifications we talked about at LPC[2].
> 
> Please see the RFC[1] for the problem description. In summary,
> guest_memfd VMs have no mechanism for doing post-copy live migration.
> KVM Userfault provides such a mechanism. Today there is no upstream
> mechanism for installing memory into a guest_memfd, but there will
> be one soon (e.g. [3]).
> 
> There is a second problem that KVM Userfault solves: userfaultfd-based
> post-copy doesn't scale very well. KVM Userfault when used with
> userfaultfd can scale much better in the common case that most post-copy
> demand fetches are a result of vCPU access violations. This is a
> continuation of the solution Anish was working on[4]. This aspect of
> KVM Userfault is important for userfaultfd-based live migration when
> scaling up to hundreds of vCPUs with ~30us network latency for a
> PAGE_SIZE demand-fetch.

I think it would be clearer to nail down the goal of the feature.  If it's
a perf-oriented feature we don't need to mention gmem, but maybe it's not.

> 
> The implementation in this series is version than the RFC[1]. It adds...
>  1. a new memslot flag is added: KVM_MEM_USERFAULT,
>  2. a new parameter, userfault_bitmap, into struct kvm_memory_slot,
>  3. a new KVM_RUN exit reason: KVM_MEMORY_EXIT_FLAG_USERFAULT,
>  4. a new KVM capability KVM_CAP_USERFAULT.
> 
> KVM Userfault does not attempt to catch KVM's own accesses to guest
> memory. That is left up to userfaultfd.

I assume it means this is an "perf optimization" feature then?  As it
doesn't work for remote-fault processes like firecracker, or
remote-emulated processes like QEMU's vhost-user?

Even though it could still 100% cover x86_64's setup if it's not as
complicated as above?  I mean, I assumed above sentence was for archs like
ARM that I remember having no-vcpu-context accesses so things like that is
not covered too.  Perhaps x86_64 is the goal?  If so, would also be good to
mention some details.

> 
> When enabling KVM_MEM_USERFAULT for a memslot, the second-stage mappings
> are zapped, and new faults will check `userfault_bitmap` to see if the
> fault should exit to userspace.
> 
> When KVM_MEM_USERFAULT is enabled, only PAGE_SIZE mappings are
> permitted.
> 
> When disabling KVM_MEM_USERFAULT, huge mappings will be reconstructed
> (either eagerly or on-demand; the architecture can decide).
> 
> KVM Userfault is not compatible with async page faults. Nikita has
> proposed a new implementation of async page faults that is more
> userspace-driven that *is* compatible with KVM Userfault[5].
> 
> Performance
> ===========
> 
> The takeaways I have are:
> 
> 1. For cases where lock contention is not a concern, there is a
>    discernable win because KVM Userfault saves the trip through the
>    userfaultfd poll/read/WAKE cycle.
> 
> 2. Using a single userfaultfd without KVM Userfault gets very slow as
>    the number of vCPUs increases, and it gets even slower when you add
>    more reader threads. This is due to contention on the userfaultfd
>    wait_queue locks. This is the contention that KVM Userfault avoids.
>    Compare this to the multiple-userfaultfd runs; they are much faster
>    because the wait_queue locks are sharded perfectly (1 per vCPU).
>    Perfect sharding is only possible because the vCPUs are configured to
>    touch only their own chunk of memory.

I'll try to spend some more time after holidays on this perf issue. But
will still be after the 1g support on !coco gmem if it would work out. As
the 1g function is still missing in QEMU, so that one has higher priority
comparing to either perf or downtime (e.g. I'll also need to measure
whether QEMU will need minor fault, or stick with missing as of now).

Maybe I'll also start to explore a bit on [g]memfd support on userfault,
I'm not sure whether anyone started working on some generic solution before
for CoCo / gmem postcopy - we need to still have a solution for either
firecrackers or OVS/vhost-user.  I feel like we need that sooner or later,
one way or another.  I think I'll start without minor faults support until
justified, and if I'll ever be able to start it at all in a few months next
year..

Let me know if there's any comment on above thoughts.

I guess this feauture might be useful to QEMU too, but QEMU always needs
uffd or something similar, then we need to measure and justify this one
useful in a real QEMU setup.  For example, need to see how the page
transfer overhead compares with lock contentions when there're, say, 400
vcpus.  If some speedup on userfault + the transfer overhead is close to
what we can get with vcpu exits, then QEMU may still stick with a simple
model.  But not sure.

When integrated with this feature, it also means some other overheads at
least to QEMU.  E.g., trap / resolve page fault needs two ops now (uffd and
the bitmap).  Meanwhile even if vcpu can get rid of uffd's one big
spinlock, it may contend again in userspace, either on page resolution or
on similar queuing.  I think I mentioned it previously but I guess it's
nontrivial to justify.  In all cases, I trust that you should have better
judgement on this.  It's just that QEMU can at least behave differently, so
not sure how it'll go there.

Happy holidays. :)

Thanks,

-- 
Peter Xu


