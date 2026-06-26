Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006BEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 16:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tKsbGrcR78zcHbLWs3JHmwiHpOL5AjwjOIZHc1xSi0=; b=43Ab96VJFWQ5sREpFt8XANfWx8
	RoZM4BOSGhdj2rMej2ykSRf9bdjkhfg3XYLC/Y96yMeB1yt9T7Fb/lNvg8t+BPXRxWjw562xVcZSP
	NIr5VUiNz2C5USi/WoLcaLMWA5GZsK2x+ol4MuMYXwM0r18FeywF88ZonT9msqjUUVEgO86xh9sM8
	+deMPKp/feaXTvT/jNW9RQOdaYX27/Qf2WYqORyyAIZSSV/ekFGg9QAtw/n1kZBK/uL3FQjmTtbY9
	AqxlMtQNYWRLRPwXoSj6bSiGqwjIwDMPL8QrvBPzpXK2apf4mFy64sAmrBj3Yt6zrPJiX1fCCdt3C
	4xFoaQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9IL-0000000BcES-1ZiJ;
	Fri, 26 Jun 2026 16:20:45 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9II-0000000BcDr-371k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 16:20:43 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5ad58f31846so1057652e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 09:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782490840; x=1783095640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4tKsbGrcR78zcHbLWs3JHmwiHpOL5AjwjOIZHc1xSi0=;
        b=P6ZEjTG6BYSyr3mbEY3QVPzj3R61OdwydN6X9q9WPLoG88bRLy+Bmqy5YMxFjj1v6e
         spezGkt1T6w47AeQ391u6h5SY+3h4L9+RHz0ok6b0s3BKkNwQ7HkrzahhbQ/EaKqu1Mb
         O5tIOknkVTIdRKoePbEeksSWLQfCf6KJcXGhQ8Y7gMeCiBZU184b4YJJaQBfMaQvok6g
         /z0wjdZLrb+4CIhWHSaWtWpEwyUw2IdBQsAheFSD+KA4bGD8rI0/IDPeAUBEAfSLV/e1
         NWaXx41VCEZEFaYgizqebxI3ZBqxMyoaxmz8m43Q2+LhgsE/Akl6/SVA6aYoSZO/MLjG
         ZduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782490840; x=1783095640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tKsbGrcR78zcHbLWs3JHmwiHpOL5AjwjOIZHc1xSi0=;
        b=kIc4qYovjAg9uuJdD8RSaBgurtPbYSQg1XCqnnyDdLitLfbR6lZKRHsiXVMjT/qNoM
         +ErgPz4hLdJzBAW64b3ndik29R7jvFAJvW3HtX3eU3VYkN32hnAJKDV0zlDVturl7pZD
         pAhQvnqEYNsAYByE9Upn8/PDzUlK/f9fd55b6FTsB/2lUSKkHQLXSibVYlM0VuF0jUMN
         ZVibXnQNyVbBgXPo4bPbd1tnJPoo/iPCWUmKmvsehzidSbce3ctz+bMC4VyISNtsZ8l5
         pE0xNOeTVciVI2+4uZVZCLJOIMNZPvjVUN7TjPot42WO2qUeeNNGLiGQsb75BGiLuisM
         72nA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4501dHHVtiJRJaaBsWWvohKL5IssHiG6Q9UnX/FRYuLapRE6VzMmjPeWFLhbn9mPGma2BWpauFniCLE5KfgyE@lists.infradead.org
X-Gm-Message-State: AOJu0YwkQijRZXp/Sgy1iKAlVejV3BI8CXmO+6R+9p+90e4E2PcT/wiQ
	j2ThhYiMyNTW+wRwGf/ron5z/qFNLKrdMhv9Unu+UiUABNs9k8+3TZWF
X-Gm-Gg: AfdE7cmRSJrsxVQtQaQo6L2i6HxzNtwxSjk8pTxP74+ixeehSnyvwdgz/M+1klaUKSd
	qZV7oQ3/RxfMC60+EgyAe9kBDmWT2LBOmKmnTQwpOeudCUvbWMx936CJz5ng7RANmSaqgtQHNW9
	d1iVxeLVKlFI0zK+ppJRdtyr2xkLE2kiedF1dC8XjusBK3tiKVR013liqS1YP958ny1smcMk0li
	m5ldVsOesei2S+G3t4SB2xSL4a77NBHsNincoUghIfsXeLTUaZl+/L5Q5byV2BmWycRHVhr1Vsj
	h1ShxvIf4SfnOFali355fNul5pNTd96sIhmCN8qohNMfPMvbp6hNm30f65HHLpq/HUNcRr2rA/V
	ixto6bZvcKL3OdzU6wVz+uTfb0CnYikjckfnv79cu6zUGu63fb8iQFA==
X-Received: by 2002:ac2:4bc9:0:b0:5aa:71fd:de75 with SMTP id 2adb3069b0e04-5aea94adf59mr297281e87.39.1782490839450;
        Fri, 26 Jun 2026 09:20:39 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69550ff7sm3611804e87.20.2026.06.26.09.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:20:38 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Fri, 26 Jun 2026 18:20:37 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com,
	dev.jain@arm.com, rppt@kernel.org, david@kernel.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com,
	shanghaoqiang@xiaomi.com
Subject: Re: [PATCH v4 6/6] mm/vmalloc: align vm_area so vmap() can batch
 mappings
Message-ID: <aj6m1cFUTlr_DCdj@milan>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260618084726.1070022-7-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618084726.1070022-7-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_092042_842010_3934C2F0 
X-CRM114-Status: GOOD (  21.32  )
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

On Thu, Jun 18, 2026 at 04:47:26PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Try to align the vmap virtual address to PMD_SHIFT or a
> larger PTE mapping size hinted by the architecture, so
> contiguous pages can be batch-mapped when setting PMD or
> PTE entries.
> 
> Add __get_vm_area_node_aligned_caller() as a wrapper over
> __get_vm_area_node() to simplify repeated calls with fixed
> arguments.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmalloc.c | 37 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index fffb885cb2158..bc9fa93e2bdc6 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3628,6 +3628,41 @@ static int vmap_batched(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
> +		unsigned long align, unsigned long flags, const void *caller)
> +{
> +	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
> +			VMALLOC_START, VMALLOC_END,
> +			NUMA_NO_NODE, GFP_KERNEL, caller);
> +}
> +
> +static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
> +		unsigned long flags, const void *caller)
> +{
> +	struct vm_struct *vm_area;
> +	unsigned int shift;
> +
> +	/* Try PMD alignment for large sizes */
> +	if (size >= PMD_SIZE) {
> +		vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
> +				flags, caller);
> +		if (vm_area)
> +			return vm_area;
> +	}
> +
> +	/* Try CONT_PTE alignment */
> +	shift = arch_vmap_pte_supported_shift(size);
> +	if (shift > PAGE_SHIFT) {
> +		vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
> +				flags, caller);
> +		if (vm_area)
> +			return vm_area;
> +	}
> +
> +	/* Fall back to page alignment */
> +	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3666,7 +3701,7 @@ void *vmap(struct page **pages, unsigned int count,
>  		return NULL;
>  
>  	size = (unsigned long)count << PAGE_SHIFT;
> -	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
> +	area = vmap_get_aligned_vm_area(size, flags, __builtin_return_address(0));
>  	if (!area)
>  		return NULL;
>  
> -- 
> 2.34.1
> 
Did intensive random mapping/unmaping, so i have not noticed any issues.

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

