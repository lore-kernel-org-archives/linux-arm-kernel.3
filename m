Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD11FC72A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 06:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUFvGhq55JONPygTQtBYsqFeVViX1eQUM3HJHzaMYXs=; b=elwOomql0vWXF6F5LHGvbqv55e
	pX1gD+mFqmVIbq2dpmEbk+5JdmZqxVbDFT6wXCAMoEuXqh0V+pJyiBw0BeoD6cgeRM9pT3VXhAs0v
	VnTGJ3P5qUB/ApkW1x5gw3YNHl+TJNKRAVrVdMTdFyzVMvVUmlgbccj9SoTIPjVoyITXLwDSnzYrj
	kAOpNPJGJOd/1FUKJIgXUSwwue6KrU/02XO4N1g2MkOK7xlZ75+GWp5lkom0niwW5vXhBspXJBtEy
	efzBuNgbilE7Kr9Kk5xoW3n9U+C3IR/QRN5nFiVJ6wlgSxxqibVbxitQ6IAnK83UCbYecwC+QZWQw
	aHkDV41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZCS-0000000G9LK-1cIV;
	Mon, 23 Mar 2026 06:55:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZCP-0000000G9Kz-2d72
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 06:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774248940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUFvGhq55JONPygTQtBYsqFeVViX1eQUM3HJHzaMYXs=;
	b=EYy7KlQB44q3PKDJEekybpFN2E2Bloz8rOgpubo+7Hka6gYNbJo0UOxOvE9MqkZbLpXBGh
	BuMYClle2y8QKFl0qhLGl3MZHQ6okEScW99VMyaUhYmvQA3sT4YxvINXghvXFJ+Lh1qQLF
	M9gd5kGl0/b/uVLyEWToaWxJNDHKCmc=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-g8vFgc2XMGWKO6iCxLdmDw-1; Mon, 23 Mar 2026 02:55:36 -0400
X-MC-Unique: g8vFgc2XMGWKO6iCxLdmDw-1
X-Mimecast-MFC-AGG-ID: g8vFgc2XMGWKO6iCxLdmDw_1774248935
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bce224720d8so2571516a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 23:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774248935; x=1774853735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUFvGhq55JONPygTQtBYsqFeVViX1eQUM3HJHzaMYXs=;
        b=f9GswLRrT+6ZYN0TkcN/iwnSWBIHJREH7o/hr09ls7uAL/HqPkaFezsERzBWqWPZKs
         bnqklBNVJrUejMSYdU2CgaBX2T52Fn+l5zvOHSfYxrVPecj3BvScljayOpsQYKKrFRKy
         /avkVQppPv/mIzVFgrCnmdFE2Cnh6y/qvrXXGlR+lcuDtsYaG7n8QOR6njWLtLDnyCMd
         i1m8IBds4+vzN4XLJ4kxPrVkZ0/nIQjzmaA7d8YWZMmk2JlH8LX6SPNUHvw8ByBWMpBx
         P/3angp2GbzWzP9wxtPPAL35O0SUVzjedfCWHAgLh0azO6Pt4m9UmzFAk5zulaln9A+/
         rPxg==
X-Forwarded-Encrypted: i=1; AJvYcCWFCS1Do5ktfe7q1XabbMdpUkunPsf3K5SMM48a5UBNVgkMEfVymCdp88tjLbiI+PtCiXy5sw82Y9JZftpoVL7x@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5pEEfZ6/lN5QuhbRmgxzte7aeRcF4RrjlpWqXIVErnPbIPPvl
	BMCzGWW9d6oDabzNyGwEAiHZThu9BIrDziPG15H9QDmIZYrNlDc0SqQPY+6uMkiHmOPAIZGFs5K
	lYEqwGphYEtgzu39jpTYP/Cb/G05VNyRLLorcworITGtS0oBRRFDRXIWNcj4Frj3OJl36bRfgPH
	CP
X-Gm-Gg: ATEYQzyT36gxyRBhPe+7Hd6/i+Ibz43F/bdNqOdlSAQ0ObgGcONi7+WNnLZ+ii4HxNY
	TKMqY16DOUc1QIDQJonuSfR8VaFdTpkYwATK+8Lkk5xnbiD1uz191TL+eAPRJ/p4ESJyoxLnOxV
	0rEO7IOsBt1k3xgOImTABPW8IKPqfut0zvY2j70HX5yrMdZN2DvwHIwoYp9c80T4ygFOzEuwtcI
	MQYTPjS9YYJVRXya9qKo1DL0swpvlKNKpQW4V1PXF3L7JkbE16Iziacfa+ch253y71miNodJSWi
	5qNS2BW+tSiEJsX0tSvd500Rr12/GU/zR9dtWETOZOGMxPSTr1/17LBizvT0qEnd1XuP4Lwb72Y
	s8Jymc+hhG41QkdcTDLqbPTFlGx0SpHAj9Vthe3BW2KUsuIqOTk33P6t7ovEINudU
X-Received: by 2002:a05:6a21:3286:b0:398:7e12:c03b with SMTP id adf61e73a8af0-39bceb41272mr9670979637.44.1774248935563;
        Sun, 22 Mar 2026 23:55:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:3286:b0:398:7e12:c03b with SMTP id adf61e73a8af0-39bceb41272mr9670964637.44.1774248935151;
        Sun, 22 Mar 2026 23:55:35 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a7ff529sm6924198a12.2.2026.03.22.23.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:55:34 -0700 (PDT)
Message-ID: <670cca31-ef2b-4fd8-89ad-221526a07f7e@redhat.com>
Date: Mon, 23 Mar 2026 16:55:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/40] arm_mpam: resctrl: Add plumbing against arm64
 task and cpu hooks
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
 <20260313144617.3420416-20-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-20-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9DCQDt0GbO6S9LjafVtGwon3sjTv25WyjXfeSguhY-0_1774248935
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_235541_769755_91EED8CC 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> arm64 provides helpers for changing a task's and a cpu's mpam partid/pmg
> values.
> 
> These are used to back a number of resctrl_arch_ functions. Connect them
> up.
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
> Changes since v2:
> apostrophes in commit message
> ---
>   drivers/resctrl/mpam_resctrl.c | 58 ++++++++++++++++++++++++++++++++++
>   include/linux/arm_mpam.h       |  5 +++
>   2 files changed, 63 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



