Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F34C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hY95K1CcCKhDYLwt00Rk1F86nMWioNB17+UjX7gEkrk=; b=cUlHi5RCDHwwrLGSK0aQJWsqof
	ZyGqdXCFAePPAdgCB5NfMQtRNaoXeb42q321We7QH3iLJ7vv3yUe1lEuCj8IaiL39wOQRv1dqKEKt
	06nKrolVaiA0LTelW4zdrhiPNmcQDXDjZcFmo3IZjBu0vu5eLLEDelMxwU/5oA1G+SHNPgTMT8PZu
	MlzgRM1EcE21zI2HH/MbjjxBgO2ZyImG2VTj0RvZHMPKnBhqgn+qY/8oISbJwMD+J+knk+qR9aBuq
	uCMj7DMz1O+9DpXFJR8oK4OR/ncZGAj55j6TrswkpQuHoqMxBquZx5nHqYhCE2sesjLOa5RpFqYte
	DMRzui5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9L0P-000000082p5-2tXn;
	Wed, 23 Sep 2026 11:19:17 +0000
Received: from out-110.mta0.migadu.com ([2001:41d0:1004:224b::6e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kzx-000000082dS-2lRC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:18:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=89HG7hn4Kzj5UE8Z7ANkfgcmDmkP7G7K3Oq+gIvcB8g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790162327; v=1; x=1790767127;
 b=KdqMPrekLrC/5IiOtG9WhZ7CjRLE8f3T2sv3gCEeaA8Kk8LjD0TYolBhewHVPARf57Irh/EI
 FyJd6Yqvzgh1E3U1gGqmPr/GgdXK42ErwaxJC0qice4LuWuIc4/9F9bHNe9o/d/FQd+DQSiHL/h
 UvvVSlQwLA/xPluADfiSK/9g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ab1391608bb815d2;
	Wed, 23 Sep 2026 11:18:47 +0000
X-Mizu-Trace-ID: ab1391608bb815d2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so4869e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzxNdQJTQExh/Hg0aOxgXu9bF1/0rDCYwlKPC3Ue9HiJoaK6LNL7IL6Nu3BAj/gCVMYH+Xq+DwSrTqUWk2DZ0dO@lists.infradead.org
X-Gm-Message-State: AFuF++l2aaEbt3H43cl3NJveXmqEPasathGek8py0FCzpbNkZ/hy5uxa
	NmW9LzCfk0BjRB6/i4axLA2esvMdQvRFAUqTfaTJe8OAMnUL/vxVoLNdleQrr+8kHD0+zhKrPf0
	hctihgWI3HzFvjDmgtPW7x1j7nEuZV48BxdF9TQHN
X-Received: by 2002:a05:6512:acd:b0:5b8:d049:c45f with SMTP id
 2adb3069b0e04-5b8d8853d0fmr127952e87.14.1790162326446; Wed, 23 Sep 2026
 04:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org> <20260922-kvm-arm-prefault-v3-10-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-10-787bd3bc7e3f@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 12:18:10 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyCc=T+HkvWv1g2Fg3OxGaa1i8Hdv296ivPc94jQqZq9g@mail.gmail.com>
X-Gm-Features: AcwNN1XC5SLsTqs8zqxJrWyrAoHwz-wo27sOUtBe-7VaIdl2y8EQBRd7i4qQqDs
Message-ID: <CA+EHjTyCc=T+HkvWv1g2Fg3OxGaa1i8Hdv296ivPc94jQqZq9g@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] KVM: arm64: Implement KVM_PRE_FAULT_MEMORY
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_041850_315816_09835753 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

Hi Lorenzo,

On Tue, 22 Sep 2026 15:18:04 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> +static long __pre_fault_s2(struct kvm_s2_mmu *mmu, struct kvm_vcpu *vcpu,
> +                           gpa_t gpa, struct kvm_memory_slot *memslot, s8 level)
[...]
> +        if (is_gmem)
> +                ret = gmem_abort(&s2fd, &result);
> +        else
> +                ret = user_mem_abort(&s2fd, &result);

When kvm_gmem_get_pfn() fails, gmem_abort() calls
kvm_prepare_memory_fault_exit() before returning, which on this path
writes vcpu->run's exit_reason and memory_fault fields outside
KVM_RUN. If that happens on a vCPU between its KVM_EXIT_MMIO and its
next KVM_RUN, kvm_arch_vcpu_ioctl_run() reads KVM_EXIT_MEMORY_FAULT
instead, skips kvm_handle_mmio_return(), and the guest repeats the
access. Could gmem_abort() skip that exit when result is set?
user_mem_abort() never writes kvm_run.

Cheers,
/fuad

