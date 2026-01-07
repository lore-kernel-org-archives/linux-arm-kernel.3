Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C22CE9D7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIosEDTrE19jWddqbqxbORSLTyIFfzCItUOnBwUdn0Y=; b=qPiMeaBHTq1acUhiMr4Ve8Hx83
	Ae4RLTHVdVLJMdkaCrorlPOH1zv5QFwDXSxN+e7hO02GL0sEAfCYJu8nU51i6aZ5xJ5chlyDwneJU
	JNlcFI0kFMrRYK55d9qLoCism9NJugUGQybHLpwQAz9x+7xH1GZKlwXqxOJBUWVuly1ncuVN/J2je
	t0tepLIBfAfE52ieRpGwHbCs0918MCtgmcrJiUDJkSJqct7VOAEIs1MorRqZVD1c+d9l1pOt4GoN4
	EfO9Y8z2odKkBUK+SxHIXsmae3oGcbNVJ63ztp5ij9hDLSenmB+t3ppEeYzm6cH389jVrT2pPAdrW
	qFa+jddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdS9y-0000000ErK4-06XU;
	Wed, 07 Jan 2026 11:57:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdS9w-0000000ErJ6-1G5Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 11:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D8D543883;
	Wed,  7 Jan 2026 11:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7530C2BC86;
	Wed,  7 Jan 2026 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767787023;
	bh=mNpHcF+MwpeYkX9EkT3dgyo2t+tch8FndQ1ofJbAPRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LeOVqk9+TU5kCP+FDRa6whXFCQVaVEbDllyqM6h//SAX5uiVAXQ8VG7Am0rvJsC1H
	 GqoHmEPSiac74Rt53FFrHdVYKM4/rFVqh30AdgVeV6vLWbAjvELEI1HTUOnJqZhRcl
	 WUKTPSBfeNtl/h9hRKM1nu0OKjKz29OOH9dTct1GoghBZrfukj/3dyGolifM9h+2bh
	 wbVLW2c8CGbXntqacDOCLSp8UU61M7HCX59PbmrBJjXYcCtF5Cx56s4+CUuypQTiMs
	 aUdEwgtI6C7dlhy4lPby3E841CBfyCwkeyWL2UmPv7fe8h0pBCK+OfBWitaUqoPHxs
	 uX/nyikfJSLNw==
Date: Wed, 7 Jan 2026 11:56:53 +0000
From: Simon Horman <horms@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
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
Subject: Re: [PATCH 13/33] sched/isolation: Convert housekeeping cpumasks to
 rcu pointers
Message-ID: <20260107115653.GA196631@kernel.org>
References: <20260101221359.22298-1-frederic@kernel.org>
 <20260101221359.22298-14-frederic@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101221359.22298-14-frederic@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_035704_378828_80D34DA1 
X-CRM114-Status: GOOD (  21.80  )
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

On Thu, Jan 01, 2026 at 11:13:38PM +0100, Frederic Weisbecker wrote:
> HK_TYPE_DOMAIN's cpumask will soon be made modifiable by cpuset.
> A synchronization mechanism is then needed to synchronize the updates
> with the housekeeping cpumask readers.
> 
> Turn the housekeeping cpumasks into RCU pointers. Once a housekeeping
> cpumask will be modified, the update side will wait for an RCU grace
> period and propagate the change to interested subsystem when deemed
> necessary.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  kernel/sched/isolation.c | 58 +++++++++++++++++++++++++---------------
>  kernel/sched/sched.h     |  1 +
>  2 files changed, 37 insertions(+), 22 deletions(-)
> 
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 11a623fa6320..83be49ec2b06 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -21,7 +21,7 @@ DEFINE_STATIC_KEY_FALSE(housekeeping_overridden);
>  EXPORT_SYMBOL_GPL(housekeeping_overridden);
>  
>  struct housekeeping {
> -	cpumask_var_t cpumasks[HK_TYPE_MAX];
> +	struct cpumask __rcu *cpumasks[HK_TYPE_MAX];
>  	unsigned long flags;
>  };
>  
> @@ -33,17 +33,28 @@ bool housekeeping_enabled(enum hk_type type)
>  }
>  EXPORT_SYMBOL_GPL(housekeeping_enabled);
>  
> +const struct cpumask *housekeeping_cpumask(enum hk_type type)
> +{
> +	if (static_branch_unlikely(&housekeeping_overridden)) {
> +		if (housekeeping.flags & BIT(type)) {
> +			return rcu_dereference_check(housekeeping.cpumasks[type], 1);
> +		}
> +	}
> +	return cpu_possible_mask;
> +}
> +EXPORT_SYMBOL_GPL(housekeeping_cpumask);
> +

Hi Frederic,

I think this patch should also update the access to housekeeping.cpumasks
in housekeeping_setup(), on line 200, to use housekeeping_cpumask().

As is, sparse flags __rcu a annotation miss match there.

  kernel/sched/isolation.c:200:80: warning: incorrect type in argument 3 (different address spaces)
  kernel/sched/isolation.c:200:80:    expected struct cpumask const *srcp3
  kernel/sched/isolation.c:200:80:    got struct cpumask [noderef] __rcu *

...

