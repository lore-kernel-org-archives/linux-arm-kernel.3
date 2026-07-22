Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451A9C531C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMHKsyTTV54YaggDLKYansrAm9fblh+BWvUqqs6uFJI=; b=tdiER26OIIcyVa4s3Gy1eB8Lac
	NWbTrbyrvEZ9Ke0IUv+yGtnFNWWXDQ7jXXv/Wkicn1V9k7oDZQoW0n5au47IsraksmSlAOO8FPwGB
	h/Y66r23SiEKyVRhbNgpAjrr8R/8XSQlJWqLEeOXFV3X5urpInFk/k/Eky320ZHFlAMV3zpW4IcrN
	46hVtJ4HFjqNo1aQhdbXtVHKjm0O5Q7+0Wf/8Ms/nlPBur+OLtXTLNBEoJmakjEvHBBBc8yYg4nwc
	WUDNGeNb77+7sgaZs8XdjwkYDJVUDgCizePEJ2hprEicTDC2J3hobnXoFlThL0vLuSD7wLIjSlI0r
	Id5utVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXDJ-0000000Bviw-3qkJ;
	Wed, 22 Jul 2026 13:42:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXDI-0000000Bviq-205z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:42:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E990600AF;
	Wed, 22 Jul 2026 13:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503D91F000E9;
	Wed, 22 Jul 2026 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727738;
	bh=JMHKsyTTV54YaggDLKYansrAm9fblh+BWvUqqs6uFJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oeA79y9c5nblQlZb86Eqzdj2h8QEgU0FqieDsL25cHiPuc3M1zNrnIAkvdEeRmLoF
	 W50bilalJu8M4qI6S+Lpw3azQnBiKA9SsU8zwQ1uPxyLiEOBZkKHxfS8Ll2PuxJCDB
	 T9EqlILZDHfsGIfVTpA3kA7FKgNW8Zwx6Mo0y70kromJW8AzahwijN8vDKVIhGk1MZ
	 ok2TK9Ar96tFNNroi0MCS1riV+HKPV72PMbCT9xZSffPtGAwcC14ishCXfVXYfe8CP
	 Qpy0MMFjM7cKSFBYFFkh8amOopxw+jYC2ZAytvcnjWv/ahtpvLiAHnyROSZu/PJCKB
	 dwq6Xp1F7rqSQ==
Date: Wed, 22 Jul 2026 14:42:15 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clocksource/drivers/arm_arch_timer: Mark EL2 virtual
 timer broken for Tegra194/234
Message-ID: <20260722-cordial-zippy-oxpecker-dcdabb@sudeepholla>
References: <20260722125651.148595-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722125651.148595-1-jonathanh@nvidia.com>
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

On Wed, Jul 22, 2026 at 01:56:51PM +0100, Jon Hunter wrote:
> The following warning is being observed on Tegra194 and Tegra234
> platforms ...
> 
>  arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 virtual timer
>   interrupt
> 
> Adding the missing EL2 virtual timer in device-tree for Tegra194 and
> Tegra234 is causing boot issues for both devices.
> 
> The Tegra194 device includes a GIC-400 which defines PPIs for sec-phys,
> phys, virt and hyp-phys timer interrupts (per the dt-binding
> arm,arch_timer.yaml) but there is no PPI hyp-virt (EL2 virtual) timer
> and hence this is not supported for this device.
> 
> The Tegra234 device does have a PPI for the EL2 virtual timer, but
> during CPU idle transitions into low-power states this timer is not
> preserved currently by firmware and hence causes boot issues when CPU
> idle is enabled.
> 
> Avoid the warning for Tegra194 and Tegra234 devices by marking the EL2
> virtual timer as broken.
> 

You may need to build on top of [1]

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20260710080958.491620-1-maz@kernel.org/

