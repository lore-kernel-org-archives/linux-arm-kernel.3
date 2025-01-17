Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81C0C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RDMY+65UFDdSOlQmyBvvEbMu1oS+daUhpKHh3ifXvQ=; b=X6dqA2cnVL+Of0xID4L9l306hp
	hLIzZSNMdkC6MmExckX0/9bH3pyOTkieGWcK11VEROggCSPCAZqoCdx78HdZKD32ojjPzHkRa6hR8
	ec/U1DFN0IGRRBFVS3XsIorfsJBIoRLqC6ELYcsII+qSmLaCJKgiue5P8mtejiDj8X6+6fm8HDSXh
	lSIQL+XOJ0eY8ibxXxr3PrFsY0K4WOAYw3jaQI3jJUitqShH5T+g5R33iqLyioVWCxSBrbY+3yLzC
	lERD63FxEOz36ZMf2GJhO4aiEAYi8ZDOuvjSLHqJhEId1VvEYPlcMaB6bKITTsC5Nbxsa0OZa/5Iq
	ObMaZxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpqM-00000000uNw-2U5R;
	Fri, 17 Jan 2025 17:09:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpgB-00000000sak-3Oxs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737133121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3RDMY+65UFDdSOlQmyBvvEbMu1oS+daUhpKHh3ifXvQ=;
	b=ZfAqRQBn2rVpvY1+LLMKbvHprPL83f2z0nMHKeScsZvmlEdn1geMD6WWWlli5csJ6EDjW7
	29iNngnjD4+1oz64ftKuYTvo96ngD/hQ3eVsQUAsxdk6v7Na/pYT30reP+VdpMrcevT1fZ
	dOxaJ2nI9EIqQuJ+70Lo7KtPem7bUk4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-dvE5riwONjK6NVvnqcjBpg-1; Fri, 17 Jan 2025 11:58:38 -0500
X-MC-Unique: dvE5riwONjK6NVvnqcjBpg-1
X-Mimecast-MFC-AGG-ID: dvE5riwONjK6NVvnqcjBpg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4388eee7073so8656865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 08:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133117; x=1737737917;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3RDMY+65UFDdSOlQmyBvvEbMu1oS+daUhpKHh3ifXvQ=;
        b=abq4ItbbWS9QxIfkHgYBiNWyZxlQeDpwoNbj0H6cB89+/LTx9W4MhZOTkeqVogx+g8
         lE6M5rOSpPiUEfJpvNYEmOnZI5lTaX533PELok1XLFeorLM4Dll7ZSPaFpqyk3oDw+ph
         FPxTlUihoxp8ejf4MbZWQrFWjah9HfwG/0eBjpGlQ/Mq9rs82fzeRkFaHcnn8vHWR/ou
         0QPKr9evJkyMK95si6aNtg54aKsTkcw++Vaip3WNBZK3whUX4/C2Ao/QAN/LHra0cvhN
         eUDN82Qqi70DMghNF5879m4pQxI5gW+DwhK818xF9OK578F52K0r+tHcfiX3DYd6Jx8e
         egCg==
X-Forwarded-Encrypted: i=1; AJvYcCXdnngfUFw8Y3sNw4BQkvA/Ba6KaaohWdchM4VFYv+k6/s1Z6Oqw2ffgAwZ2V2ANMq8z1F1Dn4aR9JVv6A6SYY5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5TQb25wzn4CTUvggUhVFwVDpPr7mTElWqoIYI+5ob/8X8+lGP
	6H+7uO2f9KPI9yXesp+ZfVYfWePNu+yen6jIQNke4MAjwLRBBVKNq5caIZZoAXSH1zEvjcj7DVe
	AVMtyfdwK2NuX7WH79BpNE1Cxx2UFUu2yv2TZrrZeA+TI96gn2LmIhdRWcE6rIDDLvU0WpMgF
X-Gm-Gg: ASbGncut4b28x9fnB6L6ooKJX5UHFBfO3wiWcIIJqqIS9vSW5YqM77WSYrqphzpoi/R
	A7M23/Z196mqUn4Wb0IidV2atBbmx1kdo3FMYJOO4bCreXgjkV0RjXweip3Ut5WT7tKfd7ca9Rj
	uluCJusWuVwbCCYYMF12qTTD7PlbvsfjChESAPU1ewt53zLN7vBe1xJe5I/wD7SppRr58lhBrAT
	HMw9CNa5Tr4qmqIMEEFtLShfzol0CDK2mMedXMJyrgRUubS85xehG8=
X-Received: by 2002:a05:600c:35cf:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-438918c6162mr28854355e9.6.1737133116951;
        Fri, 17 Jan 2025 08:58:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYIoDtomSYmqLa26VwMFEEd3Bi1NL5xFaYrY1IZ5nECd1ybECqHqqQatedShGbF3GKsjZvQw==
X-Received: by 2002:a05:600c:35cf:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-438918c6162mr28853815e9.6.1737133116326;
        Fri, 17 Jan 2025 08:58:36 -0800 (PST)
Received: from [10.10.13.81] ([45.156.240.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890417a76sm38554555e9.16.2025.01.17.08.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:58:35 -0800 (PST)
Message-ID: <23fa05f8-ea30-4261-91d8-b34fc678c4de@redhat.com>
Date: Fri, 17 Jan 2025 17:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
To: Jason Gunthorpe <jgg@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Ankit Agrawal <ankita@nvidia.com>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "will@kernel.org" <will@kernel.org>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
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
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <a2d95399-62ad-46d3-9e48-6fa90fd2c2f3@redhat.com>
 <20250106165159.GJ5556@nvidia.com>
 <f13622a2-6955-48d0-9793-fba6cea97a60@redhat.com>
 <SA1PR12MB7199E3C81FDC017820773DE0B01C2@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20250113162749.GN5556@nvidia.com>
 <0743193c-80a0-4ef8-9cd7-cb732f3761ab@redhat.com>
 <20250114133145.GA5556@nvidia.com>
 <SA1PR12MB71998E1E70F3A03D5E30DE40B0182@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20250115143213.GQ5556@nvidia.com> <Z4mIIA5UuFcHNUwL@arm.com>
 <20250117140050.GC5556@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250117140050.GC5556@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eh6ohmBABupIdUohLuKek6e2fZF8ILV3vZ2B6khngXM_1737133117
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_085843_916372_8EC43DAE 
X-CRM114-Status: GOOD (  11.43  )
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


>> I don't see how VM_PFNMAP alone can tell us anything about the
>> access properties supported by a device address range. Either way,
>> it's the driver setting vm_page_prot or some VM_* flag. KVM has no
>> clue, it's just a memory slot.
> 
> I think David's point about VM_PFNMAP was to avoid some of the
> pfn_valid() logic. If we get VM_PFNMAP we just assume it is non-struct
> page and follow the VMA's pgprot.

Exactly what I meant.

If we only expect DEVICE stuff in VM_PFNMAP, then we can limit all the 
weirdness (and figuring out what todo using pgprot etc) to exactly that.

VM_IO without VM_PFNMAP might be interesting; not sure if we even want 
to support that here.

-- 
Cheers,

David / dhildenb


