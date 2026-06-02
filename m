Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC757CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 12:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TjPJ17gEtcnTt4IawZJaVkXbQlEiP6t8vVeLN4N89Q=; b=Xjs2IEP2/moZ1AED6wX3/6Smeb
	R+01cD/T85JEKWbbAWkJEGzHyyfuJx2NR2OhYIq0dp9HA5pB/DhuS6jCDixTEH5zV8tP6quesRliW
	/QfFL1T5nKHwvkQo7RDoFyC8rQcXIhQM009v2PB4W79AqJanXqI72BNdV8R4jKrKx/xZ7pF8rUSa6
	SbnjldmNW4t50b1RT+j1ze86YP7oAw7xmdrPKCu1Df71ZNDshsrOkkAYodm6ay9T0ZpnUsT533jPo
	9ZmmQUGKmuDNJM2s48cleLXw3Rgvyjj0HkU8GC6hQB/yoVme8wvPPjYhBLSvXOBtavfXQAKzzHLTp
	uEigkBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOWY-0000000D16T-3oYs;
	Tue, 02 Jun 2026 12:47:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOWV-0000000D13O-3kbi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 12:47:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CE5B44062;
	Tue,  2 Jun 2026 12:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A211F00893;
	Tue,  2 Jun 2026 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780404431;
	bh=4TjPJ17gEtcnTt4IawZJaVkXbQlEiP6t8vVeLN4N89Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bmADCqcmlTljvi3P17MrJrPZo0FsPvj93FnANV3ryXgXPv9XIVOp0hYwh3MoUrbLD
	 uPwrfdoYk8yMwg6SCxxGQYPrW8JR1OrN48Pw2vOOJ6LrDJXzLZ6JyqVdZoveV3gilY
	 pqMlMlxVr0DnAnYpm5MEwr9S9r4yzjaVIJJzN/pm6yq+iyMc5JnePZbEE0oPDdgNBK
	 2KYaRwUe2rnRAasxp6uDW0F5YF6OqMgJymUZ/63HTKzAp/IZvuheJXqcQgPrAw5rbn
	 QL2SLtpR4thMxcjkUPoFiyJL2omK9SCN2MKmAyu6LbNRHI3bc/gwz9yKUYF/EZdfvs
	 WFj+L4XkkisFQ==
Date: Tue, 2 Jun 2026 13:47:03 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, corbet@lwn.net, skhan@linuxfoundation.org,
	punit.agrawal@oss.qualcomm.com, jic23@kernel.org,
	osama.abdelkader@gmail.com, chenl311@chinatelecom.cn,
	fengchengwen@huawei.com, suzuki.poulose@arm.com, maz@kernel.org,
	lpieralisi@kernel.org, timothy.hayes@arm.com,
	sascha.bischoff@arm.com, arnd@arndb.de, mrigendra.chaubey@gmail.com,
	pierre.gondois@arm.com, dietmar.eggemann@arm.com,
	yangyicong@hisilicon.com, sudeep.holla@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <ah7Qx6UmfJzlph6F@willie-the-truck>
References: <20260520022023.126670-1-ruanjinjie@huawei.com>
 <ah65zXlOH6a9geD9@willie-the-truck>
 <37bc3f0c-adeb-41b8-9b26-fabe43f47e6a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37bc3f0c-adeb-41b8-9b26-fabe43f47e6a@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_054712_046517_CF01EA7D 
X-CRM114-Status: GOOD (  18.51  )
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

On Tue, Jun 02, 2026 at 08:14:26PM +0800, Jinjie Ruan wrote:
> On 6/2/2026 7:09 PM, Will Deacon wrote:
> > Please can you check the Sashiko review comment?
> > 
> > https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com
> 
> On arm64, arch_unregister_cpu() enforces a safety block against physical
> CPU hot-removal by aborting early if cpu_present() is true but the
> device is no longer physically present, thereby skipping
> unregister_cpu() and leaking the sysfs device node.
> If acpi_unmap_cpu() blindly clears the present bit while the sysfs
> device remains registered, a subsequent hot-add attempt will see the
> valid leaked device pointer, skip acpi_processor_hotadd_init() (and thus
> skip acpi_map_cpu()), leaving the hot-added CPU permanently absent and
> deadlocked.
> 
> Hi, Will,
> 
> what do you think about fix it like this?
> 
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -455,7 +455,6 @@ EXPORT_SYMBOL(acpi_map_cpu);
> 
>  int acpi_unmap_cpu(int cpu)
>  {
> -       set_cpu_present(cpu, false);
>         return 0;
>  }
>  EXPORT_SYMBOL(acpi_unmap_cpu);
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 5932e5b30b71..507c6d761434 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -554,6 +554,7 @@ void arch_unregister_cpu(int cpu)
>         }
> 
>         unregister_cpu(c);
> +       set_cpu_present(cpu, false);
>  }
>  #endif /* CONFIG_ACPI_HOTPLUG_CPU */

Hmm, not sure. Doesn't that break error handling cleanup paths that
expect acpi_unmap_cpu() to undo acpi_map_cpu()? See
acpi_processor_hotadd_init(), for example.

Will

