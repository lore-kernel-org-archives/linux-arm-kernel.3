Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE2FC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uvu6aXDIrLF08vsxpzyNfXk0GOFzmWSaZdsX/BEX7c=; b=T+fQR/DIlCyvkFAZmLlIASXXGX
	Ak6Qum6uvAzM+pojkAtstEfUIMb9s2wTWoUMLW4P/KPTeAuCJow2b9F27/q44nfUcLqmEG0V7vTYW
	CsyxOr3m0reUa4f6RMKuzcR7AbHs6kIAzdtgDFarAbWtxKJkmDvnF7o/5jNA/2Kj53cqWkJeWnVX0
	3aJ1vbUNwwGigS9zfoDwdeMRhxFvWBuNcMip4qa3kdUV7tXHBzblKt4udOqWF95B2EzpY2UdgSasN
	VbrDvdFTzmOAEqX2udZKEyO8f/tguFNzp/bT3Dzsu7N/Pb8fpT2QP6PaY/msbS01+8S/ITGsPnGyf
	TusZzO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITzm-00000004C3A-0Z00;
	Fri, 23 May 2025 15:07:38 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITSs-000000044rp-0KqK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 14:33:39 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-30e86c46eadso5595a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748010817; x=1748615617; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/uvu6aXDIrLF08vsxpzyNfXk0GOFzmWSaZdsX/BEX7c=;
        b=JkNskpFFMVi4hZF3JrYwYje365xVjJt7CFWI1zukOfS1LHbQetk1muHzw8rTgdJSC6
         MJ1bacezMcUhFO7o2Hxd9kKYLyBgTSgtDoh87EJLFHgPTOKzfeHvvNGpo0/s2FdCphdh
         XdMKS744iqqQBm0hZGMH8aG6rnnADkfJ89lQTHc0pSYzTBGxMJyXlFlTRfqbuMJltoRK
         qjeafgdKNO7+Lgoe5voT3PmECVmI/xr+XoPg6fw8LgFSrs1pR+YNw4bywwWxipHYrBKR
         VhxsEq2vYnIPsPKXg9NXKTbqcA/QUNXWL+XhKM3+oXps2sdv6aT8t3BJvDUPin8+zB0G
         pbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748010817; x=1748615617;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uvu6aXDIrLF08vsxpzyNfXk0GOFzmWSaZdsX/BEX7c=;
        b=HnDM8UUluxkUAF5pi3DH+w4KVPmzlTHcusbKP+ZumMMCYIbiihsVh+QNLQYub1qvFq
         niT1TKKwvcadvv49bS3V+1sIdkf4vZni/XNpYrHSzuDJRk1aiYnNzt+nnMJ8E7lFj+V+
         X9I5lxYfYPvvu3feUDWBab4JvptuwHwDYOwmatbSbZc/t3DVJksQTHOeuGjn4j5m7KB0
         v28B4sOXRIgLfUr2GI5WxniC1WVH12QDZ4Yeb3SFnhDYqEZgDQUFkWc3Hx1cScNlFdV/
         akf/GKcTfT0MZaF6hHENJ88uRzj/x4+FIBQVYMzcj/1atL3xdEWtlH7/sjSiWLJXljXk
         JctA==
X-Forwarded-Encrypted: i=1; AJvYcCWW1JjiU16zI5kVe8qc4qP10gWUwixVG7vgp+1C2j9S3qd2nSAQhxrzr4kAmuHuAHIVoI4kWcgacV1xTAvTLmp6@lists.infradead.org
X-Gm-Message-State: AOJu0YyIHDxL+2WliYudn6GOXfgUQtFzeILxdEx7mwywYiSd1g2JQRDX
	zUiBPzKm6ISQNg+sdmYH5KvArKQCaPK7qyYz7fKaVp3GNyXeJrSwI2ZqHJsSe50zwtRiWfbD4IG
	2dju8bQ==
X-Google-Smtp-Source: AGHT+IHsZ0QnOLBFT5oLqgFlsou+V6RqzdnkAMpT1uyTVqCC/FSYHIecluEf4Yy5p3wiVYxCHPutaUGV15c=
X-Received: from pjbmf7.prod.google.com ([2002:a17:90b:1847:b0:30e:7b26:f68b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1846:b0:301:9f62:a944
 with SMTP id 98e67ed59e1d1-30e7d5ca287mr50858908a91.33.1748010816755; Fri, 23
 May 2025 07:33:36 -0700 (PDT)
Date: Fri, 23 May 2025 07:33:30 -0700
In-Reply-To: <2c52daad-0b64-48a9-8e73-d1aba977993b@amd.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com> <20250522235223.3178519-14-seanjc@google.com>
 <2c52daad-0b64-48a9-8e73-d1aba977993b@amd.com>
Message-ID: <aDB-2lcq4jJm9-OV@google.com>
Subject: Re: [PATCH v3 13/13] KVM: selftests: Add a KVM_IRQFD test to verify
 uniqueness requirements
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	K Prateek Nayak <kprateek.nayak@amd.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_073338_139205_85111A7D 
X-CRM114-Status: GOOD (  14.39  )
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

On Fri, May 23, 2025, Sairaj Kodilkar wrote:
> On 5/23/2025 5:22 AM, Sean Christopherson wrote:
> 
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +	pthread_t racing_thread;
> > +	int r, i;
> > +
> > +	/* Create "full" VMs, as KVM_IRQFD requires an in-kernel IRQ chip. */
> > +	vm1 = vm_create(1);
> > +	vm2 = vm_create(1);
> > +
> > +	WRITE_ONCE(__eventfd, kvm_new_eventfd());
> > +
> > +	kvm_irqfd(vm1, 10, __eventfd, 0);
> > +
> > +	r = __kvm_irqfd(vm1, 11, __eventfd, 0);
> > +	TEST_ASSERT(r && errno == EBUSY,
> > +		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
> > +
> > +	r = __kvm_irqfd(vm2, 12, __eventfd, 0);
> > +	TEST_ASSERT(r && errno == EBUSY,
> > +		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
> > +
> > +	kvm_irqfd(vm1, 11, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> > +	kvm_irqfd(vm1, 12, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> > +	kvm_irqfd(vm1, 13, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> > +	kvm_irqfd(vm1, 14, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> 
> Hi Sean,
> I dont see any allocation for the GSI 13 and 14..
> Is there any reason for the deassigning these two GSIs ?

Yes, KVM's rather bizarre ABI is that DEASSIGN is allowed even if the VM doesn't
have a corresponding assigned irqfd.  The reason I added these early DEASSIGN
calls is so that there will be an easier-to-debug failure if KVM's behavior
changes (the racing threads part of the test abuses KVM's ABI).  I didn't add a
comment because the helpers already have comments, but looking at this again, I
agree that main() needs a better comment.

