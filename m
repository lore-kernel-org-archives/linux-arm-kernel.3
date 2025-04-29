Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F948C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VY4kvYenv6GBNpxlCW+p01jXK20gyB3meV9OsO+6OcI=; b=IFYCwqrpEcO4Ytq4e9BmaiduP3
	+X4V7235MiT6LYLCtJ5kE1rBfJCmJnyE3Bzfq0dgC6d2X6E5q/FPCzjKkWWqvrhV68EzHWBoejfnO
	D1g2LQPdBUYeXd0819c5m0NNPRwazj6iL+YJuBdN7iA4pE4rKlAcsOH6g8F/VuRkyZT95SBtXmGN7
	wkfec5+deVkUS0KQJnQ555KkrD4CDj3gFelCXLv6zkQa2Qu4RKKi2UqaOivK0AVdiWdL+dCx2+T3T
	kHMopU3pBgvS+bMoTArlcOtC+uybO3nhwYdN9JwYvun+RCC+DLrRFCyu1wksjbniiMgnz46iEeaRx
	oqIgzd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mvS-0000000A8UB-05Bp;
	Tue, 29 Apr 2025 15:31:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9leo-00000009rE2-3BlO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:09:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00A291515;
	Tue, 29 Apr 2025 07:09:51 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5E293F66E;
	Tue, 29 Apr 2025 07:09:55 -0700 (PDT)
Message-ID: <69211539-5ffa-45ad-bd19-25e8bcd6eccc@arm.com>
Date: Tue, 29 Apr 2025 15:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/42] KVM: arm64: Unconditionally configure fine-grain
 traps
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-25-maz@kernel.org>
 <363383a2-c05e-458c-82b7-acc6e5d73939@arm.com> <86h627hyby.wl-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <86h627hyby.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_070958_848212_0B3BE095 
X-CRM114-Status: UNSURE (   9.95  )
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

On 4/29/25 14:49, Marc Zyngier wrote:
> On Tue, 29 Apr 2025 14:08:27 +0100,
> Ben Horgan <ben.horgan@arm.com> wrote:
>>>    -	__deactivate_fgt(hctxt, vcpu, kvm, HFGRTR_EL2);
>>> -	if (cpus_have_final_cap(ARM64_WORKAROUND_AMPERE_AC03_CPU_38))
>> Don't we need to continue considering the ampere errata here? Or, at
>> least worth a mention in the commit message.
> 
> The FGT registers are always context switched, so whatever was saved
> *before* the workaround was applied in __activate_traps_hfgxtr() is
> blindly restored...
> 
>>> -		write_sysreg_s(ctxt_sys_reg(hctxt, HFGWTR_EL2), SYS_HFGWTR_EL2);
> 
> ... and this write always happens.
Thanks for the explanation. I now agree this code is correct.
> 
> 	M.
> 

Thanks,

Ben


