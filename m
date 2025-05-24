Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F0FC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 02:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQHeLaYHvKxF+GHtQN6xMn9GC9P8oUvc+3z8s3Wst4A=; b=Ip/lxaDChFmruBZRvAeTAz0sP/
	7bDUZkd3By9ZM0NJDYCgMpB5qw55aAfELW+aeFtSBu0z38oUondWoYhVlcNy5zSyWykjtHSbcS/J1
	Hn6BuIue3AmYCeTfTanACREXx6bzYFFlj97fJLDsYkuHaQ1KFk6stmhMGBcWqWW7LBP7WHQlh8DEN
	gHD4RraqkXY4hH5dEvL67dCmhgTQF5QEbpw5LYoskijCIkzVbArpu0JSrD5AqiREiyJC1g7d7AItV
	UZRM0qRBLIx5dfsnv7d3J0hgd5wTuna9VBZ0YoMIMGc4WGxtVej0Apf/mq7bDXV+t5NOBcfc3if3T
	5iFCgwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIep5-00000005E1w-0qHh;
	Sat, 24 May 2025 02:41:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIems-00000005DwR-2biD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 02:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748054341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQHeLaYHvKxF+GHtQN6xMn9GC9P8oUvc+3z8s3Wst4A=;
	b=NVTaWFJra2J1MPGZpuxQz+NPBwrlXUiXwA7zsIv/CX2bDmVoeIGEU8vRjf5xsqXV5G2HD2
	iucK/P4ezRc+gfxTRISfukErX/tKBwYZiRKq284dx3ISOeaE/H9r153Qy+ngqtEPaysCja
	6/XY220XVMzKZDlxNTOivWKgc5KCHVA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-hxkF14cJNHSQx7kbg-RXJw-1; Fri, 23 May 2025 22:38:59 -0400
X-MC-Unique: hxkF14cJNHSQx7kbg-RXJw-1
X-Mimecast-MFC-AGG-ID: hxkF14cJNHSQx7kbg-RXJw_1748054339
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7ceb5b5140eso78604385a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 19:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748054339; x=1748659139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQHeLaYHvKxF+GHtQN6xMn9GC9P8oUvc+3z8s3Wst4A=;
        b=CjFb+FV8HdTX5tz12pA5SE2dMKlaKiIGtvojsPQAB9PD7E9fDb76JzZG9ZY1w08eLi
         N9DTIs5Jbn9fSQ13hMoCo9KGnIFg4ws40sL/+fVnRb/H7c13UCbtARxDC3Rud0y3B4ne
         1CQNAbVLtVMRF5rORBR3WkI5yjro1HriJxdunVzWoUU1zN/5paX08dIWgken9or9LQaj
         nLrU9rRhruiZLwXMdXlssBacvjbP04BoZpB1+m4GC0ytfiHYn8RKeMylrhNpe58YNR+e
         +qxadP8Q5QFu8DwlxjVnT6mHcFVhiGMRT2D8JA7iQlk1BUuUl9+B56u0FsAJlqbAvge/
         LR9A==
X-Forwarded-Encrypted: i=1; AJvYcCUJTGQp1ATYZF/ywnlaWw0PM11EVJruD7sF4R6HSK5KsYTrhPnsXZnkC3/ooFb98rlo2qMkWl4e1qK9w2O/reJX@lists.infradead.org
X-Gm-Message-State: AOJu0YzAgjFBKsW/CHAs7sIgOytTmRxRQSRJMgQLBhtEuWrvnezMZIRT
	niQeiK4K1fTelAG/s4ltLGp5iaj/W+BJqd7YPlNH7dzX6Y2r9xjjxMccWkc7RY1r9mLD9zO2i4r
	LmhVYGyMZ13Mmjopdqh11VGXXzc13r8R2z5xd+3mmQca9JUjn8y6lVgMzz/Orv1r57ALNaRz4d8
	Z0
X-Gm-Gg: ASbGncuWgMEq6OuUMtxIdWerh5avtUulF8FrECyDIlNejB8v+cpolKQSRjq3t0qdvSo
	nxL5+OtrnzhomZtPIJIvugngNT1pgeU3CDCODUGPW4eeVwmAi5s2kHrkDxhI8IMiqW2pmnFf4jg
	BU76iI0SqqiSrtn/GGvW12Ualif07jVFowSmstJPqq3a1q5jCiyEEFZ7VyP1uQ3PxlSnsfoVRn7
	QoYhuTyVp/OmlKce4ZdzeTfLgT4/iQcF4SiyN45tF0ybT8/7M6Ct2FtORuE9n+ie+SrRDGCIe6U
	TzZEFuZPSqxs
X-Received: by 2002:a05:620a:1d0d:b0:7ca:c9cb:ab1 with SMTP id af79cd13be357-7ceecbbd282mr229955085a.7.1748054339362;
        Fri, 23 May 2025 19:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErmUUHEKNy3Y7AV9txFdGa7R9r1caA7oXdVsktniXZg9N1+JC4HDh8WDXEKjBXaAJ0HK1AXg==
X-Received: by 2002:a05:620a:1d0d:b0:7ca:c9cb:ab1 with SMTP id af79cd13be357-7ceecbbd282mr229952285a.7.1748054339037;
        Fri, 23 May 2025 19:38:59 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ef2fbsm1271523485a.59.2025.05.23.19.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 19:38:58 -0700 (PDT)
Message-ID: <12136dc2-41c2-45f4-b1f0-cd9d2e853e76@redhat.com>
Date: Fri, 23 May 2025 22:38:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: New function to determine hardware
 cache management support
To: Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "david@redhat.com" <david@redhat.com>
Cc: Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <danw@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>,
 Dheeraj Nigam <dnigam@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "sebastianene@google.com" <sebastianene@google.com>,
 "coltonlewis@google.com" <coltonlewis@google.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>, "ardb@kernel.org"
 <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "tabba@google.com" <tabba@google.com>,
 "qperret@google.com" <qperret@google.com>,
 "seanjc@google.com" <seanjc@google.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>
References: <20250523154445.3779-1-ankita@nvidia.com>
 <20250523154445.3779-3-ankita@nvidia.com>
 <9ffc7686-0dc0-4978-8cd8-f12a1c148b63@redhat.com>
 <9b429da4-8db6-407e-9721-178e01fd1ebb@redhat.com>
 <SA1PR12MB719939317BA885F8CD3DF970B09BA@SA1PR12MB7199.namprd12.prod.outlook.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <SA1PR12MB719939317BA885F8CD3DF970B09BA@SA1PR12MB7199.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QMAu3gG9U2SzyMoATSo-4RlMtsUbjwbAvTt8yXX9cVM_1748054339
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_193902_749656_7CA88F64 
X-CRM114-Status: GOOD (  10.77  )
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



On 5/23/25 9:41 PM, Ankit Agrawal wrote:
>>>> +/* hardware support cache management */
>>>> +bool kvm_arch_supports_cacheable_pfnmap(void);
>>> Won't this cause a build warning on non-ARM builds, b/c there is no
>>> resolution of this function for the other arch's?
>>> Need #ifdef or default-rtn-0 function for arch's that don't have this function?
>>>
>>
>> ah, I see you have the weak function in patch 5/5.
>> But I think you have to move that hunk to this patch, so a bisect won't cause
>> a build warning (or failure, depending on how a distro sets -W in its builds).
> 
> Thanks Donald for catching that. Fixed in v6.
> 
Thanks for fixing the nit.


