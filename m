Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75757C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDpmek/X0kwpQJH4VvCCmLBAuzVkaDGKXNEK4ox1gYY=; b=110Iq/7mjR7Ggj2TjiGaGRFqHp
	zhY1E/tdy3B9CGv5cX2Ay9dj+zS9D0oVCeTb5k07T9iuk2rWSbN4ppffBRPHfAwYlu1X5Cz/w3MZq
	Q8J2aijCZjtGDm6AdLrMUWBbbzpVM9TO5AldvBywAB6/553fYs26jgIx1Yv/oowerSjL99J/wPcNb
	C7sTAcH34LHI8q8hGwu4OGFTvExhfZbQj8qIBzmtYZ7CfTDCdsbNLomptFXClDGXVVhTs6NQ4FdUX
	bNtrDzl9hAvlinhySPQq3pHILHvofY58gqoe3hBEXb+S48R90lfH3vxg/RMXojFVj48Ezvu488MPN
	01qCb87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LZc-000000094ew-35uV;
	Thu, 03 Apr 2025 14:29:40 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LUT-000000093hT-3ncp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 14:24:23 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso1566978a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743690260; x=1744295060; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vDpmek/X0kwpQJH4VvCCmLBAuzVkaDGKXNEK4ox1gYY=;
        b=oLneex1IeCcoFjdHNHcfVm1S1zkbF/OGgcooxAeMlpSzUAm4MCFkHOHLSpKA31U0hH
         TKMgM79mLHPVMNIxe+6YzzixQGe4RNynX6zwa9Y7IHJSAT5W2fG6I7F+8SDYwb1mYPGE
         INT2vcPJayZUuXqTBFEkzEQn5O5kRQXKMyMwqzz6RLPdsjoICJCwOElfDW1f7JUJZx9o
         NkWfxrEt4A8sIfHRuGbVTIIjU/raPhfOvpFgtZZQw3sQisMFMW6qcLPayh9t8imPD6Mf
         o+NqUi6Db2gmqZpci4pyRHiNpJzYBt1eLrpXH266zszpdBNmi8A2vyI6SkfO3UxIiyVr
         ExxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743690260; x=1744295060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDpmek/X0kwpQJH4VvCCmLBAuzVkaDGKXNEK4ox1gYY=;
        b=Yud5o5dg4/f1iGSSun9+2gR1KFn6/aKBEE6ME95JyJF27IO3Hv5rq6HWTNq4QLytrE
         kfrjJH5vRwu4yc8VjRi2hJYLaHQRE2VUaCW1qqpifBIL7QAp81hFnsiuHi+6CyYdEVjD
         J+07vqmVYhoA4VYzyya9kPHz7lm5r+qG4+UskzwQqY2hSU4GIE687feh2ApKlPHmLCiY
         kBuslm5LyE9vbs+wNqOFPpWx6Gpe4VWad5Q3DJxlwkL1Ccf9Stf1HxLKVJ+wBOYNq18A
         oT1gx/djU5GNR0bA0/2wBY6FnrLp14G+rCWjuLfwRRc4NXPLMn4UtasGsUip/ABcm1j8
         JWjA==
X-Forwarded-Encrypted: i=1; AJvYcCXPMUG4THaQQQMDXXq67n4+iiPmCk/VHHaHHEhdp13OSIjraQq7vwt66WqLTG3LV5f1eCLqYLgQRtLMebDPWLIT@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ3sl60HnZu3+zjEJT2mfNDB/aYimYCRpih5RVC7vXnTgZl2ul
	pIfLcbeTzecVLmPZVvyWvrk1kQiic38t6iXIS6kmk2w2sCNjVc8jO/ystVSg2A==
X-Gm-Gg: ASbGncvtCFkiP3u7DIGzHThV4Rr6A/J6z0/jG84S8uZ2UUDW6lLsbPfr8lLEWuqngig
	gCxiO3u+MihbMwR2ChvSC/R1EeNxrz9UGzKkhm93OH5SPmVAbod8q2zzVf0//z/RHVrg+0h5dYN
	W6ntoWHoEIRXludW9ft1+VMMQ96WXCh7+qZJuO6I36JNKUNaBH2PByv9kXbtK0nqon6DfbPcz70
	ar6vpmPaAys/TOsWgkuUVsrAD1f6asD+nLKMnuLfTPlkMQPfNN6vpTFfCGEHT/2mj7MgOflbdRs
	f791X9vJe8qfOjcn6o/CVk3+YA/K/EYoT/qwH/ogAoeDuTQie916tm+yKtR5VhkE6+S/dYlGztp
	Q3SW/D99cwBXFAYRP
X-Google-Smtp-Source: AGHT+IGyNvHXBQg4ozO8/+QSZISlP/oFpgDXV5BJWgExW3afo1HCSCPDBCsyR32+joySAgPe8H3f4Q==
X-Received: by 2002:a05:6402:3204:b0:5f0:82cd:500b with SMTP id 4fb4d7f45d1cf-5f082cd5216mr3828226a12.19.1743690260100;
        Thu, 03 Apr 2025 07:24:20 -0700 (PDT)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880850f2sm1005128a12.59.2025.04.03.07.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:24:19 -0700 (PDT)
Date: Thu, 3 Apr 2025 14:24:16 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 1/9] KVM: arm64: Handle huge mappings for np-guest CMOs
Message-ID: <Z-6aEOQlbfh_q2Mz@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-2-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306110038.3733649-2-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_072421_944108_37A91856 
X-CRM114-Status: GOOD (  17.29  )
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

On Thursday 06 Mar 2025 at 11:00:30 (+0000), Vincent Donnefort wrote:
> clean_dcache_guest_page() and invalidate_icache_guest_page() accept a
> size as an argument. But they also rely on fixmap, which can only map a
> single PAGE_SIZE page.
> 
> With the upcoming stage-2 huge mappings for pKVM np-guests, those
> callbacks will get size > PAGE_SIZE. Loop the CMOs on PAGE_SIZE basis
> until the whole range is done.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 19c3c631708c..63968c7740c3 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -219,14 +219,30 @@ static void guest_s2_put_page(void *addr)
>  
>  static void clean_dcache_guest_page(void *va, size_t size)
>  {
> -	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
> -	hyp_fixmap_unmap();
> +	if (WARN_ON(!PAGE_ALIGNED(size)))
> +		return;

Nit: it doesn't really matter since WARN_ON() is fatal, but that return
looks a bit weird -- we really shouldn't return without actually do the
CMOs. So maybe just WARN_ON() and not bailing out would be clearer.

Either way the patch works, so:

Reviewed-by: Quentin Perret <qperret@google.com>


> +
> +	while (size) {
> +		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> +					  PAGE_SIZE);
> +		hyp_fixmap_unmap();
> +		va += PAGE_SIZE;
> +		size -= PAGE_SIZE;
> +	}
>  }
>  
>  static void invalidate_icache_guest_page(void *va, size_t size)
>  {
> -	__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
> -	hyp_fixmap_unmap();
> +	if (WARN_ON(!PAGE_ALIGNED(size)))
> +		return;
> +
> +	while (size) {
> +		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> +					       PAGE_SIZE);
> +		hyp_fixmap_unmap();
> +		va += PAGE_SIZE;
> +		size -= PAGE_SIZE;
> +	}
>  }
>  
>  int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
> -- 
> 2.48.1.711.g2feabab25a-goog
> 

