Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EB0C4452F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFo6sXBqP+bAaFBH7PqFjY+vvWMrzVjn/4F5kW+N7ZY=; b=ZnGe6ufAzXkYgQtyaSC7mmmMz/
	alySVyNa8BwAMeG2XQjuGwyzS1xOLCJsmbHf1ECJza1TNUT6fFTix7zyptNa9YHCuwtwc/4qUYSFX
	P0/NR1l6F6oHYoXcG6nHHUi1VeRfGDsR+IV3d313tSGu1maPNg/rO37zq9LASTPfynPlTVKnsPDLm
	vz9xgBfpci3AB6/QZmdsxyyYUvfI4TbDbIWE+fQzoO+unrhKlQ/KGELomD+I3ZXOXIbxbIkbKwoSc
	PK03mGIQSuwrLDCOKzCxqotfA0eTDMjnaomsYK0JvDyrlE7SWA93lgh6xfuIk20ulpMIqTi/FPmtF
	Ay36fCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmA9A-00000009TsY-0yQF;
	Tue, 21 Jul 2026 13:04:32 +0000
Received: from devianza.investici.org ([2c0f:f930:0:4::108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmA8w-00000009TnU-06zY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1784639053;
	bh=uFo6sXBqP+bAaFBH7PqFjY+vvWMrzVjn/4F5kW+N7ZY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=tn62xGlvYsJ8fsUetG0w3tv+T06+LH6k4019a7HwMUaZ1/2QF2PAd+ve0LZm6WOP+
	 fZuk6WZ+2MuNEZdhDaB28xY0MtMnMNrqeHKQfA0PS760iB0u3FK9kFUQOWwN0RuynV
	 tjHMkBGlt3LaOGGSh3vOzY5+vnN64E2zNvE114ng=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with ESMTP id 4h4Hdn6gJSz6vW3;
	Tue, 21 Jul 2026 13:04:13 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4h4Hdn3H3nz4vyJ;
	Tue, 21 Jul 2026 13:04:13 +0000 (UTC)
Date: Tue, 21 Jul 2026 14:04:14 +0100
From: Bradley Morgan <include@grrlz.net>
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Quentin Perret <qperret@google.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Gavin Shan <gshan@redhat.com>,
 Dev Jain <dev.jain@arm.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_6/7=5D_KVM=3A_arm64=3A_Don=27t_ad?=
 =?US-ASCII?Q?vertise_eager_page_splitting_under_pKVM?=
In-Reply-To: <CA+EHjTw8Z5LDEi+1b62EEr2a8fqzBFGMsETsH0suZk76_DsNdw@mail.gmail.com>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev> <20260717130317.1953574-7-fuad.tabba@linux.dev> <C5D63651-E924-4297-9B4D-6E9DB04D64D8@grrlz.net> <CA+EHjTw8Z5LDEi+1b62EEr2a8fqzBFGMsETsH0suZk76_DsNdw@mail.gmail.com>
Message-ID: <2F4AB6CA-23A6-4490-91B4-AF738817E2C1@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_060418_513227_CE308750 
X-CRM114-Status: GOOD (  18.65  )
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

On July 21, 2026 1:24:04 PM GMT+01:00, Fuad Tabba <fuad.tabba@linux.dev>
wrote:
>Hi Bradley,
>
>On Tue, 21 Jul 2026 at 12:19, Bradley Morgan <include@grrlz.net> wrote:
>>
>> On July 17, 2026 2:03:16 PM GMT+01:00, Fuad Tabba <fuad.tabba@linux.dev>
>> wrote:
>> >Under pKVM the stage-2 walker resolves to pkvm_pgtable_stage2_split(),
>a
>> >WARN_ON_ONCE(1) stub, yet KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE is still
>> >enabled and reported for non-protected guests: the capability check
>keys
>> >on the per-VM protected state while the walker dispatch keys on the
>> >host-global mode. Enabling the cap and then dirty-logging the guest
>> >reaches the stub, splatting a userspace-reachable WARN.
>> >
>> >Reject the capability, and stop reporting a chunk size and the
>> >supported block sizes, for every VM once pKVM is enabled, keyed on the
>> >host-global mode like the split dispatch. Gating only protected VMs
>> >would leave the non-protected guests that reach the stub still able to
>> >enable it. Userspace decides whether eager splitting is available from
>> >the block-size bitmap (QEMU falls back to no eager splitting when it
>> >reads 0), so leaving it advertised steers an explicit request into the
>> >enable failure instead of the fallback.
>> >
>> >Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
>> >Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>>
>> Do you think CC stable would be good? I do but sometimes I'm
>> embarrassingly wrong
>
>I'd lean against it here. The "Fixes" commit has been in mainline
>since v6.14, the symptom is a WARN rather than a crash or data
>corruption.

Don't worry, I mean. It could be back ported to ACK, right? Or anything
against it?

If you want I'll have to sign up for the gerrit and I'll do the backports


>>
>> >---
>> > arch/arm64/include/asm/kvm_pkvm.h | 3 +++
>> > 1 file changed, 3 insertions(+)
>> >
>> >diff --git a/arch/arm64/include/asm/kvm_pkvm.h
>b/arch/arm64/include/asm/kvm_pkvm.h
>> >index 57afb07d6b13..beea00e693a0 100644
>> >--- a/arch/arm64/include/asm/kvm_pkvm.h
>> >+++ b/arch/arm64/include/asm/kvm_pkvm.h
>> >@@ -45,6 +45,9 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm
>*kvm, long ext)
>> >               return true;
>> >       case KVM_CAP_ARM_MTE:
>> >               return false;
>> >+      case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
>> >+      case KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES:
>> >+              return false;
>>
>>
>> Nit: KVM_CAP_ARM_MTE right above already returns false, fold the two
>> new cases into that and drop the duplicate return. And please put a
>small
>> comment saying eager splitting is unimplemented under pKVM (WARN
>> stub), so nobody reads the list later and "fixes" it back, here's a
>> example, feel free to bikeshed
>
>I'd prefer to keep the separate return. The grouping is deliberate:
>MTE and eager splitting are unrelated features, and the two eager
>splitting caps belong together. The function is self-explanatory from
>its name and header comment, so I don't think an inline comment is
>needed.

hmm. ok fair enough, this comment opinion is just my opinion anyway, not a
blocker or anything.


>Thanks for the reviews!
>/fuad
>
>>
>>
>>         case KVM_CAP_ARM_MTE:
>>         /* eager splitting is unimplemented in pKVM, please don't refix
>this */
>>         case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
>>         case KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES:
>>                 return false;
>>         default:
>>                 return !kvm || !kvm_vm_is_protected(kvm);
>>         }
>>
>>
>>
>>
>> Killing the reporting too is right imo. Qemu reads a 0 block size
>> bitmap and quietly falls back, an explicit enable eating EINVAL is the
>> worse failure mode. Good.
>>
>> if u choose not to, it's ok, please add
>>
>> Reviewed-by: Bradley Morgan
>> <include@grrlz.net>
>>
>>
>> >       default:
>> >               return !kvm || !kvm_vm_is_protected(kvm);
>> >       }
>> >
>>
>> Thanks!
>

Thanks!

