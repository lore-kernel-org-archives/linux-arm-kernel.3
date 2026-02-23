Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E69EC1101
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX29uEwlmShEjfFqkdwl8Eb5l/ZDj+DL2kVuvz05S4k=; b=mOmiZ+9jp16AHCR9sxlg+8s63B
	XC5nC3tH2JxqpxU5hUYC0yZnosys5uaT+iKtJMd+ziXY5WLbkqwfsE3p0PamXPzg7Gqt4KVqXNOBb
	/9vpyAQ3Od+vE0UoQ1GpZTJVfJq34n5CkyixrX5NdUFL5J4j0qXvMjzZxCIX/PkyRv+5y+CJ8J0KU
	KOcqGh74h7OR5nv4cz6rL/yCII7Ahs6Dqesi8I0w+rIlbK+SETBRbL42iLsirNZAfN8xKyk1rgPbC
	CwnbwkemheXLQHTwU1bZcLMyG2ra1v4BiL3DAMa3MmwNZyG3F4UjL69xx86gcUkaZaD+49FTVO8e0
	8xvVh0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYMv-00000000dEH-1k5J;
	Mon, 23 Feb 2026 16:01:09 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYMs-00000000dDp-3IV9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:01:08 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7d4ba9abbecso4423695a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 08:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771862466; x=1772467266; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HX29uEwlmShEjfFqkdwl8Eb5l/ZDj+DL2kVuvz05S4k=;
        b=Ljwir1ecYWKFAuYqh4+GniksAkFCYy9aXBDkCXxtmWvRHUM9HfRSMuyJoyhJVlla7Q
         86K8P9Ga5douHa34o7TWCPPJg7gVXa95Q6uequtKS9oCVJojKqTYXGd/84idS/D/jnbz
         cwMIAMh85xu/iLAepbGzQ2P4SeqeD+D42+HOQ/ECWKHj5Q8wWjixoyHs92bTzf4oxZuy
         U5Nn5qMc70bUBmUHTTEaT0cV1Bi1JYszdzr1ak1OEXi0V12AzdUKvll8b43PO0Qke8c+
         iz//9HYdCqSh9U8q0G1qjCL5v414whNZa3dBJGut19Tp1P/JVz0+7TGFjda07hc3YcsR
         YYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771862466; x=1772467266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HX29uEwlmShEjfFqkdwl8Eb5l/ZDj+DL2kVuvz05S4k=;
        b=nlH16cKyM280ruHPSY8haOZSjVSF9xugVQI6wL2omojlIjzauENyV7oPQ4MdzR0N4N
         XQ8o4hNbdfxpMuwEeCl+HepBHZGlP4q+idLI/Q3O3eqVx/pob7Ej3TgbBfZl44bTzIR3
         yxQhamOPQr24DmhXQTzqdIrYxq46368+JKTW+ju9lvw/zxhGdBaR+N0pVvQLcb22gcfX
         4Po1rAbHmKhYnh2WK/fcGHUUDp9uUWLdjYOA7Wum98Fk6JUEFPgEUKp3sxysTVsjAWaT
         C6Jh2c4oVd3a5dYOTW5EDYO1XC+cPNcovQItbCMWCGazmIevDsswFJSagM4Qyv3Tl6fQ
         raqw==
X-Forwarded-Encrypted: i=1; AJvYcCUAqYBTivMeVMCqzK7InZA657OC9tHoN2DgNyeqiyURnlIHainm2A7bDoBxWdYLuohyR5gC9cK4ZS56Hq586gJu@lists.infradead.org
X-Gm-Message-State: AOJu0YyyrsSabXfJ64D/AUQZu+s92OtiebgKZ/FjGeqF/FkZAkXYeVlq
	9cjJX2q46tp4qaQ4M6DMTz5N03K7YEqkdHLUIXy9b0tS7CB5TJ56zgNm/MhpxFlKN8A=
X-Gm-Gg: AZuq6aJYvgWk7ZOowLPZBX8bl35MCEpNO3pQt6/UX0iOf25+VSK718fV1RXleOm2HMf
	GwR5ycJB9ESxqnIOEPdy43JlCPQ8+7E8rJqj00U4Te4pahLdSThF9OJ6H4rW9qTL/f1DkKaFPUI
	GHll/29+Sco55zdVZT14Ckf+vXY3hJX+DGv0vtgnzd+rZi9T2Vdmj9WZbGPoTygcFQG2OoEvbcZ
	TcL1HyXteG7QOIXLdaN/tuXVJ/DjFN2wxNkNUe1PuMJAbov0nnrA1wRqB0wls0yycH1RpkTZ583
	iSl3LIGQWOgZendqmjL+nathQ9eySTYw3DK8mKHjga9DRoZpXmzzUiYW5ezLMn8vvhi362vaHq/
	WMNpgGnVmtJc8xwC/CxaT7tzx88eE1nx0W1T4q++V05yMcy5JJTCSzk9kNIwrjAkpoGve9vE0iC
	yD59IprxWs+U8ow6Ov69rXMGUSIvEvuko2czsK/XPEvhdAG5tKN2ojj+z7xaQGOQ5+CwKHoDPeX
	L2jjIOLQw==
X-Received: by 2002:a05:6830:3153:b0:7d1:853c:83e3 with SMTP id 46e09a7af769-7d52bdf416bmr6177467a34.2.1771862465520;
        Mon, 23 Feb 2026 08:01:05 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:e37:2309:3937:4469? ([2600:8803:e7e4:500:e37:2309:3937:4469])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d55b9a8498sm1062950a34.28.2026.02.23.08.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 08:01:05 -0800 (PST)
Message-ID: <47be2ff3-c25a-4aab-89fc-53921af8b0a9@baylibre.com>
Date: Mon, 23 Feb 2026 10:01:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/33] mm: vmstat: Prepare to protect against concurrent
 isolated cpuset change
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chen Ridong <chenridong@huawei.com>, Danilo Krummrich <dakr@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Gabriele Monaco <gmonaco@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko
 <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Phil Auld <pauld@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Simon Horman <horms@kernel.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org
References: <20260101221359.22298-1-frederic@kernel.org>
 <20260101221359.22298-5-frederic@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260101221359.22298-5-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_080106_837265_980DBE73 
X-CRM114-Status: GOOD (  20.38  )
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

On 1/1/26 4:13 PM, Frederic Weisbecker wrote:
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

I think this might have introduced a bug - or at least an unintentional change
in the program flow.

scoped_guard() is implemented using a for loop. Now this continue statement will
only exit the scoped_guard() scope rather than continuing the outer for loop. This
means that cond_resched() will be called when it previously was not.

>  
> -		if (!delayed_work_pending(dw) && need_update(cpu))
> -			queue_delayed_work_on(cpu, mm_percpu_wq, dw, 0);
> +			if (!delayed_work_pending(dw) && need_update(cpu))
> +				queue_delayed_work_on(cpu, mm_percpu_wq, dw, 0);
> +		}
>  
>  		cond_resched();
>  	}


