Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD484C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jGMaRN9DTvk91Wh6QyGZY6sK/KJmkltlvMirfVWYJg=; b=zCseSWJHLKqah2MNUVtgJUjpdY
	ZI10tw8tKBuXU9bIkmw4xycf+Z8dZBdZ/D7BcX4YJ7cL3NSLH064NTKaHRgK6ZBIDgqkjv8EPi9x8
	w4sHR3lcPamNwq/7PEiqSiaLgsdVSWMBSJiYWuoZ44imqeVJ8v5W81rO8+p5Rxy12Zj6nZfrFCrdh
	htPFc61WD+Ha+NQiEh9EMgyLkE1BNSW6P8eare/pd5lsCf+T8sizs3GlHwV0KrF4RzN3DOFAWD+/V
	Ni5l3VzShwzDSn38oQsYs0PgH4FkeBZ2froA0TzK67kQeIchpUhzljcq2fHYIabrO0JUefwwPmOfB
	duNmo73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHltv-0000000GOlg-1awt;
	Wed, 21 May 2025 16:02:39 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlq9-0000000GNzP-3zct
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 15:58:47 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so56257125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747843124; x=1748447924; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7jGMaRN9DTvk91Wh6QyGZY6sK/KJmkltlvMirfVWYJg=;
        b=RwYRmAL1TLJTNnbkYvBDOFkiAJDETCd+OF/V6RCBLdpBJ0PNrvZxFcP3dxZL88s7Vi
         n1F3mRoUz5Uo2pfAzXHVylIjVh32juT/5wKSCeixS0tHBbpC5Zsyl8u7Ex3DbKrjgETC
         UhSWnG0Hbfc/2yDz9rpXe7Pz6GwydOEIyoVxbIUi2lFQYlvx6RIeRxDr14rySbLWJNTq
         Kjqaqd/wbj5aI0sjVFcyHA3GQSKj0LBrOTkk/49pqREgEHKXuwtOXTM/Y+32z64TXkO4
         WjJppf+wUEVfqNN4aLD8GX27j1v/qSnX6xWK//xHRSd4n8BEUvrOu2W7SFCWd080Gi0x
         PSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843124; x=1748447924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jGMaRN9DTvk91Wh6QyGZY6sK/KJmkltlvMirfVWYJg=;
        b=i1tgEe7cvUTN3ka/2TT75VQC2c4cpveYbfsGAOCqeLFBBhlBfELNTvzME348nQQdcK
         r8LcGxyjjpN0ht/EOazVKt/2kUJErecEpLO6+VRx9xLdEl5Tg5d93HVcKabqni4eljrC
         dS4cS6h0nbXw7yF9a9o8zTP/unLz0OaQmfmXKRJ0PcqAsFwYaEL1BfTU1dX3uWg+Zjq6
         GcoQaacvgEJs4zHBbILQFLAamvIuT+LuMyC/3mqI7c2WA6hOk/NhoiYkF08samh1FhB9
         2W8Hy6man7Hu7XY9kExYkpeKJkLjsOrig+MrISBviHsOlHnXl2HpmybVUeBnbsHgj0NB
         GVHA==
X-Forwarded-Encrypted: i=1; AJvYcCUVIq3IguiCQ7k5gCn11QUIBNIMsItMMvLWBS9aeBMSkZdFE6aeSkX/FPuA5Jm6A8VviRLT0U/cZqoRX1vanw4M@lists.infradead.org
X-Gm-Message-State: AOJu0YwOlWk9KHN4YPF2wITFgWVBc8EmR6vErGT2NIWk2jQ++LKnQ2he
	d2LuEP4EDdwpUSY3GpbO++4v+BwwlyKJCcSDk/KLj9qPbNhL2BUk44sgqph+QulGKWs=
X-Gm-Gg: ASbGnctzgverSu+BJHGI/tn2DGdhVGybyKiJi+OY2vzER7CoVODgoT628TpKws3AxPx
	FHY6X3Sw10EWEApJ+8PLqymSkRKv1eMFjsHImDCnW8zb0Jmw9nwEDaVcgsPhyHKzUFUQIDCfqJT
	dA92yFHEcRp4gwia+X6edu8lOj7ygPgO0GUFQBqmCulWjE55n8KAj6M83O+uGY+IPlyZSDDaOut
	hM/tJkmXFKwkWGAfNxS4hdCKoAewZE1CoJ6fxdG0yf5CcECpfKcJewhn20VYu1xYFdh/UFNcEGF
	4zjBSo0TGqAWCSqUptAs91+6Q4uyVnDXgg7fmtBg6AwhJKqxMumMcTEQOXfj9fWtouI=
X-Google-Smtp-Source: AGHT+IE94Qc/sbvf18GBZCQv3ZQ8s8ZqdtBvtnfrv3gSKGcbnewhx8YlU5QP8S7QSIUDnlJDrBopzQ==
X-Received: by 2002:a05:600c:34c4:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442fd6752e7mr217340645e9.27.1747843124389;
        Wed, 21 May 2025 08:58:44 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d2ddsm19933864f8f.7.2025.05.21.08.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:58:44 -0700 (PDT)
Message-ID: <119c9a70-6ea8-46f0-b877-8a433d97ce84@linaro.org>
Date: Wed, 21 May 2025 16:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 4/4] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
 <20250407-arm-brbe-v19-v21-4-ff187ff6c928@kernel.org>
 <20250519150621.GA17177@willie-the-truck>
 <20250519215651.GB2650608-robh@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250519215651.GB2650608-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_085846_016798_788E48BC 
X-CRM114-Status: GOOD (  18.65  )
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



On 19/05/2025 10:56 pm, Rob Herring wrote:
> On Mon, May 19, 2025 at 04:06:22PM +0100, Will Deacon wrote:
>> Hey Rob,
>>
>> On Mon, Apr 07, 2025 at 12:41:33PM -0500, Rob Herring (Arm) wrote:
>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>
>>> The ARMv9.2 architecture introduces the optional Branch Record Buffer
>>> Extension (BRBE), which records information about branches as they are
>>> executed into set of branch record registers. BRBE is similar to x86's
>>> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
>>> (BHRB).
>>
>> Since you picked this up from v19, the driver has changed considerably
>> and I presume you will be continuing to extend it in future as the
>> architecture progresses. Perhaps having you listed as Author (and
>> crucially, in git blame :p) with Anshuman as a Co-developed-by: would be
>> more appropriate?
> 
> Shrug.
> 
>>> ---
>>>   drivers/perf/Kconfig         |  11 +
>>>   drivers/perf/Makefile        |   1 +
>>>   drivers/perf/arm_brbe.c      | 802 +++++++++++++++++++++++++++++++++++++++++++
>>>   drivers/perf/arm_brbe.h      |  47 +++
>>>   drivers/perf/arm_pmu.c       |  15 +-
>>>   drivers/perf/arm_pmuv3.c     | 129 ++++++-
>>>   include/linux/perf/arm_pmu.h |   8 +
>>>   7 files changed, 1006 insertions(+), 7 deletions(-)
>>
>> Do you know if James Clark's tests [1] are going to be respun for the
>> perf tool? It would be handy to have some way to test this new
>> functionality.
> 
> Yes. I dropped them here because I've been told by Arnaldo in the past
> to send userspace stuff separately.
> 

That version of the test was out of date so I've pushed the new version 
here: 
https://git.linaro.org/plugins/gitiles/people/james.clark/linux.git/+/16e4a18c2d5fc53736f05c9052b1d11d74909707

But I'll wait for the driver changes to be finalised before posting it. 
Or Rob can take it back into the patchset.


