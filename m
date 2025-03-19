Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D04C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdS7FLVx5vWQEjep5ijpHift5baLZ1L+Dub51QJXBpg=; b=Wd61f+YLkngAkn6MRgrKJg8BnY
	9DuAZEnyvIWxkBNKAjyT0+euMnwpmhUp4KMnkNbLp20tcg6CoBTPcf9O5pEe3nx7HId2N2OvOiy+N
	OFcolmNlXJEp0CE4kwXqvZjWM9ophV9FSDeY13zbPCB8h2a+wbWUvkYBzi5S5DBu8OmbuUiojv9Gi
	FDbnzzz3ypJLq7BuxoNmfOkFpgVKymuKpjPEDCZkvneKjRdWn+Lhxpyg2CLdnD48kEPyovqWaOrs8
	aIFBO9CtTdzoVcOZmqfTW/eOTJnXwPFOq7TvrZZbaVk/fv1Xugam1DF8E6gKrb2BFNtIO0tRbQQuG
	oS5jbajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2uU-0000000ATlM-1Q0i;
	Wed, 19 Mar 2025 23:33:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2rv-0000000AT2j-3F1M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 23:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742427038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdS7FLVx5vWQEjep5ijpHift5baLZ1L+Dub51QJXBpg=;
	b=Y4Rabb6wZtV0d/fK0MYuzCVoUdUsVO4TfW0ULno+ltr0ORaj/V/nN21xoDl/lUZJTI2SBO
	0SmPoU6Ijrv/LYCPJfJPf0rRG8rR8jQzQFjKHt710w7WVoKDIlDZ1hWhyo47OuTgy0Z382
	RE0l+2hw416m7N4vhTI+qElGT1r4YZs=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-Bfmy8MxjNh20zDT0vOAhWw-1; Wed, 19 Mar 2025 19:30:37 -0400
X-MC-Unique: Bfmy8MxjNh20zDT0vOAhWw-1
X-Mimecast-MFC-AGG-ID: Bfmy8MxjNh20zDT0vOAhWw_1742427036
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso287859a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 16:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742427036; x=1743031836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdS7FLVx5vWQEjep5ijpHift5baLZ1L+Dub51QJXBpg=;
        b=ZDXHtQ1W5VF8NcZF11sK11Bq95NBvDphv+BHs5gF8n94n7mFkbbFZC794Oa0ClPGcg
         3zNtACI71Y+cEOhwM5wHeSWkj6Tsz8cL/FbJ/hXrqVJhM60+svp0S27LJkXhGXLkckdQ
         LM9+E9cJXC7Dmm6B7cDc7eb4UPL9kXpwVH9yeV+nloANZbMxbXEjTn3owNN8ejGas5If
         DXbuT2FoVb1r9CEh1GGAdr5XJlmqDqdfCSKOV9uBSay2U7Xkv7tmbRPoDR9nkU0gm5bQ
         DfuD5Ck1AFH8s0mvzGPAVfod8IqQWKb5WbV5PW+3hpTeMo7AtpabyC/et0MVUblk7DFr
         bGLg==
X-Forwarded-Encrypted: i=1; AJvYcCW9RLoYuAUYJgkkcEcdVlILR582bKAbU3km9jOYtfKXKT3DW8tPB486sw1qj8dHn/czil4V1C9jlnEpiPKpJ9no@lists.infradead.org
X-Gm-Message-State: AOJu0YwMqcZDy+RE7VGDZwj/RxbC/eBEnjxxcOUz5a69HQmBmHDdzXxA
	J4t+ODvHu62i/kIzdDuc/B6AhmOBKNIKERzB0TuuOh7DzGEJa6RSOjXUrNjONYblc0oxplxiGpG
	i/9xK3Kq2DcTOHKzmoOREoUZRMmX/J/4nlPlooQLVwcPnfU3qwSHelXKZcez6TLBKKaLxTqG3
X-Gm-Gg: ASbGncvu570AJ6FkDwNCgloN3BPQnRBQan9+d4jSLimJD5K1lFz8K515vTbn5XDQ/BD
	K4yHuMz1pZ38L8t0SaUkh4CNxf/e8hsHralTjO646ptXR9uFiXw8iaH0q+fHDlQI64779AXvqwk
	/H2K4p9D8QrEh7nRfY8ZniFjgfnRuRL2UyUXZl69kyPnk2zi2ETtRphThBrmHnYHopoUqtdh7y1
	F4BLlVrjHu86GE/EOtU4s/lK4lywSz/FVJ9eES+bD8t6Uj9118euKJgFhqb0pt9wiUDzEZJtaNN
	1/0TEjNX3WQbqAuFlQ==
X-Received: by 2002:a17:90b:3805:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-301d50b4d42mr1546788a91.9.1742427035823;
        Wed, 19 Mar 2025 16:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfGpU5/Zo7T40O8hlX1URy075Hogo7VH/jVO2K2J+g+NugytWfq459WPEgAQ6GAnakfdnuvQ==
X-Received: by 2002:a17:90b:3805:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-301d50b4d42mr1546755a91.9.1742427035497;
        Wed, 19 Mar 2025 16:30:35 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5b809bsm2548637a91.36.2025.03.19.16.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 16:30:34 -0700 (PDT)
Message-ID: <c69921bb-79a0-4644-a19d-9693d1dd638e@redhat.com>
Date: Thu, 20 Mar 2025 09:30:30 +1000
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
X-Mimecast-MFC-PROC-ID: fw5rh7ltj5lo49n-mJH4YKaI7sSc8T5Dq3Qj-aa35tg_1742427036
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_163039_887746_B20EFB8E 
X-CRM114-Status: GOOD (  15.36  )
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

With the fix tag corrected to the one, suggested by Mark.

Reviewed-by: Gavin Shan <gshan@redhat.com>

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
>   
>   	init_fn = (psci_initcall_t)matched_np->data;
>   	ret = init_fn(np);


