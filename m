Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EFEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knIg8/634584Ytue9vf6OuJG9Of4+644gUu2jDQuGXU=; b=Uldh/gWu7CZ4VE8dAn5RYi3Wp7
	3CVKdi/1xMK1kOfX4V6xtBKx/cbFzFhOpNCQ7LS7pcXMsQxJ+kY84V0zq7Op70Zv2Q9KbaW/L17N+
	t58z4rlsVzcx/3sqOSJRsaf4RGa3QpiN0+sIu7S+0Pcp0AVB4tkzwjG+3g/qgTcEbae2mFEKbFnk9
	cbaOKkxkhbfwzbcgEQAgx6IcV2+QEQxo+LeOMG9F1ieI3WGHNIPibUqQTbV5rE4Ues7bFDz4PpxRs
	70/Mpfy0pqXVC9KHgmodHtuPVgo46OACfSqN7W7pCMGCyNov33MVAqoSdZsFv++8lDQIsH5/QZTN7
	oOCeK9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0gk-0000000FBfA-3SCK;
	Wed, 15 Jul 2026 14:34:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0gi-0000000FBec-3NKC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:34:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47de0093c42so1855855f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784126055; x=1784730855; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=knIg8/634584Ytue9vf6OuJG9Of4+644gUu2jDQuGXU=;
        b=n3HOp1vOyIaQfVetaQKP45x1aKUZs1x6W0AgzhTbOGJdx0G1WM9uYzM2aKOyXeICTx
         zpiJiKJCU5QvqE55DfY6rs8+lznhK3USkbPeIhcQv75u81h9li0ix/jQwioG4t7Ijij0
         cAPlhDJPfh1QZlZkmygjA9dyAuPPMzFi159TG9uoGAVnQqMT8ixeEbtIx4bFmpiiMlZw
         OueZ+HHiCiSK0QHknfUMmP7molKDqUM441u6RSF4eTTFwBxiXdQ5lXGomzOx1SfozA2F
         pl8StZzbfl7MENYiUuf6Hr5KckdH9CwvwNVCf0eR/EJ4xWW9/MmFHuo8NCsFzoGqktIm
         WafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784126055; x=1784730855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=knIg8/634584Ytue9vf6OuJG9Of4+644gUu2jDQuGXU=;
        b=gzb+57n6JdzSbvkuY7soU1GZfJbN40frxZIMvpZTKItxYbu9QMJs6yXh0z0RoQuvUJ
         /QPK2NO1LiyXrbakRyBFkngwpqcTeMyybk6ndyel5WMB8WpUES9yBZEjbTabR4V7bO3J
         TwNg7klQWnMFzs7j1XlcLAtUXpWVZHbPJy04PC2D3a3X2JCzLxfkAJH4qVc+lNPcPUlD
         iJeI6mHKWDGnjT25u5MAh9cUaKBEq2rUmhr4WDy6RbYZSOhjAzr1BEP7MDh9OLtDwRnd
         /dw0eJdq8Smj1e7ougiWH9GlrgVujK7GDk6PjV7NRCZGrPHN2oaLoFHZgngIZOyKrqQU
         9blA==
X-Gm-Message-State: AOJu0Yx1SWJbicuT1IwX23DoXiEGaKVNBQWHuKkzbQ9UfIZecwh145Nc
	uV7UqUQlb5t56dB+l47fsPJC1J+HEtAMx6bRGBZ39ozgRDKPoBYuvgyKMpMFDcwWzw==
X-Gm-Gg: AfdE7cmOvepJ6WcPmFQRegvxjqUGqLl5nemrZTPFAR73Ph/9MB7+Ys1mIfQms0U6iku
	6ZRu3NpLn6Y3aj35NBWmTZ+SpcguGI01x9tofDcWXnCh7N1uVy/BqFjKZ3ADJ+ee8qe+TrdniT7
	v7FBzZJ36uCBjx9bgA7si0gJLIfZleR3s4UnXdW+EBzveZ3j6b6gatoVCHVFxc9KA+sdjBSqtLo
	QZvaQ+LghxXlLHkWvB41AgnKt//DLAAIwo2e0RjkwJOoOxCNFL6HfBiSKLxZzq3DjcsIZSdVRnf
	hftup7mpKcbRLqHVDobvpbLscyg4+EK6oIGcehiae3ESwYxBYKIF7RgYHDA6GDYStaZ8TvMsaRH
	zpF5TMr4A/yZSOVZ3fGxmgs4taSHQa3JB+7YJO0ifjqwwivVu7c+FB3tOb1smSV14GtfdpDhsQx
	X1Hd9mq7SR7XFmyzTvjtVKzoN6ST41Cw3hBogDhfSvGfvYh4QNZwBzeJfiH3HZoQ==
X-Received: by 2002:a05:6000:220e:b0:474:e0f2:905c with SMTP id ffacd0b85a97d-47f2dccb729mr19822692f8f.26.1784126054166;
        Wed, 15 Jul 2026 07:34:14 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a96cfsm17087436f8f.20.2026.07.15.07.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:34:13 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:34:09 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 01/24] KVM: arm64: Add a generic clock
Message-ID: <aleaYVz5m19veRjT@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-2-smostafa@google.com>
 <alePwq2eKV5g_7Gc@google.com>
 <aleVozZEcxiGE4Y3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aleVozZEcxiGE4Y3@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_073416_879508_82B77035 
X-CRM114-Status: GOOD (  12.86  )
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

[...]

> > #define smmu_wait() {
> >     static u32 window = arch_timer_get_cntfrq() / ARM_SMMU_EL2_POLL_TIMEOUT_US
> >     u64 timeout = __arch_counter_get_cntvct() + window;
> >     u64 cur;
> > 
> >     ...
> > 
> >     while (!(__cond)) {
> >       ...
> > 
> >       cur = __arch_counter_get_cntvct();
> >       if (cur >= timeout)
> >           __ret = -ETIMEOUT;
> > 
> > 
> > No risk of overflowing u64
> > No init necessary
> 
> It believe init will be needed as caching arch_timer_get_cntfrq()
> is much better that re-reading everytime. But I can make all of this
> contained in the SMMUv3 driver and remove this patch.

That's why I have made window static :) (well of course it is per callsite...) 

> 
> Thanks,
> Mostafa
> 

