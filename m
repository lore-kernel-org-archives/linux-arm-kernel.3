Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB75C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 23:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4n4yJ3lyhKDodqg2JSaNNLByV/PRMTQe8uV4pQUPR0=; b=BaMzJt44CLc4WLNUk1u7YpJgzT
	FAyAxYA5ty/ANMNxphyPvaiU0z8GktiU8vuToPGcAvNypH9XLG21v7l6FwACpbnhhXnKdEK9pgafa
	T7RNK1urUXLOsKf/EmlX9dGvNJwHIzX+QzpezM/Uk3tbvkJQfyBBvdCoyZRnnEr4ZSORum6zPkuQ1
	407zknUx19c2VsoHPMBnYgoESAWc57+MvdfUZH4yF2UISt6WhcH837/Bo9B2K+pLdtKhr2wpJDYSo
	7Q3cU4uXRgRwGzyk58yF4iqSpKxWAYwLni/mxAZBRE18j1Q58nv+6KkpmrfJaBVTf7maAjnPoQA15
	k62f292g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9T5-0000000G6IZ-2jHg;
	Wed, 15 Jul 2026 23:56:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9T0-0000000G6Hd-0vgS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 23:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784159801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q4n4yJ3lyhKDodqg2JSaNNLByV/PRMTQe8uV4pQUPR0=;
	b=JXCssU1LKeftL/8dMWQMmI1UCdD49QoVnA3fp6Hto+e12ewqA/Q6u3kmLAvlSHIgfn2W+7
	QiKyYwO2WvJ6gLwrcqSkuunytS+c31UtbLgELNOE0ASc8CDHtDbuIJZTRGDMaafriUEwDu
	pFEyhB2OcnAUiKxe9j7vvlJ00MWg9dA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-G_Snm8GFPY-IG5BdkuMAGw-1; Wed, 15 Jul 2026 19:56:40 -0400
X-MC-Unique: G_Snm8GFPY-IG5BdkuMAGw-1
X-Mimecast-MFC-AGG-ID: G_Snm8GFPY-IG5BdkuMAGw_1784159799
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso7180645a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 16:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784159799; x=1784764599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4n4yJ3lyhKDodqg2JSaNNLByV/PRMTQe8uV4pQUPR0=;
        b=B0u7whIx1+ERuCUUpnQF2Qpaa+vGGvT0bsOUNgbDVIIgz5Gk0c204ComHYFEn4uQAi
         zE80X7dKe24Rz/0wmsNR1DZEJOzGjqozYl+AqFPukCHV+5G5yEHc69LGppBVBV9amc7f
         Yk+7Zm5709kFdkfJhTWa4ZWvdmbG4aLQ2BYw25JNSu7qNa8JO27bYW8uN9GoGcrJOlVq
         ZADfRWiceH2xNFe1GFxAsLnxgDHc6Dz9o1B6Skvgdq6Zxawtpradg8iN88e/ktvY6KzL
         eU+vge0nLHQxcrQWwQ2224PCHgYeKXdQQ/vdn5O/iiC2gWyFUdw4SQ8ctSeTS2eO3d36
         8ReA==
X-Gm-Message-State: AOJu0YxTl/ih3ai4rqPMbcIi+DNwDmnOhtWsPUTyI97JR06NPEndRgCC
	36Oo03PPccNeKzqvcrLm8chUFHOdbJK/4ZxgdSn2WoS7kNjrfKnxKCEs77sKBsUnjal28Sa8H06
	r6+z70YBBjYsdp4kZdAK2l1pJ4WheaBor7dRd0DvNIrTeznEQCwySAtaNmSl50WazdOQ7cTUIsB
	iI
X-Gm-Gg: AfdE7cmVavrJPv5/HvFf1t5X4nHFr9G/CYDstX0iro7rHeNF2mZAk8D1L6/CWiRm4cM
	eKZ+94/f+Tq9byPhvCinTlg7Nu39Pr1dp45dVIvvEjpHlayRxx1RM2nzK0yA8lfHlWFmRmomBdh
	ApWq2wb2ixrF8cgYLJ8lH9FN64n4hFLb7ocjAXpJclDNfg0HNn7QGi0RfM1jRpMOBvTeJmvRDDw
	cTKUppw8zepQSs3lHpOwmuNFRBXBpJi1Q1zzjuk5fP37NxlaCIGUhsHzIiN/udVgulqlZqmpEhW
	3OuG4lHikHhybXDacy2kIQiqLzGbojSQDfsQM/PnkUhorFXh6ikIrtuha4PEhw3fJ5beBvNxVMf
	+XTG6vxsMLmmgdjX+pE818uGxmHm9P26zGCQR2jEaDv4=
X-Received: by 2002:a17:90b:4e8f:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-38e17d96412mr9375393a91.5.1784159799136;
        Wed, 15 Jul 2026 16:56:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8f:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-38e17d96412mr9375367a91.5.1784159798725;
        Wed, 15 Jul 2026 16:56:38 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6ec32bsm4107931eec.29.2026.07.15.16.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 16:56:38 -0700 (PDT)
Message-ID: <5714d960-dfee-4433-acb6-cbfedf6c75c0@redhat.com>
Date: Thu, 16 Jul 2026 09:56:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm64: cputype: Add Cortex-A520AE definitions
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260715053408.1950475-1-linu.cherian@arm.com>
 <20260715053408.1950475-2-linu.cherian@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260715053408.1950475-2-linu.cherian@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tp_H8XwXUL7OXp4HNObh5CBIC_puJXvU-ZALvXbvy1s_1784159799
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_165642_338366_AB66A19E 
X-CRM114-Status: GOOD (  12.79  )
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

On 7/15/26 3:34 PM, Linu Cherian wrote:
> Add cputype definitions for Cortex-A520AE.
> 
> The definition can be found in Cortex-A520AE TRM,
> https://developer.arm.com/documentation/107726/0001/
> as part of MIDR_EL1 bit descriptions.
> 
> This is going to be used in the bbml3 support list.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>   arch/arm64/include/asm/cputype.h | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


