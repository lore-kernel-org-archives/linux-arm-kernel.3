Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD947C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 11:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wni3Q+wShyY65f0uKlTNx2h4S9tj48PjL0JpbjcW/Q=; b=UxvRz/6ofhRuSbHaNAV+zAONsi
	pzohUfmLr/LkkwgjUp9QpR2s3ruu1VTEtJcTtM7F0SHRdyMYdIEBoczK9Eru8utI6GrYdNmDvy8wp
	VSaHs9lPE6mK7dycWo+oDHzgDAdtyMCndKoBFZc0NM0+AFpGP91+FOIBYigvn2DXz4VL0Sj9SxrUa
	Aqztg7yipuwercN36GIt+GUwxRI2eoBrgu4W18r3VrJXcm8706WPqZHbRi1zWxbOfThcI6RFtPVzO
	AW4txDkrsTmVLTz+uyVeJcB1wjtEpKLnz4ogVfxvGn9spUcK1nr+/Gjp7fZ64lMCJcqKN83zWrMBk
	Tq0nSr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqwP-0000000Gx4E-0C6N;
	Mon, 03 Aug 2026 11:34:45 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqwM-0000000Gx3u-25b4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 11:34:43 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cacef7d299so116555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 04:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785756881; x=1786361681; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2wni3Q+wShyY65f0uKlTNx2h4S9tj48PjL0JpbjcW/Q=;
        b=YVVv4N1kLqVrTdb8i7XarNx1A66+Y7GLEsrezeMcCGe7rEnEIZJcq/4TsvBxaorn+5
         yLkL2d2J/D86ApVbf9B6D7wUZbcpHdDIgWy4rQBTn4mzbO7fKHzPUlSRNAS8EwiC7DmQ
         vSNtJHyHUQQYPbuA/F5oOcSYTPfaq5ZLEUjahQAY2if2I4MEeYLaEXjcwtYQGc9yX2JN
         1BTcDn3sADOQji5XxyEiSHNoRtMeAvXaWl3koh3bY3PyAfGA3Dy9i+6lhOKbf2j3BEdf
         dPtCW6XBTKdNkKrme6EI1UBLJI6ZI+d7QEjwnyuRnXYHvIbBrp66SSBWQ4htTQtNScJk
         hSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756881; x=1786361681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wni3Q+wShyY65f0uKlTNx2h4S9tj48PjL0JpbjcW/Q=;
        b=HrCWJi2DrdWK/39L2freJerIKNe6vGsOMejyTMXMqMCvDy2e9Jjq68kQblLc54LK6N
         xf5qLpzyQMybfZRh5IlOaK/dRuBrrUOiKFcB3OF8qykF9FofEe9sWWZnZx94/yMFTHtm
         BlAoudDBmS3vKGFpq+4KuiyTYJ+TivQ2GwRPKgHBOZfYifbfojVV1pb0uBTpvWWWeFpJ
         cXNtR3EkpGgd3S6BsoqCudqc5w3nnso/rCiY21u2wF7AMJndKOsRXe1Cjq3kD4H7V9a7
         SmTjq/pA8xHOLc33KCwoAqck0k4cI2M/bl37yEirAd7LwV++WbFijWU5l2qzmtPZIoPz
         i4JQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpas/aSmJs7dgqsPN5RB1zet2MSMBl//Z2VJq1wcNnkBWwEVYHR7SFcRoyaO6e/sxBoybazwdjXG4DtTbIFVVEP@lists.infradead.org
X-Gm-Message-State: AOJu0YzvGxsHGorPXz4okoXjPehq9NYyAuI2rzQp2a9wsn3Kmj1KlZ4Z
	w3lbYKHS6dRZ0uoSTa2w1VJ2HNUKNiIOKvCmTiMfidorrko1miRbaCFZPtSZPfc3YA==
X-Gm-Gg: AR+sD13wz+3AmDA2dGcUsLLz3YFl0N3zaEJH5eArGpXsm/EodNVMCrt8gor7BYqZ3AE
	iZRJ/XafdohdPv+pq1AvfZB0ADrKT24b4P39q36A1T7c3JHmQ+KJnOTe2H63Uo01IQyKblYJy+K
	gKMzTW6hI8Pr4RGYuSMJ5voUWEtDimhyXnjEuwcJBr20sgvq7xf1VJjce4MBHZdyD0NLhjvxhWF
	YBDJllIAgBkQkI6VidiMPZZrMvZCpDU+JL1YCotxCsphfUJr0xuyodDlIfVvhrGOUHRlnpcXkUG
	Ny5CphcofKboLOtNCjfOkNM14TxOOKlsCUO8laN5SMFP2JZ01J6/Wejh2QZ7KIZLYJ/4bBPup/4
	xIf+bT1lN/k/TWVFOwWURoOoAylo7Ndf+d+kD+uE4NNJV60tnPj7qIpL6bbHQSSYKlJyWbN/BAo
	VY52Y3rUZNP850Nqo1KE27AWI1DebXmOd580uxt78BYMzQCLZtihZh0BVA1xuKztTUYspS2dNS3
	NMG3gsFK60VOXT+4tW79YI=
X-Received: by 2002:a17:903:1aec:b0:2ca:cbe5:c3af with SMTP id d9443c01a7336-2d056f884a0mr11365075ad.7.1785756880556;
        Mon, 03 Aug 2026 04:34:40 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae67d0esm36522585ad.30.2026.08.03.04.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:34:40 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:34:33 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Subject: Re: [PATCH v3] iommu/arm-smmu: Use pm_runtime in fault handlers
Message-ID: <anB8ydWLQw0KZxqT@google.com>
References: <20260630-smmu-rpm-v3-1-f69874a580fa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-smmu-rpm-v3-1-f69874a580fa@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_043442_541792_89FFECA7 
X-CRM114-Status: GOOD (  27.95  )
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

On Tue, Jun 30, 2026 at 02:32:46PM +0530, Prakash Gupta wrote:

Hi Prakash, 

On a second thought, I'd like to discuss one more thing

> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
> sits in a power domain, all register accesses must be done while the
> device is runtime active to avoid unclocked register reads and
> potential NoC errors.
> 
> So far, this has not been an issue for most SMMU clients because
> stall-on-fault is enabled by default. While a translation fault is
> being handled, the SMMU stalls further translations for that context
> bank, so the fault handler would not race with a powered-down SMMU.
> 
> Adreno SMMU now disables stall-on-fault in the presence of fault
> storms to avoid saturating SMMU resources and hanging the GMU. With
> stall-on-fault disabled, the SMMU can generate faults while its power
> domain may no longer be enabled, which makes unclocked accesses to
> fault-status registers in the SMMU fault handlers possible.
> 
> Guard the context and global fault handlers with
> arm_smmu_rpm_get_if_active() and arm_smmu_rpm_put() so that all SMMU
> fault register accesses are done with the SMMU powered. If the SMMU is
> not runtime active, the fault can be safely ignored as
> arm_smmu_device_reset() clears fault registers on resume.
> 
> Additionally, disable fault reporting in arm_smmu_runtime_suspend()
> before powering down. pm_runtime_get_if_active() returns 0 during
> RPM_SUSPENDING, so without this, level-triggered fault interrupts would
> cause an interrupt storm while the device is being suspended.
> arm_smmu_device_reset() re-enables fault reporting on resume.
> 
> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> @@ -2306,6 +2329,25 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)

[...]

I believe, there is a small race condition in the suspend path that can
lead to unclocked register access crashes. (Something similar to what
I've attempted to handle in arm-smmu-v3 [1])

In arm_smmu_runtime_suspend(), we disable interrupt reporting in sCR0 and
SCTLR, and then immediately call clk_bulk_disable(). This disables the
interrupt generation but what about the interrupt handlers running
*during* suspend? I believe we could have this race:

CPU 0 (Suspend Context)                    CPU 1 (Interrupt/ISR Context)
-----------------------                    -----------------------------
                                        1. arm_smmu_context_fault() starts.
                                        2. rpm_get_if_active() returns 1.
                                           (Clocks are ON)
3. arm_smmu_runtime_suspend()
   - Clears CFIE/GFIE in registers
     (stops new IRQs from firing)
4. clk_bulk_disable()
   (Clocks are CUT)
                                        5. Attempts MMIO access (e.g, to
                                           clear CB_FSR or CB_RESUME).
                                           --> [CRASH] Unclocked MMIO access

I believe similar to arm-smmu-v3 [1], we must call synchronize_irq()
on context interrupts after disabling them in the SCTLR but before
we cut the clocks. This forces CPU 0's suspend thread to sleep and wait
for any active ISRs to safely drain while the SMMU still has clocks.

We can simply add this loop to arm_smmu_runtime_suspend():

>  static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>  {
>  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> +	int i;
> +	u32 reg;
> +
> +	/*
> +	 * Disable fault reporting before powering down to prevent unclocked
> +	 * register accesses in the fault handlers if an interrupt races with
> +	 * the suspend callback (e.g. device in RPM_SUSPENDING state).
> +	 * arm_smmu_device_reset() re-enables fault reporting on resume.
> +	 */
> +	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sCR0);
> +	reg &= ~(ARM_SMMU_sCR0_GFRE | ARM_SMMU_sCR0_GFIE |
> +		 ARM_SMMU_sCR0_GCFGFRE | ARM_SMMU_sCR0_GCFGFIE);
> +	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sCR0, reg);
> +
> +	for (i = 0; i < smmu->num_context_banks; i++) {
> +		reg = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_SCTLR);
> +		reg &= ~(ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE);
> +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_SCTLR, reg);
> +	}

    for (i = 0; i < smmu->num_context_irqs; i++)
        synchronize_irq(smmu->irqs[i]);

>  
>  	clk_bulk_disable(smmu->num_clks, smmu->clks);
>  

Since we're disabling those interrupts and fixing concurrency, 
this seems like the perfect opportunity to add the sync_irq too..

What do you think?

With that loop added:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

[1] https://lore.kernel.org/all/20260728210928.1050849-10-praan@google.com/


