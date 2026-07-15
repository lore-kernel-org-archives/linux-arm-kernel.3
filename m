Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D119C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHHyMLTFhxklID5pIbIJxW41nvs20KqRL73EVnGtbTI=; b=RGtzsV6qgJEFjpaCBJjTP3WmG5
	3+kynNfNX8EegakmMKcYGpZHZ2WErqlSX0bmqU5A5OyPa8eC6ONIONCPicKgF8KYsGpE9TX/UVAi+
	dPVveCJ1f2lkHnVEMamGyHe17YACtbWVQzZm6tPGwNUoQTNTMyTTZThG+9KDatgXpfjZ8nkxjTrSf
	0NRWFazZwsiiAf8p1yArKY+EbScQc9c5411FIW2FhfUOK2E7gB5GGdoNEIHoOu15fPOw/kSwjq465
	hng7w4q/vSGMkX462pE+wZNhq5q4XY03FLLtk/H4SVXBdbXQclXHoIPHsyHUsspOHsZkvBAg2nWbz
	KTxb6eYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwmT-0000000ERaU-0r5t;
	Wed, 15 Jul 2026 10:23:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwmQ-0000000ERYX-0phY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784111033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHHyMLTFhxklID5pIbIJxW41nvs20KqRL73EVnGtbTI=;
	b=Gx8X/bvcyR/wvAhxzbgK53f9/BIztTyPbnC/YausYPIBnX6jkYBcROnoMxKynBH9eC6lMA
	szjGJ8d/1sHeIzICNCLqEA6EJKwrBwqOQrgB3PGQie0yHRdEix4w1wXg7B9hCQSqRBl0qO
	i6L3AzNSLCsRtTOk8ABOvedLuDNeAvk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-uvKnNXM7Mxm5E43f9oNJpQ-1; Wed, 15 Jul 2026 06:23:52 -0400
X-MC-Unique: uvKnNXM7Mxm5E43f9oNJpQ-1
X-Mimecast-MFC-AGG-ID: uvKnNXM7Mxm5E43f9oNJpQ_1784111031
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811ae55313so2020498a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 03:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111031; x=1784715831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHHyMLTFhxklID5pIbIJxW41nvs20KqRL73EVnGtbTI=;
        b=Gq17N7vpi/wVtLRMoFiSTF2poiLQSRcDs3GWVvC1roSDGpw1g5Xjh7HlK7Y5C97Vu+
         DCO4KxPivKRTRHsQw9hpWwm0oSUGMgn3/xt/qIM/QNR2BtnBgFW1Hp4GwIuwjr0CAQOc
         q41e01keBYZJox9X9ZWjzB+Hi+U3mEa0usj9aJ0sDER0KHQJo0G6przOqm5YuZpAWfEL
         KMICLbLT0UYep0mfiWsY+wJLAtg3FdJIxHyEkxz9H5SNM2N9THyezWn8S+tj86K3Lbln
         m0AH2zbenVfeJY6PXdA3w7G+tA1P2jiBUCQiHUCgXL1zc/d1POUTIzVW75d+pVwHsTYF
         PHsg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1zxzHRuX0j9hyET5Lt9Jqd++7fH9+3ybGO1kNPUC4m8uNbiaqbYjJnfgXOr0zi99w+TyMlmga07l/GZRkXXcP@lists.infradead.org
X-Gm-Message-State: AOJu0YxX5m+eE/bhoGtoe1gyqZa0iLEcWa3YBR3+hshtu0xqvhica06h
	tFCZWBA0bsAfHng6eLlddvp2SbE7dAFi5BXyVOW3xFvO76/HmDsodOe3J60zKzaQELGrSUOg/Gu
	D786USlsLK4hgWueX0NrVKG9bafMAyvCPFMQbllzuK0feOLiXcEknsl8WpBHoM5HqZIAhNUtC4Z
	7JsH1mZOKN
X-Gm-Gg: AfdE7cnNc7d6WZH2mMRawee/sDuycaAmgWLzhRV/MSOaCBZVpgymIEOWRkxXCCN3Qjc
	LwrPt8yqEGjS+w7TZsCO7qRK4fgwhzdMxeHKOUM+aAmmPpqggXeU+IkChrpgD4WU03CY94S1SZY
	x8iAavVJfnfpCNzA14n3ZAD/kTks65lOhQzGw/TSDKWK55HDiNXElxIEclU+SJVmXCKFoyvsdlH
	KM18Q8qZVDo+xd1WoiAJxmR5T0XYwaq/O7juPefqwoQLAFCN9cDDImIFUNoH6i6FoGOMPxJL0Bb
	omXq5BGjmTin87aY5/d0B5kgo7kx2xjzDa2+rWp9z/T1NBsKxw3uc13C5gGv6Ten9vOZHLtqg2a
	kOPGaCFNCUCmtuQ6TyC8XSxUTcNVUuJR51mp/5DN8jOYXDAPdmwxtDA==
X-Received: by 2002:a17:90b:2cce:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38dc834255bmr15227501a91.28.1784111030652;
        Wed, 15 Jul 2026 03:23:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2cce:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38dc834255bmr15227470a91.28.1784111030171;
        Wed, 15 Jul 2026 03:23:50 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e2a06c049sm298694a91.0.2026.07.15.03.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:23:48 -0700 (PDT)
Message-ID: <33ed2078-9de0-42e8-9e3d-728e9089bc86@redhat.com>
Date: Wed, 15 Jul 2026 20:23:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: mpam: Add memory bandwidth usage (MBWU)
 documentation
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260707162440.12132-1-ben.horgan@arm.com>
 <20260707162440.12132-6-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260707162440.12132-6-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VQsd3a5NM4jnlkjdKa1FH6YtFrsVy1yCYkx1Fmv0KIM_1784111031
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_032354_321653_89646BBA 
X-CRM114-Status: GOOD (  10.96  )
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
> Memory bandwidth monitoring make uses of MBWU monitors and is now exposed
> to the user via resctrl. Add some documentation so the user knows what to
> expect.
> 
> Co-developed-by: James Morse <james.morse@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> ---
> Changes since v4:
> Add paragraph about the future.
> ---
>   Documentation/arch/arm64/mpam.rst | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


