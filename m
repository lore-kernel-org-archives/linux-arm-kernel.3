Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED01606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DFGxHgBd;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jlUDdA7Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4I8C7LS9Ebq+RsUKShRZmElkynjaFDjGXMud7w6ijM8=; b=DFGxHgBdOA2Vt7
	TmtiqbhdIp6OZ3/cHVYH22CK7+K3u8GValDsolJEUs+Cs6OVmy/Kg4V6YfGQgys7oAraBkexoxFg4
	8zivulGrtpSgXifAD/wbKSt99vHF8KE+27Qv1T8rRRi5MOEKjjDY+hHZETMypR4iagX1GS3CjJCqZ
	dyszDrdyStwfMEF9mZn3nU6fx3whbH22oN1UyWLoYmG9blboJAfTxYHT/ptAWwRPPtN2Pns//fgrE
	+5Q5n9ut5LZbmDnvUt5P1bbHqU+oWRFlLli61jMEpndXCpH0LSwxVcS+CQ9/S5YKdDCr5UmJH9sUF
	kni+zz/o2YQ8xGXGYdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFYY-0000000GQWE-3IMW;
	Fri, 23 Oct 2026 13:43:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFYV-0000000GQV4-1jDw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:43:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E2F01C00;
	Fri, 23 Oct 2026 06:43:28 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFFD83F959;
	Fri, 23 Oct 2026 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792763011; bh=fCH8Bmguz7AIGj8B74jO3aVsHYpkx2Drb51PhaFvVVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jlUDdA7Q6YhVFyc3r63QNHS9/fYgwiCfXdlLas7xY55jXXVRMEOVNu1pW87w4JKC8
	 cU2SnHFz2xhR0mLxjQkYnOVkHvEo0x1jyT3tWrZovDoR8l0gGMtADTPqsqbDajasrn
	 COO49/fSsUfhMquBHURVeAEupUdXM/sWVp+tOG/k=
Message-ID: <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
Date: Fri, 23 Oct 2026 14:43:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
To: Samiullah Khawaja <skhawaja@google.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260925011308.3381953-4-skhawaja@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_064335_569252_77C05C09 
X-CRM114-Status: GOOD (  26.39  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/09/2026 2:13 am, Samiullah Khawaja wrote:
> S1 domains are programmed by CD entries in the CD table. During a new
> domain attach these are updated using write_cd_entry. Since ASID and
> TTB0 are in different 64-bit words, the write_cd_entry considers it a
> non-hitless update and sets V=0. This means such an update is disruptive
> and would generate translation faults if there are ongoing DMAs.
> 
> Replace the CD entries by using an unused temporary ASID in following
> sequence to allow hitless replacement of CD entry,
> 
> - Update the CD entry with temporary ASID.
> - Update the CD entry with the target TTB0.
> - Update the CD entry with the target ASID.
> 
> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 66 ++++++++++++++++++++-
>   1 file changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 5732f3ba0122..59f4b8cf89f6 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1641,6 +1641,68 @@ void arm_smmu_write_cd_entry(struct arm_smmu_master *master, int ssid,
>   	arm_smmu_write_entry(&cd_writer.writer, cdptr->data, target->data);
>   }
>   
> +/* Invalidate every stage-1 TLB entry tagged with @asid. */
> +static void arm_smmu_tlb_inv_asid(struct arm_smmu_device *smmu, u16 asid)
> +{
> +	enum arm_smmu_cmdq_opcode op = (smmu->features & ARM_SMMU_FEAT_E2H) ?
> +					       CMDQ_OP_TLBI_EL2_ASID :
> +					       CMDQ_OP_TLBI_NH_ASID;
> +
> +	arm_smmu_cmdq_issue_cmd_with_sync(smmu,
> +					  arm_smmu_make_cmd_tlbi(op, asid, 0));
> +}

Feels like this should probably use the existing invalidation machinery...

> +
> +static void arm_smmu_cd_set_asid(struct arm_smmu_cd *cd, u16 asid)
> +{
> +	cd->data[0] &= ~cpu_to_le64(CTXDESC_CD_0_ASID);
> +	cd->data[0] |= cpu_to_le64(FIELD_PREP(CTXDESC_CD_0_ASID, asid));
> +}
> +
> +static void arm_smmu_replace_cd_entry(struct arm_smmu_master *master, int ssid,
> +				      struct arm_smmu_cd *cdptr,
> +				      const struct arm_smmu_cd *target)
> +{
> +	struct arm_smmu_device *smmu = master->smmu;
> +	struct arm_smmu_cd stage;
> +	u32 tmp_asid;
> +
> +	lockdep_assert_held(&arm_smmu_asid_lock);
> +
> +	/*
> +	 * Nothing is translating through an invalid CD, and an update that
> +	 * invalidates one cannot be made hitless anyway.
> +	 */
> +	if (!(cdptr->data[0] & cpu_to_le64(CTXDESC_CD_0_V)) ||
> +	    !(target->data[0] & cpu_to_le64(CTXDESC_CD_0_V)))
> +		goto write_directly;
> +
> +	if (xa_alloc(&arm_smmu_asid_xa, &tmp_asid, XA_ZERO_ENTRY,
> +		     XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL))
> +		goto write_directly;
> +
> +	/* Copy the existing cd entry and update only the ASID. */
> +	stage = *cdptr;
> +	arm_smmu_cd_set_asid(&stage, tmp_asid);
> +	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
> +
> +	/* Copy the target cd entry and update ASID to the temporary ASID. */
> +	stage = *target;
> +	arm_smmu_cd_set_asid(&stage, tmp_asid);
> +	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
> +
> +	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
> +
> +	/* Update to the target cd entry as it should be hitless now. */
> +	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
> +
> +	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
> +	xa_erase(&arm_smmu_asid_xa, tmp_asid);
> +	return;
> +
> +write_directly:
> +	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
> +}
> +
>   void arm_smmu_make_s1_cd(struct arm_smmu_cd *target,
>   			 struct arm_smmu_master *master,
>   			 struct arm_smmu_domain *smmu_domain)
> @@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
>   		struct arm_smmu_cd target_cd;
>   
>   		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
> -		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
> -					&target_cd);
> +		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
> +					  &target_cd);

No, we cannot blindly do this for arbitrary ->attach_dev calls - the 
majority of S1->S1 transitions are going to be moving back and forth 
between the default domain and user domains, where there is zero 
expectation, let alone guarantee, that the translations would be 
equivalent and thus not liable to lead to TLB conflict aborts or 
amalgamation hell.

This needs to be in a dedicated "I know what I'm doing and I fully 
accept the consequences if I get it wrong" call path.

Thanks,
Robin.

>   		arm_smmu_make_cdtable_ste(&target, master, state.ats_enabled,
>   					  STRTAB_STE_1_S1DSS_SSID0);
>   		arm_smmu_install_ste_for_dev(master, &target);


