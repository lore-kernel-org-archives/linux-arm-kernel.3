Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8E8CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDlvwYPz97Xgh+aeVzA9ej1JjFbOizVBMxc/gGXHNu8=; b=UgfQGsx5aKROb2VO0zJPXtl5i8
	HP9EhlJ54OBAmWGUM1pQg5QgyKFfM9bhVI4eVxmUXriMi8aI8NSf5BRK81fa2moMVIMlXYkNOvjRd
	txTRlGxxwcFqmbWfAAsugCuDbOyKQqBMUTQuyTRxgz1ns75kZzPz+yW3ZVJztWQpsjZiXmxupuMCh
	mtRPfBUJL/CbyRF4q5g96Ev4ySH6ZlvAaa1TlxGMRWTq3jyhhtF4hEVaZCwQo8+7cPD2+nlqMzh0V
	KijZupA6AQ1D8K6Uie1vKT7rp9L3pqf+NqimcNytrhEdGD9iecYgI1yg6hmNepgkbKCi9q0bPHlCi
	keR+mkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yQl-00000007BDH-0NuH;
	Thu, 09 Oct 2025 21:44:11 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yQi-00000007BCx-1t5O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:44:09 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-268149e1c28so29895425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760046247; x=1760651047; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BDlvwYPz97Xgh+aeVzA9ej1JjFbOizVBMxc/gGXHNu8=;
        b=ZOjABZznnCGE+Hi6iWu6ArBpELa9kMgthXkPyJtOPXfDfRzNKoqiDPG2ZklAdzVf6m
         NQN6SP9ZXTdVk7VN8eSCL5j3mcNge9E+3TkBQtpVEdgdTWXV6y5lOBXj77CBfulko4SO
         Z+gOXuo1EqBXL50ZxGuZQaMRDGTTuhxvur0MGO+n4FKJFptikcYgp5pRw+aXnYgbjCng
         5BFi7GvVvXzKNH1iMY2oPrTIARpamglJZEDezyd870dMPjRTPNjdA96JOLTaAgsS57cW
         i0B7JBY8fUheLw4fFER1Cu+gEoVWwNf1RcunXFPPG3f7ccBGUa3GgLKdHR7u/Nyjpwaj
         EYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760046247; x=1760651047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDlvwYPz97Xgh+aeVzA9ej1JjFbOizVBMxc/gGXHNu8=;
        b=JvZz1N67pjHaRBqsn8UITpxihBiYxbw0pZu5NpsI8AlSbW7RX+XT+FYOAzQlEvOvJO
         QhrRVnVpVFO+T3StXET3jtQ5mnejMi3YO8zkB4+N3k8MRoZuyn75elT6c/9Os21+NsuK
         D8A/LKb+65TuKN8EqIpWcuMMBZdH40Ejo8vbovIsI7caf1SdPEV2Cfw7d8PgOdbkNhlN
         NkPx5hY8XwrxHM/gmVtSCfazULkEBF9X/3+pCHEMTX7DmTBIupuZVJ3U8ijuMfaZZbGk
         3lE2MicEeDghN9uwVTxha55pwrgg51GahSKx5KciQeOKThvrU0z1zpSZiO3xkVv02EOY
         zuyA==
X-Gm-Message-State: AOJu0YzjN9EOZ3xxB1L0eaTAdDtubGjGD45djwH2KDBwRD+y6C5xVtHN
	xfTxiCEgD1nG63qL6WgyPDKGit6Jf7t405PWJibffaLZka9McMb+kK70tLLPY3G32aCvNtQekee
	3hpoxYv7EnhXK5fHcTAQzqJxq4w==
X-Google-Smtp-Source: AGHT+IFQjHCm6wm7SAnAbDplPBJVQjkKsdlYJBsa6mhJlfSzzwa6PeU2oGKlk2TkpKhjDbxnR+qB7/kozxjMndhM2A==
X-Received: from plnx24.prod.google.com ([2002:a17:902:8218:b0:24c:af07:f077])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:8cc:b0:267:e3af:ae67 with SMTP id d9443c01a7336-29027238ef6mr108267505ad.14.1760046247397;
 Thu, 09 Oct 2025 14:44:07 -0700 (PDT)
Date: Thu, 09 Oct 2025 14:44:06 -0700
In-Reply-To: <20251007221420.344669-7-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-7-seanjc@google.com>
Message-ID: <diqzqzvbhhsp.fsf@google.com>
Subject: Re: [PATCH v12 06/12] KVM: selftests: Define wrappers for common
 syscalls to assert success
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_144408_510208_2DC0DA86 
X-CRM114-Status: GOOD (  12.66  )
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

Sean Christopherson <seanjc@google.com> writes:

> Add kvm_<sycall> wrappers for munmap(), close(), fallocate(), and
> ftruncate() to cut down on boilerplate code when a sycall is expected
> to succeed, and to make it easier for developers to remember to assert
> success.
>
> Implement and use a macro framework similar to the kernel's SYSCALL_DEFINE
> infrastructure to further cut down on boilerplate code, and to drastically
> reduce the probability of typos as the kernel's syscall definitions can be
> copy+paste almost verbatim.
>
> Provide macros to build the raw <sycall>() wrappers as well, e.g. to
> replace hand-coded wrappers (NUMA) or pure open-coded calls.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>

> ---
>  tools/testing/selftests/kvm/arm64/vgic_irq.c  |  2 +-
>  .../selftests/kvm/include/kvm_syscalls.h      | 81 +++++++++++++++++++
>  .../testing/selftests/kvm/include/kvm_util.h  | 29 +------
>  .../selftests/kvm/kvm_binary_stats_test.c     |  4 +-
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 31 ++-----
>  .../kvm/x86/private_mem_conversions_test.c    |  9 +--
>  6 files changed, 96 insertions(+), 60 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/kvm_syscalls.h
>
> 
> [...snip...]
> 

