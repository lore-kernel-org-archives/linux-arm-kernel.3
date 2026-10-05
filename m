Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775B8CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 07:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Anf5KHHXmIQryXJL7OjihtFBWm+PJQaijP7bg/SprY=; b=0m++ITPqeacpt+gcdCMmQ9sZ/Q
	IbSkZwoHNfRoKM0M/fpk23/r14M183Vio5yY6PrYGp1NQ3Vq5eyEA2O6jlkEJvMMrZ8ZJPkeFuWl4
	O2naIjus06kj1L27D2DJkI2gPVlOX/ngdSARgONzI91Ru7Dtq455KzIqnDR7HKTm9m4aWC3GYQJiS
	LQ+s3kgcIUib6xoxPvgbYpVvhs3vxdOXpjKrrVbusloRYMKSSCtzR6SDl0g/EM9Z/ZGiUCa/ZoeXL
	jenW22i9A2ee9Xe1cuV59k+jp0l9lpEql/vixDQT/HjfFCDJwXT9Kz1SPruF2yiL3wWAtDPo5mnb8
	8o7TDteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDd4N-0000000Fn1q-3lPa;
	Mon, 05 Oct 2026 07:25:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDd4L-0000000Fn1B-1Xne
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 07:25:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso7538665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791185101; x=1791789901; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Anf5KHHXmIQryXJL7OjihtFBWm+PJQaijP7bg/SprY=;
        b=uyGho0yqIXqhusj8kd91Pp39UWJU2QZ2dNblD3BzcRb5HfHkwOhe25+SP6LPFSkQzW
         nMwwd6dNC/cLkkwyomYGO12AbyX63fhryOiIiQNFmjQv1qUd24lisS1krOsSvYMAZ8bl
         m32G3WR6DCmBFk94Hn/qpTLQxD1EmuMqjZyMvuRAYlU8150j6vjNCzfi6iuHAgByvPsB
         b0VV6laZM2Lub/ehQ+SYMEgtiyA0zPbPwt/u2WwV2mSl9DchQklVx+xe4BgInXqINfLy
         sHaPi9+FZTs1wIFfecp0F/leQsUdJgO9IgT9F1RRXyFvN3aHSyE97YPqvytGfwOcG6nc
         65Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185101; x=1791789901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Anf5KHHXmIQryXJL7OjihtFBWm+PJQaijP7bg/SprY=;
        b=RwxRyIjSegxkkrNsbTtx3JTyEwO2v+afnShTFp6tpEhdCTxBRUlNpHPoV1Zw18Zijb
         kxIAb5zP62kj/Z8PyI4jxYp4A1vMx/QivgFWrE7GNPUqVMWcIn9Yo7gAjbIkhQyp8Rd0
         OeiH1ChaQ2MQ/AMweO6bon7eDy/28IW5V+E6m4WaybWjWIbwFIqNdpoqD+lMX18f0kh4
         /7lefxMwiOJDUXgardE5gM+vd8I0yemnykBwxLA5HDCNx1wLl6b/9BcWr7RZtWbbb/9h
         BmBSHuzGcqNU0keLM4asGhijLhUsbtx7dfCEU++QfU8qTOSK+YFaiGIaya5T3lcHbhWB
         z8lA==
X-Forwarded-Encrypted: i=1; AKwUvBxmnRoeg/lTgVjHaozzik6yQb9LzCqQbTc5RxzyTKKnu+K5Ko3XRouJAFZt+DvVumuCbJSgsWjnRA8lGO8aRyQC@lists.infradead.org
X-Gm-Message-State: AFuF++nU7FKzTywgcFvSaGxu7Ecbkyh5G5ZDrogyT5Tg6kmakTTL08D+
	gz8bttY7RpOXUjx+rsUk4gvnfWECJMnNgxojRA4uIizwwsstms0oACxCouU5vue+XA==
X-Gm-Gg: AYBFou3xd7eO/uj1Numtagq62j9avaJRjuYAi+ijz/ywN6cQbs6ET3TlKU7YS43xqFh
	99kg7GbIt497vMP6xHd3f+bZM97wcfrVE1RsnOLFozyt0pmT/0dH/M/w6Ncb/mQZDAc378I9ZDB
	66iCB6jjTxerAgDkALq4fahEsc4kIs9uQSJ/RqwUni8g75UuKLAmuWkwBV0cRqtYOMsWfJFShnw
	EFBHa7OmZB1uBxiF1beVj7hxwnpERh9Cir+MoS41qst97F5zn90i7/qccinPY8zGWH/DAct4CUo
	0Ytvi7hOsY02da6A6BeA/rZAKtfoKlTzCuwPxLDndHNVsfbZcPOSZLnTxTIv4mzpD7n90IiByD/
	UBRt91kNn8q49VD6k3M2E7uaJUUoAcXjEX6x2f0deZIXgBUgSWmXE/FpAjV2rTFOx1ADFzhOQNw
	5qwziE0rJFiuS/ELn+CVxPEUiXORTHOtiamdZ9HQukKevOfw+RJ8PxPFnzWnQYg7ghwE+WJD02l
	kg2+xzoclfg3POppoJ/7fdVNvI5tDYp2/F2Y8QH+Uw=
X-Received: by 2002:a05:600d:8645:10b0:4a1:7366:6c7c with SMTP id 5b1f17b1804b1-4a173666cdcmr14240555e9.5.1791185100477;
        Mon, 05 Oct 2026 00:25:00 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c63904832sm1218489f8f.14.2026.10.05.00.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:24:59 -0700 (PDT)
Date: Mon, 5 Oct 2026 08:24:56 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	kernel-team@android.com, fuad.tabba@linux.dev
Subject: Re: [PATCH] KVM: arm64: pkvm: Drop keneldoc markers for the
 allocator structs
Message-ID: <asNQyNI6nPcNuxwm@google.com>
References: <20261005072046.2246900-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005072046.2246900-1-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_002505_425474_E9CC2C6F 
X-CRM114-Status: GOOD (  18.47  )
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

On Mon, Oct 05, 2026 at 08:20:46AM +0100, Vincent Donnefort wrote:
> chunk_hdr and hyp_allocator are private. Their description is not
> exposed to the API documentation. Drop the kerneldoc markers.
> 
> While at it add the missing description for chunk_hdr::data.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

I forgot the relevant tags

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610041002.Yvw5qUrt-lkp@intel.com/

> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/alloc.c b/arch/arm64/kvm/hyp/nvhe/alloc.c
> index c1881c0011c9..e1e6dd21cda1 100644
> --- a/arch/arm64/kvm/hyp/nvhe/alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/alloc.c
> @@ -28,13 +28,14 @@
>   */
>  #define MIN_ALLOC_SIZE 16UL
>  
> -/**
> +/*
>   * struct chunk_hdr - Chunk header
>   * @next:       offset from this chunk header to the next one.
>   * @prev:       offset from this chunk header to the previous one.
>   * @__unmapped: Internal field containing the offset to the unmapped page
>   *              boundary, multiplexed with the allocation state flag.
>   * @hash:       Hash computed over the chunk header.
> + * @data:       Chunk payload.
>   */
>  struct chunk_hdr {
>  	u32			next;
> @@ -45,7 +46,7 @@ struct chunk_hdr {
>  	char			data[];
>  } __aligned(MIN_ALLOC_SIZE);
>  
> -/**
> +/*
>   * struct hyp_allocator - Heap allocator
>   * @start:		Start in the allocator's reserved virtual address range.
>   * @end:		End in the allocator's reserved virtual address range.
> 
> base-commit: f0406245cb9855e6318335a8a223551354291a46
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 

-- 
Vincent

