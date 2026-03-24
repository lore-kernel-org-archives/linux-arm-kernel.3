Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80219F532CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTotqZEROYbDyldT/C8jFT2PqJQkiiFw2H0d7yIV7KA=; b=lXZ0CWzsQHFFQBTvY+g66kIROG
	Q4bDAwLzHDUGnepcirwatCx2p7vQXLXds3h6qJO8rTC+8iT1jSGukOdKsrgOvKqCGU/EpjWX+EZFY
	zVXh+Qfyd1HQLcIeUqRtAdDz0igM/wjA+S9gmWmR8SiZy/syTuYfw67vgBK48pXebzhhMra5xtQcN
	PKeK1FWGHSDJOtlgsnTM4DpcWm9f+n3eg5izmJFJO55vOMybXjHRRY1N1MHe5TiNfTis0LTOwwl8w
	wFdaa85CyL1G5AHqGtlxMYZZxCG/kRtg/UAzyeTfnq5vjeJxf9G+ajE+585F8xMMTm30GM20llBLn
	+0qY68Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4se7-00000000Uy0-466n;
	Tue, 24 Mar 2026 03:41:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4se5-00000000UxQ-1abd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BTotqZEROYbDyldT/C8jFT2PqJQkiiFw2H0d7yIV7KA=;
	b=RAzzuoGGDZPxdgvPavm/H7AMguJIiNjitMCUuUxe26l9nWmpVhGv/PTfDIg+ZFAz8dM9O8
	N4RQ+dS/zdP3KPaLxOp+ZuOYoYKYOUUG2D/b+1PGXSOkjt4lUBkZ4wf4fZh/yVVw0i6WlT
	GkyVNnXyR2+y1zNkCWtAJadni0za4PA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-xw98Azg_Oman14ynuXO2cA-1; Mon, 23 Mar 2026 23:41:28 -0400
X-MC-Unique: xw98Azg_Oman14ynuXO2cA-1
X-Mimecast-MFC-AGG-ID: xw98Azg_Oman14ynuXO2cA_1774323688
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7423ba5342so2940350a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323687; x=1774928487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTotqZEROYbDyldT/C8jFT2PqJQkiiFw2H0d7yIV7KA=;
        b=ksPj8qosoKC8VZ1S/JOI8c4pfd9nNxKj4mnRRlFasLTrj/PUDIGMVhuUNZrNvr/qyY
         VCsdJB+VivVe8nZQtjKFS+J1Dcm33QqM7EoUIuao4Ojkql3V8wIGlSWp29rGQXqGSIUp
         tPoQ4tlV+GX/It+mpg21pAsYtoNrUKTOqhbeHFACo0CFEeR3nLOFJwjWQcPsyKqhUdxo
         rUkO4NPEwhS7DrZB7wbqNuWy0hwEL5wGO2wXbX+SfAUgTghLfUgxLCj70lCumcUxGL7X
         vCUf2449Xs4vNf3nwP5kLCkP2Zot1LEACtjNUHc0b2Rh5MiOLrgUDvk0l+vCcSL1u5Wf
         D0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmvbSB4XpaRpRu8sXyCgaRtkl3OuGPQFKdMAG4q2J9npDZvoqItUndxDN/PEHGvWZmILocUj6glvxFu8DSNFXG@lists.infradead.org
X-Gm-Message-State: AOJu0YyA/i2LFKOUP6RDtv+ktst52/ZPgHlRPoYXHyYlsQVnDvSCtT4H
	gFQem15aYSgbJSQIMyeVj9VkPTRCIAcQ1K3gSnSs1nV7f3E47YEuVAZHx4Gei9JOjB9nhJ3mK1O
	JbekbUir+tzULzxCSPpdoYTtuz/+NHr/YgVsHcSiGFqTdUNEXeCWhe7dWhPcVcYKSkNlkTjjBNZ
	b8
X-Gm-Gg: ATEYQzzWVrLSP2h9pQ/AFtfcnuHa/VRwwNZeFG/UWrr7nIc6uNc29a1Y+//0bmHDoTs
	XJJ3Ku5kLJZhW0uyH454HTujJ2h1WMxVNnrr/YWgu7AIJRV9nrFRFSnAfR8JnKhJR8G3C5UO78y
	FtfBVpMwNjat7S3U5BfcS2yw7vNrRog1APQ5zdGi+L30d9AtXuq1EW3yJEclhUsSzENS9dH0RwB
	OggIE5tQgQzIMtdWwAGMygYN1d5CxXAoLatthFbMkJscpmPhypIfpD68oVugg9j4AXVilWLcEsr
	QzmOR/FbwlyStqPchbwlHRs7r4bC6qoPO9AzokJ/SzKlgZTbohOgLC2d1JzOznQMKRp+9F8Bimj
	38UhpDVhgUS+u7ugbh+6QygWFwH5xr8APwnu+eUSyyED0nvBwRQKxhDbC8KSzKKtk
X-Received: by 2002:a05:6a20:9392:b0:39c:c3:4030 with SMTP id adf61e73a8af0-39c00c342ddmr6959302637.34.1774323687662;
        Mon, 23 Mar 2026 20:41:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:9392:b0:39c:c3:4030 with SMTP id adf61e73a8af0-39c00c342ddmr6959271637.34.1774323687305;
        Mon, 23 Mar 2026 20:41:27 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74487b5b8csm9108581a12.31.2026.03.23.20.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:41:26 -0700 (PDT)
Message-ID: <711b91dc-8861-4948-97b8-47a5ec21affa@redhat.com>
Date: Tue, 24 Mar 2026 13:41:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 29/40] arm_mpam: resctrl: Allow resctrl to allocate
 monitors
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
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-30-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-30-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y5zhW52EFPwWFCdW6CZH-xB0TKhY5SPjkXwKSsbZXJU_1774323688
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_204133_492878_3ED2A767 
X-CRM114-Status: GOOD (  14.90  )
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

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> When resctrl wants to read a domain's 'QOS_L3_OCCUP', it needs to allocate
> a monitor on the corresponding resource. Monitors are allocated by class
> instead of component.
> 
> Add helpers to allocate a CSU monitor. These helper return an out of range
> value for MBM counters.
> 
> Allocating a montitor context is expected to block until hardware resources
> become available. This only makes sense for QOS_L3_OCCUP as unallocated MBM
> counters are losing data.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> USE_RMID_IDX -> USE_PRE_ALLOCATED in comment
> Remove unnecessary arch_mon_ctx = NULL
> 
> Changes since v2:
> Add include of resctrl_types.h as dropped from earlier patch
> 
> Changes since v3:
> Don't mention ABMC in commit message
> 
> Changes since v5:
> Remove MBM free running sentence from commit message
> kmalloc -> kmalloc_obj
> ---
>   drivers/resctrl/mpam_internal.h | 14 ++++++-
>   drivers/resctrl/mpam_resctrl.c  | 67 +++++++++++++++++++++++++++++++++
>   include/linux/arm_mpam.h        |  5 +++
>   3 files changed, 85 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


