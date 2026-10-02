Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0926CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fb7Br6Tsxum2GGbS/TXkTo/tcMwy9nDRiJAq1fdhN54=; b=aXstEvHtHmmJfcoxDp7GnSDEFS
	aU/sL+XdA05IG1BnlhrBRvLQp17uBBvOm4QIcvAn86HdrcvJzw6fb4mUUB5qfVROY8cog3lkKvgYA
	lopNUT3kk+SNGKWoJahDxvYBx8Nt1CkKBoZVEr4a14sRywdKbHd1dzEdS5IcECNYa07QMk7PpX+qq
	fPV4uvuTU7RUo6QTn59ti2tE5zqQe6DKlO7dxpYWxP8wL9s/hMJna6gLDjvmIMXhuamDfpaQsdPwc
	lJceOTqRqv1KdX+cfAkMHLqw7xrkL1M9j/Q3oKyF4shKEVFOuRTCNJwCgd+HjAuomZ7DOLfdO6YMB
	2NFb1c3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfBJ-0000000BuxM-2jne;
	Fri, 02 Oct 2026 15:28:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfBF-0000000Buvg-0qnK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:28:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E4D1476;
	Fri,  2 Oct 2026 08:28:08 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD2013F85F;
	Fri,  2 Oct 2026 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954892; bh=jSesLRiSeGml5Tnrjg/pe9P+zipvIwJDessg3nPTnYU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hAwzBJxktNKlnMFxSzOnuLVq2YuNzJ/DaM11nCmTz07uIzhDiXOJ79lEd1F5eCV38
	 mWM79MLDCyjXlTpcX6J6HMTkq9NqYKq1rwVSZVpy6cVbj4X41jX9RDAL1L2gn2q1Tf
	 Lc6ajo6DhJ6lHPA+rh+V5D68sRn9lbM+X8jl8+GE=
Message-ID: <1910861a-1188-4ba9-ace9-be82304c95a5@arm.com>
Date: Fri, 2 Oct 2026 16:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 09/10] firmware: arm_rmm: Add wrappers for Realm
 related RMI commands
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-10-suzuki.poulose@arm.com> <ar-QC4vtcULyJ5dW@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ar-QC4vtcULyJ5dW@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_082813_296259_AD98763C 
X-CRM114-Status: GOOD (  11.36  )
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

On 02/10/2026 12:05, Catalin Marinas wrote:
> On Fri, Oct 02, 2026 at 07:15:05AM +0100, Suzuki K Poulose wrote:
>> +/*
>> + * rmi_smccc_invoke_once: Invoke the RMI call and return the results. Do not
>> + * retry the command. Let the caller deal with RMI_BUSY or RMI_BLOCKED.
>> + *
>> + * @regs: Input parameters filled in. Updated with the ouptput results
>> + * after the call.
>> + */
>> +static __always_inline void rmi_smccc_invoke_once(struct arm_smccc_1_2_regs *regs)
>> +{
>> +	struct arm_smccc_1_2_regs args = *regs;
>> +
>> +	arm_smccc_1_2_smc(&args, regs);
>> +}
> 
> Nit: I mentioned on v21 - is the copy to args still needed? Can we not
> do just:

Sorry, yes, you are right. This is a single call and we are fine to
overwrite the results.

> 
> 	arm_smccc_1_2_smc(regs, regs);
> 
> (no need to respin, I can fix it locally)

Yes please

Suzuki

> 


