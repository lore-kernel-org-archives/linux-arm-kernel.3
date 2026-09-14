Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C8AC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DH89L2lGg0PAoWlWKSm5EbgAp+EKeh2hDRosmekpaxM=; b=03sMl6qBlAtTGeb9wsAjlT40sh
	4GPAh80jN7zl1PNJVn4vAK+mZCkkMerNlb0ggeK0DKNIOw++Mo8VolNG/dWjIrd9v/TB2DyrBDsVz
	dG171xox2jumD3YSEQd7HZ+bU7IO1pFqxvM9GR3/yp2efXC2sFKRi2arnDDeEIpjqcSEUXWs3jQCt
	B/vGQa/9W2PwcEVpZw6dISksNzPCqw7Lc4CDjDXKONIwG2uRYsAZBWi3K5yqhAY/zXZMtnQCp21rW
	8UIj4MnuvXEaTK1vAzJKWtxA9PK81nHiz8PrJq72PB/V/uDLJ4Jp2qjyRVjJTVn15GHBSe1V0S6z/
	YDNxzSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60kN-00000002WWn-2f1R;
	Mon, 14 Sep 2026 07:04:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60kL-00000002WW1-0fEz;
	Mon, 14 Sep 2026 07:04:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD68A1570;
	Mon, 14 Sep 2026 00:04:48 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 911B73F59E;
	Mon, 14 Sep 2026 00:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789369492; bh=pNtlqXsBGCXtcZenUVL4HnAZIU2omYNdHVskCp9kiQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjzekkFU7LYMsWmvbH6omfz9eiehQlIy1DvkIwSKBzOu4bgxWOpLpY1XNyvADEjc/
	 RIYrNIPjgGfO/oXQusxaDuL0uJ5dWRQDa8FiYsXRiU64kEK5zQqVdxhrIlMp79EAay
	 u6GeTXpPrBV01pmQNMaH2U6JcIVCltzsfFxz7cxE=
Date: Mon, 14 Sep 2026 09:04:39 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, jonathan.cameron@oss.qualcomm.com,
	sibi.sankar@oss.qualcomm.com
Subject: Re: [PATCH v3 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
Message-ID: <aqech7ctaPnW_U34@arm.com>
References: <20260910063440.4677-1-okerixx@gmail.com>
 <20260910063440.4677-2-okerixx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910063440.4677-2-okerixx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_000457_237083_BBB05AC7 
X-CRM114-Status: GOOD (  18.30  )
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

Ack.

Thanks for the patch.

---
BR
Beata
On Thu, Sep 10, 2026 at 08:34:39AM +0200, Oleg Keri wrote:
> arch_freq_get_on_cpu() computes the product of the frequency scale and
> the reference frequency as a u64, but assigns it to an unsigned int
> before shifting it back down:
> 
> 	freq = scale * arch_scale_freq_ref(cpu);
> 	freq >>= SCHED_CAPACITY_SHIFT;
> 
> The product is truncated to 32 bits before the shift, so the result
> wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
> i.e. 4194304 kHz.
> 
> On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
> kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
> the CPU demonstrably runs at the boost frequency: a fixed workload
> completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
> kHz, matching the 1.171 frequency ratio.
> 
> Keep the arithmetic in 64 bits until after the shift.
> 
> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  arch/arm64/kernel/topology.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..0eca321ff113 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
>  	 * (see amu_scale_freq_tick for details)
>  	 */
>  	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
>  	return freq;
>  }
>  
> -- 
> 2.55.0
> 

