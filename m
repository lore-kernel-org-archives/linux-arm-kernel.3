Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420C8D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 02:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6pv5CBH40UymlBR/yM1CaDwUY0ELjdp+6nVUu/1p40=; b=wrkbqdKWke+VcXdGK2vI97+wen
	vjLHNBJdg1Ge3n5aZwXO9F23rnB+w3E1maJHSCXpHrUuvz/ODo7iZuI43C4sjaWuBDoXOQm9DdFO7
	IrYOcNof7FytZU1KHps547wMjlZi49aIMDvTM5z9ExgUAcwq65urFOM1OeF5GQSu4ybzmU5ZleUzo
	6BhLSO6ewdSt3tAwbzJ7ldiWOTShlnk3ZdqZf/iKKoE/0HH3Mr8Stb05uqH2IqMlBNdgB0cjN5zhm
	nXFDEAqbFX0Jwqgm1NmRr5Vxl+P+/TfU8DClPJgekhM0nbtFJliheh8Roe+xykzxbBIj3GFZjM4q3
	wAk/NlcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSR4P-0000000CUQa-23Ji;
	Mon, 08 Dec 2025 02:33:49 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSR4M-0000000CUP7-264G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 02:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765161223; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=C6pv5CBH40UymlBR/yM1CaDwUY0ELjdp+6nVUu/1p40=;
	b=bAEZfcVBZ0H32DK6QJazCKJ9xN8R+TfXBny1eC9wFqnZVIUb7aSfnsNgKvmZu4MHYn6XavU5R/KqcdgliAfo/5JB89pkLz+QQ/EW7MpL1IaDOxF7KbNMsPdgXTSAIC7oNhf0eXsz5eI8nDj0nQJF3JMyzlVXIMEPrGV+DBI993o=
Received: from 30.246.178.18(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WuF2a0v_1765161220 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 08 Dec 2025 10:33:41 +0800
Message-ID: <0b277ac2-e454-47b8-a592-d9f57936c3fb@linux.alibaba.com>
Date: Mon, 8 Dec 2025 10:33:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rc v2 3/4] iommu/arm-smmu-v3: Ignore STE EATS when
 computing the update sequence
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, will@kernel.org,
 robin.murphy@arm.com
Cc: joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 skolothumtho@nvidia.com, praan@google.com
References: <cover.1765140287.git.nicolinc@nvidia.com>
 <b3586cb03317fb2362e936e4d303566851b506d4.1765140287.git.nicolinc@nvidia.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <b3586cb03317fb2362e936e4d303566851b506d4.1765140287.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_183346_849954_B78BE6FE 
X-CRM114-Status: GOOD (  20.21  )
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



在 2025/12/8 04:49, Nicolin Chen 写道:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> If a VM wants to toggle EATS off at the same time as changing the CFG, the
> hypervisor will see EATS change to 0 and insert a V=0 breaking update into
> the STE even though the VM did not ask for that.
> 
> In bare metal, EATS is ignored by CFG=ABORT/BYPASS, which is why this does
> not cause a problem until we have nested where CFG is always a variation of
> S2 trans that does use EATS.
> 
> Relax the rules for EATS sequencing, we don't need it to be exact because
> the enclosing code will always disable ATS at the PCI device if we are
> changing EATS. This ensures there are no ATS transactions that can race
> with an EATS change so we don't need to carefully sequence these bits.
> 
> Fixes: 1e8be08d1c91 ("iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 3e161d8298d9..72ba41591fdb 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1095,6 +1095,15 @@ void arm_smmu_get_ste_ignored(__le64 *ignored_bits)
>   	 *  fault records even when MEV == 0.
>   	 */
>   	ignored_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
> +
> +	/*
> +	 * EATS is used to reject and control the ATS behavior of the device. If
> +	 * we are changing it away from 0 then we already trust the device to
> +	 * use ATS properly and we have sequenced the device's ATS enable in PCI
> +	 * config space to prevent it from issuing ATS while we are changing
> +	 * EATS.
> +	 */
> +	ignored_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);
>   }
>   EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_ignored);
>   


Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai

