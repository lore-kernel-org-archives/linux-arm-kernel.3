Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62475C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppwxYptxUoJTBAvtQNONLY3e8TNhsTgMXgKzmUOztsk=; b=xLufHfBBFAD8WRJ6/3O5rpGXRb
	e9BjCjWDnMUJMcZvYFmu/4u2gCFAdWW/DyNozL/tMaYATDUBwMxlsYHbnv/PCNymyr+jDw6cCGlfi
	zow5zEaOjXhT7hq24tknvhVYKgciZhFwgBAk2UXeOKBDJ3OUwDxpHeeyPHZs5vnR7RYtd1tguaacf
	o83oGrCNu7KmYOZ5vQKKkt06pRZXMSPhU7AOpFGLP/0Shl/dtYdpBeP6F3hlw0pEJ1cSf/k6HQiaI
	l5w1DnfcaBJbBloLezJDAN0oiRtaAva0bxoqcz1RrPD7UqjJQkqhWvGX3TEShQciAIgbPjALNK3h+
	nwcAlepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5c3-0000000CHpt-3lbK;
	Fri, 28 Feb 2025 19:01:31 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5VZ-0000000CFkL-2RPi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:54:50 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abec925a135so322947566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 10:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740768885; x=1741373685; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ppwxYptxUoJTBAvtQNONLY3e8TNhsTgMXgKzmUOztsk=;
        b=rPrx0vZN9khXisWbRRd1cJcUqzIi9y095E6WU/+PIsb+NQhfPR9lmMb62ERiCWOc7V
         W08QPpD+5tufv4ikjBw6Tuoeuh+Glyf8FaSoUduJirROK53yIvAq9PfPWGP587xZg9nD
         lwWidtau2MynuivMcX1hz0I+2gS5s95J3rG1YxWN9oLl1rY/okqEN58DCkdcnmYUqe1P
         ElU6rr2jcMxiH0TZI69YhSGyQXuXnX8ltcfM0A9kWZeJ62TrDhP4LsRkDkbzSn919K8l
         L/k2YDVpCpNIBvFHOp6K/h2H4Y0Ojg4e/xW90ZTXZa1e9JpGD20WZsiyWICe99hyOq0M
         bSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740768885; x=1741373685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppwxYptxUoJTBAvtQNONLY3e8TNhsTgMXgKzmUOztsk=;
        b=jRTFB9DfmsSNv3BLPaQ6eOh6VDyegOhBRdfBJOquNo/RNKLWE3Xp3X3Luf3DN/leXX
         75TBnN67zJGV6QmkJKcGqpfZ1mJYo1YDEtUxoVUE5SskwCzFfOsYkscGFe8WG7SD6NHf
         LQR2sr8aKpajx5iS1MfysBwiwbTv6QsaaRt3jt1qZwmRmnT81LcEl6zbDLYOjzv4Mh5c
         HCx5UcKvAfbSY1QSH5YLAILyLhmV4REh52CMhbcQGKrarFssX5ahb5tV5yuvQxhGcaKB
         KSnmeygjwp8WmYj1XpXT7FhVpfaQoejj9s/lIrvJNXvUFjkGP8s1fM6ARSEthrhpLoeb
         1sWw==
X-Forwarded-Encrypted: i=1; AJvYcCX9QG9rkdOy/zg48toa//a4Seturby/yCz8KxkclD5UX+m1ftT3WsaP6+iA10fTK7p89mNZykIjQsPxsY+lcrb3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8gy2w8fDOvDajAof81B0R1H775RpR7avx+5uBiQDv/q3tWrCc
	vpJmJolWauLLUot/ZdW5xCeEhQip59Nlv3VWhQsSrPm2tYtJO2z+6u8F6OqKQA==
X-Gm-Gg: ASbGncsBTVLCIOIKRFnxuDxJxI8xD0AkryYn+s3HGoPJdvyDSo2n0i897ah0abI80Yg
	tzpKRXIFAIoeYOAVWgteNefEDVjI0J1rG/fbIoir17bIy52Ld1ObD0FpDCHB2tp4rZgqjs5JKiD
	F7DuP+WlLuxM44ZCG6OUrQ6khaM4t0ev+lh7988p1hEl+VCRSkvzxqqJaGm+wLGZ9WVnH4DZ66I
	FbAnf2ynIm0YVndzdxZbwNrhzplmCGgTlOS4zQmIqI7XfvA0+88qXJ2mvWcUHkfm3V1eqXvTa9L
	ZYBEdp22z5AbP89X5CQ4d4mktR2vOBTlc2z7XpSqADyawmL+U0BBebOPSbszD/g=
X-Google-Smtp-Source: AGHT+IGRZqJXTWPcNybDnAZQX/clH2G/w7qq2Cr5221PpPPsrD4hU6+CM6oIxOZll7K724ZB2dG1Dg==
X-Received: by 2002:a17:907:7f94:b0:ab7:be66:792f with SMTP id a640c23a62f3a-abf26837d32mr566881466b.49.1740768884775;
        Fri, 28 Feb 2025 10:54:44 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0ba408sm331183566b.37.2025.02.28.10.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 10:54:43 -0800 (PST)
Date: Fri, 28 Feb 2025 18:54:40 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 1/9] KVM: arm64: Handle huge mappings for np-guest CMOs
Message-ID: <Z8IGcA6h6hZx7ujh@google.com>
References: <20250228102530.1229089-1-vdonnefort@google.com>
 <20250228102530.1229089-2-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228102530.1229089-2-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_105449_636201_6406CB85 
X-CRM114-Status: GOOD (  12.22  )
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

On Friday 28 Feb 2025 at 10:25:17 (+0000), Vincent Donnefort wrote:
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 19c3c631708c..a796e257c41f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -219,14 +219,24 @@ static void guest_s2_put_page(void *addr)
>  
>  static void clean_dcache_guest_page(void *va, size_t size)
>  {
> -	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
> -	hyp_fixmap_unmap();
> +	while (size) {

Nit: not a problem at the moment, but this makes me mildly worried if
size ever became non-page-aligned, could we make the code robust to
that?

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

