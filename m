Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AA7CA5FEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vdo0qnYDrXLCXtFaJcl+GhOfaYV/uNMOUVAlOziaLwk=; b=swFIxRmYf9nMlyyex/op5DvtcW
	RR7lyKsfNIia4LNdhiA+E5B1ZoKydJzPS1T5AuEz7n2rGpc0MAfMkjWJxDzd9DdHNQQiaxzUZMqva
	9Q9rW8r3Jz1kWXjoHkFxhaPP3U8qD84zJXnsWqriYfi5dP62vjQCpQV+JGVO6jzCvxAJAL9DDYl0a
	XXYLHuNNhiDFgYmrGC38rNVkmsbUUSZahH1Y337AVGMhgp64kiWCor0omLi3ajF841kqnuXHOiORU
	Z+ZTg29LlQAaD+/ZY1EbCYb6oDkQRqsbjF1LpeaSBxQPEMeIGFILDrqgMzzK9HxlDzOmlTzF3AjU/
	o2C4OcOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjH1-00000001RYd-1Ong;
	Mon, 19 Jan 2026 07:02:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjGy-00000001RXa-3orw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 07:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768806120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vdo0qnYDrXLCXtFaJcl+GhOfaYV/uNMOUVAlOziaLwk=;
	b=NzYYexLyn9YJi/AsWYrTLVLLXibykfJv5W/2dmLSkwYcsnI9uoh1SJuvEnj9TlSwkrOLEX
	Tn6N3yGdhczOLRRa17qOkU3BnUfOpKQweJvVyr8H2LDkxG1flh0Z/LclFuJqDCjBvQK3Gg
	MyRWRJYfsDy/dUEUD2xyQbtxSN07XCQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-QspCdDjENmuzYhc6f4cuqQ-1; Mon, 19 Jan 2026 02:01:55 -0500
X-MC-Unique: QspCdDjENmuzYhc6f4cuqQ-1
X-Mimecast-MFC-AGG-ID: QspCdDjENmuzYhc6f4cuqQ_1768806114
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e952f153so93014305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 23:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768806114; x=1769410914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vdo0qnYDrXLCXtFaJcl+GhOfaYV/uNMOUVAlOziaLwk=;
        b=lPMd3FaVjYTqAGhKVUvE8hIkCINZb/JhW2muyViCO++GKtuY4bv9DHkROq+OwBP2wD
         2itFqcxTyFn7ch1PDOqYyEdVknjt0S9hTUhe2hqrkYpRosby/y43++EMF3ESEArn8lo3
         a+ItX7ZM5Kc/JBsBKDiQYIT00i6zhr1WgvErU4zMt4OUwWk/BXXFSplJHUjPvwiGZtss
         nVuD/ogH2Wlqb9fV8q/rpCY8/Wp0eAiwX45Q2eQJ8o6xMS+4RmQJH92c8Hb21XDKkvZA
         s/s/qlUHeGRRoPqOH9clrCnsuW0bNdFL4m4y2B+rsgAIuiDAWAWdwRGRrXvozrygLmRM
         oOxA==
X-Forwarded-Encrypted: i=1; AJvYcCVZbuqEbb4ME2HBv98qhqXz09UJuiy1mJ4bLCSu2v2jVS9QGQJiHOyvbwQw1lI2NJIR7qOgdJA4zFdSzFgHtuNv@lists.infradead.org
X-Gm-Message-State: AOJu0YwfPjr14cafspmNSRNy4IHCzKi9h9OCH5cHYD7kr325wqenWW/z
	6O2tETm95n5JhDMl2Z8WyubvB1MHhVyh5XVcEvE5O685HPMVtsI1GT95I08sYM+p+ZgaFfU9Spj
	AUGmwLfQ4xPpAJkelqomzwFXnJswBvXpiDHtFgrN7WAJXkRaUOEOEDpshlS9s0bpmvKRFlKCuVb
	Fl
X-Gm-Gg: AZuq6aIbYbLO00YyvDnIKOd1Du3Od1PiBzmkLKvBhvP7J7x/Zf012hiBcCtvJrnnVrZ
	KS/K1am/rt+ZPxPaPCCo0SYpRzaUAeCmOUJTX1bVDgpaXHLdVsJdzLYgejh0nM0VaXcCJ7tGQkO
	UY6L0J/o4P93t0/q+4Wv4otSo+VaN034fHWZSEsGMu6bmwsJpthBQ7lSg8ggZRV2lO3/uho+7j4
	EdIX8I1y3K7hO6tvQDHeX3+6QiBRY22d55TqggzE/n29YWosKiB4h0TipWV8+k7P9WjuS7NIWBA
	LlzSK3GJse6232bE2YTTQEgvPpF/rQNk7iUquGaVLANE+ERQNY6Dxi5ujI85DwvAHzfLBPaUYGb
	TIVmmFoPzfw0=
X-Received: by 2002:a17:903:2f82:b0:2a5:8c95:d823 with SMTP id d9443c01a7336-2a717529fcbmr87592505ad.10.1768806114241;
        Sun, 18 Jan 2026 23:01:54 -0800 (PST)
X-Received: by 2002:a17:903:2f82:b0:2a5:8c95:d823 with SMTP id d9443c01a7336-2a717529fcbmr87592265ad.10.1768806113791;
        Sun, 18 Jan 2026 23:01:53 -0800 (PST)
Received: from [10.72.112.128] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab9cbsm85652905ad.14.2026.01.18.23.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 23:01:53 -0800 (PST)
Message-ID: <57a015c3-9a4b-478b-8cb6-6c61f84c0b74@redhat.com>
Date: Mon, 19 Jan 2026 15:01:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/47] arm64: mpam: Add helpers to change a task or
 cpu's MPAM PARTID/PMG values
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-12-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-12-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mtz-vhB6cG7AcDXGVn60E_UT9nCLRF4CiljPVWHV2VQ_1768806114
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_230201_262965_5FCFA0AF 
X-CRM114-Status: GOOD (  19.31  )
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

Hi Ben,

On 1/13/26 12:58 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Care must be taken when modifying the PARTID and PMG of a task in any
> per-task structure as writing these values may race with the task being
> scheduled in, and reading the modified values.
> 
> Add helpers to set the task properties, and the CPU default value.  These
> use WRITE_ONCE() that pairs with the READ_ONCE() in mpam_get_regval() to
> avoid causing torn values.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Keep comment attached to mpam_get_regval()
> Add internal helper, __mpam_regval() (Jonathan)
> ---
>   arch/arm64/include/asm/mpam.h | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
> index 7b3d3abad162..c9b73f1af7ce 100644
> --- a/arch/arm64/include/asm/mpam.h
> +++ b/arch/arm64/include/asm/mpam.h
> @@ -4,6 +4,7 @@
>   #ifndef __ASM__MPAM_H
>   #define __ASM__MPAM_H
>   
> +#include <linux/bitfield.h>
>   #include <linux/jump_label.h>
>   #include <linux/percpu.h>
>   #include <linux/sched.h>
> @@ -22,6 +23,22 @@ DECLARE_PER_CPU(u64, arm64_mpam_current);
>    */
>   extern u64 arm64_mpam_global_default;
>   
> +static inline u64 __mpam_regval(u16 partid_d, u16 partid_i, u8 pmg_d, u8 pmg_i)
> +{
> +	return FIELD_PREP(MPAM0_EL1_PARTID_D, partid_d) |
> +		FIELD_PREP(MPAM0_EL1_PARTID_I, partid_i) |
> +		FIELD_PREP(MPAM0_EL1_PMG_D, pmg_d) |
> +		FIELD_PREP(MPAM0_EL1_PMG_I, pmg_i);
> +}

Nitpick: Alignment issues in the lines for 2nd/3rd/4th FIELD_PREP().

	return FIELD_PREP(...) |
	       FIELD_PREP(...) |
                FIELD_PREP(...) |
                FIELD_PREP(...);

> +
> +static inline void mpam_set_cpu_defaults(int cpu, u16 partid_d, u16 partid_i,
> +					 u8 pmg_d, u8 pmg_i)
> +{
> +	u64 default_val = __mpam_regval(partid_d, partid_i, pmg_d, pmg_i);
> +
> +	WRITE_ONCE(per_cpu(arm64_mpam_default, cpu), default_val);
> +}
> +

per_cpu(arm64_mpam_default) won't be reachable until CONFIG_ARM64_MPAM is set.
So I think both mpam_set_cpu_defaults() and __mpam_regval() need to be protected
by '#ifdef CONFIG_ARM64_MPAM ... #endif'.

>   /*
>    * The resctrl filesystem writes to the partid/pmg values for threads and CPUs,
>    * which may race with reads in mpam_thread_switch(). Ensure only one of the old
> @@ -36,6 +53,17 @@ static inline u64 mpam_get_regval(struct task_struct *tsk)
>   	return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
>   }
>   
> +static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
> +					    u16 partid_d, u16 partid_i,
> +					    u8 pmg_d, u8 pmg_i)
> +{
> +#ifdef CONFIG_ARM64_MPAM
> +	u64 regval = __mpam_regval(partid_d, partid_i, pmg_d, pmg_i);
> +
> +	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
> +#endif
> +}
> +
>   static inline void mpam_thread_switch(struct task_struct *tsk)
>   {
>   	u64 oldregval;

Thanks,
Gavin


