Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A3AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+aljsYXNR3zz+hPgKhn1NefTJFgn2NwxVBvLmGXKHY=; b=QwzyTvgBpayRNEftW8g2kbWmDo
	oI664s6nPAkWqFsA240+tSvQcj+uGm/n0bkWDKCzQURkHxilHZETLv5XheNARh43dF4G0z2R9i7Zu
	6UpuDJ0UBC+hNTJIPc+pQakgemkZLXlj2u3K+s8yIWEuU40BICZNb1PUV7eXObNKWYjmCFpB6k+BI
	mKsMGtJNcHkB/OyCtTEPP9ggWrNjQzVZu/LEnfj7TxIIYansU1uFozfo25iqSit1+qpgCoDUPdyKZ
	fi38hOdkY9JqXvDbE9pesGzitGjkjEkwHMSeBxtpGLnePW4YkmtQ9+UaVk5nErgZ6+YV1oQSIjTzB
	bZnAcd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZcX-0000000GdcT-1nTF;
	Thu, 16 Jan 2025 23:49:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZKc-0000000GTqj-3WGc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737070282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+aljsYXNR3zz+hPgKhn1NefTJFgn2NwxVBvLmGXKHY=;
	b=ABLS+vWVAe28f04gtWqkbT/LKoVihr01lXqjh4Nb4QcOagU9d6AM9+0XHopSCUIT7lglBt
	dKhdhomrVv1siGykQozZWCppfgX3wkO1zsG8tNg08S/A9UIrji52+nVPRDIU7qC6btsYQF
	7q4yp8iEISAHoBMUdoRwPM1W0XXByOY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-x8IAavQBP1GKW6lWfOQFGA-1; Thu, 16 Jan 2025 18:31:20 -0500
X-MC-Unique: x8IAavQBP1GKW6lWfOQFGA-1
X-Mimecast-MFC-AGG-ID: x8IAavQBP1GKW6lWfOQFGA
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467a0a6c846so34899381cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 15:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737070280; x=1737675080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+aljsYXNR3zz+hPgKhn1NefTJFgn2NwxVBvLmGXKHY=;
        b=iAUpEfGp7nOtzrYqTmYEb9M5TLSNVGWM8Fy7RsME3JxS9BDU0UWn5ucAvc4TrxofHe
         yGxi1fX/uDYWWDYCC9P93GGMp5cchiq3+NnYFBQ8/5i9erbxXeoNpXZsWonmI43rO3LS
         HbUWMFSUHf07Hu3kc6kLcAtNq9aBidVk9FkJ2XlWt9zi1rX4Ik+WX4PoVYw2k2LZV1Yi
         R3DdI9tWtTVWe0/tMaXy0OE/fAGHiiAWrSiu2c6CxHrLNizEVtG1ZzetgFoUf48JQLGv
         cwWZihUw3fvoLDDIQS+1XbBfaeecQJt+l9w3l8LBmipzPiKKP4ZNF0iLHe/04Th28Rh+
         isQg==
X-Forwarded-Encrypted: i=1; AJvYcCX/kz6JMq7+pTsayVK6e4JDoOFEkD1oEhlvzoolsxFCPBQkB0GuKoZSsegd1n3TrwVfYl1rUFdbpr4k7p3Rl9xu@lists.infradead.org
X-Gm-Message-State: AOJu0YwljAtHOtlnaR8Qk5t49QBtXJbHooJwBKIt21o2AJ8BrDJBAwFi
	l2ndoFbostA0m1SwVq4yWoXRPyMziBRRhTknyFsWhJbqankRFu0ySCKn8d99tWV/J3hqDkzhGv8
	UgxSwrP7kRoIvCuvAgZ3dJMZ7bDPMnH9LVbaVoaBi45gUoJ6JyTib2s02TgohENzqzF7g7bTk
X-Gm-Gg: ASbGncvlZLzTSA6x60hLcl5NL04y7dq4+P9ohRgZdZ7wzZ/yBI1ABkPN7E5p3Ntaweb
	sXHZ561tWLaVcgcGZfYvhfoeKdDpdh/4KZdMshZJ6A4KQREGMdkswwkJXlAmVp3CH5W+9PxT8na
	H5h/VFAcKyZmpOPM5L0jiSi0bTH+VLz0XhvG2bvoZc19wY9eX2gUngdxziDypywzwTvt+1Q1B98
	r8iXvy6moNRDEwOlGU3eILIBMAL6uWKkc5QMNHUSGxdzi35Ph8eePE/AV1+vMr1s0iYHasyh60M
	ZHYu7Ef+oauvu6LOMA==
X-Received: by 2002:ac8:5914:0:b0:467:7270:bc35 with SMTP id d75a77b69052e-46e12a3fadamr10765391cf.14.1737070280060;
        Thu, 16 Jan 2025 15:31:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDbPH5giaBGe/SQwST9bz+Qh0GVUALDsJUk5gRXMEShRz7wGoChR/Lc1daUotDAD4y7F9d0A==
X-Received: by 2002:ac8:5914:0:b0:467:7270:bc35 with SMTP id d75a77b69052e-46e12a3fadamr10765061cf.14.1737070279738;
        Thu, 16 Jan 2025 15:31:19 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e104027d5sm5078961cf.58.2025.01.16.15.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:31:19 -0800 (PST)
Date: Thu, 16 Jan 2025 18:31:15 -0500
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
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v1 00/13] KVM: Introduce KVM Userfault
Message-ID: <Z4mWw8NXCoV-pONI@x1n>
References: <20241204191349.1730936-1-jthoughton@google.com>
 <Z2simHWeYbww90OZ@x1n>
 <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
 <Z4lp5QzdOX0oYGOk@x1n>
 <Z4lsxgFSdiqpNtdG@x1n>
 <CADrL8HWRavCoZ_NtXJvcLOvjOiGDCor6ucWeEqkecA3VDY-adg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrL8HWRavCoZ_NtXJvcLOvjOiGDCor6ucWeEqkecA3VDY-adg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sXTG6jb8J8UKy46PLSls3M2mC59qTmorrnGaUcRvdjY_1737070280
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_153122_949032_0CB12CCF 
X-CRM114-Status: GOOD (  23.49  )
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

On Thu, Jan 16, 2025 at 02:51:11PM -0800, James Houghton wrote:
> I guess this might not work if QEMU *needs* to use HugeTLB for
> whatever reason, but Google's hypervisor just needs 1G pages; it
> doesn't matter where they come from really.

I see now.  Yes I suppose it works for QEMU too.

[...]

> > In that case, looks like userfaultfd can support CoCo on device emulations
> > by sticking with virtual-address traps like before, at least from that
> > specific POV.
> 
> Yeah, I don't think the userfaultfd API needs to change to support
> gmem, because it's going to be using the VMAs / user mappings of gmem.

There's other things I am still thinking on how the notification could
happen when CoCo is enabled, that especially when there's no vcpu context.

The first thing is any PV interfaces, and what's currently in my mind is
kvmclock.  I suppose that could work like untrusted dmas, so that when the
hypervisor wants to read/update the clock struct, it'll access a shared
page and then the guest can move it from/to to a private page.  Or I'm not
sure whether such information is proven to be not sensitive data, so the
guest can directly use a permanent shared page for such purpose (in which
case should still be part of guest memory, hence access to it can be
trapped just like other shared pages via userfaultfd).

The other thing is after I read the SEV-TIO then I found it could be easy
to implement page faults for trusted devices now.  For example, the white
paper said the host IOMMU will be responsible to translating trusted
devices' DMA into GPA/GVA, I think it means KVM would somehow share the
secondary pgtable to the IOMMU, and probably when DMA sees a missing page
it can now easily generate a page fault to the secondary page table.
However the question is this is a DMA op and it definitely also doesn't
have a vcpu context.  So the question is how to trap it.

So.. maybe (fd, offset) support might still be needed at some point, which
can be more future proof.  But I don't think I have a solid mind yet.

-- 
Peter Xu


