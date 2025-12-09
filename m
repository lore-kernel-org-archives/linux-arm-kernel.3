Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81930D3B9A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 22:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1hUywAhak/Ve5FzDDiUVRt4+lKOsUDcoxRvzzlRcsA=; b=bQ7sPPPrs0Kf7K6OBDH3r2q5Oj
	GlLYtgQ/opmKP1IClj1RpCndmwZ75dE6PnprTHCcPLq+O9o0IDUpUPpwR18PyXS4Pfol5MbWKEIuK
	07fewE4Pp64Arz55egZicJqMoSPI687rh9gxq855wHAflGfCWP4fp/1vL1cwWgp268Sn5ll0qJbzF
	0YkRGi4FbOg3/tTSAAEF8vFDPTinpdOYxvpq2mLe1r5ayonPGxTeLSzOFQx/ZnNtMlwsqkQOrvZen
	vgJ2c4CqJMG9xlG1u2WQjhbvpU2uaEowp6zGwIlJWePHYPiIXW/3O4A1RcVCQUuXmwFZRl/Eg7opI
	1DYplA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6T3-0000000EsSL-1aPh;
	Tue, 09 Dec 2025 22:46:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6T1-0000000EsRy-1OS9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 22:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF9BD44120;
	Tue,  9 Dec 2025 22:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE76C4CEF5;
	Tue,  9 Dec 2025 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765320358;
	bh=iHHcKj6J+hLbVPepNR0eVCr57chERxeAokcMcG6B2iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZuTSPZNDN+0w+NDKNfvTF3iYbREiPDKKWuY6awdIf/3WojH3IKSQhYqT4IC8BHzx0
	 Y2+khZrBnXpw+v7qoCHmJg/vcGwkgol6jFF/GUmqTsir6XJ74sCfHx957taQd7HBi7
	 o6GKm0aGPNMOloQaQo1ERi+QvkEngEBFNYf4qfhKTuIFTsqnw+yj2ykHaN5dXgxNYm
	 gmeqZdx4GBBlzNjdGFe58TT+mGvzKPYalbu38R+EYnWp/Um5GYGOqk0uOI2sstY0qH
	 zBK44d+p2faai+9JS550B/UjAAxNkZ67Yd10z3SbotFhtt8/Ln3TLLtne00gRjuioJ
	 1w4mA/R4bRs6w==
Date: Tue, 9 Dec 2025 14:45:57 -0800
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 20/24] perf: arm_pmuv3: Handle IRQs for Partitioned
 PMU guest counters
Message-ID: <aTimpRFfr9wI9Hw5@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-21-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-21-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_144559_412564_D46D1DE8 
X-CRM114-Status: GOOD (  12.39  )
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

On Tue, Dec 09, 2025 at 08:51:17PM +0000, Colton Lewis wrote:
> Because ARM hardware is not yet capable of direct interrupt injection

PPI injection, it can do LPIs just fine.

> @@ -961,6 +964,12 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
>  		 */
>  		perf_event_overflow(event, &data, regs);
>  	}
> +
> +	govf = pmovsr & kvm_pmu_guest_counter_mask(cpu_pmu);
> +
> +	if (kvm_pmu_is_partitioned(cpu_pmu) && govf)
> +		kvm_pmu_handle_guest_irq(govf);
> +

The state ownership of this whole interaction is very odd. I would much
rather that KVM have full ownership of the range of counters while the
guest is loaded. By that I mean the PMUv3 driver only clears overflows
on PMCs that it owns and KVM will do the same on the back of the IRQ.

Similarly, KVM should be leaving the "guest" range of counters in a
non-overflow condition at vcpu_put().

Thanks,
Oliver

