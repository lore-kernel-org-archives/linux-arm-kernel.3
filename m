Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BADEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWT2rNtrUtxmzWkwRuY7+A1/i61TrpIAbnC4kdeBSr4=; b=WF9bVpWalIY6raPDe7E2SlKRr1
	Jct16y5hHcvI1tuSpB0AB9jK1NM7WiIGCttWcRhEHyvsduIhH5VT17tvGOm50ykI4oOJEurTuqAAI
	tuxDkx7koZhPpggSWR+P90yo8nG1U0iL6jkBsANzcaZrzQr+ZrvdsViRBTVxmyx7JDMckvSFbIj1n
	CiWnMz9DxoLdOlWcsj6XAAKJQH4g3/1QF04YFwa3/I05RjrJnXFNjzafiYUT5IraY5s5ND/a7lDNt
	54P0AxY1ih6vUVa5kXV77TpkpH9zclRGTqQq3Z3eG26F33W/ACSkFn8oWdJdchQ9TFqA/96aA2nKI
	S2ThllpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwmA-0000000ERSW-42FI;
	Wed, 15 Jul 2026 10:23:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwm8-0000000ERRI-3zu7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784111016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWT2rNtrUtxmzWkwRuY7+A1/i61TrpIAbnC4kdeBSr4=;
	b=RIQyao60ErE0meDlxC3aLCjNM+a94YDQt/E1Rt7e6h03stWwX7eFUMjpT8DBNNOr0ou8b/
	8n3sUQB+6NOZDuB5ZVtlwmEfVsDeXVGbGsZsNdTfRH9fT9OwFlWofHjjm3I95sX+YCGCT2
	0QMs5jj/9z35eubJlxKDIm0IfY/S3mg=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-EjWBYTt-PaCDJO96ZK0sjQ-1; Wed, 15 Jul 2026 06:23:34 -0400
X-MC-Unique: EjWBYTt-PaCDJO96ZK0sjQ-1
X-Mimecast-MFC-AGG-ID: EjWBYTt-PaCDJO96ZK0sjQ_1784111013
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so2046713a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 03:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111013; x=1784715813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWT2rNtrUtxmzWkwRuY7+A1/i61TrpIAbnC4kdeBSr4=;
        b=PrV1OiJn48T2Iw9cFqcTjsp2qQrW7rHNuYybktcdsXiC5vEtFzp/Ki14lU+nBvzMm6
         doJq1GTpEVrOJVnuFfT9/yRpSi8QLfY5R0GUB2A5Bp122By8ya83GH5EVFtl7aGG47aE
         BmHo3Q3pnXZkVrBzAQX1XpLkHeYWt2fott/VQlgx7CAYGjkR43xuKts5S9A6RD9j6BEW
         Vr0/n+SoLxhN9sDKLx7r/PUMaJzpS/wh2aXgzSDNDANEB+ue6iKdl21/ecVlwU1fvlbw
         22s4oFPGvyxqQD2kcsJh/mRv2qKs7fx+SJKRXI6UXSTc8FfF3b0xWg+SCJlqMiRiGxG1
         NXwg==
X-Forwarded-Encrypted: i=1; AHgh+RrQpgAjI3pW8YRqyjdIhZjOZrgPzff1eeeOG334WiQpHv9vZRHmBeQD1gv9twlKhQ0h5MFraJDHqtwHbvaiw6rx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp6QZQlWAFXYS2Z0DCrcapLk3wHLYjDbn2LDBiiw6gotNZQKQE
	jR2KpuMoTGJSM6zATpelLWTHJHA98sxHbIeH1YBWDI1LcfZhsvGyRs8I5vby7FGHEc7T9WfZKuS
	XJS/s8ZyB2gHKLODZ5tgFdTRwok7YLssA4qWd8hKQfLP0Q1YyYTQg+lalogHf4zXPlqyGcGDNKv
	Nw
X-Gm-Gg: AfdE7cmoLLJfEN5egtQhC/1WCnISsJZDYg2Ero6FUyBGxOfsIKQh/rPQDoUbGkOwTCF
	/HcbI+UKgTmAOBaCxCX0wc5GSLINxbUgggj0ZSI77ZvimpWiC3kQByAVSrnrDRbQMiHULwmDSMu
	rQR0PqLeyy90oFKUoT6awbdeLNbdttVZwrIliQk3ZQ1rv3dh8kA1Ypr4Cju7ZhxJDFSCCD87C6p
	+DrTtNQazWsp8qYw8lMk6JlOch5o2zOJnoCCt72ziq4SdQyXb9Hy2iakmbL9WwInmepP9gsgrSa
	gMceUNFf7xZRtOLh+0QPcyMkYXimWu5UcdjZqMCzzYuD8TeHFl2/1tdehZRvB3qS7dO8XZbhMwE
	ESgFSaabwg4rOP/7ZTNPMwQ0wKzU+htICo/sESsHHLHz+XrJBKJ8gJQ==
X-Received: by 2002:a17:90b:1b06:b0:381:dd0:94e6 with SMTP id 98e67ed59e1d1-38dc7777d42mr18230831a91.22.1784111013289;
        Wed, 15 Jul 2026 03:23:33 -0700 (PDT)
X-Received: by 2002:a17:90b:1b06:b0:381:dd0:94e6 with SMTP id 98e67ed59e1d1-38dc7777d42mr18230807a91.22.1784111012809;
        Wed, 15 Jul 2026 03:23:32 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e2a06c049sm298694a91.0.2026.07.15.03.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:23:32 -0700 (PDT)
Message-ID: <24d5d407-896e-4136-b7c0-91b006670b9a@redhat.com>
Date: Wed, 15 Jul 2026 20:23:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
 resctrl_arch_reset_cntr()
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
 <20260707162440.12132-5-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260707162440.12132-5-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F-bigXSttdVkb9D4xRpRRSYM2PzQutewiglj29fxk00_1784111013
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_032337_070712_1B40AD13 
X-CRM114-Status: GOOD (  12.12  )
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
> When used in 'mbm_event' mode, ABMC emulation, resctrl uses arch hooks to
> read and reset the memory bandwidth utilization (MBWU) counters.
> 
> Add these.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Changes since rfc v1:
> Move __reset_mon() and reset_mon_cdp_safe() helpers here
> support mbwu in __read_mon()
> Mention mbm_event mode in commit message
> 
> Changes since v3:
> USE_PREALLOCATED_IDX, separate h/w counters are needed for code and data
> when cdp_enabled is true
> ---
>   drivers/resctrl/mpam_resctrl.c | 99 +++++++++++++++++++++++++++++-----
>   1 file changed, 86 insertions(+), 13 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


