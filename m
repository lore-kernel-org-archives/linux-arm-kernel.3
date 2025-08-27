Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71735CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBqCOEucd2EHQAImfHa6bYvYMgk6Ar5j1i6s5MVGeY8=; b=w+RVnAoSO7POJJVR8uFzTDQBWw
	/7sX9Co7IW/9xm2k4jqn0/biCzirsfwB9lmBet151z5CGLwxapblX/qDN4UvPO9c59cVSZXLoRJ1M
	NyiO+t6SO4XtnVbQtoQ9440RsD9FDvVg54Hm7/tAwxgfZQZRnGo0W6UCotxzH3zU5d5s6pSpKTb7A
	0sK5opHld1meEr7gaP5hMaWbVfmfKLAhj4uVc8KVN3LtYWyxml6VfteA3T4mZtOLb2tum3zv9+f9U
	HsJytOUsTPGXh+IkGTeqbiYd04NyKnZVL8touGpHXBdAjPgaC2UO0+gC9VS5rKv+JGYr6w4+w9Cfy
	jK/ZTwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIcQ-0000000G7aK-1Mb5;
	Wed, 27 Aug 2025 16:03:26 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFil-0000000FUKq-1QNu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 12:57:48 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2461907278dso67959585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 05:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756299466; x=1756904266; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tBqCOEucd2EHQAImfHa6bYvYMgk6Ar5j1i6s5MVGeY8=;
        b=2AjyFzmEwosZHDiEYDx5rQ8vTBef3hETeaZ+t6EAuQTLOaN2Vf5fKflSzT6jBrDy6e
         PvlEmgxufn0rPLU6POFFahqZwihvzD9RN+4YrCLiOniiKQ1C4ZOzeEZSXYYhI+rT4hd6
         MRceTD2kjFxf5dS0pjTAMBRWntkM48UKHuUTgcOf4SiDTzhO/DBzxwWrD/A/Gyg4a1Cl
         SxrGSBxBQpuxKtywLUwUqvSCFYLDtfoZGjlnfRoU1LYsIBovGOzUAHVs8jl15ReFKGhK
         QFCLT8MyZlRUnTthkCcqZT0NRAYAN/i+Afnvys1/XmjU/faXvTYvp71x2e4otCzn/gzo
         t25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299466; x=1756904266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBqCOEucd2EHQAImfHa6bYvYMgk6Ar5j1i6s5MVGeY8=;
        b=Bi2b7C7Wh11UZoxTh9d9c9gl9+zymA54s9/4MrDff6Niw36EBx20wq6KdJ++47tknq
         SlNS8qJxvYLpwVR3f6jwnJUAK7uMTTmqMfX7Y4Q2XoSqgqDQhpR0vVcFYpSdHP/plD7M
         A9vaUcQ1qyC2OkRc/RfOjuq1ptpeIvxUWpUcSVyU60RYvy25YgR7R3vggaBhcNKcZxPP
         RMBPlmIhnI8rHQajV8JYVvL4Iq01QIDVaktHmuRAQBegOgxnYwBnHnS572w4oIl8UyXc
         pp81QmJseAJEN1gY0b7np+Tr2qDwcc0cl6sUhfp3ypFRivYj1QHiY9xhp1mXCIZzi4C4
         xKNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7FOeUCI0f53se24idCq/4ZBT64wNuX4lqwg8mAvrgdBN9EY8td4rkaaluZgluypEf8gpWsVQQvOlxZ0ttv3od@lists.infradead.org
X-Gm-Message-State: AOJu0YxVBZHjx80RGH/dEWghOP6J1qXy8Wlr7otvkp015TyvQ9nbvP/d
	VcqZlyeCpRvwPxZEnUGTY/5zODurUBQAiy4ew7/mtLqzXz2DgNr3EbUExeJM6yqkc3JBNV5XAvf
	EKtikcw==
X-Google-Smtp-Source: AGHT+IGjYzo/cbnGJG6xrvxcdKkBIhOc9WrrVofRF0UoN4jq9615eiNnHnaTmYmPl4ZeSe1Rkx8Oa2x6F14=
X-Received: from plbmq12.prod.google.com ([2002:a17:902:fd4c:b0:248:8f78:7ff4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db0e:b0:246:edc9:3a80
 with SMTP id d9443c01a7336-246edc93d95mr136614825ad.5.1756299465291; Wed, 27
 Aug 2025 05:57:45 -0700 (PDT)
Date: Wed, 27 Aug 2025 05:57:43 -0700
In-Reply-To: <87b10d94-dca2-4ecb-a86f-b38c5c90e0cf@redhat.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <87b10d94-dca2-4ecb-a86f-b38c5c90e0cf@redhat.com>
Message-ID: <aK8Ax2EchXMuX642@google.com>
Subject: Re: [PATCH v17 00/24] KVM: Enable mmap() for guest_memfd
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_055747_378379_087C91D4 
X-CRM114-Status: GOOD (  19.97  )
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

On Wed, Aug 27, 2025, Paolo Bonzini wrote:
> On 7/30/25 00:54, Sean Christopherson wrote:
> > Paolo,
> > 
> > The arm64 patches have been Reviewed-by Marc, and AFAICT the x86 side of
> > things is a go.  Barring a screwup on my end, this just needs your approval.
> > 
> > Assuming everything looks good, it'd be helpful to get this into kvm/next
> > shortly after rc1.  The x86 Kconfig changes in particular create semantic
> > conflicts with in-flight series.
> > 
> > 
> > Add support for host userspace mapping of guest_memfd-backed memory for VM
> > types that do NOT use support KVM_MEMORY_ATTRIBUTE_PRIVATE (which isn't
> > precisely the same thing as CoCo VMs, since x86's SEV-MEM and SEV-ES have
> > no way to detect private vs. shared).
> > 
> > mmap() support paves the way for several evolving KVM use cases:
> > 
> >   * Allows VMMs like Firecracker to run guests entirely backed by
> >     guest_memfd [1]. This provides a unified memory management model for
> >     both confidential and non-confidential guests, simplifying VMM design.
> > 
> >   * Enhanced Security via direct map removal: When combined with Patrick's
> >     series for direct map removal [2], this provides additional hardening
> >     against Spectre-like transient execution attacks by eliminating the
> >     need for host kernel direct maps of guest memory.
> > 
> >   * Lays the groundwork for *restricted* mmap() support for guest_memfd-backed
> >     memory on CoCo platforms [3] that permit in-place
> >     sharing of guest memory with the host.
> > 
> > Based on kvm/queue.
> 
> Applied to kvm/next, thanks!

Thank you!

FWIW, I did separate run of the patches and came up with the same resolutions
for the arm64 changes, so I'm sure they're perfect ;-)

