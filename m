Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4AACD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+YdK4NbXs+ZsodRXvW6iokqWV0RltJ5UQ3bl9FDyjo=; b=nhjzNegmx7Umi1LrpbdUl5Fi5M
	I0iIXzi9NnkvKTgKa1xdElol6Sw8CltAduLdIEYbDobpMrwGIiibDarKIiQSE7AHbgkq08XRD0L2s
	wjO22VjFPXKHOiMLKGYBBXH/O6FXLXWi76oFafSC1FinDDUkiq6Pw3SZwecpfWR479edJ2IFDpL3+
	nccPC6n1uJJZ6352Aq7wVHIBvAL6qbGj/0JGqmHGunyvRzJq730zrmITI7ZuZk58ENF7/gRXKVsvt
	b0NKUhir3wIzTUYDlsxXGN3o6uaiajOhxqbUS0bUoge8un64m/eVGWJAO8fH3kMfApKRyvj2/VET0
	p6Tucvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbcY-00000000o0q-07U8;
	Wed, 06 May 2026 12:44:58 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbcW-00000000o00-48Lm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:44:57 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c801ba7685cso1377166a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 05:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778071495; x=1778676295; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n+YdK4NbXs+ZsodRXvW6iokqWV0RltJ5UQ3bl9FDyjo=;
        b=W99gymOphLh2/HnM/VsjeNnslUUXLwQK2P4aXbYDceSmK8bH7zP3OBbeBYKFPcm/ZQ
         TFdnKLF+4MDIG79J49AnFM1B1ZYE4YN5N+qdypJZlmY/ecvfkgT6LjMNJqK7zFFlIMRV
         vVCL1HsVSKK225evud+bklJtLg+qsMwP7PNQr7RA8XrD2nSu3piKFM4dHNHKE39b41vF
         kuQcltIkwY2OUkqoGBkT+34HFgIQE7+xkDmDJqqaEKgeH+9AAjKQLLSDOu+dFa4zIK4n
         TFVaMra1w4dxRisX/pM3CxodKhmLcn4nJeN8L69QVx1ADDWyT29rLod1pfrJffssW5hA
         Jagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071495; x=1778676295;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+YdK4NbXs+ZsodRXvW6iokqWV0RltJ5UQ3bl9FDyjo=;
        b=iqiWGls8EUQjsdh1iSjBp1eQJ26X3ERdAh5o87DCeXWYQW57qGbPbym+u0rwPy/6sq
         2XCehayUZ/ZMldHMxydcEg5gpmZxLnBzFCXWRC2qulpVt9sNQM6F+Nec39Y8p4Zc9Dkd
         qW7k56pW6L4Tq1tRFu2UjYngGLuAP4I7KdKaQUPX1PjRaWc+4Sv2J37VWXCjBf2oGiZl
         Xz3gJqZntvGYeuB8NTSoDlOlmqW7nfIisDGuFN5vIab/LBo6h5fZ1c+AkQPO07SnCXQe
         Zg+aP9WWiUj6neDGrjZ8UmNJJs1ulspd3kRmIK0WPfxCiPVoSTQR0oD7r9G7S6ees1Rv
         OArA==
X-Forwarded-Encrypted: i=1; AFNElJ9uADtRMJU5Z1gAAmiHagY94eiPhEhddIYxnDXhbjH367ebheG69OPIRlNxkcGrRK7tj7bwNdHF68YnfjKun6t7@lists.infradead.org
X-Gm-Message-State: AOJu0YwzINWyWagRKjhLwGHKKr68BMvaodV2evDGMmJ/lSgxuxpsLbRw
	vn0A4UaSs6Lu62FsKjfYtbfBesKCPnpDu7myRo9k9wZxWKvHVBhLq+FG60AZb7DfwDDDeRm3z/8
	n5SNcjA==
X-Received: from pgbcx10.prod.google.com ([2002:a05:6a02:220a:b0:c79:22b6:a344])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:549d:b0:3a3:602d:a0d8
 with SMTP id adf61e73a8af0-3aa5a8c5818mr3174269637.17.1778071494440; Wed, 06
 May 2026 05:44:54 -0700 (PDT)
Date: Wed, 6 May 2026 05:44:50 -0700
In-Reply-To: <20260506105053.107404-1-alexandru.elisei@arm.com>
Mime-Version: 1.0
References: <20260506105053.107404-1-alexandru.elisei@arm.com>
Message-ID: <afs3wp7xBUf2jYK4@google.com>
Subject: Re: [RFC PATCH] KVM: arm64: Align KVM_EXIT_MEMORY_FAULT error codes
 with documentation
From: Sean Christopherson <seanjc@google.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	tabba@google.com, David.Hildenbrand@arm.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_054457_031391_57AAD103 
X-CRM114-Status: GOOD (  22.51  )
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

On Wed, May 06, 2026, Alexandru Elisei wrote:
> The documentation for KVM_EXIT_MEMORY_FAULT states:
> 
> 'Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that
> it accompanies a return code of '-1', not '0'!  errno will always be set to
> EFAULT or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace
> should assume kvm_run.exit_reason is stale/undefined for all other error
> numbers'.
> 
> where a return code of '-1' is special because according to man 2 ioctl:
> 
> 'On error, -1 is returned, and errno is set to indicate the error'.
> 
> Putting the two together means that the ioctl KVM_RUN must 1) complete with
> an error and 2) that error must must be either EFAULT or EHWPOISON for
> userspace to detect a KVM_EXIT_MEMORY_FAULT VCPU exit.

Yes and no.  The key escape valve we (very deliberately) gave ourselves is this:

  userspace should assume kvm_run.exit_reason is stale/undefined for all other
  error numbers.

As arm64 already does, that clause allows KVM to "speculatively" set exit_reason
to KVM_EXIT_MEMORY_FAULT.  Which is by design.  The userspace flow is intended
to be "if KVM_RUN returns EFAULT or EHWPOISON, then check for KVM_EXIT_MEMORY_FAULT
to see if KVM provided more information about why the EFAULT/EHWPOISON error was
returned".

> On a kvm_gmem_get_pfn() error, gmem_abort() prepares the
> KVM_EXIT_MEMORY_FAULT exit_reason and propagates the error back to
> userspace. kvm_gmem_get_pfn() does not massage the error code, and if the
> error is not -EFAULT or -EHWPOISON, userspace implementing the ABI fails to
> detect the memory fault exit.
> 
> Things get more complicated with kvm_handle_vncr_abort().
> kvm_translate_vncr(), similar to gmem_abort(), prepares the VCPU to exit
> with KVM_EXIT_MEMORY_FAULT and propagates the error code from
> kvm_gmem_get_pfn(). Then kvm_handle_vncr_abort() does a number of things
> based on this specific error code:
> 
> - If it's -EAGAIN, KVM resumes the guest. Note that KVM, when handling a
>   *host* fault on a guest_memfd backed VMA, retries the fault handling if
>   kvm_gmem_get_pfn() returns -EAGAIN.

Totally fine.

> - If it's -ENOMEM, -EFAULT, -EIO or -EHWPOISON, it returns to userspace
>   with 0 (success), meaning that, according to the documentation, userspace
>   will not detect the memory fault exit.

Also totally fine, and working as intended.  KVM_EXIT_MEMORY_FAULT is provided
for scenarios where (a) the issue is likely related to the GPA and (b) userspace
can remedy the underlying issue using the information provided in kvm_run.memory_fault.

ENOMEM doesn't meet (a), and EIO doesn't meet (b) (and probably not (a) in the
vast majority of cases either).

> - If it's -EINVAL, -ENOENT, -EACCESS, KVM injects a synchronous exception
>   back to the guest.
> - If it's -EPERM, KVM injects a permission fault.
> - If the error code is something else, KVM resumes the guest.

All of these are totally fine.  The fact that KVM "scribbled" kvm_run a bit is
a non-issue, because KVM will fill kvm_run with the correct information on the
next userspace exit, or will exit with an error that doesn't utilize kvm_run (in
which case userspace shouldn't be looking at it), or KVM is buggy somewhere else.

