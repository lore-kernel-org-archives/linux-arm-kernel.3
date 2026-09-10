Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77243C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Lnrg2/hO2PDz3YYyuFj0xK05QQ8enbQYCMqcWEZoS0=; b=p7y8i6PbwyuApOR1Ji4fJ+fRz9
	th38Zzr8jesuKWgIp2iRlcbv0o/mxZ5xvjLa8bGFOBSzSHN6luV3XrzkzU8rFA4nn1TSR+81JymS/
	NortpUXDs2xwCfK6siwRvkJFk27xn6DC7MAOY+9ZblOr8n0cFTHaWgeO5sfm1giAIA2aJ+fULQWMS
	naz5xqk0jZXPoMoot3QO0CuCuUkgDwmS4a94mwiwiLQRrktDLKIhmAE5ScbaOUKikFwsP98uKuxPW
	VH3if8x6FFuTe0H2XWGIULhron8AcWlhtBMQkSaxTEV4JzyaRxWQ2xwyXF/7CnANd125I5zyFEZFd
	PY7WSywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aNR-0000000Dmbv-0t7E;
	Thu, 10 Sep 2026 08:43:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aNP-0000000DmbP-1cPe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:43:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA6D81570;
	Thu, 10 Sep 2026 01:43:18 -0700 (PDT)
Received: from [10.0.129.245] (unknown [10.0.129.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A30433F7B4;
	Thu, 10 Sep 2026 01:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789029802; bh=pZUMNn7G6bEmWkSQbLz54BigM3O4mPAIKyE7XJ1QN/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EHjRVZpnJR2Yspv1pcvSj5E8gglrpU8NcIRqk/eLWDvSmVhmkEnt5wHKbiTXtnFSU
	 vm/P1PsmftSvQMuEhWVLOoJYES5EwyAheGCUV7Jar3sxHe6GayFDDE1GnvT012cb3G
	 h34jwHoi3ZpFOpzyb3GvlaGfqIIVa8VCneQYTc48=
Message-ID: <40d3312a-c695-44ed-857a-fc6bf293f3e6@arm.com>
Date: Thu, 10 Sep 2026 09:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/20] KVM: arm64: CCA: Add a new mode for supporting
 Realm guests
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-7-suzuki.poulose@arm.com>
 <e66698e1-e582-4ff8-9881-4ddda5bc1d94@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <e66698e1-e582-4ff8-9881-4ddda5bc1d94@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_014323_464721_056F5F33 
X-CRM114-Status: GOOD (  14.79  )
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

On 10/09/2026 06:53, Gavin Shan wrote:
> Hi Suzuki,
> 
> On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
>> Add an explicit mode to support Arm CCA guests.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   Documentation/admin-guide/kernel-parameters.txt | 3 +++
>>   arch/arm64/include/asm/kvm_host.h               | 1 +
>>   arch/arm64/kvm/arm.c                            | 5 +++++
>>   3 files changed, 9 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/ 
>> Documentation/admin-guide/kernel-parameters.txt
>> index 68647ff4bdd24..1afe3df3b923e 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -3256,6 +3256,9 @@ Kernel parameters
>>               nested: VHE-based mode with support for nested
>>                   virtualization. Requires at least ARMv8.4
>>                   hardware (with FEAT_NV2).
>> +            rmm: Support for running confidential guests in Realm
>> +                 world using RMM, as defined by Arm Confidential
>> +                 Compute Architecture (CCA)
>>
> 
> I'm not sure, but 'realm' would be more appropriate name. rmm (Real 
> Management Monitor) is
> the term limited to the firmware to me. Besides, we have been using 
> 'realm' broadly in this
> series like kvm_vm_is_realm(), kvm_realm_state() and so on.

May be. But we use the "mode" of the hypervisor in question here, 
mostly. e.g., nvhe, vhe, protected etc. So, I went with RMM (in favor
of CCA). Does that make sense ? Also, we rely on firmware/arm_rmm for
the support. So, it kind of make sense to keep it "rmm" ?

Cheers
Suzuki

