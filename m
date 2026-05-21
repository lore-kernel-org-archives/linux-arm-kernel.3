Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE41CD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 04:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggCKS8QEvnLR4SsIv3hBNn6nRmerd7pd3z3ZeYISTIg=; b=Q55vmIjk8CVT/U41z0SsPjD6Qr
	0C4Eo0nkvMYF+UK6t4CN08MzwJkmXXg1m68mIwQZntkJZ6UfZfsTGeilYcSXqANBmsXhxBYWibXr7
	oRbBzpCnaEMNCb63+Nrb9bQ3eiL0u+r85cfgqWUSWitHoZAxqJ77R6iIoNGhbYy4ugfQxvYtmSgZr
	Ok6bANT0jXInLI5hQd2y2Eb6z2P8Fc1Ytddm7D4c8QpgL5Y0cMOAsd2IfyZa+wnVcaPUdNIxIGY5F
	DGZB6sbPEgIraiDzXfs7AwNZagyMfltlAA9OKSaQd6t4GKsGFIjoKskHM0qnKrvaooo1kYWQxyyMI
	YGz3O2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPvBm-00000006fhR-29Zn;
	Thu, 21 May 2026 04:39:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPvBj-00000006fgo-3WWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 04:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779338354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ggCKS8QEvnLR4SsIv3hBNn6nRmerd7pd3z3ZeYISTIg=;
	b=Z+c0nDI//LowMwh2QMZH31ji/wiCNookSqywTG9gL8ILFitwntEyqhV+XVEe2jyvcl9Kni
	eHgMQcgQsO3YhESWnYhekrgwMUI485j+R1o6O++puWRDg77M4oyEGqXMvNnmmoTtETnPkt
	DcCJsDbqF8a6AHou7XeySd4qALvOEnA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-MRM0vVAaMXKUQ_Q5N12Klw-1; Thu, 21 May 2026 00:39:12 -0400
X-MC-Unique: MRM0vVAaMXKUQ_Q5N12Klw-1
X-Mimecast-MFC-AGG-ID: MRM0vVAaMXKUQ_Q5N12Klw_1779338351
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c81086bf930so4120023a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 21:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779338351; x=1779943151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggCKS8QEvnLR4SsIv3hBNn6nRmerd7pd3z3ZeYISTIg=;
        b=sSTXq/UvkkqkXwu60QTdAhI6EtvI75jn9Z/9Ix4fIcrQEL5WNgdNd3RIYtWXTCpr1M
         FZUEVXD+TWK4THg1Tr0wvHI9iTQ+Hg16PH6QOo8c+w5qrG3x9V+Fe0PXt0GLQYTTbjha
         tM0qXcIA8s+FAXyxb/VBLi2wF42pRzVxiL/wt3C1oHEtGpKuqd8R+Sdj7SUdaLbE36k5
         Mve8jqm/ntunvNjTY4fbb20qjG1ncsQCHtttKBgWcad+3+0kkq1LCrvwbMxd8vNwM9Ld
         dKlpu3PsRSRuSbGGbusYTlM4MN1VKJm85PfmpRUU2PKxXnSTMqMuzIh96xbRf6tizZ0o
         33Ag==
X-Forwarded-Encrypted: i=1; AFNElJ8NQOg20FRVXbxb1218a9FWXyY4NY8WdEel6mcLlPT/M0NQCHWqUEnWo078dWKnUJxBb9yIhakziqyMBozbW0bb@lists.infradead.org
X-Gm-Message-State: AOJu0YwgB+lUWZBD+GKZcGO1s1rnQt71VuKWe0WSGOwIHnZ3IN+hMYxE
	gJ9ikcCVtQSck8XJ0jf0ro70cHzH6g1ZDmdsy5RhFRHBzjef1IrgFXAhMvMYMW9CmMJR7GplQ0s
	e70FZOBe9NwRllw95t0PzoOwoxzSpKLlQDhdpVxMVU852eUbrXPRd5Q7856l3uzi2DZkpzAyfDa
	HC
X-Gm-Gg: Acq92OFlMYAxhBJGQep29XvFQcUJoHp5Kq28dzfk2awe5l3iUxaeXr/Uv0bIR7L8U5+
	ZoFAPKYGQUdHWu3qox4obKrpUEo/uwqsl7XfXvfgC5AeWGp5qcMj/8ZuATMQZO7oq3ejY4u0wL9
	SV6Ioy15w0x0ziJw39yHTLaSALsFfr5DhZv+7i2vgiwK8Rv9vlmawPWsvYNuAfg6vnoqcdq1Y30
	iTVOLxd+pqrgkYaws0ncDgR++rbb0yc7LEL2wRu778xLHxgSExyIe7OJe06e9ZxyW9nAnFW+fYv
	uuc7jqy1iW4Oau6YICE1ub3yEPK7rOmdmHybwsjfFziNqCNkTFSSeXH876U7YuSQ263Yoy+QYDP
	N3k6vXX8dd/s7IOC2XKsoPVmr9hwfYw43Vd0fN6UdFQj61ZKGa4cfVIeYejG3vpj0
X-Received: by 2002:a05:6a20:4305:b0:3a3:171f:6afb with SMTP id adf61e73a8af0-3b307bdf25amr1353958637.4.1779338351416;
        Wed, 20 May 2026 21:39:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:4305:b0:3a3:171f:6afb with SMTP id adf61e73a8af0-3b307bdf25amr1353913637.4.1779338350895;
        Wed, 20 May 2026 21:39:10 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82c4031662sm20535429a12.16.2026.05.20.21.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 21:39:10 -0700 (PDT)
Message-ID: <872ce762-0a83-42a4-bbe8-b21ea6f4e1cf@redhat.com>
Date: Thu, 21 May 2026 14:38:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 10/44] arm64: RMI: Add support for SRO
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-11-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-11-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qNNlzxLLmi_VVlQewqO7B08-uSM0Vjj2sdnU0b9_QzA_1779338351
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_213916_030204_50FE375F 
X-CRM114-Status: GOOD (  36.09  )
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

Hi Steven,

On 5/13/26 11:17 PM, Steven Price wrote:
> RMM v2.0 introduces the concept of "Stateful RMI Operations" (SRO). This
> means that an SMC can return with an operation still in progress. The
> host is excepted to continue the operation until is reaches a conclusion
> (either success or failure). During this process the RMM can request
> additional memory ('donate') or hand memory back to the host
> ('reclaim'). The host can request an in progress operation is cancelled,
> but still continue the operation until it has completed (otherwise the
> incomplete operation may cause future RMM operations to fail).
> 
> The SRO is tracked using a struct rmi_sro_state object which keeps track
> of any memory which has been allocated but not yet consumed by the RMM
> or reclaimed from the RMM. This allows the memory to be reused in a
> future request within the same operation. It will also permit an
> operation to be done in a context where memory allocation may be
> difficult (e.g. atomic context) with the option to abort the operation
> and retry the memory allocation outside of the atomic context. The
> memory stored in the struct rmi_sro_state object can then be reused on
> the subsequent attempt.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> v14:
>   * SRO support has improved although is still not fully complete. The
>     infrastructure has been moved out of KVM.
> ---
>   arch/arm64/include/asm/rmi_cmds.h |   1 +
>   arch/arm64/kernel/rmi.c           | 359 ++++++++++++++++++++++++++++++
>   2 files changed, 360 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
> index eb213c8e6f26..1a7b0c8f1e38 100644
> --- a/arch/arm64/include/asm/rmi_cmds.h
> +++ b/arch/arm64/include/asm/rmi_cmds.h
> @@ -35,6 +35,7 @@ struct rmi_sro_state {
>   
>   int rmi_delegate_range(phys_addr_t phys, unsigned long size);
>   int rmi_undelegate_range(phys_addr_t phys, unsigned long size);
> +int free_delegated_page(phys_addr_t phys);
>   
>   static inline int rmi_delegate_page(phys_addr_t phys)
>   {
> diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
> index 08cef54acadb..a8107ca9bb6d 100644
> --- a/arch/arm64/kernel/rmi.c
> +++ b/arch/arm64/kernel/rmi.c
> @@ -48,6 +48,365 @@ int rmi_undelegate_range(phys_addr_t phys, unsigned long size)
>   	return ret;
>   }
>   
> +static unsigned long donate_req_to_size(unsigned long donatereq)
> +{
> +	unsigned long unit_size = RMI_DONATE_SIZE(donatereq);
> +
> +	switch (unit_size) {
> +	case 0:
> +		return PAGE_SIZE;
> +	case 1:
> +		return PMD_SIZE;
> +	case 2:
> +		return PUD_SIZE;
> +	case 3:
> +		return P4D_SIZE;
> +	}
> +	unreachable();
> +}
> +

It's worthy to have 'inline'. {P4D, PUD, PMD}_SIZE can be equal if there are
no P4D and PUD, depending on CONFIG_PGTABLE_LEVELS. In this case, can the
'unit_size' be translated to wrong value?

> +static void rmi_smccc_invoke(struct arm_smccc_1_2_regs *regs_in,
> +			     struct arm_smccc_1_2_regs *regs_out)
> +{
> +	struct arm_smccc_1_2_regs regs = *regs_in;
> +	unsigned long status;
> +
> +	do {
> +		arm_smccc_1_2_invoke(&regs, regs_out);
> +		status = RMI_RETURN_STATUS(regs_out->a0);
> +	} while (status == RMI_BUSY || status == RMI_BLOCKED);
> +}
> +
> +int free_delegated_page(phys_addr_t phys)
> +{
> +	if (WARN_ON(rmi_undelegate_page(phys))) {
> +		/* Undelegate failed: leak the page */
> +		return -EBUSY;
> +	}
> +
> +	free_page((unsigned long)phys_to_virt(phys));
> +
> +	return 0;
> +}
> +
> +static int rmi_sro_ensure_capacity(struct rmi_sro_state *sro,
> +				   unsigned long count)
> +{
> +	if (WARN_ON_ONCE(sro->addr_count > RMI_MAX_ADDR_LIST))
> +		return -EOVERFLOW;
> +
> +	if (count > RMI_MAX_ADDR_LIST - sro->addr_count)
> +		return -ENOSPC;
> +
> +	return 0;
> +}
> +
> +static int rmi_sro_donate_contig(struct rmi_sro_state *sro,
> +				 unsigned long sro_handle,
> +				 unsigned long donatereq,
> +				 struct arm_smccc_1_2_regs *out_regs,
> +				 gfp_t gfp)
> +{
> +	unsigned long unit_size = RMI_DONATE_SIZE(donatereq);
> +	unsigned long unit_size_bytes = donate_req_to_size(donatereq);
> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
> +	unsigned long state = RMI_DONATE_STATE(donatereq);
> +	unsigned long size = unit_size_bytes * count;
> +	unsigned long addr_range;
> +	int ret;
> +	void *virt;
> +	phys_addr_t phys;
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_OP_MEM_DONATE,
> +		sro_handle
> +	};
> +
> +	for (int i = 0; i < sro->addr_count; i++) {
> +		unsigned long entry = sro->addr_list[i];
> +
> +		if (RMI_ADDR_RANGE_SIZE(entry) == unit_size &&
> +		    RMI_ADDR_RANGE_COUNT(entry) == count &&
> +		    RMI_ADDR_RANGE_STATE(entry) == state) {
> +			sro->addr_count--;
> +			swap(sro->addr_list[sro->addr_count],
> +			     sro->addr_list[i]);
> +
> +			goto out;
> +		}
> +	}
> +
> +	ret = rmi_sro_ensure_capacity(sro, 1);
> +	if (ret)
> +		return ret;
> +
> +	virt = alloc_pages_exact(size, gfp);
> +	if (!virt)
> +		return -ENOMEM;
> +	phys = virt_to_phys(virt);
> +

alloc_pages_exact() will fail if the requested size exceeds the maximal allowed
size (1 << MAX_PAGE_ORDER). The maximal size is usually smaller than PUD_SIZE
but PUD_SIZE is allowed by the RMM.

> +	if (state == RMI_OP_MEM_DELEGATED) {
> +		if (rmi_delegate_range(phys, size)) {
> +			free_pages_exact(virt, size);
> +			return -ENXIO;
> +		}
> +	}
> +
> +	addr_range = phys & RMI_ADDR_RANGE_ADDR_MASK;
> +	FIELD_MODIFY(RMI_ADDR_RANGE_SIZE_MASK, &addr_range, unit_size);
> +	FIELD_MODIFY(RMI_ADDR_RANGE_COUNT_MASK, &addr_range, count);
> +	FIELD_MODIFY(RMI_ADDR_RANGE_STATE_MASK, &addr_range, state);
> +
> +	sro->addr_list[sro->addr_count] = addr_range;
> +
> +out:
> +	regs.a2 = virt_to_phys(&sro->addr_list[sro->addr_count]);
> +	regs.a3 = 1;
> +	rmi_smccc_invoke(&regs, out_regs);
> +
> +	unsigned long donated_granules = out_regs->a1;
> +	unsigned long donated_size = donated_granules << PAGE_SHIFT;
> +
> +	if (donated_granules == 0) {
> +		/* No pages used by the RMM */
> +		sro->addr_count++;
> +	} else if (donated_size < size) {
> +		phys = sro->addr_list[sro->addr_count] & RMI_ADDR_RANGE_ADDR_MASK;
> +
> +		/* Not all granules used by the RMM, free the remaining pages */
> +		for (long i = donated_size; i < size; i += PAGE_SIZE) {
> +			if (state == RMI_OP_MEM_DELEGATED)
> +				free_delegated_page(phys + i);
> +			else
> +				__free_page(phys_to_page(phys + i));
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int rmi_sro_donate_noncontig(struct rmi_sro_state *sro,
> +				    unsigned long sro_handle,
> +				    unsigned long donatereq,
> +				    struct arm_smccc_1_2_regs *out_regs,
> +				    gfp_t gfp)
> +{
> +	unsigned long unit_size = RMI_DONATE_SIZE(donatereq);
> +	unsigned long unit_size_bytes = donate_req_to_size(donatereq);
> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
> +	unsigned long state = RMI_DONATE_STATE(donatereq);
> +	unsigned long found = 0;
> +	unsigned long addr_list_start = sro->addr_count;
> +	int ret;
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_OP_MEM_DONATE,
> +		sro_handle
> +	};
> +
> +	for (int i = 0; i < addr_list_start && found < count; i++) {
> +		unsigned long entry = sro->addr_list[i];
> +
> +		if (RMI_ADDR_RANGE_SIZE(entry) == unit_size &&
> +		    RMI_ADDR_RANGE_COUNT(entry) == 1 &&
> +		    RMI_ADDR_RANGE_STATE(entry) == state) {
> +			addr_list_start--;
> +			swap(sro->addr_list[addr_list_start],
> +			     sro->addr_list[i]);
> +			found++;
> +			i--;
> +		}
> +	}
> +
> +	ret = rmi_sro_ensure_capacity(sro, count - found);
> +	if (ret)
> +		return ret;
> +
> +	while (found < count) {
> +		unsigned long addr_range;
> +		void *virt = alloc_pages_exact(unit_size_bytes, gfp);
> +		phys_addr_t phys;
> +
> +		if (!virt)
> +			return -ENOMEM;
> +
> +		phys = virt_to_phys(virt);
> +
> +		if (state == RMI_OP_MEM_DELEGATED) {
> +			if (rmi_delegate_range(phys, unit_size_bytes)) {
> +				free_pages_exact(virt, unit_size_bytes);
> +				return -ENXIO;
> +			}
> +		}
> +
> +		addr_range = phys & RMI_ADDR_RANGE_ADDR_MASK;
> +		FIELD_MODIFY(RMI_ADDR_RANGE_SIZE_MASK, &addr_range, unit_size);
> +		FIELD_MODIFY(RMI_ADDR_RANGE_COUNT_MASK, &addr_range, 1);
> +		FIELD_MODIFY(RMI_ADDR_RANGE_STATE_MASK, &addr_range, state);
> +
> +		sro->addr_list[sro->addr_count++] = addr_range;
> +		found++;
> +	}
> +
> +	regs.a2 = virt_to_phys(&sro->addr_list[addr_list_start]);
> +	regs.a3 = found;
> +	rmi_smccc_invoke(&regs, out_regs);
> +
> +	unsigned long donated_granules = out_regs->a1;
> +
> +	if (WARN_ON(donated_granules & ((unit_size_bytes >> PAGE_SHIFT) - 1))) {
> +		/*
> +		 * FIXME: RMM has only consumed part of a huge page, this leaks
> +		 * the rest of the huge page
> +		 */
> +		donated_granules = ALIGN(donated_granules,
> +					 (unit_size_bytes >> PAGE_SHIFT));
> +	}
> +	unsigned long donated_blocks = donated_granules / (unit_size_bytes >> PAGE_SHIFT);
> +
> +	if (WARN_ON(donated_blocks > found))
> +		donated_blocks = found;
> +
> +	unsigned long undonated_blocks = found - donated_blocks;
> +
> +	while (donated_blocks && undonated_blocks) {
> +		sro->addr_count--;
> +		swap(sro->addr_list[addr_list_start],
> +		     sro->addr_list[sro->addr_count]);
> +		addr_list_start++;
> +
> +		donated_blocks--;
> +		undonated_blocks--;
> +	}
> +	sro->addr_count -= donated_blocks;
> +
> +	return 0;
> +}
> +
> +static int rmi_sro_donate(struct rmi_sro_state *sro,
> +			  unsigned long sro_handle,
> +			  unsigned long donatereq,
> +			  struct arm_smccc_1_2_regs *regs,
> +			  gfp_t gfp)
> +{
> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
> +
> +	if (WARN_ON(!count))
> +		return 0;
> +
> +	if (RMI_DONATE_CONTIG(donatereq)) {
> +		return rmi_sro_donate_contig(sro, sro_handle, donatereq,
> +					     regs, gfp);
> +	} else {
> +		return rmi_sro_donate_noncontig(sro, sro_handle, donatereq,
> +						regs, gfp);
> +	}
> +}
> +
> +static int rmi_sro_reclaim(struct rmi_sro_state *sro,
> +			   unsigned long sro_handle,
> +			   struct arm_smccc_1_2_regs *out_regs)
> +{
> +	unsigned long capacity;
> +	struct arm_smccc_1_2_regs regs;
> +	int ret;
> +
> +	ret = rmi_sro_ensure_capacity(sro, 1);
> +	if (ret)
> +		rmi_sro_free(sro);
> +
> +	capacity = RMI_MAX_ADDR_LIST - sro->addr_count;
> +
> +	regs = (struct arm_smccc_1_2_regs){
> +		SMC_RMI_OP_MEM_RECLAIM,
> +		sro_handle,
> +		virt_to_phys(&sro->addr_list[sro->addr_count]),
> +		capacity
> +	};
> +	rmi_smccc_invoke(&regs, out_regs);
> +
> +	if (WARN_ON_ONCE(out_regs->a1 > capacity))
> +		out_regs->a1 = capacity;
> +
> +	sro->addr_count += out_regs->a1;
> +
> +	return 0;
> +}
> +
> +void rmi_sro_free(struct rmi_sro_state *sro)
> +{
> +	for (int i = 0; i < sro->addr_count; i++) {
> +		unsigned long entry = sro->addr_list[i];
> +		unsigned long addr = RMI_ADDR_RANGE_ADDR(entry);
> +		unsigned long unit_size = RMI_ADDR_RANGE_SIZE(entry);
> +		unsigned long count = RMI_ADDR_RANGE_COUNT(entry);
> +		unsigned long state = RMI_ADDR_RANGE_STATE(entry);
> +		unsigned long size = donate_req_to_size(unit_size) * count;
> +
> +		if (state == RMI_OP_MEM_DELEGATED) {
> +			if (WARN_ON(rmi_undelegate_range(addr, size))) {
> +				/* Leak the pages */
> +				continue;
> +			}
> +		}
> +		free_pages_exact(phys_to_virt(addr), size);
> +	}
> +
> +	sro->addr_count = 0;
> +}
> +
> +unsigned long rmi_sro_execute(struct rmi_sro_state *sro, gfp_t gfp)
> +{
> +	unsigned long sro_handle;
> +	struct arm_smccc_1_2_regs regs;
> +	struct arm_smccc_1_2_regs *regs_in = &sro->regs;
> +
> +	rmi_smccc_invoke(regs_in, &regs);
> +
> +	sro_handle = regs.a1;
> +
> +	while (RMI_RETURN_STATUS(regs.a0) == RMI_INCOMPLETE) {
> +		bool can_cancel = RMI_RETURN_CAN_CANCEL(regs.a0);
> +		int ret;
> +
> +		switch (RMI_RETURN_MEMREQ(regs.a0)) {
> +		case RMI_OP_MEM_REQ_NONE:
> +			regs = (struct arm_smccc_1_2_regs){
> +				SMC_RMI_OP_CONTINUE, sro_handle, 0
> +			};
> +			rmi_smccc_invoke(&regs, &regs);
> +			break;

'ret' isn't initialized for case RMI_OP_MEM_REQ_NONE.

> +		case RMI_OP_MEM_REQ_DONATE:
> +			ret = rmi_sro_donate(sro, sro_handle, regs.a2, &regs,
> +					     gfp);
> +			break;
> +		case RMI_OP_MEM_REQ_RECLAIM:
> +			ret = rmi_sro_reclaim(sro, sro_handle, &regs);
> +			break;
> +		default:
> +			ret = WARN_ON(1);
> +			break;
> +		}
> +
> +		if (ret) {
> +			if (can_cancel) {
> +				/*
> +				 * FIXME: Handle cancelling properly!
> +				 *
> +				 * If the operation has failed due to memory
> +				 * allocation failure then the information on
> +				 * the memory allocation should be saved, so
> +				 * that the allocation can be repeated outside
> +				 * of any context which prevented the
> +				 * allocation.
> +				 */
> +			}
> +			if (WARN_ON(ret))
> +				return ret;
> +		}
> +	}
> +
> +	return regs.a0;
> +}
> +
>   static int rmi_check_version(void)
>   {
>   	struct arm_smccc_res res;

Thanks,
Gavin


