Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF28C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zittTEWM8rPILsPt3a58zZ7r/aXTvuUZ0lKQ8ayWgts=; b=DqZxV7fiLXW1yboxNze8eLJwAa
	2l6aNBkSriHdbMujKu6gsxfNNrsWbf/FLaj+IrOnN0s/2SSPgpSJKTVNpjt6XFhvpFfkz7w9XgxTX
	VhLJRx34tmYsyqcHTPtGGdXNufxsalpUX2CqicVZrJMV+/ORYBcZpDVXkGrLzRk6wcXmmbMpsIXFh
	tZu4lLzkdo3P7ZtZT/aJFssiu5y1rHOzdyUqDowmwjdnMg3h3oMznd5k1e4F9WxtUsTQ0gtv8e8Ps
	xVH3Tm6XvRa6NXH2IS28iWOrXAUYW8KeQXahRX1o+ypJqp4fKwAiXb3X/hVk3YTIBS+BguAf52L2D
	3ESc/bJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8Vf-00000009Iox-1Acf;
	Tue, 21 Jul 2026 11:19:39 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8Vc-00000009Imm-2BJA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 11:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1784632772;
	bh=zittTEWM8rPILsPt3a58zZ7r/aXTvuUZ0lKQ8ayWgts=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=gdm76/8KoI1JCXkGNvKnYWOKFHSjrT4epNsLd9UIPL2Xm+3p67qtzmq+xVfWh7xyw
	 rmJKi8ThyCV/Dlp8SgniyY2lUFoUCRucRFafnD4dsI9EYdT0u//HFk4lepBQGueT8/
	 Zvi3Ln4n59PQrpqhW7gK6smsB/KkEvDqQzvDgnTM=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4h4FK04Bj6z10np;
	Tue, 21 Jul 2026 11:19:32 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4h4FJz4qLyz10nB;
	Tue, 21 Jul 2026 11:19:31 +0000 (UTC)
Date: Tue, 21 Jul 2026 12:19:31 +0100
From: Bradley Morgan <include@grrlz.net>
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
CC: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Quentin Perret <qperret@google.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Gavin Shan <gshan@redhat.com>,
 Dev Jain <dev.jain@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_6/7=5D_KVM=3A_arm64=3A_Don=27t_ad?=
 =?US-ASCII?Q?vertise_eager_page_splitting_under_pKVM?=
In-Reply-To: <20260717130317.1953574-7-fuad.tabba@linux.dev>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev> <20260717130317.1953574-7-fuad.tabba@linux.dev>
Message-ID: <C5D63651-E924-4297-9B4D-6E9DB04D64D8@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_041936_722466_FFFCC4B3 
X-CRM114-Status: GOOD (  11.29  )
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

On July 17, 2026 2:03:16 PM GMT+01:00, Fuad Tabba <fuad.tabba@linux.dev>
wrote:
>Under pKVM the stage-2 walker resolves to pkvm_pgtable_stage2_split(), a
>WARN_ON_ONCE(1) stub, yet KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE is still
>enabled and reported for non-protected guests: the capability check keys
>on the per-VM protected state while the walker dispatch keys on the
>host-global mode. Enabling the cap and then dirty-logging the guest
>reaches the stub, splatting a userspace-reachable WARN.
>
>Reject the capability, and stop reporting a chunk size and the
>supported block sizes, for every VM once pKVM is enabled, keyed on the
>host-global mode like the split dispatch. Gating only protected VMs
>would leave the non-protected guests that reach the stub still able to
>enable it. Userspace decides whether eager splitting is available from
>the block-size bitmap (QEMU falls back to no eager splitting when it
>reads 0), so leaving it advertised steers an explicit request into the
>enable failure instead of the fallback.
>
>Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
>Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Do you think CC stable would be good? I do but sometimes I'm
embarrassingly wrong

>---
> arch/arm64/include/asm/kvm_pkvm.h | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
>index 57afb07d6b13..beea00e693a0 100644
>--- a/arch/arm64/include/asm/kvm_pkvm.h
>+++ b/arch/arm64/include/asm/kvm_pkvm.h
>@@ -45,6 +45,9 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
> 		return true;
> 	case KVM_CAP_ARM_MTE:
> 		return false;
>+	case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
>+	case KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES:
>+		return false;


Nit: KVM_CAP_ARM_MTE right above already returns false, fold the two
new cases into that and drop the duplicate return. And please put a small
comment saying eager splitting is unimplemented under pKVM (WARN
stub), so nobody reads the list later and "fixes" it back, here's a
example, feel free to bikeshed


	case KVM_CAP_ARM_MTE:
	/* eager splitting is unimplemented in pKVM, please don't refix this */
	case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
	case KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES:
		return false;
	default:
		return !kvm || !kvm_vm_is_protected(kvm);
	}




Killing the reporting too is right imo. Qemu reads a 0 block size
bitmap and quietly falls back, an explicit enable eating EINVAL is the
worse failure mode. Good.

if u choose not to, it's ok, please add 

Reviewed-by: Bradley Morgan
<include@grrlz.net>


> 	default:
> 		return !kvm || !kvm_vm_is_protected(kvm);
> 	}
>

Thanks!

