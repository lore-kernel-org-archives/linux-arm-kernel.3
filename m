Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D057C98318
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtjK9f50/jK8SHecvHOqY5pCCQhpN2otdhXEwvLzMjs=; b=caurXhaia2tq4V5n+agykzur8T
	Mtmma/417T6QJuKkMSM2VzeT8jxN6yGncKlL7EIfSvX2/NgBL9g5no2NgHV9VGuwEloZg93Us0px+
	McliYxHXlr1I7U7yIjLDdT4d/3Mw4MD2ZR5bBrjJZ0FUV1Q7htZh0js+j4M9t1G5dB7EBnnM6aTZH
	qFASfGGrWztca/X7cQQ8cp3Jf1ceT39qtFZ3wTViOxR5m2Mg+13/5dRAbl1kWMXiGct5Dd01sGHQE
	gjHVk5FXzis1+OfwFw7XEbPo+WKM0DZQn4toUjJFWWwwkM0hO8UAR6gqIqYnqDo6TGJ2ahzIeH+Vm
	wmGsWdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tTh-0000000CR2e-3MRA;
	Fri, 25 Sep 2026 00:07:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tTe-0000000CR1o-3UB0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 00:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790294865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtjK9f50/jK8SHecvHOqY5pCCQhpN2otdhXEwvLzMjs=;
	b=F3awLiiBniggHGjUD8BAJfzOzOFE9VrPiYefLhSvcIuJ5/TMVOWNqTfsueWn1c3PqhQ8oa
	3B3rdmOMeMonmuVcvPHG9hf+67XUp/DAr/f58F7s+2tHnrlCovmGH6hCNDXW47zBcUWmJY
	SOEjdJ6UqEFUlU+C5zalai+n5LPreqA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-LR9nRyqLM6eSpipunVaD4Q-1; Thu, 24 Sep 2026 20:07:43 -0400
X-MC-Unique: LR9nRyqLM6eSpipunVaD4Q-1
X-Mimecast-MFC-AGG-ID: LR9nRyqLM6eSpipunVaD4Q_1790294863
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so448173a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 17:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294863; x=1790899663;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtjK9f50/jK8SHecvHOqY5pCCQhpN2otdhXEwvLzMjs=;
        b=XK0W7D6hxQOjPwcbSmCPamdaqR5ro/0llQAhgYJVSfqRr7YeyVWfFYFfFlURNoBQaR
         8fnnKqlqIQPAi1ST6/Yr6YUD+lZQ8/3CpC+1+X91NtLU262wAdfIAUPZN4q04jWnJxRd
         WdTn1bI/aoAiIC/WBeMBH/Ch3W7u/tWXMXR5NTsYmeUWjZhinLrWpX0+ZxP85BgV+JZp
         2W62VpuOtnhiPmkR2GaUGp6YZaFI581450DJgZcL+6NqNCqfIdHUu+veiePleQWjaslr
         /8vv4SMs/qGotFeZVjg2Hmi1rKjNnhfOv/MMi3OML22a9mjyfSLT4iLWNkjOkmNTc4Ye
         n4wA==
X-Forwarded-Encrypted: i=1; AKwUvBxDHoEA3UHcU4Eh1eEYzpjUAle9P+7/O40ABEXRIIPPcexQzeE9MoP9P0Gd2QmGUAevIzVLV3xC5HtBbIW/p+Mm@lists.infradead.org
X-Gm-Message-State: AFuF++muKMUgdS3UNZaWEHu7CuX9Db+AT3bSVd7n62Sr2Sd73LbiRyGL
	pZ2HPXXyLy9V8RPy/UHPuufXZgmce7tcmdo/b29Xo9td7sICPxARXJDPqvx+EOP2u6fS5/75HX1
	6+3qxTiJKqm7vGl8dKg2WRU1qyCvlfTrVdkutC2gsvpOxzvv5hka2PGB2b5Hx6iK6tBrQpLGMuq
	Pz
X-Gm-Gg: AYBFou3gTtJn0FJdP9MZuYnV4zqdtXad9nYIFmYmrfOZAOTuRJp5u0knNOpFlw2p6G+
	wCReuGtysmvqtDvUNtF7/WIfAifqHT+8uZL6nrFedj4PmjKsEU7r5cm+IVRB1AdhWBu+Bpykyk9
	mqvj4X5zR53NrK0FI7s0wMBNsBNkX3aBbHM1mr2cKqFeZP6nZy77vTiKw6WqkrUbbYz+i2Tc/mX
	poorowR5l0fa8xZj2qdNqgQyV+hJHj6Tlp3nVYRJoDsCseZr0ei0sUAojWi0SHkksQO7m8k46d6
	8TiFXUv4LllfPr+mgfL5qrKAvb45zDJb04FwaqwN/mzXeRdmGzbZ5dGOuP33wy9EnYKaG6NViYI
	Fle8xR8ypLcZGi8gD5rFO2717Fk+5fWyQlYIjuSfUxQ==
X-Received: by 2002:a17:90b:49:b0:3a0:9ed5:5420 with SMTP id 98e67ed59e1d1-3a0bb6139bdmr380654a91.44.1790294862465;
        Thu, 24 Sep 2026 17:07:42 -0700 (PDT)
X-Received: by 2002:a17:90b:49:b0:3a0:9ed5:5420 with SMTP id 98e67ed59e1d1-3a0bb6139bdmr380627a91.44.1790294861906;
        Thu, 24 Sep 2026 17:07:41 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm997611a91.4.2026.09.24.17.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:07:41 -0700 (PDT)
Message-ID: <a3984ac2-ca04-4e46-87e9-6277491acf7c@redhat.com>
Date: Fri, 25 Sep 2026 10:07:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-7-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260924135201.850038-7-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5M7UytwIzDVDKp587pQ8PI98nMXaeFV1-a1Uiuxre4U_1790294863
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_170746_949643_360E850F 
X-CRM114-Status: GOOD (  23.80  )
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

On 9/24/26 11:52 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM maintains the state of all the granules in the system to make
> sure that the host is abiding by the rules. This state can be maintained
> at different granularity, per page (TRACKING_FINE) or per region
> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
> all pages in the region must be of the same state, this implies we need to
> have "fine" tracking for DRAM, so that we can delegate individual pages.
> 
> For now we only support a statically carved out memory for tracking
> granules for the "fine" regions. This can be extended in the future to
> allow modifying the tracking granularity and remove the need for a
> static allocation by the firmware.
> 
> Similarly, the firmware may create L0 GPT entries describing the total
> address space. But if we change the "PAS" (Physical Address Space) of a
> granule, then the firmware may need to create L1 tables to track the PAS
> at a finer granularity. Linux therefore checks if the platform firmware
> manages the PAR region. i.e., the firmware is in charge of managing the
> L1 GPTs (creation and the required memory for the GPT tables - via static
> carveouts) without host intervention. Support for dynamic GPT creation by
> the host will be added later.
> 
> If the firmware requires us to manage the tracking or GPT memory,
> deactivate the RMM and reclaim any memory donated at RMM activation.
> 
> Apply the same checks when hotplugged memory is brought online.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> [ Switch to RMI_GPT_L1_INFO for checking GPTs and deactivate RMM ]
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Changes since v19:
>       * Avoid mixing gotos with __free cleanups for arm64_init_rmi()
>   Changes since v18:
>       * Handle buggy RMM to make forward progress for RMI_GPT_INFO and
>         RMI_GRANULE_TRACKING_GET
>       * Make sure the memory ranges are not inverted and reject such ranges.
>       * Move granule_tracking_get/gpt_info wrappers closer to the callers
>         Drop "inline", let the compiler do its job
>   Changes since v17:
>       * Move wrappers that may not be used elsewhere, out of arm-rmi-cmds.h
>   Changes since v16:
>       * Check fine tracking and create L1 GPTs for hotplug-added memory.
>       * Clarify the L1 GPT setup and move the explanatory comment.
>       * Switch to using RMI_GPT_INFO command for checking the GPTs.
>       * Deactivate the RMM and reclaim the memory if we can't proceed.
>   Changes since v15:
>       * Skip firmware-reserved NOMAP memory in rmi_init_metadata()
>       * Handle negative error codes from wrappers.
>   Changes since v14:
>       * Move the implementation into drivers/firmware/arm_rmm.
>   Changes since v13:
>       * Moved out of KVM
> ---
>   drivers/firmware/arm_rmm/rmi.c | 218 ++++++++++++++++++++++++++++++++-
>   include/linux/arm-rmi-cmds.h   |   2 +
>   2 files changed, 219 insertions(+), 1 deletion(-)
> 

With Jonathan's comments addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


