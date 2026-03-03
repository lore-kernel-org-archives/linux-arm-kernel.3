Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EDFEC1423
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=293mqPUzRV7yQa/ROx5wJ+LEAaa1zCWoqVzWNMPfpZI=; b=sDQKvXoKasNep+Z9GwIJa2x/51
	7avq1Z51HYIWHGiTHuDul2APoejc4s39ZLYTWlvVqX7deqFlNEM+7Deot2CrOOPSdbp9ov3jakKqn
	CX5FL49tdGDOxIJhb1HmieG2x88N0V4vd2mqV26df3ohjJgWHf2iwimlUa6B1ZPsuD/Ao6XN2Lu4z
	EVCJkKsR+BnHc47AuKsekAOBANqyh8KDvyz955ZiHkME/+sgUSUxkmMmHGL6aebizx28/Gcrz9Pjx
	c7k0f9o5/Ddxe5hDntQO2MMMXPiOSXMlTx77EAyCF4q01DM0yBSTVCO9nOIxPZZ1aXAw0bl+Grdti
	5Sv/mpBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxN7I-0000000EymA-37cB;
	Tue, 03 Mar 2026 10:36:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxN7G-0000000Eyko-0ven
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 10:36:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E3A8497;
	Tue,  3 Mar 2026 02:36:29 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 133DA3F7BD;
	Tue,  3 Mar 2026 02:36:34 -0800 (PST)
Date: Tue, 3 Mar 2026 10:36:32 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: yabinc@google.com, James Clark <james.clark@linaro.org>,
	Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <20260303103632.GH1098637@e132581.arm.com>
References: <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
 <aZNec3B0Iou9PYGw@willie-the-truck>
 <20260217141917.GA136967@e132581.arm.com>
 <aZSAsC1YI5_lK3e0@willie-the-truck>
 <20260217190121.GB136967@e132581.arm.com>
 <aZcWC25GE2iUKsNt@willie-the-truck>
 <20260219185800.GD136967@e132581.arm.com>
 <20260225120956.GD4184494@e132581.arm.com>
 <aaHdcKGE94ze2fq9@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaHdcKGE94ze2fq9@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_023638_299367_32CBA86C 
X-CRM114-Status: GOOD (  29.99  )
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

On Fri, Feb 27, 2026 at 06:07:44PM +0000, Will Deacon wrote:
> On Wed, Feb 25, 2026 at 12:09:56PM +0000, Leo Yan wrote:
> > [ + Yabin ]
> > 
> > Thanks for Suzuki's reminding, I should mention that Yabin reported
> > another lockup issue caused by missing CPU PM support in TRBE driver.
> > 
> > We have a patch series to fix the issue:
> > https://lore.kernel.org/linux-arm-kernel/20251119-arm_coresight_path_power_management_improvement-v5-16-f615a301ad0b@arm.com/
> 
> Two nits on that series:
> 
> 1. It seems a bit weird to me for the ETE driver to manage TRFCR but for
>    the TRBE driver to manage the other registers

TRFCR_ELx is introduced by FEAT_TRF, which is a separate feature from
TRBE, and it can be used for other sinks (like ETR).  I think this is
the main reason that it is implemented in ETE driver rather than TRBE
driver.

> 2. Are you sure you don't need to save/restore the TRBE state when
>    LIMITR.E is clear? Maybe the driver is fine with that, but I'm worried
>    that we could suspend in a half-programmed state and lose some of that
>    configuration.

If the TRBLIMITR_EL1.E bit is cleared during the CPU is idle, then the
next time the TRBE trace buffer is re-enabled, trbe_enable_hw() must be
called to reconfigure the TRBE registers (including TRBSR_EL1).

One concern is that after a CPU power cycle, some fields in the TRBE
registers may be in the following state:

  "On a cold reset, this field resets to an architecturally UNKNOWN value."

I will change to always save/restore TRBE state.  Thanks for
suggestions.

> > Besides your fix the translation regime issue, I'd also suggest applying
> > the CoreSight PM patch series to fix lockup caused by CPU idle.
> 
> Yes, we definitely need something like that in the android kernel trees.
> I've previously bodged a hack into the ETE PM notifiers, but if you have
> backports of your series to 6.12, 6.6 and 6.1 then we should merge them
> into Android. As it stands, I don't have a TRBE-capable device running
> mainline.

Let us first merge the series on the master :)

After that, we can consider backporting (I assume Yabin already has a
plan for this).  I'd be happy to help with backporting to v6.12.
However, I cannot commit to backporting to v6.6 or v6.1 at this stage,
as many dependencies are likely to be involved.

Thanks,
Leo

