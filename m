Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147EBC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MISoDD2VmriUM3hHgIi/GwAEIAIyfPfXbHzrORj4/eI=; b=YjMOCMYUmfExq2D/RDUJahSbjY
	BREAJAuMxXLi8S4ycgdiCDUvoo6KexjLgOG2TI16MNZa+0jUiPMXZycK4+PqqWwZ93RUUrPcGfVlz
	dps9CRwjo87BjN3ZALjXoH8+pnkwHTD+ZWoIblxYB/oe4vNnUw6BtMYqNhpKDBRTb8uex306LPrGL
	wluALotx7wwFv3WxIitRZN35aiNY4XMTHuC9x4J6el4fhtmtpEITSh9YVaw1nb1JCc8p+JksrNo1I
	fdewcDqK+Gz4R7cOOqyp2cK0VK6/qTqSy0Heaeai3K+XPc5VNZUxpbHw7cN9yplRFsAQbQCeUgHhe
	gjYv98nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxyd-00000005rdS-1ZkB;
	Thu, 06 Aug 2026 13:17:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxyb-00000005rcP-29kg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:17:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6686A153B;
	Thu,  6 Aug 2026 06:17:31 -0700 (PDT)
Received: from [10.57.42.103] (unknown [10.57.42.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 388EF3F632;
	Thu,  6 Aug 2026 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786022255; bh=Xi0GI+CCHAN9OYhaAuPoCvL+bhIRpBxTXYrZjuadPO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LH79uJ1Jg2SNwztVGfB2pmdXfLorfNsLrP+Ftqm/LOL1yi7R7Vv98nZjRu+MQWYcz
	 gpF5kVEPbHs+qGMcmFhnXyHGgHcIV+UHSR7a9RtQy8z1HG8Gp6lEVj+wqCp4t7y0+7
	 stpowvv+zBdM0WV4ABt5UlPSRDHY3yqNgcX3f+DI=
Message-ID: <7e66d67a-f63f-465c-acb0-c1238f534c07@arm.com>
Date: Thu, 6 Aug 2026 14:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/tegra241-cmdqv: Reject a VCMDQ base above the
 48-bit hardware limit
To: Will Deacon <will@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260729220329.805417-1-nicolinc@nvidia.com>
 <anSCXUjivdb_aOv_@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <anSCXUjivdb_aOv_@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_061737_593252_F4FFAA0E 
X-CRM114-Status: GOOD (  14.30  )
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

On 2026-08-06 1:47 pm, Will Deacon wrote:
> On Wed, Jul 29, 2026 at 03:03:29PM -0700, Nicolin Chen wrote:
>> tegra241_vcmdq_alloc_smmu_cmdq() allocates the VCMDQ buffer via the common
>> arm_smmu_init_one_queue(), which uses smmu->dev and its coherent DMA mask
>> of DMA_BIT_MASK(smmu->oas). An SMMUv3 queue base holds a 52-bit address in
>> Q_BASE_ADDR_MASK, but the VCMDQ_BASE register holds only 48 (VCMDQ_ADDR),
>> so the masked write "q_base = base_dma & VCMDQ_ADDR" silently drops bits 48
>> and up. The HW would then fetch its commands from a wrong memory location,
>> which likely raises VCMDQ errors.
>>
>> Real hardware always pairs an SMMU OAS with a matching VCMDQ address field,
>> so this cannot happen; it takes a VMM that gives a guest a mismatched OAS.
>> Nor can the guest rely on the VMM to catch it: an SMMU CMDQ base keeps bits
>> 48 and up in Q_BASE_ADDR_MASK, so a trapped CMDQ_BASE write still carries
>> them, while a VCMDQ base goes straight to the hardware and loses them.
>>
>> Reject a base_dma with bits set outside VCMDQ_ADDR, the way the user-VCMDQ
>> path already does for its base_addr_pa, failing the queue init rather than
>> silently truncating the base. Use dev_warn_once() rather than WARN_ON(), as
>> the OAS is VMM-controlled and a WARN_ON() would let it panic a guest booted
>> with panic_on_warn.
>>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>> ---
> 
> This still just sounds like something that a VMM shouldn't do?

Yeah, if a VMM is going out of its way to emulate obviously-broken 
hardware, then in my opinion we should just give it what it wants and 
let it deal with the consequences of its brokenness.

But if we really do want to bother sanity-checking emulations, then why 
allow them to still get away with being broken in the case that we do 
happen to allocate queue memory at a sufficiently low PA anyway? Why not 
actually validate smmu->oas itself (plus anything else relevant) in 
__tegra241_cmdqv_probe()?

Thanks,
Robin.

