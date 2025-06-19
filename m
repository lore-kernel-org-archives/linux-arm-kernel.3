Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABECC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnOhBasCiJjIhYRxZYUdwPDMPuwY0WvKyYdO2+gnZTM=; b=2wBs+EWD2sOC/ZYL0fN+PwDXT1
	CfK6TaCxrGkWVIs+DFTtu7SdT441Rv6GUdC1UFozu6MfW3VtkUykpDIEzKcetd0OCqFxQSZSzXSdN
	xJRqhdoPoKANuGE/EvVRoYKbNmASlu5oBTjSmcyqXsl451kC7ExI6ieF4X1820tGqqvWBvkedrEJo
	Q1EfYtsmuSVZPlfK+npddz1wmbFPA9JpICHZgLXRIjKTwK1yxbT1tSlJVgWCO4xgwJtqHpqZ4+mnI
	T+AAfnmPrlJ4XMZD7v22zaxUPflvv8smNxa+N0at4A1hi8DjNDuM/BkNo/6kh3UFyO8LwnMz7iMEm
	cL1KyLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLH8-0000000E8bJ-2nyU;
	Thu, 19 Jun 2025 19:50:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHl0-0000000Db7o-2Rpk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 16:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750349091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnOhBasCiJjIhYRxZYUdwPDMPuwY0WvKyYdO2+gnZTM=;
	b=JUmIcbm2jf4dkI0/9tYktlpw99OoBf5WaE2Qil4to9sIlM2jrWbFzQ/zZvK3ySAn8jQKAd
	a4fzomU4ZDLJar1/7ydwAywPhors2Svo8jopawpCniTqdDFzQhyKUophrjh1xLTzp3bqMu
	pp3MkN3/e/3ajdmNJ4mQeF0BLTdb8Hw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-S1ObpBUmM3mXoVua77xIRw-1; Thu, 19 Jun 2025 12:04:50 -0400
X-MC-Unique: S1ObpBUmM3mXoVua77xIRw-1
X-Mimecast-MFC-AGG-ID: S1ObpBUmM3mXoVua77xIRw_1750349090
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f6b829cfso8951565ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 09:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750349090; x=1750953890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnOhBasCiJjIhYRxZYUdwPDMPuwY0WvKyYdO2+gnZTM=;
        b=GR6SAYN2yyQXE442UgZN1FVvJ2/VWDD4VYquC+rpVd0oYCidePNRjPBBnYek4mzmZR
         Dg8Tkj7UtgocgTgDdGmLqhpPLFh3Jptg+skoLizvyqlYUCsXT42ZWcp61dQdmwmwFE/b
         AJ6b6ZBvLvqLZKrVwYkJ554aoCJ4vg3HGYpOIe95dttJngEEpf2TL5EJ7i7uwgcyF6aA
         4pH3uRjE3nXdTX5zQUTau6jU5cllZx8oJ6EzrX36IGtmiDF1YRNDjGGX7sGHjS/WD2Yo
         D58Cn2eG0ZEvCyx0SUkGTlomMhX1MmVSwIEdHexLrmtn8GQkr3VKdXSNr1IsYzUAXkkk
         xnMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOBS6NaUWzE6r/6NDtygHWCZM3dxoSNR9+XDMIRBpwtsMWjnrrj7L4Ptp3NQB583+XFsPU4Cc6nHHxRjldOENr@lists.infradead.org
X-Gm-Message-State: AOJu0YwJvYWph5CcfVdLvOjFfz7orl+3tFn0sjJDUME8VB4VRjlo3Hwx
	0Ei2AD0+eiXs7RPy5HxtNCQRhp0KtRbIQVT5naZL0whXH2UN58QmXuJh3Q6ZoIcBAQLuJPV66b1
	FHMmhUOjJjOePST2ppr/xOgs2yQiQ1i1ER95x0WXwQkKCMgNvO9XgT1rpPQFhwlVYj80+K6Hrzq
	v3
X-Gm-Gg: ASbGncuQGGSNMsW/g9GRP50+tSa7zFKEe9xwM1evJ+J4l5OPnX5QQR9GV0f9v9CKzwv
	pBX7OF7N5GQGn7yWfEa8vHB6XgC6PzWYBiGAZfRQ068BDijR75jfyK8iz9Vz1zkWaGoqrnDggOD
	2NOj8pCxUuLMhY0inekGEoYrgF3Q9eKAiStwxDdKdaUc5mjVglq3UlIhnwIZPZqss4lvYh7fVyp
	riXyBjin7zCPIejmUsPHRLQUrOMKF/9XENXIbOwl94wzaWkNGHJJC+5EhROohu287e2swe8W/71
	SEUxoUOnF6vv6QJADrN8FBo=
X-Received: by 2002:a17:902:ecce:b0:22f:b6d6:2737 with SMTP id d9443c01a7336-2366b32e726mr380406455ad.10.1750349089756;
        Thu, 19 Jun 2025 09:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjJXAklTpU4bxpt+jnWBfHNJB4kATINyoW2fUcIAggJV9+NymIlKk9BuBUHb5XP9WcmOt80w==
X-Received: by 2002:a17:902:ecce:b0:22f:b6d6:2737 with SMTP id d9443c01a7336-2366b32e726mr380403205ad.10.1750349087399;
        Thu, 19 Jun 2025 09:04:47 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca379sm121411835ad.210.2025.06.19.09.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 09:04:46 -0700 (PDT)
Message-ID: <18151eb8-60ec-438b-b9fb-026efc8b848d@redhat.com>
Date: Thu, 19 Jun 2025 12:03:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
To: Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "will@kernel.org" <will@kernel.org>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "david@redhat.com" <david@redhat.com>, "seanjc@google.com"
 <seanjc@google.com>, Aniket Agashe <aniketa@nvidia.com>,
 Neo Jia <cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Krishnakant Jaju <kjaju@nvidia.com>,
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
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>
References: <20250618065541.50049-1-ankita@nvidia.com>
 <20250618065541.50049-5-ankita@nvidia.com> <aFLqiAyXZLoOTepi@arm.com>
 <20250618163836.GA1629589@nvidia.com>
 <SA1PR12MB7199835E63E1EF48C7C7638DB07DA@SA1PR12MB7199.namprd12.prod.outlook.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <SA1PR12MB7199835E63E1EF48C7C7638DB07DA@SA1PR12MB7199.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gDM5V-ub24gnJ5_4fb4X80aGgKyAEipgPcHbXUm-hVc_1750349090
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_090454_698874_365A68DB 
X-CRM114-Status: GOOD (  10.19  )
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



On 6/19/25 8:14 AM, Ankit Agrawal wrote:
> Considering the feedback, I think we may do the following here: 
> 1. Rename the device variable to S2_noncacheable to represent if the S2 is going to be marked non cacheable. Otherwise S2 will be mapped NORMAL. 
> 2. Detect what PFN has to be marked S2_noncacheable. If a PFN is not in the kernel map, mark as S2 except for PFNMAP + VMA cacheable.
   Q: 'mark as S2 except'... should be 'mark as S2_noncacheable' ?
  
> 3. Prohibit cacheable PFNMAP if hardware doesn't support FWB and CACHE DIC. 
> 4. Prohibit S2 non cached mapping for cacheable VMA for all cases, whether pre-FWB hardware or not.


