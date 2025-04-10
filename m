Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4F2C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 04:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKq9kzMYsicKdtkGA5MBDLw3TZIwxRLfS0ALUoxDg9c=; b=mFxhR1OaL9KeKdLeWLHJrx9dID
	0zadglhrrUULTYI2ZgTLYJjpWXFWZnmIdmX+4yXR/xiljnJ02PSr3tF2RMNShlveg+PkwHpVCuDcF
	yLvSZJ+9j5mKL8n2vBwdcrHp2RqU3YB+U5Sffo5oXr9AvKctvRYs+cGR1KoVNMqIf1bM7fC9SEAFG
	Ic7FFFz9t+PMfvJlv7McGyMGwTTjk650n1++m7Fc0TLDbSFbBUbeecr3M1m/hrYSDUtdmU4NyiCdc
	Fz0q+wLOor0+ae27A8fUD92sP3ru16N2xayB3hO/ygg8atOdMVTls3RqAKtyg/2AmTwwbFkzIhlsT
	sb9oprXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2jhT-00000009DU1-1N6G;
	Thu, 10 Apr 2025 04:39:39 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2jff-00000009DND-3nz4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 04:37:49 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7394945d37eso277363b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 21:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744259866; x=1744864666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKq9kzMYsicKdtkGA5MBDLw3TZIwxRLfS0ALUoxDg9c=;
        b=MebqyCxJo+N42CaovfaOpGBactJYk66SOnU8ewtgd66FBihNXFSFsPAtXIqqOiEkWY
         peaXDZMwSAyP+aoQhAN0mJ8HQN8aPmNgGqUcNVVJYNoARnA1q0GnoVqbl6fLh79N8HuD
         f0uQGp85VrlgNwz9cCsRu8DfAmj0NQVc1XlrPA20TpCs6GsMt0T6qeHSY5k7z06fTlmA
         f0XS71sSMQqlTUxVUi6AU+41WEpT04JRjOE9kfD5ZXf+HCfUpBB7CQRJk9GoXUzfHsMG
         8pE472T59+JB6LnK3k3xvbdZAoVNjENRhZAs9pnbgIVCBz+5wZSHmFpBQa00BJgEC7vd
         u4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744259866; x=1744864666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKq9kzMYsicKdtkGA5MBDLw3TZIwxRLfS0ALUoxDg9c=;
        b=RlMLt+spxsWgunLpTNL6SDWb4+oTUg+hCbdilrq6YnPkel50bvJNii+Vb2UiUWJTeb
         2s6iUDX3/V/1wVCzLHylC5YDETjBAd5eINNVxrjvP5hqZ1PXNCXg844hj6MiPOyHmJ5D
         itOxNjOXq83cad0v78yAxjbqgT6Xi1RFiOlsqHmEoiz6XqBXc30p5jgqpYV4pYl0mo65
         LMAaJ4tLe1ZAl94spQo3EFnop8IslyByI8VSpID301oGaMXC/LEYudm4VngKXVbOExG5
         FCG4PVIJ0dFOvV7SITe4OhrKMVpg1k3VfrapdO/1qAh+r6/Ta2De+hhKgv2Ow7dcHwq5
         zoEw==
X-Forwarded-Encrypted: i=1; AJvYcCW1lDt1uFZtsP0Yoms44ty54WbIxy1RYc1Zc2zmKlRGCiXiZ0BpiElkZ2w8MNRTE80ZaBtB+5hWyNY+F3suZAsO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1+cWh9TKC+ERdbTINt2+WZ1sKSwkhRyZWF1fGLo4m/yprYjqa
	8bR7wMJAQIz+XI5FiKzXBRay6SCmaH6xBSqHZ9ntI0kuXz9j//kdY6U5kqMRUvY=
X-Gm-Gg: ASbGnct/HvlpenWg3TixK6YrL+4Xu8U7f7dF9XEXLk9mcQytxND9h0Z6uz/tEk5EaZZ
	mNW/WPz/otbWdB9Vuyb6vRXXbk09FjAxtj3svR2QEM1LRyPFkBSxrpnVXIfYhi4qVWqMVW1o0DM
	qKb1OFo4Ku1pxq8cILbYuaX4sj2BVXkl1yS3Cuk4Nb6B3wxU44tWYeTdRT4srIY5qnyxJZlWlxz
	j9r13PhcB79jgkGC2EwsOCL3PWfBBcIwCnR9okS4YDjJxVZZWbHcrF0i6fIK3qifC9wUDqwgK2O
	x4Q3KzdugmQKzRRdnp8Q/zUikd5U/aYCYqDIEomj4g==
X-Google-Smtp-Source: AGHT+IE5WApQf0idcPfilUjF6fBUp39jssoyHNZPfC/qpfeRdr8GHZIk0YeghJmMBYI3ABubgqhHhA==
X-Received: by 2002:a05:6a20:d528:b0:1f5:9069:e563 with SMTP id adf61e73a8af0-201694cef6fmr2822217637.21.1744259866440;
        Wed, 09 Apr 2025 21:37:46 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e3842dsm2345076b3a.108.2025.04.09.21.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 21:37:45 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:07:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev,
	rafael@kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: apple-soc: Fix null-ptr-deref in
 apple_soc_cpufreq_get_rate()
Message-ID: <20250410043743.rxwixe7slr342d56@vireshk-i7>
References: <20250409124813.47193-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409124813.47193-1-bsdhenrymartin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_213747_970916_9FB93486 
X-CRM114-Status: GOOD (  11.26  )
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

On 09-04-25, 20:48, Henry Martin wrote:
> cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
> in the policy->cpus mask. apple_soc_cpufreq_get_rate() does not check
> for this case, which results in a NULL pointer dereference.
> 
> Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V1 -> V2: Use `if (unlikely(!policy))` instead of `if (!policy)`
> 
>  drivers/cpufreq/apple-soc-cpufreq.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh

