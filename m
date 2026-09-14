Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D726FC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KtDUE8QALpUJLh3cgBbWg1ocfjcrZvSFipwaQH4psI=; b=t3RQvFxyMEv97zOOb5ExY+SKWh
	sICmGMFrKd9PUej1u+a2RY98n8sy3NsiwlBPfc1D7Yx9hP+vBi8iqT+g/zld1rz08b58DGjwmWn0F
	pycBh0pUJrx/ASl0D38QOLbTHsLeM0ca+5miKMxZsgYQHmk7xW6nRjRHybQkKYyHiWNZokquSVAMv
	V+IfyZW1K6F4FrIM2sFoRPQTVLvwcb4qol4oBrQLFMzGSbZe/ifET1tfgU8055iuN1IdZNj3u1Olg
	JZCjoHDr+bjGUfkWlXk1jPVFs2onBE8ui8u/vA7JqMRJmrzP6IEURxlLMqB3KkPd0ZgwCNxk2u6PX
	gko2b2tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x668Z-00000003dr4-2ozK;
	Mon, 14 Sep 2026 12:50:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x668U-00000003dnt-1nWW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:50:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92F12601EF;
	Mon, 14 Sep 2026 12:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE0E1F0089D;
	Mon, 14 Sep 2026 12:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789390213;
	bh=0KtDUE8QALpUJLh3cgBbWg1ocfjcrZvSFipwaQH4psI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WBGGVmxOUCEh3LMm77M0VRx1+J+hDYYDfi9zOUc4kWZFJId3IhvguKBreC/qR0ter
	 CQrsPrSD7gyL953Fccu8ukkFeSgc4F2UJcQR7mcb9I6Uwc3FublSEM9i92aofhTSur
	 VozJDOfsIu7Fo9Jyh+v8qGZZKaGlMU1lY+cewReSvzimsh7yFSh/P45rflbt1Yu/A+
	 uP7Cw0TQo+9nVuFxou8mg2bTfh6sLx/KrRnZm1TGcQwtKZn9PjFY0eVYTMqcKtrUC+
	 42oFM9g3Z/+cKHQ0tKI6HynatUWCyTn2sNsq36Kh+MZlEmMFuWCL939rnXIp+z8kHh
	 i+o/qTsTEqgkw==
Date: Mon, 14 Sep 2026 13:50:07 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, will@kernel.org,
	catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 4/7] firmware: arm_rmm: Add support for SRO
Message-ID: <20260914-talkative-healthy-pogona-334c03@sudeepholla>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-5-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912083611.2513845-5-suzuki.poulose@arm.com>
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

On Sat, Sep 12, 2026 at 09:36:07AM +0100, Suzuki K Poulose wrote:
> RMM v2.0 introduces the concept of "Stateful RMI Operations" (SRO). This
> means that an SMC can return with an operation still in progress. The
> host is expected to continue the operation until it reaches a conclusion
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
> Wrappers for SRO RMI commands are also provided here because they depend
> on the rmi_sro_execute() implementation added by this patch.
> Delegate/undelegate handles are also added here because they now use the
> SRO/stateful command infrastructure and are also used for the memory
> DONATE/RECLAIM flows.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

[...]

> +static int rmi_sro_donate_noncontig(struct rmi_sro_state *sro,
> +				    unsigned long sro_handle,
> +				    unsigned long donatereq,
> +				    struct arm_smccc_1_2_regs *out_regs,
> +				    gfp_t gfp)
> +{
> +	unsigned long block_size_fld = RMI_DONATE_BLOCK_SIZE(donatereq);
> +	unsigned long block_size = rmi_addr_block_size_to_bytes(block_size_fld);
> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
> +	unsigned long state = RMI_DONATE_STATE(donatereq);
> +	unsigned long found = 0;
> +	unsigned long donated_granules;
> +	unsigned long granules_per_block = block_size >> PAGE_SHIFT;
> +	unsigned long consumed_blocks;
> +	int addr_list_start = sro->addr_count;
> +
> +	int ret;
> +
> +	for (int i = 0; i < addr_list_start && found < count; i++) {
> +		unsigned long entry = sro->addr_list[i];
> +
> +		if (RMI_ADDR_RANGE_BLOCK_SIZE(entry) == block_size_fld &&
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
> +		void *virt = alloc_pages_exact(block_size, gfp);
> +		phys_addr_t phys;
> +
> +		if (!virt)
> +			return -ENOMEM;
> +
> +		phys = virt_to_phys(virt);
> +
> +		if (state == RMI_OP_MEM_DELEGATED) {

Based on my understanding, rmi_sro_memxfer_execute() is an exported function
and can be invoked by any module. The donatereq argument appears to accept one
of three operations:

RMI_OP_MEM_DELEGATED
RMI_OP_MEM_UNDELEGATED
RMI_OP_MEM_CONDITIONAL

Currently, the check confirming the state is RMI_OP_MEM_DELEGATED occurs
relatively late in the function execution. It seems this function is 
explicitly designed to handle only RMI_OP_MEM_DELEGATED.

Given that this is an exported interface, would it make sense to
fail-fast by moving this validation to the very beginning of the function?
Even if RMI_OP_MEM_CONDITIONAL is intended for future use, it should 
probably be rejected as invalid for now. Also, it is not clear why the
current check is inside the loop while the state itself doesn't get
modified.

If this is a valid concern, the same architectural pattern should likely be
applied to rmi_sro_donate_contig().

-- 
Regards,
Sudeep

