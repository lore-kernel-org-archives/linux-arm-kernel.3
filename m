Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF91CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2q8nzYEKT3mVq5Szt+TfQESP0vSaFCiLorqisHY7WPk=; b=InXl/3KgVI+DHaipN7RY/ZFr+o
	mNnbOxxZFUF/u+w9+o8Eb5P8UpUR2YhASVSQu+CK3HgGCtuteUkIC1QbKEyenLYA+tBENvE2hI545
	A2g5ybWyLvHqDTXxzRlfIfWjb3hxUU/c1xI7eukCKrx6FpMIQH1HUnT/aZr7f/aXWBRkRQgaOP4pb
	DPtcGLrbuEv6DQra1exl7/jfyU9LzTcRGVEUHFEEQ9ckth1TlvssqrC20Du1Xlk78Zcd2c/T/y/Zj
	dnko/UB29yOQCaHSvwpAumRLuTaiq/+kaQ4h4IGm5juH8Js0LvQ5f5H4lZc5KE2uJ0u4Dsa4zRRdf
	BNRA8I1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eFu-0000000GGgq-13uR;
	Tue, 14 Oct 2025 12:35:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eFs-0000000GGgh-3WSF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 12:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EEB82622BF;
	Tue, 14 Oct 2025 12:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613B6C4CEE7;
	Tue, 14 Oct 2025 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760445351;
	bh=veFrev4WHDqJr8PvwptdqQ0qevY7NBnf6uVDF8KwJvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ex+R3y//T9kDG4MIndwspLzW9Vx5zWHgE/EaFVi2WPfvoDb9Wm53ZgK3WweiF8OFR
	 UUpPSvNXvWaVMMSpa2NFfFoaYru8wVeUVp9LWCfqdK4O6GNUzIU3ucGrpMQufywb47
	 kOIrAwSVguW0XyImU4o61QWE8OzcAoMP5nF5hHqTTSVn/s4CFrSlHrUfEukcVzsd7q
	 KdYC4RfDc08pweMnxmXVaFZYxFRHfmp2XAIaBzqAfakhF25hwmpiq40lUfIiv+6zWC
	 FcLWsoZRYCArglDakt8a2zEa8ZDsd246egHvmkRQV9YE36MTf7aguEqQQhhipNbJvY
	 GuHfp8lhzzwuQ==
Date: Tue, 14 Oct 2025 13:35:43 +0100
From: Simon Horman <horms@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 30/33] kthread: Add API to update preferred affinity on
 kthread runtime
Message-ID: <aO5Dn2AwQWn0SQKQ@horms.kernel.org>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-31-frederic@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013203146.10162-31-frederic@kernel.org>
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

On Mon, Oct 13, 2025 at 10:31:43PM +0200, Frederic Weisbecker wrote:

...

> @@ -900,6 +899,46 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
>  }
>  EXPORT_SYMBOL_GPL(kthread_affine_preferred);
>  
> +/**
> + * kthread_affine_preferred_update - update a kthread's preferred affinity
> + * @p: thread created by kthread_create().
> + * @cpumask: new mask of CPUs (might not be online, must be possible) for @k
> + *           to run on.

nit: @mask: ...

Likewise for the documentation of kthread_affine_preferred()
in a subsequent patch in this series.

> + *
> + * Update the cpumask of the desired kthread's affinity that was passed by
> + * a previous call to kthread_affine_preferred(). This can be called either
> + * before or after the first wakeup of the kthread.
> + *
> + * Returns 0 if the affinity has been applied.
> + */
> +int kthread_affine_preferred_update(struct task_struct *p,
> +				    const struct cpumask *mask)

...

