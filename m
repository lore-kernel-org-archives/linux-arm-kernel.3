Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFB2C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMVp8M7oG4PVrZQYe0ddJ1sUAh7YKAS+62p52GA/7LA=; b=0F2PfgZiI0eiYKmKeepausLdGN
	dSxLjHxpdYZuPrHQfOOUz2/je3+6NpTT5DEjwH99/Hq8xra5rlpqB9bRMJTDxYYvRScZsEmELqRK7
	zVuTolu+OIectWPdLq/xV0ZL6PZzFmHzU3SHaMcISoHyY8DuGrVqlYyRy9mIjpP+qGqMqyOaHWOZr
	avlUcdSRrDsQW8ATLeyc9c8qYW9kXmS17P94ZM6Vvq9hBzGPT2FOCjsGNDpC+LahIeU0qZ13PoxC5
	FBQ8HnLVFL0eu3/T6I7odd3uAagU/dxjnNikwR0CnvidubLmsCQobzvCT0VVoogmVnRAzWkHthdQN
	VaVYgkbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9S5g-00000009HLr-3toc;
	Wed, 23 Sep 2026 18:53:13 +0000
Received: from out-160.mta1.migadu.com ([95.215.58.160] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9S5c-00000009HLF-0qyq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:53:10 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VQwGs8kxbwA/pw10zZlCJcbl8pu79WWCbvhBxYPCINQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790189586; v=1; x=1790794386;
 b=MGmH7IcKfx+Nye6FNY4j3bKlpauZH/t0F2aVrVw9380ErahTaiUgYjxMzXQ0oMZjdO60yfbd
 e6D92XcMYjr5xXaN4KdRsDiuNd7q/YQAt8Zh0LifobHROCQsw5vYRaEgUJw1nmLzbp4locgtZPb
 c4jB5gXJZFmmH9n8Qw7RV0KY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8620ff715923237c;
	Wed, 23 Sep 2026 18:53:06 +0000
X-Mizu-Trace-ID: 8620ff715923237c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b8c42da963so1805e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:53:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzF0C2H6zMx4A9nDt4trHScTqi8ctrQSO9OhtPK1eQIQPVmLA1F8QN4hZRz5LiIP4FmLBaad7bV8obDNh0ELFdz@lists.infradead.org
X-Gm-Message-State: AFuF++lqKaxSAdisGHk1s8ZBQpvsCsyXOCtcfRRniD0GcIcobSBvuT2Z
	lRsQ+2BE+CqFnocxoc3FsoTRCxTIbeyOh88CmHPe0lMMMtzi8Qw8BYAlvOqupS2ozelwqxmIn0O
	99wVraQixmhK7maOai8nsiGAkZ6bjHZBz/9VdGd5S
X-Received: by 2002:a05:6512:124d:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5b8dda15fd4mr50291e87.8.1790189584139; Wed, 23 Sep 2026
 11:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org> <20260923-kvm-arm-prefault-v4-1-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-1-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 19:52:27 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzDYSuBVEc+SMdDa41sq-ET=m_oWW0gL9dYf+AumPYPUg@mail.gmail.com>
X-Gm-Features: AclHuK9102l5jXhHZm0wjY1xcBMQ6NzdYFil2Hlxj79BuZjg_2Y9X0YS37SYzUc
Message-ID: <CA+EHjTzDYSuBVEc+SMdDa41sq-ET=m_oWW0gL9dYf+AumPYPUg@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] KVM: Allow architectures to disallow pre-fault
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
	Jack Thomson <jackabt.amazon@gmail.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_115308_715107_B162CEBE 
X-CRM114-Status: GOOD (  10.89  )
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

On Wed, 23 Sep 2026 16:15:44 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
[...]
> +int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
> +{
> +        if (!vcpu->kvm->arch.pre_fault_allowed)
> +                return -EOPNOTSUPP;
> +
> +        return 0;
> +}

nit: the comment above the smp_rmb() in tdx_sept_map_leaf_spte() still
says pre_fault_allowed is read by kvm_arch_vcpu_pre_fault_memory(),
but after this patch it's read here.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

