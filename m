Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5717CA5FEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 06:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2P9q1+y/S92Xtrelm9Z9KwaSNPwiPTRRSimXjtAutXA=; b=rkSlMFySwSRTc6/W52glkuTyG/
	oohZlou1Mj2Y1qKol9gRtf3clMDMrzFEKFnjnYMxxiXKUyjWl87RGzdDD1I3OCRcWUHTDJGsWuj9/
	8wFejOdShKl9qUrxtDGo7kXjve6LW/AE6J4Ca1SVQQUNvglCxoCR4GP5od6Oyr+dU1vpjT0axgZDR
	ZbKpwlr6jGGLzJL4kFHy04pcikg6k4uiL4SEbcE6okx4IqrCcBoRf2v9ttREtDLGsoM03kpWNOrsN
	SYWL6Ouw0zDBT/SOJIDAkG61FFAlRDuifA55cV5Q8p4H7z1K48BIsAJ2k38qDepHXkZ6Wax2FE3WL
	a78hVm3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhits-00000001PWy-0Ddr;
	Mon, 19 Jan 2026 06:38:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhitp-00000001PVP-1LGB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 06:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768804683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2P9q1+y/S92Xtrelm9Z9KwaSNPwiPTRRSimXjtAutXA=;
	b=e9My9la2WVKAtSMA4NYRlgolZaesr+OPkO3kVOh1FNgorQJQkcYxEJl4WJ5HQGPob6Na/3
	TWtWWcuBbEEcgfZ8Da5Yya/v+1Nj5cwi+T0Qau8Vc9JV7scydSnp9cEofAq5jqzZBdvFTd
	bnRH4utxm9WUzd0biE2cY86m5krznFw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-j49oVSybPjWIUW0_4l0PlQ-1; Mon, 19 Jan 2026 01:38:01 -0500
X-MC-Unique: j49oVSybPjWIUW0_4l0PlQ-1
X-Mimecast-MFC-AGG-ID: j49oVSybPjWIUW0_4l0PlQ_1768804680
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a73dab2e2cso7007165ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 22:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804680; x=1769409480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2P9q1+y/S92Xtrelm9Z9KwaSNPwiPTRRSimXjtAutXA=;
        b=uhp/2+2M+B9XxrJCsvT5y2tBC6HxYYQLHXyxGX3S6c8z8z65ylaKvbMClPfccFS9VD
         Xyb3D/Jo63/vdCt9RHyg2TG7Xs6jEU7EQg3JEAhaSNpF+IBWek26WXBmp9ThghkMkov3
         38DR4NpLOt9b0/fA1YULZyA/ff4gk7/AgvSWjG7HSpdsNpoVZj3+vkPYCf6YmTbPixdr
         hLFncnWypndklr4o+PbDF/9w9qNMc2OmPkMNKLSlG/mm200icVI6AttnaXbOwsr/OXM0
         IZZktFhd8y1Mw6JdjeN8PPGref+bccMozS+yjSN+DoeETEljpEM+pkmzD1UctbWeHr9h
         9pBg==
X-Forwarded-Encrypted: i=1; AJvYcCWxYPw/qseqvb2EfC+jdy1dcsw2y+hzI5Q/Kh6UmVWz/ly1vENM0YJbQGrgrCq5/GwMm5427hQz6pBM37p+IqEn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5VmhymNSxOFyeJ08gLgP7v+qdt3Qk5UtH62Is6zzny4T+YWG1
	T/JUi2m1uBFdOt4/2D3IRId7m+4YlgwoHW3QSbmknqZ7/0cUwmFF5k0uu6g9nyh4PdEMToSAnw6
	gMBNv2oX6EfYBQUK3u8H3NOLZrQfliklB1rAfRWVx4LZtFIfhoDgFb2B+uJscksrfQnzlPDy/qG
	lq
X-Gm-Gg: AZuq6aJm+Rr+kANSifERL8IIKOv/196TlJ8oKSrcXK6Prr53AGZz0PBiN0rUSFoY2Ic
	BOWqRJiqkdLyxShFV+M6rBY8JvxIpMJNQSmWRwbDkuPwDf2zOspi+ohnQCuhQozIlYrzW9h0akQ
	o8vuAekoO2ZZRLhgCKCY0Ciia8MGqLWm1G51pB1oVQHAJtYPDSP5rQtJWHUBOwQ9+HmHNhsaORq
	kW8TiRRudXzsIcUkrOaHrhYspzOq8NBg7ifpH0VxOxWG9rMPvi4Vejvy6pN6Cboda2oyt6+nrw8
	x9GFOflJ7Q92L43PAlhTDu/JS5lr9XJLGJp5l9bOv0GhD2Ugy52EPvsqfzkqcydLDkLGXuyOX2E
	pgDt/O1wlyhw=
X-Received: by 2002:a17:902:ebc8:b0:2a0:9238:881d with SMTP id d9443c01a7336-2a700a1c29fmr135715715ad.15.1768804680371;
        Sun, 18 Jan 2026 22:38:00 -0800 (PST)
X-Received: by 2002:a17:902:ebc8:b0:2a0:9238:881d with SMTP id d9443c01a7336-2a700a1c29fmr135715515ad.15.1768804679983;
        Sun, 18 Jan 2026 22:37:59 -0800 (PST)
Received: from [10.72.112.128] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35273277f68sm4098077a91.0.2026.01.18.22.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 22:37:59 -0800 (PST)
Message-ID: <7c224083-595b-432f-9147-1e8067df634c@redhat.com>
Date: Mon, 19 Jan 2026 14:37:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/47] arm64: mpam: Advertise the CPUs MPAM limits to
 the driver
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
 <20260112165914.4086692-9-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-9-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OcuztxapiCQbl1AumPyF4uBycO57vXW23vkF1VSfWdY_1768804680
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_223805_433216_E76AF6CE 
X-CRM114-Status: GOOD (  22.46  )
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
> Requestors need to populate the MPAM fields for any traffic they send on
> the interconnect. For the CPUs these values are taken from the
> corresponding MPAMy_ELx register. Each requestor may have a limit on the
> largest PARTID or PMG value that can be used. The MPAM driver has to
> determine the system-wide minimum supported PARTID and PMG values.
> 
> To do this, the driver needs to be told what each requestor's limit is.
> 
> CPUs are special, but this infrastructure is also needed for the SMMU and
> GIC ITS. Call the helper to tell the MPAM driver what the CPUs can do.
> 
> The return value can be ignored by the arch code as it runs well before the
> MPAM driver starts probing.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   arch/arm64/kernel/mpam.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/kernel/mpam.c b/arch/arm64/kernel/mpam.c
> index 9866d2ca0faa..e6feff2324ac 100644
> --- a/arch/arm64/kernel/mpam.c
> +++ b/arch/arm64/kernel/mpam.c
> @@ -3,6 +3,7 @@
>   
>   #include <asm/mpam.h>
>   
> +#include <linux/arm_mpam.h>
>   #include <linux/jump_label.h>
>   #include <linux/percpu.h>
>   
> @@ -11,3 +12,14 @@ DEFINE_PER_CPU(u64, arm64_mpam_default);
>   DEFINE_PER_CPU(u64, arm64_mpam_current);
>   
>   u64 arm64_mpam_global_default;
> +
> +static int __init arm64_mpam_register_cpus(void)
> +{
> +	u64 mpamidr = read_sanitised_ftr_reg(SYS_MPAMIDR_EL1);
> +	u16 partid_max = FIELD_GET(MPAMIDR_EL1_PARTID_MAX, mpamidr);
> +	u8 pmg_max = FIELD_GET(MPAMIDR_EL1_PMG_MAX, mpamidr);
> +
> +	return mpam_register_requestor(partid_max, pmg_max);

mpam_register_requestor() is exposed until CONFIG_ARM64_MPAM_DRIVER is set.
CONFIG_ARM64_MPAM_DRIVER and CONFIG_ARM64_MPAM can be different until PATCH[39/47]
is applied. So we need PATCH[39/47] to be applied prior to this patch so that
mpam_register_requestor() is always existing and exposed.

> +}
> +/* Must occur before mpam_msc_driver_init() from subsys_initcall() */
> +arch_initcall(arm64_mpam_register_cpus)

Thanks,
Gavin


