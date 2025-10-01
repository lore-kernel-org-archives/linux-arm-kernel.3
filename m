Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E616CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D42J9c7JdJ5FlilttPlktM+Ky3Ckn2U5sg7M1m9o+pU=; b=Slsl52pKwyUGM9Thquxp4EQhF4
	NsIn797moXsOhlJoNUD7CWXE1saDDECuxZ+/EejXekbiiishJyzk0TZ28doCuR+pJ4CKJrEgjMyru
	ugGQnBHmUDRSL/xQW3G/ppSsFSHxBRXnnu4ZZ5j/jgmRGHhZlP4hXppmCLWmOPvUVBlzpF0cz0OaE
	Mx2Jyvv0EbIN28CbGvNBl6UDUUlW8GYAlCiVx6rKS8jg8JVtbxQFbfntnmIvhbycErkxJWhS5eVnZ
	LvvgxVKoKT2au6fgoL9uqQ1P2x49E3o36JA43uupV6fDpauXUkEjZ6PBq6PelQ/miMG+FrBqXvuOy
	lK2Dpgbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3yrF-00000008PSB-33ZL;
	Wed, 01 Oct 2025 15:35:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3yrD-00000008PRm-0rLq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 15:35:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 608601692;
	Wed,  1 Oct 2025 08:34:58 -0700 (PDT)
Received: from [10.57.0.204] (unknown [10.57.0.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1A183F59E;
	Wed,  1 Oct 2025 08:35:01 -0700 (PDT)
Message-ID: <99de8b04-7e7d-404b-aab8-5759a1f28c1a@arm.com>
Date: Wed, 1 Oct 2025 16:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/43] arm64: RME: Check for RME support at KVM init
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-6-steven.price@arm.com> <86ms6azxt5.wl-maz@kernel.org>
 <2226e62f-76ca-4467-a8ae-460fd463df0a@arm.com> <86h5wizqvn.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86h5wizqvn.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_083507_296286_DB52E394 
X-CRM114-Status: GOOD (  19.00  )
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

On 01/10/2025 14:35, Marc Zyngier wrote:
> On Wed, 01 Oct 2025 14:20:13 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>>>> +static int rmi_check_version(void)
>>>> +{
>>>> +	struct arm_smccc_res res;
>>>> +	unsigned short version_major, version_minor;
>>>> +	unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
>>>> +						     RMI_ABI_MINOR_VERSION);
>>>> +
>>>> +	arm_smccc_1_1_invoke(SMC_RMI_VERSION, host_version, &res);
>>>
>>> Shouldn't you first check that RME is actually available, by looking
>>> at ID_AA64PFR0_EL1.RME?
>>
>> Well, you made a good point above that this isn't RME, it's CCA. And I
>> guess there's a possible world where the CCA interface could be
>> supported with something other than FEAT_RME (FEAT_RME2 maybe?) so I'm
>> not sure it necessarily a good idea to pin this on a CPU feature
>> bit.
> 
> But you cannot have CCA without RME. You cannot have CCA with
> GICv3. And my point was more that RME could be used by something other
> than CCA  - I certainly don't anticipate someone else adopting the CCA
> interface for anything...
> 
>> Ultimately what we want to know is whether the firmware thinks it can
>> supply us with the CCA interface and we don't really care how it
>> achieves it.
> 
> I disagree. You rely on specific feature sets to be available (hell,
> everything is baked around GICv3... GICv5 anyone?).
> 
> For this sort of stuff, you absolutely need to know what you are
> running on, not what some broken firmware tries to pretend it is.

Well I don't agree, but equally I think the chances of the RMM interface
existing without RME is nil, so I guess the extra check doesn't really
matter. So I'll add it. In the (highly) unlikely event that it causes a
problem then it would be easy enough to remove.

Thanks,
Steve


