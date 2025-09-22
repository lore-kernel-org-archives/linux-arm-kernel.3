Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D49CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LDmzSNY//3bfqaJ6YjqbvFTHQWUglXrj6TuZ+YI6XM=; b=EFKP433wL2JSS1Jqn3JNiB2Rlh
	0IIkVqO3oR+shDmmpiWkAG31JlwMAJrloXYHxlQDAcL1vHIVNqCzN1xCEiE3ZRPciqS/rD0VNJCFO
	eQ6CUbTRVqA718XOPoT6Oi4ACB1SeplKymcVcVRM8ijKg30G6+zlfTpHj7XIIN9JvqNN1t7HfDZna
	rcnMOgOom77qbPFrBRmXy+qPEhedlk/T9Hm/GTgh5/ofdTUL00UQrWfns4gsqY+ryVEGv3zjYevZB
	9880f7S3cn1u8/RsjfjAO35D8+0mPWPBfYzfrJc0XCD/QnhyY28XrrgMsKPJk9jghSA3/v9IyrgWe
	3/gfhkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bqF-00000009gP5-0mCy;
	Mon, 22 Sep 2025 08:24:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bqC-00000009gO7-16fW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:24:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso4835728f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758529446; x=1759134246; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LDmzSNY//3bfqaJ6YjqbvFTHQWUglXrj6TuZ+YI6XM=;
        b=O+6q6l0MVJO521LNrcpcnUP8vXW6fUHVQ7wVRW8uMpdze69Qb2iJMoWElRkogQPqlR
         q8CKBEXX0qf64krNWvieUDRL+QOsMTr1tc2oNiAckIwFrYP8f98She+Hx8Sw8p1TwywZ
         O3Hz/T4XztA+qNK6qiZPnlWQnoaODrwtZBSgdjX8CnxbrDL+tPC+MOQvlSti792NZBRy
         meOLZVvfq8VMlU8cUhPPLdrBQFcZlBuQ02b8V3SQnKJdKWetlJOEFyVufQKs4jNi9UYy
         5PrqZ73Eed2Xwx+2v/8R7FUxLUjzoXLtfVRI1Fu2CKkJZMevQW/tNQ7qdgrIk94opSk7
         fnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758529446; x=1759134246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LDmzSNY//3bfqaJ6YjqbvFTHQWUglXrj6TuZ+YI6XM=;
        b=pqoiPC/C8YfjJJA2jZcA7C43qKkk6SVYSQnlTPQR17MYlvkd3mFPc4BD3vc2dRbQg8
         rtrkdq5D42LcLQQim7nTyrXZtXmrZB5mTiZReocGGNJ4O4+7mkStMWif97StwueGzkp1
         902zJXJfpoY84Aej8sY8BX+UCvc9USV9kwV/cDJUePJcPdNELy00wHpuhzb9zGxwVG8g
         WUEk8joP2NaLUtI56W3Gj6LulT063aBf2gljzHZvPcDvJ7Jsk8ZIIYUCwprfaFJnFWnA
         b3uuSm7qAYW4zIWPA2G/gNrhd0l/Y65dIQWAb8mXjgVB2nB7RLWHwgqRFnQWiMTso3u0
         ekXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtmfUmOD04W7TQJ3tyn25dBTh7eKuc/bt6lZGVDVNfJt0nlE8/1wTINHcKcN7u5wYk3bQzyMgGDM65erIlvFKp@lists.infradead.org
X-Gm-Message-State: AOJu0YxyF1WKDP3s4bf85Fv7WQfQ2/a/6dPaxUNwWPPndwrN1QvOPeDa
	ntatqXnsXSY5WowvjpE4UC3oXr+zv10SbCMBP8vcjJOCIMqpg2nYs5CI
X-Gm-Gg: ASbGncv0rTdS/IQsN6wffHoS2nEvL2k+nZgrPmCdVMBAFPzwc5iDjNbBACgSO12WQ83
	psxnzrYrA+aLXNUBXeC+5EPSRxOeKT3QyCmts5aLsykNR23m92kPmTGrBWpK/xzdvPSnMJApfO7
	osxE+Qa55X+0f3R9fP/uiBtU8QuB3zAfbGs4Q2EOR1h6S8BYLxplq/GURjGaUZZYyc3EhPikTbR
	9vwajN205lb12bCWdl34AT5sUPWwIUCI366VrAcJxMY1C3U5OBf6kZ3tajVlHK6O+xZ7kYIWDBW
	DTcPTQ4VtqKziCryakTJPNxD9PD5ZOObkXCv4Th+2fq6adOWTjqpqJ8IZ4EhFWuzTgRU3o5z9X1
	k5suqnLu80QJ6fV7tq6GDVYmjg+TE/FWaSkTaIds23A==
X-Google-Smtp-Source: AGHT+IH5Ss/MexQLwWH32bSqKyK5FwYfHlZSIMK20q+jLV1U7CXiGcXfpzejzl0MccyrWKA2QZ6x2w==
X-Received: by 2002:a5d:524d:0:b0:3f2:97a6:db6b with SMTP id ffacd0b85a97d-3f297a70589mr6175117f8f.3.1758529445981;
        Mon, 22 Sep 2025 01:24:05 -0700 (PDT)
Received: from [172.20.10.9] ([148.252.145.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ef166e62e5sm13972312f8f.40.2025.09.22.01.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 01:24:05 -0700 (PDT)
Message-ID: <8884d7df-9709-4f5f-abfc-6b74aa220295@gmail.com>
Date: Mon, 22 Sep 2025 10:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
Content-Language: en-GB
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
 david@redhat.com, lorenzo.stoakes@oracle.com
Cc: yuzhao@google.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 baohua@kernel.org, voidice@gmail.com, Liam.Howlett@oracle.com,
 catalin.marinas@arm.com, cerasuolodomenico@gmail.com, hannes@cmpxchg.org,
 kaleshsingh@google.com, npache@redhat.com, riel@surriel.com,
 roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com,
 dev.jain@arm.com, ryncsn@gmail.com, shakeel.butt@linux.dev,
 surenb@google.com, hughd@google.com, willy@infradead.org,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, qun-wei.lin@mediatek.com, Andrew.Yang@mediatek.com,
 casper.li@mediatek.com, chinwen.chang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mm@kvack.org, ioworker0@gmail.com,
 stable@vger.kernel.org
References: <20250922021458.68123-1-lance.yang@linux.dev>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20250922021458.68123-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012408_326317_6D9352D2 
X-CRM114-Status: GOOD (  18.92  )
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



On 22/09/2025 03:14, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
> 
> When both THP and MTE are enabled, splitting a THP and replacing its
> zero-filled subpages with the shared zeropage can cause MTE tag mismatch
> faults in userspace.
> 
> Remapping zero-filled subpages to the shared zeropage is unsafe, as the
> zeropage has a fixed tag of zero, which may not match the tag expected by
> the userspace pointer.
> 
> KSM already avoids this problem by using memcmp_pages(), which on arm64
> intentionally reports MTE-tagged pages as non-identical to prevent unsafe
> merging.
> 
> As suggested by David[1], this patch adopts the same pattern, replacing the
> memchr_inv() byte-level check with a call to pages_identical(). This
> leverages existing architecture-specific logic to determine if a page is
> truly identical to the shared zeropage.
> 
> Having both the THP shrinker and KSM rely on pages_identical() makes the
> design more future-proof, IMO. Instead of handling quirks in generic code,
> we just let the architecture decide what makes two pages identical.
> 
> [1] https://lore.kernel.org/all/ca2106a3-4bb2-4457-81af-301fd99fbef4@redhat.com
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: Qun-wei Lin <Qun-wei.Lin@mediatek.com>
> Closes: https://lore.kernel.org/all/a7944523fcc3634607691c35311a5d59d1a3f8d4.camel@mediatek.com
> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---
> Tested on x86_64 and on QEMU for arm64 (with and without MTE support),
> and the fix works as expected.
> 
>  mm/huge_memory.c | 15 +++------------
>  mm/migrate.c     |  8 +-------
>  2 files changed, 4 insertions(+), 19 deletions(-)
> 

Thanks for the fix!

Acked-by: Usama Arif <usamaarif642@gmail.com>

