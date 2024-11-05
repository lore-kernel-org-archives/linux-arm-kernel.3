Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97952D1CA31
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 05:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6I0lsXsH1rGJHzKMzLgK+XDkNKkWp36WmP2kFDs1jI=; b=CkYBf+w8JssWHhReKBlA6XTLas
	PE+dW+vHQm5JE1CuKUtIaCHdGKjSmHmWPJO+58sUllhS6iatHAaC+8ORZmWolL2Kjzo+ydrfUOKno
	H/ZXUzndEnqqKZ17ziCNZYKKpBvMzBrY+QACFbT0ZqszQrcG26eS3KWs35HITsf05rClkYm/m6+YZ
	ZhcnFCFv8SSIq8mB6lGKaystui0Y1MvKisUgABWV75OVZWS1gwuuMMlFx8BdPQPxf7jvpT8pnc0FI
	ingBNKkSv0S9Bo/oUzFVjP1b4T31veJasjAE2GikIFdw16/pf6DKtHqPnD3sQIVeeV1p5VjQNN/Fz
	qVgUqNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8CXU-0000000Fz3B-1y4v;
	Tue, 05 Nov 2024 05:55:40 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8CVk-0000000FyYb-0o03
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 05:53:53 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea9618de40so29701187b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 21:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730786030; x=1731390830; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o6I0lsXsH1rGJHzKMzLgK+XDkNKkWp36WmP2kFDs1jI=;
        b=UiSu5jmxrCPFqG4AEvbwHH3d3VfWghekgqNWCcEG+JSkA3CBDgpLA//eV1r2nkkFBn
         MoyuQz4IugR6z3ZAIb9LIRT5Ne8jwIRHplTKhpMS2vp/VbQVK5L/Q2xJOUAxIdzSi8HG
         /NT3t+1ZO/9HFcSgKhYN4qbdxm5qk90cphbN7czUHl5tuymOqF7U/+quy6x+u+x1ZNew
         ABYHJ6UssR0EtkWX/8Qr7hhH4ztS3+eEfBHgHr88d7FMacD3myqJFffBQADcY+YiB4fK
         PEymEb5kOeXHZ3Ke0jsabTOSnRtHYE00KoIdw+JwDjocIMpEEcog3ecMoA26GsIzrdKB
         MzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786030; x=1731390830;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6I0lsXsH1rGJHzKMzLgK+XDkNKkWp36WmP2kFDs1jI=;
        b=aB70TDIDuWX1ZYd042iXAGrDS5Csr3KynL2uMQCooojTSb9EB2ek9YADf/m5zv2v+n
         t/tnEmJm6avSdAI8kLEaJ1CysSgehkXcMWSAbUUtQLJtXU26gcWDxrbA/YY7+L+gLRgF
         9p/y1t+5LyF4Tho2c9iqJq1ymKRz4l9h8xvWAa80UsVfZfhZfrcRizt1asKw8sgd57pl
         TKsyqJZYK/IVpCBzzcYhdLgIpiRtpAagpgVxA1iF89fbHMo81orkqvwNphzOY/GQ2Iqw
         4boLJOzKEtXWavJZReG8ldnM/6a/Ucy4UKNDshAJoAjDrJxMDbhm0PWqRCBvLHhbdXdt
         +jdQ==
X-Gm-Message-State: AOJu0YyylxYdr3hpH3sPL3GgK+DBjcNa+mx7eGm+7S1NEJDaN9UvAcUq
	EzJX8P1f3YU3QsfOi3MoOVkd/AUdfi/ZMgfzhrqW5EOYl3NHGk6IPNMC7WS15KvSCJP4347hnS0
	g8Q==
X-Google-Smtp-Source: AGHT+IHmt5sO/CGCgduHfJxMGbReWDqaMZI7StkG46sJTWcczU8fUEuPHD4g/HJnJzDHoYjdX9OGGAkVpzc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:4489:b0:6db:c6eb:bae9 with SMTP id
 00721157ae682-6e9d898f08bmr16943867b3.2.1730786030202; Mon, 04 Nov 2024
 21:53:50 -0800 (PST)
Date: Mon, 4 Nov 2024 21:53:48 -0800
In-Reply-To: <173039503553.1508387.3074658713815866060.b4-ty@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <173039503553.1508387.3074658713815866060.b4-ty@google.com>
Message-ID: <Zymy7M5dHs6dWUmu@google.com>
Subject: Re: [PATCH v3 00/14] KVM: selftests: Morph max_guest_mem to mmu_stress
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_215352_254686_376146BC 
X-CRM114-Status: GOOD (  16.21  )
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

On Thu, Oct 31, 2024, Sean Christopherson wrote:
> On Wed, 09 Oct 2024 08:49:39 -0700, Sean Christopherson wrote:
> > The main purpose of this series is to convert the max_guest_memory_test
> > into a more generic mmu_stress_test.  The basic gist of the "conversion"
> > is to have the test do mprotect() on guest memory while vCPUs are
> > accessing said memory, e.g. to verify KVM and mmu_notifiers are working
> > as intended.
> > 
> > Patches 1-4 are a somewhat unexpected side quest.  The original plan was
> > that patch 3 would be a single patch, but things snowballed.
> > 
> > [...]
> 
> Applied to kvm-x86 selftests, with the typo fixup pointed out by James.  Thanks!
> 
> [01/14] KVM: Move KVM_REG_SIZE() definition to common uAPI header
>         https://github.com/kvm-x86/linux/commit/5e07fd0bf516
> [02/14] KVM: selftests: Disable strict aliasing
>         https://github.com/kvm-x86/linux/commit/d1ce2bcd8d2e
> [03/14] KVM: selftests: Return a value from vcpu_get_reg() instead of using an out-param
>         https://github.com/kvm-x86/linux/commit/5c6c7b71a45c
> [04/14] KVM: selftests: Assert that vcpu_{g,s}et_reg() won't truncate
>         https://github.com/kvm-x86/linux/commit/6aa2df3eb90b
> [05/14] KVM: selftests: Check for a potential unhandled exception iff KVM_RUN succeeded
>         https://github.com/kvm-x86/linux/commit/be9f2746d20b
> [06/14] KVM: selftests: Rename max_guest_memory_test to mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/06694f27cfcc
> [07/14] KVM: selftests: Only muck with SREGS on x86 in mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/8556ce365a07
> [08/14] KVM: selftests: Compute number of extra pages needed in mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/c7b7876ac5d4
> [09/14] KVM: sefltests: Explicitly include ucall_common.h in mmu_stress_test.c
>         https://github.com/kvm-x86/linux/commit/a657856469e1
> [10/14] KVM: selftests: Enable mmu_stress_test on arm64
>         https://github.com/kvm-x86/linux/commit/1e53cde06102
> [11/14] KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/8630563012b9
> [12/14] KVM: selftests: Precisely limit the number of guest loops in mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/3d4585c220dc
> [13/14] KVM: selftests: Add a read-only mprotect() phase to mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/eaafeebca75a
> [14/14] KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)
>         https://github.com/kvm-x86/linux/commit/a3cd5c187742

As mentioned later in the thread[*], I dropped this series from the 6.13 queue
and will instead target 6.14.

I did however grab the no-strict-aliasing fix for 6.12, and tagged it for stable.
There's no reason to wait to land that commit, and I definitely have no desire to
ever debug that mess again.

[02/14] KVM: selftests: Disable strict aliasing
      https://github.com/kvm-x86/linux/commit/5b188cc4866a

[*] https://lore.kernel.org/all/ZyT61FF0-g8gKZfc@google.com

