Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC08E9A037
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 19:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mGOCCVLTr299NsqFOYVBdQ9l7JaHEtHLFfNu9E/0HQ=; b=vbMWX3ENUpNb0lxS0be3lnKJzh
	mhAsAST+9njnGv5N6IHEapBnn84CUotar9XqO5LBLvYwHrwxQ4ZErPSA3qGageSGN+KG6X8XYM+5G
	TOXFf6dRKlRlxMweqjr4EwugEbeVWE0JPjDX9+gUXXx0sVpJDh1LdV6uZmUHgeK9ue5vCy4nrS3bc
	v9HqTrnj5F8FVwp/YgE4d2DWhwXbpwayVQoih4OZS1yrtVhep4riKkCSUbDea4Idmv0g42UMDMMld
	mFGz/lQ1KhcLXfxwGzmdUsIh+vbS+O/G3MJYmrkllxQRj0BdlncOuzA5o63FNAErPyS6Xv5oD3mps
	FDAwC03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQPn-00000008mgT-0S4a;
	Tue, 17 Feb 2026 19:07:20 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQPj-00000008mg2-1EiY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 19:07:16 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2a943e214daso217353945ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771355231; x=1771960031; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mGOCCVLTr299NsqFOYVBdQ9l7JaHEtHLFfNu9E/0HQ=;
        b=sWhptFkZRFMjzAG7pubJcJ8urzElTi4mI13CBMN5ixB2m4btBU0cj0Y3Rkdno9gyRC
         QCTn5yZTFA1shFmUedwiTV3bqMlVmxuIFF7qOd6fa6GFHo8+qABZvBI0I9pfGxjOEdDC
         mCiXJl3Z+Vwic8ZzbjO09IO+fE42Ek1ifx+IpX0f1742f7mGQOaftbzYBQCNg+rbUQiV
         T4gPRBKCqAPUYpzEJMiOkIVeleVfXLsFuZbkqKY/B/AM0rLGt1FBUGrMf2OiQA7astWY
         nkdVl8V/Vm47m0JNeSPIUJcDy+fnb6M/bIoUUxZafe5ROixef5noPXu+wf/+oGRz0zQr
         RcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771355231; x=1771960031;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mGOCCVLTr299NsqFOYVBdQ9l7JaHEtHLFfNu9E/0HQ=;
        b=CH42nvlMXY5FG9kEZ2wr4ktLzDxNkRIWd30SoXs0k7yD38QVgomhBz+dooxojYHqXe
         D+47kJkTlhY8QrwUyezlaYrUpj898LqIgBkgazV+0B61TwUfOoXoySXZFvNJnD7ujK7y
         Jd7RMi3SPZ6NBY3b5liyJV3q+N3tVSAaS22CH2n8Mq/hyXJ5arLhnbdLr7QisAQWnSgM
         YwR8nfJKJcKx9pEMpsr1KXlaIDpOHEJjIfPaevhR/RVttZqdPGFUlEmCFFJZTEtGDyp7
         fln60FVDOKrAD8peU7tKmFVeZ7L4+KF/r+elVZbD2djFjR3DsXP4wT9BG9t7jUxHl4NU
         UnBA==
X-Forwarded-Encrypted: i=1; AJvYcCVj7z9dgac6JenAtJuw6MvG05+4NcaUe77Ui0tAiZCJmL2GqQb9CNrUWOtuuem5sStWRu2kMjhWe4NwqGwe6niL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0kpgDN0hR1nr+JS7t1h8+T/EZYQjTtGHek2UPSS2UQdnpUaeQ
	wp5PYq4S0mobtI/CEYdinVS7vfuGKhtYMUd/qZkZvrvSkYX4YgfnV7yTfttpSHQcljrjYbvFeJz
	us8E1oQ==
X-Received: from plbkp8.prod.google.com ([2002:a17:903:2808:b0:2a9:5b22:145a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:f84:b0:2aa:e574:c9f7
 with SMTP id d9443c01a7336-2ab4d0aed90mr146214705ad.57.1771355230961; Tue, 17
 Feb 2026 11:07:10 -0800 (PST)
Date: Tue, 17 Feb 2026 11:07:09 -0800
In-Reply-To: <dcbd7a58-c961-4510-ae48-ef7fd4f4d75c@amazon.com>
Mime-Version: 1.0
References: <20250909100007.3136249-1-keirf@google.com> <20250909100007.3136249-5-keirf@google.com>
 <a84ddba8-12da-489a-9dd1-ccdf7451a1ba@amazon.com> <aY-x0OlJQEqInyNF@google.com>
 <dcbd7a58-c961-4510-ae48-ef7fd4f4d75c@amazon.com>
Message-ID: <aZS8XXOW7vhMkNWQ@google.com>
Subject: Re: [PATCH v4 4/4] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
From: Sean Christopherson <seanjc@google.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: Keir Fraser <keirf@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Li RongQing <lirongqing@baidu.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_110715_819852_4698783B 
X-CRM114-Status: GOOD (  23.75  )
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

On Mon, Feb 16, 2026, Nikita Kalyazin wrote:
> On 13/02/2026 23:20, Sean Christopherson wrote:
> > On Fri, Feb 13, 2026, Nikita Kalyazin wrote:
> > > I am not aware of way to make it fast for both use cases and would be more
> > > than happy to hear about possible solutions.
> > 
> > What if we key off of vCPUS being created?  The motivation for Keir's change was
> > to avoid stalling during VM boot, i.e. *after* initial VM creation.
> 
> It doesn't work as is on x86 because the delay we're seeing occurs after the
> created_cpus gets incremented

I don't follow, the suggestion was to key off created_vcpus in
kvm_io_bus_register_dev(), not in kvm_swap_active_memslots().  I can totally
imagine the patch not working, but the ordering in kvm_vm_ioctl_create_vcpu()
should be largely irrelevant.

Probably a moot point though.

> so it doesn't allow to differentiate the two
> cases (below is kvm_vm_ioctl_create_vcpu):
> 
> 	kvm->created_vcpus++; // <===== incremented here
> 	mutex_unlock(&kvm->lock);
> 
> 	vcpu = kmem_cache_zalloc(kvm_vcpu_cache, GFP_KERNEL_ACCOUNT);
> 	if (!vcpu) {
> 		r = -ENOMEM;
> 		goto vcpu_decrement;
> 	}
> 
> 	BUILD_BUG_ON(sizeof(struct kvm_run) > PAGE_SIZE);
> 	page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
> 	if (!page) {
> 		r = -ENOMEM;
> 		goto vcpu_free;
> 	}
> 	vcpu->run = page_address(page);
> 
> 	kvm_vcpu_init(vcpu, kvm, id);
> 
> 	r = kvm_arch_vcpu_create(vcpu); // <===== the delay is here
> 
> 
> firecracker   583 [001]   151.297145: probe:synchronize_srcu_expedited:
> (ffffffff813e5cf0)
>     ffffffff813e5cf1 synchronize_srcu_expedited+0x1 ([kernel.kallsyms])
>     ffffffff81234986 kvm_swap_active_memslots+0x136 ([kernel.kallsyms])
>     ffffffff81236cdd kvm_set_memslot+0x1cd ([kernel.kallsyms])
>     ffffffff81237518 kvm_set_memory_region.part.0+0x478 ([kernel.kallsyms])
>     ffffffff81264dbc __x86_set_memory_region+0xec ([kernel.kallsyms])
>     ffffffff8127e2dc kvm_alloc_apic_access_page+0x5c ([kernel.kallsyms])
>     ffffffff812b9ed3 vmx_vcpu_create+0x193 ([kernel.kallsyms])
>     ffffffff8126788a kvm_arch_vcpu_create+0x1da ([kernel.kallsyms])
>     ffffffff8123c54c kvm_vm_ioctl+0x5fc ([kernel.kallsyms])
>     ffffffff8167b331 __x64_sys_ioctl+0x91 ([kernel.kallsyms])
>     ffffffff8251a89c do_syscall_64+0x4c ([kernel.kallsyms])
>     ffffffff8100012b entry_SYSCALL_64_after_hwframe+0x76 ([kernel.kallsyms])
>               6512de ioctl+0x32 (/mnt/host/firecracker)
>                d99a7 std::rt::lang_start+0x37 (/mnt/host/firecracker)
> 
> Also, given that it stumbles after the KVM_CREATE_VCPU on ARM (in
> KVM_SET_USER_MEMORY_REGION), it doesn't look like a universal solution.

Hmm.  Under the hood, __synchronize_srcu() itself uses __call_srcu, so I _think_
the only practical difference (aside from waiting, obviously) between call_srcu()
and synchronize_srcu_expedited() with respect to "transferring" grace period
latency is that using call_srcu() could start a normal, non-expedited grace period.

IIUC, SRCU has best-effort logic to shift in-flight non-expedited grace periods
to expedited mode, but if the normal grace period has already started the timer
for the delayed invocation of process_srcu(), then SRCU will still wait for one
jiffie, i.e. won't immediately queue the work.

I have no idea if this is sane and/or acceptable, but before looping in Paul and
others, can you try this to see if it helps?

diff --git a/include/linux/srcu.h b/include/linux/srcu.h
index 344ad51c8f6c..30437dc8d818 100644
--- a/include/linux/srcu.h
+++ b/include/linux/srcu.h
@@ -89,6 +89,8 @@ void __srcu_read_unlock(struct srcu_struct *ssp, int idx) __releases(ssp);
 
 void call_srcu(struct srcu_struct *ssp, struct rcu_head *head,
                void (*func)(struct rcu_head *head));
+void call_srcu_expedited(struct srcu_struct *ssp, struct rcu_head *rhp,
+                        rcu_callback_t func);
 void cleanup_srcu_struct(struct srcu_struct *ssp);
 void synchronize_srcu(struct srcu_struct *ssp);
 
diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index ea3f128de06f..03333b079092 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -1493,6 +1493,13 @@ void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 }
 EXPORT_SYMBOL_GPL(call_srcu);
 
+void call_srcu_expedited(struct srcu_struct *ssp, struct rcu_head *rhp,
+                        rcu_callback_t func)
+{
+       __call_srcu(ssp, rhp, func, rcu_gp_is_normal());
+}
+EXPORT_SYMBOL_GPL(call_srcu_expedited);
+
 /*
  * Helper function for synchronize_srcu() and synchronize_srcu_expedited().
  */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 737b74b15bb5..26215f98c98f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6036,7 +6036,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
        memcpy(new_bus->range + i + 1, bus->range + i,
                (bus->dev_count - i) * sizeof(struct kvm_io_range));
        rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
-       call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
+       call_srcu_expedited(&kvm->srcu, &bus->rcu, __free_bus);
 
        return 0;
 }

