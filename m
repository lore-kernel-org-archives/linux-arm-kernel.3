Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D4BC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHQl5p9sQAY9/zxya+ObUaa13h85sMUF9P0ssFuwzDg=; b=r0GeQ/jP7VMrKA14TEmXbRLBJX
	tzLrZYmvvaR2TAnGWwIvg4h9JxzV7Rm+t45G5pv6qemBamVXjCPQJ5rsjzSs/Zu/IsvhaU/dlknUR
	MDca/LlMOZz/VQ+IlXZ1fF6MJ2PlXxm5GO3Rvr+ZRiR59piyXna8ayfrpEWRXnDjYK0ykYt+mxtYc
	OyOdVcwAz/t2YvaQ3sNlajX0r9Xg3KpsTG9gvL3fQ1tJiQhDl3SDMmX6Q0svFQyCZFb5VllyXE3qp
	+9SISso5CLKT5Zq/RskldIbWGekbxKJUJ4kNG4dky1HWOsuw82X3nCbLfUESLretGcud5QMbRvDJM
	JdcR0dpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90DP-00000005QeZ-1Ifj;
	Tue, 22 Sep 2026 13:07:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90DO-00000005Qdn-0ei7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:07:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AB916024D;
	Tue, 22 Sep 2026 13:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAA91F000FF;
	Tue, 22 Sep 2026 13:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082436;
	bh=aHQl5p9sQAY9/zxya+ObUaa13h85sMUF9P0ssFuwzDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VdlNOHdACDAc7b8xtcwHdLrXhTtZt4/tmONM2O45OuWA7k2PW4mXWxpcwjlhGX88y
	 7pr64y+yxcXtSN3h+sK4hYTZDVwzHIg55H+1w3jq5kqYDVCneoxOoWzpv4JduwXmtZ
	 y+z5DcDaFbJ79zNbKjIlE9ac2nM2KzSwQ6Hv//SM5hKcQMZH6Q2sGrta3SjQ5z6I48
	 O7vcq0cxQ1Tje0vwIkNYafgq/ZKpgxBKRKmMVm91o7gj8nRG63agpj3JY25N9m2PRH
	 cNdG0i6LALMT4QJsSVsmulhpujl0s1R9YKGExxkyvs91i65ihDH+YW/zHMM9WYQuiR
	 dXYIbA1dolPZg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jack Thomson <jackabt@amazon.com>,
	Jack Thomson <jackabt.amazon@gmail.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Leo Soares Passos <Leo.Bras@arm.com>
Subject: Re: [PATCH v2 00/13] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
In-Reply-To: <arJ1BDEzY5CANjjB@gremlin>
References: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
 <yq5abj9p38vq.fsf@kernel.org> <arJ1BDEzY5CANjjB@gremlin>
Date: Tue, 22 Sep 2026 18:37:04 +0530
Message-ID: <yq5a8q4t305j.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

"Lorenzo Stoakes (ARM)" <ljs@kernel.org> writes:

> On Tue, Sep 22, 2026 at 03:28:33PM +0530, Aneesh Kumar K.V wrote:
>> > This is because pKVM instantiates vCPUs upon run,
>> >
>>
>> Can pKVM instantiate the hyp vCPU during pre-faulting ?
>
> It would be an unusual and unexpected thing to do - suddenly a pre-fault
> operation is initialising a vCPU explicitly for pKVM.
>
> A caller is not going to reasonably expect this and might treat a failure to
> pre-alloc as fine to carry on whereas in fact it was a failure to initailised a
> pKVM vCPU.
>
> It'd also require significant changes to how pKVM is set up, right now it's
> hardcoded to be done unconditionally at run via kvm_arch_vcpu_run_pid_change()
> -> pkvm_create_hyp_vcpu(), so all that would have to change and be checked and
> tested and... that'd be really out of scope I think :)
>
> And pre-faulting really makes most sense BEFORE you run a VM. It doesn't make so
> much sense mid-run.
>
> But more fundamentally, the stage 2 page tables, as I understand it, are owned
> by pKVM and so aren't really available to be pre-faulted.
>
> Maybe unprotected-under-pKVM VMs but then it's questionable as to how useful
> that would be given that it would be confusing to users vs. how it works for
> other VMs.
>
> So in general, no I don't think it's a good idea.
>
> And even if we wanted to pursue some version of this, it's _definitely_ out
> of scope for the initial pre-faulting bring-up series.
>
>>
>>
>> > but pre-faulting is  typically performed before a vCPU is run.  It would be confusing and
>> > inconsistent to error out on non-running vCPUs but to pre-fault running
>> > ones.
>>
>>
>> I use KVM pre-faulting when transitioning pages from shared to private
>
> You mean you'd prefer to use? Or you are using it on another arch?
>
>> with CoCo guest. This ensures that a trusted device can DMA to private
>> memory before the guest accesses it.
>
> Hm what do you mean by private memory?
>
> I see:
>
> #ifndef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> {
> 	return false;
> }
> #endif
>
> And only x86 selects KVM_GENERIC_MEMORY_ATTRIBUTES?
>
> Do you mean something else?
>

I am using this with ARM CCA-DA, based on the patch series from Jack Thomson <jackabt.amazon@gmail.com>.

https://gitlab.arm.com/linux-arm/kvmtool-cca/-/commit/80e7aad61c5639de2f0cb4a5525dad0c96156428

We do this while the VM is running.

-aneesh

