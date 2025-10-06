Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FA8CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 15:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aOB4giK8S9/GgGaMQO7UOgMkKfohJi6XYc1YzeqFJo=; b=CkcgpewTKG89HSNHr0gIjxRurg
	pwkZ2BQyEkm1T+wKeeGvE+00vQ0sz0vLWNFDcfP0xaAL39Md6M2SlOB5CNXfdbiQ91M0I9++Ny9cU
	bq3IQtOZsNa8HZ26h7T/cO4ps6SN0F61u+DUfrmtzcFRayjnmkE8orChyyKEKrwb7yKF78eylSOGQ
	0J81U6euZu4XE7bLwaC+88ltS1Dhs2i08dYxMM9XAeIH/KI1zscpuXEsQeW/1gt1b06jlw5PgQZ6U
	x3ZieaxtdqAIjdXI95TO0NcJmXODWdlJ0W5VMcBMMEPI3rIsGKzxIUj/Hj6w0BFZSoETFXd5+wNk1
	er+QNidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nG5-00000000I5p-1Tll;
	Mon, 06 Oct 2025 15:36:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nG0-00000000I51-48si
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 15:36:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D35B1515;
	Mon,  6 Oct 2025 08:36:03 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC6803F66E;
	Mon,  6 Oct 2025 08:36:08 -0700 (PDT)
Date: Mon, 6 Oct 2025 16:36:06 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] pmdomain: Improve idlestate selection for CPUs
Message-ID: <20251006-barnacle-of-pragmatic-faith-e6ca0d@sudeepholla>
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251003150251.520624-1-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_083613_061710_C58BB7EA 
X-CRM114-Status: GOOD (  13.40  )
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

On Fri, Oct 03, 2025 at 05:02:42PM +0200, Ulf Hansson wrote:
> Platforms using the genpd governor for CPUs are relying on it to find the most
> optimal idlestate for a group of CPUs. Although, observations tells us that
> there are some significant improvement that can be made around this.
> 
> These improvement are based upon allowing us to take pending IPIs into account
> for the group of CPUs that the genpd governor is in control of. If there is
> pending IPI for any of these CPUs, we should not request an idlestate that
> affects the group, but rather pick a shallower state that affects only the CPU.
>

Thinking about this further, I’m not sure this issue is really specific to
pmdomain. In my view, the proposed solution could apply equally well to
platforms that don’t use pmdomain for cpuidle. Also, I don’t see why the
solution needs to be architecture-specific.

Thoughts ?

I understand it won’t handle all IPI cases, but generic helpers like
local_softirq_pending() and irq_work_needs_cpu()
should already cover some of them in a platform-independent way.

-- 
Regards,
Sudeep

