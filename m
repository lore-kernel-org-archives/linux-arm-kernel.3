Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19141C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 11:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIj0S75Nq583PWPyqj5G995an+ZD2/gTQqnPSbczUig=; b=VV1HyEgraShEHTIs/kG+8vCuDG
	cj9QoaqbXVZ0NObcsqa8cufJgr/RJO4NqOq+RjpW5iTdp6PnbVqTYb5/0OMTElPxBpf+rp261Ers+
	6Lt0fhtHyik2EDo/mpTrLsGfv0ZerkQwmdU8cnDdip8QVZ6kXU453pfZTMJO+alvPMh+waqSC7O4P
	zmnB9QJJU3qQO4JcinwmNjs/CvTDvVa6bW3kVZR6s0yNHOI0sc7GLBABJl5Q8zevzEoHoCJk/ukFX
	9ov9WZjCo0xAocDgy6X1OoyopzQQ50KiQrvJNcED1WmE+aeT331mtmAiVBb95ccyFdvJOikjn/O3j
	9SfMFOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td6AK-00000006pQW-1xby;
	Wed, 29 Jan 2025 11:23:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td62v-00000006oRT-2Ucq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 11:15:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4368a290e0dso105965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 03:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738149347; x=1738754147; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lIj0S75Nq583PWPyqj5G995an+ZD2/gTQqnPSbczUig=;
        b=Bb0CUCCgfvWYtwJAQUvxHM+qP/yxHUSEWLXQoDmfAzFz9qGEpT+t2CAydmyooZBpKl
         BYHPxyb3+BRnb6+U1BM8Rv8NfJwuBMC30jA150bWmw8zKIWK5A2+XNbrdH//dqTPC4kC
         YL8If5RnFYkqJxdpJOsm96Q2fA07+hAgYYXy2gDvG7BglN8ho+/XDQ36M5pg3JcOaW87
         MCq3H/EqFdUayMO9nJCrRulUncrCtpP2rK2iySLLOgmhUnr72SY5rjTFqL1q1g0wKC9V
         HWX38VQWUMqQkXzXE22cgYtKdyLGzcacsraKHq9XfMc1Tr07+vx2EDIBgVJfF9qJMqRH
         +kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738149347; x=1738754147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lIj0S75Nq583PWPyqj5G995an+ZD2/gTQqnPSbczUig=;
        b=F/NdG8LCwZd02k62etKlxvZr0E9vnvAWR3zET8UuUhLv53LOrHS690/ldeMlLbf4c/
         ZFfQ945sAXMBDoIV5c5t3KVNs+KIGfHDV0LiEB6KqrVy9hMQTDDOPBksVj6/yjFQ23Z0
         zZ/UzAjc+od0B/Q1yCjl4kYHNcMvyHXD7NW1cV+UtZaMIAgnqbjxJChsXTDJ2uwtd7zV
         AyrSZrWu/SGl4mYcjFAaLEr5yaVy81oitEHRONq9U9LX0yafAybPQpSg2cWNznEbyYNl
         xnhN828f1XA7JlTAHbKAiBelLoWZT/JpNSj3DLqUh++HIPHST79QWr/kF642cMLVqNy4
         phOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/wePJ4+WC+XhSpUpkhAnTHHucWYWVFTadvmXgQNH104YJb+X5iFPNq4fjrl2hU0DVGp+4BOmhX4csBkv+Iglq@lists.infradead.org
X-Gm-Message-State: AOJu0YwVnWAXTUZfzOEK7GjyvmSHcQOukhEJL+wYfvZzdXQxDHeDYQfr
	le9k+0I0kQnWrDnVgLRqrCVCfQazC/at0anfOx2FNGSC46Y9fEuXY3aS7FD2wg==
X-Gm-Gg: ASbGncv2RXaUR2y2phtAGMTZB+mbN45rdJbQAkJzZ5qcqahTeR49PY4K4nDb7kWcpGm
	maQzxF+WiK9dMlGb3U+cYqfO00qIynC6eUcFSHEAXTRoavJwZEHG+fipRFnoINGTiml9K+j3YEi
	OEuCh095Ea43HJQs2lctfbCg68565KpaRULlgdb21e6wMfVTNYSiaTaGJJJ2eCrUfDjwhjKL9Fm
	77K1kd790MeLUrMMQZ0uv1Em1y/zN9jWMcGX38p5IJps4svsLM5r8sIPoH0Pc7CoeJIP3So2e94
	4adbhS1x3r6mibSKO659jYOm2ZDP/EJma9E/nZNyy3W1F2rT7XQ=
X-Google-Smtp-Source: AGHT+IHxyZfWztzZgfuJiUeDYUFJ1Qtfo43qMHUxbq5Zh05k0OwXtJFs0omeilOH7fX0Bdxckb3jCg==
X-Received: by 2002:a05:600c:1f84:b0:42b:a961:e51 with SMTP id 5b1f17b1804b1-438dc21f186mr939945e9.0.1738149347033;
        Wed, 29 Jan 2025 03:15:47 -0800 (PST)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc52096sm19488465e9.39.2025.01.29.03.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:15:46 -0800 (PST)
Date: Wed, 29 Jan 2025 11:15:42 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	jean-philippe@linaro.org, jgg@ziepe.ca, nicolinc@nvidia.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 27/58] KVM: arm64: smmu-v3: Setup command queue
Message-ID: <Z5oN3sAk2RY4vyOr@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-28-smostafa@google.com>
 <4e9d04e4-729d-483d-8533-06b3e0a2fb04@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e9d04e4-729d-483d-8533-06b3e0a2fb04@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_031549_691065_338579CE 
X-CRM114-Status: GOOD (  28.05  )
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

On Thu, Jan 23, 2025 at 01:01:55PM +0000, Robin Murphy wrote:
> On 2024-12-12 6:03 pm, Mostafa Saleh wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > Map the command queue allocated by the host into the hypervisor address
> > space. When the host mappings are finalized, the queue is unmapped from
> > the host.
> 
> Don't forget the fun of reimplementing the errata workarounds to avoid
> generating certain problematic command sequences - beware it's mostly
> implicit in the current kernel driver :)

Thanks, I see I missed “ARM_SMMU_OPT_CMDQ_FORCE_SYNC”, I will try to re-use
as much of the command queue code as possible in v3, although it’s unlikely
the hypervisor will have the some insertion algorithm as the host, but at
least for the command population.

Thanks,
Mostafa

> 
> Thanks,
> Robin.
> 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 165 ++++++++++++++++++++
> >   include/kvm/arm_smmu_v3.h                   |   4 +
> >   2 files changed, 169 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
> > index f7e60c188cb0..e15356509424 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
> > @@ -41,6 +41,15 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
> >   	__ret;							\
> >   })
> > +#define smmu_wait_event(_smmu, _cond)				\
> > +({								\
> > +	if ((_smmu)->features & ARM_SMMU_FEAT_SEV) {		\
> > +		while (!(_cond))				\
> > +			wfe();					\
> > +	}							\
> > +	smmu_wait(_cond);					\
> > +})
> > +
> >   static int smmu_write_cr0(struct hyp_arm_smmu_v3_device *smmu, u32 val)
> >   {
> >   	writel_relaxed(val, smmu->base + ARM_SMMU_CR0);
> > @@ -60,6 +69,123 @@ static void smmu_reclaim_pages(u64 phys, size_t size)
> >   	WARN_ON(__pkvm_hyp_donate_host(phys >> PAGE_SHIFT, size >> PAGE_SHIFT));
> >   }
> > +#define Q_WRAP(smmu, reg)	((reg) & (1 << (smmu)->cmdq_log2size))
> > +#define Q_IDX(smmu, reg)	((reg) & ((1 << (smmu)->cmdq_log2size) - 1))
> > +
> > +static bool smmu_cmdq_full(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u64 cons = readl_relaxed(smmu->base + ARM_SMMU_CMDQ_CONS);
> > +
> > +	return Q_IDX(smmu, smmu->cmdq_prod) == Q_IDX(smmu, cons) &&
> > +	       Q_WRAP(smmu, smmu->cmdq_prod) != Q_WRAP(smmu, cons);
> > +}
> > +
> > +static bool smmu_cmdq_empty(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u64 cons = readl_relaxed(smmu->base + ARM_SMMU_CMDQ_CONS);
> > +
> > +	return Q_IDX(smmu, smmu->cmdq_prod) == Q_IDX(smmu, cons) &&
> > +	       Q_WRAP(smmu, smmu->cmdq_prod) == Q_WRAP(smmu, cons);
> > +}
> > +
> > +static int smmu_add_cmd(struct hyp_arm_smmu_v3_device *smmu,
> > +			struct arm_smmu_cmdq_ent *ent)
> > +{
> > +	int i;
> > +	int ret;
> > +	u64 cmd[CMDQ_ENT_DWORDS] = {};
> > +	int idx = Q_IDX(smmu, smmu->cmdq_prod);
> > +	u64 *slot = smmu->cmdq_base + idx * CMDQ_ENT_DWORDS;
> > +
> > +	if (smmu->iommu.power_is_off)
> > +		return -EPIPE;
> > +
> > +	ret = smmu_wait_event(smmu, !smmu_cmdq_full(smmu));
> > +	if (ret)
> > +		return ret;
> > +
> > +	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
> > +
> > +	switch (ent->opcode) {
> > +	case CMDQ_OP_CFGI_ALL:
> > +		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
> > +		break;
> > +	case CMDQ_OP_CFGI_CD:
> > +		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SSID, ent->cfgi.ssid);
> > +		fallthrough;
> > +	case CMDQ_OP_CFGI_STE:
> > +		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
> > +		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
> > +		break;
> > +	case CMDQ_OP_TLBI_NH_VA:
> > +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
> > +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
> > +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
> > +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
> > +		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
> > +		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
> > +		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
> > +		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;
> > +		break;
> > +	case CMDQ_OP_TLBI_NSNH_ALL:
> > +		break;
> > +	case CMDQ_OP_TLBI_NH_ASID:
> > +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
> > +		fallthrough;
> > +	case CMDQ_OP_TLBI_S12_VMALL:
> > +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
> > +		break;
> > +	case CMDQ_OP_TLBI_S2_IPA:
> > +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
> > +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
> > +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
> > +		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
> > +		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
> > +		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
> > +		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_IPA_MASK;
> > +		break;
> > +	case CMDQ_OP_CMD_SYNC:
> > +		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (i = 0; i < CMDQ_ENT_DWORDS; i++)
> > +		slot[i] = cpu_to_le64(cmd[i]);
> > +
> > +	smmu->cmdq_prod++;
> > +	writel(Q_IDX(smmu, smmu->cmdq_prod) | Q_WRAP(smmu, smmu->cmdq_prod),
> > +	       smmu->base + ARM_SMMU_CMDQ_PROD);
> > +	return 0;
> > +}
> > +
> > +static int smmu_sync_cmd(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	int ret;
> > +	struct arm_smmu_cmdq_ent cmd = {
> > +		.opcode = CMDQ_OP_CMD_SYNC,
> > +	};
> > +
> > +	ret = smmu_add_cmd(smmu, &cmd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return smmu_wait_event(smmu, smmu_cmdq_empty(smmu));
> > +}
> > +
> > +__maybe_unused
> > +static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
> > +			 struct arm_smmu_cmdq_ent *cmd)
> > +{
> > +	int ret = smmu_add_cmd(smmu, cmd);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	return smmu_sync_cmd(smmu);
> > +}
> > +
> >   static int smmu_init_registers(struct hyp_arm_smmu_v3_device *smmu)
> >   {
> >   	u64 val, old;
> > @@ -94,6 +220,41 @@ static int smmu_init_registers(struct hyp_arm_smmu_v3_device *smmu)
> >   	return 0;
> >   }
> > +static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u64 cmdq_base;
> > +	size_t cmdq_nr_entries, cmdq_size;
> > +	int ret;
> > +	enum kvm_pgtable_prot prot = PAGE_HYP;
> > +
> > +	cmdq_base = readq_relaxed(smmu->base + ARM_SMMU_CMDQ_BASE);
> > +	if (cmdq_base & ~(Q_BASE_RWA | Q_BASE_ADDR_MASK | Q_BASE_LOG2SIZE))
> > +		return -EINVAL;
> > +
> > +	smmu->cmdq_log2size = cmdq_base & Q_BASE_LOG2SIZE;
> > +	cmdq_nr_entries = 1 << smmu->cmdq_log2size;
> > +	cmdq_size = cmdq_nr_entries * CMDQ_ENT_DWORDS * 8;
> > +
> > +	cmdq_base &= Q_BASE_ADDR_MASK;
> > +
> > +	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
> > +		prot |= KVM_PGTABLE_PROT_NORMAL_NC;
> > +
> > +	ret = ___pkvm_host_donate_hyp_prot(cmdq_base >> PAGE_SHIFT,
> > +					   PAGE_ALIGN(cmdq_size) >> PAGE_SHIFT,
> > +					   false, prot);
> > +	if (ret)
> > +		return ret;
> > +
> > +	smmu->cmdq_base = hyp_phys_to_virt(cmdq_base);
> > +
> > +	memset(smmu->cmdq_base, 0, cmdq_size);
> > +	writel_relaxed(0, smmu->base + ARM_SMMU_CMDQ_PROD);
> > +	writel_relaxed(0, smmu->base + ARM_SMMU_CMDQ_CONS);
> > +
> > +	return 0;
> > +}
> > +
> >   static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
> >   {
> >   	int ret;
> > @@ -113,6 +274,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
> >   	if (ret)
> >   		return ret;
> > +	ret = smmu_init_cmdq(smmu);
> > +	if (ret)
> > +		return ret;
> > +
> >   	return kvm_iommu_init_device(&smmu->iommu);
> >   }
> > diff --git a/include/kvm/arm_smmu_v3.h b/include/kvm/arm_smmu_v3.h
> > index fb24bcef1624..393a1a04edba 100644
> > --- a/include/kvm/arm_smmu_v3.h
> > +++ b/include/kvm/arm_smmu_v3.h
> > @@ -16,8 +16,12 @@ struct hyp_arm_smmu_v3_device {
> >   	struct kvm_hyp_iommu	iommu;
> >   	phys_addr_t		mmio_addr;
> >   	size_t			mmio_size;
> > +	unsigned long		features;
> >   	void __iomem		*base;
> > +	u32			cmdq_prod;
> > +	u64			*cmdq_base;
> > +	size_t			cmdq_log2size;
> >   };
> >   extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
> 

