Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606FFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFId8EejOOw37Y/k9DKS5zzV5VW90VDo21kt40RTEyA=; b=V6MDFdiFrZgYcWFaw7erCfZC1+
	/PC6AUChvB3iFGg/KY/1TMVhqJCnatEYDmo53t4hn4TJmzTeX6pKXYjeVo1U3QtGv0jXL9f+qPxZZ
	EjHW1D3Bg0Xh4jhpYgRVnCT/B0o2a5zf9dBhk7kcItaBJFsN968OEkELPwtEcE66KplHwYJQpcu29
	Xp38yFsoXbZaLzo2FAt2ASx7p1qTwDfjG9AyabAznujixn9ewP4FyDf0tmmfFTClqxUbZFEImQq3H
	fTuDLF3ILCZwfbA31yFAxlMgFhDoO4WwHxK/AyAgOxBwgdA7UmYVkz+wKByx7Sy09m75BIOvDrnXR
	EpQixPDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvr0-0000000CgPu-1j0h;
	Thu, 10 Jul 2025 18:18:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtiy-0000000CLK8-1xRP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:02:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62A281EA6;
	Thu, 10 Jul 2025 09:02:04 -0700 (PDT)
Received: from bogus (unknown [10.57.50.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF7503F738;
	Thu, 10 Jul 2025 09:02:12 -0700 (PDT)
Date: Thu, 10 Jul 2025 17:02:03 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	William Mcvicker <willmcvicker@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v5] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Message-ID: <20250710-translucent-mastiff-of-performance-b5f1ba@sudeepholla>
References: <20250709-gs101-cpuidle-v5-1-b34d3210286d@linaro.org>
 <20250709-chocolate-flamingo-of-nirvana-5de895@sudeepholla>
 <CADrjBPqYSVO20a0ox9un0fq7dBss9sMGK1Q3ivCjCGaFyqhZFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPqYSVO20a0ox9un0fq7dBss9sMGK1Q3ivCjCGaFyqhZFA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090216_591095_DCB3A8CD 
X-CRM114-Status: GOOD (  35.99  )
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

On Wed, Jul 09, 2025 at 10:36:59PM +0100, Peter Griffin wrote:
> Hi Sudeep,
> 
> Thanks for your review feedback!
> 
> On Wed, 9 Jul 2025 at 17:10, Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Wed, Jul 09, 2025 at 02:26:27PM +0100, Peter Griffin wrote:
> > > Register cpu pm notifiers for gs101 which call the
> > > gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> > > C2 hint. This hint is required to actually enter the C2 idle state.
> > >
> > > A couple of corner cases are handled, namely when the system is rebooting
> > > or suspending we ignore the request. Additionally the request is ignored if
> > > the CPU is in CPU hot plug. Some common code is refactored so that it can
> > > be called from both the CPU hot plug callbacks and CPU PM notifier taking
> > > into account that CPU PM notifiers are called with IRQs disabled whereas
> > > CPU hotplug callbacks are not.
> > >
> > > Additionally due to CPU PM notifiers using raw_spinlock the locking is
> > > updated to use raw_spinlock variants, this includes updating the pmu_regs
> > > regmap to use .use_raw_spinlock = true and additionally creating and
> > > registering a custom  pmu-intr-gen regmap instead of using the regmap
> > > provided by syscon.
> > >
> > > Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
> > > property to the CPU nodes. This informs the time framework to switch to a
> > > broadcast timer as the local timer will be shutdown. Without that DT
> > > property specified the system hangs in early boot with this patch applied.
> > >
> >
> > Assuming this is arm64 platform and using PSCI for all the power management,
> > can you please briefly explain why all these dance is absolutely necessary
> > when PSCI calls can be the clue for the EL3 firmware. I am basing my question
> > on this information in the file:
> 
> Yes, you're correct it is an arm64 platform using PSCI. Unfortunately
> I don't have access to the el3mon firmware code to speak super
> authoritatively about it, but you're correct that it is essentially
> working around a firmware limitation.
> 
> What I initially observed whilst working on suspend to RAM, when
> hotplugging CPU's with just the PSCI calls the system hangs. Debugging
> this and tracing versus the downstream production drivers the missing
> piece was programming the "ACPM hint" to the CPU_INFORM registers.
> Further debugging and power measurements also showed that the ACPM
> hint is also required in addition to PSCI calls for the cpuidle states
> to function correctly.
> 

It is definitely worth adding all the above info and shaming the firmware
for not taking care of this. I still don't like this as PSCI is there
for nearly a decade now and still we see such limitations that needs to
be fixed in the firmware and now workaround in the kernel.

> > /*
> >  * CPU_INFORM register hint values which are used by
> >  * EL3 firmware (el3mon).
> >  */
> >
> > This clearly sounds like workaround for the firmware limitations. That
> > needs to be clearly documented IMO.
> 
> Sure I can add a more verbose comment, that this is required to work
> around firmware limitations in the PSCI implementation.
> 

Thanks that's what we need to fully understand the need of otherwise
useless dance around hotplug and idle state machinery in the kernel.

-- 
Regards,
Sudeep

