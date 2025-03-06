Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CFAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ib6uvD1UOSB7iCE+uK87YhdmFx4Z1+LHRHqLNKyZf3U=; b=U+FrsE5r3Q+FwdBwEp0+Dd6n9v
	IVjsY6Gqjtew4Mlv6Kucmehx/xiyEbS7OyIEY9Z7qSWNhbWw06PMkQipuMPfLYH/hifLnrWyTl7Q0
	tvkM5e2zOxmHYG/ZvR7vca+aoYY0p0B0PBtPAtPpqXGNqzPHA2t3IZfbEZIIrjghU+PtrmWiePtaL
	3LH9IKxKgnGqyMj7mRL6tV3XYjWVQGK3X52718Xy/IBaUfsX3cQenGcBEDk7AxmAqksxRiC6BP+pl
	vqfMAAnT3OAtqDrqJ5dWe/KxL4NUnRZ0/wCp6Ck5zGn9Us0ixv27j6Zv3SCX4yPRmTgqzpcDCNGiu
	heP/NHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8me-0000000Agi2-3lu4;
	Thu, 06 Mar 2025 10:48:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7nK-0000000AWh4-31Ru
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 09:45:35 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43bc31227ecso2352405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 01:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741254333; x=1741859133; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ib6uvD1UOSB7iCE+uK87YhdmFx4Z1+LHRHqLNKyZf3U=;
        b=PFATJkhcZxoUgNYheU2o8VrFuM8mpuGswQJ1faY7c/k6hvwoNxaF8JkLvBJTMmh+4j
         uE44I8HRrc1wRLeqP0huiiPEEKHlce24pTE82lxpsV97igZ+CfaUraZAht5pjWXRmoPB
         FgTFUjorr19jEzqRvQCvOTPb8x6BxKmfPYxm80EdypEwQYFfBmxPrGZDHmyRbZAOG3ck
         JqWVWsV2bpJih9U+FhKF48nKZWwLGY8p72KXeQAGUrhvRKDHMTSNCOXKC4/wAZtBjuiJ
         BEQpEua4QSEYhNwv2RaNql104VzwB5UBzj6LWQw1cPyjQ5qyPGMPIqvWEDfswJSkGNE4
         B2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254333; x=1741859133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ib6uvD1UOSB7iCE+uK87YhdmFx4Z1+LHRHqLNKyZf3U=;
        b=qKX3K/WfZcvDsEqVa2A5bVx98Bj0c59Gnbp6w1epfTnwD7c1piwCIIkKsn2RWnAGLY
         05qQTmPDtkVOmxn1WCdrnVqXEzjLsL5sGKtscflc/ltqol2fk9XMLwvuGPOB6QBF4my8
         ACvG70/j5E7RyNaQ0bsyFf2dprhgq97NzC8sFdghi6vM57K+ghNxCcsJjSssPIiwbqbP
         EKft4rRRfc1uRNGYHY3vLAOqoguWRGT9d9QO9+wcXD51C8cqmWG5Xgr8WWA7j7BLuVXm
         LJFtwbhKMd5bBOydOlI9zUlxemIInG39pDY62wb6Q41IIgDeJx/+nWoP2FflNeWjQQDB
         NTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7SJR4rhrJLIPxnperSDVpkSMrGDi47+0XiRhHOkWkZX7UNaMVOIXtK7y2CU70ZC5QeM7njY/fhgEumgagf+D4@lists.infradead.org
X-Gm-Message-State: AOJu0YwFyazTG6lk7dE+/sfA34pX5dffI3uihrBOmn1+Eg7r5pURoOhf
	no/3gFLZUg2IQoqBWpsR+G2WipXKYfZdnrwuKzj3NlKGHujgcVCChrPl98VBMEw=
X-Gm-Gg: ASbGncsOWX2/4bjSdv0e19SKeKRwTOFZ+BKUZJzmXK6Y6EwMNtvUCE8uzUkzsvHRkwe
	g0A86JwwCPVrrB5lvxda/TVUYlDsmNuExK9ptoa0R79JjbAa4eYbIz152CfcFUzFVHuT0U8+J/D
	6j8z4gP4+zkMYND3ElrHBg6eqgyupF4ylMmmmOKf3hwid9a+ltClIxQdUaONEhqSF6Q2nD9xCpF
	qqiwRGtVg1LinSRMLS3WWLlj8vmz4+he4RLpD+r+K43TZv4hID8VUBOIO6R07x+zEyEXgv21RA7
	CrFkdTgvgy55QSc6PfaKUlXY0a5mHZnrsEb008iOYy78cA7nq+Iw8g==
X-Google-Smtp-Source: AGHT+IGKKY+W5AegUXBiD0ygLeBmuUSupCHLoSK0LTRbSaruyo4vSjRj8N2aVNPCWrxf/uCOb1/Erw==
X-Received: by 2002:a05:600c:3506:b0:434:fb65:ebbb with SMTP id 5b1f17b1804b1-43bd298f535mr50704515e9.17.1741254331601;
        Thu, 06 Mar 2025 01:45:31 -0800 (PST)
Received: from [192.168.1.247] ([145.224.67.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4353003sm46516085e9.28.2025.03.06.01.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:45:31 -0800 (PST)
Message-ID: <4484f7e8-e3c5-4488-9b1c-40d9c7124ecd@linaro.org>
Date: Thu, 6 Mar 2025 09:45:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] perf/arm_cspmu: Move register definitons to header
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc: mark.rutland@arm.com, bwicaksono@nvidia.com,
 ilkka@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org
References: <cover.1741190362.git.robin.murphy@arm.com>
 <5a3c796560665b51cb63fec0d473afd8f8d0a836.1741190362.git.robin.murphy@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <5a3c796560665b51cb63fec0d473afd8f8d0a836.1741190362.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_014534_761899_F5571F28 
X-CRM114-Status: UNSURE (   7.41  )
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



On 05/03/2025 4:10 pm, Robin Murphy wrote:
> Implementations may occasionally want to refer to register offsets, so
> for the sake of consistency move all of the register definitions to join
> the PMIIDR fields in the private header where they can be shared. As an
> example nicety, we can then define Ampere's imp-def filters in terms of
> the architectural PMIMPDEF range rather than open-coded offsets.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---

Reviewed-by: James Clark <james.clark@linaro.org>


