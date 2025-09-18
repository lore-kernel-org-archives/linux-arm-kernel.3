Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4893CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAxT3fVcqeuUfVjtRTsWYQE3cdG0LYpzTMO+2TQXp/o=; b=bSfJYJkqnTAbO16V2TPVkr0rIZ
	oSRWXCrhUaJ+6RCNufydi9IMNQPuXo6RKzxUq+Sycuo2PaBRZ45IUo3VbYhHCe7Fa2X+TKbrAIgyF
	dPNjqnszQUhALvESlTlCR0fZYkThWu1exkh9VEPTiHOx8nu1uFvV3az3/tTAz7kW0h+HbC3Yby6aY
	nfMYLcljy+4kzxTPPDJXYF1N5dr9F7JGuU5mjRjJgCDAwCxeNnUTUabuGBEiJgPeiBMJpkb6bfnHY
	vvv273MlHtNTcS1nkGfqZWxvhRaxD5fy/J9MYyphH/iCo2z0JU17gBfpWrd9Nzp5eUDwOmzgjgXoa
	Q8TySltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFvh-00000000CPN-2lMJ;
	Thu, 18 Sep 2025 14:48:13 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFvf-00000000CNf-0Wzw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:48:12 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-361f9d329c9so364221fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 07:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758206889; x=1758811689; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iAxT3fVcqeuUfVjtRTsWYQE3cdG0LYpzTMO+2TQXp/o=;
        b=h77aj1scUX/DUqAxgJajKoubNllvTYlJ/eJwIk1e/aCKg8Rx5W1nwtJxTyELIxfM5u
         NW1ptYM/mfcjMbYgARMr5P2XDXbHvD/s6PrEJQQzAsM+vK6dHxiG3/7X5sE1CPxJ3YxH
         wlTETYGuYFiheWMclX5EhrtD+mUIQubTjoJOfCIup09BhPVlpkuV1/G6QiUD2k191U13
         9i/Nomc3wYy/S7GU8SEVUuh6DQhfQ6Fd3S6ZSFV6cmUY5B59HPgMOjFomjCqTAeeVDpE
         uQu+tAPINYm4FPv4DSsEcZGu/KttapWuFX0s/ThIvi8Qm4vce3XRMgzYqwj3xgLJxD/G
         XEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758206889; x=1758811689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAxT3fVcqeuUfVjtRTsWYQE3cdG0LYpzTMO+2TQXp/o=;
        b=pnW/dwMEzoJj1Bg3+PPcjcPKOPSN5I8xU4IbySU6hYfwqSIpfVd2voIi9DiH3F47hk
         OBSyTjnvyCCIJWn6oo27/MiHqGviYS22hvi7hkvNMQMo01u4+yAOTGh4dXuZFktsoV7i
         YUvXnB1lvWtXolAMey5YOq1Pdjs75V0RR4ttAFH4RCsr0fHIJgQXGUtxpcDrL6i1eKbt
         h7XcWzHIa4WDncn+7/Imln/bc4jVhlXR8pYsWjci2WSCyr5XDdVxSsVFci/S9CXCaOx7
         YprEkkHsTuYY2NtOHWsEAUqej6FpgDrZOQ1cmG5WhUj+wC8z3yp6lKcSyoZaLWJwUukl
         uKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4+8a+aMw/7OKKqyx3Co1ctq/xuPO1h114k8J4T+F6e2M6beJgwT7b/5gQdUMZi1ajeQKGGZuJXBzMjFgXaaXb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd3Uux2hokcuI+l3ZdTwslPA6QTF27n/2Xk3QBpmdxhPB8PbdH
	fcaNtPZQtLYK0nE6/TADZdkST0nXzfdcPrVTsDQtIK/XcLtpr5zhCLMT
X-Gm-Gg: ASbGncs5X8UA7casHnCTG91Y+gMdDWgfnDFp5d+SROc4KfZ6DtNJBUdD4JRPffLsmaL
	nPeK+w/5Nzy01pIXeyXhS4kwkBq2ANS8cJ0Egohhph7QmcCGvWqkDYYS3i5RsTNzFms5y/lNjjx
	MTZxGxzKwSq3+fTD3/NcRf+OvDx/tsB/91seDD93QJUMOeamkNaSkQQiE1aSJG3OgFkMMeURznR
	obnYzsUV2wDihKa4ETuQrJkkQNM4vWJAcCEGP4bJ+bDloPBh5ENJd1IxkcHsfxYK/A2YCXYONbG
	c4ASb80ElFy5wFWPVHciraIZhkzYeiROFsB8Cr4sGsxTczHrfsDw+k6UUGkl4cRe7DT83U4zFC5
	odV6Oaa8RkqGwbvtNT215/eGYlMU6ByiGoegCala9Co+5M58VDrvVj/SH0A==
X-Google-Smtp-Source: AGHT+IGHEzqw59r0e8igL1+CPPVfjvLXVyO+/F/7yKLyQTtxPDFzXxzv7jI8gfftK+xRhHpq+exTSA==
X-Received: by 2002:a2e:b8c5:0:b0:356:25da:89eb with SMTP id 38308e7fff4ca-35f64fef9cfmr8254611fa.4.1758206888768;
        Thu, 18 Sep 2025 07:48:08 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a1e07947sm6404731fa.12.2025.09.18.07.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:48:08 -0700 (PDT)
Message-ID: <9f332ea7-4210-42f8-b640-3135cdd808be@gmail.com>
Date: Thu, 18 Sep 2025 16:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] kasan: apply write-only mode in kasan kunit
 testcases
To: Yeoreum Yun <yeoreum.yun@arm.com>, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org,
 akpm@linux-foundation.org, scott@os.amperecomputing.com,
 jhubbard@nvidia.com, pankaj.gupta@amd.com, leitao@debian.org,
 kaleshsingh@google.com, maz@kernel.org, broonie@kernel.org,
 oliver.upton@linux.dev, james.morse@arm.com, ardb@kernel.org,
 hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
 yang@os.amperecomputing.com
Cc: kasan-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
References: <20250916222755.466009-1-yeoreum.yun@arm.com>
 <20250916222755.466009-3-yeoreum.yun@arm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250916222755.466009-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_074811_189447_9BAA9B3C 
X-CRM114-Status: GOOD (  12.56  )
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



On 9/17/25 12:27 AM, Yeoreum Yun wrote:
> When KASAN is configured in write-only mode,
> fetch/load operations do not trigger tag check faults.
> 
> As a result, the outcome of some test cases may differ
> compared to when KASAN is configured without write-only mode.
> 
> Therefore, by modifying pre-exist testcases
> check the write only makes tag check fault (TCF) where
> writing is perform in "allocated memory" but tag is invalid
> (i.e) redzone write in atomic_set() testcases.
> Otherwise check the invalid fetch/read doesn't generate TCF.
> 
> Also, skip some testcases affected by initial value
> (i.e) atomic_cmpxchg() testcase maybe successd if
> it passes valid atomic_t address and invalid oldaval address.
> In this case, if invalid atomic_t doesn't have the same oldval,
> it won't trigger write operation so the test will pass.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> ---

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>


