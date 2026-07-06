Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25001C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wrEtuZnNKTHhXzzXH6FBZuUyiD4QdjI7aUV2ges9QRI=; b=UzIBkw63Bo1hDy
	i99mD+mEfkmnBRmRwPVL6ZkF2LXwp9F39XvQASjC85/g+agezdk8IHUxwm1wK/IbX3rNqL5ZtRIS3
	gIwli1ES/1YJKde7S1dclfcm4d/Q49vpTVELISPsSZgc1Qngz0d8fxearGMboWJeOK1IrxLbW9kPW
	ayW6FhH2n0TV/ci2ujO2uImzyKom6//EW3eELtkG/WHBR3O3JeRWhWi0eU00fMnvPOfdorSU2qW7L
	xJ/Wz4SDDP+ACB8ME6xz8NSHnl8BQorMhZOe5PmFYX+IKEB8dyF6CzSlXQ2zO+ob1MVg75C83OSAK
	CsW9FwVIe6i1sDJ5MhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgquV-0000000DddE-2zZb;
	Mon, 06 Jul 2026 21:31:27 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgquT-0000000DdcF-4AXq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:31:27 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-7e9dc0f5900so38747a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783373484; x=1783978284; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wrEtuZnNKTHhXzzXH6FBZuUyiD4QdjI7aUV2ges9QRI=;
        b=Wz0SEgdMFpE0+JF/tQbsHfJprnl8yBvjlEXLnpuR2lR+rj5vHie8QBFKLJGcdIkc4m
         ItGN7b2hhhCpM9zdzJQ8lwtHMvLzvlWPq+Wj6D738vYsVKyInY/ya3ytI9aSm/ilHVhc
         TtyHp+YLI/PN8tBUY8BFg1J9UTXECVS4uYkke1LRAXbkl+0eEew2kjdBUUr7gWKcTMZF
         Imp7qSoy5gKD7nMh/LyWarWD+i4qbc9wKBhPbIGA6XkzHADJ9isfDs08k2Pc7BLO8jEV
         /McxhnJZA4DteIt1PEI+6Y/GnKsx0vhEGvYK7dRgabXiltv3tXMED4HV3Zc8yjPcOFaw
         qE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373484; x=1783978284;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrEtuZnNKTHhXzzXH6FBZuUyiD4QdjI7aUV2ges9QRI=;
        b=kXRiPri9gYowwe/I8itUrS/C4ea30407EQU0WJKBczoJYv8KMwDVg2PdotC4/gkk40
         m1BGkIYV7+6tUMEpH5/Eqv3BDJ5HDUCSbWkpBIBU+5vxcqimzLmdzOR+lkYZAur/hrgl
         U9pTg7RSM9UVsKY014AY0M7Ez3pAf7DR9X2IRkHNkofhdehCTom4uRdY3WjwDsmRPPpC
         llPjidGkUr5KRTjy2iUZ0pNGKALy1io685STul8CLAGoFj/NyJCboHhngDqZruvqg3Mh
         xITje9N8ZP6gn/J57JWXiEi3usovletvaUUhH2sYCOEKvlxMONQ+cKM1fPVz6jADL4X3
         JSyA==
X-Forwarded-Encrypted: i=1; AFNElJ/euqGa8o4tRJpmeI5v/km212pnqmfXLAhQrSmoHVYuGvJpIUU9J+fgCnlscVLOMX7UDvtuV5R2+nb+teG5r5r7@lists.infradead.org
X-Gm-Message-State: AOJu0YwNzndHZCRsVak1mdiT44yLaAjt6xO9SZhT+ufVqa/pfdkpOBym
	E+5nvYI2Zkpt/gbm1S0r+7ux1oIBbJIdT9gUc32wG1QpOdUp+DDV3QkgQ50Cht7d1y2S2yLJzV7
	OLCNzuVI1plKnOWz4SbBchPSP+g==
X-Received: from ioel1.prod.google.com ([2002:a05:6602:2761:b0:9a7:ea8a:6db6])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:c92:b0:6a1:93a5:cd70 with SMTP id 006d021491bc7-6a35c45cbfbmr12190eaf.31.1783373483917;
 Mon, 06 Jul 2026 14:31:23 -0700 (PDT)
Date: Mon, 06 Jul 2026 21:31:22 +0000
In-Reply-To: <akWhad3U5VNjWzxu@kernel.org> (message from Oliver Upton on Wed,
 1 Jul 2026 16:23:21 -0700)
Mime-Version: 1.0
Message-ID: <gsntqzlf6c0l.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 0/5] Backport ARM64 VHE boot fixes to 6.6.y
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mizhang@google.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_143126_040509_ABFB206E 
X-CRM114-Status: GOOD (  14.56  )
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

Hi Oliver, thanks for reviewing.

Oliver Upton <oupton@kernel.org> writes:

> The subject prefix should be "[PATCH 6.6 0/5]" so people know right up
> front where this is going.

I'll make sure to include that in the subject.


> On Wed, Jul 01, 2026 at 08:43:37PM +0000, Colton Lewis wrote:
>> This series backports VHE CPU boot fixes to the 6.6.y stable branch.

>> These fixes are already present in the 6.12.y stable branch (and
>> newer), but are missing in 6.6.y. They are required to enable booting
>> L1 guests with nested virtualization enabled (kvm-arm.mode=nested).

> It's a bit worse than this. The architecture retroactively made
> FEAT_E2H0 an optional feature, there are now implementations in the wild
> that do not support the feature.

Good to know. I'll include that context in my next cover letter.

>> Without these patches, a 6.6.y guest boots with HCR_EL2.E2H
>> incorrectly configured (because it misses VHE-only detection or early
>> initialization), causing early boot hangs/trap loops.

>> Conflict resolutions:
>> - Patch 4 (KVM: arm64: Initialize HCR_EL2.E2H early) had conflicts in
>>    arch/arm64/kvm/hyp/nvhe/hyp-init.S due to differences in state
>>    initialization. Resolved by extracting EL2 state initialization into
>>    __kvm_init_el2_state.
>> - Patch 5 (arm64: Revamp HCR_EL2.E2H RES1 detection) had conflicts in
>>    arch/arm64/include/asm/el2_setup.h. Resolved by using raw msr hcr_el2
>>    instead of the missing msr_hcr_el2 macro.


>> Marc Zyngier (4):
>>    arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
>>    arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is
>>      negative
>>    arm64: Fix early handling of FEAT_E2H0 not being implemented
>>    arm64: Revamp HCR_EL2.E2H RES1 detection

>> Mark Rutland (1):
>>    KVM: arm64: Initialize HCR_EL2.E2H early

>>   arch/arm64/include/asm/el2_setup.h | 52 ++++++++++++++++++++++++++++++
>>   arch/arm64/kernel/head.S           | 17 +++-------
>>   arch/arm64/kvm/hyp/nvhe/hyp-init.S | 16 +++++++--
>>   arch/arm64/tools/sysreg            | 37 +++++++++++++++++++++
>>   4 files changed, 107 insertions(+), 15 deletions(-)


>> base-commit: d1cfde2d5d15be14123bdd1689162bd27f995a90
>> --
>> 2.55.0.rc2.803.g1fd1e6609c-goog


