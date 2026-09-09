Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C067BC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nSCBRaPtDIkAJm5QAiHh9cgImBPw7ThpI3/NAdqqvM=; b=g82+5exVd7Udv7qCW75jBNCpTC
	xvaQ6FmMDVs5+7jonknTWJTO0GhovDagWmDkPGe19QUglha5OXYxf/g3hruq4nNRlEGPhO1rRKgwK
	3Mrx0BcQXqsSePXr8rY7wOZr05dOy6K24a1I5gZrDUhKm5co32rX0S8BWLWvB4sepZUkka5BniHT8
	+0QSLIFhf0K3U6uSvdPrWaf621lyTsnL1Mzk5ihTGQK3rdiIKbkBkURcMVdD0Bdsel4TRlPgfjmM8
	h05qXy0Lm5P+Qh3eSrth8f1E0UUBkTSsRZML91BVL32S4GFpi8DfLLUJm8JZlTHQKgbbf/SXeLdfB
	UgJHkoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CXb-0000000AxRY-2r97;
	Wed, 09 Sep 2026 07:16:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CXZ-0000000AxQV-2IF9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788938174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3nSCBRaPtDIkAJm5QAiHh9cgImBPw7ThpI3/NAdqqvM=;
	b=WULXzV0bAGpFeU54Iz7u5hx2n+Lqb4iXipAm69vivFMgxUGcXTTEzJ4AP0vxbrF0DzaZlt
	kv9OpeIJgYuureNnwp+1vg+s6l/SnGokiSTAxvJJrEcjt6fdzmNe/juhcP+v72vV0Jh5mx
	MF7AXE75jCu0pF5K1OgyhKc26LNRZaE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-pIw-m39wP5etZWOJCOZnvw-1; Wed, 09 Sep 2026 03:16:11 -0400
X-MC-Unique: pIw-m39wP5etZWOJCOZnvw-1
X-Mimecast-MFC-AGG-ID: pIw-m39wP5etZWOJCOZnvw_1788938170
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so8546881a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 00:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938170; x=1789542970;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3nSCBRaPtDIkAJm5QAiHh9cgImBPw7ThpI3/NAdqqvM=;
        b=dj4eka75y5KeweXoSy0hRh6tdXHKkqBrwMPKkPDitj9HzCOKrkNEjerT450aoY4Gzn
         asGzTgQ2jeDgfiqKdN23Tmt9e6n67yr0OxlMqc4VKKFXg5tLakKwmZJ0SXxqPWSY36z6
         5Jq3mSBmtz17HmoK47/ceKglb/cGJhV/9p4kSR8bIpDibNK+o68YAonCIr9amqsHRK7a
         W1f3MM1WGweoPEHvvaMAuoZDm8idX2JBkTq+7zD2fsNmzxOFDAYNdGiYi+3iEjsiaSjn
         x+aRqRcypsaHmYlLYQEWB8CB2GAr8ifDGkAIQjzuHsElUzsRLM2scPssS35Jfo4ChNWG
         C7qw==
X-Forwarded-Encrypted: i=1; AKwUvByP9R9o6Vq6shxbsEbwZrJFrpHhhgtqtff/V9mHupvBf6iMsun8daEcJsZUXGl+qU7y4mu9AC9dvlLpET4rCgBU@lists.infradead.org
X-Gm-Message-State: AFuF++k+zlWs8japxft1bIgjdvVJpd5gZJhX8ke4low1wcNMP3IZOeDE
	3XxljWx2VJ25cgE8je3qQv2+oLjG0xHnN6RwwgCRzLrIIQjPy+DZSdRVl/v2BTMvfq98zHHWe69
	VS4NfvqkfaN7u4gO9kpZe1vfaxY15H7vOXPcqbDx0RH7aFGzOqXsuOOJoqO7jX/6vlPu7YpF2SD
	Ow
X-Gm-Gg: AYBFou1EpoZ9phG1kLyyl+KChbv289A70MXkeiOg6LgCTVX690joc0AaubOjwcDxqK5
	0YlxzHnGvIj9sYwBe1kADrC91swu87LGaEPV+gnNk/L8BPdlTOAP9PZx4phgWgCoHfVhH1bH6ET
	uxiKxZZPv0cFFFz2M/mHvLyw08WDwF4hmHbGcd3v0WGBMpAyeIYBOhi0lvUbDco+yfXrVHCXkpP
	qBFiWHTOXy4LjVMypNXy7NZ7TeUzUBF62WZZPGfnG/zH5/Cb9UdfZQsYMsLZ/YMXqOUfa0UJjYh
	MwyKzS1AFR8HZLvIml2tyzAdioh24MWoYR1TKfFb6cU+3v1O3RLLMctv4ldrCGmY04a3CyGzxQU
	jF5OXf+tXEf6hjmu5IBTbXSiGAXs3N7tSn/jwNy29qA==
X-Received: by 2002:a17:90b:5743:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39b8bc9422emr8480342a91.2.1788938169598;
        Wed, 09 Sep 2026 00:16:09 -0700 (PDT)
X-Received: by 2002:a17:90b:5743:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39b8bc9422emr8480293a91.2.1788938168914;
        Wed, 09 Sep 2026 00:16:08 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm37441647a91.15.2026.09.09.00.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:16:08 -0700 (PDT)
Message-ID: <de7e2d98-2faa-4e16-8164-d7247d31dbd5@redhat.com>
Date: Wed, 9 Sep 2026 17:15:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 7/7] firmware: arm_rmm: Add wrappers for Realm related
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
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-8-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260907095942.1140734-8-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9wpcnUVunVZxl_cBsVGS5JOihangyMB4M2yw22NBHLQ_1788938170
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_001617_748620_AB5594F6 
X-CRM114-Status: GOOD (  31.58  )
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

On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Introduce wrappers for the RMI functions needed for creating and
> managing realm guests. This will be used by the KVM to manage the
> Realms
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v16:
>    * Split into a separate patch and move away from arch/arm64 to
>      include/linux/.
>    * Also moved into the firmware_rmm series from the KVM CCA support.
>      This is done in a hope to reduce the merge conflicts and make
>      the KVM CCA upstreaming in independent parallel chunks
> ---
>   include/linux/arm-rmi-cmds.h | 453 +++++++++++++++++++++++++++++++++++
>   1 file changed, 453 insertions(+)
> 
> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> index 79e2c1f165112..746257d77dd61 100644
> --- a/include/linux/arm-rmi-cmds.h
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -222,4 +222,457 @@ static inline long rmi_granule_range_undelegate(unsigned long base,
>   	return ret;
>   }
>   
> +/**
> + * rmi_rtt_data_map_init() - Create a protected mapping with data contents
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

s/Create a protected mapping with data contents/Create a mappings in protected IPA with known contents

With this, it's consistently counterpart of the comments for rmi_rtt_data_map().

> + * @rd: PA of the RD
> + * @data: PA of the target granule
> + * @ipa: IPA at which the granule will be mapped in the guest
> + * @src: PA of the source granule
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
> + * rmi_rtt_data_map() - Create mappings in protected IPA with unknown contents
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
> + * rmi_rtt_data_unmap() - Remove mappings to conventional memory
> + * @rd: PA of the RD for the target Realm
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

It would be worthwhile to mention 'in protect IPA' where the mappings are
teared down. Besides, 'for the target Realm' can be dropped from the comments
for @rd.

/**
  * rmi_rtt_data_unmap() - Remove mappings to conventional memory in protected IPA
  * @rd: PA of the RD
  *  :
  */

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

The nested if statements can be avoided if we have:

	if (ret != RMI_SUCCESS)
		return ret;

	if (out_top)
		*out_top = regs.a1;
	if (out_range)
		*out_range = regs.a2;
	if (out_count)
		*out_count = regs.a3;

	return RMI_SUCCESS;

> +
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
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_PSCI_COMPLETE, calling_rec, status, &res);
> +
> +	return res.a0;
> +}
> +
> +/**
> + * rmi_realm_activate() - Active a realm
> + * @rd: PA of the RD
> + *
> + * Mark a realm as Active signalling that creation is complete and allowing
                                                          ^^^^^^^^

s/complete/completed ?

> + * execution of the realm.
> + *
> + * Return: RMI return code
> + */
> +static inline long rmi_realm_activate(unsigned long rd)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_REALM_ACTIVATE, rd, &res);
> +
> +	return res.a0;
> +}
> +
> +/**
> + * rmi_realm_create() - Create a realm
> + * @rd: PA of the RD
> + * @params: PA of realm parameters
> + * @sro: Preallocated SRO context to be used

We needn't to have 'to be used. This comment applies to other helpers
like rmi_realm_terminate(), rmi_realm_destroy(), rmi_rec_create(),
rmi_rec_destroy() where a preallocated SRO context is needed.

     * @sro: Preallocated SRO context

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
> + * @sro: Preallocated SRO context to be used
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
> + * @sro: Preallocated SRO context to be used
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

     * @sro: Preallocated SRO context

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
> +	*sro = (struct rmi_sro_state){.regs = {
> +		SMC_RMI_REC_CREATE, rd, rec, params
> +	}};
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

     * @sro: Preallocated SRO context

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
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_REC_ENTER, rec, run_ptr, &res);
> +
> +	return res.a0;
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
> + * @rd: PA of the RD for the target realm

     * @rd: PA of the RD

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
> +	if (ret == RMI_SUCCESS) {
> +		if (out_rtt)
> +			*out_rtt = regs.a1;
> +		if (out_top)
> +			*out_top = regs.a2;
> +	}
> +
> +	return ret;
> +}
> +

The nested if statements can be avoided if we have:

	if (ret != RMI_SUCCESS)
		return ret;

	if (out_rtt)
		*out_rtt = regs.a1;
	if (out_top)
		*out_top = regs.a2;

	return RMI_SUCCESS;

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

The nested if statements can be avoided if we have:

	if (ret != RMI_SUCCESS)
		return ret;

	if (out_top)
		*out_top = regs.a1;
	if (out_range)
		*out_range = regs.a2;
	if (out_count)
		*out_count = regs.a3;

	return RMI_SUCCESS;
	

>   #endif

Thanks,
Gavin


