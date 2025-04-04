Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAEDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LaF4fLKdOoeQDKaY7hXS1quRtfkLxfRHiyT+rlQy2g=; b=4/crzA1zqHHG4qM8zPLRNQq9uW
	dH+09ux0pJWoU6wMwIvbcByJkrH6Wbf6+FVX59KgFCNbufbosV4Iyox+d+/w8RsNy6yPgjFrrq4Zz
	gfRtf+Uf+Y5iRuB/jYV2IvcH2t6g0bU+ytjUZddBwU/EWvsfzMOF2QCJzZnyqnBWwoDbyIPANI0kW
	WiiOlIu923thJyArI3EJQAej9QPC1mqnCzoHmnDZB3qAJXJ0k9wi/6uRWvGC32YE100ZAmpkI18wB
	ykBRVvgLXXS+U0pfbE7SZe3ok1/EXJyKPPMe79ChhUf9qCmQSgTO5ns6bb+89GfSOKm0mGsExplQn
	a+34E2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0de8-0000000BK4a-1CnZ;
	Fri, 04 Apr 2025 09:47:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dag-0000000BJBu-3Nao
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 09:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743759836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LaF4fLKdOoeQDKaY7hXS1quRtfkLxfRHiyT+rlQy2g=;
	b=IbB7VJ41ZKAy5ppVbscEpCUL/zEUvSMcmqbylldhvexuUo87I1GYzuZ4aPNw2ROexMGNYv
	cJ6S89+8PgjJQmBIe+DTNTYcplqyaRNJE3RnBhJ77hTw00B78Mful48UkUw6QWx3KvNvlX
	U3C16VTyR2z5x+LuHmEfssS8RV1UBRs=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-aOZsA7eWNLqfIEoSlISlGA-1; Fri, 04 Apr 2025 05:43:55 -0400
X-MC-Unique: aOZsA7eWNLqfIEoSlISlGA-1
X-Mimecast-MFC-AGG-ID: aOZsA7eWNLqfIEoSlISlGA_1743759834
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22412127fd7so13614935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 02:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743759834; x=1744364634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5LaF4fLKdOoeQDKaY7hXS1quRtfkLxfRHiyT+rlQy2g=;
        b=r2ILofzyLALDFZQDE+plu8PRua5lXjHG71WXAuKQUQWe26Lo9esls3/WNdfUOT8ZTf
         TVoH6MlDMZi6R92EVQ1ecfo93ZsxjBi1JunnZtlZ9rQmsrNL1sWzmW4ZTeVLqklyQlDq
         a+eeIzDpqYix77ZuGyoJwyF+JaSZJuCW38k/koD/JCDxmFvjYQhzjNnm54IcRDujm+J2
         O3eMsGLPiNZC2gg4N/Nuf2dyj2VzeTUnotwFizICGIAJQYJPdrf7EHHEt2XzXBmTSJma
         qyBgjoAlIVln1o/IYwRM2PwMA1kNDzdWkVcgrOl0DcjT8S+JzzIDRNF55qwm6bsR7YzJ
         /6xg==
X-Forwarded-Encrypted: i=1; AJvYcCV1WlygT54RNZVTJdC1S/M6OpKzYK6Lql1RAOMuPJymAZkPW4TmSeo1lsnEmwsn0SGixflVgnUWYb8npqk+DuOZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzDdKuHfWAdypKFpGJR7RGhGQYGFYTpwLJejv6NOKzqUzOXoOWu
	IQd0RxtrNNtju3w8R9JfGpTEln3EjdA3PRaptNcVLS53nW648NgRJVLnqJYQkIfp8Zjps8Aqm6Y
	41GxyDtZCdSunG1/Hin5yjKYGT2jqh6OXY5Gyz1dldwgpepQDGVPeWBDncLIaYeyv0hu74flt
X-Gm-Gg: ASbGncuXpcSaZTcgH5uA2/xP1S7qIHr34Qpz/b5/4OUGW5KLLuM5fGlt6W4GPsMFpMl
	ENg8nHbc2a6LD6gvct2oXfnUvkgBG78DLgi3nE7EBTan2+pX0OLVOWGsMkcIuYoClmmHsP0rPk7
	EiDkbwWriqeccITkZzl4h6sCgx2Lab2J0nIEec3/trIbOoYCPtAJeEz3gDXZccTe7tPveBx4pzz
	WCOkpKG3oEh8dpzclN1/bnozue5mkD8Jd6PoXZHH0Iuzp9xMB5bdXm7OcwsTD6t+L+OZ8yADgo3
	xW0Ai1TVLKUpeyWm
X-Received: by 2002:a17:903:984:b0:224:26f2:97d7 with SMTP id d9443c01a7336-22a8a858c08mr28139155ad.8.1743759834309;
        Fri, 04 Apr 2025 02:43:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUx0Z6zWUCBv1/NMM1+pM2iQHnpatpXR0YFs7rxLdYZ2x3JRlrJOf72BDecGIzF3n/Ror1Lw==
X-Received: by 2002:a17:903:984:b0:224:26f2:97d7 with SMTP id d9443c01a7336-22a8a858c08mr28138985ad.8.1743759834002;
        Fri, 04 Apr 2025 02:43:54 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c016asm28098675ad.62.2025.04.04.02.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 02:43:53 -0700 (PDT)
Message-ID: <77ab4f8c-4c5c-456f-a108-153a49dedcbe@redhat.com>
Date: Fri, 4 Apr 2025 19:43:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: rppt@kernel.org, steven.price@arm.com, suzuki.poulose@arm.com,
 tianyaxiong@kylinos.cn, ardb@kernel.org, david@redhat.com,
 ryan.roberts@arm.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250403052844.61818-1-dev.jain@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250403052844.61818-1-dev.jain@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GN3ulO150FM2G7KvJzTdajt66ul0tlt03mLvstkgeKw_1743759834
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_024358_925378_15B896EF 
X-CRM114-Status: GOOD (  13.57  )
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

On 4/3/25 3:28 PM, Dev Jain wrote:
> arm64 uses apply_to_page_range to change permissions for kernel vmalloc mappings,
> which does not support changing permissions for block mappings. This function
> will change permissions until it encounters a block mapping, and will bail
> out with a warning. Since there are no reports of this triggering, it
> implies that there are currently no cases of code doing a vmalloc_huge()
> followed by partial permission change. But this is a footgun waiting to
> go off, so let's detect it early and avoid the possibility of permissions
> in an intermediate state. So,  explicitly disallow changing permissions
> for VM_ALLOW_HUGE_VMAP mappings.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> v1->v2:
>   - Improve changelog, keep mention of page mappings in comment
> 
>   arch/arm64/mm/pageattr.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


