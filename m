Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE0310F2869
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXPDE2C2l1r+cHbW+9EplKV6cSor0yFBd9FKA9/koWA=; b=WuHwSa8vpQFk9kxBGN1itjtILv
	Z8CPdls17X25aZ/BCxQsQmFjn6y7g2cfS0mKsSjV5Kb50nG4sRerksvGZLIISthNFGNh5I0dika2t
	XBVlBsrwPY9KzjT2cqDbRJGI+pgZtarb+pRpKKyQX4cZiPP7xk71OFAySN/IbzF7hzRh6ssvCspgY
	lJR6u0LAapyoo6n0fmjMIOX6IwlAhM/uRLiYZqX6Bfk6tRjVww17D4GqJwOm2tWG9yOlpEZ7RRZm3
	LJzDE28U8SzbXn4AkgEk25+bL56bUcsjojG0yTaF0rxPdomM5jra0EhJmSPVJnFkvdXt5sUNRfg5H
	C0lFiCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cei-000000084l0-18MW;
	Fri, 27 Mar 2026 19:15:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cef-000000084ke-0IdM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:15:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 456D639E7;
	Fri, 27 Mar 2026 12:15:29 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDB5C3F99C;
	Fri, 27 Mar 2026 12:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774638935; bh=pVZsWAwTNhuQGve3K7yHl1CKc5vAbYKswR078p1evoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgQoOoE+flJivMYihP+g5wqzHDPcQMNXv8Ff/dJscTn92FOhwbJttWjuei4MqwPyg
	 Zg1OGoNfWxMgyfWOME71ME5u7znoolSFjVqXUtIeJf8TkO0X5IGOM3ibLMXZRqZmST
	 56j/bhTdh0Erpz1B1D1DA64HMBPid15RoHE0HPVw=
Date: Fri, 27 Mar 2026 19:15:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 4/5] arm64: errata: Work around early CME DVMSync
 acknowledgement
Message-ID: <acbXU2IEi4CPyoqU@arm.com>
References: <20260323162408.4163113-1-catalin.marinas@arm.com>
 <20260323162408.4163113-5-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323162408.4163113-5-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_121537_249316_3DA3E5FD 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On Mon, Mar 23, 2026 at 04:24:04PM +0000, Catalin Marinas wrote:
> +void sme_enable_dvmsync(void)
> +{
> +	if ((!cpumask_available(sme_dvmsync_cpus) &&
> +	     !zalloc_cpumask_var(&sme_dvmsync_cpus, GFP_ATOMIC)) ||
> +	    (!cpumask_available(sme_active_cpus) &&
> +	     !zalloc_cpumask_var(&sme_active_cpus, GFP_ATOMIC)))
> +		panic("Unable to allocate the cpumasks for SME DVMSync erratum");
> +
> +	cpumask_set_cpu(smp_processor_id(), sme_dvmsync_cpus);
> +}

Sashiko (correctly) highlighted a race here. This function, even if the
erratum is a local cpu feature, is still called via stop_machine() on
all active cpus when the non-boot features are initialised. It only
matters if CPUMASK_OFFSTACK is enabled. I'll add a fix, most likely a
lock around this to serialise the cpumask initialisation.

-- 
Catalin

