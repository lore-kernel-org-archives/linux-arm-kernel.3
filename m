Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F59C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUFFiUTwDIQTjkS/XGuKJUupkz/Ptibx0+U0nupMqZk=; b=DDi2BaFc8WCym0/f3YUd8p1d8R
	8ZpG4lYTtKzWX1xS4/gdrrv19WnstvqM2tsmnC5hUAXgdjMUf2+94VKKoKEhmqHlapjp3S5MHguRT
	bpW1BxM1bWWd3aTYluZS2py23CxkPlvBqn4QS/7mLkh5cOejsbAzWUPKcmSQ0OP8CKvMlDKSHeX/Y
	5jzs4d9FWf1vGBhKslIus7KySG7BNV140WNgWNZX7a37hp+C0VnOh8tJyTVUevthgW9PJzWKVVFY5
	cUyU/5f8UUlJBYFCaEeixSuZl56ETYJkZy5fAIzSHasb5YedSXRjCWjEl+OSO2WsE9mlYkFrpjamC
	eoPSor0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBQc-00000006tuD-1UIx;
	Tue, 24 Jun 2025 21:43:42 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9WI-00000006d5A-3XHO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:41:28 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so4354374b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750794085; x=1751398885; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FUFFiUTwDIQTjkS/XGuKJUupkz/Ptibx0+U0nupMqZk=;
        b=3QVQHLxQCFj2Fs+vatSfOzQiVSJwyQPdOt/Skk2S5LVyN2SR25qg8zGy2AUZvf7F0W
         hWQsuR9FPfunicxeoa8I/kXehKIEdHiJ3ZQlEIruDb43kMLBNIcnrm6DZmpHOECdNjp7
         kUj+/yYDKYUjNGzKeSeceLsbXe5lSR/YTQYFYkOT2oOTuhsB6d/5DREDeogS6RRMru10
         Bj4mpP2QA3SI5riXwfvhN+uTu1gg5W8YKBIbR0HctXS0itlrHrIeXS6XQP5OTBdRl3C+
         zqPiqXMZKiHrqXHwT/yHhH3uDRsrFQKh2YDx9fZvJeFCdIYGoifICg8zsdxksYWOu85w
         3Auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794085; x=1751398885;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FUFFiUTwDIQTjkS/XGuKJUupkz/Ptibx0+U0nupMqZk=;
        b=hLp8xMrDQukBcm9VAJqjGpsPrF6EfRMeg5ayjkMnU0aFnOXwyah5rqbuVwvffacY8b
         qbLTXEHgZuxwTAgMZtxqCGvRumTioKtAhA0ipSCZL8w9QUgzLRb2ywnucFYcwdyAEu0d
         m7tcmi/wrIrY+ZUHdmsedTvj8D8EH8EIaX+JTRAKBKGKCteusFeVVdsTCB/5znfuUKcT
         eDe7GtLBqy9h+GLrSl9l6TzJ431p9/kEHzsnHjyCv3NWx0UUgMOlChOvlLLxnKFYdQ7Z
         Fpo9Blr1OhxIGIcVcNRa5xk9OILFmnk0SB4etajCWLT6e+nSmBK8uSTPyMsXQmGaUo2a
         icrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB2sVGZYtZtA+jkxpiosc2xzIBcsgplJrFfLvx58IhP6VQg2pSlWlOxb8PD0QpfluHA/XzxIvxIsXMcTG4r20G@lists.infradead.org
X-Gm-Message-State: AOJu0YwPXNkEf2GRbHjaaMgwYFL1qqXRVASlCyiDfIWo3wFaj7Fdo9We
	u8du3vipc9Y5KUKXljguRhQgy6ymRukYSdq8EFyjcstr4PRrbH9MtMGYE+hDr8X8Skb6T5GrUos
	mvRPZAQ==
X-Google-Smtp-Source: AGHT+IHYexPIgCTXbHegrNWRwV9PAsICfBY+CW50dlQj/EuWE5JzEYSKqjcY5P3xX5xOKDb9+UElHwxg8eM=
X-Received: from pfrb8.prod.google.com ([2002:aa7:8ec8:0:b0:746:32ae:99d5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:170d:b0:748:1bac:ad5f
 with SMTP id d2e1a72fcca58-74ad455d619mr461113b3a.12.1750794085384; Tue, 24
 Jun 2025 12:41:25 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:38:26 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079267460.517177.7949210108988821172.b4-ty@google.com>
Subject: Re: [PATCH v3 00/13] KVM: Make irqfd registration globally unique
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_124126_878570_490B77B7 
X-CRM114-Status: GOOD (  12.14  )
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

On Thu, 22 May 2025 16:52:10 -0700, Sean Christopherson wrote:
> Non-KVM folks,
> 
> I am hoping to route this through the KVM tree (6.17 or later), as the non-KVM
> changes should be glorified nops.  Please holler if you object to that idea.
> 
> Hyper-V folks in particular, let me know if you want a stable topic branch/tag,
> e.g. on the off chance you want to make similar changes to the Hyper-V code,
> and I'll make sure that happens.
> 
> [...]

Applied to kvm-x86 irqs, thanks!

[01/13] KVM: Use a local struct to do the initial vfs_poll() on an irqfd
        https://github.com/kvm-x86/linux/commit/283ed5001d68
[02/13] KVM: Acquire SCRU lock outside of irqfds.lock during assignment
        https://github.com/kvm-x86/linux/commit/140768a7bf03
[03/13] KVM: Initialize irqfd waitqueue callback when adding to the queue
        https://github.com/kvm-x86/linux/commit/b5c543518ae9
[04/13] KVM: Add irqfd to KVM's list via the vfs_poll() callback
        https://github.com/kvm-x86/linux/commit/5f8ca05ea991
[05/13] KVM: Add irqfd to eventfd's waitqueue while holding irqfds.lock
        https://github.com/kvm-x86/linux/commit/86e00cd162a7
[06/13] sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
        https://github.com/kvm-x86/linux/commit/867347bb21e1
[07/13] xen: privcmd: Don't mark eventfd waiter as EXCLUSIVE
        https://github.com/kvm-x86/linux/commit/a52664134a24
[08/13] sched/wait: Add a waitqueue helper for fully exclusive priority waiters
        https://github.com/kvm-x86/linux/commit/0d09582b3a60
[09/13] KVM: Disallow binding multiple irqfds to an eventfd with a priority waiter
        https://github.com/kvm-x86/linux/commit/2cdd64cbf990
[10/13] KVM: Drop sanity check that per-VM list of irqfds is unique
        https://github.com/kvm-x86/linux/commit/b599d44a71f1
[11/13] KVM: selftests: Assert that eventfd() succeeds in Xen shinfo test
        https://github.com/kvm-x86/linux/commit/033b76bc7f06
[12/13] KVM: selftests: Add utilities to create eventfds and do KVM_IRQFD
        https://github.com/kvm-x86/linux/commit/74e5e3fb0dd7
[13/13] KVM: selftests: Add a KVM_IRQFD test to verify uniqueness requirements
        https://github.com/kvm-x86/linux/commit/7e9b231c402a

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next

