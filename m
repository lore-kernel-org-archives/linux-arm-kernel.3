Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188C5C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqT9EgtacH1pGzAa8bINKY6LuDFSP+bccvn9tGaRagA=; b=koS9MQ+3dFQLrfEazYlKhwXJgz
	2xJf+VO2yZmhKkyL79Hs6u/S40r2BjWnP1pIipblr3WcqMJqtUxhj+1UnBeMABw5yu+D3n8q1gyHi
	XKs1GNZDxpOE1zz8UrDqaDiYcQyADTmLHCDYjdNVvuZW8Euxg0d1JRtAWowUatbgJVxwza+CJDb6E
	Kb3kGjA2kEcXG07+CXtNm/GKoHiJMIPaCmD9yKlHwOoXADvlPAKm8Qstrm4doP3XnpOSrv0poDxUE
	8ApgNWQ1V+K5GNneKTYyrAxlrc29gWIkpS9CcDArr/+reZMVuJl2Xc41vS41Yb1SiUnZwUinK72v3
	zz4310eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqh1-00000008fNK-1U5f;
	Wed, 19 Mar 2025 10:30:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqfJ-00000008fAJ-2QF4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 10:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742380128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IqT9EgtacH1pGzAa8bINKY6LuDFSP+bccvn9tGaRagA=;
	b=JeESyd7q/lA++orEdcHXXBf5V6Y44ID6APCo1vgRFoZEJV+udeor7sG38albvim491F+DK
	p4jF4f5F1VZ/ESHxIEdvqY9fgED2C9NYDiahuty0flVO3x497Aj/1M+Wf8HuCD2Qy/MU0a
	8xA1Nc1Rau4dFOG+xX371XuESc/XGUw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-ZY5rDnB4N6iTFLjzOGbTTg-1; Wed, 19 Mar 2025 06:28:47 -0400
X-MC-Unique: ZY5rDnB4N6iTFLjzOGbTTg-1
X-Mimecast-MFC-AGG-ID: ZY5rDnB4N6iTFLjzOGbTTg_1742380126
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225974c6272so10933105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 03:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742380126; x=1742984926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqT9EgtacH1pGzAa8bINKY6LuDFSP+bccvn9tGaRagA=;
        b=j4vaD8J3OYxy+ymj1MLmstvz48ZnRrq4mYQ0n1gKIcfkRtQs5yncN6QMoBP1gnnv0h
         r2iYdwGhna9WjxvkFPQddwDO5pyHagDpAXVaybHIBDCmtcZo6+UFMdaf/ggFt0gHKMuL
         waadGzcCHbKMufP36yyD88oMZEkdnYjMk7+jRFWtQC9BpNpJWGdA4GGS+SgNK0LtigoH
         kO8Kn8upIRwf4HWkr0Orbgqd68JLBvt/JW8M9D1mGNRSWHCNNnoNpqQqQoYWNqd96kEG
         eaBUNuEQCTndeSyK54hdf2pYEpy4PI9SXP+LQO1Goi8e1etlzS0YyiRM6llGiTfXlFRm
         pp6g==
X-Forwarded-Encrypted: i=1; AJvYcCX39+VMc1A8hXG1IRtgeV8cZnQEQAL49sPFWCV1uvzgI8Cb3375OcxmfBlyPEI6TPycygpnJCM5CpF9VHplZPnX@lists.infradead.org
X-Gm-Message-State: AOJu0YymTuOI1DOg3JAv76k4oIC8Cvi4Vx0knp9QbwWOo4IKxCnludjg
	aJ/wvQhXC1fRGuAUwcn1WO/WlXwbLb250uHHTjXwJys9T7yzKIj0m2yN0LWrcNZ4sAyLmMjW1sZ
	+GFW8MhOcIHYNLoWXCnqNEmxtBZC2HYieY3rIDwkU86PJXHISkkm7hFgWBqBFOw8fFJh/XgiY
X-Gm-Gg: ASbGncsjjk4XRAOR5UW084fwj//yAf7vkL6v8ZbrK/39THAvLmv9C8jLNlKxAGRzp7P
	I6WUYszJ2EiuAKxMPxjY24UZcPKtvDz4PT9cUk034cnxgPuUtYQ7EM9cRFzhP8r3Q3AIsaHi+n5
	JCa9vIsrje5wj1gPnmsVsfUOF9zV8rVP7nU0oZh8dN5SPUH6XGEebR0z+vi/NVf9wem+6ga/BIZ
	pTW4bnQesUk2mbb65yOKrs70H0b/2evhhWa54pLu2xOa1CY8wDpGlLpPOow2iByFlPvzcGDVhHm
	wqgRWSYgOn3+pZpYaA==
X-Received: by 2002:a17:902:d550:b0:223:5187:a886 with SMTP id d9443c01a7336-22648f0cba4mr43831055ad.22.1742380125924;
        Wed, 19 Mar 2025 03:28:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF115S9F7K8/VY/uIVVLVdYu52ScoDkva9X27jsROIn1MQLuwsTdtxucZqN9UFjhuGUvr6o3w==
X-Received: by 2002:a17:902:d550:b0:223:5187:a886 with SMTP id d9443c01a7336-22648f0cba4mr43830585ad.22.1742380125494;
        Wed, 19 Mar 2025 03:28:45 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbe960sm109981735ad.200.2025.03.19.03.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 03:28:44 -0700 (PDT)
Message-ID: <28cb8360-7fb0-46f0-b05f-5114f1974cf3@redhat.com>
Date: Wed, 19 Mar 2025 20:28:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: psci: Fix refcount leak in psci_dt_init
To: Miaoqian Lin <linmq006@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Will Deacon <will@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250318151712.28763-1-linmq006@gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250318151712.28763-1-linmq006@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5FHnvdm_EBZNaV63VTcryNNuVUQB6c6tgBXMXPPhke4_1742380126
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_032849_693630_AD05B6F5 
X-CRM114-Status: GOOD (  16.51  )
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

Hi Miaoqian,

On 3/19/25 1:17 AM, Miaoqian Lin wrote:
> Fix a reference counter leak in psci_dt_init() where of_node_put(np) was
> missing after of_find_matching_node_and_match() when np is unavailable.
> 
> Fixes: bff60792f994 ("arm64: psci: factor invocation code to drivers")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   drivers/firmware/psci/psci.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 

I'm wandering if the fix tag is correct enough because !of_device_is_available(np)
wasn't added by bff60792f994.

> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index a1ebbe9b73b1..38ca190d4a22 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -804,8 +804,10 @@ int __init psci_dt_init(void)
>   
>   	np = of_find_matching_node_and_match(NULL, psci_of_match, &matched_np);
>   
> -	if (!np || !of_device_is_available(np))
> +	if (!np || !of_device_is_available(np)) {
> +		of_node_put(np);
>   		return -ENODEV;
> +	}

The fix looks good to me. The duplicated of_node_put() can be avoided with
a 'out' tag added, something like below.

	if (!np || !of_device_is_available(np)) {
		ret = -ENODEV;
		goto out;
	}

	:

out:
	of_node_put(np);
	return ret;

>   
>   	init_fn = (psci_initcall_t)matched_np->data;
>   	ret = init_fn(np);

Thanks,
Gavin


