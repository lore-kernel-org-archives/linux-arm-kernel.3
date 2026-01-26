Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74775D19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEUrHNK8dWefUqOs00hvfwKIFD0uk17xYeaKpauo658=; b=akcKLOZs+1FBsf8AEtHvwepBtP
	9lZlEvoGEeK5WpfTFhNmp4RMimcg/I/KtLKcbo8IAsL/7YS0BwXqYAm3yEsIt9SvagVnP9F4A8qIO
	baLPZhxHUKoig6UfFtKcZDeHE6yRtilr0RTuvw7kjxSuJreggqXbS3k5Gmm4tEFinojqZCGK89cLw
	2cPQdIznIJuIKHHCAW1OWjbSOud557FdwD9jBtSJdysTkE8Edj4TatTSTUh1cYykGBaaHs56Zo+AF
	u4RFhHfb16osxozzAwxpipsRlHkq0dWK8nTk62KHObl8d/TohdqbiA/Yd7jBDjERLFR3fC2LhfrXI
	hDQUDAeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPeq-0000000CsU3-2C4h;
	Mon, 26 Jan 2026 16:41:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPeo-0000000CsTM-1FIL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:41:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2891487f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769445700; x=1770050500; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OEUrHNK8dWefUqOs00hvfwKIFD0uk17xYeaKpauo658=;
        b=TmxcsXjvKve1RVbjJ8oeCZEtWGzRggCFbLt/jysziYJxED+pv/nZXVre0TxQxI2HwP
         J+yrgXsqSKiQQPHnParY9nHLSxb4Y2zioskSPz4r/8a6lDZq2ulNTFRVwZs1qYujoH32
         FQNqGPwXSxuhsATXvZ0ATKZyXTnlkn1Ec4rP9PsDKY/yZzWvpJg4HByaCP0rXOCm3uAW
         qFAcEH/+z0/DM1BjO7wXWSKnThfkV6Jh5aQxmxcjvq6HGgxkiVCiZL4xp1x4NS4VFedX
         +/Jrn4c5/o7YqnI2y0CaBuSkhAeeZAgtBp8uxa8Je9rYEPrUda/AuubHjrbCwDfSdPhT
         Ep7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769445700; x=1770050500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEUrHNK8dWefUqOs00hvfwKIFD0uk17xYeaKpauo658=;
        b=kSIf0BjIcEoY37NOfokKd+dIXOc0tJvYdEGyR0uF0+s58yOGQMjUPSNFOfgf3G31pk
         OjkD/E+5OlUAapnWAB+a3f6jCJ1a9rGvunTSsHKjTLoRUPk2/pla3irlhfoDQfw0U8ap
         LFZ306G/HWHm81b4sQ0jjpAstisWD+91SzQygFaAEKXB/P0IkG+Lejuqh49y9j2stSKL
         LvaZgSy6ej7IzJ8nbywdn7sxpYYszqo0XtRvq44HvF8AT1FolIrInbi67yZo0SigBEcj
         EQ9ZfQ3se6hQRxU0mEAUSLBZeysVwRFUydXrffd1NIvYyqkLJob/jB2La5XJq7Zu3/KF
         J9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWh6BaXrBhC9nPNFJ6F7e+T2IP6t5MSfxsS/ij60DKDlepHDzvBnJ8YODt8J7xeIH2KmkIFnVI+u24tuU1ald/O@lists.infradead.org
X-Gm-Message-State: AOJu0YxU0UMGZTGvDmAT+ax27RexbcvAncmHO0iU9Iit9tFD+hQrwSOS
	NGJtU1Grl2BhVgUgsXA34vNeZMzSSMTlME5kKr+tKIGBfPb99SekC+lB3JbvDgKcgM+fRHEro/J
	EPRN7
X-Gm-Gg: AZuq6aLG4yJ7Coc6Mxy7ra+NInfc7uuhFgq+GTe8ie1069o2eHlxbGnwENRVp+hCp7M
	upwxzlCRe2W4KMvSNvb4X2FPJKek49bcWHIuGC0VTimdvMGLya28jSiTY2+YrF1g1AeUjJyRJCy
	3LKUZSWIY9w1f3XN2i01rRAyuRLewctO4p+Y8ZW13ekE7oEPWckASCdPzOX0HyH9Z3GsLQKgu/g
	8stYyVatoUjCYTRBmQOhoNvAa5A59kQ9UJgMc2Lt0yKbo9DHRXQja2rYpbI9wQaITjxKQ/+2Cih
	j/5aj54n2mGwaOvWshHpe6CCiN8vnhmsy289dId8uzBy07+mbPt/dAhyqWrEK3/6fsBysOoDKYA
	0APqaQVu3dQ67XvZMe74YYH5S7yHcPeANUI/t0BLGC5Z3MpJ/dHpH5GiaFMEogmU6GOd0qUgaSJ
	x21tcgiYL9H43O2fIh2/hhh31F
X-Received: by 2002:a05:6000:4212:b0:435:95ce:84cd with SMTP id ffacd0b85a97d-435ca39bd3emr10384617f8f.54.1769445699664;
        Mon, 26 Jan 2026 08:41:39 -0800 (PST)
Received: from localhost (109-81-26-156.rct.o2.cz. [109.81.26.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f74b15sm31194587f8f.35.2026.01.26.08.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:41:39 -0800 (PST)
Date: Mon, 26 Jan 2026 17:41:38 +0100
From: Michal Hocko <mhocko@suse.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Ridong <chenridong@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 03/33] memcg: Prepare to protect against concurrent
 isolated cpuset change
Message-ID: <aXeZQoSHJ9QX7B6W@tiehlicka>
References: <20260125224541.50226-1-frederic@kernel.org>
 <20260125224541.50226-4-frederic@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125224541.50226-4-frederic@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_084142_350287_AD667FAB 
X-CRM114-Status: GOOD (  19.37  )
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

On Sun 25-01-26 23:45:10, Frederic Weisbecker wrote:
> The HK_TYPE_DOMAIN housekeeping cpumask will soon be made modifiable at
> runtime. In order to synchronize against memcg workqueue to make sure
> that no asynchronous draining is pending or executing on a newly made
> isolated CPU, target and queue a drain work under the same RCU critical
> section.
> 
> Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a memcg
> workqueue flush will also be issued in a further change to make sure
> that no work remains pending after a CPU has been made isolated.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  mm/memcontrol.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index be810c1fbfc3..2289a0299331 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2003,6 +2003,19 @@ static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
>  	return flush;
>  }
>  
> +static void schedule_drain_work(int cpu, struct work_struct *work)
> +{
> +	/*
> +	 * Protect housekeeping cpumask read and work enqueue together
> +	 * in the same RCU critical section so that later cpuset isolated
> +	 * partition update only need to wait for an RCU GP and flush the
> +	 * pending work on newly isolated CPUs.
> +	 */
> +	guard(rcu)();
> +	if (!cpu_is_isolated(cpu))
> +		schedule_work_on(cpu, work);

Shouldn't this in the guarded rcu section?
-- 
Michal Hocko
SUSE Labs

