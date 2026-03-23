Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BE6D58CBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 22:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OosJNlMHUO2ANcXKlCppT3JjFj+gSM8UPwVPtyNawFc=; b=hUaxLPOfK/ovIHsIreNCcLTnVK
	9UIEycOe6EKoTbkmAmQnCPbBK3BgKPsFYCGAf3jTub8ZEUxb5hhgXQgKbrnOtonZu7gptQz8g/hzW
	tAGdfd0zteMVmqXi622LXWk007Ecif7DQdvnNuuVOruthMfq2vG921EuTBNMl8rO5ogL8uTCYLYBj
	YYQ8YVYuQA7W23xtHVriqRQ6QyyOgFQivXvnDMvxf5pGY/RvD0ZVnet59oAp1KKY6d9wd1OwBxMSf
	PRByt2RT4u2eBuD4wjfbQUdNDng8DLK80ndKFIwOZP0/EuWLcPu+C/+bog9qhIow3wQF/E6HDndal
	mer+mUmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4o9e-000000006Xx-0Me3;
	Mon, 23 Mar 2026 22:53:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4o9b-000000006Xa-15eA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 22:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774306426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OosJNlMHUO2ANcXKlCppT3JjFj+gSM8UPwVPtyNawFc=;
	b=VZLZPmYlskxlCPqLilILH12VzlRLvcWbW2OmwZWfKiQtYZYETP3QxScaVzBHNP+47asI3C
	j7iUeG78IT2acPOKb/+TNBRslDj8ppRUbsyx7TI1bhNssPvwn0nWw0WNzwTqxKLNKgJD8r
	kuBqsyoI6SYQK1MqqOfXvqCK95RSIdo=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-kHYVanIRObCRwK1WQAhK1A-1; Mon, 23 Mar 2026 18:53:44 -0400
X-MC-Unique: kHYVanIRObCRwK1WQAhK1A-1
X-Mimecast-MFC-AGG-ID: kHYVanIRObCRwK1WQAhK1A_1774306424
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a84f21bf2so15528262b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306423; x=1774911223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OosJNlMHUO2ANcXKlCppT3JjFj+gSM8UPwVPtyNawFc=;
        b=gEat6jlZif7qm5vATxpt3YlnvKt5YVwe7EjJaDmAy9tqNhlb/WLcNhOtAAtxvWBG/n
         j1nl9dHIDPLM/AAYRUN+0yvXtyL3f7gkdCUaL4rSYFDPSuzLLg4KcHHjBWJtolp5b9c+
         KhqPqQUjyDf0Ylg97bLe0fSw8k08zzfGAyUF/KPzQWD7+HdPo7rpEtQSnbQMDxuKxrDD
         Xjs7QuS4FL2wzTWFd/8VghTYrm+qF8/yDdmoVYjYkktwHHLwJ+jLG5zVVxSNUaaPOCd3
         9QdaCPgMQEHGJzWhletWXOBHOexnCZm/NPSiuFgxL4YDhDBESPWhnCiuNMJJQPlMBPwE
         gtVw==
X-Forwarded-Encrypted: i=1; AJvYcCWuly8o3UN8wmiXe78x/+EeOCcc1+AWPoVaM3OCSymoqCFxy99Znxo1qznt2YS2ROUHmycHRaWfqUJ71TGGp5Lf@lists.infradead.org
X-Gm-Message-State: AOJu0YzqbJbwbjKmbFg4+kbGl+d6U82crq3wNlaifyO18IxoPuN8cRuu
	4HlvuMZDnR0GUGtFG+kG7vIrzjXZ5ocOMq2Zuj7iwYedjg6NBxGhnzQd6Yh6eqY2wkZragRMGd5
	JPRXrSuJlfPB/Qg+Z7OxX3eogsTAM2S+Ny288/I4LlSSr0LiP2hwSogRyFJ5n1bgRIkmjqwGSVf
	cX
X-Gm-Gg: ATEYQzy9/qtfNhtenHcbskVFLAsuCANvr1Z+Ghp5xau0X0bNIz6JNR9UxatTq3DYKeI
	Cnqu59+X+nK5NFu0AOITxL24KTFkHxaTW5/QHUj8d+Ax+UCcsSDrW6FgX1IXqN/KYZ2vPNROSMM
	rfZyWPzY3BvWNUCVPndxhsJV/Dhkm0CTGy362PR0acNyurtmTTII9BCdVWex02stRXk0CzFy3TR
	NIu9Shdj0XlNZRlIC43O5+VekQVOZnVJ3XTdfbnIKd5yomW5yrqp4sKG+me0b4bs3oEsyinOMuS
	h+LoB0/slp1YPYHwnR7sDOrDaExbfIteNwEDuobcpdvap6L61MzxzTE5Yi5WV39DHw/dbmL+g5r
	JjPK0mRibeYw0ah0Su7smg003W9kAlm0k3L8Dg0i8KbFll/Es/1vxCc5ylmGSh/o/
X-Received: by 2002:a05:6a00:99c:b0:827:3ed6:9122 with SMTP id d2e1a72fcca58-82a8c36f76dmr13334449b3a.59.1774306423687;
        Mon, 23 Mar 2026 15:53:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:99c:b0:827:3ed6:9122 with SMTP id d2e1a72fcca58-82a8c36f76dmr13334427b3a.59.1774306423314;
        Mon, 23 Mar 2026 15:53:43 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbebb2sm11341704b3a.14.2026.03.23.15.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:53:42 -0700 (PDT)
Message-ID: <f433b310-9bac-404a-9260-e01698e5c621@redhat.com>
Date: Tue, 24 Mar 2026 08:53:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 24/40] arm_mpam: resctrl: Wait for cacheinfo to be
 ready
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
 <20260313144617.3420416-25-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-25-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LfFPb4UY6FGNBSfHPOl5_eNyYrxvT6hpCxpfpMgXDbE_1774306424
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_155347_372202_081CF7C1 
X-CRM114-Status: GOOD (  13.49  )
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
> In order to calculate the rmid realloc threshold the size of the cache
> needs to be known. Cache domains will also be named after the cache id. So
> that this information can be extracted from cacheinfo we need to wait for
> it to be ready. The cacheinfo information is populated in device_initcall()
> so we wait for that.
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
> [horgan: split out from another patch]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> This is moved into it's own patch to allow all uses of cacheinfo to be
> valid when they are introduced.
> ---
>   drivers/resctrl/mpam_resctrl.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>




