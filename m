Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10C7CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 01:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qR8bcP4Haf1jVpemGjVbv5/S3g45vDofyEAO2bsulko=; b=3PfAgJcd5gNPbIjPuwl4cvXwPK
	DD1AuHoa7HFAGuMs1knsNNzS1XBGas7gk21sWyb1VO2OvnHbYu1OWu6GqqchKUV4ddzU5ib6fTqu0
	0MmzY2MdnX9BZ4Nsw7/eMrLAaKjpbfbJuADZ61yCNI4hJJR0wxQgJzGpm34afECUCzvjOjvWpQxx0
	ZOJTqJH6q4o73UtmnO3uAMAtZgNg/xkeTjuucnXdVy5O6tuKSFJgvcGFKIWv9kqna/byVGkMPD02U
	nSOPWp0x1K70Rfr3pI1hr2k5wBj4Kleft5wg7ZfOhfhPdingKY+dBKYiXoUzVr/SXhsQuwKETXrtx
	iKh1G/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGog2-0000000EhGt-2BCM;
	Thu, 06 Nov 2025 01:20:38 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGofz-0000000EhGD-1I8n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 01:20:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4d24B30pnjzYQtqs
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Nov 2025 09:20:11 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id A981B1A1791
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Nov 2025 09:20:28 +0800 (CST)
Received: from [10.67.111.176] (unknown [10.67.111.176])
	by APP2 (Coremail) with SMTP id Syh0CgAHqEDb9wtp6fpnCw--.52284S2;
	Thu, 06 Nov 2025 09:20:28 +0800 (CST)
Message-ID: <7742487a-81e0-430f-8c4d-f1a761c2af98@huaweicloud.com>
Date: Thu, 6 Nov 2025 09:20:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/31] cpuset: Convert boot_hk_cpus to use
 HK_TYPE_DOMAIN_BOOT
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Danilo Krummrich
 <dakr@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Gabriele Monaco <gmonaco@redhat.com>,
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
References: <20251105210348.35256-1-frederic@kernel.org>
 <20251105210348.35256-7-frederic@kernel.org>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20251105210348.35256-7-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgAHqEDb9wtp6fpnCw--.52284S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WryDGF1kuFW3trWkJFWDArb_yoW8Kw45pr
	47X3yUKa95JF1rG345J3WqvryFgws7Jr1DC3ZxGw1rXasrCF18ArW09asayFyFv34kur47
	Zrn8CF4SgF4rArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_Wrv_ZF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4U
	JwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	EksDUUUUU==
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_172035_648649_E951A511 
X-CRM114-Status: GOOD (  17.71  )
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



On 2025/11/6 5:03, Frederic Weisbecker wrote:
> boot_hk_cpus is an ad-hoc copy of HK_TYPE_DOMAIN_BOOT. Remove it and use
> the official version.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> Reviewed-by: Phil Auld <pauld@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 52468d2c178a..8595f1eadf23 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -81,12 +81,6 @@ static cpumask_var_t	subpartitions_cpus;
>   */
>  static cpumask_var_t	isolated_cpus;
>  
> -/*
> - * Housekeeping (HK_TYPE_DOMAIN) CPUs at boot
> - */
> -static cpumask_var_t	boot_hk_cpus;
> -static bool		have_boot_isolcpus;
> -
>  /* List of remote partition root children */
>  static struct list_head remote_children;
>  
> @@ -1686,15 +1680,16 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
>   * @new_cpus: cpu mask
>   * Return: true if there is conflict, false otherwise
>   *
> - * CPUs outside of boot_hk_cpus, if defined, can only be used in an
> + * CPUs outside of HK_TYPE_DOMAIN_BOOT, if defined, can only be used in an
>   * isolated partition.
>   */
>  static bool prstate_housekeeping_conflict(int prstate, struct cpumask *new_cpus)
>  {
> -	if (!have_boot_isolcpus)
> +	if (!housekeeping_enabled(HK_TYPE_DOMAIN_BOOT))
>  		return false;
>  
> -	if ((prstate != PRS_ISOLATED) && !cpumask_subset(new_cpus, boot_hk_cpus))
> +	if ((prstate != PRS_ISOLATED) &&
> +	    !cpumask_subset(new_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT)))
>  		return true;
>  
>  	return false;
> @@ -3824,12 +3819,9 @@ int __init cpuset_init(void)
>  
>  	BUG_ON(!alloc_cpumask_var(&cpus_attach, GFP_KERNEL));
>  
> -	have_boot_isolcpus = housekeeping_enabled(HK_TYPE_DOMAIN);
> -	if (have_boot_isolcpus) {
> -		BUG_ON(!alloc_cpumask_var(&boot_hk_cpus, GFP_KERNEL));
> -		cpumask_copy(boot_hk_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN));
> -		cpumask_andnot(isolated_cpus, cpu_possible_mask, boot_hk_cpus);
> -	}
> +	if (housekeeping_enabled(HK_TYPE_DOMAIN_BOOT))
> +		cpumask_andnot(isolated_cpus, cpu_possible_mask,
> +			       housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT));
>  
>  	return 0;
>  }

Reviewed-by: Chen Ridong <chenridong@huawei.com>

-- 
Best regards,
Ridong


