Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5665C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nO4/IWyhnkhZyuTQ8fhzeu5R8sBrsrYwZ8qktlpvtfo=; b=RcLfRL5Af3ip0vBkea0q0qcCbE
	m0sfnkedJhDvx2DeRpnbNCJHvEiEXy5FlMQC6ZX5+7K5eFtJM1d8fooxLz7w9GH+NWrKeuGcl5/EO
	T/jdHfCJ6PiLzvKqg9cSPcYuJJXYMC4QK0iicRxS2Q5fa0CFkCUHoRYqMk3ONDkP/IjM43Kqnw1zg
	rWzgusChzBPRUwuh4RpOZ5VhwgZzjc+YQfXNADmmT6tZSrXxdTp626QKQsY5JAsuzavzbbV29xD/0
	aCAdOo7q3cjQ84sGezx0G/dBRmyDW2yaNwtkVJ05wmn/2M4V8nxeTX5ZvXPotQOt0gSMYlqJ8EF+x
	6q02h6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwbW-0000000EPSk-41Nm;
	Wed, 15 Jul 2026 10:12:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwbU-0000000EPSC-1TEg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784110354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nO4/IWyhnkhZyuTQ8fhzeu5R8sBrsrYwZ8qktlpvtfo=;
	b=XJP+8eLLwf8L5Q/YepBERmO3/q2TCTN3CTDZCCl/fXVipOu26hx6IJQhMfHQAoB6P+gRc/
	6NNcJt4rmXvhMhk3Keyt+ouzi61OZTpzWZBjYq7k2JEqxKk6tyCRgBhXEdkjqX3lIUc0SK
	27yT3i0N49e8Dx6EXfFgK3Pg12i9JLU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-N7eGz5I5MJKXXlPuvcbnMg-1; Wed, 15 Jul 2026 06:12:29 -0400
X-MC-Unique: N7eGz5I5MJKXXlPuvcbnMg-1
X-Mimecast-MFC-AGG-ID: N7eGz5I5MJKXXlPuvcbnMg_1784110349
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8483e038efeso2306203b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 03:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110349; x=1784715149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nO4/IWyhnkhZyuTQ8fhzeu5R8sBrsrYwZ8qktlpvtfo=;
        b=b1YStGBhvnxgDBfWDs5gNWdcL/EYzR+2fuI/n3TQ1OnBtp83opkzDC1ATwXYoEWyUM
         qWnOuxgQ3ubbwNgKe0V18J6d7VU4GwNNkVKjVIcyl6gCBOvkC8pJ7Tf+G2G7FTafdUk6
         WBt9HjrFPpnO8AHfQo7BMdHJbGC7uKDxahraAxOlcNCvlbPi8OAXc7+/ljp35vzWyTSM
         bqsUx3JaiWPkYbl3LWgJupkZgYOT0F8NO8CiBB54fL2vbN+5lR9h1MUFLkgyR+1Cx271
         4XPwFm0hJirDDZPmrkUQqPL1Q46+dgiIHxth61zG36oqwuJRGnsUK89oBcVyt8VOzWh0
         RvKA==
X-Forwarded-Encrypted: i=1; AHgh+RpaWTXjvMsXVQ+ybBi5OgwY+sPvzJrn5u6iK9Od4gk8vHaP4hBl5O+6ZzRODb/muSVWw+rOPlIwMApW/BzViXPG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3OoW65Awp6TcIWjxEAorOeN9rxlxsCuY19+UKTj5dcr1b4La8
	3hy/iag7pDwPJLzf7yHFfM48JKXNNBFTi/8NUl/ILF9qNMPPoehDLAC3UJVkzy6yt0Cftxlh4q/
	FSPtgFK/i5UUiQEGL4+p8YENrKki+kRXXhBk/8gDPcjdkTFqkkX+T+9N2MdTJ/VlktEt6TNIcY/
	3h
X-Gm-Gg: AfdE7cng+yUS4RPd9XH3eGDIf5ppMMNriwZ56+YEVvtaeUwZJMr0uaJGR7+BNmB7r/O
	JxqOQY2kDj9jWvoNIC/M5KCi5GYSaXPUDbBR+qBGawnU8X/xIcxpd7DyPoJy3YoZwVWw7wOxj4Z
	MsKnyxdglgl/ECU582NaU+Z1eptFXv6B495uqdzYAZx6xPZ2Se94/6deyG07n6iO+XRuI6CnQps
	BKoJ/zTqFRqcxSInBTNot5J4E1h6sP0XIZt0ijUWKfCfuPqL667ixzps9e1Msji4xeKHuD8WJFe
	JQgaOyph2pRE/IMrvN68YqIN05REmq1suRIG0Kz7gOt3CgF32Dc7q4po6B6kD/EJ+ICjhKAedUU
	EBqCYtB25Wz8P57bd/gxieo88WgaDitHfxvoGHCNC2ocbSvAgKmjCPA==
X-Received: by 2002:a05:6a00:9295:b0:847:7a61:e68e with SMTP id d2e1a72fcca58-84889618fdfmr15956143b3a.31.1784110348615;
        Wed, 15 Jul 2026 03:12:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:9295:b0:847:7a61:e68e with SMTP id d2e1a72fcca58-84889618fdfmr15956102b3a.31.1784110348107;
        Wed, 15 Jul 2026 03:12:28 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f278aecsm2875451b3a.24.2026.07.15.03.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:12:27 -0700 (PDT)
Message-ID: <273ea1c6-0c79-400c-b210-dc44680bd01f@redhat.com>
Date: Wed, 15 Jul 2026 20:12:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] arm_mpam: resctrl: Pick classes for use as MBM
 counters
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jic23@kernel.org,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org, leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
 usama.arif@linux.dev, kernel-team@meta.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260707162440.12132-1-ben.horgan@arm.com>
 <20260707162440.12132-2-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260707162440.12132-2-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k1_VJLsg1OHwdBSLlxTOLmGV53cHSX8YgGnkHrP-bVI_1784110349
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_031236_475197_A7CD555A 
X-CRM114-Status: GOOD (  17.64  )
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

On 7/8/26 2:24 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl has two types of bandwidth counters, NUMA-local and global. MPAM
> can only count globally; either using MSC at the L3 cache or in the memory
> controllers. When global and local equate to the same thing continue just
> to call it global.
> 
> Pick the corresponding MPAM classes to back the MBM counters. As resctrl
> requires all monitors to be at the L3 cache, we can only use the counters
> at the memory controllers when they have the same topology as the L3 cache
> and the traffic they see if the same. In particular, for the bandwidth
> counters at the memory controllers to be exposed to resctrl it is required
> there is a single L3 cache and a single NUMA node as otherwise cross NUMA
> traffic will be counted at the wrong instance.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Changes since rfc v1:
> Move finding any_mon_comp into monitor boilerplate patch
> Move mpam_resctrl_get_domain_from_cpu() into monitor boilerplate
> Remove free running check
> Trim commit message
> 
> Changes since v3:
> Extra paragraph in commit message
> 
> Changes since v4:
> Commit message tag ordering
> New sentence in block comment (Fenghua)
> ---
>   drivers/resctrl/mpam_resctrl.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


