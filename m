Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CEAD46C03
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 21:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KW1Mn8hE3xrcR5j18KDZNCCnIS+/tf2Xt9JxG670/6k=; b=mJ7mhLS+KMWA23cqZkvD5deqLa
	saettFSRjksw4/KdIKJ1OuwDdlaCZjPCf0n/SRtld2VHUyFut7koWNHe4DsMItKUnwirK2BxlpIVQ
	+Wzwav+WGH8QDDpdNi0TStDTAvh+OdEIjJfNh6KaG+1aqT6xnqVBwEnMGyb9SHXOT7mdb1RwrbGB/
	Z+A2+64T8ziN0abLfU2X/zCV/lqCA4YBKbnNSIxoJBmkXAnprA/3JDJNCUafO0W/xjlgjaazfBBs0
	k6LNbJXGOyh47CcQW9pQYREqk5OR91X4doFH+2jk6LbDbREbtJ8Kc4uo5eNrGAPAMVqGMN76RaLyG
	kTCZa5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCwG-0000000Gpcy-1jZl;
	Wed, 28 Jan 2026 21:19:00 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCwE-0000000Gpc9-2JAJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 21:18:59 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48069a48629so2882505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 13:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769635136; x=1770239936; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KW1Mn8hE3xrcR5j18KDZNCCnIS+/tf2Xt9JxG670/6k=;
        b=NFD55NaQ7FbUsoUxw4DAIf6LjyYMAAQJXihrs1Rvg3Eef6ts+pQrFvm5jRKflneVnx
         RuLGakm/EseD5HU056wVfxf8LcVJKWSFgDwv3BWtn9Akym+ab/dO3MideK6kPmX4qZEq
         WmopTp7ZTiJhrjs+hO9gaBTHXrTmPM/SlgKzcA9IlxPuiEXp/3JPntSHcS6jlYLoxlYH
         sFouUYKUs15ITcTcaKmkkaa7Dr+L2IPo2ZuG8coxT7jZwAfWeNu0S9p/42cj1HyYC3iE
         ywtgwkH8aAksH/byA5H9p1yilVcK8sHZhKGqnRfsSVwenkd6U6KeUTFrXvPtCt8hY2pd
         REkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769635136; x=1770239936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KW1Mn8hE3xrcR5j18KDZNCCnIS+/tf2Xt9JxG670/6k=;
        b=Cw2Ks8vKYE/rv7gs29n+wu74gNAOJCG4EJ8y5jnFi9r1+Mbzm3Jqy91IQF4dmye3Pu
         i7u7HV9wWIiGtfQZ1aEIMAhjxCQtxW10p4yeYG+5qEIEsdeUTg1ZH1Ejbm/zXgfOGBJJ
         Wdt22pJMt+bZhKOMntHFe93Mulb/mRvt5VMKmwHEgThgvrLIbwd0NkSpW0XJGP6qYDgR
         MPPF2JI6tNUYIUkK/nWvrbPQ7FXo/NVPpgwsxlGX9Gvon62wkJywEC31PBkMC21UCWzz
         jpmH9YwvYHksgxLgYWtB0+1jBlwNVsH/3btcR23JNc82guz7Er+7THYRK5MsmUtNel4z
         pG+g==
X-Forwarded-Encrypted: i=1; AJvYcCV4/EeygnJJetMFXqbLKl1dW/n58CX6ojGLbGoMyUjfn7JOZF5GE2HONciUXnJDmoMtgl2KWvkrWcDXhYy0tHGc@lists.infradead.org
X-Gm-Message-State: AOJu0YwKjPNE6BGYuMG8oWsdgRCCUaaskhR84Vu54ANL+8GjlOvJxL5N
	ymA1R+2HL4+9BBLBm31Mn2fBvrcWeXJpdF7NIFlboeyBPX+hqZhuUGm/7CAXPnwaNyM=
X-Gm-Gg: AZuq6aLO/z19meapRJK5NkEHyj2tcz7RdG1ADN60rodAXbWyYuomvSjGy5ZjUIN2PFX
	5Cb2JLAw+iHsv7xJ7yGMiBcgUvZhqX2UWbicV2vZShsfW6I5/AlX5YIRneIcgwjM9o7A5kbRTqh
	+j35zB6idA+/4fLOnWw02ueondRfRrg1hY+koLZjq2Br26iaQWoRUPaGezyW/ALcbqYGv+WQx7J
	UkSvLfMXSEOhrhhooGPVl3yTX5sHx245YR3nCedY7Q6r+hm3i+RGaFFPD6vNDYkgDsxhVIVFqEM
	h/UqiHnY1Wk27xmWCA1xqGiOSILr3RTZBxyOFywn8Q7jsXom3ZLEFkNySMYWO8Lr8OqXQAQxYkr
	U3PRzLSG8XjtwJjjPrJy75GE5lk9qUbUjpKW+ktCR0uTYVqwgX9+DOVsoPvzboysFCQS30oLKKa
	Vs9jBwXRgXZa5ZVxZtXF9cqe4z
X-Received: by 2002:a05:600c:3e16:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-48069c10f78mr74663935e9.8.1769635136165;
        Wed, 28 Jan 2026 13:18:56 -0800 (PST)
Received: from localhost (109-81-26-156.rct.o2.cz. [109.81.26.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806d78cb6csm3510525e9.2.2026.01.28.13.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 13:18:55 -0800 (PST)
Date: Wed, 28 Jan 2026 22:18:54 +0100
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
Subject: Re: [PATCH 04/33] mm: vmstat: Prepare to protect against concurrent
 isolated cpuset change
Message-ID: <aXp9Pp4YvlbJumeY@tiehlicka>
References: <20260125224541.50226-1-frederic@kernel.org>
 <20260125224541.50226-5-frederic@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125224541.50226-5-frederic@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_131858_602854_92921020 
X-CRM114-Status: GOOD (  19.28  )
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

On Sun 25-01-26 23:45:11, Frederic Weisbecker wrote:
> The HK_TYPE_DOMAIN housekeeping cpumask will soon be made modifiable at
> runtime. In order to synchronize against vmstat workqueue to make sure
> that no asynchronous vmstat work is pending or executing on a newly made
> isolated CPU, target and queue a vmstat work under the same RCU read
> side critical section.
> 
> Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a vmstat
> workqueue flush will also be issued in a further change to make sure
> that no work remains pending after a CPU has been made isolated.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  mm/vmstat.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index 65de88cdf40e..ed19c0d42de6 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -2144,11 +2144,13 @@ static void vmstat_shepherd(struct work_struct *w)
>  		 * infrastructure ever noticing. Skip regular flushing from vmstat_shepherd
>  		 * for all isolated CPUs to avoid interference with the isolated workload.
>  		 */
> -		if (cpu_is_isolated(cpu))
> -			continue;
> +		scoped_guard(rcu) {
> +			if (cpu_is_isolated(cpu))
> +				continue;
>  
> -		if (!delayed_work_pending(dw) && need_update(cpu))
> -			queue_delayed_work_on(cpu, mm_percpu_wq, dw, 0);
> +			if (!delayed_work_pending(dw) && need_update(cpu))
> +				queue_delayed_work_on(cpu, mm_percpu_wq, dw, 0);
> +		}
>  
>  		cond_resched();
>  	}
> -- 
> 2.51.1
> 

-- 
Michal Hocko
SUSE Labs

