Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FBFCDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 17:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FwWUfeDNbrDVJef4pRnO+7OmxGA3ye0UB7FxK8Uml4=; b=Jx7W+bCkIV2qYv9M1k/FAVq2R1
	gp5ujao+ggdtNFVGVvdfYbMDGXYlBYBC7TWVirrhdnET0quGp0tqx4XktzYs0+iVi7v0SFGoMEZK0
	3JnsHstXITDa2mI2xmOQOLkEJH+wC/YFjiqtHkPOLuJPQOsKVz6X1LxX1X4WDUwMpw2wsN+8KBmpu
	SRxzwUmNZaGT2vpMyOqvXPM6td7y0ch/JK2ndlJTAZ4fEJwj4jU90fa3fUIWAPl9dG+P8/XDTXtvs
	/aw9/PUfQKhhJeGW0n1R2LIFbmZdH44p2rRCd7PwK83xX1h4k9c6yu3wpeBxmSdtoNCRKznQ+K9CS
	GQJK+slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4Xn-00000006fxu-1ZqR;
	Tue, 23 Jun 2026 17:04:15 +0000
Received: from confino.investici.org ([2a11:7980:1::2:0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4Xk-00000006fxM-3ULI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 17:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782234248;
	bh=6FwWUfeDNbrDVJef4pRnO+7OmxGA3ye0UB7FxK8Uml4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=YJN4q9Eg6ghoc4x1zlCrrp2xc2ihCAFI7ikXGqZFL3pJaqolwnIqS8P5wHeUucyTy
	 BuwoWd9xLTROkLRgpJwRL7PsC2w23T/oYNCOnHzXcMzV5XK9JrpgG1VaXFHEGHuBfW
	 OzaDIUWTFkpQ2LemoEldP8b4kWNZcqDKEZiV/xEs=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4glBHX0H9mz110p;
	Tue, 23 Jun 2026 17:04:08 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4glBHW4PlKz10vp;
	Tue, 23 Jun 2026 17:04:07 +0000 (UTC)
Date: Tue, 23 Jun 2026 18:04:07 +0100
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev,
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Quentin Perret <qperret@google.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_KVM=3A_arm64=3A_skip_pKVM?=
 =?US-ASCII?Q?_cache_flushes_for_non_cacheable_mappings?=
In-Reply-To: <86qzlxqjf3.wl-maz@kernel.org>
References: <20260623160339.15143-1-include@grrlz.net> <20260623163756.4591-1-include@grrlz.net> <86qzlxqjf3.wl-maz@kernel.org>
Message-ID: <5925B41F-0F57-4BCB-9F93-7600878ECA27@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_100413_296499_1A35198C 
X-CRM114-Status: GOOD (  21.31  )
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

On June 23, 2026 6:02:40 PM GMT+01:00, Marc Zyngier <maz@kernel.org> wrote:
>Bradley,
>
>Just a few things to keep in mind for your next contributions:
>
>- If you are sending more than a single patch, add a cover letter.
>
>- Don't send a v2 in reply to a v1. It messes the threading we are
>  relying on, and makes it hard to ignore replies to an older version.
>  Always send new series standalone.
>
>- Don't immediately send a V2, even if (especially if!) a bot is
>  pestering you. 34 minutes between versions is way too short (at
>  least a few days is the norm).
>
>On Tue, 23 Jun 2026 17:37:55 +0100,
>Bradley Morgan <include@grrlz.net> wrote:
>> 
>> pKVM keeps its own mapping list for stage 2 operations. Its flush path
>> uses that list directly, so it lost the PTE attribute check done by the
>> generic stage 2 walker.
>> 
>> Record whether a mapping is cacheable and skip cache maintenance for
>> mappings that are not cacheable.
>> 
>> Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
>> Cc: stable@vger.kernel.org
>
>What device memory gets mapped in an upstream pKVM guest that would
>require a backport to stable?
>
>> Signed-off-by: Bradley Morgan <include@grrlz.net>
>> ---
>> Changes in v2:
>> - Add patch 2 for the pKVM permission fault mapping cache bug.
>
>This is the sort of information that goes in the cover letter.
>
>> 
>>  arch/arm64/include/asm/kvm_pkvm.h | 1 +
>>  arch/arm64/kvm/pkvm.c             | 8 +++++++-
>>  2 files changed, 8 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/include/asm/kvm_pkvm.h
>b/arch/arm64/include/asm/kvm_pkvm.h
>> index 74fedd9c5ff0..d9dd8239910d 100644
>> --- a/arch/arm64/include/asm/kvm_pkvm.h
>> +++ b/arch/arm64/include/asm/kvm_pkvm.h
>> @@ -196,6 +196,7 @@ struct pkvm_mapping {
>>  	u64 gfn;
>>  	u64 pfn;
>>  	u64 nr_pages;
>> +	bool cacheable;
>
>Errr, no. That's a terrible idea.
>
>This thing is already big enough, let's not add a bool right in the
>middle (use pahole to find out why this is bad). Given that nr_pages
>is for a range, and that the minimum page size uses 12 bits, the
>largest number of pages you can have here is 56-12=48 bit wide. That's
>another 16 bits worth of flags you can use.
>
>Thanks,
>
>	M.
>
>

thanks.

I'll go and do V3 with another sashiko suggestion. I'll fix your path too.
I'll park V3 for a bit.

Thanks!

