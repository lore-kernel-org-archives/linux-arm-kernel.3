Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ACAC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 10:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67t2MAwM/CJHQTc19wvE+OmwIIUNA6nz2MWrmdq+rUg=; b=jOdjNxpOHUdO6D3Jx7Iw45h44g
	tBzqxvSMQLOQ/bIxuGxJxHd3rgU76pE2qgIaJkPB9qY2dfjjagalQx2XO2oWL9aZCu9Qbmrk62sqk
	ZxXngDoT9c8buWuJEviwMTTaiXPyU+gKKmRw4aZbIoClsANUlvEPiuvHUYIdu7aE3Rv7wOiWqVuV2
	xfI2JiJ5Bf+K1EDsVABfBsgUuFvYFU1yO5nYvmal3WT53N2eoUkzfeDlrLSOe2xiJIrHO9p6vs15/
	JAhDaEGKiIgHtwp8FcEK9JFXR21oiK/Q5LLBhHdNeRJ5B1CkPkwieZEQy5PUgi254D2j+js7mbEt+
	TMTL5Ttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0z0u-000000095jK-1e58;
	Mon, 31 Aug 2026 10:13:16 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0z0r-000000095iM-2Ng4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 10:13:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c255206b4dfso413252966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788171191; x=1788775991; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=67t2MAwM/CJHQTc19wvE+OmwIIUNA6nz2MWrmdq+rUg=;
        b=XHMBP8hdIvndN8mjsCVLGy3iWeSKDrwcsJAmLlL8EIfZrFOIxrVLVoWVUEcow0pkSF
         xDx9FbkP5wqNpbIv1C08DMIKO6gQp7APK9iQoceNfIAlRwG3j1ij9k6XJAtSlYMY8rXR
         XlsA93s9zwFTHUIpgMna2t4O0OfBF+n6w14tGvGruPRbktcXYTEaMdSBHVW93B5340pR
         q2n8vhURvW2qqGu/52/TQN/at4NsQfiGxTAMr9tSj5tadKxkqXm8aoSStYszK5a7+Opu
         3rCnd8DKWIM9JfOntY2gwXAVHgBZGt4Y6qU2sP+vLGzndlLZdholATkohp+DRBo2F1JE
         K2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171191; x=1788775991;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67t2MAwM/CJHQTc19wvE+OmwIIUNA6nz2MWrmdq+rUg=;
        b=lYKCI8+yRTWuA94fcR0Y0KfGhu4Ta9GT5VAK+iTyJgLdp9ZmGYIYtnG1NhyquXtwL1
         gUHfY2F/xiARrNDOzQynriQZwmEEUTK+zc4Ovtck9qfABWP0xlN2X+TDv6CPbbB1WxfT
         LSbbBI6ST+OmMuxa7QAgj5qWz/xzisxFiybci46k7GWDYBa3IBIOnyxLY8KV++uqgNM7
         50VG65YxIE6uzL4qneN7u/yfZW4JFyOyTHhzRc/3S8XKpyc5/OtykMYw/kh/k8Pw/R1V
         EDpH+bRvgn4T+P+OWz4SlxBAh8rwmvw4NtCe9IJRgeiqwAObhAmUT6oPADigg+ECwUSj
         Uugg==
X-Forwarded-Encrypted: i=1; AHgh+RpplVkKfAyvenXn4pRCWzEJQircsjHO/twO7BfLL+SC6lV5RL5ecflZHZ1YgTmReag2FeQMfQYYm84ZhfwbKqyt@lists.infradead.org
X-Gm-Message-State: AFuF++mDM2RYFkxK0px/VlaMCbBELKQWH2Xv7YUcTYI7FpN/5/5aZ4PJ
	CSaokPDhHfW3uj+ZpKXR4MaE2lGCkNDP4NjOtfvmKIf+sc5np4IY0nFH
X-Gm-Gg: AR+sD12nU81jvbODtqDsHr4K34qOA3+qT7Fu2Z89623pSaqFItHQXFjIuYwdksVFYvA
	x6B+aY7O1Swh8Rwvvb1yE1D+VLvr6Pm6Gsduu/3uKkTmWhhQ78TEq8U3nmtLzAODSUpsC2IARIP
	mTYufqx3HEXT+oBjtZfyI4TK234eSPf+j8qeecLU9YvcepenC1HbFUSut/zICqUVdc+hLFGSQuv
	knNd1q5zQaj9CBO+8ctMfnquLiqNcofEw5bCW9p5okXBuFXtb2oxEU1yXH7RfdMUuVkijXSd7vd
	aFfrx+LNS1n7I75RL96G1LauFGu/FA8GgoKLWLOK7+ouwHvjUdBuXGcFYEmtj6pJ5/Dc2gNmqNh
	OJTzd4JINNWpU7GV6uzaBXhWTALJX9M3IzL5W9LvHj6HoMC9hdlBcTS5x8O/6fpOZHg/HRbO87X
	DJvgQVcSHkvVQn9MWYiwgeNf4m9IFyprtsltcICCWTWe/2/FUx4tNVQQe89uYCY+Nkk7MCchuFI
	w+oe+wvmonbKPi517SneyBP
X-Received: by 2002:a17:906:1013:10b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c25aee558cfmr69135566b.11.1788171190678;
        Mon, 31 Aug 2026 03:13:10 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b28f6sm385832566b.39.2026.08.31.03.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 03:13:10 -0700 (PDT)
Message-ID: <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
Date: Mon, 31 Aug 2026 12:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
Content-Language: en-US
In-Reply-To: <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_031313_633969_B94F29E7 
X-CRM114-Status: GOOD (  12.18  )
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

On 30/08/2026 9:47, Mike Rapoport (Microsoft) wrote:
> fifo_init() allocates the buffers backing the software FIFO and
> endpoint_alloc() allocates the transfer buffers of a USB endpoint.
> 
> These buffers can be allocated with kmalloc() as there's nothing special
> about them to go directly to the page allocator.

Except that they are a bit large.

fifo_init() may be requested to allocate up to 256 MB of buffer memory. 
This memory resource is split into an array of buffers (fifo->mem[i]), 
each 64 kiB (or less, if there's trouble obtaining segments of this size).

Citing Documentation/core-api/memory-allocation.rst:

"The maximal size of a chunk that can be allocated with `kmalloc` is 
limited. The actual limit depends on the hardware and the kernel 
configuration, but it is a good practice to use `kmalloc` for objects 
smaller than page size."

Regards,
    Eli

