Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A3DC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 14:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqpUZJ3Hzihy+U2mYVJ3sgF3Sb+qWuev5O2KxaX0w6Q=; b=tspi8HhdaPCdHYGcop7ZIjqY4D
	AtUQaYIYFzzy5FCaTUWgpe8TE0UrKsAHMqPg58coGoK0pVlOxWJMPL5+2+3LaJD5NNvhImaLWla8I
	btZqkXOv9oR923qvzdg0EYS1ZuQ4spixGlkCQl8HjhVH/UFy5BnyXwsNgnIIzIRbIF6U7HgWcCM1M
	EBoG0//x8RIbjwokZM/OC5f1DhZOh4rWiJZeuPfFa95T7Afo0Hl4wGGdWFnQI4zCXUf72c621Jhdn
	7ndD0qh3dvyksG8ZI5LkNJiXqo4HnX77LrBJ5pNiss6PMNC3KinBM39IvCR3NWuIS8vU+vws+809V
	tH1fHoXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXwX-00000000Poa-0IUI;
	Fri, 06 Jun 2025 14:21:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXuO-00000000Pdr-1eIp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 14:19:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9EF58A5099F;
	Fri,  6 Jun 2025 14:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189F6C4CEEB;
	Fri,  6 Jun 2025 14:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749219539;
	bh=pkkL6mHI4nb2yOPPIzaWJ0j+YolfgGRBjMLR/Ejsq4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j1iVkK0L7Ccl0msF0tGTZuRrE0YFQXXe2rKPaZuw5DZ2YNA+a+kUq7Eq8qTdm+mnK
	 TUDRDRhqGdVRkT/3RGndJ+nau61as9MGRgXpagFiyu0+2LicgiTrZs3nM6GYd5d9rS
	 JBCIv4OXDINGrbCYKC44oGkzGCewPxGLzi1AfGAdSGS3WPvpeRImIgeJnWkEXoirVW
	 5djXzYxSQTlNAUt3/60Kg18rYdbzah5FShiuC+RQhD/npg/Uibembo3fxvM7OEVKh+
	 ucDO4f3PMzVzoPE88njq5syfEKtRFjeePyv1JshnTawAkYDSGkji3qKooQxlwWlGgK
	 et2VhhKkPV1Zg==
Date: Fri, 6 Jun 2025 09:18:57 -0500
From: Rob Herring <robh@kernel.org>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: devicetree@vger.kernel.org, jonathan.cameron@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, mark.rutland@arm.com,
	shameerali.kolothum.thodi@huawei.com, krzk@kernel.org,
	dianders@chromium.org, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, mike.leach@linaro.org,
	james.clark@linaro.org, linux-perf-users@vger.kernel.org,
	coresight@lists.linaro.org, gshan@redhat.com, ruanjinjie@huawei.com,
	saravanak@google.com
Subject: Re: [PATCH v3 7/7] of: of_cpu_phandle_to_id to support SMT threads
Message-ID: <20250606141857.GA1476878-robh@kernel.org>
References: <20250512080715.82-1-alireza.sanaee@huawei.com>
 <20250512080715.82-8-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512080715.82-8-alireza.sanaee@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_071900_577655_A62907A8 
X-CRM114-Status: GOOD (  33.65  )
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

On Mon, May 12, 2025 at 09:07:15AM +0100, Alireza Sanaee wrote:
> Enhance the API to support SMT threads, this will allow sharing
> resources among multiple SMT threads.
> 
> Enabled the sharing of resources, such as L1 Cache and clocks, between
> SMT threads. It introduces a fix that uses thread IDs to match each CPU
> thread in the register array within the cpu-node. This ensures that the
> cpu-map or any driver relying on this API is fine even when SMT threads
> share resources.
> 
> Additionally, I have tested this for CPU based on the discussions in
> [1], I adopted the new cpu-map layout, where the first parameter is a
> phandle and the second is the local thread index, as shown below:
> 
>     core0 {
>       thread0 {
>         cpu = <&cpu0 0>;
>       };
>       thread1 {
>         cpu = <&cpu0 1>;
>       };

I think the thread nodes should be omitted in this case.

>     };
> 
> Also, there are devices such as below that are a bit different.
> 
>     arm_dsu@0 {
>       compatible = "arm,dsu";
>       cpus = <&cpu0 &cpu1 &cpu2 &cpu3>;
>     }
> 
> In these cases, we can also point to a CPU thread as well like the
> following:
> 
>     arm_dsu@0 {
>       compatible = "arm,dsu";
>         cpus = <&cpu0 5 &cpu1 9 &cpu2 1 &cpu3 0>;

The purpose of 'cpus' properties is to define CPU affinity. I don't 
think the affinity could ever be different for threads in a core.

And cpu1 having 10 threads is nonsense.

Most cases of 'cpus' (and 'affinity') lookups and then callers of 
of_cpu_node_to_id() ultimately just want to set a cpumask. So we should 
provide that rather than opencoding the same loop everywhere.

>     }
> 
> It should be possible to know how many arguments a phandle might
> require, and this information is encoded in another variable in the dt
> called #cpu-cells in cpu node.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> 
> [1] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com/
> ---
>  drivers/of/cpu.c | 41 +++++++++++++++++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
> index fba17994fc20..cf54ef47f029 100644
> --- a/drivers/of/cpu.c
> +++ b/drivers/of/cpu.c
> @@ -189,16 +189,41 @@ int of_cpu_phandle_to_id(const struct device_node *node,
>  			 struct device_node **cpu_np,
>  			 uint8_t cpu_idx)
>  {
> +	bool found = false;
> +	int cpu, ret = -1, i, j;
> +	uint32_t local_thread, thread_index;
> +	struct device_node *np;
> +	struct of_phandle_args args;
> +	static const char * const phandle_names[] = { "cpus", "cpu" };
> +	static const char * const cpu_cells[] = { "#cpu-cells", NULL };
> +
>  	if (!node)
> -		return -1;
> +		return ret;
>  
> -	*cpu_np = of_parse_phandle(node, "cpu", 0);
> -	if (!*cpu_np)
> -		*cpu_np = of_parse_phandle(node, "cpus", cpu_idx);
> -			if (!*cpu_np)
> -				return -ENODEV;
> +	for (i = 0; i < ARRAY_SIZE(phandle_names); i++) {
> +		for (j = 0; j < ARRAY_SIZE(cpu_cells); j++) {
> +			ret = of_parse_phandle_with_args(node, phandle_names[i],
> +							 cpu_cells[j], cpu_idx,
> +							 &args);
> +				if (ret >= 0)
> +					goto success;
> +		}
> +	}
>  
> -	return of_cpu_node_to_id(*cpu_np);
> +	if (ret < 0)
> +		return ret;
> +success:
> +	*cpu_np = args.np;
> +	thread_index = args.args_count == 1 ? args.args[0] : 0;
> +	for_each_possible_cpu(cpu) {
> +		np = of_get_cpu_node(cpu, &local_thread);
> +		found = (*cpu_np == np) && (local_thread == thread_index);
> +		of_node_put(np);
> +		if (found)
> +			return cpu;
> +	}
> +
> +	return -ENODEV;
>  }
>  EXPORT_SYMBOL(of_cpu_phandle_to_id);
>  
> @@ -206,7 +231,7 @@ EXPORT_SYMBOL(of_cpu_phandle_to_id);
>   * of_get_cpu_state_node - Get CPU's idle state node at the given index
>   *
>   * @cpu_node: The device node for the CPU
> - * @index: The index in the list of the idle states
> +g* @index: The index in the list of the idle states

Oops!

>   *
>   * Two generic methods can be used to describe a CPU's idle states, either via
>   * a flattened description through the "cpu-idle-states" binding or via the
> -- 
> 2.34.1
> 

