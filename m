Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3ADC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcjMQQjDSdSwY1RX+LoRs6QbfJmy/6ykYqRqkN1o+H0=; b=PtlevT870RegrDnhc7mwxgoYek
	O1kPaZ2WRa62Wbtki7NvVvOhRbAu3F4WimSbxVZJR2mz/kwe/i26wdKnYv4oMhEx0Ms5hjQ7RyPWJ
	39WO1uuCxxAx64poUGMnT4idx/hx4nXtLn7ahU6+UB3mK7MUZflVPJuQnXKJ1VommQjhN3rP7minO
	T3i3gRbbMDEg3hOiiREGOy8kE0U/fFctoR46gVC7Zdw+AZRScJVneIhtsufSqpy6g3gvno4R4mkUu
	DyMMx0Ig8vusAikcrJrtp9GIcl9r71ghIN/XiJNsAPNSNSX2MzzA68GJ+OjRKYoOrErrZHkg4EHKH
	R9NLyPqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjmm-0000000GkyN-1ArW;
	Tue, 29 Jul 2025 12:50:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjf3-0000000GkGe-1bkT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753792947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WcjMQQjDSdSwY1RX+LoRs6QbfJmy/6ykYqRqkN1o+H0=;
	b=IFGy++NfF2ckXOMUUOyQC73pF/U59wKxzvwa9D2qsDsl5stlRkLTyjjM8JQ1GwsMMPmLTd
	qhNTIcDVWhij8UuwwLyZ9V2H6uq1PCCYXo3+hNaGbZw6iJ5hWt5FbUwfhAX5JKq5dzV6SJ
	8VrLvh79BdO3Y1Ok4a5F4evumT9Kouk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-F_2rgbVFM06Xy2eUL9Bmjw-1; Tue, 29 Jul 2025 08:42:25 -0400
X-MC-Unique: F_2rgbVFM06Xy2eUL9Bmjw-1
X-Mimecast-MFC-AGG-ID: F_2rgbVFM06Xy2eUL9Bmjw_1753792944
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-455f79a2a16so42488215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 05:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753792944; x=1754397744;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WcjMQQjDSdSwY1RX+LoRs6QbfJmy/6ykYqRqkN1o+H0=;
        b=e/uGE95QZppW/RGGvqB4+X5Lr/kuQj2LlhDpgj4ib3j4d4LBJIZaUUQKDgHZDugc5U
         3qHKCUElDYYCV0mjtY64FedizDHW2M+8fi+xxXufwLS4/sDxyYKI4Xde0DWBHAs7/uAo
         AmA/iBilKmy/zparpNEhjpQ4+atNKB0alGQoU0z6MKKVWKGSf9l/lfldL1IRtBGb/Z/J
         Az0zpgD/eoxnVSzESCeajRvnFP32hSyl1NVXB4p5AJz9AeEOoye3Y7iH7YiplmO8VbC7
         slIP+gFAobJlGM78cTt4/x+musoYxsFpUANlO9/xyIKU78DQ4fr7lqROQ0MTv2iNBXdU
         07Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVQOIlplUUouvmXnudqVlAS4QIopgOfKyMGYzWAExlx29mALQNJzQIKhdFVKvFcAhwfwkyh7K1oTPPoGwmR2/bg@lists.infradead.org
X-Gm-Message-State: AOJu0YzrhMjuNKJec1UjCQnq4GNdS579d23SmvCBgaIIhlvuhJ0ERnGE
	HorD2Y/IHsasTvFJw/W/AQjw5qlvQko6JuZhW0PTjGhDbZFN8d8uXQJGJ3Cc6RDHdw3EObno9mM
	kxUYYxctlu7/cTwkhbbquSPKMZ8+rPVPl0NimPzepbA8lFy09nAHbaqaaD18sRv87v04w5IVylx
	94
X-Gm-Gg: ASbGncshAmJv2tSJARp6s3y0YUOq9egpM9DkFsUz7/2hCpphaIJaFobiLQZbQB13dVY
	t6v+oW0jcpqkvd+u2FJmyP9Gkzb/d+/CzzAM+xdpNRMkCUzBnf9RZxvCdQJr78/TDd70k9M5GH2
	4tqIjOn1S2xfNKBm78Eaf7ojZdExXrOef39pX/MS457a8v0n5ThzYCkaDKut01xyXYttoaH2ugl
	P6udehTGpqxN0MTpnA8tiD3E/SKECMvD11iMUUzGo2rN+tUrRZpJzASqSvKIjQvCfYY6xJ0aWv2
	L0M4/ALPVEaPIM4H3ulJIQq7t/TTcfX/Hcf/MXX41hdTADIznBch0utEM5Ft/fg53GzF4Jfw
X-Received: by 2002:a05:600c:620b:b0:456:1ac8:cace with SMTP id 5b1f17b1804b1-45889b30dacmr54719475e9.12.1753792944297;
        Tue, 29 Jul 2025 05:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVzcw4B170O0ATQTmJ3dfpRn+oQ1lRRT7YNXe6J7L7+9l30GTFb5RPpD1eQ1esmhnAOVPqvw==
X-Received: by 2002:a05:600c:620b:b0:456:1ac8:cace with SMTP id 5b1f17b1804b1-45889b30dacmr54718925e9.12.1753792943716;
        Tue, 29 Jul 2025 05:42:23 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054f338sm190876065e9.13.2025.07.29.05.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 05:42:23 -0700 (PDT)
Message-ID: <d66fceb0-4672-4803-b9c9-6b769ff847da@redhat.com>
Date: Tue, 29 Jul 2025 14:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: "akash.tyagi" <akash.tyagi@mediatek.com>, ziy@nvidia.com,
 surenb@google.com
Cc: akpm@linux-foundation.org, vbabka@suse.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, mhocko@suse.com,
 jackmanb@google.com, hannes@cmpxchg.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 chinwen.chang@mediatek.com
References: <E70C1648-DDAB-4027-AB07-1C19B10C6AEF@nvidia.com>
 <20250729123028.1224786-1-akash.tyagi@mediatek.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250729123028.1224786-1-akash.tyagi@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rzPDXvGbQuweEfBoHr3XpsQS4CNrysXgMh2_GNgxF0A_1753792944
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_054229_498920_49CE2840 
X-CRM114-Status: GOOD (  13.68  )
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

On 29.07.25 14:30, akash.tyagi wrote:
> On Fri, 25 Jul 2025 at 10:27, Zi Yan <ziy@nvidia.com> wrote:
>> But there is this known problem that CMA can fail temporarily due to
>> short-term pinnings. See the "reliable CMA" work (don't remember the exact name).
>> I think you mean Guaranteed CMA[1].
>>
>> [1] https://lore.kernel.org/linux-mm/CAJuCfpEWVEqsivd7oTvp4foEho_HaD1XNP8KTeKWzG_X2skfGQ@mail.gmail.com/
>>
>> Best Regards,
>> Yan, Zi
> 
> 
> Hi,
> 
> Yes, the issue I described is actually related to Guaranteed CMA[1].
> 
> I have rewritten our problem statement to address concerns more specifically related to the Android common kernels.
> 
> Problem statement:
> Android Common kernels usually have an out-of-tree patch to prevent file-backed page allocated from CMA.
> It allows some allocations which have lower chance of being pinned to use CMA to improve CMA utilization controlled by a flag __GFP_CMA.
> https://lore.kernel.org/lkml/cover.1604282969.git.cgoldswo@codeaurora.org/
> 
> 
> Additionally, android kernels create cma pcp list for pages less than PAGE_ALLOC_COSTLY_ORDER, but not for THP pages.

I'm afraid you have to fix this in the android kernels.

-- 
Cheers,

David / dhildenb


