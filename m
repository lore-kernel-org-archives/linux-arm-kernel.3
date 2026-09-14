Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF28C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 05:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YoZj7ULUnXFEUqLzayKbTSzQn3c5hbr/5knd21qzAo=; b=CgKa2vfPbVxP5S0ZOPSpCdIi0W
	XRPNGkrHAVcnKxvd6W6SjiNdrhBWr4huhLxK2XCCINuhwH0swCjIIwoo9q/jKNi1oJfCB1dNTK4Zt
	Rk5RrgfAVgXSdq6FJMBb1PXGVdXFV5Ktb+XHk1AfUyQJ67IBMV9mvoToUHeyx0tUFvTGSItMow5Dc
	JoAi82sFETHYxaF4GpoFgKeC9K932Oav2lFoKveTUk9a8ZIeEJ24iAmU1MhCUCKUzeaMtHzdZMU/k
	pwLewmw8t6qm73Orl5KhTdcbXvPtYaHo09zge7RcjHcD45G59Hjc40DRUSmt2loye5KvBcKX6yNfo
	3l/u7N8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zWL-00000002O0j-1mhx;
	Mon, 14 Sep 2026 05:46:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zWJ-00000002O0M-1LC8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 05:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789364782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4YoZj7ULUnXFEUqLzayKbTSzQn3c5hbr/5knd21qzAo=;
	b=Oj78Vep72fcZDtcnB+z9Qfb/2D/xGcNgjf0YdE6lBNiQIz/Uyz3jOhut3NIQ5CUX+geMPT
	/8+oP03vGQpJM53Pndy1gEwTBv2nxwBPMoGPXUSVr0Pp896G1544hQZeUflcs/WfsYWs3Y
	0P3M/U4fRbRknobcMF2JmU/uj34NvUE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-Z57AkI7kMLWJqF_Mf4xv9A-1; Mon, 14 Sep 2026 01:46:20 -0400
X-MC-Unique: Z57AkI7kMLWJqF_Mf4xv9A-1
X-Mimecast-MFC-AGG-ID: Z57AkI7kMLWJqF_Mf4xv9A_1789364780
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-399311947f6so5608553a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 22:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364779; x=1789969579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YoZj7ULUnXFEUqLzayKbTSzQn3c5hbr/5knd21qzAo=;
        b=angsR+W1DPbEKqETqJC3HWgr1snEv2ypL3PVKYwgaQG6WgxDAUb4zOofsT9a8WSdFd
         Kay92c1toJkFHRd662kBDgF69YvzJfui7H4cURmOnhBR0iiQwzIpNEirHSbu0eP5uPrb
         oT+R/FWWpFCPm1Pmtejn5dMf5c2wA3TJVNJgBmvfWizqI3fuZClTBUMRQsGZ+tYSKoLf
         jtHLsw8P5KNUTcUOzKrfo7lCUvZWSSh+jH3YOutTbtL5ok70pjJbKWhdODI6pxTSESuB
         9l1n7MKlO8HKe0rnfi+rr0T/7WJk/gSxqldU5Vhm/ywcCOGnIPIJg2elx9JGwEfnTgqD
         1btw==
X-Forwarded-Encrypted: i=1; AKwUvBzZHNxNognWZ1Vv6/C8EKFVmp9cG40/BRxw32WaPidX/ar3sDlyVDLdV3Xnc1zh92YZ2tllppuqVU2zTTXGbg+L@lists.infradead.org
X-Gm-Message-State: AFuF++liqdv5OvpYE0EbXpWkLcj6iD+iLFDHIxru/QjDA2f+nr64D2cO
	Utzqb9SLlLM9PrH9cw2idVJ1o8LCU/RtAOMya8HXVCMram93DLtjMRytTkZOrOUutZWg4OYpEeE
	FQofYpuqeP/g0loj55aPlQprzwxEpQQRvG+ELGTf7IUTwmTqyQ/p5Sy/LQDScDO8dzQ2u5Wob82
	9K
X-Gm-Gg: AYBFou2y3mwPgSNISRA/vwri2/r20C53Ir8V3MvitKwhUvub1paI4o2XGT2yn7puA/m
	9gTjU6mWkP0Nw6WJH9wn4bgACCJLkRrAcUty+stCOF3YTWSxfaI1vb/2Kw4M+OAWM12CM/RhqBN
	R2QdkT8H486MMfPnm6w/0iZCLfAXMtvYpXheheenU2L9K1CR6fVuGRt6E4rCcLkc88ENxOC/cLW
	4Muzr4b1IEB0XeBd6gADK1HIZE1E3Ec8I2whXUf2yhHL8v39Ge/ZRiGY4mtOeATzPKHowHN8iy1
	AWIrkk/FUrpVh9QKh+3/Kj48CzpQv7g2s6SrasvEdB1KVsyBtP/Rrz7OuHhf2JFuVBqzgrmgY1M
	PE032xzNosWrZa51ZoEpkXszgX8s8xOqexgrSMnJa9A==
X-Received: by 2002:a17:90b:39cc:b0:39d:b769:3067 with SMTP id 98e67ed59e1d1-39debdffe17mr2617498a91.0.1789364779237;
        Sun, 13 Sep 2026 22:46:19 -0700 (PDT)
X-Received: by 2002:a17:90b:39cc:b0:39d:b769:3067 with SMTP id 98e67ed59e1d1-39debdffe17mr2617413a91.0.1789364778584;
        Sun, 13 Sep 2026 22:46:18 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d8aa131sm5474141a91.2.2026.09.13.22.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 22:46:17 -0700 (PDT)
Message-ID: <54ac0609-f111-45fb-9c82-3095ddbed006@redhat.com>
Date: Mon, 14 Sep 2026 15:46:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 7/7] firmware: arm_rmm: Add wrappers for Realm related
 RMI commands
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-8-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260912083611.2513845-8-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WR697FVrZKpjXVbPKn-gdB9noqXW5Qcm_EeHXJkOBf8_1789364780
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_224623_520592_F758B63E 
X-CRM114-Status: GOOD (  31.94  )
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

On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Introduce wrappers for the RMI functions needed for creating and
> managing realm guests. This will be used by the KVM to manage the
> Realms
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v17:
>    * Avoid nesting if conditions for output populating RMI calls
>    * Clean up comments
>    * Always use arm_smccc_1_2_invoke() for RMI calls.
> Changes since v16:
>    * Split into a separate patch and move away from arch/arm64 to
>      include/linux/.
>    * Also moved into the firmware_rmm series from the KVM CCA support.
>      This is done in a hope to reduce the merge conflicts and make
>      the KVM CCA upstreaming in independent parallel chunks
> ---
>   include/linux/arm-rmi-cmds.h | 461 +++++++++++++++++++++++++++++++++++
>   1 file changed, 461 insertions(+)
> 

One nitpick for rmi_rtt_data_unmap() below. With it addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> index 27a0c56944976..fd7ef7e82b246 100644
> --- a/include/linux/arm-rmi-cmds.h
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -76,4 +76,465 @@ long rmi_sro_execute(struct arm_smccc_1_2_regs *regs);
>   	__ret;								\
>   })
>   
> +/**
> + * rmi_rtt_data_map_init() - Create a mapping at protected IPA, copying contents
> + *			     from a given non-secure source granule.
> + * @rd: PA of the RD
> + * @data: PA of the target granule mapped in the guest
> + * @ipa: IPA at which the granule @data will be mapped in the guest
> + * @src: PA of the source granule with contents
> + * @flags: RMI_MEASURE_CONTENT if the contents should be measured
> + *
> + * Create a mapping from Protected IPA space to conventional memory, copying
> + * contents from a Non-secure Granule provided by the caller.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rtt_data_map_init(unsigned long rd, unsigned long data,
> +					 unsigned long ipa, unsigned long src,
> +					 unsigned long flags)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RTT_DATA_MAP_INIT, rd, data, ipa, src, flags
> +	};
> +
> +	return rmi_sro_execute(&regs);
> +}
> +
> +/**
> + * rmi_rtt_data_map() - Create mappings in protected IPA range with unknown contents
> + * @rd: PA of the RD
> + * @base: Base of the target IPA range
> + * @top: Top of the target IPA range
> + * @flags: Flags
> + * @oaddr: Output address set descriptor
> + * @out_top: Top address of range which was processed.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rtt_data_map(unsigned long rd,
> +				    unsigned long base,
> +				    unsigned long top,
> +				    unsigned long flags,
> +				    unsigned long oaddr,
> +				    unsigned long *out_top)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RTT_DATA_MAP, rd, base, top, flags, oaddr
> +	};
> +	long ret;
> +
> +	ret = rmi_sro_execute(&regs);
> +
> +	if (ret == RMI_SUCCESS && out_top)
> +		*out_top = regs.a1;
> +
> +	return ret;
> +}
> +
> +/**
> + * rmi_rtt_data_unmap() - Remove mappings to conventional memory at a protected
> + *			  IPA range
> + * @rd: PA of the RD
> + * @base: Base of the target IPA range
> + * @top: Top of the target IPA range
> + * @flags: Flags
> + * @oaddr: Output address set descriptor
> + * @out_top: Returns top IPA of range which has been unmapped
> + * @out_range: Output address range
> + * @out_count: Number of entries in output address list
> + *
> + * Removes mappings to convention memory with a target Protected IPA range.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rtt_data_unmap(unsigned long rd,
> +				      unsigned long base,
> +				      unsigned long top,
> +				      unsigned long flags,
> +				      unsigned long oaddr,
> +				      unsigned long *out_top,
> +				      unsigned long *out_range,
> +				      unsigned long *out_count)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RTT_DATA_UNMAP, rd, base, top, flags, oaddr
> +	};
> +	long ret;
> +
> +	ret = rmi_sro_execute(&regs);
> +
> +	if (ret == RMI_SUCCESS) {
> +		if (out_top)
> +			*out_top = regs.a1;
> +		if (out_range)
> +			*out_range = regs.a2;
> +		if (out_count)
> +			*out_count = regs.a3;
> +	}
> +
> +	return ret;
> +}
> +

The unnecessary if statements could be avoided by:

	if (ret != RMI_SUCCESS)
		return ret;

	if (out_top)
		*out_top = regs.a1;
	if (out_range)
		*out_range = regs.a2;
	if (out_count)
		*out_count = regs.a3;

	return RMI_SUCCESS;

> +/**
> + * rmi_psci_complete() - Complete pending PSCI command
> + * @calling_rec: PA of the calling REC
> + * @status: Status of the PSCI request
> + *
> + * Completes a pending PSCI command.
> + *
> + * Return: RMI return code
> + */
> +static inline long rmi_psci_complete(unsigned long calling_rec,
> +				     unsigned long status)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_PSCI_COMPLETE, calling_rec, status,
> +	};
> +
> +	rmi_smccc_invoke(&regs);
> +	return regs.a0;
> +}
> +
> +/**
> + * rmi_realm_activate() - Activate a realm
> + * @rd: PA of the RD
> + *
> + * Mark a realm as Active, signalling that creation is completed, allowing
> + * execution of the realm.
> + *
> + * Return: RMI return code
> + */
> +static inline long rmi_realm_activate(unsigned long rd)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_REALM_ACTIVATE, rd,
> +	};
> +
> +	rmi_smccc_invoke(&regs);
> +	return regs.a0;
> +}
> +
> +/**
> + * rmi_realm_create() - Create a realm
> + * @rd: PA of the RD
> + * @params: PA of realm parameters
> + * @sro: Preallocated SRO context
> + *
> + * Create a new realm using the given parameters.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_realm_create(unsigned long rd, unsigned long params,
> +				    struct rmi_sro_state *sro)
> +{
> +	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL,
> +				   SMC_RMI_REALM_CREATE, rd, params);
> +}
> +
> +/**
> + * rmi_realm_terminate() - Terminate a realm
> + * @rd: PA of the RD
> + * @sro: Preallocated SRO context
> + *
> + * Terminates a realm, moving it into a ZOMBIE state
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_realm_terminate(unsigned long rd,
> +				       struct rmi_sro_state *sro)
> +{
> +	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL,
> +				   SMC_RMI_REALM_TERMINATE, rd);
> +}
> +
> +/**
> + * rmi_realm_destroy() - Destroy a realm
> + * @rd: PA of the RD
> + * @sro: Preallocated SRO context
> + *
> + * Destroys a realm, all objects belonging to the realm must be destroyed first.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_realm_destroy(unsigned long rd,
> +				     struct rmi_sro_state *sro)
> +{
> +	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL,
> +				   SMC_RMI_REALM_DESTROY, rd);
> +}
> +
> +/**
> + * rmi_rec_create() - Create a REC
> + * @rd: PA of the RD
> + * @rec: PA of the target REC
> + * @params: PA of REC parameters
> + * @sro: Allocated SRO context to be used
> + *
> + * Create a REC using the parameters specified in the struct rec_params pointed
> + * to by @params.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rec_create(unsigned long rd,
> +				  unsigned long rec,
> +				  unsigned long params,
> +				  struct rmi_sro_state *sro)
> +{
> +	long ret;
> +
> +	sro->addr_count = 0;
> +	sro->regs = (struct arm_smccc_1_2_regs) {
> +		SMC_RMI_REC_CREATE, rd, rec, params
> +	};
> +	ret = rmi_sro_memxfer_execute(sro, GFP_KERNEL);
> +	rmi_sro_free(sro);
> +
> +	return ret;
> +}
> +
> +/**
> + * rmi_rec_destroy() - Destroy a REC
> + * @rec: PA of the target REC
> + * @sro: Allocated SRO context to be used
> + *
> + * Destroys a REC. The REC must not be running.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rec_destroy(unsigned long rec,
> +				   struct rmi_sro_state *sro)
> +{
> +	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_REC_DESTROY, rec);
> +}
> +
> +/**
> + * rmi_rec_enter() - Enter a REC
> + * @rec: PA of the target REC
> + * @run_ptr: PA of RecRun structure
> + *
> + * Starts (or continues) execution within a REC.
> + *
> + * Return: RMI return code
> + */
> +static inline long rmi_rec_enter(unsigned long rec, unsigned long run_ptr)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_REC_ENTER, rec, run_ptr,
> +	};
> +
> +	rmi_smccc_invoke(&regs);
> +	return regs.a0;
> +}
> +
> +/**
> + * rmi_rtt_create() - Creates an RTT
> + * @rd: PA of the RD
> + * @rtt: PA of the target RTT
> + * @ipa: Base of the IPA range described by the RTT
> + * @level: Depth of the RTT within the tree
> + *
> + * Creates an RTT (Realm Translation Table) at the specified level for the
> + * translation of the specified address within the realm.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rtt_create(unsigned long rd, unsigned long rtt,
> +				  unsigned long ipa, long level)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RTT_CREATE, rd, rtt, ipa, level
> +	};
> +
> +	return rmi_sro_execute(&regs);
> +}
> +
> +/**
> + * rmi_rtt_destroy() - Destroy an RTT
> + * @rd: PA of the RD
> + * @ipa: Base of the IPA range described by the RTT
> + * @level: RTT level
> + * @out_rtt: Pointer to write the PA of the RTT which was destroyed
> + * @out_top: Pointer to write the top IPA of non-live RTT entries, from entry
> + * at which the RTT walk terminated.
> + *
> + * Destroys an RTT. The RTT must be non-live, i.e. none of the entries in the
> + * table are in ASSIGNED or TABLE state.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code.
> + */
> +static inline long rmi_rtt_destroy(unsigned long rd,
> +				   unsigned long ipa,
> +				   long level,
> +				   unsigned long *out_rtt,
> +				   unsigned long *out_top)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RTT_DESTROY, rd, ipa, level
> +	};
> +	long ret = rmi_sro_execute(&regs);
> +
> +	if (ret != RMI_SUCCESS)
> +		return ret;
> +
> +	if (out_rtt)
> +		*out_rtt = regs.a1;
> +	if (out_top)
> +		*out_top = regs.a2;
> +
> +	return RMI_SUCCESS;
> +}
> +
> +/**
> + * rmi_rtt_fold() - Fold an RTT
> + * @rd: PA of the RD
> + * @ipa: Base of the IPA range described by the RTT
> + * @level: Depth of the RTT within the tree
> + * @out_rtt: Pointer to write the PA of the RTT which was destroyed
> + *
> + * Folds an RTT. If all entries with the RTT are 'homogeneous' the RTT can be
> + * folded into the parent and the RTT destroyed.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rtt_fold(unsigned long rd, unsigned long ipa,
> +				long level, unsigned long *out_rtt)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RTT_FOLD, rd, ipa, level
> +	};
> +	long ret = rmi_sro_execute(&regs);
> +
> +	if (ret == RMI_SUCCESS && out_rtt)
> +		*out_rtt = regs.a1;
> +
> +	return ret;
> +}
> +
> +/**
> + * rmi_rtt_init_ripas() - Set RIPAS for new realm
> + * @rd: PA of the RD
> + * @base: Base of target IPA region
> + * @top: Top of target IPA region
> + * @out_top: Top IPA of range whose RIPAS was modified
> + *
> + * Sets the RIPAS of a target IPA range to RAM, for a realm in the NEW state.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rtt_init_ripas(unsigned long rd, unsigned long base,
> +				      unsigned long top, unsigned long *out_top)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RTT_INIT_RIPAS, rd, base, top
> +	};
> +	long ret = rmi_sro_execute(&regs);
> +
> +	if (ret == RMI_SUCCESS && out_top)
> +		*out_top = regs.a1;
> +
> +	return ret;
> +}
> +
> +/**
> + * rmi_rtt_unprot_map() - Map unprotected granules into a realm
> + * @rd: PA of the RD
> + * @base: Base IPA of the mapping
> + * @top: Top of the target IPA range
> + * @flags: Flags
> + * @oaddr: Output address set descriptor
> + * @out_top: Top IPA of range which has been mapped
> + *
> + * Create mappings to memory within a target unprotected IPA range.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rtt_unprot_map(unsigned long rd,
> +				      unsigned long base,
> +				      unsigned long top,
> +				      unsigned long flags,
> +				      unsigned long oaddr,
> +				      unsigned long *out_top)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RTT_UNPROT_MAP, rd, base, top, flags, oaddr
> +	};
> +	long ret = rmi_sro_execute(&regs);
> +
> +	if (ret == RMI_SUCCESS && out_top)
> +		*out_top = regs.a1;
> +
> +	return ret;
> +}
> +
> +/**
> + * rmi_rtt_set_ripas() - Set RIPAS for an running realm
> + * @rd: PA of the RD
> + * @rec: PA of the REC making the request
> + * @base: Base of target IPA region
> + * @top: Top of target IPA region
> + * @out_top: Pointer to write top IPA of range whose RIPAS was modified
> + *
> + * Completes a request made by the realm to change the RIPAS of a target IPA
> + * range.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rtt_set_ripas(unsigned long rd, unsigned long rec,
> +				     unsigned long base, unsigned long top,
> +				     unsigned long *out_top)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RTT_SET_RIPAS, rd, rec, base, top
> +	};
> +	long ret = rmi_sro_execute(&regs);
> +
> +	if (ret == RMI_SUCCESS && out_top)
> +		*out_top = regs.a1;
> +
> +	return ret;
> +}
> +
> +/**
> + * rmi_rtt_unprot_unmap() - Remove mappings within an unprotected IPA range
> + * @rd: PA of the RD
> + * @base: Base IPA of the mapping
> + * @top: Top of the target IPA range
> + * @flags: Flags
> + * @oaddr: Output address set descriptor
> + * @out_top: Top IPA which has been unmapped
> + * @out_range: Output address range
> + * @out_count: Number of entries in output address list
> + *
> + * Removes mappings to memory within a target unprotected IPA range.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rtt_unprot_unmap(unsigned long rd,
> +					unsigned long base,
> +					unsigned long top,
> +					unsigned long flags,
> +					unsigned long oaddr,
> +					unsigned long *out_top,
> +					unsigned long *out_range,
> +					unsigned long *out_count)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RTT_UNPROT_UNMAP, rd, base, top, flags, oaddr
> +	};
> +	long ret = rmi_sro_execute(&regs);
> +
> +	if (ret != RMI_SUCCESS)
> +		return ret;
> +
> +	if (out_top)
> +		*out_top = regs.a1;
> +	if (out_range)
> +		*out_range = regs.a2;
> +	if (out_count)
> +		*out_count = regs.a3;
> +
> +	return RMI_SUCCESS;
> +}
> +
>   #endif

Thanks,
Gavin


