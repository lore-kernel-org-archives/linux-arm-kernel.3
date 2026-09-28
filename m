Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E10C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th1IQ7Uvi9M8PQvb4aBCWvyzqIApqDWa0UnRnSg5hFU=; b=KmvV307dp7pEjyacTve15BJXMT
	rhcksyXEoDf9BLfnycdyMyOG03erGNCX3OnK8zj3EdEMOOz8qJciRa6vv175M7tyGmZhOpRRq6Tne
	eUaLmWIwgXj8paxsjrHbQr2mWFKx3mFejtM3Ydy2MrZb4AJMnpUR828f3bX369Uq3jXRQcBf8Ur4n
	qzQu+7FaDzJvbU01tNyGt/YYNlTMyz1KLpxEQ1LMKDXY14P6w2qJZH5EQRlYgEpeumDF9KGgexc02
	clj6OYqibp31ATfC/HWlxGYNknUk/ubM8thkyQxlRR1vFvA90yH9fYcDVtdNMH1/KTZKmtB0eowaV
	d0SJv4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6Mh-0000000019U-0bsQ;
	Mon, 28 Sep 2026 08:05:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6Md-0000000018Z-3tJD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:05:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72046169E;
	Mon, 28 Sep 2026 01:05:24 -0700 (PDT)
Received: from [10.57.12.79] (unknown [10.57.12.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 949CB3F86F;
	Mon, 28 Sep 2026 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790582727; bh=ZoYd2sdPRi7PYnEG0IlvFGd13KoF/WZCPDZleG3Y+cw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GZFpwPFl7ovI3rDNT/2mn4+w0i4sXv4nTmdNKJvdtEoZbukSO66jtaCM+F9CsbXdb
	 ZQvnQ+cf9fHw3YVxkeX+xcls+suLYnK7BcC2DCPEW+ZevQmsUlgnB7EwYSwF+Huj6z
	 s6cD2Zr1h9Xg0ltB6Jac4THbkfTIu9l/lUMJZmoE=
Message-ID: <88bd2049-d25b-4767-81f8-83c99749fd11@arm.com>
Date: Mon, 28 Sep 2026 09:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/7] firmware: arm_rmm: Check for RMI support at init
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-3-suzuki.poulose@arm.com> <arZQCiF3iqp9eCsy@arm.com>
 <f7662116-ef8e-4f97-90a4-07173236617b@arm.com> <87v77r2ga5.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <87v77r2ga5.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_010532_271305_3797E648 
X-CRM114-Status: GOOD (  13.31  )
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

On 27/09/2026 10:29, Marc Zyngier wrote:
> On Fri, 25 Sep 2026 16:23:49 +0100,
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> On 25/09/2026 11:42, Catalin Marinas wrote:
>>> On Thu, Sep 24, 2026 at 02:51:56PM +0100, Suzuki K Poulose wrote:
>>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>>> index 32102c3912fa7..e8b29983b0021 100644
>>>> --- a/arch/arm64/kernel/cpufeature.c
>>>> +++ b/arch/arm64/kernel/cpufeature.c
>>>> @@ -293,6 +293,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar3[] = {
>>>>    static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
>>>>    	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV3_SHIFT, 4, 0),
>>>>    	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV2_SHIFT, 4, 0),
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_RME_SHIFT, 4, 0),
>>>
>>> I think we end up exposing this to (any) guest unless we mask it out in
>>> sanitise_id_aa64dfr0_el1(). Do the guests care about the RME version? I
>>
>> Valid point. I personally don't think this matters. The FEAT_RME alone
>> is not useful or harmful. I could mask it in KVM as a safe bet.
> 
> Is there *any* case where the guest (realm or not) should know it is
> running on RME enabled HW? I can perfectly imagine that someone would

We don't do that for Linux Guests at least. The Realms rely on the 
presence of RSI ABI.

Cheers
Suzuki


> implement something looking like CCA on non-RME systems.


> 
> 	M.
> 


