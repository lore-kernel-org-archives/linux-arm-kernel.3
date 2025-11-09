Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B025CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 22:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vrkp13U75D5ocju9TrltPfjNVc3UEKucGVy+HHM/EeY=; b=Bv0ei+in+MYSK7jZTE1FHL6oJs
	ofaqE2CyXp7d1wNvwI6gqmM2bggx68+wY/DskJHloY2XoXlBD7cEGOVV98Fp1zwfEiiHdVtv4PaaR
	pCpzVdMGCRFae1nEb4l/FkXTP7Fgb+0XZGCQfj345Q4u1VrokbbMKxeZIltdYALAtsU1xhIL8mfZG
	lmAmaXE7okoULguAMHHApq3uGn7IvznqUJXioO09qmtM5QyTPlhtuHOb9NJbF1LbAidGEM8xCmz/J
	LC2/c/4SY/U6bTUFVHSOk3aKQ2F1ThmDpTHi7I8ReLglEj4ubv2bt3+Z/AuVm8+Uwl2UPc8NxzhY5
	CumiM77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDRz-00000004PnB-31Us;
	Sun, 09 Nov 2025 21:59:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDRx-00000004Pmd-0RIa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 21:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762725592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vrkp13U75D5ocju9TrltPfjNVc3UEKucGVy+HHM/EeY=;
	b=RoGq3ESUK9Ksnk7u0D/utiDh521ZvnhAgFI29NqeyDCEZRTaRtjlFsBVfVbLNVBqUo59DO
	KwUw1Xaj8go0sZyoEnmFQ4mTq0ryTpCuK9IO9bhWcbTcfqYSG2CGp4VTFzkOwVYN13M+Li
	3Z/HHUlpQ72A3ogsUuxqnvRqZ5lrfjg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-uOzZzzcdPlyFAq4K9FXFng-1; Sun, 09 Nov 2025 16:59:48 -0500
X-MC-Unique: uOzZzzcdPlyFAq4K9FXFng-1
X-Mimecast-MFC-AGG-ID: uOzZzzcdPlyFAq4K9FXFng_1762725587
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3437f0760daso2410355a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 13:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762725587; x=1763330387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vrkp13U75D5ocju9TrltPfjNVc3UEKucGVy+HHM/EeY=;
        b=LRmkWmBxyzpPARn8aWRtDCRgB21SY9F7Tg2fC4dgZJLZpJ4QZeYqHFCdgfjaNfJXGT
         5M33PnL/0UVftuYpBtyLGsKaMJT4FRlVqN5PqKyQfkqtLJmQir0D4Zl0eyhvdgd7C/7k
         Yfx4jUHjdDVf5vpGKRfFCJDO3WyZ2Q1u5xSC+lmtm5RcI5zZx4jnXmgZDiqCzDpezqUp
         h+9lK1U5m65y3sfrxtYj0Zpe3ukTnMPQ9Gy3cSsRZwblb0OvmkDQukYbTS8IXTtD6AqC
         lbQjtEDtvhJ6Kr+E7cZF0InXRC3XUuUL+QF6YTtTzEeX9DfOtcpLGvU0hrKr9FPANucf
         qLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvpM3CvStpA1olPQbl0aJBNRzDAu75tr+z3OiHC35SoId7uf4gzOxCEkkkyMPIYbuQuSNzXS/5BHouX+TA2+lk@lists.infradead.org
X-Gm-Message-State: AOJu0YwF/4xB7+J5CO9CzP8FWBErSTEjN0Z/N7g7tHl0ORxTSw7UzvEh
	Ctgk1vwcPa6t5tJfWS4v3+Qlr8tGnM8xWvu6AoXWyxmzZ4l4qde2zrLWMupe3LBZPmTSw82hj4E
	O8zWsuS8SMaSdyh5ZSIjP1tEQuPgYxd7xBL37Auw8h/vmFdDWJCg3O0K8tn2Zgvs1sgdgGnsvk4
	2n
X-Gm-Gg: ASbGncsNAhiLFqK9OVMALh/we+R9wwilQyP0g/u+bBUL9peMuSMfpP8cPSHttzV0NjQ
	T7pPS1VxawDFbzjADSc+GY/0DV5qmXgiA2dzLcxPYrOEG/Zf1Aq5ZRXLJAYLIXKfJl/ugbazn0I
	k/xS8wpxmNY7bBvjavEHdNiV842Jfz0eNZtFwuKbrb3sBL7msAvQk+8gRAkDTR8WwhTCL1AZ0as
	mS1OAxwX7VtouO+M4Pluj9tYqMcCNZrp79wg0Rf8tNR+XsV/ia2TjvBMTag9kjS0bDJ3KI4dOWn
	ieliCa+CnMZWjEmSrzBFN3pGvXiN0vwOhf6fZXkTMHKMuddxZD7wpXC6RrfqTeaUjqCPeeBrJv0
	00y/j8lgKMwoobj9qTw8MovmwCne6tunWHBwV6nY=
X-Received: by 2002:a17:90a:ec84:b0:340:b86b:39c7 with SMTP id 98e67ed59e1d1-3436cb91cdbmr8688566a91.11.1762725587155;
        Sun, 09 Nov 2025 13:59:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3A3I4/3RLhYe1QQYreru6FNEuBJIm7pFjvEZOnSNhvwUxUwbVCr6B7zDVjGaDu7x0cbLDOA==
X-Received: by 2002:a17:90a:ec84:b0:340:b86b:39c7 with SMTP id 98e67ed59e1d1-3436cb91cdbmr8688543a91.11.1762725586835;
        Sun, 09 Nov 2025 13:59:46 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a699d6dfsm15532033a91.16.2025.11.09.13.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 13:59:46 -0800 (PST)
Message-ID: <f7b7ffd7-8674-4368-aee4-4376d127b0da@redhat.com>
Date: Mon, 10 Nov 2025 07:59:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/33] arm_mpam: Merge supported features during
 mpam_enable() into mpam_class
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
 <20251107123450.664001-18-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-18-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zcouEUytnNAiKLld01VRP5QlrS42MkWnPO2CjwqDwXg_1762725587
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_135953_275594_C76EF2B9 
X-CRM114-Status: GOOD (  13.98  )
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
> To make a decision about whether to expose an mpam class as
> a resctrl resource we need to know its overall supported
> features and properties.
> 
> Once we've probed all the resources, we can walk the tree
> and produce overall values by merging the bitmaps. This
> eliminates features that are only supported by some MSC
> that make up a component or class.
> 
> If bitmap properties are mismatched within a component we
> cannot support the mismatched feature.
> 
> Care has to be taken as vMSC may hold mismatched RIS.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c  | 214 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |   3 +
>   2 files changed, 217 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



