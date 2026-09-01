Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E035C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLMiVP+WYQH9c6fmi64EU174ERw2OHDZTVkQEU4Pesg=; b=w6oYMuLB6kXRVLK+kwxG/ewRsK
	ymdPD8IFkVNXWSunINeIrnHx6S2vc2bxaCepLRHsVFcwqr74AjgP/ubPPmUQu8czjTpXJoC/aUQzs
	dsIB1LYMBUAYAyDd0enrCyQzcZLo7U0rgXxRHzmK6JntSKB+RMEp4JG6+JFltsR+FoE4qqCNJsmrS
	loLcYQ5dROF8SUEy2JjjzBYdHJYkiE54COhL2df8Oysfbw4L3pDYtk1kF28oGsUu0Tgqkh6VSAHxr
	GOHaCutwSQnQ+8SEEP45g775ahc01rc92WfJ+PQsrigzqFBh7PcSLsGKFh1iG9DmRPFHCBrTYHB95
	eAyhSvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jzy-0000000BIqD-0j9s;
	Tue, 01 Sep 2026 08:37:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jzu-0000000BIpl-48wJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:37:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49b8687630fso32393785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251857; x=1788856657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLMiVP+WYQH9c6fmi64EU174ERw2OHDZTVkQEU4Pesg=;
        b=GQ3gol81nzygD66RxuKn+AaVPNtSNGRpOh/MGYO3uBZSbxIc+WA70nSVRiGArlydqH
         7PtIbcgDYbQ3b5n9PSWlfVU/de4Nl/vHKNvWFLNiIhETVQK+tBKiOyGM5PrYMDDbiSu8
         19XMq8i6n9Pi8IPiZENNSYxRQyBtSDk32Nvh7UYWuJPJ71Zd8XdPnUBqzo3kjDWUdszo
         z/q71sLN0zHlWyzHwyAoUGBP8l3BiZN9jFHqjhk/xRb2HBpRcCRGJqhVWU56oEPkx9Db
         hT5nuedh8CbYSJfLUVo5BYgRnT70PxdQe1fiB5M6svcxaD6qAFU+3mZYCxRWYZi09HIb
         YT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251857; x=1788856657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLMiVP+WYQH9c6fmi64EU174ERw2OHDZTVkQEU4Pesg=;
        b=qRDl9BBPZcNy1HP2TrHbr1zUEeeIzhQ9/vS56mJug4SGqgfdFKDGtpcPMT3aF/dAOL
         S8bKspkLFuj3J7692Lxd2OD0s4sDk5HzjdAtWMg2aDCgsSRshPHDYS4h0IY/vVuqc9be
         I8edcWyzELU2W4TPzUaoq8YAGFP/Uu3X3Ij9FYQHyy0mW1CCYMSkKA3M1Ng0hmSw0AKg
         WnP+dC7/tvJTc8/BjzknVL4NEfkg1RjYZGpa3z6TMYZKjZdtwIwks+Qs4xLs7Obb3o+R
         uRBYW9yLqlSioOXjDE5kWGAVedMMzhmadg0SHHYNfmg8oKFZhqF49hTkK74EzxviR2Tk
         XLWg==
X-Forwarded-Encrypted: i=1; AHgh+Rouniauh0Jbxe2LgNC7RrF5T5EuHH5rL+9ILhMfZGTEh3bOfP/O5tFH7uKGa10Tr8YrxBXNVRs7d6vFhMhn84ZB@lists.infradead.org
X-Gm-Message-State: AFuF++njwhRcZ5zgkYYFbNPjsYeHYgLUSVUcvwLNNw0ViIGzWUHOQcOw
	A0zEf3q5pgRgbIk2j4uAAGh5Y5VquxVVOQuojCoSyJK4a2AZpuZazYBZ
X-Gm-Gg: AR+sD12J4YDjbcldVJHpQXOcpFOS+LM9E6+C1B0extKpuYIyAmmLsAR+ExB4kPxhzHq
	hWvvHO/KQjLetRb7q2nnUBd0jhU5fUhI8buV9WbEel44IMOcKpzuP/h4kVsL36Zj6dvMwHSMGSY
	2Pml1PAvCb4h0avrwk1j1Uw0LVev69IHBiWyuiWRwX7zeLhtADeTufCoFwOx5icT9R0bXPG6b7N
	802LtUpw+QnyGeyTGmE3pT1DE2Xm+hG/pirMNhD/GWW068fOXMUPV7th3kVe1/aCjX+8dvhP7oM
	Po+mZmucYU89ZFiAXmOQpgVYsqp1Gy9ofKobBzlVH1Dw7vxKGb1Q7Fg0x1P4HeeW/RnwYU/3Kbo
	k7FJee8byOadzy+JzU7jTWR12HdW/JKzZ72glwGyJ7p/A5y2CQq2Cy1cT62alQxLiSRWTiuYgGE
	81LyoJBIOEl7C7RhJfG4lq2JQ29/C2CNVOGMcg02sEMz5gXJki0Z63MAFtg8K6zQx/XwkXTnJ6t
	jwgLX/IRCQMzOfrj+r+VsMMig==
X-Received: by 2002:a05:600c:4f88:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49cdc4546c9mr105399215e9.14.1788251857090;
        Tue, 01 Sep 2026 01:37:37 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm56391225e9.4.2026.09.01.01.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:37:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 09:37:35 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Eli Billauer <eli.billauer@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Brad Warrum <bwarrum@linux.ibm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@amd.com>, Ritu
 Agarwal <rituagar@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Matthew
 Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <20260901093735.3f5b2df2@pumpkin>
In-Reply-To: <apaF1HUtJnstuUN4@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
	<20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
	<f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
	<20260831123937.32255a49@pumpkin>
	<apaF1HUtJnstuUN4@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013739_050989_7B168C2C 
X-CRM114-Status: GOOD (  23.44  )
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

On Tue, 1 Sep 2026 10:59:16 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> On Mon, Aug 31, 2026 at 12:39:37PM +0100, David Laight wrote:
> > On Mon, 31 Aug 2026 12:13:08 +0200
> > Eli Billauer <eli.billauer@gmail.com> wrote:
> >   
> > > On 30/08/2026 9:47, Mike Rapoport (Microsoft) wrote:  
> > > > fifo_init() allocates the buffers backing the software FIFO and
> > > > endpoint_alloc() allocates the transfer buffers of a USB endpoint.
> > > > 
> > > > These buffers can be allocated with kmalloc() as there's nothing special
> > > > about them to go directly to the page allocator.    
> > > 
> > > Except that they are a bit large.
> > > 
> > > fifo_init() may be requested to allocate up to 256 MB of buffer memory. 
> > > This memory resource is split into an array of buffers (fifo->mem[i]), 
> > > each 64 kiB (or less, if there's trouble obtaining segments of this size).  
> >
> > Would it really make sense to allocate the four buffers separately?
> > And/or use vmalloc().  
> 
> My understanding is that the buffers don't need to be physically
> contiguous and vmalloc()ing the entire fifo->mem in one go should work.

What is the minimum size?
Remember PAGE_SIZE can be 64k.

David

> 
> Eli, what do you think?
>  
> > David  
> 


