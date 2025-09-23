Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852A0CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 02:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2o3DubClAWsVDJ1BnGOUzNOsvzg6slCDhpRe/M692Y=; b=h6K3pv7NizdhuujVBrmd6lCHpI
	UkZ49BmuRZ2EObr5rG3WEwE2Q1ipOM5YL16N/LLJaFtQtLJU/Bi9RbDEwbIYFrbv/ad04xD0Z5f6O
	8XJ7RPp2fylqZw8qDvs/KzJl8T8Spa6wE6kuS/GLdKsrR5vibbCP4h54r4yiRXqE0Yw1vqtUX6wjp
	lBJgtolXGokmzXPV77g5tVmsPKsPKhbVBSinnp5H8x2nT0flno4C7fbh++3BF/06/Op50FNp4M1Iu
	yxm0Vpe+lBoHjtuNFc/VhkmewO4G9Cq1Pck4qOBnXaeo3jUgBcdaEJ9ADzwwaA/U9fSALWCapon/6
	hcYf7oIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sUS-0000000C7DE-2Ew5;
	Tue, 23 Sep 2025 02:10:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sUQ-0000000C7Bc-235t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 02:10:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-62fa8d732daso7816514a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 19:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758593444; x=1759198244; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2o3DubClAWsVDJ1BnGOUzNOsvzg6slCDhpRe/M692Y=;
        b=OMRQkEKCmu8EmTuqlXobJc9dMurez3GuI24CgcHIwFw9A38kaN3pwcvlP/1/L021P1
         RFOHP/X2Gh3bOMKe3qh0nK9oSdospmL0t9cwkpa88u2UNYLM61F78qlqbkPiAsk/Xx9F
         gl4DqmkUnBP2mQ49XDbygeKm6+vWXgP2pP9bso+jZvg1Q9nRTcUbytvEFe2ZzddWfvah
         ydSxEHJpuMtOX2ZeSLqR/c2nvSMrA0PpMz3J7haLW2/9AZrMPygqJ75J0JYGtwvXmuV6
         ObBOcyZc162iC6NA7fmanaQ/SN2FAE1UPmH7ofv5ZXus/pLyJ1AW4OqA26xLfEWqhY1i
         nzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758593444; x=1759198244;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A2o3DubClAWsVDJ1BnGOUzNOsvzg6slCDhpRe/M692Y=;
        b=QpFi2NqrCF6ICW8BRxX5LiY5I98Cq1IpaVbjKzEGezxlIEtJMFa9DP5eqXsZg1MCoC
         6IFeLdvm7V5sDLyZEtSRfaEFNcuXCpPULdmaVXWigAQ+HdlbJ4cnfA2zvtZH9JEu1MW9
         xDjE11gZxhZrvFC4Uv7CLvNX7/+0LGqeaPVHWWfn0csb3Ud6fcOmareO6z9KOzVz6fVI
         bHl8hwu2qK/X7C7lkqL9EdpMcybatjzFtu50Z8kwEtmyMrhLfauYOZlv50k9KERlumNz
         oNXv5p3CARaRiyp7FL9/nQEv0LWtdg+ZSZiAXaW12r9wnn4WKvIuqa9R8kve+dMw/AGx
         VpPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFyNL2MXBzXHZZC3GZlCz5khFZyUyyBcLRyWuSZxn/+n8caOlvY/nfodMhIS9gDc1EFxwC3CwmHOVEQ9QJBjoQ@lists.infradead.org
X-Gm-Message-State: AOJu0YytUsmWs+mZaLUus5Pvx3HvVhT5/q/JioRQ8xFpJ4sMZA8Vb41x
	oO4VmmL3xTOt26KmTkRM96TMotd/089DyJQBWyW6zUKpbOma8w6mpSS9
X-Gm-Gg: ASbGncuaptB5vaRdRMtp9EZV/oLlOFi9VOM7eLqd4St0gunsgQrpLwiu5JfkuBK8NWk
	9XjVBKpgY/TGcbR5sBOunSq2letlf7aHpJ2h+4ZH5rc7/qmsYTa1rKnqIQm4/AJtdeyITxz9agx
	aB6VL0cVUo/aNnc9gMPRx3RL+13g0Q83rvUQNH8YxEUKzyMWQOU+ayBa53jLexm5iZkkrcxWXuj
	L+y2kug2rEnj7ZzBVIqB350f0t0xw7OqRUqcxjv7E6fJYFuAv48RVGQCM8Z7Ez9BT/vsi8NYkak
	eJBLcHCHplnDDVC/rvw/GxflGYV9ot2GR0g27ExiQwJq8C6OXbPev7V0yqn53/55PkWjDywIouC
	R4uePFYtzBMrKetGWHDzkFfIR2XDV/bWzBv63G43o
X-Google-Smtp-Source: AGHT+IHh1ALlBKynJpngfEEL3Ms5mRjlxZlK1yneebgFCzG1payJHzKI+8XXxoWxK83o13jhnY/w3Q==
X-Received: by 2002:a17:907:6ea0:b0:b0b:f228:25a with SMTP id a640c23a62f3a-b302cccb3e8mr56042366b.64.1758593444044;
        Mon, 22 Sep 2025 19:10:44 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28a990f6e1sm658553266b.37.2025.09.22.19.10.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Sep 2025 19:10:43 -0700 (PDT)
Date: Tue, 23 Sep 2025 02:10:43 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com,
	usamaarif642@gmail.com, yuzhao@google.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, baohua@kernel.org, voidice@gmail.com,
	Liam.Howlett@oracle.com, catalin.marinas@arm.com,
	cerasuolodomenico@gmail.com, hannes@cmpxchg.org,
	kaleshsingh@google.com, npache@redhat.com, riel@surriel.com,
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com,
	dev.jain@arm.com, ryncsn@gmail.com, shakeel.butt@linux.dev,
	surenb@google.com, hughd@google.com, willy@infradead.org,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, qun-wei.lin@mediatek.com,
	Andrew.Yang@mediatek.com, casper.li@mediatek.com,
	chinwen.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org, ioworker0@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
Message-ID: <20250923021043.nx2k4ftzle6e2jht@master>
References: <20250922021458.68123-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922021458.68123-1-lance.yang@linux.dev>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_191046_535778_5D784387 
X-CRM114-Status: GOOD (  13.51  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Sep 22, 2025 at 10:14:58AM +0800, Lance Yang wrote:
>From: Lance Yang <lance.yang@linux.dev>
>
>When both THP and MTE are enabled, splitting a THP and replacing its
>zero-filled subpages with the shared zeropage can cause MTE tag mismatch
>faults in userspace.
>
>Remapping zero-filled subpages to the shared zeropage is unsafe, as the
>zeropage has a fixed tag of zero, which may not match the tag expected by
>the userspace pointer.
>
>KSM already avoids this problem by using memcmp_pages(), which on arm64
>intentionally reports MTE-tagged pages as non-identical to prevent unsafe
>merging.
>
>As suggested by David[1], this patch adopts the same pattern, replacing the
>memchr_inv() byte-level check with a call to pages_identical(). This
>leverages existing architecture-specific logic to determine if a page is
>truly identical to the shared zeropage.
>
>Having both the THP shrinker and KSM rely on pages_identical() makes the
>design more future-proof, IMO. Instead of handling quirks in generic code,
>we just let the architecture decide what makes two pages identical.
>
>[1] https://lore.kernel.org/all/ca2106a3-4bb2-4457-81af-301fd99fbef4@redhat.com
>
>Cc: <stable@vger.kernel.org>
>Reported-by: Qun-wei Lin <Qun-wei.Lin@mediatek.com>
>Closes: https://lore.kernel.org/all/a7944523fcc3634607691c35311a5d59d1a3f8d4.camel@mediatek.com
>Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
>Suggested-by: David Hildenbrand <david@redhat.com>
>Signed-off-by: Lance Yang <lance.yang@linux.dev>

Nice catch.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me

