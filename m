Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518C3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03gUTOPYMxUMcZhmVIjGAOR45IAzZBtmIXb7cPKWi+Y=; b=phee0UM3IDSnApCnhhSppS8EfW
	4bPVPrwqDHJlfXv692EPwpmxe5ojPibkwxhoIxlQE8tT3YV/oi/Fz5jTDldoCr1MeQx3eASyjA3vN
	KsylAOkT5IZZWuDoEa3MLx10Sb6YSmNptLylZGCy9FgxNaYyxPfJpao0mWQev/G4AtrOfxeU0t4CI
	KQpO/Hmx+/lCdnAEHxRw6AqRHDCOUOVZSp7RKSUaLYbz3vXawsdxndDXXXD/vtDb5AZDHKmUgz3eX
	k67pQb/84lWIVDHVAexOxnVXuxles50l5+7j9747KxhcOB7D6o52ltjymC2/5TqfYwY3TU2jA0Y2G
	4mAljK2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teueY-0000000FExl-3sxz;
	Mon, 03 Feb 2025 11:30:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teudD-0000000FEdn-2PZI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:28:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43626213fffso32611925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 03:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738582126; x=1739186926; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=03gUTOPYMxUMcZhmVIjGAOR45IAzZBtmIXb7cPKWi+Y=;
        b=jwGMefqZvIKCDOdEtY7qe3GVxzRaec+R8gyWv2uGS8gFbmrek7WSDxE3f4s7l3BWS0
         /PRFCI8s2RHC9kYktfwCHVJx/aJaX8Qotqo+5gz2hNaHYan9mY1qVvlrfLHSiTcCDzeZ
         tRIDdXMU/neczC9M5xCuag2LstKjzmPGk2dWlATJvT2603WZSZPvc8NSZqoqiC5WAksh
         6oN089r5xPsMta4BKs6gBUrJ54mEmkcuqPDplVogpb3Ufi2EI/RRPtkfLGHmpapAebI1
         qiJYm3zv36HhUouIX3QthdH/9U+oPM0YuAewqY3L+yT0cejCYWIN9VfuPglfbaokzP0m
         ED7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738582126; x=1739186926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03gUTOPYMxUMcZhmVIjGAOR45IAzZBtmIXb7cPKWi+Y=;
        b=knIhMo/TF9365KxdVrkptGc6By5rXwXhF1c5/H2arIwXirIVITEeFfgyFdvvF5km9/
         CmTT/6pktBqsp9D92f6IXPyn7FIemveYzRK7taiA5ZlS10m0HagKo6I5+qRRl06N5khK
         Bklah3b4dMpsat718taQPc8ha8GurYM7l8H3LroHS+uavpgXPFrfpb9nbCmbnd5iOnkS
         Rqilj9H7hJo+74YX9fMKBM8MDrS8pAJGsckmvvyCkFmIbMS5ZX8bSuQ6vC8lHmk+/CrC
         IVICwnQokmp4WLZTMLQDeojoCAJxTXVK6kQIAaueLIvYOuk54KtvrLe3I+B3S/GH+Del
         OYrg==
X-Gm-Message-State: AOJu0Yz1JiewxUCA+LDfXxltZZSZnMGSn0SS7xGPqlwyMK/Ive8zGJ4L
	Z9EAfJ8XCzidme0QWiY8tq09KV5e0wk8GWzEBMt1MFpofi7c1D6hO132YMVY2eI=
X-Gm-Gg: ASbGncvUq7DnAbrBZe3Vdpwl1UODJ3MwucgUc1EVrJy7VJeZoU45yQOag8/+/WVcE0r
	L/GPoUZk7TPqokIV7FRQFQ5MBG6kCv0D/JKNwJyGO47q4UVvaqvfMxHCJW49ddswhVYutQSMJoT
	JPDtFIL378QKnD6fE3rHemyIdT/349gN4Ux7iP2wa634kD2Uq6ic7UVmL3a0SKyYEtxsJW4dYP1
	+cdKD4TfrDfHAVsae3cUkFODMGBuO2sFeCGJXumIpyxtUHnZOgt4W72v4zyj+mQgzLRhFdSeiWV
	fdN1Wdp0kcwxepiioOz7iMezeQ==
X-Google-Smtp-Source: AGHT+IGzdk+Sqe63Mv9Bm/BPmdRTVGijSJCqG2+aE5exrBjEFpqR+uegx/hrDwI77yjfzrbFRZf6LQ==
X-Received: by 2002:a05:600c:1e08:b0:438:e521:1a4d with SMTP id 5b1f17b1804b1-438e52122eamr113014465e9.5.1738582126037;
        Mon, 03 Feb 2025 03:28:46 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc81911sm185351695e9.38.2025.02.03.03.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 03:28:45 -0800 (PST)
Message-ID: <4aaaa1de-ec5d-433b-96c2-3b28a8cffe7e@linaro.org>
Date: Mon, 3 Feb 2025 11:28:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 10/11] KVM: arm64: nvhe: Disable branch generation in
 nVHE guests
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-10-1c1300802385@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250202-arm-brbe-v19-v19-10-1c1300802385@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_032847_629447_6816C043 
X-CRM114-Status: GOOD (  20.97  )
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



On 03/02/2025 12:43 am, Rob Herring (Arm) wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> While BRBE can record branches within guests, the host recording
> branches in guests is not supported by perf. Therefore, BRBE needs to be
> disabled on guest entry and restored on exit.

I don't think this is strictly true. You only need a Perf session in the 
guest to records sideband events. That allows you to make sense of the 
userspace addresses, but by then you might as well record BRBE in the 
guest in the first place. See [1] for an example.

With kernel addresses it might be even easier as all you need is 
--guestvmlinux, --guestkallsyms etc and no sideband events.

[1]: 
https://lore.kernel.org/all/20220711093218.10967-25-adrian.hunter@intel.com/

> 
> For nVHE, this requires explicit handling for guests. Before
> entering a guest, save the BRBE state and disable the it. When
> returning to the host, restore the state.
> 
> For VHE, it is not necessary. We initialize
> BRBCR_EL1.{E1BRE,E0BRE}=={0,0} at boot time, and HCR_EL2.TGE==1 while
> running in the host. We configure BRBCR_EL2.{E2BRE,E0HBRE} to enable
> branch recording in the host. When entering the guest, we set
> HCR_EL2.TGE==0 which means BRBCR_EL1 is used instead of BRBCR_EL2.
> Consequently for VHE, BRBE recording is disabled at EL1 and EL0 when
> running a guest.
> 
> Should recording in guests (by the host) ever be desired, the perf ABI
> will need to be extended to distinguish guest addresses (struct
> perf_branch_entry.priv) for starters. 

There's already this which would be enough (if every entry in the branch 
buffer matches it):

   sample->cpumode == PERF_RECORD_MISC_GUEST_KERNEL
   sample->cpumode == PERF_RECORD_MISC_GUEST_USER

But I don't think we need all the extra complexity. Just let the guest 
use all of BRBE and then there isn't really a use case that's not 
supported. I assume a lot of these workflows were added for trace 
because it's not supported in guests, but I don't think that applies to 
BRBE so we can skip them and go straight to full BRBE in guest support. 
As a later change obviously, these comments are more about the commit 
message.

James


