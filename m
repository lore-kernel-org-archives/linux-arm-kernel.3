Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2402ECA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/F5K+TNyy2UgzuNElF3z3QNQRpGUcw1ZJkuRwiOyvlk=; b=PcbQUtqd0lu6yrcLP2X8N2CCfA
	//4PmetPNirIrP0fPtclAeceUodl3WmURmU8b9ZL9N0/yv0F47x31wmDbLir9KnbOmTVXdx9QD3Wd
	gEOllB1D7orYQJ+Ah1A2dKb6guNpzmtVUmoRtFnixwHvvuFuaOPt/V7jImq0ReIA0sbGQ6h/P0+Ut
	OcRNqnjGfQo+pJFUmqUCCxEKC4F668HsBSdaD+fZ0HOm6Eh1Nad+I+GBhF6uKzFTXIV8+ARGpA6eE
	g06kZUA9QXGtd2omaOSj7Y7yMBwFZ7LH8FoKfVgJIJC6Gpnb4T1oKxk/0UuyTBUTHjPLE/ab1T3cq
	fYQfDlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvZV-00000006Meg-2sFV;
	Wed, 30 Sep 2026 14:46:13 +0000
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvZQ-00000006Md1-0hfN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:46:11 +0000
Received: by mail-ed2-x0f.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so8692383a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 07:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790779566; x=1791384366; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/F5K+TNyy2UgzuNElF3z3QNQRpGUcw1ZJkuRwiOyvlk=;
        b=fz9QR/B/90xtt153i6DFzk/9CAt5COuKXC+sgDJ6yUTWSHoPoDeVGjdxLTGWF7NTau
         uvvmSYhrZTgIF+gvrfGKGowVO+vCPkM5W95nNR81AOuA82JVETpsxNl7Tt53XGPk/r54
         dVpnsaD6Kxus7Q6BrBBjl9MDQtlWoqLoYb4/4VciqHeTDCNLFCxUK2rqrPiH0W+Ri+bl
         dDsNwu8GoEq+5vEpGcgZbtQPz9xdMP9QiaE09+w4bxGOQGTEbbcY/hAQFgIt0euUjQUe
         fGaNw+ZaaxKfNPYqHSygfloMCNMEJUzkHyCtM7UbsGh9bBoRrF/U7ff93+kwy4bI6FNn
         cDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779566; x=1791384366;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/F5K+TNyy2UgzuNElF3z3QNQRpGUcw1ZJkuRwiOyvlk=;
        b=fe4420AgmOYZdR59ecwjlaqY3UGC6LM9XjC/+6vGUXLUUcu8cyttbhmTDUHLjIb699
         yerEcr4mdI0mV9A4ma3TSwGhTEQF7+O0dNu7LPVMeeRhkdZVz7PNgU4Etf47jSI9qoe4
         6V++XT+2qCdY0O4wtmWLSOZ07n5BFr+o4xUg3fc4KUIaMNCmH0HS0jDuU2JeT6I62d54
         lVUZRRYJNP7OntawKiBY4hGn9hUkxOfGvzDMb6WrbAxxV9UeeIuGEEtYbMQcSvuU2OHZ
         EgBqqXv75Owfy1IgUjGzlkhc6S9CPeR/Qj3xomVRJUQzTmAU0Pt9OMgy1dPd1pxG0rBX
         uL5A==
X-Forwarded-Encrypted: i=1; AKwUvBwJTUrtGSe0qPIDEngJwc0FALIwPHnq5hF+cV7nXbHphtSLJfDRv8H4CcwiLpPtXKlWotZm8XdK0FfkdN8Ti39d@lists.infradead.org
X-Gm-Message-State: AFq9FYIXE63rprf2D5xIW+lFo84znQxCc4NniCrIpooUKR6Ss6ZDn+C1
	og9ZE6vPW9H+7iDwV0mXPYWCxBPd8utjgYOIUqnzO2vx53WMj3Lz1zgB
X-Gm-Gg: AYBFou0UCYccpzNzOk5GQ2rKo/SbT/Bb6w2MKIseFq/wd5ibhqJy02k7U20STXlJcRU
	pJy7dqDg9EPCulRCn9CjDk+ADldOu4rSnfnEcn2XxEuCTC/FfN4VMVEup8A+57LUskdjKhy3l6q
	foErNcsgkf3ot1tXbhfgsxIwnm+DB8bJQLJs3fD4HRCXD4L6otqlw+xn+G9T3eUDJbzdrLnhh1a
	YvPMsNfHjSD8KTy7PoXV+AlACTkR1SAWNG6J23gI78MlceYml2V3YL45CLYXHN6Lu5KvW65c3zZ
	w91LTSEE/cjAmWDwNoTA0/I4PeGTqqml7OmlZ8k+DO022UaVob2CLiUHno8eYw0+DjMmpbtm0Ya
	ZNBWnSpgZMluG4XvJME1a0Lez4ycAjNtw7Ly8/pWBlI1d5TbjqmWgOFMqRgjYgRE9D6iC3J4Y87
	46wryM0VcEQRDZBfG5OE6D0NTu+oQ378LZLqPoa+bjWJ2mAw==
X-Received: by 2002:a05:6402:1d54:b0:6aa:734a:a084 with SMTP id 4fb4d7f45d1cf-6ae198f00d8mr1300841a12.27.1790779565320;
        Wed, 30 Sep 2026 07:46:05 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1569b42csm924295a12.24.2026.09.30.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:46:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 30 Sep 2026 16:46:01 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com,
	jiangwen6@xiaomi.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v9 08/10] mm/vmalloc: extract vm_shift() to consolidate
 mapping shift selection
Message-ID: <ar0gqTEf2flG1TQd@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-9-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923062832.479455-9-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_074608_259031_AD541C23 
X-CRM114-Status: GOOD (  17.51  )
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

On Wed, Sep 23, 2026 at 02:28:30PM +0800, Wen Jiang wrote:
> Extract the vmalloc mapping shift selection from
> __vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
> vmap batching path.
> 
> No functional change.
> 
> Suggested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---
>  mm/vmalloc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6e0dec73107a7..a43965016eb4d 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3568,6 +3568,14 @@ void vunmap(const void *addr)
>  }
>  EXPORT_SYMBOL(vunmap);
>  
> +static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
> +{
> +	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
> +		return PMD_SHIFT;
> +
> +	return arch_vmap_pte_supported_shift(size);
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -4079,11 +4087,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>  		 * supporting them.
>  		 */
>  
> -		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
> -			shift = PMD_SHIFT;
> -		else
> -			shift = arch_vmap_pte_supported_shift(size);
> -
> +		shift = vm_shift(prot, size);
>  		align = max(original_align, 1UL << shift);
>  	}
>  
> -- 
> 2.34.1
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

