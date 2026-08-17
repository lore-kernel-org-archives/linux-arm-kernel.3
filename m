Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A102C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoD1q7nYMf/NjUyfZqND7EnTJFPMOwnT/y1/yCNJZgY=; b=Z28wI2QsT0ESPg/TvxZVTDTMcQ
	73503kwaquOVxVGoUayTCY9eAsV9c26CVcWk/r5G3LL7zNtEpcPLMIc9AzwIy1BlZSy0iJttBNKIF
	xdSKne5CuFwrDhI5hLsAG6fmbPv6kYln0doEvvQzDuKWIlLs43onZYOeBnm6+upFOOKSdWJWxiluW
	nH8rSycL4IcmnFR/PC1z416J8uTFl4VpwyY/EncuSHNnC1LtruGnAgmT/Mlv38hijHJD5HSSa37XX
	CJVs7oX9lcU5hciOHnGfhcxV1sfh21ZFio3PuF4G/CD/MFDNqOPSa3dD9MNcNyC8LWE/rSLMFtvZ4
	9GXdDXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvylg-00000006Ltu-1H5K;
	Mon, 17 Aug 2026 14:56:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyld-00000006LtF-0Z48
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 14:56:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E4E41655;
	Mon, 17 Aug 2026 07:56:41 -0700 (PDT)
Received: from [10.57.6.69] (unknown [10.57.6.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FE1C3F85F;
	Mon, 17 Aug 2026 07:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786978605; bh=7dV1b0+NGUpOKXsz67zjTQC+6a3hvUjM7P7OhPtyxIE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q5wKL9yYbuGRY/uGjrp33K0BjcVaRkndDml2ZllOx/okMsecfi5ciq2H+sGKap3oC
	 NUkS+R6TSobgrDxcCGygOjo5lWeDdxj0chx0YrvZic/n1ZqD/avNmguzL0ZjzkSjin
	 PlJZPTCryTIf522sTi+GLdO0M4W/LFndBPB9b6bQ=
Message-ID: <4e0a7f4d-740f-47df-b601-1cfb0b79090e@arm.com>
Date: Mon, 17 Aug 2026 15:56:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] firmware: arm_rmm: Add wrappers for direct RMI calls
To: Will Deacon <will@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260715142739.80398-1-steven.price@arm.com>
 <20260715142739.80398-3-steven.price@arm.com>
 <anR1xZrKkrsJhrGe@willie-the-truck>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <anR1xZrKkrsJhrGe@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_075649_226044_63B01307 
X-CRM114-Status: GOOD (  13.95  )
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

On 06/08/2026 12:53, Will Deacon wrote:
> On Wed, Jul 15, 2026 at 03:27:33PM +0100, Steven Price wrote:
>> The wrappers make the call sites easier to read and deal with the
>> boilerplate of handling the error codes from the RMM.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes from v14:
>>  * Update to RMM v2.0-bet2 spec.
>>  * Move SRO related wrappers to a later patch due to dependencies.
>>  * Common wrappers are split into include/linux/arm-rmi-cmds.h.
>> Changes from v13:
>>  * Update to RMM v2.0-bet1 spec including some SRO support (there still
>>    some FIXMEs where SRO support is incomplete).
>> Changes from v12:
>>  * Update to RMM v2.0 specification
>> Changes from v8:
>>  * Switch from arm_smccc_1_2_smc() to arm_smccc_1_2_invoke() in
>>    rmi_rtt_read_entry() for consistency.
>> Changes from v7:
>>  * Minor renaming of parameters and updated comments
>> Changes from v5:
>>  * Further improve comments
>> Changes from v4:
>>  * Improve comments
>> Changes from v2:
>>  * Make output arguments optional.
>>  * Mask RIPAS value rmi_rtt_read_entry()
>>  * Drop unused rmi_rtt_get_phys()
>> ---
>>  arch/arm64/include/asm/rmi_cmds.h | 67 +++++++++++++++++++++++
> 
> This doesn't need to be in the arch code. Please work with Aneesh to put
> this somewhere else.

v16 moved the bulk of these to include/linux/arm-rmi-cmds.h [1] but left
the KVM related ones in arch/arm64/include/asm/rmi_cmds.h [2].

Do you want me to move the KVM related ones out of arch code also? It
seemed sensible to me to leave it in arch code because these RMI
functions are only used by KVM arch code.

Thanks,
Steve

[1] https://lore.kernel.org/r/20260803134403.80630-3-steven.price@arm.com
[2] https://lore.kernel.org/r/20260803134403.80630-11-steven.price@arm.com

