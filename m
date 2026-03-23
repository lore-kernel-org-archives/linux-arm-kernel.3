Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F197CD58CBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 22:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szqtNIvPXQ9SbI/61Nb1afNT5qmeNook0e8si00UqxM=; b=ufBBJSE1hj3gxsQ2VyrygNbA0h
	1Kn96fwwRwG0NJYy91P5v/o8XM4S47i56bD+BoByitXjnemlHTJIwcscis/z+IS46rdqOC/x8a4Wp
	ZRDWUFVqLrwPXvklYd6QPK9LycSzdCvlKkoB+bDpNOJQIzYYcxiQkWfnT8tL5BlbqOjnKTOSwofSP
	d3CC371Eixhog1SvY8zafhS5/qqOkhee63IojcyMYVsVdP/CaJXv3Ntsr7wsVYpM9YDj/bjIDEqYn
	A03vJhB6AIMsMM5gaSmGU/a4iseSRAvSjLzDP0+TSq7ati4GjMVdmgpXnqcZtNyto+j4+GLo9CHf/
	pBOvFTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4o6U-000000006E4-2jpp;
	Mon, 23 Mar 2026 22:50:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4o6S-000000006DP-0iyt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 22:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774306231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=szqtNIvPXQ9SbI/61Nb1afNT5qmeNook0e8si00UqxM=;
	b=JhDD4tbNW8Fz/I4iXBy2wRPlnqwidztCfqPBDch8ZwIkM/31YEH7Vat33vzo21hRq4FglV
	GA1CHFzC392la52Q/02zrqhYLp+dqF0mF9df6LSawYC9qRuCEz6T5JK0lPj4wIh03la0z0
	SiyInKyqlF14eG4JLxRLkMdXo8ejmBU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-m5I74Pf5P7yNF5dddv1Rtw-1; Mon, 23 Mar 2026 18:50:29 -0400
X-MC-Unique: m5I74Pf5P7yNF5dddv1Rtw-1
X-Mimecast-MFC-AGG-ID: m5I74Pf5P7yNF5dddv1Rtw_1774306229
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35bea322389so2162340a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306229; x=1774911029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szqtNIvPXQ9SbI/61Nb1afNT5qmeNook0e8si00UqxM=;
        b=KFwU6phSq+JyNJ7pzR7rKe81Jzl4XIQqnya0S64cdeMzZpskwwOUVrO0e5dr64Ayp+
         iQ+MAt1VsTNFrPVMcV/H3o0/kbNMoXRamfRjRio6KF0Bw7muboh8iPs+egxXbcUfGfAp
         eeGN6ZdTZUKyHtcSUzofNoXJeRy9WSA7pBMnhXT36BV5JISIXoSNbq1Ff0j+UsVMVO2D
         UGsS6E7FTQn5vockU9MjYoL7KWHr0+XsY/SZCUtktd+yrTxuzvAcytox7ichY1K2jY2n
         T+DdbuEiNq8nT0L92aEJDQY8MLBRca+swnACsAijOXbE927IBBUGI1y3/Iv1KiV0UhLs
         t3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXgsIfks1LU9uQcyE6Ps1Pldp++lP2jqs72kA+veXUkCgT3C2PrjKaiCR/q4e3OOWLbjitqQm/kZd5Es1cmN2mS@lists.infradead.org
X-Gm-Message-State: AOJu0YzreITYNPDauM+WY6QwTuNS8ZzCS/itAUZivM8Y732SbMcmbuxE
	VxF0p82pv6LhkJ2cdD/VdupPqt3E6O/MIn3XS3UgWiH3VgMOgfAsv0g9S7NcfmKTkC09Hlegae5
	iv6O00ComCucPzSLl4K9rHuydkFKXvr6ofLFIqlzBN3Wu1KiH8F5lMc+otYTfYhU3lYz4v/mZtZ
	tg
X-Gm-Gg: ATEYQzxJB/jYEAqWeDWU6oMcsxaKAu8ES7FU69WMzWXvKcSQJhXb4W0m5b4iX3VS5Z2
	ApdSQS5wHPgXQoeuSRUajU5TIeLP19eT0eBrQ7837G61vmlQOHDL1rMzdl0Qfzzn3jOn32pLBpp
	VzZKZjbKOlnp47KtdNiMtr3W2h23XiUiw+eyjvWCexITEKZDdD1WjMTZJ8mej8sG26ZQZnwXMNg
	+ZVFFI72o0VTQ+6ERzOZ/dd09SON5bgEYjxAQHWXosTXYRB8ln6NY7/WT4eZunHfnlamCIEuYt/
	hqsVWQOXRkScXbhr2qb3mMexF9clYWVTxFGUUgxxqBBw9hIA2/RSIlgZbI1LyskHV8wCROXS5/G
	+psGfr5FsmH4gMruBlQs4Cb464Acb8p8Wt6Urgt6Yd088hLlQRu3OwEVuil+pR5vb
X-Received: by 2002:a17:90b:270a:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-35be690c7c9mr5628516a91.25.1774306228817;
        Mon, 23 Mar 2026 15:50:28 -0700 (PDT)
X-Received: by 2002:a17:90b:270a:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-35be690c7c9mr5628485a91.25.1774306228455;
        Mon, 23 Mar 2026 15:50:28 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c02bf1585sm62840a91.13.2026.03.23.15.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:50:27 -0700 (PDT)
Message-ID: <1385eb20-4b04-453b-ad4a-9bad110f30da@redhat.com>
Date: Tue, 24 Mar 2026 08:50:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/40] arm_mpam: resctrl: Add rmid index helpers
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
 <20260313144617.3420416-24-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-24-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -K5eVzCEuu8zAr7BNeCg5DX-vVC41TdLjnsvG3J2dDg_1774306229
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_155032_309262_7BB69F0D 
X-CRM114-Status: GOOD (  11.75  )
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
> Because MPAM's pmg aren't identical to RDT's rmid, resctrl handles some
> data structures by index. This allows x86 to map indexes to RMID, and MPAM
> to map them to partid-and-pmg.
> 
> Add the helpers to do this.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Suggested-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Use ~0U instead of ~0 in lhs of left shift
> 
> Changes since v2:
> Drop changes signed-off-by as reworked patch
> Use multiply and add rather than shift to avoid holes
> ---
>   drivers/resctrl/mpam_resctrl.c | 16 ++++++++++++++++
>   include/linux/arm_mpam.h       |  3 +++
>   2 files changed, 19 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



