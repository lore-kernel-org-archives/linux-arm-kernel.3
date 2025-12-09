Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BBAD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 11:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kzNtR2Ff6I+qBMI0/qc18G4oGHltcgqC+b0+KGxgNY=; b=pGB0GcBBPwnXGRvHtvu365TQdV
	s0ABH+hZPDq3Po4XxaP0YTecKht8nJzo1ADgzV8KztlqIYSO+e8Z3RexiF0oF4Umt46VAE+atNf0J
	2HshFNzQwDcGcZA/MxAHic7CD3GpXbXXosc8tHqF9M8tPh+isERCIVGkSS+gXVMtTsQzDpcBpYOZf
	hS+RasVLf7aqgvmGQQx1l/lM6RMjMgHo+RaJpRp2X0KmCNv+WP2Zk0hl3pMe6EICoezysEhGP9zDz
	ftcwptTYLFH3mGdzqW95cq5slcEifWdH1uAutc8V0l63tl1qO5lITrHh4IqNXqA+SHz4DH4xFM6QN
	Y5vsEASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSw4M-0000000ECIX-3zeW;
	Tue, 09 Dec 2025 11:39:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSw4K-0000000ECI6-1kPl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 11:39:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBAEB1691;
	Tue,  9 Dec 2025 03:39:38 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A37723F762;
	Tue,  9 Dec 2025 03:39:43 -0800 (PST)
Date: Tue, 9 Dec 2025 11:39:40 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>, <ardb@kernel.org>,
	<chao.gao@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 0/5] Arm LFA: Improvements and interrupt support
Message-ID: <20251209-miniature-curassow-of-energy-b6a303@sudeepholla>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251208221319.1524888-1-vvidwans@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_033948_498423_2D84FC00 
X-CRM114-Status: GOOD (  20.27  )
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

On Mon, Dec 08, 2025 at 10:13:10PM +0000, Vedashree Vidwans wrote:
> Hello,
> 
> The patches update the proposed Arm Live Firmware Activation (LFA)
> kernel driver [1] to incorporate review feedback [2] and refine the
> activation flow while remaining aligned with the LFA specification
> DEN0147 [3] and the SMCCC 1.2 calling convention. The series keeps
> the existing functionality but restructures and extends it to improve
> robustness, reviewability, and future extensibility.​
> 
> The SMCCC usage in the driver is updated to consistently use the
> SMCCC 1.2 register-based calling convention, consolidating arguments
> and results into a single struct to reduce stack usage and simplify
> the SMC interface. The patches also split the original changes into
> focused pieces and document the device node bindings in the commit
> messages, making it easier to follow and validate the implementation
> against the specification.​
> 
> The kernel driver is registered as a platform driver in accordence to
> the LFA device defined by the specification [3]. The driver now extends
> interface for interrupt-based enablement of LFA. During LFA, the
> interrupt
> thread refreshes firmware component details after each activation step
> and iterates over all activable components until no further activation
> is pending, matching the spec’s allowance for component detail changes
> after activation. This ensures that sysfs exposure of LFA components
> remains consistent with the authoritative information provided by the
> secure firmware.​
> 
> The handling of CPU rendezvous is adjusted so that the kernel now
> honors the rendezvous policy chosen by the firmware, instead of
> unconditionally forcing a rendezvous. This reflects experience with
> existing firmware deployments where mandatory rendezvous is not
> required, while still allowing the firmware to request it when
> needed.​
> 
> Thank you,
> Veda
> 
> [1] https://lore.kernel.org/lkml/20250926123145.268728-1-salman.nabi@arm.com/
> [2] https://lkml.org/lkml/2025/10/8/980
> [3] https://developer.arm.com/documentation/den0147/latest/
> 
> Vedashree Vidwans (5):
>   firmware: smccc: LFA: use smcc 1.2
>   firmware: smccc: LFA: refactor
>   firmware: smccc: add timeout, touch wdt
>   firmware: smccc: register as platform driver
>   firmware: smccc: lfa: refresh fw details
> 
>  drivers/firmware/smccc/Kconfig  |   3 +-
>  drivers/firmware/smccc/lfa_fw.c | 478 +++++++++++++++++++++++++-------

Same comment as before[1], looks like the feedback got ignored or missed.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20251009-calculating-glorious-oriole-ceccf6@sudeepholla

