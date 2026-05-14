Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AF0CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 08:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1r306kBheAkrQGBihlT36n4qp6ujIg1DBW8NVxi1+6s=; b=uYpjNsMs6ZeY/JzUrRTxDU27EM
	/oKsTOTdx/pk2OR0QA97aokVajWOyRGgCdiOSgoEVg/L41VwEw0Nm1YCYDouYqDRynaupdKxW5lhh
	XW15zKilhnkS2T/0K0V9iSlBaAAzgmRHWwyY1pGMw9X8wKMFSN0M5d/5MwJLDaUOXvOkX1Nil/XyA
	xTZzfYLlSDMWxv2l1mpXpvh93EMfTy4CmFR/jZOISvfLONNFLnhWBLjtXnkXcbc2q8l9vCWSpQyNu
	yCeFULKcZDYglwNGsAe4qiHJgU/h6pv1J02VoLmIqp32LsmJT98kxX59bjyZ5O5i78876wttgo3hw
	ptknBuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNR0W-00000004tKQ-2ob1;
	Thu, 14 May 2026 08:01:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNR0U-00000004tJu-09Vd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 08:01:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EC974020C;
	Thu, 14 May 2026 08:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873E2C2BCC7;
	Thu, 14 May 2026 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778745681;
	bh=YTT3wpiFKK2siKn7VB9xMRxwfCKefIy+RDPtffN3pIg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KfuT90G2ESMWQbmWA7EwQ+PxsLgj/Ta0NabGR6iGez+3gbJJ8F6mlQ13yKjbvA+WJ
	 uw3uv6k+KUBUmNSACOZ8BgnFzfKaXoiFX+o49MPEZfegdjPqJv75rmMTA+cpMTx9Rr
	 pZmrEw2U1EAGmfEUbuI/CpEk1QfZQzJjBDVsSDyACzpFmbD6gDQlr4xuItiqqmzvqW
	 xQwDijnGx6/3fan8w5F5COM3fI58wYFJwSKVjPIabnbKGbyzMkDoCZPvUgYGjwoiWn
	 ziTb4MKhIuBt19SCK/WqPQJxBRasw9psTnM9Ruj9zAE4E2HDyH9VR/dZvKMxRmDZ0M
	 2kjUJ85XtKh9Q==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: Re: [PATCH v14 10/44] arm64: RMI: Add support for SRO
In-Reply-To: <20260513131757.116630-11-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-11-steven.price@arm.com>
Date: Thu, 14 May 2026 13:31:08 +0530
Message-ID: <yq5a8q9ma08r.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_010122_120349_F7A27E7D 
X-CRM114-Status: GOOD (  16.24  )
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

Steven Price <steven.price@arm.com> writes:

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

Can you also add support to return x1,x2 etc

This would help things like

static int rmi_rtt_dev_unmap(unsigned long rd_phys,
		unsigned long base, unsigned long top,
		unsigned long *out_ipa, unsigned long *out_desc,
		unsigned long *rmi_ret)
{
	unsigned long flags = RMI_ADDR_TYPE_SINGLE;
	struct rmi_sro_state *sro __free(sro) =
		rmi_sro_init(SMC_RMI_RTT_DEV_UNMAP, rd_phys, base, top, flags, NULL);
	if (!sro)
		return -ENOMEM;

	*rmi_ret = rmi_sro_execute(sro);
	if (*rmi_ret)
		return 0;

	*out_ipa = sro->regs.a1;
	*out_desc = sro->regs.a2;

	return 0;
}

-aneesh

