Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82387D44C41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 12:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL0uB+x8yIt84TUPjO5/h7+5sOBtPXgqTdDubQjCqp4=; b=ih48tdrYduVmbkkVifB7GbYsoo
	BQYrM5dkOdnzV9CAOYOVkTUi0pM1xlo+qC3XPP9dnoPlgf96HeXEcu/7bAWuRgJ1w87TPyd+KuDQT
	XDzqB/G4sirVl4zFa8hHuTlqjQt1SxgCDtAA5eLZBspsO6LwJgH+mNLBZZvG94W7W4cP/jqAN+o9R
	0sGw2ngqoAl98RH5NyOi9FHYJoPp2+5oGCY352e3S4h0LTpvfSnj39WRTbdg+JBor5eI3DfQtpkO7
	iuQENli71neAAnC6V/YR//tJCW93URqbDRbR14IP10RuCYSUf2kfQrkLfl5/SEAqRwCAjbmbRqZJT
	jehptGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMpn-0000000CMFU-1xUT;
	Thu, 15 Jan 2026 12:52:19 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMpk-0000000CMF6-16oT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 12:52:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KL0uB+x8yIt84TUPjO5/h7+5sOBtPXgqTdDubQjCqp4=;
	b=N4x9Fo7BkyMJr1WkVNoBqhHWd9yz4+GPOKJ4VjS6LdUalm9Ar6TfasK1IhiOZxBRqdOx6t1jD
	NLwno7Sol/7A9udOhX0HsYp5JT58lKf/qp/pA9YV6egVluPL8vGtgHodtD1NABN/cmR7XzQnGwt
	h7YWZzABKmL15BCYkVt1iSw=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dsN7s6YvTzcb45;
	Thu, 15 Jan 2026 20:48:25 +0800 (CST)
Received: from kwepemf200001.china.huawei.com (unknown [7.202.181.227])
	by mail.maildlp.com (Postfix) with ESMTPS id 8AFF540363;
	Thu, 15 Jan 2026 20:52:12 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemf200001.china.huawei.com
 (7.202.181.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 15 Jan
 2026 20:52:12 +0800
Message-ID: <7f156aa7-c723-4580-aa82-b2f0fe6d3845@huawei.com>
Date: Thu, 15 Jan 2026 20:52:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: topology: Do not warn on missing AMU in
 cpuhp_topology_online()
To: Geert Uytterhoeven <geert+renesas@glider.be>, Beata Michalska
	<beata.michalska@arm.com>, Will Deacon <will@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf200001.china.huawei.com (7.202.181.227)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_045216_466267_45CA51EE 
X-CRM114-Status: GOOD (  17.08  )
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

On 2026/1/15 16:51, Geert Uytterhoeven wrote:
> When CONFIG_CPUMASK_OFFSTACK is not enabled, and resuming from s2ram on
> Renesas R-Car H3 (big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), during
> enabling of the first little core, a warning message is printed:
> 
>     AMU: CPU[4] doesn't support AMU counters
> 
> This confuses users, as during boot amu_fie_setup() does not print such
> a message, unless debugging is enabled (freq_counters_valid() prints
> "CPU%d: counters are not supported.\n" at debug level in that case).
> 
> Hence drop the warning, freq_counters_valid() has already printed a
> debug message anyway.
> 
> Fixes: 6fd9be0b7b2e957d ("arm64: topology: Handle AMU FIE setup on CPU hotplug")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/kernel/topology.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 539b3893518281ec..3fe1faab03620e78 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -332,7 +332,6 @@ static int cpuhp_topology_online(unsigned int cpu)
>  	 * may use different source of the freq scale.
>  	 */
>  	if (!freq_counters_valid(cpu)) {
> -		pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
>  		topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
>  						 policy->related_cpus);
>  		cpumask_andnot(amu_fie_cpus, amu_fie_cpus, policy->related_cpus);

Thanks!

Reviewed-by: Lifeng Zheng <zhenglifeng1@huawei.com>


