Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DABCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lCUuXDcwuMuvkw++7nOHtFX8FGwzsSx+p3o4zIoa/I=; b=2sxgKLJb0xW8wrgey7mKboKVve
	aM3RyP+jNmlyzQ4XIxbRB5o+dJDF1UwIKPZibOotUUO+csNvnUi+QGCNl2lLkLSp52vBvTs4IgH5h
	GBw5OuWAHhLpObUZN+9ZgEEYUYtTfi/a7mrj2dqJuw+AS6FAIJfHVY4zKvKpmaqBIWRq9O2izDRZf
	+yzz2/ZJjwBsUV0Adt7Rg58ddVp0JxtZHMvkNqRO/DLHThwAqjQwkEKDpaOTVdEq7N5yU5DrH7hF5
	MO/MtIEExxakIWwZpHsyvl430SH2bKI1CV6BUMBcQMCa6C8thQxQ8T8/aiRn2dUTa/d48MyELa/uA
	+rqbO8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdmx-00000001E7W-1f6C;
	Wed, 06 May 2026 15:03:51 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdmv-00000001E6S-3bgJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:03:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43eb05b1875so3528432f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778079828; x=1778684628; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6lCUuXDcwuMuvkw++7nOHtFX8FGwzsSx+p3o4zIoa/I=;
        b=O5KsqXhBOJQm7RZrqZApcs53l6+QRNHorLSDUpy9eA0IqF7khIhA4rUjSpjFQDh1ng
         CBrNAg2GdmmJ8xr5c4URBOozHLZrTUOBwdSKF6sKmj3/itIPhBmQDVLv/Ifvz14vT/2b
         RWeeaIdgd0w4A+4Mr0KF70POTLZ5MXVL0zjUb7ARcnOPvXYKTGthO3ig4EC01k1DRNg7
         A29AYD5SGQmr95vtF80+NhTxrMOnWCgf+WryfmbjMc5GqB5CTyI6CP8vVOHRILgwQshY
         El5ztwVedRlXekrM8lx/kno1Cc6vkyH83/qjRoWxI1JhXuhPrt2v3NHWCDgne2tUBWj0
         dhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079828; x=1778684628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lCUuXDcwuMuvkw++7nOHtFX8FGwzsSx+p3o4zIoa/I=;
        b=O3ubQCBAbg2ib3LXTb0YHHYeZhAVgLEwhK12Kz5/tCtbaywOjhsZyJ4a1Y14hm52jM
         JWqiZ9/xrzke7q12wnMyfnHJ7gp4wT4JJyf2cACe5FxusyIkUAXqNi084Jgsr2wPYTwe
         jQF9uVlsYxzYUCoZ1vuvLcp0r1nJAE0hu85JAgFZmEyx4iMNX0WD2DimaxdXOXGR+IOz
         IussGyUfL8D8FiT2YzaOUN0sARAoPCOrUuLqnsaUO1Fky4CHdvWHDgraT6Xpaear4439
         RKATAsfsPxDk11GznF1ale95zXHs2VJyYbu2uhaok1wvPlVruZ/LhJJsQKLl1HrXrXMt
         dp9A==
X-Gm-Message-State: AOJu0YyprhZ8WZJjvORjANE7DJEhWrhtHiokkqGGwpNmHp1hoE62M83F
	l7EnlgD5S1bSKtNcKp8X6AHRWhUJBG5jiQrI0oZpTMk238taan6xGtunU9iMVTZUFw==
X-Gm-Gg: AeBDiesSkb7UE15MnqIhyi0nt4apRpx15XBbahpknP6cR39c31EEyjj/O+gVEJG6HvD
	PvQzrEdNvole5axbMv1OoGyaod8vbKsWCZp3DdyeTqIpq/GQKvTSpxE4w7+Nh6xWbAHrNkdOtpw
	C3gmZ32iJiq5qEE2SfJYqE0PZ+Z3kkNOET0bBN1zribj0ZU4w/xpmd6fkN3oOi4QIY8piw3Ts9g
	9eHH00wvddFNobugKQ6I+TUlYRadd3qFp9naPjWJP0y8q5UKo7Eu2bcbXr2t8WCuHTweIqwd3JP
	0INtr4El703sdH1gWrGCEbMfo4tEdTLfkMDDplEl3c7AaSf73MewaqxJoMOEYouqKC2xcZOR6XK
	FKgDlbFC+tp57UgVegCnFNopvfLG7ihNopKFTGTmRo1GwBZKm/N2rIbBW+rchOM0zhgk6FBEDLC
	h75cnuCr2cK7nZILcOqsAzHXID19JPo2ZXRC6DUMP7ihhRajm0pm3RjIP7+VeNUxnc4lF7CAKcD
	DFqpLESELu7E91l
X-Received: by 2002:a05:600c:3e8d:b0:48a:6268:18a9 with SMTP id 5b1f17b1804b1-48e51f32797mr69446495e9.13.1778079827439;
        Wed, 06 May 2026 08:03:47 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-450524834eesm12653531f8f.4.2026.05.06.08.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:03:46 -0700 (PDT)
Date: Wed, 6 May 2026 16:03:43 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, tabba@google.com
Subject: Re: [PATCH] KVM: arm64: Harden clock for nvhe/pKVM
Message-ID: <aftYT7BY_9ZdGxmA@google.com>
References: <20260430103724.2151625-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430103724.2151625-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_080349_907365_961FDC9E 
X-CRM114-Status: GOOD (  19.56  )
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

On Thu, Apr 30, 2026 at 10:37:24AM +0000, Mostafa Saleh wrote:
> Sashiko(locally) reports possiblity of division by zero and
> out-of-bounds bitwise shift in trace_clock_update().
> 
> Although the clock update is untrusted, we should at least have some
> basic checks to avoid the clock value getting out of sync if the host
> is buggy.

I am not sure about the gain here. The host can still write values that will
make it out of sync anyway.

The timestamp is ultimately fed and read by the host.

> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/clock.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
> index 32fc4313fe43..a7fc61976fd0 100644
> --- a/arch/arm64/kvm/hyp/nvhe/clock.c
> +++ b/arch/arm64/kvm/hyp/nvhe/clock.c
> @@ -35,6 +35,9 @@ void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
>  	struct clock_data *clock = &trace_clock_data;
>  	u64 bank = clock->cur ^ 1;
>  
> +	if (!mult || shift >= 64)
> +		return;
> +
>  	clock->data[bank].mult			= mult;
>  	clock->data[bank].shift			= shift;
>  	clock->data[bank].epoch_ns		= epoch_ns;
> -- 
> 2.54.0.545.g6539524ca2-goog
> 

