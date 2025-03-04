Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8C6C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAefvd9tbj7LNYMHtdDRot9Yl7dRO2WNDbwoA2ZpIZQ=; b=48U5R66RkPVK/jS6/I4yxGac1H
	keKEUCQ9uJXWHDpYZ0btACdzR/JHzb11vYQuXLUGL8cwYaU8HnO68qoMt8hL/YERNVfaxuNIfaCh0
	Bi4bbO5aCnYDc8TWHrJsNg3+ftSi7OJZO6FhxJX2Lf6iqOvR3YiLwgRi8YaTlpL7gevC0BnxkwqSW
	+HNRE7waxOIxj1M4bWyrvQD6CTFaUVKuC7b1CrV6ZrVtEpe+cpn+bNRfy2pt8Nd0uqJL7LWL+ySCR
	JeLeDgFJJyVpNjTv4I3dasIJUMh/sugPj/x3g40/lbeRFarcgPfOlD//abKIor4mCl2xkXJ0UJdhO
	CqN3mqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM1I-00000003KTS-00lk;
	Tue, 04 Mar 2025 06:44:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLl7-00000003Gwl-3T9u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741069684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iAefvd9tbj7LNYMHtdDRot9Yl7dRO2WNDbwoA2ZpIZQ=;
	b=iLch63xHmsEu5A+DvPOvFeMkcbqJ8/+1UioiD4rJzw0bHgngXQPcOxQcWh9ho8LaRzvCmJ
	DDn/dx3laB8gJtyjiVDRbow+Tp9XO89x/498UO6Cwry4a10gO3qm71MHBSlwaeUGPWrh8J
	1PyQ3eSNS0OP0c3E0tmhOFLa+XDbaXQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-j1i2IlzHPvOh3lZDAD8A2g-1; Tue, 04 Mar 2025 01:27:58 -0500
X-MC-Unique: j1i2IlzHPvOh3lZDAD8A2g-1
X-Mimecast-MFC-AGG-ID: j1i2IlzHPvOh3lZDAD8A2g_1741069678
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fe9527c041so10575054a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069677; x=1741674477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAefvd9tbj7LNYMHtdDRot9Yl7dRO2WNDbwoA2ZpIZQ=;
        b=OC0/sYuksbAJKR+J9g4WLSSbXsYjeQP7xGTHZ8D26oNeixIUXAkbw8jg5LeRQRe7yh
         5KI8y8dbYClTARKyvPtPRy7XTaXXKkG3Gkxrzhy7L7VkgCPMAEVdOInP1uRBUQpsly5X
         1lwNtDZ7daMgjjwHsN4VI0u84Bx+eRnrizDYpbqfjno1nZ5QI7jc/C035TS1g4mkYTtu
         gyQJhjtUf5wcLvuWWI4Dhcjpe+NsbQv/P2zimfEVknfqPw2CCAAdO97bOOE+rqNGkuSM
         viWUi/ZLMToyoIo+f3jtUTOVBENnIx/NJYlTxXnGmwk6zkSPa/aJC6OS4TmIaGLzhEtg
         RscQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwl0DAQUxfzVrJK+lOXmMZ3AXGcGiLfnjD+DvzG4vZHpv4cLQ3w8kexngT9tFaGvXXcwrBrXwlBAc//aUSGwft@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9J8dazpSxt3cPA+v3LwKClZzr4Vbq/HFddLNwJBzgjwOx+l5l
	6ZJmv7R4Ze/mQsvEtKXZFed5RELAuEuslRCpPz5R8sM+9Ga9S7Qo0egvI9XgG8x9jkvep9LDYrq
	ZwQJ0lB07V+zPFsN8TlBQ8NqgvJDE8HZ26DVTHsHOvYrNLZrPJ2y3hx3DdshpjSlkjjhFcNeV
X-Gm-Gg: ASbGncsutjvgiW93Y6nvetTVK0UGnK5E0wBIdHEwu/UMjL4a3RcE/v8PSjffJHy8ZdZ
	SsjtRU5bKkMfE55VVg0kkkhWA/xIhLPWP7ncU2Nf7jHGQwQ+vGrcsTAXpozOv/JAgd5++y1lFxD
	WDVYjvLYxPnkJIjpgtWNGjwI0JnEJpgxDJgoqG3tZpfniyz379LT6ml32ARksnqI+WlR+P3Pojs
	nXB6W3PGJg9acobMT8KNi9xyxDK32DZbMf6YiDEqBu8f7zGgiITGnWrM10napRE/gYrSyxLckpf
	R0zVxTGDUR3Ci1rfQQ==
X-Received: by 2002:a05:6a00:230c:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-73672704d81mr1945040b3a.14.1741069677580;
        Mon, 03 Mar 2025 22:27:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMjQLRj3AUSUbMsClYXUXqxqJWhk5KrbeXBQgXSoViyrHJ8djjcdkYHY0nBVtVH5e57rXWYg==
X-Received: by 2002:a05:6a00:230c:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-73672704d81mr1945005b3a.14.1741069677191;
        Mon, 03 Mar 2025 22:27:57 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363986010asm5850843b3a.52.2025.03.03.22.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 22:27:56 -0800 (PST)
Message-ID: <780f593c-81cd-495c-8ca6-38ecd64ddb35@redhat.com>
Date: Tue, 4 Mar 2025 16:27:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 31/45] arm64: rme: Prevent Device mappings for Realms
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-32-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-32-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VBdeDquc2LY9MTEJw1T6MZ5geFauOaN4EJGEHa5_U2U_1741069678
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222805_952265_899E2882 
X-CRM114-Status: GOOD (  12.83  )
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

On 2/14/25 2:14 AM, Steven Price wrote:
> Physical device assignment is not yet supported by the RMM, so it
> doesn't make much sense to allow device mappings within the realm.
> Prevent them when the guest is a realm.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v6:
>   * Fix the check in user_mem_abort() to prevent all pages that are not
>     guest_memfd() from being mapped into the protected half of the IPA.
> Changes from v5:
>   * Also prevent accesses in user_mem_abort()
> ---
>   arch/arm64/kvm/mmu.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


