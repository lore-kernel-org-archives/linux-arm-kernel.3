Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7665AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbGJoZmshmldF/4rsFxhMhwLNbLpK/gf6o6aljkCBcg=; b=A/XSgR2GMPb5s8bTf8dMIaeJLk
	I0PAwXg35WBgHDxg4HsqhjAvFk0Sxu3+cMMjfNEHKwUa5IjFVeoXrXNpFJtxbsadhSR42cBbk2SVs
	XjSVXTL5KobTSBu3GyR54Sy/AguzQfXkIf5uG2ihjEo895QOUdYS7jJejM8P2eI94fyZpmEXjVeFJ
	nQDC+M6MHVOsVWtf0oBqjh5wBBx2CH9fjLpdZl2mtuvD1nevRBCAl1NgjbZ7I+uOp9h0dMdxHEKt9
	px+w8GgfxP+jrf5gL4lSET8J3VW6ijOQi+9Z/9lTE8coBr2oZLFAOirsuO97spgnAEHGe5++b6YJ5
	ObuiwKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkE33-0000000GQk3-2zze;
	Thu, 16 Jul 2026 04:50:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkE30-0000000GQjU-41T1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784177409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QbGJoZmshmldF/4rsFxhMhwLNbLpK/gf6o6aljkCBcg=;
	b=h+N/UxMqhkQ+O2+GM+eGF9MHZJt0DG70Bv1w6HpZs9ttP6DSb8+SyazTNM9+PaAEm/ovt+
	+ZK5qMPNvrF1xie1bWuo5lWDZYZEDncR8HCKswc6pgQY2+1flVsy6EvjZ5fF8g2px81iuH
	dNq8iDoO4LOZCGOxWB2bu3pWwHcbIgI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-JoT2R_YBPzu3LYfrL5HcwA-1; Thu, 16 Jul 2026 00:50:08 -0400
X-MC-Unique: JoT2R_YBPzu3LYfrL5HcwA-1
X-Mimecast-MFC-AGG-ID: JoT2R_YBPzu3LYfrL5HcwA_1784177407
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so2247315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 21:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177407; x=1784782207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbGJoZmshmldF/4rsFxhMhwLNbLpK/gf6o6aljkCBcg=;
        b=aFe6KV0H4DX/0Tr0oJA4N7etlS/KX57jqQlgin/jEqt56awJDqsJOMn8eBqI9H0WPd
         WWXm8FT1zZRqk9aAT1bQdTjt9PcKOynRbPV00UUayGeynfER86tD7fxsT6d+H4YyOMpq
         SOu06tIy2IFCVtlFeZfQSUfnVYAlA+eOxONGzm4qk4B5BPg+hkVssapL1zVRhJMskDo9
         TfGux9TdUFuPXSWVJVb8w4CePOJz2f2hicgqwz+2wVoD1xnFy7ZOn3+yOjjSEr8Eh2xL
         XUvB5QBQWGPX+MTOyI7+sF//N3ukF1hvRnD866pRWNFTRge+Ft2bzSoGISWGuuzaGKdS
         Eigw==
X-Forwarded-Encrypted: i=1; AHgh+RpdDkjyV9LoZWe0165PR5yitiBgyhctr6tMzs8y56ZyzVfQA2YhDgWoGXpmprZgW9Nf7SERORaGFAMIk0mk2Pvc@lists.infradead.org
X-Gm-Message-State: AOJu0YzwOTeDsnFx9OzmiFKa4ElMJFBlGLFcxnlN9588+yjWzUhvTOzM
	LgNBaPODvJh0dchRbbwepotoxs6cAGBM+ivNDzkopgZSziMzrhzykP35m1VKFIsh3MeislWgAsE
	fGM5DN1YTLNgaG5GdojWKZdr6999oazSfaRErs+hAKzAwUKbrgPqqMcKvLiGYROydYPHuB4gRuH
	REgcYew9k6
X-Gm-Gg: AfdE7cnVWDWnoo2XPyZbYAM4oEfWg+2kOM7AFRC0P8TOmzN/MIauUW3AaQRMIDvGnbX
	a+l5hk8xd2Y99caGX038at2f84zDenoAcIq6J1uzpZ/Wt/iIduiB7dMiylGDiR4YUBh9f0E5OEX
	o4wmgEbg32b+f1XrRyoqDiJ2yTG7FclTROWfKPBw3MVyjzGl6IL959TbtgkPOMRPJAOHAWZRs8B
	6OTQpAoqoizRUi8Ja0iFCRv4JrqTHunV9XzsNoLO7XJiLeIyGPfNQ6LJlhXbXCnQsNh6Jp3l7dZ
	I5fipkG40ggcfs4Wdh/ahcNcFTCRbwGkAv2icCq0KICySOZncfK8lDZUcTwFQWHAYe6RA6Ig7d6
	lcZq443JWX//wjAHME1CBfLOo4y1xalYIsO9DKg12wqM=
X-Received: by 2002:a05:6a20:258a:b0:3bf:aa54:4cbc with SMTP id adf61e73a8af0-3c38dbb8287mr1345590637.26.1784177406775;
        Wed, 15 Jul 2026 21:50:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:258a:b0:3bf:aa54:4cbc with SMTP id adf61e73a8af0-3c38dbb8287mr1345551637.26.1784177406264;
        Wed, 15 Jul 2026 21:50:06 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432f1cesm10234714c88.11.2026.07.15.21.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:50:05 -0700 (PDT)
Message-ID: <d102f19a-5214-47af-9ca5-91eaf9645f98@redhat.com>
Date: Thu, 16 Jul 2026 14:49:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/11] arm_mpam: Use __ris_msmon_read() for saving MBWU
 state
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-7-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-7-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: puC3jdt3hrbFCrvMYOMdCzEK2zdjMwy4lTM-6sGV73E_1784177407
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_215011_084095_32F95B89 
X-CRM114-Status: GOOD (  21.67  )
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

On 7/10/26 9:55 PM, Ben Horgan wrote:
> mbwu_save_mbwu_state() reads the MBWU counters and adds that to a saved
> correction value. However, the type of counter to read is determined by the
> RIS rather than the class and overflow is not taken into account. Fix this
> and mitigate against further divergence by using the same helper as used
> for user reads, __ris_msmon_read().
> 
> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 33 +++++++++++++++++++++------------
>   1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 222fc248067e..a49f426aefc0 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1029,12 +1029,6 @@ struct mon_read {
>   	bool				waited_timeout;
>   };
>   
> -static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
> -{
> -	return (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, &ris->props) ||
> -		mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris->props));
> -}
> -
>   static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
>   {
>   	int retry = 3;
> @@ -1687,6 +1681,7 @@ static int mpam_save_mbwu_state(void *arg)
>   	struct mpam_msc_ris *ris = arg;
>   	struct msmon_mbwu_state *mbwu_state;
>   	struct mpam_msc *msc = ris->vmsc->msc;
> +	struct mpam_class *class = ris->vmsc->comp->class;
>   
>   	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>   		mbwu_state = &ris->mbwu_state[i];
> @@ -1702,18 +1697,32 @@ static int mpam_save_mbwu_state(void *arg)
>   		cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
>   		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
>   
> -		if (mpam_ris_has_mbwu_long_counter(ris))
> -			val = mpam_msc_read_mbwu_l(msc);
> -		else
> -			val = mpam_read_monsel_reg(msc, MBWU);
> -
>   		cfg->mon = i;
>   		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
>   		cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
>   		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
> -		mbwu_state->correction += val;
>   		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
>   		mpam_mon_sel_unlock(msc);
> +
> +		if (mbwu_state->enabled) {
> +			struct mon_read mbwu_arg = {
> +				mbwu_arg.ris = ris,
> +				mbwu_arg.ctx = cfg,
> +				mbwu_arg.type = mpam_msmon_choose_counter(class),
> +				mbwu_arg.val = &val,
> +			};
> +
> +			val = 0;
> +			__ris_msmon_read(&mbwu_arg);
> +
> +			if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> +				return -EIO;
> +
> +			mbwu_state->reset_on_next_read = true;
> +			if (!mbwu_arg.err)
> +				mbwu_state->correction = val;
> +			mpam_mon_sel_unlock(msc);
> +		}
>   	}

The unnecessary nested conditional statement can be avoided by
skipping the disabled MBWU state.

		if (!mbwu_state->enabled) {
			mpam_mon_sel_unlock(msc);
			continue;
		}

		mpam_mon_sel_unlock(msc);

		val = 0;
		mbwu_arg.ris = ris;
		mbwu_arg.ctx = cfg;
		mbwu_arg.type = mpam_msmon_choose_counter(class);
		mbwu_arg.val = &val
		__ris_msmon_read(&mbwu_arg);

		:
		:


>   
>   	return 0;

Thanks,
Gavin


