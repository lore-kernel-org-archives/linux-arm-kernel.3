Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E00CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 00:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjM2gkzQil19AomxuDInwTt2gkWOAouhNdKUHEv8N+w=; b=F89PAhbUSxJ2uJrtA1dijPvIiU
	PKB6C+3Z1bcoXwu6Ux2deNWgkcHnBGUzMAdZ3ufpFmxJWImehtaNT3norxHOhNuYuRE6l4cdjr2QK
	SgOXP+kNq+TaAvmU57AO2awpfjtdfXionF1auTGziWmUY9r0w5JOc/Cj2PmiAEDDVjVLPFkGraux5
	6dD/3EbrLUH48FxMuV9qPVH+pfrRLZpa3lR/OrKVOKRSeHubrKEtwJpO5h10odvjim7bTkpZ154q1
	mvY/t3fM6fRkupr95RLgTcajEQO8jitmhymOOspnHT2MjBeqavGFulnC5ebJuEXUGS/jg+MOE5zhu
	az6zQJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHtFL-00000003bV0-3oZH;
	Sun, 09 Nov 2025 00:25:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHtFI-00000003bUF-40M6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 00:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762647927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GjM2gkzQil19AomxuDInwTt2gkWOAouhNdKUHEv8N+w=;
	b=YRztWBRmplmleDdOMdhz6tzW/kmcKqcOJbT4c7NUOZGWpRc/XN520nUITRkJ//6Iz5PdRX
	yNCbxn8vjRWJxUApx0EPCUv0xgmWRlrFPrig0Dm6BTSJ4QLYQHkrGnSa+tOLH0teSWxhLZ
	NmUA2REOuzsuvDciKdcwgPb97kZSgm8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-SqhIiUqQO0KDwwXgIlfQ_g-1; Sat, 08 Nov 2025 19:25:25 -0500
X-MC-Unique: SqhIiUqQO0KDwwXgIlfQ_g-1
X-Mimecast-MFC-AGG-ID: SqhIiUqQO0KDwwXgIlfQ_g_1762647924
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2958a134514so21372595ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 16:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762647924; x=1763252724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjM2gkzQil19AomxuDInwTt2gkWOAouhNdKUHEv8N+w=;
        b=HjWRemdFnasPpIUd5NAJtMTdfDKuFjEpXWOAz+XYVmUIB3ndsfoz2njuzxP6fvYnp1
         1ps9ed4vG30+wtwG5nDsmpkYgYtxopEyCI0HkUhTWUe/qhkN91b2CERo8T/JJ0kUVH7F
         GNFyQBXx3zL5SRxbhxTsXWMlb0rFBLE9kqUZZM22e+sZkxNvsd7qTfbixqg93rontk9u
         dvEPJYjURWGQHrTSOmiX2d/J3x7qJO1FinBw9zlF2Mq0HQwYvqmt+SLOyfDycI7uICXj
         eqgfepbNebieuxznE1oA0ohmyL8TubtPnOV4oC0vmAgdBxOVoUDrUYUzH5ZwZC+23+pc
         ZwcA==
X-Forwarded-Encrypted: i=1; AJvYcCWtibfE+XT+IO/7dS33hzT5jGVsZItv+t+7vL3WvDKzG0aiPINgD5p6nVzQnAZWbpTXoPCaFG8a6LPM7dgCl1Ia@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Mebdy9y4/93SOKZ6zO9y6qJ5hGLCwyxaLsPymDb3BpY7ikTA
	Us5Yc34ShfrmpRfhCAet4fH/qLlhJ8HYB0duEuPn9gyWDsOsppJx8JmcdASDaJoE8NW+O1kg6uQ
	IWkjXx4n/2JQNayyOtuv2q7VzASuhenEsyibZsQGM5e3+otY3gdq1PLu34jHGnRmftCpmVJ3/AH
	yF
X-Gm-Gg: ASbGncs0O77uNBp0pzSwmvvnmxZ51cA2attodr1FU7nkqVdzvyXketQkPDkTv2o2tw9
	cuiVBNlIn9c7F8LCpwh9xqAGuBXpgk8CWrccNU0juj6zjTjTJgWT1s5pZNzNeI2Cuq9AtmgtF2L
	rna0mSpM3PB7FleXcUg0cV9KdQIOxBX97jFGSzXD3wNzvQjmnWbaxqqwQbk16sBs0WPvAEApE0p
	CvNP36UP/FRxfvhZ7mARokNuHV2jRGtx18GBj4OvdavU2tb1jTPzXG5xj9R09wZty5pogu1u884
	eEPARfyO1ufw/NhRZxHAAiWFavD65viO82BHN9OBzSm22gK6KvFvNdcFjmjGrHoyUljZtqcFBgG
	rK7fOj6YVQt8V1KYyUlvTYJzfttpzfSb5jJL/Csc=
X-Received: by 2002:a17:903:3848:b0:295:3ad7:948a with SMTP id d9443c01a7336-297e5623f04mr54414865ad.16.1762647924322;
        Sat, 08 Nov 2025 16:25:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjT7Owo8XJeJOTrgWjvPtiXgZ1vBfz4lfqIxSQIjV8vhLk1OAJS8nDYaFPSxNIg+nMeJmM4w==
X-Received: by 2002:a17:903:3848:b0:295:3ad7:948a with SMTP id d9443c01a7336-297e5623f04mr54414545ad.16.1762647923976;
        Sat, 08 Nov 2025 16:25:23 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650968253sm99440425ad.20.2025.11.08.16.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Nov 2025 16:25:23 -0800 (PST)
Message-ID: <6aae3021-4e0f-44a4-b842-8b8f952031d7@redhat.com>
Date: Sun, 9 Nov 2025 10:25:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/33] arm_mpam: Add MPAM MSC register layout definitions
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-13-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-13-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eReX8qnXSD99s5abHOZqsQRu6P08-9ioDGyGu2N7x1Q_1762647924
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_162529_076922_648D5511 
X-CRM114-Status: GOOD (  10.51  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Memory Partitioning and Monitoring (MPAM) has memory mapped devices
> (MSCs) with an identity/configuration page.
> 
> Add the definitions for these registers as offset within the page(s).
> 
> Link: https://developer.arm.com/documentation/ihi0099/aa/
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Add tags - thanks!
> Consistent naming of long counter variants (Jonathan)
> ---
>   drivers/resctrl/mpam_internal.h | 267 ++++++++++++++++++++++++++++++++
>   1 file changed, 267 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


