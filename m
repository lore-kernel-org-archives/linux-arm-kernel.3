Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2723E94107
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 00:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IheJhIQLOL+uGWt6XQ0zIC5UxYwT55m5ifEVRi78ko8=; b=YXZ1fEsEgxsJeRM7tXPxGk/6rA
	IsWgTh2LaXTOarWE5ZGiwgTt7Rmt1RKYHhPje5X94iQStyn8moTRXU5YY+8uESN+oRL2qmmLydu5e
	yT6+ZccaHnqV2P+/BFMM4wVM31kZZ87+k3idrcHY4EEGfaZHuXNZoO3Q0xiFRpKm5b8F92vJdPuoy
	2VaDLzA3YyKj7FYDNQLkqhBNS0E67fWUDOqbC4dIRDSkaGNwz6P9LOffPTAlieQiTpU8Ebg8aDBnc
	XMZ0Tmvy1yg87HUhL05OqSgSWXAOZiM7qR3ydY8qKTxaJpD/YoH6rLkPRYsPRtz1k1kGfrN0Axf+7
	iDgSRd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNk2-00000004BP9-44zI;
	Tue, 30 Dec 2025 00:37:38 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNjz-00000004BOg-1Tha
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 00:37:37 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7c7aee74dceso3708669a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 16:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1767055052; x=1767659852; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IheJhIQLOL+uGWt6XQ0zIC5UxYwT55m5ifEVRi78ko8=;
        b=eY41MafOUYO4V3In4oY0fe0rkU/maXDlq78eDKG34Abe4snQT2iaaYCTELkFXY8/N+
         vo0INmNObZjV8i9e0ei0rq9GHA/iK1IHKBObfpVrBJ0rUtOd3Ks4rVksSsjaoVjzWavh
         aom7t/fGcPzbTHRQitGKABwqjNG8kR3My+DFHRh63Uz5AGT/Msb0SRL23aGvGcC6hbq7
         Z/8MLH679UTclgYe1tYpmsXTl80y9akewnrr1WPsrGEf1L83kWgMS5qLpS2TmiQAp7x8
         6C7XPB0CUQ2/sU39BFjAjdMiQYNpbFeyQm1J0ilDmtN15pWN7mGlKK9+EYFP6AmHSQzh
         h4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055052; x=1767659852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IheJhIQLOL+uGWt6XQ0zIC5UxYwT55m5ifEVRi78ko8=;
        b=Ha4662TC19E9J5ogX0l4GrRMsw8LuVnn2+BQ1aeLjRUkbOBXWSukezRKrOrkZ19KVp
         6qHUpXMhYXwgPcKPsaPnpiB4LXwSkJQSdbMSPz0aPEIlhQHbiXPTrQC3dtkfan4xS8P0
         sDbY5HeaatnROx4bvApQvD8G4JEXSU2wrI680mm5kVCjuT6kFotvt7itW787dy4QOnF4
         K9FyTNLvmHyyRiP/j+uttRKJ9ohPQYUqsX28grympFS8Q2xwIE9We6oAwHyiOly2lLlL
         mT8J+KCaRa2Lez3OM3fixpk75fVbmnEOTUlSupHjzLVEXiq9pn5ic4TTGnbx8g9JhSiu
         6S+A==
X-Forwarded-Encrypted: i=1; AJvYcCXTOauOd/woWObFElUMmzsGLhIF5pCTyrLJIhm4x1Ad/ghET6GhflKMYqMAhdVAY+naRIjXLgF5K5kgbtwl/DdR@lists.infradead.org
X-Gm-Message-State: AOJu0YySMjr8whlTjAZhtXnIZACT59Vkr9RsP4HdeHnP/wvx21NlOsRV
	M7unawSDmfXiM4bYCxFst3/hmxZ/gsfUkxA9AL+ifTKhh5Divf30qOLmfJLHH3bO4wo=
X-Gm-Gg: AY/fxX46miV99ZgthGhOwrsQjcftEOL/GdXR1K+co7MO89Q9t1wkBHfBXWsXCChdlhM
	a1n7PzKqd88MzZGG+Ak5amwl7dLEhkTrQbWCabx4S6fi5dWGOLW6SKQjnyWLEwj4oG/WDpte4+z
	IbxHT61p5ZxXSgj4LDrfFupJo2BfUayK/KDhgRoi/FFbYpdGCYtn2buM6QctgBUIsNVJ/PIczZ7
	aQfBX6JFJQHkwSqUmU02b6JT4SoLAprw9AXZ6rv/dTk7PX2ZgOmsS2AtErnqP8VDgr+vZtu1Ycx
	nUNOSJLIypsHqT2OLDmKMbzoyO1nbl2J93LM+GIj9+JUzjvd5e0mLW8VPks48Ug+pK/PU8k3C6W
	ZmDO46QlnC3bQw9im8BVlkMHRgIGoxgJLRTU9fAa9YK3P6jJfD+nKrYEFQr0E9a8socggLa9zGQ
	xm+ApV6G13
X-Google-Smtp-Source: AGHT+IFl9yxlJpaq7sZYozgWoQTaTewr4cBUOiverIAjbR/CmqFwp/DL9X0O2bEGHsivPH5Emtcv9g==
X-Received: by 2002:a05:6830:2642:b0:7c7:6217:5c60 with SMTP id 46e09a7af769-7cc66a603d6mr14529090a34.25.1767055052471;
        Mon, 29 Dec 2025 16:37:32 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667d4f62sm21773347a34.19.2025.12.29.16.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:37:31 -0800 (PST)
Message-ID: <0f65c4fe-8b10-403d-b5b6-ed33fc4eb69c@kernel.dk>
Date: Mon, 29 Dec 2025 17:37:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/33] block: Protect against concurrent isolated cpuset
 change
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
 Johannes Weiner <hannes@cmpxchg.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Phil Auld <pauld@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Simon Horman <horms@kernel.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-10-frederic@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251224134520.33231-10-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_163735_406898_03D47842 
X-CRM114-Status: GOOD (  18.56  )
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

On 12/24/25 6:44 AM, Frederic Weisbecker wrote:
> The block subsystem prevents running the workqueue to isolated CPUs,
> including those defined by cpuset isolated partitions. Since
> HK_TYPE_DOMAIN will soon contain both and be subject to runtime
> modifications, synchronize against housekeeping using the relevant lock.
> 
> For full support of cpuset changes, the block subsystem may need to
> propagate changes to isolated cpumask through the workqueue in the
> future.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  block/blk-mq.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 1978eef95dca..0037af1216f3 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -4257,12 +4257,16 @@ static void blk_mq_map_swqueue(struct request_queue *q)
>  
>  		/*
>  		 * Rule out isolated CPUs from hctx->cpumask to avoid
> -		 * running block kworker on isolated CPUs
> +		 * running block kworker on isolated CPUs.
> +		 * FIXME: cpuset should propagate further changes to isolated CPUs
> +		 * here.
>  		 */
> +		rcu_read_lock();
>  		for_each_cpu(cpu, hctx->cpumask) {
>  			if (cpu_is_isolated(cpu))
>  				cpumask_clear_cpu(cpu, hctx->cpumask);
>  		}
> +		rcu_read_unlock();

Want me to just take this one separately and get it out of your hair?
Doesn't seem to have any dependencies.

-- 
Jens Axboe

