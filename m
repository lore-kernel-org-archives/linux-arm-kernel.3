Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4121C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 13:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSr0TDQLJaYD83EU6zHlB1nKsxywhTiBP95UqC0cvIM=; b=XJcwvqSbQZReQ3Pt4ntuUPH8SR
	S2GyHsA/KZszFl7P5nMdzqT1my0Bob0ftS7fL+OPtUz7FKc7pNWyUE/Ef1GImBcwZ9TtXrYU3V5OW
	sPXgMWtHZibSxAej2fJqAdsds9BIrOfosY9A7s7CnVIMTAwY3+YY6iPmUl3Kz1/QgUPXw4aq7yMjM
	uW+QFGamjPMh6oNSCZNmf0bAjoA516uG/B/XGj2GnnlAYDfwDbMNw9btlAfV1ilVPuT4NsbjNwlBL
	bH0GAsT+IiSOc9dMljIVHWfm2Jh0nHpBduuPBKriGMZ6nXpXeqJnFRocsXJHiOeOquAVysO+bGPM+
	GXm1+T1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzOt-00000005mWp-34Jp;
	Tue, 11 Mar 2025 13:12:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trzNF-00000005m8D-3PHt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 13:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741698618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSr0TDQLJaYD83EU6zHlB1nKsxywhTiBP95UqC0cvIM=;
	b=OeDOHSJQj0m2dO3IbwwY8pgGHp389b8KFiM8sYRERxzxO5St+nB55ICv/hWp51r7+i/Bh+
	XGXBj4qgLZoT63HSIVj6YJ5yv+ioqRDAngspgG1HNdScEalIueWTNNdaDb413w31IQAGwt
	kOQO/MhQjyJjddnOgpRf9DL3Mnw/ze0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-IiBxId8QPQGq5j7Mo9EwwQ-1; Tue, 11 Mar 2025 09:08:50 -0400
X-MC-Unique: IiBxId8QPQGq5j7Mo9EwwQ-1
X-Mimecast-MFC-AGG-ID: IiBxId8QPQGq5j7Mo9EwwQ_1741698529
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so12822685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 06:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741698529; x=1742303329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSr0TDQLJaYD83EU6zHlB1nKsxywhTiBP95UqC0cvIM=;
        b=XcpbBgFv39hwW56jG4bxLmY3yvZzahVYtmoWZdJ0kcyFrcqQpdo3Gdzp/D8YWoXEMs
         F5BbOwuK3Dfg8Kl4gFLxaILfAnpajNIvvG1w3T3QlyT8IDNI+NYOTAtVgXbVNWd5YLST
         gPW1kFGTc1mYCNfV/FTb51G/XsN4ilUBGgx2MMXng4oaoxp+sWViiB+Jj6W5V6jKVnuC
         dNkuwHoadFprVxIoiQ3b7q4uNN8IxC7TUrhCVw9P6I4AlgDRqW7JDa00U8kgL8xLArwL
         nTyz4kZtrp/DGKnY4gWqK3C6GWnfaTuoP0UwL3DIJyZCmCtLJEEKzN4b3RsrMr3tJLnh
         Z64g==
X-Forwarded-Encrypted: i=1; AJvYcCXIVZHmw9io8RVWBhHn3iPJNpuFKqjeu7zWfA/2tKFDIS/tm4D/qNxbyfbXl6R3wGnGK4yUx7YsL3KsrP8ISaBq@lists.infradead.org
X-Gm-Message-State: AOJu0YxAohRaC5KMytOekFu4KgkJvG/cRWkrbE+niyMCtzx72fmMHZXW
	yLis8bYxP41kxE8OBIHMKjW8JkgMkJ3x+M3dIcYKDwhdBVx+xvFs3h/vHk24YSW/ekngeRfeirB
	ZTTS0RWbOti19ZSu1Nj0AfBk1zBixel8a80TMCcOUFxyPD5SgevnLTgX38Zl01Zg06QXmt/mQ
X-Gm-Gg: ASbGncsEVFJx7CtzVA/RGFE7vtY/WuowO/K1glFyl4uoxrVPKK3/jyYNbUYWjHphbzp
	J0cc6htoxn5a2ZjRIOFEhL4t7+snH5jHMM0vMk9BYApgRqM1VxcKW8r8gOUKf+zjlOJSpvUehrU
	WgIATja+T613sgxbzHn1IWmYa5ykQE1GkpztmcGxDIzH9eI07qNPHFhQcwXo/g+5RMEam/fkd/F
	WliSzLQB8Em19TND9VY9EgGLT4o7PgZQMN5yVAltJnyy8+0+/WB0Rhsdlh+T4iUmm9hRmxljd8M
	R4lo43I7vxgocp+4e6Xuof4cyw+zd3DfSwmexApIzFJf/g==
X-Received: by 2002:a05:600c:3b04:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-43cf44c7703mr98398855e9.14.1741698528846;
        Tue, 11 Mar 2025 06:08:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHg2xJEtdcFy90P2VzdKFh3p/fCZJcgu7H/volTSsPrNEA8I4PMuG+4jYjYdTWL3xOUsvL7A==
X-Received: by 2002:a05:600c:3b04:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-43cf44c7703mr98398315e9.14.1741698528418;
        Tue, 11 Mar 2025 06:08:48 -0700 (PDT)
Received: from [192.168.88.253] (146-241-12-146.dyn.eolo.it. [146.241.12.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf3ca4f5asm82801875e9.12.2025.03.11.06.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 06:08:47 -0700 (PDT)
Message-ID: <72cd7f5a-ab92-494c-b7f8-4696d23ed4b1@redhat.com>
Date: Tue, 11 Mar 2025 14:08:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH net-next v11 0/4] fix the DMA API misuse
 problem for page_pool
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Yunsheng Lin <yunshenglin0825@gmail.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net, kuba@kernel.org
Cc: zhangkun09@huawei.com, liuyonglong@huawei.com, fanghaiqing@huawei.com,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Gaurav Batra <gbatra@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, IOMMU <iommu@lists.linux.dev>,
 MM <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>
References: <20250307092356.638242-1-linyunsheng@huawei.com>
 <87v7slvsed.fsf@toke.dk> <40b33879-509a-4c4a-873b-b5d3573b6e14@gmail.com>
 <875xkj1t70.fsf@toke.dk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <875xkj1t70.fsf@toke.dk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zs69rvxC8m3HmQetI0L_MbAbNub8dnOLkt-h25GLHi0_1741698529
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_061021_919270_18733DBD 
X-CRM114-Status: GOOD (  22.06  )
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

On 3/8/25 3:40 PM, Toke Høiland-Jørgensen wrote:
> Yunsheng Lin <yunshenglin0825@gmail.com> writes:
>> I only took a glance at git code above, it seems reusing the
>> _pp_mapping_pad for pp_dma_index seems like a wrong direction
>> as mentioned in discussion with Ilias above as the field might
>> be used when a page is mmap'ed to user space, and reusing that
>> field in 'struct page' seems to disable the tcp_zerocopy feature,
>> see the below commit from Eric:
>> https://github.com/torvalds/linux/commit/577e4432f3ac810049cb7e6b71f4d96ec7c6e894
>>
>> Also, I am not sure if a page_pool owned page can be spliced into the fs
>> subsystem yet, but if it does, I am not sure how is reusing the
>> page->mapping possible if that page is called in __filemap_add_folio()?
>>
>> https://elixir.bootlin.com/linux/v6.14-rc5/source/mm/filemap.c#L882
> 
> Hmm, so I did look at the mapping field, but concluded using it wouldn't
> interfere with anything relevant as long as it's reset back to zero
> before the page is returned to the page allocator. However, I definitely
> missed the TCP zero-copy thing, and other things as well, it would seem
> (cf the discussion you referred to above).
> 
> However, I did consider alternatives: AFAICT there should be space in
> the pp_magic field (used for the PP_SIGNATURE), so that with a bit of
> care we can stick an ID into the upper bits and still avoid ending up
> with a value that could look like a valid pointer.
> 
> I didn't implement that initially because I wasn't sure it was
> necessary, but seeing as it is, I will take another look at it. I have
> one or two other ideas if this turns out not to pan out.

Another dumb option would be storing directly the page address in the
xarray, and avoid entirely going through an ID. I guess it will use more
memory (the array will be more sparse) and will have more overhead, but
could be possibly simpler?

/P


