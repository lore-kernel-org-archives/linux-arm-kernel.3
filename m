Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3434CF45B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjcQk0a1UAYd4d2F3ain9c0ugcRpjACAg8kxbdTJqns=; b=nQY8FUA1z4LTKLre9j2cmx7uO0
	blkU2VFbpSsGDpNmw/yimfQ3/1Sc21AYeyPXmK8V+cFnMgRhTaWWx0YnhjdPCMS8K2CKQH0RnXMpI
	YDUmB7uGo70voLo6pOz/bsmczoIgJVTMMy4LbxXQFZZYaSINDJA/w6WBmldJc0+xIpuzbq+aG5QYf
	53teWer7KMtyac9qiI/roULuov2bw0Mof4mlqcLwK+NvVeQnBlLtgzQe2ejCvo7rjjlbrFUUF7Dmw
	bNSVfTgLEUg9CgmaDikK6Y5p/uEL1FWwBM/s58lHftXNNZg4nZDbE49dccO/zOU9IiKengS/ZSEes
	jDaHgEOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLum-00000005s5i-21E8;
	Mon, 12 Jan 2026 17:41:16 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLuj-00000005s4M-3Sl1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:41:15 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso5152348a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768239673; x=1768844473; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GjcQk0a1UAYd4d2F3ain9c0ugcRpjACAg8kxbdTJqns=;
        b=J+729f5vRRuC/i+RHvoiRu4y+y6GuGkOZ/cv8eKI++t2CLUJxcpVGRg8AMAB/uXXEH
         /GbGvWm8Fs21QTjtv5Q6abXgl90s4vdffCj62Fb2N2vi691qIUSCXmStyC7T8AIxLDKu
         RcY/D7tsPx40OVYksFIwkbFeV30giYEJKCfzaiZn9wzZ0sNJ+QYD7PQlR6FKgERpaTgl
         MB6zhBXUBSi8FPilUKr4xjgy2OnfEZgmOoPKnMRm5FBd2GwNzmHq+FXr7oJfqFzesx3N
         E0dMx92LBHBXf5TDfFcEpRolMW6MElsqWpzFSMttLem9Wt8e460YQBv8K4PolvKlD3Bp
         XbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239673; x=1768844473;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjcQk0a1UAYd4d2F3ain9c0ugcRpjACAg8kxbdTJqns=;
        b=uuDZK2I0Z/cLFc+bJZYeYArqK1KaNx3UcUvIB/iLkaDJON5IgB6jF/pVfx5r56uR5a
         ews/eUCap6ABfHBY0pGgNAdl4wzytk5+OQ38NBBrNl/CZR2nigx/V+2ipwrpR5fB2gQ3
         T79rOleLFt1HvuxCreu4Wl2xU3VVyk2rYeRtmkcTEVn28GOZ/0+CSO24k686w5qbU22y
         0dLg4IbrVblRILiQLGJeL31XVUV4CoJDqXBgxNy1w5OULsNeneljBou/fjk3vejLPvht
         HLt1v4m6htFM+NPjkmxEVHNWtfhJzH4RPmmfZ2r1WCT+bmSmF781ClJ2nT59P3zZ5A/I
         jUbg==
X-Forwarded-Encrypted: i=1; AJvYcCWNbr9FbVFoXd0nJY3DShdZNUhfkGWCTu24Ko8r8fT0SE4Ak2rVFyn+NL5HQ6lB2LlTBjKsLkSGyJbeuosIFuyI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4URowtt1n4UILSnuqhYvziduKZWPOA33D8YkPyk49JM+443KW
	IMphm59o77gwHYYlr2Gm83z9JXL592V7+SP+IItcz4E5xqXk6ozDXzKgUYsUiQKORvdOngk9GcX
	0cDV1yA==
X-Received: from pjtz17.prod.google.com ([2002:a17:90a:cb11:b0:34e:6306:8cc1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5105:b0:340:c094:fbff
 with SMTP id 98e67ed59e1d1-350fd17061fmr123119a91.10.1768239672675; Mon, 12
 Jan 2026 09:41:12 -0800 (PST)
Date: Mon, 12 Jan 2026 09:38:50 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <176823927928.1374831.6143260021717522522.b4-ty@google.com>
Subject: Re: [PATCH v4 00/21] KVM: selftests: Add Nested NPT support
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_094113_867841_2BC66617 
X-CRM114-Status: GOOD (  13.65  )
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

On Tue, 30 Dec 2025 15:01:29 -0800, Sean Christopherson wrote:
> Yosry's series to add support for nested NPT, and extends vmx_dirty_log_test
> and kvm_dirty_log_test (with -n, using memstress) to cover nested SVM.
> 
> Note, I'm mildly concerned the last patch to extend nested_dirty_log_test to
> validate KVM's handling of READ faults could be flaky, e.g. maybe if someone
> is running the test under heavy memory pressure and the to-be-access page is
> swapped between the write-from-host and read-from-guest?  But unless someone
> knows/shows it'll be flaky, I'm inclined to apply it and hope for the best.
> 
> [...]

Applied everything except the last patch to kvm-x86 selftests.  I'll post a new
version separately since we've had a lot of back-and-forth on that one.

Oh, and I fixed up the ncr3_gpa goof in "Add support for nested NPTs".

[01/21] KVM: selftests: Make __vm_get_page_table_entry() static
        https://github.com/kvm-x86/linux/commit/69e81ed5e6a5
[02/21] KVM: selftests: Stop passing a memslot to nested_map_memslot()
        https://github.com/kvm-x86/linux/commit/97dfbdfea405
[03/21] KVM: selftests: Rename nested TDP mapping functions
        https://github.com/kvm-x86/linux/commit/60de423781ad
[04/21] KVM: selftests: Kill eptPageTablePointer
        https://github.com/kvm-x86/linux/commit/b320c03d6857
[05/21] KVM: selftests: Stop setting A/D bits when creating EPT PTEs
        https://github.com/kvm-x86/linux/commit/3cd5002807be
[06/21] KVM: selftests: Add "struct kvm_mmu" to track a given MMU instance
        https://github.com/kvm-x86/linux/commit/9f073ac25b4c
[07/21] KVM: selftests: Plumb "struct kvm_mmu" into x86's MMU APIs
        https://github.com/kvm-x86/linux/commit/11825209f549
[08/21] KVM: selftests: Add a "struct kvm_mmu_arch arch" member to kvm_mmu
        https://github.com/kvm-x86/linux/commit/3d0e7595e810
[09/21] KVM: selftests: Move PTE bitmasks to kvm_mmu
        https://github.com/kvm-x86/linux/commit/6dd70757213f
[10/21] KVM: selftests: Use a TDP MMU to share EPT page tables between vCPUs
        https://github.com/kvm-x86/linux/commit/f00f519cebcd
[11/21] KVM: selftests: Stop passing VMX metadata to TDP mapping functions
        https://github.com/kvm-x86/linux/commit/e40e72fec0de
[12/21] KVM: selftests: Add a stage-2 MMU instance to kvm_vm
        https://github.com/kvm-x86/linux/commit/8296b16c0a2b
[13/21] KVM: selftests: Reuse virt mapping functions for nested EPTs
        https://github.com/kvm-x86/linux/commit/508d1cc3ca0a
[14/21] KVM: selftests: Move TDP mapping functions outside of vmx.c
        https://github.com/kvm-x86/linux/commit/07676c04bd75
[15/21] KVM: selftests: Allow kvm_cpu_has_ept() to be called on AMD CPUs
        https://github.com/kvm-x86/linux/commit/9cb1944f6bf0
[16/21] KVM: selftests: Add support for nested NPTs
        https://github.com/kvm-x86/linux/commit/753c0d5a507b
[17/21] KVM: selftests: Set the user bit on nested NPT PTEs
        https://github.com/kvm-x86/linux/commit/251e4849a79b
[18/21] KVM: selftests: Extend vmx_dirty_log_test to cover SVM
        https://github.com/kvm-x86/linux/commit/6794d916f87e
[19/21] KVM: selftests: Extend memstress to run on nested SVM
        https://github.com/kvm-x86/linux/commit/59eef1a47b8c
[20/21] KVM: selftests: Rename vm_get_page_table_entry() to vm_get_pte()
        https://github.com/kvm-x86/linux/commit/e353850499c7
[21/21] KVM: selftests: Test READ=>WRITE dirty logging behavior for shadow MMU
 	*** NOT APPLIED ***

--
https://github.com/kvm-x86/linux/tree/next

